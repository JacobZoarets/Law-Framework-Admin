using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Summary description for Utils
/// </summary>
public class JUtils
{

    public static string title = "title";
    public static string image_url = "image_url";
    public static string subtitle = "subtitle";
    public static string default_action_url = "default_action_url";
    public static string fallback_url = "fallback_url";
    public static string type = "type";
    public static string url = "url";
    public static string payload = "payload";
    public static string button_title = "button_title";
    public static string user_id = "user_id";
    public static string user_id1111 = "user_id";
    // public static string baseUrl = "https://2aed9404.ngrok.io";

           

    public static string baseUrlSSL = "https://ssl.publicis-digital.co.il/JacobSSL";
    //public static string baseUrlSSL = "https://2aed9404.ngrok.io";


    // public static string baseUrl = "https://ssl.publicis-digital.co.il/JacobSSL";

   // public static string baseUrlImagesContainer = "https://ssl.publicis-digital.co.il/JacobSSL/images/icons/";// baseUrl + "/images/icons/";
    public static string baseUrlEmogiContainer = "https://ssl.publicis-digital.co.il/JacobSSL/images/emogi/";// baseUrl + "/images/icons/";

    //https://lbi.co.il/projects/QuakerBotApplication/images/icons/Sun2.png

    public static bool IsPhoneNumber(string text)
    {
        List<string> phoneList = new List<string>();
        Regex rg = new Regex(@"\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})");
        MatchCollection m = rg.Matches(text);
        foreach (Match g in m)
        {
            if (g.Groups[0].Value.Length > 0)
                phoneList.Add(g.Groups[0].Value);
        }

        return phoneList.Count > 0;
    }


}