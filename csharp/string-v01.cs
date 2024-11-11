// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.csharp.string.v01 : 1.0.0

// # [ csharp ]

// # : - vstudio
using System;
using System.Text.RegularExpressions;

namespace zrfisaac
{
	internal class Program
	{
		static void Main(string[] args)
		{
			try
			{
				string str = "Hello123, World!";

				// 1. Replace 'o' with '0'
				string replacedStr = str.Replace('o', '0');
				Console.WriteLine("Replaced string: " + replacedStr);  // Output: Hell0123, W0rld!

				// 2. Find the position of the first and second 'o'
				int firstOccurrence = str.IndexOf('o');
				int secondOccurrence = str.IndexOf('o', firstOccurrence + 1);
				Console.WriteLine("First 'o' position: " + firstOccurrence);   // Output: 4
				Console.WriteLine("Second 'o' position: " + secondOccurrence); // Output: 8

				// 3. Loop through all letters
				Console.WriteLine("Letters in the string:");
				foreach (char c in str)
				{
					if (Char.IsLetter(c))
						Console.WriteLine(c);
				}

				// 4. Loop through all numbers and special characters
				Console.WriteLine("Numbers and special characters:");
				foreach (char c in str)
				{
					if (Char.IsDigit(c))
						Console.WriteLine("Number: " + c);
					else if (!Char.IsLetterOrDigit(c))
						Console.WriteLine("Special Character: " + c);
				}

				// 5. Insert a string at a specific position
				string toInsert = ", beautiful";
				int insertPosition = 5;
				string result = str.Substring(0, insertPosition) + toInsert + str.Substring(insertPosition);
				Console.WriteLine("Inserted string: " + result);  // Output: Hello, beautiful123, World!

				// 6. Find the second occurrence of a character
				char charToFind = 'o';
				int firstIndex = str.IndexOf(charToFind);
				int secondIndex = str.IndexOf(charToFind, firstIndex + 1);
				Console.WriteLine("Second occurrence of 'o': " + secondIndex);  // Output: 8

				// 7. Convert array to string
				char[] charArray = { 'H', 'e', 'l', 'l', 'o' };
				string arrayToString = new string(charArray);
				Console.WriteLine("Array to String: " + arrayToString);  // Output: Hello

				// 8. Convert string to array
				char[] strToArray = str.ToCharArray();
				Console.WriteLine("String to Char Array: " + string.Join(", ", strToArray));

				// 9. Trim whitespace
				string strWithSpaces = "   Hello, World!   ";
				string trimmedStr = strWithSpaces.Trim();
				Console.WriteLine("Trimmed String: '" + trimmedStr + "'");  // Output: 'Hello, World!'

				// 10. Uppercase and lowercase conversion
				Console.WriteLine("Uppercase: " + str.ToUpper());  // Output: HELLO123, WORLD!
				Console.WriteLine("Lowercase: " + str.ToLower());  // Output: hello123, world!

				// 11. Substring
				string subStr = str.Substring(7, 5);
				Console.WriteLine("Substring: " + subStr);  // Output: World

				// 12. Split and Join
				string fruitsStr = "apple,banana,orange";
				string[] fruits = fruitsStr.Split(',');
				Console.WriteLine("Fruits Array: " + string.Join(", ", fruits));
				string joinedStr = string.Join(" | ", fruits);
				Console.WriteLine("Joined String: " + joinedStr);  // Output: apple | banana | orange

				// 13. Contains, StartsWith, EndsWith
				Console.WriteLine("Contains 'Hello': " + str.Contains("Hello"));  // Output: True
				Console.WriteLine("Starts with 'Hello': " + str.StartsWith("Hello"));  // Output: True
				Console.WriteLine("Ends with '!': " + str.EndsWith("!"));  // Output: True

				// 14. Remove
				string removedStr = str.Remove(5, 7);  // Removes ', World!'
				Console.WriteLine("Removed String: " + removedStr);  // Output: Hello!

				// 15. Regex Replace
				string regexStr = "My phone number is 123-456-7890";
				string regexReplacedStr = Regex.Replace(regexStr, @"\d", "*");
				Console.WriteLine("Regex Replace: " + regexReplacedStr);  // Output: My phone number is ***-***-****
			} catch (Exception e)
			{
				Console.WriteLine(e.Message);	
				throw;
			}
			Console.ReadKey();
		}
	}
}
