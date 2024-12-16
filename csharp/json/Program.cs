// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ csharp ]

// # : - vstudio
using System;
using System.Text.Json;

namespace zrfisaac
{
    public class Person
    {
        public string Name { get; set; }
        public int Age { get; set; }
    }
	internal class Program
	{
		static void Main(string[] args)
		{
			string _vError = "";
			try
			{
				// # : - action
				Console.WriteLine("# - action");
				Person _vPerson;
				string _vJson;
				_vPerson = new Person { Name = "Laura", Age = 26 };
				_vJson = JsonSerializer.Serialize(_vPerson);
				_vPerson = JsonSerializer.Deserialize<Person>(_vJson);
				Console.WriteLine(_vJson);
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
