using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


//namespace DialogsUtils
//{
public class DialogsGetter
{

    public static string dialog_type_text = "1";
    public static string dialog_type_quick_replys = "2";
    public static string dialog_type_image = "3";
    public static string dialog_type_video = "4";
    public static string dialog_type_caruosel = "5";
    public static string dialog_type_audio = "8";
    public static string dialog_type_animation = "7";

    public static string colomn_id = "id";
    public static string colomn_tree_id = "tree_id";
    public static string colomn_parent_dialog_id = "parent_dialog_id";
    public static string colomn_dialog_id = "dialog_id";
    public static string colomn_dialog_type = "dialog_type";

    public static string prefix_card_details = "card_details_";


    public static string analytics_conversation_state_data = "conversation_state_data";

    public static int getConversationTreeCount(int tree_id)
    {
        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "tree_id", tree_id, "parent_dialog_id");
        return rows.Count;
    }
    public static ConversationTree getConversationTree(int tree_id)
    {
        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "tree_id", tree_id, "parent_dialog_id");


        Dictionary<string, Node> nodes = new Dictionary<string, Node>();
        foreach (Dictionary<string, string> row in rows)
        {
            // extract row specific tables
            Dictionary<string, string> card_details_row = extractCardDetails(row);

            // create data on node
            Node node = createNode(row, card_details_row);
            // add to conversation
            nodes.Add(node.NodeID(), node);

            if (node.ParentNodeID() != "0")
            {
                if (nodes.ContainsKey(node.ParentNodeID()))
                {
                    // get parent node
                    Node parentNode = nodes[node.ParentNodeID()];
                    // add chields to parent
                    parentNode.addChieldNode(node);
                }
                else
                {
                    string s = "fgrf";
                }
            }

        }


        return new ConversationTree(nodes);
    }

    public static Dictionary<string, string> extractCardDetails(Dictionary<string, string> row)
    {
        string table_name = "";
        if (row[colomn_dialog_type] == dialog_type_text)
            table_name = "Dialogs_text";
        else if (row[colomn_dialog_type] == dialog_type_quick_replys)
            table_name = "Dialogs_quick_replys";
        else if (row[colomn_dialog_type] == dialog_type_image)
            table_name = "Dialogs_HeroCard";
        else if (row[colomn_dialog_type] == dialog_type_video)
            table_name = "Dialogs_HeroCard";
        else if (row[colomn_dialog_type] == dialog_type_audio)
            table_name = "Dialogs_HeroCard";
        else if (row[colomn_dialog_type] == dialog_type_animation)
            table_name = "Dialogs_HeroCard";
        else if (row[colomn_dialog_type] == dialog_type_caruosel)
            table_name = "Dialogs_quick_replys";
        else
            throw new Exception("NYI extractCardDetails()");


        List<Dictionary<string, string>> rows = dbHandler.getTableData(table_name, "id", int.Parse(row[colomn_dialog_id]), "id");
        if (rows.Count > 0)
        {
            Dictionary<string, string> ret = rows[0];
            if (ret.ContainsKey("image_url") && ret["image_url"].Contains("http://lbi.co.il/projects/QuakerBotApplication"))
            {
                ret["image_url"] = ret["image_url"].Replace("http://lbi.co.il/projects/QuakerBotApplication", "https://ssl.publicis-digital.co.il/JacobSSL");
                ret["media_url"] = ret["media_url"].Replace("http://lbi.co.il/projects/QuakerBotApplication", "https://ssl.publicis-digital.co.il/JacobSSL");
            }
            return rows[0];
        }
        return null;
    }

    public static Node createNode(Dictionary<string, string> row, Dictionary<string, string> card_details_row)
    {

        foreach (string key in card_details_row.Keys)
        {
            string value = card_details_row[key];
            row.Add(DialogsGetter.prefix_card_details + key, value);
        }

        return new Node(row);
        //return "{ id: " + row["id"] + ", name: '" + row["dialog_type"] + "', parent: " + row["parent_dialog_id"] + " },";
    }


}
//}
