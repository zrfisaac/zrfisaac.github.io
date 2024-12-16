#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# - email  : zrfisaac@gmail.com
# - site   : zrfisaac.github.io
# - version: zrfisaac.python.clone : 1.0.3

# [ python ]
# - : pip install mysql
# - : pip install mysql-connector-python

# Libraries
import mysql.connector

# Main
print("# [ main ]")

# Database configuration
db_config = {
    "host": "localhost",
    "user": "root",
    "password": "ABcd!@34",
    "database": "opusnet_server",
}

try:
    # Connect to the database
    db = mysql.connector.connect(**db_config)
    cursor = db.cursor()

    # Fetch all procedures
    query_procedures = """
        SELECT SPECIFIC_NAME 
        FROM INFORMATION_SCHEMA.ROUTINES 
        WHERE ROUTINE_TYPE='PROCEDURE' AND ROUTINE_SCHEMA=%s;
    """
    cursor.execute(query_procedures, (db_config["database"],))
    procedures = cursor.fetchall()

    for (procedure_name,) in procedures:
        print(f"Processing procedure: {procedure_name}")

        # Get procedure definition
        cursor.execute(f"SHOW CREATE PROCEDURE `{db_config['database']}`.`{procedure_name}`")
        result = cursor.fetchone()

        if result:
            create_statement = result[2]  # Third column contains the CREATE statement

            print(f"Original CREATE statement:\n{create_statement}\n")

            # Remove DEFINER clause
            create_statement_no_definer = create_statement.replace("DEFINER=`Adm`@`%`", "")
            print(f"Modified CREATE statement:\n{create_statement_no_definer}\n")

            # Drop the existing procedure
            cursor.execute(f"DROP PROCEDURE IF EXISTS `{procedure_name}`")
            print(f"Dropped procedure `{procedure_name}`.")

            # Recreate the procedure without DEFINER
            cursor.execute(create_statement_no_definer)
            print(f"Recreated procedure `{procedure_name}` without DEFINER.\n")

    # Commit changes
    db.commit()
    print("All procedures have been updated successfully.")

except mysql.connector.Error as e:
    print(f"Error: {e}")

finally:
    if cursor:
        cursor.close()
    if db and db.is_connected():
        db.close()

print("# [ end ]")
