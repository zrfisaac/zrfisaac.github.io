// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ csharp ]

// # : - vstudio
using System;
using System.Collections.Generic;
using System.IO;

namespace ConfigNamespace
{
    public static class ConfigHelp
    {
        public static MemoryStream Base64ToStream(string base64)
        {
            byte[] byteArray = Convert.FromBase64String(base64);
            return new MemoryStream(byteArray);
        }

        public static List<string> CsvToList(string csv)
        {
            return new List<string>(csv.Split(','));
        }

        public static List<string> JsonToList(string json)
        {
            // Placeholder for JSON to list conversion
            return new List<string>();
        }

        public static string ListToCsv(List<string> list)
        {
            return string.Join(",", list);
        }

        public static string ListToString(List<string> list)
        {
            return string.Join(Environment.NewLine, list);
        }

        public static List<string> ListToXml(List<string> list)
        {
            // Placeholder for List to XML conversion
            return new List<string>();
        }

        public static string StreamToBase64(Stream stream)
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                stream.CopyTo(memoryStream);
                byte[] byteArray = memoryStream.ToArray();
                return Convert.ToBase64String(byteArray);
            }
        }

        public static List<string> StringToList(string input)
        {
            return new List<string>(input.Split(new[] { Environment.NewLine }, StringSplitOptions.None));
        }

        public static string XmlToList(string xml)
        {
            // Placeholder for XML to list conversion
            return string.Empty;
        }
    }

    public interface IConfig
    {
        // Read Methods - string
        string Read(string local, string group, string name, string defaultValue = null);
        string Read(string group, string name, string defaultValue = null);
        string Read(string name, string defaultValue = null);
        string Read(string name);

        // Read Methods - int
        int Read(string local, string group, string name, int defaultValue);
        int Read(string group, string name, int defaultValue);
        int Read(string name, int defaultValue);

        // Read Methods - double
        double Read(string local, string group, string name, double defaultValue);
        double Read(string group, string name, double defaultValue);
        double Read(string name, double defaultValue);

        // Read Methods - bool
        bool Read(string local, string group, string name, bool defaultValue);
        bool Read(string group, string name, bool defaultValue);
        bool Read(string name, bool defaultValue);

        // Write Methods - string
        string Write(string local, string group, string name, string value);
        string Write(string group, string name, string value);
        string Write(string name, string value);
    }

    public abstract class ConfigBase : IConfig
    {
	    // Attributes
        protected string Local { get; set; }
        protected string Group { get; set; }
        protected string Name { get; set; }

        // Read Methods - string
        public abstract string Read(string local, string group, string name, string defaultValue = null);
        public abstract string Read(string group, string name, string defaultValue = null);
        public abstract string Read(string name, string defaultValue = null);
        public abstract string Read(string name);

        // Read Methods - int
        public abstract int Read(string local, string group, string name, int defaultValue);
        public abstract int Read(string group, string name, int defaultValue);
        public abstract int Read(string name, int defaultValue);

        // Read Methods - double
        public abstract double Read(string local, string group, string name, double defaultValue);
        public abstract double Read(string group, string name, double defaultValue);
        public abstract double Read(string name, double defaultValue);

        // Read Methods - bool
	    public abstract bool Read(string local, string group, string name, bool defaultValue);
        public abstract bool Read(string group, string name, bool defaultValue);
        public abstract bool Read(string name, bool defaultValue);

	    // Write Methods - string
        public abstract string Write(string local, string group, string name, string value);
        public abstract string Write(string group, string name, string value);
        public abstract string Write(string name, string value);
    }
}
