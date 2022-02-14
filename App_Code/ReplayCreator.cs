using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ReplayCreator
/// </summary>
public class ReplayCreator
{
    public ReplayCreator()
    {       
    }

    public static Node_Response createReply_text(GenericMessage user_message, string message)
    {
        Node_Response response = new Node_Response();
        response.message_text = message;
        response.response_type = "text";
        response.node_id = user_message.node_id;
        return response;
    }

    public static Node_Response createReply_quick_replys(GenericMessage user_message, Dictionary<string, string> data)
    {
        Node_Response response = new Node_Response();
        //response.message_text = message;
        response.response_type = "quick_replys";
        response.node_id = user_message.node_id;

        Dictionary<string, object> queryKeyAndValue = null;
        queryKeyAndValue = new Dictionary<string, object>();
        queryKeyAndValue.Add("parent_dialog_id", int.Parse(data[DialogsGetter.colomn_id]));
        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", queryKeyAndValue, "id");
        

        response.quick_replys_payload = new string[rows.Count];
        response.quick_replys = new string[rows.Count];

        for (int i = 1; i < 11; i++)
        {
           
            string key = DialogsGetter.prefix_card_details + "reply_text_" + i;
            string value = data[key];
            if (value != "")
            {
                string payload = "";
                if (rows.Count > i - 1)
                {
                    payload = rows[i - 1][DialogsGetter.colomn_id];
                }

                if (value.Contains(":"))
                {
                    // direct connection to child id
                    string[] vals = value.Split(':');
                    // extract the id
                    string childID = vals[1];
                    // clean the value 
                    value = vals[0];
                    payload = childID;
                }
                if (i - 1 < response.quick_replys.Length)
                {
                    response.quick_replys_payload[i - 1] = payload;
                    response.quick_replys[i - 1] = value;
                }     
                
                
            }

        }

       

        return response;
    }
}