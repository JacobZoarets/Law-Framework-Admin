using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ClientsManagment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    [WebMethod]
    public static string get_lastConversationData(string user_id)
    {
        Dictionary<string, object> query = new Dictionary<string, object>();
        query.Add("conversation_id", "6");
        query.Add("user_id", user_id);

        Dictionary<string, string> last_row = dbHandler.getTableData_lastRow("Agmon_Law_html_trees", query);

        string ret = "";
        if (last_row != null)
        {
            ret = last_row["unique_conversation_id"] + "&" + last_row["danger_count"] + "&" + last_row["dateTime"];
        }

        return ret;

    }

}