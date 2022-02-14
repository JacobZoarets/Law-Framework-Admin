<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Saved_ChatPage.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css' />
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <link href="css/dashboard.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

    <script src="js/DrawJs.js"></script>
    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Light Bootstrap Table core CSS  -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <script src="assets/jquery.fbmessenger-develop/src/js/jquery.fbmessenger.js"></script>
    <!--<script src="assets/jquery.fbmessenger-develop/dist/jquery.fbmessenger.min.js"></script>-->
    <link href="assets/jquery.fbmessenger-develop/dist/jquery.fbmessenger.css" rel="stylesheet" />


     <style>
        div.myautoscroll:hover {
            overflow: auto;
            /*padding-right: 1px;*/
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input id="last_clicked" type="hidden" value="5" />
        <input id="update_type" type="hidden" value="5" />


        <div class="wrapper">
            <div class="sidebar" data-color="green" data-image="http://www.agmon-law.co.il/images/design/logo.png">

                <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->
                <!--<asp:BoundField DataField="tree_id" HeaderText="tree_id" SortExpression="tree_id" />
                                <asp:BoundField DataField="is_active" HeaderText="is_active" SortExpression="is_active" />-->
                <div class="sidebar-wrapper">
                    <div class="logo">

                        <a href="#" class="simple-text">
                            <img width="100%" src="http://www.agmon-law.co.il/images/design/logo.png" />
                        </a>
                    </div>

                    <ul class="nav">
                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="AddNewReference.aspx">

                                <p style="font-size: 20px">חוקים ואסמכתאות</p>


                            </a>
                        </li>
                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="http://localhost:62801/Framework.aspx?tree_id=6">

                                <p style="font-size: 20px">חוק הספאם</p>


                            </a>
                        </li>
                        <li class="divider">&nbsp</li>
                        <li class="active">


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="ChatPage.aspx">

                                <p style="font-size: 20px">ממשק שיחה</p>


                            </a>
                        </li>
                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                           <a href="ClientsManagment.aspx">

                                <p style="font-size: 20px">היסטוריית שיחות</p>


                            </a>
                        </li>

                    </ul>
                </div>
            </div>



            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">אגמון -רגולציה מונעת</a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">
                                <li>
                                    <a title="Add new Conversation Tree" href="Framework.aspx?function=addNewTree" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="material-icons">note_add</i>
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-globe"></i>
                                        <b class="caret"></b>
                                        
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Notification 1</a></li>
                                        <li><a href="#">Notification 2</a></li>
                                        <li><a href="#">Notification 3</a></li>
                                        <li><a href="#">Notification 4</a></li>
                                        <li><a href="#">Another notification</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="">
                                        <i class="fa fa-search"></i>
                                    </a>
                                </li>
                            </ul>

                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#">Account
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
                                   
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">Log out
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-7">
                                <div style="height: 750px" id="screen_content_div">
                                </div>
                            </div>

                            <div class="col-md-5">

                                <div class="screen-content1" style="height: 750px">
                                     <div id="accordion">
                                        <h3>לשון המחוקק</h3>
                                        <div>
                                            <div id="law_raw_text_div" style="width: 100%; height: 470px; background-color: white;">
                                                
                                            </div>
                                        </div>
                                        <h3>פסיקות רלוונטיות</h3>

                                        <div id="relevant_verdicts_div">
                                            
                                        </div>
                                        <h3>הרחבות רלוונטיות</h3>
                                        <div id="relevant_extentions_div1">
                                                                                       
                                        </div>
                                        <h3>רשימת סיכונים</h3>
                                        <div>
                                            <div id="danger_list_ul_div1" style="width: 100%; height: 100px; background-color: azure; direction: rtl; overflow-y: auto">
                                                <p id="danger_list">
                                                    רשימת סיכונים לאנליזה נוכחית
                                                </p>
                                                <ul id="danger_list_ul">
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div style="height: 30px">
                                        
                                    </div>

                                    <div style="width: 100%; height: 30px; background-color: white; direction: rtl">
                                        <p id="danger_level">
                                            danger_level : 1-4
                                        </p>
                                    </div>
                                    <div style="width: 100%; height: 30px; background-color: white; direction: rtl">
                                        <p id="financial_danger_level">
                                            financial_danger_level : 1000$
                                        </p>
                                    </div>
                                    <div style="width: 100%; height: 30px; background-color: white; direction: rtl">
                                        <p id="question_number">
                                            question_number : 1 of 25
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>




            </div>
            </div>
    </form>
    <script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>

    <script type="text/javascript">

        $(function () {


            var unique_conversation_id = getUrlVars()['unique_conversation_id'];

            if (unique_conversation_id == undefined) {
                unique_conversation_id ='a358949c-f30e-4865-bb33-f83511ac13a8'
            }

            Get_Saved_conversation(unique_conversation_id);
            $("#accordion").accordion();

        });

        //var unique_conversation_id = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,
        //    function (c) {
        //        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        //        return v.toString(16);
        //    });

        var user_clicked = false;
        var quick_replys_payload = null;
        var selected_reply_payload = "";
        var prev_selected_reply_payload = "";
        var user_id = "2323232";
        var conversation_id = "6";
        var anotation_index = 0;
        var danger_count = 0;

        function getUrlVars() {
            var vars = [], hash;
            var q = document.URL.split('?')[1];
            if (q != undefined) {
                q = q.split('&');
                for (var i = 0; i < q.length; i++) {
                    hash = q[i].split('=');
                    vars.push(hash[1]);
                    vars[hash[0]] = hash[1];
                }
            }
            return vars;
        }

       
        function save_html_tree() {

            // add user id to saved page
            addHiddenInputToPage('user_id', user_id);
            addHiddenInputToPage('conversation_id', conversation_id);
            addHiddenInputToPage('unique_conversation_id', unique_conversation_id);
            addHiddenInputToPage('danger_count', danger_count);

            var html_tree = $('.screen-content').parent().html();
            var law_raw_text = $('#law_raw_text').parent().html();
            var relevant_verdicts = $('#relevant_verdicts').parent().html().replace("'", "");
            var relevant_extentions = $('#relevant_extentions').parent().html();
            var relevant_danger_links = $('#danger_list_ul').parent().html();

            url = "CallBack.aspx/save_html_tree";
            data = "{user_id:'" + user_id + "',conversation_id:'" + conversation_id +
                "',html_tree:'" + html_tree + "',unique_conversation_id:'" + unique_conversation_id +
                "',danger_count:'" + danger_count + "',law_raw_text:'" + law_raw_text +
                "',relevant_verdicts:'" + relevant_verdicts + "',relevant_extentions:'" + relevant_extentions + "',relevant_danger_links:'" + relevant_danger_links + "'}";

            $.ajax({
                type: "POST",
                url: url,
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert(response.d);
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        }

        function Get_Saved_conversation(unique_conversation_id) {

            url = "CallBack.aspx/get_saved_html_tree";
            data = "{unique_conversation_id:'" + unique_conversation_id + "'}";

            $.ajax({
                type: "POST",
                url: url,
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess_Get_Saved_conversation,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });

        }
        function OnSuccess_Get_Saved_conversation(response) {
            // $('.screen-content').fbMessenger('message', 'user', response.d, { timestamp: new Date(), delay: 0 });

            // $('.screen-content').fbMessenger('message', 'bot', 'Best thing I\'ve heard today!', { timestamp: new Date(), delay: 1000 })

            //alert(response.d);
            var response_obj = JSON.parse(response.d);

            $('#screen_content_div').html(response_obj.html_tree);
            $('#law_raw_text_div').html(response_obj.law_raw_text);
            $('#relevant_verdicts_div').html(response_obj.relevant_verdicts);
            $('#relevant_extentions_div').html(response_obj.relevant_extentions);
            $('#danger_list_ul_div').html(response_obj.relevant_danger_links);

        }

        function get_response() {


            //string user_id, string conversation_id, string selected_node_id

            url = "CallBack.aspx/get_response";
            data = "{user_id:'" + user_id + "',conversation_id:'" + conversation_id + "',selected_node_id:'" + selected_reply_payload + "'}";

            $.ajax({
                type: "POST",
                url: url,
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess_get_response,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });

        }

        var tmp_var = '';
        var last_danger_message = ''
        function OnSuccess_get_response(response) {
            // $('.screen-content').fbMessenger('message', 'user', response.d, { timestamp: new Date(), delay: 0 });

            // $('.screen-content').fbMessenger('message', 'bot', 'Best thing I\'ve heard today!', { timestamp: new Date(), delay: 1000 })

            //alert(response.d);
            var response_array = JSON.parse(response.d);


            if (response_array.length > 0) {
                for (var i = 0; i < response_array.length; i++) {
                    var response_obj = response_array[i];

                    if (response_obj.response_type == "text") {
                        $('.screen-content').fbMessenger('message', 'bot', response_obj.message_text, { timestamp: new Date(), delay: 1000 })

                        if (response_obj.danger_level == '4') {
                            tmp_var = response_obj.message_text;
                            setTimeout(function () {
                                //console.log(tmp_var);
                                $(".jsm-left").each(function () {
                                    var the_text = $(this).text();
                                    //console.log(the_text);
                                    if (the_text == tmp_var) {
                                        $(this).css('background-color', 'red');
                                        if (the_text != last_danger_message) {
                                            danger_count += 1;
                                            last_danger_message = the_text;

                                            $(this).attr('id', 'danger_message_' + danger_count);

                                            $("#danger_list_ul").append('<li><a id="danger_click_id_' + danger_count + '" href="#">סיכון ' + danger_count + '</a></li>');
                                            $('#danger_click_id_' + danger_count).click(function () {
                                                var elment = document.getElementById('danger_message_' + danger_count);
                                                $('.jsm-chat-content').animate({
                                                    scrollTop: $("#danger_message_" + danger_count).offset().top
                                                }, 1000);
                                            });
                                        }

                                        return false;
                                    }
                                });
                            }, 2000);
                        }
                    }
                    else if (response_obj.response_type == "quick_replys") {

                        var quick_replys = response_obj.quick_replys;
                        quick_replys_payload = response_obj.quick_replys_payload;

                        if (prev_selected_reply_payload != "") {
                            quick_replys.push("חזור");
                            quick_replys_payload.push(prev_selected_reply_payload);
                        }



                        $('.screen-content').fbMessenger('showQuickReplies',
                            quick_replys,
                            { timestamp: new Date(), delay: 0 }
                        );

                        setTimeout(function () {

                            $(".jsm-quick-reply-option").each(function () {
                                $(this).click(function () {
                                    //alert($(this).text());
                                    var index = Number($(this).attr('id').replace("reply_option_", ""));
                                    $('.screen-content').fbMessenger('selectQuickReply', index, { timestamp: new Date() });
                                    $('.screen-content').fbMessenger('hideQuickReplies', { delay: 0 });

                                    // clear the script array
                                    $('.screen-content').fbMessenger('clear_scripts');

                                    prev_selected_reply_payload = selected_reply_payload;
                                    selected_reply_payload = quick_replys_payload[index];

                                    setTimeout(function () {
                                        user_clicked = true;
                                    }, 1000);
                                });
                            });

                        }, 4000);

                    }


                    if (response_obj.message_origin != "") {
                        anotation_index += 1;
                        var txt = response_obj.message_origin;

                        if ($('#law_raw_text').html().indexOf(txt) != -1) {
                            $('span').css("background-color", "white");

                            //console.log($('#law_raw_text').html().replace(txt, '<span style="background-color: yellow;">' + response_obj.message_origin + '</span>'));
                            $('#law_raw_text').html($('#law_raw_text').html().replace(txt, '<span id="selected_text_' + anotation_index + '" style="background-color: yellow;">' + response_obj.message_origin + '</span>'))
                            document.getElementById('selected_text_' + +anotation_index).scrollIntoView({ block: 'center', behavior: 'smooth' });

                        }

                        //$('#message_explenation').html(response_obj.message_explenation);
                        $('#danger_level').html(response_obj.danger_level);
                        $('#financial_danger_level').html(response_obj.financial_danger_level);
                        $('#question_number').html(response_obj.question_number);

                        $('.jsm-input-prompt').html(response_obj.message_explenation);

                        console.log('prev last node id was:' + prev_selected_reply_payload);


                    }
                }
            }




            $('.screen-content').fbMessenger('run');


            //$(".jsm-quick-reply-option").each(function () {
            //$(this).click(function () {
            //    alert('in');
            //});
            // });
            //$('.screen-content').fbMessenger('scrollQuickReplies', 3, { delay: 500 })
            //$('.screen-content').fbMessenger('scrollQuickReplies', 0, { delay: 1000 })
            //$('.screen-content').fbMessenger('scrollQuickReplies', 4, { delay: 1000 })
            //$('.screen-content').fbMessenger('selectQuickReply', 4, { delay: 500 })
        }



         /*
            
            //.fbMessenger('typingIndicator', { delay: 500 })
            .fbMessenger('message', 'bot', 'Hey there! I am Present Finder, your friendly bot to help you finding... well, you guessed it.', { timestamp: now, delay: 2000 })
            .fbMessenger('typingIndicator', { delay: 3000 })
            .fbMessenger('message', 'bot', 'Let\'s start with the basics, what\'s your budget? Select from the options below or enter an exact amount as a limit.', { timestamp: now, delay: 4000 })
            .fbMessenger('showQuickReplies', [
                'Less than 5$',
                'Up to 20$',
                'Up to 50$',
                'Up to 100$',
                'Money doesn\'t matter.'
            ], { timestamp: now, delay: 0 })
            .fbMessenger('scrollQuickReplies', 3, { delay: 4000 })
            .fbMessenger('scrollQuickReplies', 0, { delay: 1000 })
            .fbMessenger('scrollQuickReplies', 4, { delay: 1000 })
            .fbMessenger('selectQuickReply', 4, { delay: 1000 })
            .fbMessenger('typingIndicator', { delay: 1000 })
            .fbMessenger('message', 'bot', 'Best thing I\'ve heard today!', { timestamp: now, delay: 1000 })
            .fbMessenger('typingIndicator', { delay: 500 })
            .fbMessenger('message', 'bot', 'Let\'s narrow things down. What\'s the occasion?', { timestamp: now, delay: 1000 })
            .fbMessenger('showGenericTemplate', [
                {
                    imageUrl: 'assets/jquery.fbmessenger-develop/demo/unsplash-birthday-annie-spratt.jpg',
                    title: 'Birthday',
                    subtitle: 'Find presents for a birthday.',
                    buttons: [
                        'Select Birthday'
                    ]
                },
                {
                    imageUrl: 'assets/jquery.fbmessenger-develop/demo/unsplash-christmas-darren-coleshill.jpg',
                    title: 'Christmas',
                    subtitle: 'Find seasonal presents for Christmas.',
                    buttons: [
                        'Select Christmas'
                    ]
                },
                {
                    imageUrl: 'assets/jquery.fbmessenger-develop/demo/unsplash-wedding-anne-edgar.jpg',
                    title: 'Wedding',
                    subtitle: 'Find presents for bride and groom.',
                    buttons: [
                        'Select Wedding'
                    ]
                }
            ], { timestamp: now, delay: 2000 })
            
            .fbMessenger('selectGenericTemplate', 0, { delay: 1000 })
            .fbMessenger('typingIndicator', { delay: 500 })
            .fbMessenger('message', 'bot', 'Awwww... so it\'s that time of the year again! יעקב זוארץ', { timestamp: now, delay: 2000 })
            .fbMessenger('typingIndicator', { delay: 500 })
            .fbMessenger('showButtonTemplate', 'Who\'s the present for?', [
                'Significant Other',
                'Family or close friend',
                'Acquaintance or colleague',
                'Business partner'
            ], { timestamp: now, delay: 1000 })

            //.fbMessenger('message', 'user', 'One more time!', { timestamp: now, delay: 5000 })
            */
    </script>

</body>
</html>


