// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.csharp.file.v01 : 0.1.0

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
				string filePath = "_example.txt";

				// Part 1: Writing to a file line by line
				using (StreamWriter writer = new StreamWriter(filePath))
				{
					writer.WriteLine("Line 1: This is the first line.");
					writer.WriteLine("Line 2: This is the second line.");
					writer.WriteLine("Line 3: This is the third line.");
					writer.WriteLine("Line 4: This is the fourth line.");
				}
				Console.WriteLine($"Data has been written to the file: {filePath}");

				// Part 2: Reading from a file line by line
				using (StreamReader reader = new StreamReader(filePath))
				{
					string line;
					Console.WriteLine("\nReading file line by line:");
					while ((line = reader.ReadLine()) != null)
					{
						Console.WriteLine(line);
					}
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
