using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
            
        }
        

    }

    private void addNewTree()
    {
        // add new tree id to System_bot_app_ids
        int lastID = dbHandler.getLastAddedIndex("System_bot_app_ids");
        List<Dictionary<string, string>> rows = dbHandler.getTableData("System_bot_app_ids", "id", lastID);

        string lastTreeId = "";
        if (rows != null && rows.Count == 1)
        {
            lastTreeId = rows[0]["tree_id"];            
        }

        int tree_id = int.Parse(lastTreeId);
        tree_id += 1;

        Dictionary<string, object> values = new Dictionary<string, object>();
        values.Add("microsoft_bot_id", ConfigurationManager.AppSettings["microsoftAppId"]);
        values.Add("tree_id", tree_id);
        values.Add("is_active", 0);
        dbHandler.addNewContent("System_bot_app_ids", values);




        // add top parent node to conversation Tree
        values = new Dictionary<string, object>();
        values.Add("type", 1);
        values.Add("text", "התחל כאן");
        dbHandler.addNewContent("Dialogs_text", values);
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_text");

        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", 0);
        values.Add("dialog_type", "1");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);
        
        
    }

    public  string getTreeName(object tree_id, object tree_name)
    {
        if (tree_name != null && tree_name.ToString() != "")
        {
            return tree_name.ToString();
        }
        return "Conversation tree # " + tree_id.ToString();
    }
}