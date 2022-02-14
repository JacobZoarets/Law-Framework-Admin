<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreeStatistics.aspx.cs" Inherits="TreeStatistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title></title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

    <link rel="stylesheet" href="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.css">
    <script src="//cdn.jsdelivr.net/chartist.js/latest/chartist.min.js"></script>

</head>
<body style="padding-top:0px">
    <form id="form1" runat="server">
        <input runat="server" id="tree_id" type="hidden" value="1" />

        <div class="wrapper">
            <div class="content">
               
                    <div class="container-fluid">
                        <div class="row">
                             <table style="width:100%">
                                 

                                        <tr>
                                            
                                            
                                            <td><h4 id="tree_id_label" class="title">Conversation Tree: #1</h4></td>
                                            <td style="width:80%">&nbsp;</td>
                                            <td><a title="Tree Creation" id="create_tree_link" href="#"><img src="images/edit-flat.png" width="50px" height="50px" /></a></td>
                                        </tr>
                                    </table>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Channel Distribution</h4>
                                        <p class="category">Last Campaign Performance</p>
                                    </div>
                                    <div class="content">
                                        <div id="chartPreferences" class="ct-chart ct-perfect-fourth">
                                        </div>

                                        <div class="footer">
                                            <div class="legend">
                                                <i class="fa fa-circle text-info"></i>Open
                                        <i class="fa fa-circle text-danger"></i>Bounce
                                        <i class="fa fa-circle text-warning"></i>Unsubscribe
                                            </div>
                                            <hr>
                                            <div class="stats">
                                                <i class="fa fa-clock-o"></i>Campaign sent 2 days ago
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Users Behavior</h4>
                                        <p class="category">24 Hours performance</p>
                                    </div>
                                    <div class="content">
                                        <div id="chartHours" class="ct-chart chartHours">
                                            
                                        </div>
                                        <div class="footer">
                                            <div class="legend">
                                                <i class="fa fa-circle text-info"></i>Open
                                        <i class="fa fa-circle text-danger"></i>Click
                                        <i class="fa fa-circle text-warning"></i>Click Second Time
                                            </div>
                                            <hr>
                                            <div class="stats">
                                                <i class="fa fa-history"></i>Updated 3 minutes ago
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Users & Visits</h4>                                    
                                    
                                </div>
                                <br />
                                <div class="content">

                                    <!--<div id="loader_spinner" class="loader">Loading...</div>
                                    add here -->
                                    <div class="text-center">

                                        <div style="height: 850px; overflow: auto; overflow-x: hidden;" class="content table-responsive table-full-width">
                                            <asp:Repeater ID="rptInboxOutbox" runat="server" DataSourceID="SqlDataSource1">
                                                <HeaderTemplate>
                                                    <table cellspacing="0" rules="all" border="0" class="table table-hover">
                                                        <thead style="border: 0">
                                                            <tr style="border: 0">
                                                                <th style="border: 0">ID</th>
                                                                <th style="border: 0">bot_channel_id</th>
                                                                <th style="border: 0">bot_conversation_id</th>
                                                                <th style="border: 0">bot_user_id</th>
                                                                <th style="border: 0">user_message</th>
                                                                <th style="border: 0">userID</th>
                                                                <th style="border: 0">treeID</th>
                                                                <th style="border: 0">parentNodeID</th>
                                                                <th style="border: 0">childNodeID</th>
                                                                <th style="border: 0">conversation_state_data</th>
                                                                <th style="border: 0">dateTime</th>
                                                            </tr>
                                                        </thead>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr style="border: 0">
                                                        <td style="border: 0"><%# Eval("id") %></td>
                                                        <td style="border: 0"><%# Eval("bot_channel_id") %></td>
                                                        <td style="border: 0"><%# Eval("bot_conversation_id") %></td>
                                                        <td style="border: 0"><%# Eval("bot_user_id") %></td>
                                                        <td style="border: 0"><%# Eval("user_message") %></td>
                                                        <td style="border: 0"><%# Eval("userID") %></td>
                                                        <td style="border: 0"><%# Eval("treeID") %></td>
                                                        <td style="border: 0"><%# Eval("parentNodeID") %></td>
                                                        <td style="border: 0"><%# Eval("childNodeID") %></td>
                                                        <td style="border: 0"><%# Eval("conversation_state_data") %></td>
                                                        <td style="border: 0"><%# Eval("dateTime") %></td>

                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>


                                    <div id="html_content" style="width: 100%; height: 100%"></div>


                                    <script type="text/javascript">

                                        $(function () {

                                            $('#tree_id_label').html( "Statistics for conversation tree: #" + $('#tree_id').val());
                                            $("#create_tree_link").attr("href", "Default.aspx?tree_id=" + +$('#tree_id').val());
                                            //alert($('#tree_id').val());
                                            //loadConversationTree($('#tree_id').val());
                                            //eee();
                                            addNewPieChart();
                                            addNewVisitsGraph();

                                            $(this).find(".card").hover(function () {
                                                //$(this).find(".org-controls").css("display", "block");
                                                console.log('card hover');
                                                // omclick to show message creator
                                                $(this).find(".org-add-button").click(function () {

                                                    // add the id of the clicked object
                                                    var thisId = $(this).parent().parent().parent().attr('id').replace("card_", "");
                                                    console.log('add new ' + thisId);


                                                    $('#last_clicked').val(thisId);

                                                    log('Clicked node ' + thisId);

                                                    $("#message_creator").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                                });

                                                $(this).find(".org-del-button").click(function () {

                                                    // add the id of the clicked object
                                                    var thisId = $(this).parent().parent().parent().attr('id').replace("card_", "");
                                                    console.log('delete ' + thisId);
                                                    $('#last_clicked').val(thisId);

                                                    deleteFromServer($('#tree_id').val(), thisId);


                                                    //$("#message_creator").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                                });
                                            }, function () {
                                                //$(this).find(".org-controls").css("display", "none");
                                                console.log('card hover1');
                                            });

                                            // close message creator
                                            $("#close_icon").click(function () {
                                                $("#message_creator").fadeOut();
                                            });

                                            connectClickButtons();

                                            $("#tabs").tabs();
                                        });

                                        function eee() {
                                            var data = {
                                                // A labels array that can contain any sort of values
                                                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
                                                // Our series array that contains series objects or in this case series data arrays
                                                series: [
                                                  [5, 2, 4, 2, 0]
                                                ]
                                            };

                                            // Create a new line chart object where as first parameter we pass in a selector
                                            // that is resolving to our chart container element. The Second parameter
                                            // is the actual data object.
                                            new Chartist.Line('.ct-chart', data);
                                        }

                                        function addNewPieChart() {
                                            /*var data = {
                                                series: [5, 3, 4]
                                            };

                                            var sum = function (a, b) { return a + b };

                                            new Chartist.Pie('.ct-chart', data, {
                                                labelInterpolationFnc: function (value) {
                                                    return Math.round(value / data.series.reduce(sum) * 100) + '%';
                                                }
                                            });*/
                                            var data = {
                                                labels: ['Facebook', 'WebChat', 'Banners'],
                                                series: [20, 15, 40]
                                            };

                                            var options = {
                                                labelInterpolationFnc: function (value) {
                                                    return value[0]
                                                }
                                            };

                                            var responsiveOptions = [
                                              ['screen and (min-width: 640px)', {
                                                  chartPadding: 30,
                                                  labelOffset: 100,
                                                  labelDirection: 'explode',
                                                  labelInterpolationFnc: function (value) {
                                                      return value;
                                                  }
                                              }],
                                              ['screen and (min-width: 1024px)', {
                                                  labelOffset: 80,
                                                  chartPadding: 20
                                              }]
                                            ];

                                            new Chartist.Pie('.ct-chart', data, options, responsiveOptions);
                                        }

                                        function addNewVisitsGraph()
                                        {
                                            //chartHours
                                            new Chartist.Line('#chartHours', {
                                                labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
                                                series: [
                                                  [12, 9, 7, 8, 5],
                                                  [2, 1, 3.5, 7, 3],
                                                  [1, 3, 4, 5, 6]
                                                ]
                                            }, {
                                                fullWidth: true,
                                                chartPadding: {
                                                    right: 40
                                                }
                                            });
                                        }

                                        function connectClickButtons() {
                                            /*static string dialog_type_text="1";
                                            static string dialog_type_quick_replys = "2";
                                            static string dialog_type_image = "3";
                                            static string dialog_type_buttons = "4";
                                            static string dialog_type_caruosel = "5";*/
                                            var node_type = 0;
                                            var url = "SendArgs.aspx/addTreeNode";
                                            var data = "{tree_id: '" + $('#tree_id').val() + "',parent_dialog_id: '" + $('#last_clicked').val() + "',dialog_type_id: '" + 1 + "'}";

                                            // add html to new object
                                            $("#text-button").click(function () {

                                                url = "SendArgs.aspx/addTreeNode_text";


                                                data = "{tree_id: '" + $('#tree_id').val() + "',parent_dialog_id: '" + $('#last_clicked').val().replace("card_", "") + "',message: '" + $('#text-container-input').val() + "'}";

                                                // add new object to server
                                                node_type = '1';
                                                //alert(data);
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);

                                                //org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                // log('Clicked text-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                            });
                                            // add html to new object
                                            $("#caruosel-button").click(function () {
                                                // add new object to server
                                                node_type = '5';
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);
                                                //org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                log('Clicked caruosel-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                            });
                                            // add html to new object
                                            $("#image-button").click(function () {

                                                url = "SendArgs.aspx/addTreeNode_HeroCard";
                                                data = "{tree_id: '" + $('#tree_id').val() + "',parent_dialog_id: '" + $('#last_clicked').val() + "'" +
                                                    ",title: '" + $('#image-card-title').val() + "'" +
                                                    ",subtitle: '" + $('#image-card-subtitle').val() + "'" +
                                                    ",text: '" + $('#image-card-text').val() + "'" +
                                                    ",image_url: '" + $('#image-card-image_url').val() + "'" +
                                                    ",button_action_1_text: '" + $('#image-card-button_action_1_text').val() + "'" +
                                                    ",button_action_1_value: '" + $('#image-card-button_action_1_value').val() + "'" +
                                                    "}";

                                                node_type = '3';
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);
                                                //org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                log('Clicked image-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                            });
                                            // add html to new object
                                            $("#video-button").click(function () {

                                                url = "SendArgs.aspx/addTreeNode_VideoCard";
                                                data = "{tree_id: '" + $('#tree_id').val() + "',parent_dialog_id: '" + $('#last_clicked').val() + "'" +
                                                     ",title: '" + $('#video-card-title').val() + "'" +
                                                     ",subtitle: '" + $('#video-card-subtitle').val() + "'" +
                                                     ",text: '" + $('#video-card-text').val() + "'" +
                                                     ",image_url: '" + $('#video-card-image_url').val() + "'" +
                                                     ",media_url: '" + $('#video-card-media_url').val() + "'" +
                                                     ",button_action_1_text: '" + $('#video-card-button_action_1_text').val() + "'" +
                                                     ",button_action_1_value: '" + $('#video-card-button_action_1_value').val() + "'" +
                                                     "}";

                                                // add new object to server
                                                node_type = '4';
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);
                                                //org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                log('Clicked video-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                            });
                                            // add html to new object
                                            $("#audio-button").click(function () {

                                                url = "SendArgs.aspx/addTreeNode_AudioCard";
                                                data = "{tree_id: '" + 1 + "',parent_dialog_id: '" + $('#last_clicked').val() + "'" +
                                                     ",title: '" + $('#audio-card-title').val() + "'" +
                                                     ",subtitle: '" + $('#audio-card-subtitle').val() + "'" +
                                                     ",text: '" + $('#audio-card-text').val() + "'" +
                                                     ",image_url: '" + $('#audio-card-image_url').val() + "'" +
                                                     ",media_url: '" + $('#audio-card-media_url').val() + "'" +
                                                     ",button_action_1_text: '" + $('#audio-card-button_action_1_text').val() + "'" +
                                                     ",button_action_1_value: '" + $('#audio-card-button_action_1_value').val() + "'" +
                                                     "}";

                                                // add new object to server
                                                node_type = '8';
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);
                                                //org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                log('Clicked audio-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                            });
                                            // add html to new object
                                            $("#animation-button").click(function () {

                                                url = "SendArgs.aspx/addTreeNode_AnimationCard";
                                                data = "{tree_id: '" + 1 + "',parent_dialog_id: '" + $('#last_clicked').val() + "'" +
                                                     ",title: '" + $('#animation-card-title').val() + "'" +
                                                     ",subtitle: '" + $('#animation-card-subtitle').val() + "'" +
                                                     ",text: '" + $('#animation-card-text').val() + "'" +
                                                     ",image_url: '" + $('#animation-card-image_url').val() + "'" +
                                                     ",media_url: '" + $('#animation-card-media_url').val() + "'" +
                                                     ",button_action_1_text: '" + $('#animation-card-button_action_1_text').val() + "'" +
                                                     ",button_action_1_value: '" + $('#animation-card-button_action_1_value').val() + "'" +
                                                     "}";

                                                // add new object to server
                                                node_type = '7';
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);
                                                //org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                log('Clicked audio-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                            });
                                            // add html to new object
                                            $("#quick-replys-button").click(function () {

                                                var url = "SendArgs.aspx/addTreeNode_quick_replys";
                                                var data = "{tree_id: '" + $('#tree_id').val() + "',parent_dialog_id: '" +
                                                            $('#last_clicked').val() +
                                                            "',option1: '" + $('#quick-reply-container-input-1').val() + "',option2: '" + $('#quick-reply-container-input-2').val() + "',option3: '" + $('#quick-reply-container-input-3').val() + "'}";

                                                //alert(data);
                                                // add new object to server
                                                node_type = '2';
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);
                                                //org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);

                                                log('Clicked quick-replys-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                            });

                                        }

                                        // just for example purpose
                                        function log(text) {
                                            //$('#consoleOutput').append('<p>' + text + '</p>')
                                        }

                                        function sendToServer(tree_id, parent_dialog_id, dialog_type_id, url, data) {
                                            //int parent_dialog_id, int dialog_type_id
                                            //alert("{tree_id: '" + tree_id + "',parent_dialog_id: '" + parent_dialog_id + "',dialog_type_id: '" + dialog_type_id + "'}");

                                            $.ajax({
                                                type: "POST",
                                                url: url,
                                                data: data,
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: OnSuccess_sendToServer,
                                                failure: function (response) {
                                                    alert(response.d);
                                                },
                                                error: function (response) {
                                                    alert(response.d);
                                                }
                                            });
                                        }

                                        function OnSuccess_sendToServer(response) {
                                            console.log('server answer ' + response.d);

                                            var res = response.d;
                                            var ret_data = res.split("!!!!!");

                                            $("#html_content").append(ret_data[0]);

                                            //$(".draggeble_object").draggable();
                                            $(".draggeble_object").draggable({
                                                drag: function (event, ui) {
                                                    console.log("left:" + ui.position.left);
                                                    // Keep the left edge of the element
                                                    // at least 100 pixels from the container
                                                    //ui.position.left = Math.min(100, ui.position.left);

                                                    $("path").each(function (index) {
                                                        // console.log(index + ": " + $(this).attr('id'));
                                                        var path_ids = $(this).attr('id').split("_");
                                                        console.log(index + ": " + path_ids[1] + " " + path_ids[2]);

                                                        var path = "#path_" + path_ids[1] + "_" + path_ids[2];
                                                        var card1 = "#card_" + path_ids[1];
                                                        var card2 = "#card_" + path_ids[2];
                                                        //console.log(path + " " + card1 + " " + card2);

                                                        if ($(path).length > 0 &&
                                                            $(card1).length > 0 &&
                                                            $(card2).length > 0) {

                                                            connectElements($("#svg1"),
                                                                        $(path),
                                                                        $(card1),
                                                                        $(card2)
                                                                        );
                                                        }


                                                    });

                                                }
                                            });


                                            $("#svg1").append(ret_data[1]);

                                            $("path").each(function (index) {
                                                // console.log(index + ": " + $(this).attr('id'));
                                                var path_ids = $(this).attr('id').split("_");
                                                console.log(index + ": " + path_ids[1] + " " + path_ids[2]);

                                                var path = "#path_" + path_ids[1] + "_" + path_ids[2];
                                                var card1 = "#card_" + path_ids[1];
                                                var card2 = "#card_" + path_ids[2];
                                                //console.log(path + " " + card1 + " " + card2);

                                                connectElements($("#svg1"),
                                                                $(path),
                                                                $(card1),
                                                                $(card2)
                                                                );
                                            });

                                            /*var path_ids = $(this).attr('id').split("_");
                                            console.log(index + ": " + path_ids[1] + " " + path_ids[2]);

                                            var path = "#path_" + path_ids[1] + "_" + path_ids[2];
                                            var card1 = "#card_" + path_ids[1];
                                            var card2 = "#card_" + path_ids[2];
                                            //console.log(path + " " + card1 + " " + card2);

                                            connectElements($("#svg1"),
                                                            $(path),
                                                            $(card1),
                                                            $(card2)
                                                            );
                                            $('#last_clicked').val()*/

                                            /*$(".draggeble_object").draggable({
                                                drag: function (event, ui) { }
                                            });
                                            $(".draggeble_object").draggable({
                                                drag: function (event, ui) {
                                                    console.log("left:" + ui.position.left);
                                                    // Keep the left edge of the element
                                                    // at least 100 pixels from the container
                                                    //ui.position.left = Math.min(100, ui.position.left);

                                                    $("path").each(function (index) {
                                                        // console.log(index + ": " + $(this).attr('id'));
                                                        var path_ids = $(this).attr('id').split("_");
                                                        console.log(index + ": " + path_ids[1] + " " + path_ids[2]);

                                                        var path = "#path_" + path_ids[1] + "_" + path_ids[2];
                                                        var card1 = "#card_" + path_ids[1];
                                                        var card2 = "#card_" + path_ids[2];
                                                        //console.log(path + " " + card1 + " " + card2);

                                                        connectElements($("#svg1"),
                                                                        $(path),
                                                                        $(card1),
                                                                        $(card2)
                                                                        );
                                                    });

                                                }
                                            });*/

                                        }

                                        function deleteFromServer(tree_id, dialog_id) {
                                            //int parent_dialog_id, int dialog_type_id
                                            //alert("{tree_id: '" + tree_id + "',dialog_id: '" + dialog_id + "'}");
                                            $.ajax({
                                                type: "POST",
                                                url: "SendArgs.aspx/deleteTreeNode",
                                                data: "{tree_id: '" + tree_id + "',dialog_id: '" + dialog_id + "'}",
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (response) {
                                                    //alert(dialog_id);
                                                    $("#card_" + dialog_id).remove();

                                                },
                                                failure: function (response) {
                                                    alert(response.d);
                                                },
                                                error: function (response) {
                                                    alert(response.d);
                                                }
                                            });
                                        }

                                        function loadConversationTree(treeIndex) {

                                            $('#loader_spinner').show();

                                            $.ajax({
                                                type: "POST",
                                                url: "SendArgs.aspx/generateConversationTree",
                                                data: '{tree_id: ' + treeIndex + '}',
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: OnSuccess,
                                                failure: function (response) {
                                                    alert(response.d);
                                                },
                                                error: function (response) {
                                                    alert(response.d);
                                                }
                                            });
                                        }

                                        function OnSuccess(response) {
                                            console.log('server answer ' + response.d);
                                            $('#loader_spinner').hide();

                                            //console.log('server answer dataset' + dataset);

                                            $("#html_content").append(response.d);


                                            $(".draggeble_object").draggable();
                                            $(".draggeble_object").draggable({
                                                drag: function (event, ui) { }
                                            });
                                            $(".draggeble_object").draggable({
                                                drag: function (event, ui) {
                                                    console.log("left:" + ui.position.left);
                                                    // Keep the left edge of the element
                                                    // at least 100 pixels from the container
                                                    //ui.position.left = Math.min(100, ui.position.left);

                                                    $("path").each(function (index) {
                                                        // console.log(index + ": " + $(this).attr('id'));
                                                        var path_ids = $(this).attr('id').split("_");
                                                        console.log(index + ": " + path_ids[1] + " " + path_ids[2]);

                                                        var path = "#path_" + path_ids[1] + "_" + path_ids[2];
                                                        var card1 = "#card_" + path_ids[1];
                                                        var card2 = "#card_" + path_ids[2];
                                                        //console.log(path + " " + card1 + " " + card2);

                                                        if ($(path).length > 0 &&
                                                            $(card1).length > 0 &&
                                                            $(card2).length > 0) {

                                                            connectElements($("#svg1"),
                                                                        $(path),
                                                                        $(card1),
                                                                        $(card2)
                                                                        );
                                                        }


                                                    });

                                                }
                                            });


                                            $("path").each(function (index) {
                                                // console.log(index + ": " + $(this).attr('id'));
                                                var path_ids = $(this).attr('id').split("_");
                                                console.log(index + ": " + path_ids[1] + " " + path_ids[2]);

                                                var path = "#path_" + path_ids[1] + "_" + path_ids[2];
                                                var card1 = "#card_" + path_ids[1];
                                                var card2 = "#card_" + path_ids[2];
                                                //console.log(path + " " + card1 + " " + card2);

                                                connectElements($("#svg1"),
                                                                $(path),
                                                                $(card1),
                                                                $(card2)
                                                                );
                                            });



                                            // alert(response.d);
                                            /*org_chart = $('#orgChart').orgChart({
                                                data: dataset,
                                                showControls: true,
                                                allowEdit: true,
                                                onAddNode: function (node) {
                                                    //log('Created new node on node ' + node.data.id);
                                                    //org_chart.newNode(node.data.id);
                                                    //org_chart.newNode($('#last_clicked').val());
                                                },
                                                onDeleteNode: function (node) {

                                                    // add the id of the clicked object
                                                    $('#last_clicked').val(node.data.id);

                                                    console.log('Deleted node ' + node.data.id);

                                                    deleteFromServer('1', node.data.id);

                                                    org_chart.deleteNode(node.data.id);
                                                },
                                                onClickNode: function (node) {

                                                    // add the id of the clicked object
                                                    $('#last_clicked').val(node.data.id);

                                                    log('Clicked node ' + node.data.id);
                                                }


                                            });
                                            */

                                        };

                                        function parseResponse(response) {
                                            var res = str.split(" ");
                                        }

                                        function getHtmlByNodeType(node_type, node_id) {
                                            /*static string dialog_type_text="1";
                                            static string dialog_type_quick_replys = "2";
                                            static string dialog_type_image = "3";
                                            static string dialog_type_buttons = "4";
                                            static string dialog_type_caruosel = "5";*/

                                            if (node_id > 0) {

                                            } else {
                                                if (node_type == '1') {
                                                    return "<img style='max-width:100%;max-height:100%;' src='images/text_massege.JPG' />";
                                                }
                                                else if (node_type == '2') {
                                                    return "<img style='max-width:100%;max-height:100%;' src='images/quick-replys-message.JPG' />";
                                                }
                                                else if (node_type == '3') {
                                                    return "<img style='max-width:100%;max-height:100%;' src='https://cdn.buy2v.co.il/Placement/0e750322-36a2-49ed-8b09-5df9f711f9ce/2b224b25.jpg' />";
                                                }
                                                else if (node_type == '4') {
                                                    //return "<img style='max-width:100%;max-height:100%;' src='https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Big_buck_bunny_poster_big.jpg/220px-Big_buck_bunny_poster_big.jpg' />";
                                                    return "<div class='card' >" +
                                                           "<img style='max-width: 150px; max-height: 150px;' class='card-img-top' src='https://cdn.buy2v.co.il/Images/af739456-0ab1-4b24-a786-70f20c77217b/Light/4c5ab786.jpg' alt='Card image cap'>" +
                                                            "<div class='card-block'>" +
                                                            "<h4 class='card-title'>Card title</h4>" +
                                                            "<h6 class='card-subtitle mb-2 text-muted'>Card subtitle</h6>" +
                                                            "<p class='card-text'>Some quick example text to build on the card title and make up the bulk of the card's content.</p>" +
                                                            "<a href='#' class='btn btn-primary'>Go somewhere</a>" +
                                                            "    </div>" + "</div>";
                                                }
                                                else if (node_type == '5') {
                                                    return "<img style='max-width:100%;max-height:100%;' src='images/caruosel_masseage.JPG' />";
                                                } else if (node_type == '7') {
                                                    return "<img style='max-width:100%;max-height:100%;' src='http://pix.iemoji.com/images/emoji/apple/ios-9/256/face-throwing-a-kiss.png' />";
                                                } else if (node_type == '8') {
                                                    return "<img style='max-width:100%;max-height:100%;' src='https://upload.wikimedia.org/wikipedia/en/3/3c/SW_-_Empire_Strikes_Back.jpg' />";
                                                }
                                            }
                                        }

                                        function getHtmlByNodeType_text(text) {
                                            /*return "<h5 style='width: 100%; text-align: center;dir:rtl'>" + text + "</h5>"*/

                                            return "<div class='card' style='padding:10px'>" +
                                                "<div class='card-block'>" +
                                                "<h5 style='dir:rtl' class='card-subtitle'>" + text + "</h5>" +
                                                "    </div>" + "</div>";
                                        }

                                        function getHtmlByNodeType_quick_replys(option1, option2, option3) {

                                            /* return "<h5><div style='width:100%'>" +
                                                         "<div style='float:right;width:30%'>" + option3 + "</div>" +
                                                         "<div style='float:right;width:30%'>" + option2 + "</div>" +
                                                         "<div style='float:right;width:30%'>" + option1 + "</div>" +
                                                     "</div><h5>"*/

                                            return "<div class='card' >" +
                                                "<h5 style='dir:rtl' class='card-subtitle'>" + "" + "</h5>" +
                                                          "<div class='card-block'>" +
                                                "<table><tr>" +
                                                "<td>" + "<a  href='#' class='card-link btn'>" + option3 + "</a>" + "</td>" +
                                                "<td>" + "<a  href='#' class='card-link btn'>" + option2 + "</a>" + "</td>" +
                                                "<td>" + "<a  href='#' class='card-link btn'>" + option1 + "</a>" + "</td>" +
                                                "</tr></table>";
                                        }

                                        function getHtmlByNodeType_HeroCard(id, title, subtitle, text, image_url, media_url, button_action_1_text, button_action_1_value) {
                                            /* return "<div class='card' >" + 
                                                "<img style='max-width: 150px; max-height: 150px;' class='card-img-top' src='https://cdn.buy2v.co.il/Images/af739456-0ab1-4b24-a786-70f20c77217b/Light/4c5ab786.jpg' alt='Card image cap'>" +
                                                "<div class='card-block'>" +
                                                "<h4 class='card-title'>Card title</h4>" +
                                                "<h6 class='card-subtitle mb-2 text-muted'>Card subtitle</h6>" +
                                                "<p class='card-text'>Some quick example text to build on the card title and make up the bulk of the card's content.</p>" +
                                                "<a href='#' class='btn btn-primary'>Go somewhere</a>" +
                                                "    </div>" + "</div>";*/

                                            return "<div class='card' >" +
                                                          "<img style='max-width: 150px; max-height: 150px;' " +
                                                                "class='card-img-top' src='" + image_url + "' alt='Card image cap'>" +
                                                           "<div class='card-block'>" +
                                                           "<h4 id='title_" + id + "' class='card-title' onClick='updateTextElement(" + '"' + id + '"' + "," + '"title"' + ")' >" + title + "</h4>" +
                                                            "<div class='card-block' style='display:none;padding-bottom:20px;padding-top:20px' id='update_title_panel" + id + "'>" +
                                                                "<input  type='text' class='form-control' id='title_input" + id + "' placeholder='Add Title' value='" + title + "'/>" +
                                                                "<a href='#' onClick='cancelText(" + '"' + id + "" + '"' + ")' >" + "<i class='material-icons'>close</i>" + "</a>" +
                                                                "<a href='#' onClick='updateText(" + '"' + id + "" + '"' + ")' >" + "<i class='material-icons'>done</i>" + "</a>" +
                                                            "</div>" +
                                                           "<h6 id='subtitle_" + id + "' class='card-subtitle mb-2 text-muted' onClick='updateTextElement(" + '"' + id + '"' + "," + '"subtitle"' + ")'>" + subtitle + "</h6>" +
                                                           "<p id='text_" + id + "' class='card-text' onClick='updateTextElement(" + '"' + id + '"' + "," + '"text"' + ")'>" + text + "</p>" +
                                                           "<a href='" + button_action_1_value + "' class='btn btn-primary'>" + button_action_1_text + "</a>" +
                                                           "</div>" + "</div>";
                                        }

                                    </script>
                                </div>
                                <!-- -->
                                <div class="footer">
                                    <div class="legend">
                                        &nbsp&nbsp
                                            <i class="fa fa-circle text-danger"></i>55% Usage &nbsp&nbsp
                                            <i class="fa fa-circle text-info"></i>25% Usage&nbsp&nbsp
                                            <i class="fa fa-circle text-warning"></i>25% Usage &nbsp&nbsp                                
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        &nbsp&nbsp
                                            <i class="fa fa-clock-o"></i>&nbsp Last Edited 20 minuts ago
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


               




            </div>


        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:botConnectionString_170 %>" SelectCommand="SELECT * FROM [Dialogs_Analytics] WHERE ([treeID] = @treeID) ORDER BY [id] DESC">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="9" Name="treeID" QueryStringField="tree_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
