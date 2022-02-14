using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendArgs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("test");
        //getUserPreferences
        if (Request.QueryString["function_name"] != null)
        {
            string function_name = Request.QueryString["function_name"];
            if (function_name != "")
            {
                string user_id = Request.QueryString["user_id"];
                switch (function_name)
                {
                    case "getUserPreferences":
                        Response.Write(getUserPreferences(user_id));
                        break;
                    case "updateUserPreferences":
                        string pref_data = Request.QueryString["pref_data"];
                        Response.Write(updateUserPreferences(user_id, pref_data));
                        break;
                    case "getUserFavorits":
                        if (Request.QueryString["recipe_id"] != "undefined")
                        {
                            addFavoritRecipe(user_id, Request.QueryString["recipe_id"]);
                        }
                        
                        Response.Write(getUserFavorits(user_id));
                        break;
                    default:
                        break;
                }
            }
        }


    }

    static string dialog_type_text = "1";
    static string dialog_type_quick_replys = "2";
    static string dialog_type_image = "3";
    static string dialog_type_buttons = "4";
    static string dialog_type_caruosel = "5";

    [WebMethod]
    public static string getConversationTree(int tree_id)
    {
        string ret = "";

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "tree_id", tree_id);
        System.Text.StringBuilder sb = new System.Text.StringBuilder();

        sb.Append("[");
        foreach (Dictionary<string, string> row in rows)
        {
            if (row["dialog_type"] == dialog_type_text)
            {
                sb.Append(createMessage_text(row));
            }
            else if (row["dialog_type"] == dialog_type_quick_replys)
            {
                sb.Append(createMessage_quick_replys(row));
            }
            else
            {
                sb.Append(createMessage_hero_reply(row));
            }
            /*else 
            {
                sb.Append("{ id: " + row["id"] + ", name: '" + row["dialog_type"] + "', parent: " + row["parent_dialog_id"] + " },");
            }*/
        }
        sb.Remove(sb.Length - 1, 1);

        sb.Append("]");
        return sb.ToString();
    }

    [WebMethod]
    public static string generateConversationTree11(int tree_id)
    {
        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "tree_id", tree_id, "parent_dialog_id");
        System.Text.StringBuilder sb = new System.Text.StringBuilder();

        // get top parent node
        Node startingNode = getTreeNodes(rows);
                
        return "";
    }

    [WebMethod]
    public static string generateConversationTreeFromNode(int node_id)
    {
        //string html = "";

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", node_id);
        System.Text.StringBuilder sb = new System.Text.StringBuilder();

        // get top parent node
        Node startingNode = getTreeNodesFromStartingNode(rows);

        // here we also add the analytics data to row
        //Dictionary<string, string> row = rows[0];
        //appendAnalyticsDataToRow(ref row);
        //Node startingNode = new Node(node_id.ToString(), row);

        

        //int visitors = 10000;
        //emulateAnalyticsData(startingNode, ref visitors,0);


        sb.Append("<center>");

        // add svg paths
        sb.Append("<div id='svgContainer' style='margin: 50px 50px;'>");
        sb.Append("<svg id='svg1' width='0' height='0'>");
        sb.Append(getHtmlTreePaths(startingNode, 100, 0));
        sb.Append("</svg></div>");




        if (startingNode != null)
        {
            // add html cards

            sb.Append(getHtmlTree(startingNode));

        }
        else
        {
            throw new Exception("should not come here");
        }


        sb.Append("</center>");
        /*
         sb.Append("<div>");
         foreach (Dictionary<string, string> row in startingNode.row)
         {
             if (row["dialog_type"] == dialog_type_text)
             {

                 sb.Append(generateMessage_text(row));
             }
             else if (row["dialog_type"] == dialog_type_quick_replys)
             {

                 sb.Append(generateMessage_quick_replys(row));
             }
             else
             {
                 sb.Append(generateMessage_hero_reply(row));
             }
         }
         sb.Append("</div>");
          */



        return sb.ToString();
    }


    [WebMethod]
    public static string generateConversationTree(int tree_id)
    {
        //string html = "";

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "tree_id", tree_id, "parent_dialog_id");
        System.Text.StringBuilder sb = new System.Text.StringBuilder();

        // get top parent node
        Node startingNode = getTreeNodes(rows);

        //int visitors = 10000;
        //emulateAnalyticsData(startingNode, ref visitors,0);


        sb.Append("<center>");

        // add svg paths
        sb.Append("<div id='svgContainer' style='margin: 50px 50px;'>");
        sb.Append("<svg id='svg1' width='0' height='0'>");

        if (startingNode != null)
            sb.Append(getHtmlTreePaths(startingNode, 100,0));

        sb.Append("</svg></div>");




        if (startingNode != null)
        {
            // add html cards

            sb.Append(getHtmlTree(startingNode));

        }
        else
        {
            throw new Exception("should not come here");
        }


        sb.Append("</center>");
        /*
         sb.Append("<div>");
         foreach (Dictionary<string, string> row in startingNode.row)
         {
             if (row["dialog_type"] == dialog_type_text)
             {

                 sb.Append(generateMessage_text(row));
             }
             else if (row["dialog_type"] == dialog_type_quick_replys)
             {

                 sb.Append(generateMessage_quick_replys(row));
             }
             else
             {
                 sb.Append(generateMessage_hero_reply(row));
             }
         }
         sb.Append("</div>");
          */



        return sb.ToString();
    }

    static string cardWidth = "200px";

    static int card_width = 200;
    static int card_height = 200;
    static int card_marging = 20;

    private static string getHtmlTree(Node startingNode)
    {

        System.Text.StringBuilder sb = new System.Text.StringBuilder();



        sb.Append("<center style='margin: auto;float:left'>");

        Dictionary<string, string> row = startingNode.row;
        if (row["dialog_type"] == dialog_type_text)
        {
            sb.Append(generateMessage_text(row));
        }
        else if (row["dialog_type"] == dialog_type_quick_replys)
        {

            sb.Append(generateMessage_quick_replys(row));
        }
        else if (row["dialog_type"] == dialog_type_caruosel)
        {

            sb.Append(generateMessage_Carousel(row));
        }
        else
        {
            sb.Append(generateMessage_hero_reply(row));
        }


        foreach (Node node in startingNode.chieldNodes)
        {
            sb.Append(getHtmlTree(node));
        }

        sb.Append("</center>");


        return sb.ToString();
    }

    private static string getHtmlTreePaths(Node startingNode, int totalVisitors, int quick_reply_index)
    {
        List<string> colors = new List<string>() { "#0000FF", "#0D00F2", "#1900E6", "#2600D9", "#3300CC", "#4000BF", "#4D00B2", "#5900A6", "#660099", "#73008C", "#800080", "#8C0073", "#990066", "#A60059", "#B2004C", "#BF0040", "#CC0033", "#D90026", "#E6001A", "#F2000D", "#FF0000" };

        System.Text.StringBuilder sb = new System.Text.StringBuilder();

        // caculate the amout of visitors in %
        double percent = (double.Parse(startingNode.row["visitors"]) / totalVisitors);
        double width = -1;// percent * (double)15;
        if ((int)width < 1)
        {
            width = (double)1;
        }
        if (startingNode.row["parent_dialog_id"].ToString() != "0")
        {
            //if (quick_reply_index > 0)
            //{  

            //    sb.Append("<path id='path_" + startingNode.row["id"] + "_" +
            //                startingNode.row["parent_dialog_id"] + quick_reply_index +
            //                "' d='M0 0' " +
            //                "style='stroke:#007FFF;fill:none;' stroke-width='" + (int)width + "px'  /> ");

            //}
            //else
            //{
                sb.Append("<path id='path_" + startingNode.row["id"] + "_" +
                            startingNode.row["parent_dialog_id"] +
                            "' d='M0 0' " +
                            "style='stroke:#007FFF;fill:none;' stroke-width='" + (int)width + "px'  /> ");
            //}

        }

        int qrIndex = 0;
        foreach (Node node in startingNode.chieldNodes)
        {
            if (startingNode.row["dialog_type"] == dialog_type_quick_replys)
            {
                qrIndex += 1;
            }
            sb.Append(getHtmlTreePaths(node, totalVisitors, qrIndex));
        }

        return sb.ToString();
    }

    private static void emulateAnalyticsData(Node startingNode, ref int parentCount, int blocked)
    {
        startingNode.row["visitors"] = parentCount.ToString();
        blocked = blocked * -1;
        startingNode.row["blocked_visitors"] = blocked.ToString();

        double p = ((double)blocked / (double)parentCount * (double)100);
        startingNode.row["uniques"] = p.ToString("0.##");

        foreach (Node node in startingNode.chieldNodes)
        {
            int tmpCount = parentCount;
            int rand = new Random().Next(0, 100);
            double pe = (((double)parentCount / (double)100) * (double)rand);
            parentCount = parentCount - (int)pe;
            emulateAnalyticsData(node, ref parentCount, (tmpCount - parentCount) * -1);
        }


    }

    private class Node
    {
        public List<Node> chieldNodes = new List<Node>();
        public Dictionary<string, string> row;
        string id;
        public Node(string _id, Dictionary<string, string> _row)
        {
            id = _id;
            row = _row;
        }
    }

    private static System.Collections.Hashtable getNodes(List<Dictionary<string, string>> rows)
    {
                
        System.Collections.Hashtable hash = new System.Collections.Hashtable();
        foreach (Dictionary<string, string> row in rows)
        {
            string id = row["id"].ToString();
            Node node = new Node(id, row);
            hash.Add(id, node);

                       
            System.Collections.Hashtable child_hash = getNodes(dbHandler.getTableData("Conversation_trees", "parent_dialog_id",int.Parse( id), "parent_dialog_id"));
            foreach (System.Collections.DictionaryEntry item in child_hash)
            {
                if (!hash.ContainsKey(item.Key))
                {
                    hash.Add(item.Key, item.Value);
                }                
            }
        }
        return hash;
    }

    private static Node getTreeNodesFromStartingNode(List<Dictionary<string, string>> rows)
    {
        string startingNodeID = rows[0]["id"];
        Node stratingNode = null;
        System.Collections.Hashtable hash = getNodes(rows);

        List<Node> list = new List<Node>();
        foreach (System.Collections.DictionaryEntry item in hash)
        {
            list.Add((Node)item.Value);
        }



        for (int i = 0; i < list.Count; i++)
        {
            Dictionary<string, string> row = list[i].row;
            string parent_dialog_id = row["parent_dialog_id"].ToString();
            string id = row["id"].ToString();
            if (id == startingNodeID)
            {
                stratingNode = (Node)hash[id];
                appendAnalyticsDataToRow(ref stratingNode.row);
            }
            else if (hash.ContainsKey(parent_dialog_id))
            {
                Node node = (Node)hash[id];

                Node parent = (Node)hash[parent_dialog_id];

                parent.chieldNodes.Add(node);

                // here we also add the analytics data to row
                appendAnalyticsDataToRow(ref row);

            }
        }

        if (stratingNode == null && rows.Count == 1 && hash.ContainsKey(rows[0]["id"].ToString()))
        {
            stratingNode = (Node)hash[rows[0]["id"].ToString()];
        }
        return stratingNode;



        //row["parent_dialog_id"].ToString()
    }

    private static Node getTreeNodes(List<Dictionary<string, string>> rows)
    {

        Node stratingNode = null;
        System.Collections.Hashtable hash = new System.Collections.Hashtable();
        foreach (Dictionary<string, string> row in rows)
        {
            string id = row["id"].ToString();
            Node node = new Node(id, row);
            hash.Add(id, node);
        }



        for (int i = 0; i < rows.Count; i++)
        {
            Dictionary<string, string> row = rows[i];
            string parent_dialog_id = row["parent_dialog_id"].ToString();
            string id = row["id"].ToString();
            if (hash.ContainsKey(parent_dialog_id))
            {
                Node node = (Node)hash[id];

                Node parent = (Node)hash[parent_dialog_id];

                parent.chieldNodes.Add(node);

                // here we also add the analytics data to row
                appendAnalyticsDataToRow(ref row);

            }
            else if (parent_dialog_id == "0")
            {
                stratingNode = (Node)hash[id];
                appendAnalyticsDataToRow(ref stratingNode.row);
            }
        }

        if (stratingNode == null && rows.Count == 1 && hash.ContainsKey(rows[0]["id"].ToString()))
        {
            stratingNode = (Node)hash[rows[0]["id"].ToString()];
        }
        return stratingNode;



        //row["parent_dialog_id"].ToString()
    }

    private static Node writeTreeNodesAnalytics(List<Dictionary<string, string>> rows)
    {

        System.Collections.Hashtable hash = new System.Collections.Hashtable();
        foreach (Dictionary<string, string> row in rows)
        {
            string id = row["id"].ToString();
            Node node = new Node(id, row);
            hash.Add(id, node);
        }


        Node stratingNode = null;
        for (int i = 0; i < rows.Count; i++)
        {
            Dictionary<string, string> row = rows[i];
            string parent_dialog_id = row["parent_dialog_id"].ToString();
            string id = row["id"].ToString();
            if (hash.ContainsKey(parent_dialog_id))
            {
                Node node = (Node)hash[id];

                Node parent = (Node)hash[parent_dialog_id];

                parent.chieldNodes.Add(node);

                // here we also add the analytics data to row
                appendAnalyticsDataToRow(ref row);

            }
            else if (parent_dialog_id == "0")
            {
                stratingNode = (Node)hash[id];
                appendAnalyticsDataToRow(ref stratingNode.row);
            }
        }

        return stratingNode;



        //row["parent_dialog_id"].ToString()
    }


    private static void appendAnalyticsDataToRow(ref Dictionary<string, string> row)
    {
        string parent_dialog_id = row["parent_dialog_id"].ToString();
        string id = row["id"].ToString();

        int count = dbHandler.getTableDataCount("Dialogs_Analytics", "childNodeID", int.Parse(id));

        row.Add("visitors", count.ToString());
        row.Add("uniques", 0.ToString());
        row.Add("blocked_visitors", 0.ToString());
    }
    //"onclick='updateTextElement('21','subtitle','text')"

    private static string generateMessage_text(Dictionary<string, string> row)
    {


        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_text", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {
            //string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='twPc-StatLabel twPc-block'>id:" + row["dialog_id"] + " parent_id:" + row["parent_dialog_id"] + "</div><div class='org-del-button'></div></div>";
            string controls = generateHtmlControls(row);
            //string stats = "";
            //string stats = "<div class='twPc-divStats'>" +
            //                "<ul class='twPc-Arrange'>" +
            //                    "<li class='twPc-ArrangeSizeFit'>" +
            //                        "<a href = '#' >" +
            //                            "<span class='twPc-StatLabel twPc-block'>visitors</span>" +
            //                            "<span class='twPc-StatValue'>" + row["visitors"] + "</span>" +
            //                        "</a>" +
            //                    "</li>" +
            //                    "<li class='twPc-ArrangeSizeFit'>" +
            //                        "<a href = '#' >" +
            //                            "<span class='twPc-StatLabel twPc-block'>ab option</span>" +
            //                            "<span class='twPc-StatValue'>" + "1" + "</span>" +
            //                        "</a>" +
            //                    "</li>" +
            //                    "<li class='twPc-ArrangeSizeFit'>" +
            //                        "<a href = '#' >" +
            //                            "<span class='twPc-StatLabel twPc-block'>percent</span>" +
            //                            "<span class='twPc-StatValue'>" + row["uniques"] + "%</span>" +
            //                        " </a>" +
            //                    "</li>" +
            //                "</ul>" +
            //            "</div>";
            string stats = "";

            if (row["id"] == "312")
            {
                stats = "<div class='twPc-divStats'>" +
                            "<ul class='twPc-Arrange'>" +
                               " <table style='border: 0; width: 100%'>" +
                                 "                                   <tr>" +
                                 "                                       <td>16.12.18</td>" +
                                 "                                       <td><a href='#' class='showTip L1'>עו''ד מורן</a></td>" +
                                 "                                   </tr>" +
                                 "                                   <tr>" +
                                  "                                      <td>25.12.18</td>" +
                                  "                                      <td><a href='#' class='showTip L2'>עו''ד הילה </a></td>" +
                                 "                                   </tr>" +
                                 "                               </table>" +
                            "</ul>" +
                        "</div>"; ;
            }
            else if (row["id"] == "314")
            {
                stats = "<div class='twPc-divStats'>" +
                            "<ul class='twPc-Arrange'>" +
                               " <table style='border: 0; width: 100%'>" +
                                 "                                   <tr>" +
                                 "                                       <td>12.11.18</td>" +
                                 "                                       <td><a href='#' class='showTip L1'>עו''ד צביקה</a></td>" +
                                 "                                   </tr>" +
                                 "                                   <tr>" +
                                  "                                      <td>25.12.18</td>" +
                                  "                                      <td><a href='#' class='showTip L2'>עו''ד טלי </a></td>" +
                                 "                                   </tr>" +
                                 "                               </table>" +
                            "</ul>" +
                        "</div>"; ;
            }


            return "<div id='card_" + row["id"] + "' class='card draggeble_object' style='width:" + cardWidth + "'>" +
                                "<div class='card-block'>" +

                                 "<h5 id='subtitle_" + row["id"] + "' style='direction:rtl;cursor:pointer' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "text" + '"' + ")'>" + rows[0]["text"] + "</h5>" +
                                                    "    </div>" +

                                                    "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "'>" +
                            "<input  type='text' class='form-control' id='title_input" + row["id"] + "' placeholder='Add Title' value='" + rows[0]["text"] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div>" +


                        "<div class='card-footer'>" +
                        stats + "<hr>" + controls +
                        "</div>" +
                        "</div>" + "</div>";




            //"<h5 id='subtitle_" + rows[0]["id"] + "' style='direction:rtl' class='card-title'>" + rows[0]["text"] + "</h5>" +
            /*System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.Append("{");

            sb.Append("id: ");
            sb.Append(row["id"]);
            sb.Append(", ");

            sb.Append("name: ");
            sb.Append("'" + row["dialog_type"] + "'");
            sb.Append(", ");

            string massage = rows[0]["text"];

            sb.Append("text: ");
            sb.Append("'" + massage + "'");
            sb.Append(", ");

            sb.Append("parent: ");
            sb.Append(row["parent_dialog_id"]);

            sb.Append("},");

            return sb.ToString();*/
        }

        return "";
    }


    private static string generateMessage_quick_replysTest(Dictionary<string, string> row)
    {
        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_quick_replys", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {
            //string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='org-del-button'></div></div>";
            string controls = generateHtmlControls(row);

            string stats = "<div class='twPc-divStats'>" +
                            "<ul class='twPc-Arrange'>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>visitors</span>" +
                                        "<span class='twPc-StatValue'>" + row["visitors"] + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>ab option</span>" +
                                        "<span class='twPc-StatValue'>" + "1" + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>percent</span>" +
                                       "<span class='twPc-StatValue'>" + row["uniques"] + "%</span>" +
                                    " </a>" +
                                "</li>" +
                            "</ul>" +
                        "</div>";
             stats = "";

            string html = "<div >";
            for (int i = 1; i < 6; i++)
            {
                string rowData = rows[0]["reply_text_" + i];
                if (rowData == "")
                {
                    rowData = "&nbsp;";
                }

                html += "<div  id='card_" + row["id"] + i + "' class='card'>" + "<h5 style='direction:rtl;cursor:pointer' id='subtitle_" + row["id"] + "-" + i + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + "-" + i + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "reply_text_" + i + '"' + ")' >" + rowData + "</h5><div id=reply_text_position_" + i + " class='org-add-button_quick_reply'>new</div>" +
                            "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "-" + i + "'>" +
                            "<input style='width:150px' type='text' class='form-control' id='title_input" + row["id"] + "-" + i + "' placeholder='Add Title' value='" + rows[0]["reply_text_" + i] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "-" + i + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "-" + i + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                            "</div></div>";



                // }
            }
            html += "</div>";


            return "<div id='card:" + row["id"] + "' class='draggeble_object card' style='width:300px'>" +
                        "<h5 style='dir:rtl' class='card-subtitle'>" + "" + "</h5>" +
                                    "<div class='card-block1'>" +
                                    html +
                        "</div>" +
                        "<div class='card-footer'>" +
                        stats + "<hr>" + controls +
                        "</div>" +
                        "</div></div>";


        }

        return "";


    }
    private static string generateMessage_quick_replys(Dictionary<string, string> row)
    {
        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_quick_replys", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {
            //string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='org-del-button'></div></div>";
            string controls = generateHtmlControls(row);

            string stats = "<div class='twPc-divStats'>" +
                            "<ul class='twPc-Arrange'>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>visitors</span>" +
                                        "<span class='twPc-StatValue'>" + row["visitors"] + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>ab option</span>" +
                                        "<span class='twPc-StatValue'>" + "1" + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>percent</span>" +
                                       "<span class='twPc-StatValue'>" + row["uniques"] + "%</span>" +
                                    " </a>" +
                                "</li>" +
                            "</ul>" +
                        "</div>";

            int totalUsers = -1;
            string html = "<div >";
            for (int i = 1; i < 11; i++)
            {
                string imageData = rows[0]["reply_icon_" + i] + "";
                string rankData = rows[0]["reply_rank_" + i] + "";
                string rowData = rows[0]["reply_text_" + i] + "";
                string userCountStyle = "";

                if (rowData == "")
                {
                    rowData = "&nbsp;";
                    rankData = "&nbsp;";

                }
                else if (rankData == "")
                {
                    rankData = "<img style='width:15px;height:15px' src='https://cdn3.iconfinder.com/data/icons/education-flat-circle-with-shadow-vol-2/150/counting__winners__podium__cubes__digits__ranking__puzzle-256.png' />";
                }
                else if (rankData != "")
                {
                    // we have rank data, get the statistics
                    //"background-image: linear-gradient( to right, lightskyblue, lightskyblue 15%, whitesmoke 15% );";

                    if (totalUsers == -1)
                    {
                        Dictionary<string, object> queryKeyAndValue1 = new Dictionary<string, object>();
                        queryKeyAndValue1.Add("parentNodeID", row["id"].ToString());
                        List<Dictionary<string, string>> rowsList1 = dbHandler.getTableData("Dialogs_Analytics", queryKeyAndValue1);
                        totalUsers = rowsList1.Count;
                    }

                    Dictionary<string, object> queryKeyAndValue = new Dictionary<string, object>();
                    queryKeyAndValue.Add("user_message", rowData);
                    List<Dictionary<string, string>> rowsList = dbHandler.getTableData("Dialogs_Analytics", queryKeyAndValue);

                    int numberOfUsers = rowsList.Count;

                    double f = ((double)numberOfUsers / (double)totalUsers);
                    f = Math.Round(f * 100);

                    userCountStyle = "style='background-image: linear-gradient( to right, lightskyblue, lightskyblue " + f + "%, whitesmoke " + f + "% );'";

                }

                html += "<div class='card' " + userCountStyle + ">" +

                    
                    "<table style='width:100%'>" +
                        "<tr>" +
                            "<td style='width:10%'>" +
                                "<div id='reply_text_position_1' class='org-add-button_quick_reply'>new</div>" +
                            "</td>" +
                            "<td style='width:80%;text-align:center'>" +
                                "<h5 style='direction:rtl;cursor:pointer;margin-bottom: 0rem;' id='subtitle_" + row["id"] + "-" + i + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + "-" + i + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "reply_text_" + i + '"' + ")' >" + rowData + "</h5>" +
                            "</td>" +
                            "<td style='width:10%'>" +
                                "<div id='reply_text_' class=''>" +
                                 "<h5 style='direction:rtl;cursor:pointer;margin-bottom: 0rem;' id='subtitle_rank_" + row["id"] + "-" + i + "' class='card-title' onClick='updateRankElement(" + '"' + row["id"] + "-" + i + '"' + "," + '"' + "subtitle_rank" + '"' + "," + '"' + "reply_rank_" + i + '"' + ")' >" + rankData + "</h5>" +
                                "</div>" +
                            "</td>" +
                        "</tr>" +
                    "</table>" +

                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "-" + i + "'>" +
                        "<input style='width:150px' type='text' class='form-control' id='title_input" + row["id"] + "-" + i + "' placeholder='Add Title' value='" + rows[0]["reply_text_" + i] + "'/>" +
                        "<a href='#' onClick='cancelText(" + '"' + row["id"] + "-" + i + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                        "<a href='#' onClick='updateText(" + '"' + row["id"] + "-" + i + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div></div>";

                // }
            }
            html += "</div>";


            return "<div id='card_" + row["id"] + "' class='draggeble_object card' style='width:300px'>" +
                        "<h5 style='dir:rtl' class='card-subtitle'>" + "" + "</h5>" +
                                    "<div class='card-block'>" +
                                    html +
                        "</div>" +
                        "<div class='card-footer'>" +
                        stats + "<hr>" + controls +
                        "</div>" +
                        "</div></div>";


        }

        return "";


    }
    private static string generateMessage_quick_replysBKK(Dictionary<string, string> row)
    {
        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_quick_replys", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {
            //string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='org-del-button'></div></div>";
            string controls = generateHtmlControls(row);

            string stats = "<div class='twPc-divStats'>" +
                            "<ul class='twPc-Arrange'>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>visitors</span>" +
                                        "<span class='twPc-StatValue'>" + row["visitors"] + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>ab option</span>" +
                                        "<span class='twPc-StatValue'>" + "1" + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>percent</span>" +
                                       "<span class='twPc-StatValue'>" + row["uniques"] + "%</span>" +
                                    " </a>" +
                                "</li>" +
                            "</ul>" +
                        "</div>";

            int totalUsers = -1;
            string html = "<div >";
            for (int i = 1; i < 6; i++)
            {
                string rankData = rows[0]["reply_rank_" + i];
                string rowData = rows[0]["reply_text_" + i];
                string userCountStyle = "";

                if (rowData == "")
                {
                    rowData = "&nbsp;";
                    rankData = "&nbsp;";
                    
                }
                else if (rankData == "")
                {
                    rankData = "<img style='width:15px;height:15px' src='https://cdn3.iconfinder.com/data/icons/education-flat-circle-with-shadow-vol-2/150/counting__winners__podium__cubes__digits__ranking__puzzle-256.png' />";
                }
                else if (rankData != "")
                {
                    // we have rank data, get the statistics
                    //"background-image: linear-gradient( to right, lightskyblue, lightskyblue 15%, whitesmoke 15% );";

                    if (totalUsers == -1)
                    {
                        Dictionary<string, object> queryKeyAndValue1 = new Dictionary<string, object>();
                        queryKeyAndValue1.Add("parentNodeID", row["id"].ToString());
                        List<Dictionary<string, string>> rowsList1 = dbHandler.getTableData("Dialogs_Analytics", queryKeyAndValue1);
                        totalUsers = rowsList1.Count;
                    }

                    Dictionary<string, object> queryKeyAndValue = new Dictionary<string, object>();
                    queryKeyAndValue.Add("user_message", rowData);
                    List<Dictionary<string, string>> rowsList = dbHandler.getTableData("Dialogs_Analytics", queryKeyAndValue);

                    int numberOfUsers = rowsList.Count;

                    double f = ((double)numberOfUsers / (double)totalUsers);
                    f = Math.Round(f * 100);
                    
                    userCountStyle = "style='background-image: linear-gradient( to right, lightskyblue, lightskyblue " + f+ "%, whitesmoke " + f + "% );'";

                }

                html += "<div class='card' "+ userCountStyle + ">" +

                    "<table style='width:100%'>" +
                        "<tr>" +
                            "<td style='width:10%'>" +                                
                                "<div id='reply_text_position_1' class='org-add-button_quick_reply'>new</div>" +
                            "</td>" +
                            "<td style='width:80%;text-align:center'>" +
                                "<h5 style='direction:rtl;cursor:pointer;margin-bottom: 0rem;' id='subtitle_" + row["id"] + "-" + i + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + "-" + i + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "reply_text_" + i + '"' + ")' >" + rowData + "</h5>" +
                            "</td>" +
                            "<td style='width:10%'>" +
                                "<div id='reply_text_' class=''>" +
                                 "<h5 style='direction:rtl;cursor:pointer;margin-bottom: 0rem;' id='subtitle_rank_" + row["id"] + "-" + i + "' class='card-title' onClick='updateRankElement(" + '"' + row["id"] + "-" + i + '"' + "," + '"' + "subtitle_rank" + '"' + "," + '"' + "reply_rank_" + i + '"' + ")' >" + rankData + "</h5>" +
                                "</div>" +
                            "</td>" +
                        "</tr>" +
                    "</table>" +
                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "-" + i + "'>" +
                        "<input style='width:150px' type='text' class='form-control' id='title_input" + row["id"] + "-" + i + "' placeholder='Add Title' value='" + rows[0]["reply_text_" + i] + "'/>" +
                        "<a href='#' onClick='cancelText(" + '"' + row["id"] + "-" + i + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                        "<a href='#' onClick='updateText(" + '"' + row["id"] + "-" + i + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div></div>";

                // }
            }
            html += "</div>";


            return "<div id='card_" + row["id"] + "' class='draggeble_object card' style='width:300px'>" +
                        "<h5 style='dir:rtl' class='card-subtitle'>" + "" + "</h5>" +
                                    "<div class='card-block'>" +
                                    html +
                        "</div>" +
                        "<div class='card-footer'>" +
                        stats + "<hr>" + controls +
                        "</div>" +
                        "</div></div>";


        }

        return "";


    }
    private static string generateMessage_quick_replysBK(Dictionary<string, string> row)
    {
        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_quick_replys", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {
            string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='org-del-button'></div></div>";
            string stats = "<div class='twPc-divStats'>" +
                            "<ul class='twPc-Arrange'>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>visitors</span>" +
                                        "<span class='twPc-StatValue'>" + row["visitors"] + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>ab option</span>" +
                                        "<span class='twPc-StatValue'>" + "1" + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>percent</span>" +
                                       "<span class='twPc-StatValue'>" + row["uniques"] + "%</span>" +
                                    " </a>" +
                                "</li>" +
                            "</ul>" +
                        "</div>";

            return "<div id='card_" + row["id"] + "' class='draggeble_object card' style='width:300px'>" +
                        "<h5 style='dir:rtl' class='card-subtitle'>" + "" + "</h5>" +
                                    "<div class='card-block'>" +
                        "<table><tr>" +
                        "<td>" + "<div class='card-block1'>" + "<h5 style='direction:rtl;cursor:pointer' id='subtitle_" + row["id"] + "-1" + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + "-1" + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "reply_text_1" + '"' + ")' >" + rows[0]["reply_text_1"] + "</h5><div class='org-add-button'>new</div>" +

                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "-1" + "'>" +
                            "<input style='width:150px' type='text' class='form-control' id='title_input" + row["id"] + "-1" + "' placeholder='Add Title' value='" + rows[0]["reply_text_1"] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "-1" + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "-1" + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div></div>" + "</td>" +

                        "<td>&nbsp&nbsp</td>" +
                        "<td>" + "<div class='card-block1'>" + "<h5 style='direction:rtl;cursor:pointer' id='subtitle_" + row["id"] + "_2" + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + "_2" + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "reply_text_2" + '"' + ")' >" + rows[0]["reply_text_2"] + "</h5>" +

                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "_2" + "'>" +
                            "<input style='width:150px' type='text' class='form-control' id='title_input" + row["id"] + "_2" + "' placeholder='Add Title' value='" + rows[0]["reply_text_2"] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "_2" + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "_2" + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div></div>" + "</td>" +

                        "<td>&nbsp&nbsp<td>" +
                        "<td>" + "<div class='card-block1'>" + "<h5 style='direction:rtl;cursor:pointer' id='subtitle_" + row["id"] + "_3" + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + "_3" + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "reply_text_3" + '"' + ")' >" + rows[0]["reply_text_3"] + "</h5>" +

                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "_3" + "'>" +
                            "<input style='width:150px' type='text' class='form-control' id='title_input" + row["id"] + "_3" + "' placeholder='Add Title' value='" + rows[0]["reply_text_3"] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "_3" + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "_3" + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div></div>" + "</td>" +

                        "<td>&nbsp&nbsp<td>" +
                        "<td>" + "<div class='card-block1'>" + "<h5 style='direction:rtl;cursor:pointer' id='subtitle_" + row["id"] + "_4" + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + "_4" + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "reply_text_4" + '"' + ")' >" + rows[0]["reply_text_4"] + "</h5>" +

                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "_4" + "'>" +
                            "<input style='width:150px' type='text' class='form-control' id='title_input" + row["id"] + "_4" + "' placeholder='Add Title' value='" + rows[0]["reply_text_4"] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "_4" + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "_4" + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div></div>" + "</td>" +

                         "<td>&nbsp&nbsp<td>" +
                        "<td>" + "<div class='card-block1'>" + "<h5 style='direction:rtl;cursor:pointer' id='subtitle_" + row["id"] + "_5" + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + "_5" + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "reply_text_5" + '"' + ")' >" + rows[0]["reply_text_5"] + "</h5>" +

                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "_5" + "'>" +
                            "<input style='width:150px' type='text' class='form-control' id='title_input" + row["id"] + "_5" + "' placeholder='Add Title' value='" + rows[0]["reply_text_5"] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "_5" + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "_5" + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div></div>" + "</td>" +

                        "</tr></table></div>" +
                        "<div class='card-footer'>" +
                        stats + "<hr>" + controls +
                        "</div>" +
                        "</div></div>";


        }

        return "";


    }

    private static string generateMessage_hero_reply(Dictionary<string, string> row)
    {
        //getHtmlByNodeType_HeroCard(title, subtitle, text, image_url, media_url, button_action_1_text, button_action_1_value)
        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_HeroCard", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {
            //string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='org-del-button'></div></div>";
            string controls = generateHtmlControls(row);

            string stats = "<div class='twPc-divStats'>" +
                           "<ul class='twPc-Arrange'>" +
                               "<li class='twPc-ArrangeSizeFit'>" +
                                   "<a href = '#' >" +
                                       "<span class='twPc-StatLabel twPc-block'>visitors</span>" +
                                       "<span class='twPc-StatValue'>" + row["visitors"] + "</span>" +
                                   "</a>" +
                               "</li>" +
                               "<li class='twPc-ArrangeSizeFit'>" +
                                   "<a href = '#' >" +
                                      "<span class='twPc-StatLabel twPc-block'>ab option</span>" +
                                        "<span class='twPc-StatValue'>" + "1" + "</span>" +
                                   "</a>" +
                               "</li>" +
                               "<li class='twPc-ArrangeSizeFit'>" +
                                   "<a href = '#' >" +
                                       "<span class='twPc-StatLabel twPc-block'>percent</span>" +
                                       "<span class='twPc-StatValue'>" + row["uniques"] + "%</span>" +
                                   " </a>" +
                               "</li>" +
                           "</ul>" +
                       "</div>";

            return "<div id='card_" + row["id"] + "' class='draggeble_object card text-right' style='width:" + cardWidth + "'  >" +
                        "<img style='max-width: 200px; max-height: 200px;' " +
                            "class='card-img-top' src='" + rows[0]["image_url"] + "' alt='Card image cap'>" +
                        "<div class='card-block'>" +
                        "<h4 id='title_" + row["id"] + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + '"' + "," + '"' + "title" + '"' + "," + '"' + "title" + '"' + ")' >" + rows[0]["title"] + "</h4>" +
                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "'>" +
                            "<input  type='text' class='form-control' id='title_input" + row["id"] + "' placeholder='Add Title' value='" + rows[0]["title"] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div>" +
                        "<h6 id='subtitle_" + row["id"] + "' class='card-subtitle mb-2 text-muted' onClick='updateTextElement(" + '"' + row["id"] + '"' + "," + '"' + "subtitle" + '"' + "," + '"' + "subtitle" + '"' + ")'>" + rows[0]["subtitle"] + "</h6>" +
                        "<p id='text_" + row["id"] + "' class='card-text' onClick='updateTextElement(" + '"' + row["id"] + '"' + "," + '"' + "text" + '"' + "," + '"' + "text" + '"' + ")'>" + rows[0]["text"] + "</p>" +
                        "<a href='" + rows[0]["button_action_1_value"] + "' class='btn btn-primary'>" + rows[0]["button_action_1_text"] + "</a>" +
                        "</div></br>" +
                        "<div class='card-footer'>" +
                        stats + "<hr>" + controls +
                        "</div>" +
                        "</div>";

            /* System.Text.StringBuilder sb = new System.Text.StringBuilder();
            + "," + '"' + "title" + '"'
             sb.Append("{");

             sb.Append("id: ");
             sb.Append(row["id"]);
             sb.Append(", ");

             sb.Append("name: ");
             sb.Append("'" + row["dialog_type"] + "'");
             sb.Append(", ");

             sb.Append("title: ");
             sb.Append("'" + rows[0]["title"] + "'");
             sb.Append(", ");

             sb.Append("subtitle: ");
             sb.Append("'" + rows[0]["subtitle"] + "'");
             sb.Append(", ");

             sb.Append("text: ");
             sb.Append("'" + rows[0]["text"] + "'");
             sb.Append(", ");

             sb.Append("image_url: ");
             sb.Append("'" + rows[0]["image_url"] + "'");
             sb.Append(", ");

             sb.Append("media_url: ");
             sb.Append("'" + rows[0]["media_url"] + "'");
             sb.Append(", ");

             sb.Append("button_action_1_text: ");
             sb.Append("'" + rows[0]["button_action_1_text"] + "'");
             sb.Append(", ");

             sb.Append("button_action_1_value: ");
             sb.Append("'" + rows[0]["button_action_1_value"] + "'");
             sb.Append(", ");


             sb.Append("parent: ");
             sb.Append(row["parent_dialog_id"]);

             sb.Append("},");

             return sb.ToString();*/
        }

        return "";


    }

    private static string generateMessage_Carousel(Dictionary<string, string> row)
    {
        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_quick_replys", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {
            //string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='org-del-button'></div></div>";
            string controls = generateHtmlControls(row);
            string stats = "<div class='twPc-divStats'>" +
                            "<ul class='twPc-Arrange'>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>visitors</span>" +
                                        "<span class='twPc-StatValue'>" + row["visitors"] + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>ab option</span>" +
                                        "<span class='twPc-StatValue'>" + "1" + "</span>" +
                                    "</a>" +
                                "</li>" +
                                "<li class='twPc-ArrangeSizeFit'>" +
                                    "<a href = '#' >" +
                                        "<span class='twPc-StatLabel twPc-block'>percent</span>" +
                                       "<span class='twPc-StatValue'>" + row["uniques"] + "%</span>" +
                                    " </a>" +
                                "</li>" +
                            "</ul>" +
                        "</div>";

            string[] delimeter = { ";a;" };
            string html = "<div style='width: 600px'>";
            for (int i = 1; i < 6; i++)
            {
                string rowData = rows[0]["reply_text_" + i];
                if (rowData != "")
                {
                    string[] items = rowData.Split(delimeter, StringSplitOptions.RemoveEmptyEntries);

                    string title = items[0].ToString();
                    if (title.Length > 30)
                        title = title.Substring(0, 27) + "...";


                    string description = items[1].ToString().Replace("'", "");
                    if (description.Length > 40)
                        description = description.Substring(0, 37) + "...";

                    html += "<div id='caruosel-item-html" + row["id"] + "' class='card' style='width: 200px;float:left'><img style='max-width:200px;max-height:200px;' class='card-img-top' src='" + items[2] + "' alt='Card image cap'><div class='card-block'><h4 class='card-title' style='direction: rtl;'>" + title + "</h4><p class='card-text' style='direction: rtl;'>" + description + "..." + "</p><a href='" + items[3].ToString() + "' class='btn btn-primary'>פתח</a></div></div>";
                }
            }
            html += "</div>";

            //return html;

            return "<div id='card_" + row["id"] + "' class='draggeble_object card' style='width:300px'>" +
                        html +
                        "<div class='card-footer'>" +
                        stats + "<hr>" + controls +
                        "</div>" +
                        "</div>";

            /*"<h4 id='title_" + row["id"] + "' class='card-title' onClick='updateTextElement(" + '"' + row["id"] + '"' + "," + '"' + "title" + '"' + ")' >" + rows[0]["title"] + "</h4>" +
                        "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + row["id"] + "'>" +
                            "<input  type='text' class='form-control' id='title_input" + row["id"] + "' placeholder='Add Title' value='" + rows[0]["title"] + "'/>" +
                            "<a href='#' onClick='cancelText(" + '"' + row["id"] + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                            "<a href='#' onClick='updateText(" + '"' + row["id"] + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                        "</div>" +*/

            /*stem.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.Append("{");

            sb.Append("id: ");
            sb.Append(row["id"]);
            sb.Append(", ");

            sb.Append("name: ");
            sb.Append("'" + row["dialog_type"] + "'");
            sb.Append(", ");

            sb.Append("option1: ");
            sb.Append("'" + rows[0]["reply_text_1"] + "'");
            sb.Append(", ");

            sb.Append("option2: ");
            sb.Append("'" + rows[0]["reply_text_2"] + "'");
            sb.Append(", ");

            sb.Append("option3: ");
            sb.Append("'" + rows[0]["reply_text_3"] + "'");
            sb.Append(", ");


            sb.Append("parent: ");
            sb.Append(row["parent_dialog_id"]);

            sb.Append("},");

            return sb.ToString()*/
        }

        return "";


    }

    private static string generateHtmlControls(Dictionary<string, string> row)
    {

        string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='twPc-StatLabel twPc-block'>id:" + "<a style='font-size: 20px;' href=''>" + row["id"] + "</a><br/> pid" + "<div id='" + row["id"] + ":" + row["parent_dialog_id"] + "' style='font-size: 20px;' class='update-parent-button' >" + row["parent_dialog_id"] +  "</div></div><div class='org-del-button'></div></div>";

        return controls;
    }

    [WebMethod]
    public static void addTreeNode(int tree_id, int parent_dialog_id, int dialog_type_id)
    {
        /*Dictionary<string, Object> values = new Dictionary<string, object>();

        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", dialog_type_id);
        values.Add("dialog_id", 1);

        dbHandler.addNewContent("Conversation_trees", values);*/
    }


    private static string getNewElementHtml()
    {
        int lastID = dbHandler.getLastAddedIndex("Conversation_trees");
        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", lastID, "id");

        if (rows != null && rows.Count == 1)
        {
            rows[0].Add("visitors", "0");
            rows[0].Add("blocked_visitors", "0");
            rows[0].Add("uniques", "0");
        }

        // get top parent node
        Node startingNode = getTreeNodes(rows);
        string html = getHtmlTree(startingNode);
        string paths = getHtmlTreePaths(startingNode, 1, 0);
        return html + "!!!!!" + paths;
    }

    [WebMethod]
    public static string addTreeNode_text(int tree_id, int parent_dialog_id, string message)
    {

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("type", 1);
        values.Add("text", message);
        dbHandler.addNewContent("Dialogs_text", values);
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_text");

        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", "1");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);

        return getNewElementHtml();

    }

    [WebMethod]
    public static string addTreeNode_quick_replys(int tree_id, int parent_dialog_id, string option1, string option2, string option3, string option4, string option5)
    {

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("type", 2);
        values.Add("reply_text_1", option1);
        values.Add("reply_text_2", option2);
        values.Add("reply_text_3", option3);
        values.Add("reply_text_4", option4);
        values.Add("reply_text_5", option5);
        dbHandler.addNewContent("Dialogs_quick_replys", values);
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_quick_replys");

        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", "2");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);

        return getNewElementHtml();
    }

    [WebMethod]
    public static string addTreeNode_quick_replys_facebook(int tree_id, int parent_dialog_id, 
        string option1, 
        string option2, 
        string option3, 
        string option4, 
        string option5, 
        string option6,
        string option7,
        string option8,
        string option9,
        string option10,
        string image1,
        string image2,
        string image3,
        string image4,
        string image5,
        string image6,
        string image7,
        string image8,
        string image9,
        string image10)
    {

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("type", 2);
        values.Add("reply_text_1", option1);
        values.Add("reply_text_2", option2);
        values.Add("reply_text_3", option3);
        values.Add("reply_text_4", option4);
        values.Add("reply_text_5", option5);
        values.Add("reply_text_6", option6);
        values.Add("reply_text_7", option7);
        values.Add("reply_text_8", option8);
        values.Add("reply_text_9", option9);
        values.Add("reply_text_10", option10);
        values.Add("reply_icon_1", image1);
        values.Add("reply_icon_2", image2);
        values.Add("reply_icon_3", image3);
        values.Add("reply_icon_4", image4);
        values.Add("reply_icon_5", image5);
        values.Add("reply_icon_6", image6);
        values.Add("reply_icon_7", image7);
        values.Add("reply_icon_8", image8);
        values.Add("reply_icon_9", image9);
        values.Add("reply_icon_10", image10);

        dbHandler.addNewContent("Dialogs_quick_replys", values);
        
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_quick_replys");

        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", "2");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);

        return getNewElementHtml();
    }


    [WebMethod]
    public static string addTreeNode_HeroCard(int tree_id, int parent_dialog_id
        , string title
        , string subtitle
        , string text
        , string image_url
        , string button_action_1_text
        , string button_action_1_value)
    {

        /*title = "GIFT CARD למגוון חנויות בקניוני עזריאלי החל מ-₪50";
        subtitle = "אין עוד מתנה כזאת! GIFT CARD למגוון חנויות בקניוני עזריאלי החל מ-₪50 - משלוח חינם";
        text = "שובר כספי למגוון חנויות בקניוני עזריאלי. יש הזדמנויות שאסור לפספס! כזו היא ההזדמנות לרכוש כרטיס מתנה של עזריאלי Gift Card למגוון חנויות בקניוני עזריאלי התקף בלמעלה מ-50 מותגים פופולאריים ורשתות נבחרות! קשה לבחור איפה לנצל את השובר? שימו לב שלא חייבים לנצל את כולו במקום אחד, ואפשר לנצל חלק מהסכום ברשת אחת ולהמשיך לקניות ברשת הבאה.";
        image_url = "https://cdn.buy2v.co.il/Placement/0e750322-36a2-49ed-8b09-5df9f711f9ce/2b224b25.jpg";
        button_action_1_text = "פרטים נוספים";
        button_action_1_value = "https://www.azrieli.com/o/88c7a08f-24c2-4bbb-857d-1704f136195e?Preview=YES&utm_source=activetrail&utm_medium=email&utm_campaign=AZ_MORNING_GROUPA_090317&_atscid=2_4162_56256620_2738809_0_Tfwxfwwxx2cs2ccss#_at=0.2.2738809,0.56256620.fwxfwwxx2cs2ccss";
        */

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("type", 3);
        values.Add("title", title);
        values.Add("subtitle", subtitle);
        values.Add("text", text);
        values.Add("image_url", image_url);
        values.Add("button_action_1_text", button_action_1_text);
        values.Add("button_action_1_value", button_action_1_value);


        dbHandler.addNewContent("Dialogs_HeroCard", values);
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_HeroCard");

        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", "3");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);

        return getNewElementHtml();
    }

    [WebMethod]
    public static string addTreeNode_VideoCard(int tree_id, int parent_dialog_id
        , string title
        , string subtitle
        , string text
        , string image_url
        , string media_url
        , string button_action_1_text
        , string button_action_1_value)
    {

        /*title = "Big Buck Bunny";
        subtitle = "by the Blender Institute";
        text = "Big Buck Bunny (code-named Peach) is a short computer-animated comedy film by the Blender Institute.";
        image_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Big_buck_bunny_poster_big.jpg/220px-Big_buck_bunny_poster_big.jpg";
        media_url = "http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4";
        button_action_1_text = "Learn More";
        button_action_1_value = "https://peach.blender.org/";
        */

        /*new VideoCard
                {
                    Title = "Big Buck Bunny",
                    Subtitle = "by the Blender Institute",
                    Text = "Big Buck Bunny (code-named Peach) is a short computer-animated comedy film by the Blender Institute, part of the Blender Foundation. Like the foundation's previous film Elephants Dream, the film was made using Blender, a free software application for animation made by the same foundation. It was released as an open-source film under Creative Commons License Attribution 3.0.",
                    Image = new ThumbnailUrl
                    {
                        Url = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Big_buck_bunny_poster_big.jpg/220px-Big_buck_bunny_poster_big.jpg"
                    },
                    Media = new List<MediaUrl>
                    {
                        new MediaUrl()
                        {
                            Url = "http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"
                        }
                    },
                    Buttons = new List<CardAction>
                    {
                        new CardAction()
                        {
                            Title = "Learn More",
                            Type = ActionTypes.OpenUrl,
                            Value = "https://peach.blender.org/"
                        }
                    }
                }*/

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("type", 4);
        values.Add("title", title);
        values.Add("subtitle", subtitle);
        values.Add("text", text);
        values.Add("image_url", image_url);
        values.Add("media_url", image_url);
        values.Add("button_action_1_text", button_action_1_text);
        values.Add("button_action_1_value", button_action_1_value);


        dbHandler.addNewContent("Dialogs_HeroCard", values);
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_HeroCard");

        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", "4");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);

        return getNewElementHtml();
    }

    [WebMethod]
    public static string addTreeNode_AudioCard(int tree_id, int parent_dialog_id
        , string title
        , string subtitle
        , string text
        , string image_url
        , string media_url
        , string button_action_1_text
        , string button_action_1_value)
    {

        /*title = "I am your father";
        subtitle = "Star Wars: Episode V - The Empire Strikes Back";
        text = "The Empire Strikes Back (also known as Star Wars: Episode V – The Empire Strikes Back) is a 1980 American epic.";
        image_url = "https://upload.wikimedia.org/wikipedia/en/3/3c/SW_-_Empire_Strikes_Back.jpg";
        media_url = "http://www.wavlist.com/movies/004/father.wav";
        button_action_1_text = "Read More";
        button_action_1_value = "https://en.wikipedia.org/wiki/The_Empire_Strikes_Back";
        */
        /* new AudioCard
                {
                    Title = "I am your father",
                    Subtitle = "Star Wars: Episode V - The Empire Strikes Back",
                    Text = "The Empire Strikes Back (also known as Star Wars: Episode V – The Empire Strikes Back) is a 1980 American epic space opera film directed by Irvin Kershner.",
                    Image = new ThumbnailUrl
                    {
                        Url = "https://upload.wikimedia.org/wikipedia/en/3/3c/SW_-_Empire_Strikes_Back.jpg"
                    },
                    Media = new List<MediaUrl>
                    {
                        new MediaUrl()
                        {
                            Url = "http://www.wavlist.com/movies/004/father.wav"
                        }
                    },
                    Buttons = new List<CardAction>
                    {
                        new CardAction()
                        {
                            Title = "Read More",
                            Type = ActionTypes.OpenUrl,
                            Value = "https://en.wikipedia.org/wiki/The_Empire_Strikes_Back"
                        }
                    }
                }*/

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("type", 8);
        values.Add("title", title);
        values.Add("subtitle", subtitle);
        values.Add("text", text);
        values.Add("image_url", image_url);
        values.Add("media_url", image_url);
        values.Add("button_action_1_text", button_action_1_text);
        values.Add("button_action_1_value", button_action_1_value);


        dbHandler.addNewContent("Dialogs_HeroCard", values);
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_HeroCard");

        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", "8");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);

        return getNewElementHtml();
    }

    [WebMethod]
    public static string addTreeNode_AnimationCard(int tree_id, int parent_dialog_id
        , string title
        , string subtitle
        , string text
        , string image_url
        , string media_url
        , string button_action_1_text
        , string button_action_1_value)
    {

        /*title = "emoji kiss";
        subtitle = "i love you";
        text = "";
        image_url = "http://pix.iemoji.com/images/emoji/apple/ios-9/256/face-throwing-a-kiss.png";
        media_url = "http://i.giphy.com/Ki55RUbOV5njy.gif";
        button_action_1_text = "Read More";
        button_action_1_value = "https://en.wikipedia.org/wiki/The_Empire_Strikes_Back";
        */
        /* Title = "emoji kiss",
                    Subtitle = "i love you",
                    Image = new ThumbnailUrl
                    {
                        Url = "http://pix.iemoji.com/images/emoji/apple/ios-9/256/face-throwing-a-kiss.png"
                    },
                    Media = new List<MediaUrl>
                    {
                        new MediaUrl()
                        {
                            Url = "https://m.popkey.co/2d913b/az1lx_f-maxage-0_s-200x150.gif?c=popkey-web&p=popkey&i=emoji--reactions&l=featured&f=.gif"
                        }
                    }
                }*/

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("type", 7);
        values.Add("title", title);
        values.Add("subtitle", subtitle);
        values.Add("text", text);
        values.Add("image_url", image_url);
        values.Add("media_url", image_url);
        values.Add("button_action_1_text", button_action_1_text);
        values.Add("button_action_1_value", button_action_1_value);


        dbHandler.addNewContent("Dialogs_HeroCard", values);
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_HeroCard");

        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", "7");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);

        return getNewElementHtml();
    }


    [WebMethod]
    public static string addTreeNode_Caruosel(int tree_id, int parent_dialog_id
       , string data)
    {

        /*title = "GIFT CARD למגוון חנויות בקניוני עזריאלי החל מ-₪50";
        subtitle = "אין עוד מתנה כזאת! GIFT CARD למגוון חנויות בקניוני עזריאלי החל מ-₪50 - משלוח חינם";
        text = "שובר כספי למגוון חנויות בקניוני עזריאלי. יש הזדמנויות שאסור לפספס! כזו היא ההזדמנות לרכוש כרטיס מתנה של עזריאלי Gift Card למגוון חנויות בקניוני עזריאלי התקף בלמעלה מ-50 מותגים פופולאריים ורשתות נבחרות! קשה לבחור איפה לנצל את השובר? שימו לב שלא חייבים לנצל את כולו במקום אחד, ואפשר לנצל חלק מהסכום ברשת אחת ולהמשיך לקניות ברשת הבאה.";
        image_url = "https://cdn.buy2v.co.il/Placement/0e750322-36a2-49ed-8b09-5df9f711f9ce/2b224b25.jpg";
        button_action_1_text = "פרטים נוספים";
        button_action_1_value = "https://www.azrieli.com/o/88c7a08f-24c2-4bbb-857d-1704f136195e?Preview=YES&utm_source=activetrail&utm_medium=email&utm_campaign=AZ_MORNING_GROUPA_090317&_atscid=2_4162_56256620_2738809_0_Tfwxfwwxx2cs2ccss#_at=0.2.2738809,0.56256620.fwxfwwxx2cs2ccss";
        */

        string[] delimiter = { ";a;" };
        string[] lastdelimiter = { ";z;" };


        string[] items = data.Split(lastdelimiter, StringSplitOptions.RemoveEmptyEntries);




        int count = 1;
        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("type", 5);
        foreach (string item in items)
        {
            values.Add("reply_text_" + count, item.Replace("'", ""));
            count++;
            if (count > 5)
                break;
        }
        dbHandler.addNewContent("Dialogs_quick_replys", values);
        int lastAddedIndex = dbHandler.getLastAddedIndex("Dialogs_quick_replys");


        values = new Dictionary<string, object>();
        values.Add("tree_id", tree_id);
        values.Add("parent_dialog_id", parent_dialog_id);
        values.Add("dialog_type", "5");
        values.Add("dialog_id", lastAddedIndex);
        dbHandler.addNewContent("Conversation_trees", values);

        return getNewElementHtml();
    }


    [WebMethod]
    public static void deleteTreeNode(int tree_id, int dialog_id)
    {
        Dictionary<string, Object> values = new Dictionary<string, object>();

        //values.Add("tree_id", tree_id);
        values.Add("id", dialog_id);

        dbHandler.deleteContent("Conversation_trees", values);



    }

    [WebMethod]
    public static string updateTreeNode(int dialog_id, string field, string editedText)
    {
        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", dialog_id);
        bool updated = false;

        foreach (Dictionary<string, string> row in rows)
        {
            //if (row["dialog_id"] == dialog_id.ToString()) {

            string tableName = "";

            Dictionary<string, object> queryKeyAndValue = null;
            queryKeyAndValue = new Dictionary<string, object>();
            queryKeyAndValue.Add("id", int.Parse(row["dialog_id"]));


            Dictionary<string, object> fieldsAndValues = null;
            fieldsAndValues = new Dictionary<string, object>();


            if (row["dialog_type"] == dialog_type_text)
            {
                tableName = "Dialogs_text";
                fieldsAndValues.Add(field, editedText);
            }
            else if (row["dialog_type"] == dialog_type_quick_replys)
            {
                tableName = "Dialogs_quick_replys";
                fieldsAndValues.Add(field, editedText);
            }
            else
            {
                tableName = "Dialogs_HeroCard";
                fieldsAndValues.Add(field, editedText);
            }

            updated = dbHandler.updateContent(tableName, queryKeyAndValue, fieldsAndValues);
            break;
            //}
        }

        return updated.ToString();
    }

    [WebMethod]
    public static string updateUserPreferences(string user_id, string pref_data)
    {
        List<Dictionary<string, string>> rows = dbHandler.getTableData("users_prefs", "bot_user_id", user_id);
        bool updated = false;
        if (rows.Count > 0)
        {
            // there is a row for this user, do update
            Dictionary<string, object> queryKeyAndValue = null;
            queryKeyAndValue = new Dictionary<string, object>();
            queryKeyAndValue.Add("id", int.Parse(rows[0]["id"]));


            Dictionary<string, object> fieldsAndValues = null;
            fieldsAndValues = new Dictionary<string, object>();
            fieldsAndValues.Add("user_prefs", pref_data);

            updated = dbHandler.updateContent("users_prefs", queryKeyAndValue, fieldsAndValues);
        }
        else
        {
            // there is no row, do insert.
            Dictionary<string, object> fieldsAndValues = null;
            fieldsAndValues = new Dictionary<string, object>();
            fieldsAndValues.Add("bot_user_id", user_id);
            fieldsAndValues.Add("user_prefs", pref_data);

            updated = dbHandler.addNewContent("users_prefs", fieldsAndValues);

        }

        return updated.ToString();
    }

    
    [WebMethod]
    public static string getUserPreferences(string user_id)
    {
        List<Dictionary<string, string>> rows = dbHandler.getTableData("users_prefs", "bot_user_id", user_id);
        string retval = "";
        if (rows.Count > 0)
        {
            retval = rows[0]["user_prefs"];
        }

        return retval;
    }

    [WebMethod]
    public static string addNewRecipe(string recipe_data)
    {

        string[] delimiter = { ";z;" };

        string[] vals = recipe_data.Split(delimiter, StringSplitOptions.None);
        string url = vals[3];
        if (url != "")
        {
            List<Dictionary<string, string>> rows = dbHandler.getTableData("recipe_tags", "recipe_url", url);
            if (rows.Count > 0)
            {
                return "false";
            }
            else
            {
                Dictionary<string, Object> values = new Dictionary<string, object>();
                values.Add("recipe_url", vals[3]);
                values.Add("recipe_tags", vals[4]);
                values.Add("recipe_title", vals[0]);
                values.Add("recipe_description", vals[1]);
                values.Add("recipe_image_url", vals[2]);

                bool isAdded = dbHandler.addNewContent("recipe_tags", values);

                return isAdded.ToString();
            }
        }

        return "false";
    }

    [WebMethod]
    public static string updateRecipeTags(string row_id, string recipe_data)
    {
        Dictionary<string, Object> query_values = new Dictionary<string, object>();
        query_values.Add("id", int.Parse(row_id));

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("recipe_tags", recipe_data);

        bool isAdded = dbHandler.updateContent("recipe_tags", query_values, values);

        return isAdded.ToString();
    }

    public static string getUserFavorits(string user_id)
    {
        List<Dictionary<string, string>> rows = dbHandler.getTableData("users_favorits", "user_bot_id", user_id);
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        if (rows.Count > 0)
        {
            

            sb.Append("<div style='overflow-y:auto;height:310px;'>");
            //sb.Append("<div style='overflow-y: scroll'>");
            sb.Append("<table style='width=100%'>");
            
            //<table style="width=100%">
            //retval = rows[0]["user_prefs"];
            //retval = rows.Count.ToString();

            foreach (Dictionary<string, string> row in rows)
            {
                List<Dictionary<string, string>> fav_rows = dbHandler.getTableData("recipe_tags", "id", int.Parse(row["recipe_id"]));

                if (fav_rows.Count >0)
                {
                    sb.Append("<tr><td>");
                    sb.Append("<a href='" + fav_rows[0]["recipe_url"].ToString() + "'><table style='width=100%;margin-bottom:10px'>");
                    sb.Append("<tr>");

                    //sb.Append("<td><table><tr><td style='font-size: 120%;font-weight: bold;direction:rtl;padding-right:10px;vertical-align: text-top;height:80px'>" + fav_rows[0]["recipe_title"].ToString() + "</td></tr><tr><td><img  width='21px' height='29px' src='https://lbi.co.il/projects/QuakerBotAdmin/images/remove_recipe_icon.png' /> </td></tr></table></td>");
                    sb.Append("<td style='font-family: Ariel;font-size: 130%;font-weight: bold;direction:rtl;padding-right:10px;vertical-align: text-top;color:black'>" + fav_rows[0]["recipe_title"].ToString() + "</td>");

                    // image
                    sb.Append("<td><img style='border-radius:15px;'  width='150px' height='125px' src='" + fav_rows[0]["recipe_image_url"].ToString() + "' /> </td>");

                    sb.Append("</tr>");
                    sb.Append("</a></table>");
                    sb.Append("</td></tr>");
                }
                
            }

            sb.Append("</table></div>");
        }

        return sb.ToString();
    }

    public static string addFavoritRecipe(string user_id, string recipe_id)
    {
        // check that the user didn't add this recipe before
        Dictionary<string, Object> query_values = new Dictionary<string, object>();
        query_values.Add("user_bot_id", user_id);
        query_values.Add("recipe_id", int.Parse(recipe_id));

        List<Dictionary<string, string>> rows = dbHandler.getTableData("users_favorits", query_values);
        if (rows.Count == 0)
        {
            Dictionary<string, Object> values = new Dictionary<string, object>();
            values.Add("user_bot_id", user_id);
            values.Add("recipe_id", int.Parse(recipe_id));

            bool isAdded = dbHandler.addNewContent("users_favorits", values);

            return isAdded.ToString();
        }
        
        return "false";
    }



    [WebMethod]
    public static string updateNodes(string tree_id, string updatedValues)
    {
        string[] nodes = updatedValues.Split(':');

        string node_id = nodes[0];
        string new_parent_id = nodes[3];

        Dictionary<string, Object> query_values = new Dictionary<string, object>();
        query_values.Add("id", int.Parse(node_id));

        Dictionary<string, Object> values = new Dictionary<string, object>();
        values.Add("parent_dialog_id", int.Parse(new_parent_id));

        bool isAdded = dbHandler.updateContent("Conversation_trees", query_values, values);

        return isAdded.ToString();

    }


    private static string createMessage_text(Dictionary<string, string> row)
    {


        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_text", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.Append("{");

            sb.Append("id: ");
            sb.Append(row["id"]);
            sb.Append(", ");

            sb.Append("name: ");
            sb.Append("'" + row["dialog_type"] + "'");
            sb.Append(", ");

            string massage = rows[0]["text"];

            sb.Append("text: ");
            sb.Append("'" + massage + "'");
            sb.Append(", ");

            sb.Append("parent: ");
            sb.Append(row["parent_dialog_id"]);

            sb.Append("},");

            return sb.ToString();// "{ id: " + row["id"] + ", name: '" + row["dialog_type"] + "', parent: " + row["parent_dialog_id"] + " },";
        }

        return "";
    }

    private static string createMessage_quick_replys(Dictionary<string, string> row)
    {
        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_quick_replys", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.Append("{");

            sb.Append("id: ");
            sb.Append(row["id"]);
            sb.Append(", ");

            sb.Append("name: ");
            sb.Append("'" + row["dialog_type"] + "'");
            sb.Append(", ");

            sb.Append("option1: ");
            sb.Append("'" + rows[0]["reply_text_1"] + "'");
            sb.Append(", ");

            sb.Append("option2: ");
            sb.Append("'" + rows[0]["reply_text_2"] + "'");
            sb.Append(", ");

            sb.Append("option3: ");
            sb.Append("'" + rows[0]["reply_text_3"] + "'");
            sb.Append(", ");

            sb.Append("option4: ");
            sb.Append("'" + rows[0]["reply_text_4"] + "'");
            sb.Append(", ");

            sb.Append("option5: ");
            sb.Append("'" + rows[0]["reply_text_5"] + "'");
            sb.Append(", ");

            sb.Append("parent: ");
            sb.Append(row["parent_dialog_id"]);

            sb.Append("},");

            return sb.ToString();// "{ id: " + row["id"] + ", name: '" + row["dialog_type"] + "', parent: " + row["parent_dialog_id"] + " },";
        }

        return "";


    }

    private static string createMessage_hero_reply(Dictionary<string, string> row)
    {
        //getHtmlByNodeType_HeroCard(title, subtitle, text, image_url, media_url, button_action_1_text, button_action_1_value)
        Dictionary<string, Object> values = new Dictionary<string, object>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Dialogs_HeroCard", "id", int.Parse(row["dialog_id"]));
        if (rows.Count > 0)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.Append("{");

            sb.Append("id: ");
            sb.Append(row["id"]);
            sb.Append(", ");

            sb.Append("name: ");
            sb.Append("'" + row["dialog_type"] + "'");
            sb.Append(", ");

            sb.Append("title: ");
            sb.Append("'" + rows[0]["title"] + "'");
            sb.Append(", ");

            sb.Append("subtitle: ");
            sb.Append("'" + rows[0]["subtitle"] + "'");
            sb.Append(", ");

            sb.Append("text: ");
            sb.Append("'" + rows[0]["text"] + "'");
            sb.Append(", ");

            sb.Append("image_url: ");
            sb.Append("'" + rows[0]["image_url"] + "'");
            sb.Append(", ");

            sb.Append("media_url: ");
            sb.Append("'" + rows[0]["media_url"] + "'");
            sb.Append(", ");

            sb.Append("button_action_1_text: ");
            sb.Append("'" + rows[0]["button_action_1_text"] + "'");
            sb.Append(", ");

            sb.Append("button_action_1_value: ");
            sb.Append("'" + rows[0]["button_action_1_value"] + "'");
            sb.Append(", ");


            sb.Append("parent: ");
            sb.Append(row["parent_dialog_id"]);

            sb.Append("},");

            return sb.ToString();// "{ id: " + row["id"] + ", name: '" + row["dialog_type"] + "', parent: " + row["parent_dialog_id"] + " },";
        }

        return "";


    }

    [WebMethod]
    public static string setDefaultConversationTree(int tree_id)
    {
        List<Dictionary<string, string>> rows = dbHandler.getTableData("System_bot_app_ids", "is_active", 1);


        // 
        Dictionary<string, object> queryKeyAndValue = null;
        queryKeyAndValue = new Dictionary<string, object>();
        queryKeyAndValue.Add("id", int.Parse(rows[0]["id"]));

        Dictionary<string, object> fieldsAndValues = null;
        fieldsAndValues = new Dictionary<string, object>();
        fieldsAndValues.Add("is_active", 0);

        dbHandler.updateContent("System_bot_app_ids", queryKeyAndValue, fieldsAndValues);



        queryKeyAndValue = null;
        queryKeyAndValue = new Dictionary<string, object>();
        queryKeyAndValue.Add("id", tree_id);

        fieldsAndValues = null;
        fieldsAndValues = new Dictionary<string, object>();
        fieldsAndValues.Add("is_active", 1);

        dbHandler.updateContent("System_bot_app_ids", queryKeyAndValue, fieldsAndValues);

        return "tree " + tree_id + " is active.";
    }
}