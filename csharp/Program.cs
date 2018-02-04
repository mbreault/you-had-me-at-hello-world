using System;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;

// 1. HTTP GET example.com
// 2. Regex title out of HTML
// 3. Reverse string
// 4. Write to a text file.

namespace csharp
{
    class MainClass
    {
        public static string Step1()
        {
            // 1. HTTP GET example.com
            string sResponse = String.Empty;

            string sURL;
            sURL = "http://example.com";

            WebRequest wrGETURL;
            wrGETURL = WebRequest.Create(sURL);

            Stream objStream;
            objStream = wrGETURL.GetResponse().GetResponseStream();

            StreamReader objReader = new StreamReader(objStream);

            return objReader.ReadToEnd();
        }

        public static string Step2( string sResponse)
        {
            // 2. Regex title out of HTML
            var regex = new Regex(@"<title>(.*)</title>");
            var matches =  regex.Matches(sResponse);
            return matches[0].Groups[1].Value;
        }

        public static string Step3(string sResponse)
        {
            // 3. Reverse string
            char[] array = sResponse.ToCharArray();
            Array.Reverse(array);
            return new string(array);
        }

        public static void Step4(string sResponse) {
            // 4. Write to a text file
            System.IO.File.WriteAllText(@"output.txt", sResponse);
        }

        public static void Main(string[] args)
        {
            string sResponse = String.Empty;

            sResponse = Step1();

            sResponse = Step2(sResponse);

            sResponse = Step3(sResponse);

            Step4(sResponse);
        }
    }
}
