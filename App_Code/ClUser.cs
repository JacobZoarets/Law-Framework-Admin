using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Summary description for ClUser
/// </summary>
public class ClUser
{
    string _userid;
    string _first_name;
    string _last_name;
    string _profile_pic;
    string _locale;
    string _timezone;
    string _gender;
    string _hebfirstname;



    public string userid
    {
        get
        {
            return _userid;
        }
        set
        {
            _userid = value;
        }
    }

    public string first_name
    {
        get
        {
            return _first_name;
        }
        set
        {
            _first_name = value;
        }
    }

    public string last_name
    {
        get
        {
            return _last_name;
        }
        set
        {
            _last_name = value;
        }
    }

    public string profile_pic
    {
        get
        {
            return _profile_pic;
        }
        set
        {
            _profile_pic = value;
        }
    }

    public string locale
    {
        get
        {
            return _locale;
        }
        set
        {
            _locale = value;
        }
    }

    public string timezone
    {
        get
        {
            return _timezone;
        }
        set
        {
            _timezone = value;
        }
    }

    public string gender
    {
        get
        {
            return _gender;
        }
        set
        {
            _gender = value;
        }
    }

    public string hebfirstname
    {
        get
        {
            return _hebfirstname;
        }
        set
        {
            _hebfirstname = value;
        }
    }

    public bool DoesUserExit(string UserId)
    {
        DataSet ds = new DataSet();
        Hashtable ht = new Hashtable();
        ht.Add("UserId", UserId);
        ds = null;// DBHeadller.getThroughProcedure("sp_Tbl_Users_Get_ByUserId_Leo", ht);

        try
        {
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                return true;
            }
        }
        catch
        {



            return false;
        }
        return false;

    }
    public ClUser GetUser(string UserId)
    {
        DataSet ds = new DataSet();
        Hashtable ht = new Hashtable();
        ht.Add("UserId", UserId);
        ds = null;// DBHeadller.getThroughProcedure("sp_Tbl_Users_Get_ByUserId_Leo", ht);

        ClUser cUser = new ClUser();
        cUser._userid = UserId;
        cUser._first_name = ds.Tables[0].Rows[0]["FirstName"].ToString();
        cUser._last_name = ds.Tables[0].Rows[0]["LastName"].ToString();
        cUser._profile_pic = ds.Tables[0].Rows[0]["ProfileImage"].ToString();
        cUser._locale = ds.Tables[0].Rows[0]["Locale"].ToString();
        cUser._timezone = ds.Tables[0].Rows[0]["TimeZone"].ToString();
        cUser._gender = ds.Tables[0].Rows[0]["Gender"].ToString();
        cUser._hebfirstname = ds.Tables[0].Rows[0]["HebFirstName"].ToString();
        return cUser;
    }
    public ClUser InsertAndReturnNewUser(string userid, string first_name, string last_name, string profile_pic, string locale, string timezone, string gender)
    {

        string HebFirstName = "";
        if (Regex.IsMatch(first_name, @"^[a-zA-Z]+$"))
        {
            try
            {
                //check if the name is in english and if so, translate to heberw
                HebFirstName = GetUserHebNameTranslate(first_name);
            }
            catch (Exception)
            {
                HebFirstName = first_name;
            }
            
        }
        else
        {
            //leave it as is, in hebrew
            HebFirstName = first_name;
        }


        DataSet ds = new DataSet();
        Hashtable ht = new Hashtable();
        ht.Add("UserId", userid);
        ht.Add("FirstName", first_name);
        ht.Add("LastName", last_name);
        ht.Add("ProfileImage", profile_pic);
        ht.Add("Locale", locale);
        ht.Add("TimeZone", timezone);
        ht.Add("Gender", gender);
        ht.Add("HebFirstName", HebFirstName);
        ht.Add("CreatedDateTime", String.Format("{0:dd/MM/yyyy}", DateTime.Now));
        // DBHeadller.insertThroughProcedure("sp_Tbl_Users_Insert_Leo", ht);

        return GetUser(userid);

    }
    private string GetUserHebNameTranslate(string FirstNameEng)
    {
        DataSet ds = new DataSet();
        Hashtable ht = new Hashtable();
        ht.Add("EngName", FirstNameEng);
        ds = null;// DBHeadller.getThroughProcedure("sp_Get_HebrewNameByEngName", ht);
        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            return ds.Tables[0].Rows[0]["HebName"].ToString();
        }
        else
        {
            return FirstNameEng;
        }
    }


    public void HandleUserError(string UserId, int ErrorCount)
    {

        Hashtable ht = new Hashtable();
        ht.Add("UserId", UserId);
        //ht.Add("ErrorCount", ErrorCount);
        DataSet ds = new DataSet();
        ds = null;// DBHeadller.getThroughProcedure("sp_Tbl_Users_Erros_GetByUserId", ht);
        if (ds.Tables[0].Rows.Count > 0)
        {
            int CurrentCount = int.Parse(ds.Tables[0].Rows[0]["ErrorCount"].ToString());
            CurrentCount++;

            Hashtable ht2 = new Hashtable();
            ht2.Add("UserId", UserId);
            ht2.Add("ErrorCount", ErrorCount);
            //DBHeadller.up("sp_Tbl_Users_Erros_GetByUserId", ht2);
        }
        else
        {

        }



    }
}
