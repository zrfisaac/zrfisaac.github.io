// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.csharp.json.v01 : 0.1.0

// # [ csharp ]

// # : - vstudio
using System;

namespace zrfisaac
{
	internal class Person
	{
		public string Name { get; set; }
		public int Age { get; set; }
		public string[] Hobbies { get; set; }
	}

	internal class Program
	{
		static void Main(string[] args)
		{
			try
			{
				// 1. Create an object of Person
				Person person = new Person
				{
					Name = "John Doe",
					Age = 30,
					Hobbies = new string[] { "Reading", "Cycling", "Gaming" }
				};

				// 2. Serialize the object to JSON string
				string jsonString = JsonSerializer.Serialize(person);
				Console.WriteLine("Serialized JSON:\n" + jsonString); // Output the JSON string

				// 3. Write JSON to a file
				string filePath = "_person.json";
				File.WriteAllText(filePath, jsonString);
				Console.WriteLine("\nJSON written to file: " + filePath);

				// 4. Read the JSON back from the file
				string jsonStringFromFile = File.ReadAllText(filePath);
				Console.WriteLine("\nRead JSON from file:\n" + jsonStringFromFile);

				// 5. Deserialize the JSON string back to a Person object
				Person deserializedPerson = JsonSerializer.Deserialize<Person>(jsonStringFromFile);

				Console.WriteLine($"\nDeserialized Person Object:");
				Console.WriteLine($"Name: {deserializedPerson.Name}");
				Console.WriteLine($"Age: {deserializedPerson.Age}");
				Console.WriteLine($"Hobbies: {string.Join(", ", deserializedPerson.Hobbies)}");

				// 6. Convert the hobbies array back to a string
				string hobbiesString = string.Join(", ", deserializedPerson.Hobbies);
				Console.WriteLine("\nHobbies as a single string: " + hobbiesString);

				// 7. Convert the string back to an array
				string[] hobbiesArray = hobbiesString.Split(", ");
				Console.WriteLine("\nHobbies as an array:");
				foreach (var hobby in hobbiesArray)
				{
					Console.WriteLine(hobby);
				}
			} catch (Exception e)
			{
				Console.WriteLine(e.Message);	
				throw;
			}
			Console.ReadKey();
		}
	}
}
