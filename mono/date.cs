// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.mono.date : 0.0.1

// # [ mono ]
using System;
using System.Globalization;

namespace zrfisaac
{
	public class ZRFISAAC {
		public static void Main(string[] args) {
			DateTime _vDate = DateTime.Now;
			Console.WriteLine("# - date : " + _vDate.ToShortDateString());
			Console.WriteLine("# - format : " + _vDate.ToString("yyyy-MM-dd hh:mm:ss", CultureInfo.InvariantCulture));
			Console.WriteLine("# - time : " + _vDate.ToLongTimeString());
			Console.WriteLine("# - parse : " + DateTime.Parse("2003-02-01").ToString());
			Console.WriteLine("# - year : " + _vDate.Year.ToString());
			Console.WriteLine("# - mounth : " + _vDate.Month.ToString());
			Console.WriteLine("# - day : " + _vDate.Day.ToString());
			Console.WriteLine("# - hour : " + _vDate.Hour.ToString());
			Console.WriteLine("# - minute : " + _vDate.Minute.ToString());
			Console.WriteLine("# - second : " + _vDate.Second.ToString());
			//Console.ReadLine();
		}
	}
}
