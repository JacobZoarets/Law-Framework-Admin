using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TreeStatistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string tree_id_val = Request.QueryString["tree_id"];

            if (tree_id_val != "")
                tree_id.Value = tree_id_val;
            else
                tree_id.Value = "1";
        }
    }
}