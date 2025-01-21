// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.mono.date : 0.0.1

// # [ mono ]
using System;
using System.Collections.Generic;
//using Newtonsoft.Json;

class Program
{
	static void Main()
	{
		string jsonString = @"
		{
			""name"": ""John Doe"",
			""age"": 30,
			""isActive"": true,
			""addresses"": [
				{ ""street"": ""123 Main St"", ""city"": ""Springfield"" },
				{ ""street"": ""456 Elm St"", ""city"": ""Shelbyville"" }
			]
		}";

		// Deserialize JSON to Person object
		Person person = JsonConvert.DeserializeObject<Person>(jsonString);

		// Access data
		Console.WriteLine($"Name: {person.Name}");
		Console.WriteLine($"Age: {person.Age}");
		Console.WriteLine($"Is Active: {person.IsActive}");

		foreach (var address in person.Addresses)
		{
			Console.WriteLine($"Address: {address.Street}, {address.City}");
		}
	}
}
