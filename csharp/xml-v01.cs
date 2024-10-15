// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.csharp.xml.v01 : 0.1.0

// # [ csharp ]

// # : - vstudio
using System;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using System.Xml.XPath;

namespace zrfisaac
{
    [Serializable]
    public class Person
    {
        public string Name { get; set; }
        public int Age { get; set; }
        
        [XmlArray("Hobbies")]
        [XmlArrayItem("Hobby")]
        public string[] Hobbies { get; set; }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                // Part 1: Serialize an object to XML
                Person person = new Person
                {
                    Name = "John Doe",
                    Age = 30,
                    Hobbies = new string[] { "Reading", "Cycling", "Gaming" }
                };

                string xmlFilePath = "_person.xml";
                SerializeToXml(person, xmlFilePath);
                Console.WriteLine($"Serialized object to XML:\n{File.ReadAllText(xmlFilePath)}");

                // Part 2: Deserialize the XML back to an object
                Person deserializedPerson = DeserializeFromXml(xmlFilePath);
                Console.WriteLine($"\nDeserialized Person Object:");
                Console.WriteLine($"Name: {deserializedPerson.Name}, Age: {deserializedPerson.Age}");
                Console.WriteLine($"Hobbies: {string.Join(", ", deserializedPerson.Hobbies)}");

                // Part 3: Using XPath to query XML
                QueryXmlWithXPath(xmlFilePath);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                throw;
            }
            Console.ReadKey();
        }

        static void SerializeToXml(Person person, string filePath)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(Person));
            using (StreamWriter writer = new StreamWriter(filePath))
            {
                serializer.Serialize(writer, person);
            }
        }

        static Person DeserializeFromXml(string filePath)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(Person));
            using (StreamReader reader = new StreamReader(filePath))
            {
                return (Person)serializer.Deserialize(reader);
            }
        }

        static void QueryXmlWithXPath(string filePath)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(filePath);

            // Create an XPathNavigator to query XML
            XPathNavigator navigator = xmlDoc.CreateNavigator();

            // Example: Query the name of the person
            string xpathQuery = "/Person/Name";
            var nameNode = navigator.SelectSingleNode(xpathQuery);
            if (nameNode != null)
            {
                Console.WriteLine($"\nXPath Query Result: Name: {nameNode.Value}");
            }

            // Example: Query hobbies of the person
            Console.WriteLine("Hobbies:");
            var hobbiesNode = navigator.Select("/Person/Hobbies/Hobby");
            while (hobbiesNode.MoveNext())
            {
                Console.WriteLine(hobbiesNode.Current.Value);
            }
        }
    }
}
