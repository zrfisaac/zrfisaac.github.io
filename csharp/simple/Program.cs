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
			string _vError = "";
			try
			{
				// # : - action
				Console.WriteLine("# - action");
			} catch (Exception e)
			{
				_vError = e.Message;
				//throw;
			}
			Console.WriteLine();

			// # : - end
			Console.WriteLine("# - end");
			Console.ReadKey();
		}
	}
}
