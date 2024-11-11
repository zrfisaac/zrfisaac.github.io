// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.csharp.date.v01 : 0.1.0

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
				// 1. Create a DateTime object for the current date and time
				DateTime currentDate = DateTime.Now;
				Console.WriteLine("Current DateTime: " + currentDate);

				// 2. Convert DateTime to String with different formats
				string dateStr = currentDate.ToString("yyyy-MM-dd HH:mm:ss");
				Console.WriteLine("Formatted DateTime (yyyy-MM-dd HH:mm:ss): " + dateStr);

				// 3. Convert String back to DateTime
				DateTime parsedDate = DateTime.ParseExact(dateStr, "yyyy-MM-dd HH:mm:ss", CultureInfo.InvariantCulture);
				Console.WriteLine("Parsed DateTime: " + parsedDate);

				// 4. Adding/Subtracting time
				DateTime futureDate = currentDate.AddDays(10);  // Add 10 days
				Console.WriteLine("Future Date (10 days later): " + futureDate);

				DateTime pastDate = currentDate.AddHours(-5);  // Subtract 5 hours
				Console.WriteLine("Past Date (5 hours earlier): " + pastDate);

				// 5. Difference between two dates
				TimeSpan dateDifference = futureDate - currentDate;
				Console.WriteLine("Difference between future and current: " + dateDifference.Days + " days");

				// 6. Comparing Dates
				if (futureDate > currentDate)
				{
					Console.WriteLine("Future date is after current date.");
				}

				// 7. Getting parts of the date
				int year = currentDate.Year;
				int month = currentDate.Month;
				int day = currentDate.Day;
				int hour = currentDate.Hour;
				int minute = currentDate.Minute;
				int second = currentDate.Second;
				Console.WriteLine($"Year: {year}, Month: {month}, Day: {day}, Time: {hour}:{minute}:{second}");

				// 8. Checking if a string is a valid date
				string dateString = "2024-10-13 14:30:00";
				if (DateTime.TryParse(dateString, out DateTime validDate))
				{
					Console.WriteLine($"'{dateString}' is a valid date: {validDate}");
				}
				else
				{
					Console.WriteLine($"'{dateString}' is not a valid date.");
				}

				// 9. Handling time zones with DateTimeOffset
				DateTimeOffset utcNow = DateTimeOffset.UtcNow;
				Console.WriteLine("Current UTC Time: " + utcNow);

				DateTimeOffset localTimeWithOffset = utcNow.ToOffset(TimeSpan.FromHours(-5)); // UTC-5
				Console.WriteLine("Time with UTC-5 Offset: " + localTimeWithOffset);

				// 10. Parse string with specific culture
				string frenchDateStr = "13 octobre 2024";
				DateTime frenchDate = DateTime.ParseExact(frenchDateStr, "dd MMMM yyyy", new CultureInfo("fr-FR"));
				Console.WriteLine("Parsed French Date: " + frenchDate);
			} catch (Exception e)
			{
				Console.WriteLine(e.Message);	
				throw;
			}
			Console.ReadKey();
		}
	}
}
