using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Node_Response
/// </summary>
public class Node_Response
{
    public Node_Response()
    {
    }



    public string response_type = "";
    public string message_text = "";

    public string[] quick_replys = null;
    public string[] quick_replys_payload = null;


    public string law_text = "";
    public string message_origin = "";
    public string message_origin_source = "";
    public string message_explenation = "";
    public string danger_level = "";
    public string financial_danger_level = "";
    public string question_number = "";
    public string node_id = "";


    public string html_tree = "";
    public string law_raw_text = "";
    public string relevant_verdicts = "";
    public string relevant_extentions = "";
    public string relevant_danger_links = "";

}