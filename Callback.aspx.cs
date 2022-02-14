using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
//using System.Web.Script.Serialization;
//using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;
using System.Net;
using Newtonsoft.Json;
using System.Collections;
using System.Configuration;
//using DialogsUtils;
//using QuakerBotApplication.Dialogs;
using System.Threading;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Text.RegularExpressions;
using System.Web.Services;
//using System.Web.Script.Serialization;

public partial class Callback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    [WebMethod]
    public static string get_response(string user_id, string conversation_id, string selected_node_id)
    {



        GenericMessage userMessage = new GenericMessage(user_id, conversation_id, selected_node_id);
        try
        {

            //get the tree_id associated with this bot id
            int tree_id = int.Parse(conversation_id);// getTreeId();


            Node CurrentNode = null;
            string CurrentNodeID = selected_node_id;// "";


            if (isStartConversation(userMessage))
            {
                // get the user name from facebook
                //FacebookServiceFunctions facebookServiceFunctions = new FacebookServiceFunctions();
                //ClUser user = facebookServiceFunctions.GetUserData(token, userMessage.senderID);

                // the user pressed the start button and starting new conversation                       
                CurrentNode = getWelcomeMessages(userMessage, tree_id, "");
                CurrentNodeID = CurrentNode.NodeID();
            }
            else
            {
                // check whether we are reacting to a click of a trigger
                //CurrentNode = IsTriggerPressed(userMessage, ref CurrentNodeID);

                // send isTyping to the user            
                //await context.PostAsync(createIsTypingReply(activity, context));

                if (CurrentNodeID != "")
                {
                    // extract the Triggered Node according to recived text
                    List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", int.Parse(CurrentNodeID));
                    if (rows.Count > 0)
                    {
                        Dictionary<string, string> conversationTreeRow = rows[0];
                        Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
                        CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);
                    }
                }
                else if (CurrentNodeID == "" && CurrentNode == null && userMessage.text != "")
                {
                    // get the user name from facebook
                    /*FacebookServiceFunctions facebookServiceFunctions = new FacebookServiceFunctions();
                    ClUser user = facebookServiceFunctions.GetUserData(token, userMessage.senderID);*/

                    // respond to user free text
                    bool responded = respondToUserFreeText(tree_id, "", userMessage, null);
                    if (!responded)
                    {
                        // somthing is wrong, start over
                        CurrentNode = getWelcomeMessages(userMessage, tree_id, "");
                        CurrentNodeID = CurrentNode.NodeID();
                    }
                    //return;
                }
                else if (CurrentNodeID == "" && CurrentNode == null)
                {
                    // somthing is wrong, start over
                    CurrentNode = getWelcomeMessages(userMessage, tree_id, "");
                    CurrentNodeID = CurrentNode.NodeID();
                }
            }

            // create all replay (recursia) 
            List<Node_Response> replys = createReplys(userMessage, CurrentNode, ref CurrentNodeID, tree_id);

            return JsonConvert.SerializeObject(replys);





        }
        catch (Exception ex)
        {
            string reply = null;// FacebookReplyCreator.createReply_text(null, "מתנצל, קרתה שגיאה.");
                                // post to facebook
                                //postToFacebook(userMessage, 0, new List<string>() { reply });

            //user_id = userMessage.senderID;
            //deleyed_CurrentNodeID = "258";
            //Timer timer = new Timer(generateDelayedResponse);
            //timer.Change(500, Timeout.Infinite);

            /*string reply = FacebookReplyCreator.createReply_text(userMessage, ex.ToString());
            // post to facebook
            postToFacebook(userMessage, 0, new List<string>() { reply });
            throw;*/
            return "";
        }




    }

    [WebMethod]
    public static string save_html_tree(string user_id, string conversation_id, string html_tree, string unique_conversation_id, string danger_count, string law_raw_text, string relevant_verdicts, string relevant_extentions, string relevant_danger_links)
    {


        List<Dictionary<string, string>> rows = dbHandler.getTableData("Agmon_Law_html_trees", "unique_conversation_id", unique_conversation_id);
        Node_Response response = new Node_Response();

        if (rows.Count == 1)
        {
            Dictionary<string, object> values = new Dictionary<string, object>();
            values.Add("user_id", user_id);
            values.Add("conversation_id", conversation_id);
            values.Add("unique_conversation_id", unique_conversation_id);
            values.Add("danger_count", danger_count);


            values.Add("html_tree", html_tree.Replace("'", "$$$"));
            values.Add("law_raw_text", law_raw_text.Replace("'", "$$$"));
            values.Add("relevant_verdicts", relevant_verdicts.Replace("'", "$$$"));
            values.Add("relevant_extentions", relevant_extentions.Replace("'", "$$$"));
            values.Add("relevant_danger_links", relevant_danger_links.Replace("'", "$$$"));
            values.Add("dateTime", DateTime.Now.ToString());

            Dictionary<string, object> queryValues = new Dictionary<string, object>();
            queryValues.Add("unique_conversation_id", rows[0]["unique_conversation_id"]);

            return dbHandler.updateContent("Agmon_Law_html_trees", queryValues, values).ToString();
        }
        else
        {
            // add new convesation
            Dictionary<string, object> values = new Dictionary<string, object>();
            values.Add("user_id", user_id);
            values.Add("conversation_id", conversation_id);
            values.Add("unique_conversation_id", unique_conversation_id);
            values.Add("danger_count", danger_count);


            values.Add("html_tree", html_tree.Replace("'", "$$$"));
            values.Add("law_raw_text", law_raw_text.Replace("'", "$$$"));
            values.Add("relevant_verdicts", relevant_verdicts.Replace("'", "$$$"));
            values.Add("relevant_extentions", relevant_extentions.Replace("'", "$$$"));
            values.Add("relevant_danger_links", relevant_danger_links.Replace("'", "$$$"));
            values.Add("dateTime", DateTime.Now.ToString());

            return dbHandler.addNewContent("Agmon_Law_html_trees", values).ToString();
        }
    }

    [WebMethod]
    public static string get_saved_html_tree(string unique_conversation_id)
    {

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Agmon_Law_html_trees", "unique_conversation_id", unique_conversation_id);
        Node_Response response = new Node_Response();

        if (rows.Count == 1)
        {
            response.html_tree = rows[0]["html_tree"].Replace("$$$", "'");
            response.law_raw_text = rows[0]["law_raw_text"].Replace("$$$", "'");
            response.relevant_verdicts = rows[0]["relevant_verdicts"].Replace("$$$", "'");
            response.relevant_extentions = rows[0]["relevant_extentions"].Replace("$$$", "'");
            response.relevant_danger_links = rows[0]["relevant_danger_links"].Replace("$$$", "'");
        }

        return JsonConvert.SerializeObject(response);

    }


    private static List<Node_Response> createReplys(GenericMessage user_message, Node CurrentNode, ref string CurrentNodeID, int tree_id)
    {
        List<Node_Response> list = new List<Node_Response>();

        Node_Response reply = null;

        if (CurrentNode == null)
        {
            return list;
        }

        if (CurrentNode.getNodeType() == DialogsGetter.dialog_type_text)
        {
            string message = CurrentNode.data[DialogsGetter.prefix_card_details + "text"];

            if (message.StartsWith("DCconnector:"))
            {

                // this is a connector between different trees
                CurrentNodeID = message.Replace("DCconnector:", "").Trim();

                // extract the Triggered Node according to recived text
                List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", int.Parse(CurrentNodeID));
                if (rows.Count > 0)
                {
                    Dictionary<string, string> conversationTreeRow = rows[0];
                    Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
                    if (cardDetailsRow != null)
                    {
                        CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);

                        return createReplys(user_message, CurrentNode, ref CurrentNodeID, tree_id);

                    }

                }
            }

            reply = ReplayCreator.createReply_text(user_message, message);
            attach_law_data(CurrentNode, ref reply);


        }
        else if (CurrentNode.getNodeType() == DialogsGetter.dialog_type_quick_replys)
        {

            reply = ReplayCreator.createReply_quick_replys(user_message, CurrentNode.data); ;

            //reply.quick_replys = new string[] { "option 1", "option 2", "option 3", "option 4" };
            //reply.quick_replys_payload = new string[] { "node_id_1", "node_id_2", "node_id_3", "node_id_4" };
            //reply.response_type = "quick_replys";

            //FacebookReplyCreator.createReply_quick_replys(user_message, CurrentNode.data, ref conversation_state_data, message);

        }
        else if (CurrentNode.getNodeType() == DialogsGetter.dialog_type_caruosel)
        {
            reply = null;//FacebookReplyCreator.createReply_Carousel(user_message, CurrentNode.data);
        }
        else
        {
            /*reply = activity.CreateReply();
            string message = "NYI createReplys()";
            reply = activity.CreateReply(message);
            reply.Type = ActivityTypes.Message;
            reply.TextFormat = TextFormatTypes.Plain;*/
            //reply = FacebookReplyCreator.MakeTextMessageJson("NYI createReplys()", user_message.senderID);
        }


        list.Add(reply);

        string updatedCurrentNodeID = updateCurrentNodeID(CurrentNodeID);

        //updateAnalytics(user_message, CurrentNode.ParentNodeID(), CurrentNodeID, "", tree_id);

        if (updatedCurrentNodeID != CurrentNodeID)
        {
            if (updatedCurrentNodeID != "-1")
            {
                CurrentNodeID = updatedCurrentNodeID;
                List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", int.Parse(CurrentNodeID));
                if (rows.Count > 0)
                {
                    Dictionary<string, string> conversationTreeRow = rows[0];
                    Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
                    CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);
                    list.AddRange(createReplys(user_message, CurrentNode, ref CurrentNodeID, tree_id));

                }
            }
            else if (updatedCurrentNodeID == "-1")
            {

                //list.AddRange(restartConversation(tree_id, user_message, ref conversation_state_data, "איך תרצה להמשיך?"));

                string message = "האנליזה הסתיימה. לחץ על הלינק הבא למעבר ל<br /><a href='ClientsManagment.aspx' >ממשק פריסת סיכונים </a>";
                
                list.Add(ReplayCreator.createReply_text(user_message, message));

                message = "או <br /><a href='ChatPage.aspx?conversation_id=6' >התחל מחדש </a>";

                list.Add(ReplayCreator.createReply_text(user_message, message));
            }

        }



        return list;

    }

    private static bool respondToUserFreeText(int tree_id, string token, GenericMessage userMessage, object p)
    {
        throw new NotImplementedException();
    }

    private void postToFacebook(GenericMessage userMessage, int tree_id, List<string> replys)
    {
        throw new NotImplementedException();
    }


    private static bool isStartConversation(GenericMessage userMessage)
    {

        if (userMessage.node_id == "")
        {
            return true;
        }
        return false;
    }






    private static void attach_law_data(Node CurrentNode, ref Node_Response reply)
    {

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Agmon_Law_addons", "tree_node_id", CurrentNode.NodeID());
        if (rows.Count > 0)
        {
            reply.message_origin = rows[0]["message_origin"];
            reply.message_explenation = rows[0]["message_explenation"];
            reply.danger_level = rows[0]["danger_level"];
            reply.financial_danger_level = rows[0]["financial_danger_level"];
            reply.question_number = "שאלה 1 מתוך 25 שאלות";
            reply.message_origin_source = rows[0]["message_origin_source"];

        }

    }

    private static bool isToContinue(ref Node CurrentNode)
    {

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "parent_dialog_id", int.Parse(CurrentNode.NodeID()));
        if (rows.Count == 1)
        {
            Dictionary<string, string> conversationTreeRow = rows[0];
            Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
            Node tmp_node = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);
            if (tmp_node.getNodeType() == DialogsGetter.dialog_type_quick_replys)
            {
                CurrentNode = tmp_node;
                return true;
            }
        }
        return false;
    }

    private static bool isNextMessageQuickReply(ref Node CurrentNode)
    {

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "parent_dialog_id", int.Parse(CurrentNode.NodeID()));
        if (rows.Count == 1)
        {
            Dictionary<string, string> conversationTreeRow = rows[0];
            Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
            Node tmp_node = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);
            if (tmp_node.getNodeType() == DialogsGetter.dialog_type_quick_replys)
            {
                CurrentNode = tmp_node;
                return true;
            }
        }
        return false;
    }

    private void restartConversation(int tree_id, GenericMessage user_message, string CurrentNodeID, string restartMessage)
    {
        List<string> list = new List<string>();
        // extract the Triggered Node according to recived text
        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", int.Parse(CurrentNodeID));
        if (rows.Count > 0)
        {
            Dictionary<string, string> conversationTreeRow = rows[0];
            Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
            if (cardDetailsRow != null)
            {
                Node CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);

                //string reply = "";//FacebookReplyCreator.createReply_text(user_message, restartMessage);
                //list.Add(reply);

                //list.AddRange(createReplys(user_message, CurrentNode, ref CurrentNodeID, tree_id));

            }

        }

        postToFacebook(user_message, tree_id, list);
    }

    private List<string> restartConversation(int tree_id, GenericMessage user_message, ref string conversation_state_data, string text)
    {
        string CurrentNodeID = "105";
        List<string> list = new List<string>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", int.Parse(CurrentNodeID));
        if (rows.Count > 0)
        {
            Dictionary<string, string> conversationTreeRow = rows[0];
            Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
            Node CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);

            //list.Add(FacebookReplyCreator.createReply_text(user_message, "איך תרצה להמשיך?"));

            string reply = "";//FacebookReplyCreator.createReply_quick_replys(user_message, CurrentNode.data, ref conversation_state_data, text);

            conversation_state_data = "ארוחה זריזה:111;ארוחה עשירה ומפנקת:115;ארוחה לפני אימון:120;ארוחה שאתאים לעצמי:122;המועדפים שלי:123";
            updateAnalytics(user_message, CurrentNode.ParentNodeID(), CurrentNodeID, conversation_state_data, tree_id);

            list.Add(reply);
        }
        return list;
    }

    private static List<Node_Response> endConversation(int tree_id, GenericMessage user_message)
    {
        string CurrentNodeID = "395";
        List<Node_Response> list = new List<Node_Response>();

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", int.Parse(CurrentNodeID));
        if (rows.Count > 0)
        {
            Dictionary<string, string> conversationTreeRow = rows[0];
            Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
            Node CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);

            //list.Add(FacebookReplyCreator.createReply_text(user_message, "איך תרצה להמשיך?"));

            //string reply = "";//FacebookReplyCreator.createReply_quick_replys(user_message, CurrentNode.data, ref conversation_state_data, text);

            //conversation_state_data = "ארוחה זריזה:111;ארוחה עשירה ומפנקת:115;ארוחה לפני אימון:120;ארוחה שאתאים לעצמי:122;המועדפים שלי:123";
            //updateAnalytics(user_message, CurrentNode.ParentNodeID(), CurrentNodeID, conversation_state_data, tree_id);
            
            list.AddRange(createReplys(user_message, CurrentNode, ref CurrentNodeID, tree_id));
        }
        return list;
    }


    private static string updateCurrentNodeID(string CurrentNodeID)
    {

        List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "parent_dialog_id", int.Parse(CurrentNodeID));
        if (rows.Count == 1)
        {
            CurrentNodeID = rows[0][DialogsGetter.colomn_id];
            //return updateCurrentNodeID(s);
        }
        else if (rows.Count == 0)
        {
            //Dictionary<string, string> conversationTreeRow = ConversationTree.getTopParentNode(tree_id);
            //Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
            //CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);
            //CurrentNodeID = CurrentNode.NodeID();


            CurrentNodeID = "-1";


            return CurrentNodeID;
        }

        return CurrentNodeID;
    }


    private static bool updateAnalytics(GenericMessage userMessage, string _PrevNodeID, string _CurrentNodeID, string conversation_state_data, int tree_id)
    {

        int pp = 0;
        int cc = 0;

        if (conversation_state_data == "")
            conversation_state_data = _CurrentNodeID;

        if (!int.TryParse(_PrevNodeID, out pp))
            pp = 0;

        if (!int.TryParse(_CurrentNodeID, out cc))
            cc = 0;


        string microsoftAppId = ConfigurationManager.AppSettings["microsoftAppId"];

        Dictionary<string, Object> values = new Dictionary<string, object>();

        values.Add("userID", "0");
        values.Add("parentNodeID", pp);
        values.Add("childNodeID", cc);
        values.Add("treeID", tree_id);


        values.Add("microsoftAppId", microsoftAppId);
        values.Add("bot_channel_id", "quaker_facebook");
        values.Add("bot_conversation_id", userMessage.ConversationId);
        values.Add("bot_user_id", userMessage.senderID);
        values.Add("user_message", userMessage.text);

        values.Add("conversation_state_data", conversation_state_data);

        values.Add("dateTime", DateTime.Now.ToString());

        return dbHandler.addNewContent("Dialogs_Analytics", values);
    }


    private static Node getWelcomeMessages(GenericMessage userMessage, int tree_id, string user_name)
    {
        // extract the first node in the tree.
        Dictionary<string, string> conversationTreeRow = ConversationTree.getTopParentNode(tree_id);
        Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
        Node CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);

        return CurrentNode;
    }

    private Node getWelcomeMessagesBK(GenericMessage userMessage, int tree_id, string user_name)
    {
        // extract the first node in the tree.
        Dictionary<string, string> conversationTreeRow = ConversationTree.getTopParentNode(tree_id);
        Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
        Node CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);



        // check Is returning user?
        if (isReturningUser(userMessage))
        {
            // we should randomaly present with differents welcome messages
            // CurrentNode.data["card_details_text"] = getRandomWelcomeMessage("");
        }

        if (user_name != "")
        {
            CurrentNode.data["card_details_text"] = "היי" + " " + user_name + ", " + CurrentNode.data["card_details_text"];
        }


        return CurrentNode;
    }

    private static List<string> getRandomWelcomeMessage(string user_name)
    {
        string ret = "";
        string emogi_url = "";

        int rand = new Random().Next(0, 100);
        if (rand < 20)
            rand = 1;
        else if (rand < 40)
            rand = 2;
        else if (rand < 60)
            rand = 3;
        else if (rand < 80)
            rand = 4;
        else if (rand < 100)
            rand = 5;

        switch (rand)
        {
            case 1:

                if (DateTime.Now.Hour < 12)
                {
                    ret = string.Format("בוקר טוב {0}, אני רואה שאנחנו מהמשכימים?", user_name);
                }
                else
                {
                    ret = string.Format("היי {0}, איזה יופי שחזרת.", user_name);
                }

                //emogi_url = JUtils.baseUrlEmogiContainer + "/17.gif";
                break;
            case 2:
                if (DateTime.Now.Hour < 12)
                {
                    ret = string.Format("בוקר מעולה {0}, כמה חיכיתי לך, בקושי ישנתי בלילה", user_name);
                }
                else
                {
                    ret = string.Format("היי {0}, חיכיתי לך פה מהבוקר! ", user_name);
                }

                //emogi_url = JUtils.baseUrlEmogiContainer + "/21.gif";
                break;
            case 3:
                if (DateTime.Now.Hour < 12)
                {
                    ret = string.Format("בוקר טוב  {0}! כבר לא יכול לחכות להפוך את הבוקר שלך למושלם.", user_name); ;
                }
                else
                {
                    ret = string.Format("היי {0}! אני כאן כדי לשדרג לך את היום. ", user_name); ;
                }

                //emogi_url = JUtils.baseUrlEmogiContainer + "/19.gif";
                break;
            case 4:
                if (DateTime.Now.Hour < 12)
                {
                    ret = string.Format("בוקר טוב {0}! לפתוח את הבוקר עם קוואקר זו בחירה מעולה וגם בריאה, כנראה שיש לך את זה בתזונה.", user_name); ;
                }
                else
                {
                    ret = string.Format("היי {0}! אז אחרי שעברת חצי יום בלעדיי, אני כאן לשירותך. ", user_name); ;
                }


                //emogi_url = JUtils.baseUrlEmogiContainer + "/19.gif";
                break;
            case 5:
                if (DateTime.Now.Hour < 12)
                {
                    ret = string.Format("בוקר מעולה {0}, מקווה שישנת טוב?", user_name); ;
                }
                else
                {
                    ret = string.Format("הי הי,  {0}, עוד רגע היום נגמר לנו", user_name);
                }


                //emogi_url = JUtils.baseUrlEmogiContainer + "/19.gif";
                break;
            default:
                ret = string.Format(" מה קורה, אני מבין שהרעב הגיע ;))", user_name);
                //emogi_url = JUtils.baseUrlEmogiContainer + "/17.gif";
                break;
        }


        return new List<string>() { ret, emogi_url };
    }

    private string getRandomWelcomeMessageAfternoon(string user_name)
    {
        string ret = "";

        int rand = new Random().Next(0, 100);
        if (rand < 25)
            rand = 1;
        else if (rand < 50)
            rand = 2;
        else if (rand < 75)
            rand = 3;
        else if (rand < 100)
            rand = 4;

        switch (rand)
        {
            case 1:
                ret = string.Format("היי {0}, איזה יופי שחזרת גם היום. אז מה אוכלים?", user_name);
                break;
            case 2:
                ret = string.Format("היי {0},  אני מבין שאהבת את המתכון האחרון. אז מה אוכלים הפעם?", user_name); ;
                break;
            case 3:
                ret = string.Format("היי  {0}! איך אני יכול להפוך את היום שלך למושלם?", user_name); ;
                break;
            case 4:
                ret = string.Format("היי {0}! קוואקר זו בחירה מעולה וגם בריאה, כנראה שיש לך את זה בתזונה. אז מה בא לך לאכול היום?", user_name); ;
                break;
            default:
                ret = string.Format(" מה קורה, אני מבין שהרעב הגיע ;)) מה מתחשק לך היום?", user_name); ;
                break;
        }
        return ret;
    }

    private string getRandomMessage(List<string> message_options)
    {
        int rand = new Random().Next(0, message_options.Count);
        return message_options[rand];
    }


    private static Dictionary<string, string> getLastUserAction(string user_id)
    {


        Dictionary<string, object> queryKeyAndValue = new Dictionary<string, object>();
        queryKeyAndValue.Add("microsoftAppId", ConfigurationManager.AppSettings["microsoftAppId"].ToString());
        queryKeyAndValue.Add("bot_user_id", user_id);

        List<Dictionary<string, string>> rows = null;// dbHandler.getTableData("Dialogs_Analytics", queryKeyAndValue, "id desc");

        if (rows.Count > 0)
        {
            return rows[0];
        }
        return null;
    }

    private static bool isReturningUser(GenericMessage user_message)
    {
        return false;// (getLastUserAction(user_message.senderID) != null);
    }

    private int getTreeId()
    {
        int tree_id = 3;
        //get the tree_id associated with this bot id
        List<Dictionary<string, string>> System_bot_app_ids_rows = dbHandler.getTableData("System_bot_app_ids", "microsoft_bot_id", ConfigurationManager.AppSettings["microsoftAppId"]);
        if (System_bot_app_ids_rows.Count > 0)
        {
            foreach (Dictionary<string, string> row in System_bot_app_ids_rows)
            {
                if (row["is_active"] == "1")
                {
                    string tmp_tree_id = row["tree_id"];
                    int.TryParse(tmp_tree_id, out tree_id);
                    break;
                }
            }

        }

        return tree_id;
    }

    private static Node IsTriggerPressed(GenericMessage user_message, ref string CurrentNodeID)
    {

        // extract stored conversation data
        //string conversation_state_data = getConversationData(user_message);

        if (user_message.payload != "")
        {

            if (CurrentNodeID != "")
            {
                List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", int.Parse(CurrentNodeID));
                if (rows.Count > 0)
                {
                    Dictionary<string, string> conversationTreeRow = rows[0];
                    Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
                    Node CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);
                    CurrentNodeID = CurrentNode.NodeID();
                    return CurrentNode;
                }
            }

            //conversation_state_data = "";
        }

        if (user_message.payload != "")
        {
            int t = -1;
            if (int.TryParse(user_message.payload, out t))
            {
                CurrentNodeID = user_message.payload;
            }
        }

        return null;
    }

    private static string getConversationData(GenericMessage user_message)
    {

        Dictionary<string, object> queryKeyAndValue = null;
        queryKeyAndValue = new Dictionary<string, object>();
        queryKeyAndValue.Add("bot_user_id", user_message.senderID);
        queryKeyAndValue.Add("bot_conversation_id", user_message.ConversationId);

        Dictionary<string, string> row = null;// dbHandler.getTableData_lastRow("Dialogs_Analytics", queryKeyAndValue);
        if (row != null && row.Count > 0)
        {
            return row[DialogsGetter.analytics_conversation_state_data];
        }

        return "";
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

    /*
    private async Task ActivityReceivedAsync(IDialogContext context, IAwaitable<object> result)
    {


        Node CurrentNode = null;
        string CurrentNodeID = "";
        var activity = await result as Activity;

        //get the tree_id associated with this bot id
        int tree_id = getTreeId();

        // check whether we are reacting to a click of a trigger
        CurrentNode = IsTriggerPressed(activity, ref CurrentNodeID);

        // send isTyping to the user            
        await context.PostAsync(createIsTypingReply(activity, context));


        if (isNewConversation(activity))
        {
            // extract the first node in the tree.
            Dictionary<string, string> conversationTreeRow = ConversationTree.getTopParentNode(tree_id);
            Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
            CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);
            CurrentNodeID = CurrentNode.NodeID();

            // check Is returning user?
            if (isReturningUser(activity))
            {
                // we should randomaly present with differents welcome messages
                CurrentNode.data["card_details_text"] = getRandomWelcomeMessage();
            }

        }
        else
        {
            // extract the Triggered Node according to recived text
            List<Dictionary<string, string>> rows = dbHandler.getTableData("Conversation_trees", "id", int.Parse(CurrentNodeID));
            if (rows.Count > 0)
            {
                Dictionary<string, string> conversationTreeRow = rows[0];
                Dictionary<string, string> cardDetailsRow = DialogsGetter.extractCardDetails(conversationTreeRow);
                CurrentNode = DialogsGetter.createNode(conversationTreeRow, cardDetailsRow);
            }
        }

        // create all replay (recursia) 
        List<Activity> replys = createReplys(activity, CurrentNode, ref CurrentNodeID, tree_id);

        if (activity.ChannelId == "facebook")
        {
            // create quick replys - "facebook style"
            if (replys.Count > 1)
            {
                // is at least 2 item
                if (replys[replys.Count - 1].SuggestedActions != null && replys[replys.Count - 1].SuggestedActions.Actions.Count > 1)
                {
                    replys[replys.Count - 2].SuggestedActions = replys[replys.Count - 1].SuggestedActions;
                    replys.RemoveAt(replys.Count - 1);
                }
            }
        }


        for (int i = 0; i < replys.Count; i++)
        {
            if (i > 0)
            {
                await context.PostAsync(createIsTypingReply(activity, context));
            }
            await context.PostAsync(replys[i]);
        }

        context.Wait(ActivityReceivedAsync);

    }
    */
    private void sendCarouselMessage(string recipientId, List<Hashtable> payloadsData)
    {

    }


}
