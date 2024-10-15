-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.debug.v01 : 1.0.0

-- # [ mssql ]

-- # : Create the database
/*
CREATE DATABASE DEBUG;
GO
-- */

-- # : Use the newly created database
/*
USE DEBUG;
GO
-- */

-- # : Create Tables

-- # : Create Tables - Customers Table
-- /*
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY IDENTITY(1,1),
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE VARCHAR(15),
    CREATED_DATE DATE DEFAULT GETDATE()
);
GO
-- */

-- # : Create Tables - Products Table
-- /*
CREATE TABLE PRODUCTS (
    PRODUCT_ID INT PRIMARY KEY IDENTITY(1,1),
    PRODUCT_NAME VARCHAR(100),
    PRICE DECIMAL(10, 2),
    STOCK INT,
    CREATED_DATE DATE DEFAULT GETDATE()
);
GO
-- */

-- # : Create Tables - Orders Table
-- /*
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY IDENTITY(1,1),
    CUSTOMER_ID INT,
    ORDER_DATE DATE DEFAULT GETDATE(),
    TOTAL_AMOUNT DECIMAL(10, 2),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);
GO
-- */

-- # : Create Tables - OrderDetails Table
-- /*
CREATE TABLE ORDER_DETAILS (
    ORDER_DETAIL_ID INT PRIMARY KEY IDENTITY(1,1),
    ORDER_ID INT,
    PRODUCT_ID INT,
    QUANTITY INT,
    PRICE DECIMAL(10, 2),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);
GO
-- */

-- # : Insert Sample Data

-- # : Insert Sample Data - Insert Data into Customers Table
-- /*
INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1234567890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
    ('Alice', 'Johnson', 'alice.johnson@example.com', '1112223333'),
    ('Bob', 'Brown', 'bob.brown@example.com', '2223334444'),
    ('Charlie', 'Davis', 'charlie.davis@example.com', '3334445555'),
    ('David', 'Wilson', 'david.wilson@example.com', '4445556666'),
    ('Eva', 'Taylor', 'eva.taylor@example.com', '5556667777'),
    ('Frank', 'Moore', 'frank.moore@example.com', '6667778888'),
    ('Grace', 'Anderson', 'grace.anderson@example.com', '7778889999'),
    ('Hank', 'Thomas', 'hank.thomas@example.com', '8889990000');
GO
-- */

-- # : Insert Sample Data - Insert Data into Products Table
-- /*
INSERT INTO PRODUCTS (PRODUCT_NAME, PRICE, STOCK)
VALUES 
    ('Product A', 10.00, 100),
    ('Product B', 15.50, 150),
    ('Product C', 7.25, 200),
    ('Product D', 20.00, 50),
    ('Product E', 30.99, 75),
    ('Product F', 5.49, 300),
    ('Product G', 12.50, 60),
    ('Product H', 25.00, 80),
    ('Product I', 14.99, 90),
    ('Product J', 9.99, 110);
GO
-- */

-- # : Insert Sample Data - Insert Data into Orders Table
-- /*
INSERT INTO ORDERS (CUSTOMER_ID, TOTAL_AMOUNT)
VALUES 
    (1, 25.50),
    (2, 15.00),
    (3, 35.75),
    (4, 45.00),
    (5, 12.50),
    (6, 75.00),
    (7, 100.00),
    (8, 85.50),
    (9, 45.25),
    (10, 60.00);
GO
-- */

-- # : Insert Sample Data - Insert Data into OrderDetails Table
-- /*
INSERT INTO ORDER_DETAILS (ORDER_ID, PRODUCT_ID, QUANTITY, PRICE)
VALUES 
    (1, 1, 1, 10.00),
    (1, 2, 1, 15.50),
    (2, 3, 2, 7.25),
    (3, 4, 2, 20.00),
    (4, 5, 3, 30.99),
    (5, 6, 1, 5.49),
    (6, 7, 4, 12.50),
    (7, 8, 3, 25.00),
    (8, 9, 1, 14.99),
    (9, 10, 2, 9.99);
GO
-- */

-- # : Create a View

-- # : Create a View - Create a View to Show Orders with Customer Names
-- /*
CREATE VIEW VW_ORDERS_WITH_CUSTOMER_INFO AS
SELECT 
    O.ORDER_ID,
    C.FIRST_NAME,
    C.LAST_NAME,
    O.ORDER_DATE,
    O.TOTAL_AMOUNT
FROM 
    ORDERS O
JOIN 
    CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID;
GO
-- */
