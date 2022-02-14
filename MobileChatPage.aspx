<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MobileChatPage.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="assets/jquery.fbmessenger-develop/src/js/jquery.fbmessenger.js"></script>
    <!--<script src="assets/jquery.fbmessenger-develop/dist/jquery.fbmessenger.min.js"></script>-->
    <link href="assets/jquery.fbmessenger-develop/dist/jquery.fbmessenger.css" rel="stylesheet" />

   
    <style>
         div.myautoscroll:hover {
            overflow: auto;
            /*padding-right: 1px;*/
        }
        body, html {
            margin: 0;
            padding: 0;
            background: #fff;
        }

        div.vcenter {
            margin: 5vh auto 0;
            height: 95vh;
            width: 100%;
            text-align: center;
        }

        div.iphone-wrapper {
            /*display: inline-block;*/
            width: auto;
            height: 100%;
            position: relative;
        }

            div.iphone-wrapper > img {
                height: 100%;
                width: auto;
                display: block;
            }

        div.screen-content {
            /*position: absolute;*/
            /*top: 10.8985%;
            bottom: 20%;
            left: 14.65%;
            right: 16.8%;*/
            background: #000;
            border-radius: 3px;
            overflow: hidden;
            /*font-size: 28px;*/
            width:100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      
        <div class="vcenter">
        <div class="iphone-wrapper">
            <img alt="iPhone 6 white" src="https://i.imgsafe.org/a2ba6b06b3.png" />
            <div class="screen-content" >
            </div>
        </div>
    </div>


    </form>
    <script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>

    <script type="text/javascript">

        $(function () {
            var now = new Date();

            $('.screen-content').fbMessenger({
                botName: 'Agmon Law',
                botBannerUrl: 'http://www.agmon-law.co.il/uploaded_files/91410081887.png',
                botLogoUrl: 'assets/jquery.fbmessenger-develop/demo/logo.png',
                botWelcomeMessage: 'סידרה של שאלות המתוכננות לבדוק סיכונים מול חוק הספאם',
                likes: {
                    totalCount: 25123,
                    friendName: 'John Doe',
                    otherFriendsCount: 42
                },
                loop: false
            })
                .fbMessenger('start', { delay: 0 })


            $('.jsm-get-started-button').click(function () {
                get_response('test111')
            });

            var myVar = setInterval(get_next_node, 100);



            //$("#accordion").accordion();

            if (getUrlVars()['conversation_id'] != undefined) {
                conversation_id = getUrlVars()['conversation_id'];
                if (conversation_id != '6') {
                    $("#law_raw_text").hide();
                    $(".jsm-bot-welcome-status").hide();
                    $(".jsm-get-started-info").hide();
                }
            }
            $('.screen-content').css("font-size","15px");
            setTimeout(function ()
            {
                $('.screen-content').css("font-size","15px");
            }, 3000);

            
        });

        var unique_conversation_id = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,
            function (c) {
                var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });

        var user_clicked = false;
        var quick_replys_payload = null;
        var selected_reply_payload = "";
        var prev_selected_reply_payload = "";
        var user_id = "2323232";
        var conversation_id = "6";
        var anotation_index = 0;
        var danger_count = 0;
        var question_counter = 0;
        var user_clicked_pinMessage = false;

        function get_next_node() {

            if (user_clicked) {
                user_clicked = false;
                get_response();
            }


        }

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

        function scrollToLine(line) {

            document.getElementById('selected_text_' + +anotation_index).scrollIntoView({ block: 'start', behavior: 'smooth' });

        }


        function addHiddenInputToPage(id, value) {
            $('<input>').attr({
                type: 'hidden',
                id: id,
                value: value
            }).appendTo('.screen-content');
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
            var relevant_extentions = $('#relevant_extentions').parent().html().replace("'", "");
            var relevant_danger_links = $('#danger_list_ul').parent().html().replace("'", "");

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
                    if (response.d == "False") {
                        alert("Something is wrong with saving.");
                    }
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
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
            question_counter += 1;

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
                            //quick_replys.push("חזור");
                            quick_replys.push('<img src="https://findicons.com/files/icons/77/icandy_junior_toolbar/128/back_2.png" style="width:25px;height:25px;border:0" />');
                            quick_replys_payload.push(prev_selected_reply_payload);
                        }

                        //quick_replys.push("נעץ שאלה");
                        quick_replys.push('<img src="https://cdn3.iconfinder.com/data/icons/classic-icons-1/512/09.png" style="width:25px;height:25px;border:0" />');
                        quick_replys_payload.push("pin_message_action");


                        $('.screen-content').fbMessenger('showQuickReplies',
                            quick_replys,
                            { timestamp: new Date(), delay: 0 }
                        );

                        quick_replay_click_interval = setInterval(setQuickReplayClickEvent, 1000);
                        //setQuickReplayClickEvent();

                    }


                   
                }
            }




            $('.screen-content').fbMessenger('run');
            //save_html_tree();

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

        var isFound = false;
        var quick_replay_click_interval;
        function setQuickReplayClickEvent() {
            //setTimeout(function () {
            
            isFound = false;
            //console.log('in');

            $(".jsm-quick-reply-option").each(function () {
                $(this).click(function () {
                    //alert($(this).text());
                    var index = Number($(this).attr('id').replace("reply_option_", ""));
                    $('.screen-content').fbMessenger('selectQuickReply', index, { timestamp: new Date() });
                    $('.screen-content').fbMessenger('hideQuickReplies', { delay: 0 });

                    // clear the script array
                    $('.screen-content').fbMessenger('clear_scripts');


                    if (quick_replys_payload[index] == "pin_message_action") {

                        //$(this).css('background-color', 'red');
                        $(".jsm-left:last").css('background-color', '#007aff');
                        $(".jsm-left:last").css('color', 'white');

                        //if (the_text != last_danger_message) {
                            danger_count += 1;
                            //last_danger_message = the_text;

                            $(".jsm-left:last").attr('id', 'danger_message_' + danger_count);

                            $("#danger_list_ul").append('<li><a id="danger_click_id_' + danger_count + '" href="#">סיכון ' + danger_count + '</a></li>');
                            $('#danger_click_id_' + danger_count).click(function () {
                                var elment = document.getElementById('danger_message_' + danger_count);
                                $('.jsm-chat-content').animate({
                                    scrollTop: $("#danger_message_" + danger_count).offset().top
                                }, 1000);
                            });
                        //}
                        $("#accordion").accordion("option", "active", 3);

                        prev_selected_reply_payload = selected_reply_payload;
                        selected_reply_payload = quick_replys_payload[0];

                        setTimeout(function () {
                            user_clicked = true;
                            //save_html_tree();
                        }, 1000);
                    }
                    else
                    {
                        prev_selected_reply_payload = selected_reply_payload;
                        selected_reply_payload = quick_replys_payload[index];

                        setTimeout(function () {
                            user_clicked = true;
                            //save_html_tree();
                        }, 1000);
                    }

                    
                });
                $(this).css('font-weight', 'bold');
                //isFound = true;
                
            });
            
            if (isFound) {
                isFound = false;
                clearInterval(quick_replay_click_interval);
            }
            //}, 5000);
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


