using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MultiSelectionForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!Page.IsPostBack)
        {
            string bot_user_id_val = Request.QueryString["user_id"];

            if (bot_user_id_val != "")
                bot_user_id.Value = bot_user_id_val;
            else
                bot_user_id.Value = "1";
        }
    }
}