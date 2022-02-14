using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string tree_id_val = Request.QueryString["tree_id"] + "";

            if (tree_id_val != "")
                tree_id.Value = tree_id_val;
            else if (Request.QueryString["node_id"] + "" != "")
                node_id.Value = Request.QueryString["node_id"];
            else
                tree_id.Value = "1"; 
        }

    }

    public string getTreeName(object tree_id, object tree_name)
    {
        if (tree_name != null && tree_name.ToString() != "")
        {
            return tree_name.ToString();
        }
        return "Conversation tree # " + tree_id.ToString();
    }
}