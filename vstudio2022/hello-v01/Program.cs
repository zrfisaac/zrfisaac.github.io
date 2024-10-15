// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

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
				Console.WriteLine("Hello, World!");
			} catch (Exception e)
			{
				Console.WriteLine(e.Message);	
				throw;
			}
			Console.ReadKey();
		}
	}
}
