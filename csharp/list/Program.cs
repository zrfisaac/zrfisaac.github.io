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
				string _vFile = "";
				_vFile = AppContext.BaseDirectory.TrimEnd('\\') + "\\_.txt";
				List<string> _vList = new List<string>();
				_vList.Add("Charlotte Evans");
				_vList.Add("Emily Carter");
				_vList.Add("Harper Collins");
				if (File.Exists(_vFile))
					File.Delete(_vFile);
				Console.WriteLine("# . - : Strings saved to file \"" + _vFile + "\".");
				File.WriteAllLines(_vFile, _vList);
				Console.WriteLine("# . - : Show _vList data.");
				Console.WriteLine(string.Join(Environment.NewLine, _vList));
				Console.WriteLine("# . - : Clean variable _vList.");
				_vList.Clear();
				Console.WriteLine("# . - : Read saved file \"" + _vFile + "\".");
				_vList.AddRange(File.ReadAllLines(_vFile));
				Console.WriteLine("# . - : Output read data.");
				Console.WriteLine(string.Join(Environment.NewLine, _vList));
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
