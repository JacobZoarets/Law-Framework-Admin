using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class GenericMessage
{
    public string senderID = "";
    public string text = "";
    public string postback = "";
    public string payload = "";
    public string ConversationId = "";

    public string node_id = "";

    public GenericMessage(string objText)
    {
        dynamic result = JObject.Parse(objText);


        senderID = result["entry"][0]["messaging"][0]["sender"]["id"];

        if (result["entry"][0]["messaging"][0]["message"] != null)
            text = result["entry"][0]["messaging"][0]["message"]["text"] + "";
        else if (result["entry"][0]["messaging"][0]["postback"] != null)
            text = result["entry"][0]["messaging"][0]["postback"]["payload"] + "";

        if (result["entry"][0]["messaging"][0]["message"] != null && result["entry"][0]["messaging"][0]["message"]["quick_reply"] != null)
            payload = result["entry"][0]["messaging"][0]["message"]["quick_reply"]["payload"] + "";
        else if (result["entry"][0]["messaging"][0]["quick_reply"] != null)
            payload = result["entry"][0]["messaging"][0]["quick_reply"]["payload"] + "";
    }

    public GenericMessage(string _senderID, string conversationId, string selected_node_id)
    {
        ConversationId = conversationId;
        senderID = _senderID;
        node_id = selected_node_id;
        payload = selected_node_id;
    }
}

[Serializable]
public class ConversationTree
{

    private Dictionary<string, Node> nodes;

    public ConversationTree(Dictionary<string, Node> _nodes)
    {
        nodes = _nodes;
    }


    public void getNodeTriggers(Node node)
    {

    }

    Node currentNode;
    public Node getCurrentNode(string node_id)
    {
        currentNode = nodes[node_id];
        return currentNode;
    }

    public Node getTopParentNode()
    {
        foreach (Node node_item in nodes.Values)
        {
            if (node_item.ParentNodeID() == "0")
                return node_item;
        }
        //currentNode = nodes["11"];            
        return currentNode;
    }

    public static Dictionary<string, string> getTopParentNode(int tree_id)
    {
        Dictionary<string, object> queryKeyAndValue = new Dictionary<string, object>();
        queryKeyAndValue.Add("tree_id", tree_id);
        queryKeyAndValue.Add("parent_dialog_id", 0);

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", queryKeyAndValue);
        if (rows.Count > 0)
        {
            return rows[0];
        }
        return null;
    }

}

[Serializable]
public class Node
{
    public List<Node> chiledNodes = null;

    public Dictionary<string, string> data = null;

    public Node(Dictionary<string, string> bd_data_row)
    {
        data = bd_data_row;
    }

    public void addChieldNode(Node node)
    {
        if (chiledNodes == null)
            chiledNodes = new List<Node>();

        chiledNodes.Add(node);
    }

    public string NodeID()
    {
        return data[DialogsGetter.colomn_id];
    }

    public string ParentNodeID()
    {
        return data[DialogsGetter.colomn_parent_dialog_id];
    }

    public string getNodeType()
    {
        return data[DialogsGetter.colomn_dialog_type];
    }

}
