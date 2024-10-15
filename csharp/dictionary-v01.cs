// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.csharp.dictionary.v01 : 1.0.0

// # [ csharp ]

// # : - vstudio
using System;

namespace zrfisaac
{
	internal class Program
	{
		static void Main(string[] args)
		{
			try
			{
				Dictionary<int, string> countries = new Dictionary<int, string>();

				// Adding items
				countries.Add(1, "Brazil");
				countries.Add(2, "USA");
				countries.Add(3, "Japan");

				// Accessing items
				Console.WriteLine(countries[1]);  // Output: Brazil

				// Checking if a key exists
				if (countries.ContainsKey(2))
				{
					Console.WriteLine("USA is in the dictionary.");
				}

				// Removing an item
				countries.Remove(3);

				// Iterating through the dictionary
				foreach (KeyValuePair<int, string> kvp in countries)
				{
					Console.WriteLine($"Key: {kvp.Key}, Value: {kvp.Value}");
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
