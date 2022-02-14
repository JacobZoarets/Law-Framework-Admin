<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultOld.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <link href="jquery.orgchart.css" media="all" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-latest.js"></script>
    <script src="//cdn.rawgit.com/noelboss/featherlight/1.7.1/release/featherlight.min.js" type="text/javascript" charset="utf-8"></script>


    <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- <link rel="stylesheet" href="https://app.botsociety.io/dist/complete.css?version=1.4.4a" />-->
    <link rel="stylesheet" href="https://app.botsociety.io/css/lib/angular-material.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>

    <link rel="stylesheet" href="https://app.botsociety.io/css/bootstrap.css" />


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
    <link href="css/dashboard.css" rel="stylesheet" />

    <style type="text/css">
        #orgChart {
            width: auto;
            height: auto;
        }

        #orgChartContainer {
            width: 100%;
            height: 100%;
            overflow: auto;
            background: #ffffff;
        }

        body {
            padding-top: 0px;
            font-family: "Roboto","Helvetica Neue",Arial,sans-serif;
        }
    </style>
    <script type="text/javascript">
        function updateTextElement(input_id,type) {
            //alert("You chossed " + type.toString());
            document.getElementById("update_type").value = type;
            //alert("You chossed " + document.getElementById("update_type").value);

            

            var title_id = type + "_" + input_id;
            var input_title_id = "update_title_panel" + input_id;
            var title_element = document.getElementById(title_id);
            var update_title_element = document.getElementById(input_title_id);
            if (update_title_element.style.display === 'none') {
                update_title_element.style.display = 'block';
                title_element.style.display = 'none';
                document.getElementById("title_input" + input_id).value = title_element.innerHTML;
            } else {
                update_title_element.style.display = 'none';
                title_element.style.display = 'block';
            }
        }

        function updateText(input_id, type) {
            //alert("You chossed " + input_id.toString());

            var title_id = document.getElementById("update_type").value + "_" + input_id;
            var input_title_id = "update_title_panel" + input_id;
            var title_element = document.getElementById(title_id);
            var update_title_element = document.getElementById(input_title_id);
            if (update_title_element.style.display === 'none') {
                update_title_element.style.display = 'block';
                title_element.style.display = 'none';
            } else {
                update_title_element.style.display = 'none';
                title_element.style.display = 'block';
            }

            var title_input = "title_input" + input_id;
            var title_input_element = document.getElementById(title_input);

            title_element.innerHTML = document.getElementById(title_input).value;
        }
        
        function cancelText(input_id, type) {
            //alert("You chossed " + input_id.toString());

            var title_id = document.getElementById("update_type").value + "_" + input_id;
            var input_title_id = "update_title_panel" + input_id;
            var title_element = document.getElementById(title_id);
            var update_title_element = document.getElementById(input_title_id);
            if (update_title_element.style.display === 'none') {
                update_title_element.style.display = 'block';
                title_element.style.display = 'none';
            } else {
                update_title_element.style.display = 'none';
                title_element.style.display = 'block';
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="last_clicked" type="hidden" value="5" />
        <input id="update_type" type="hidden" value="5" />
        <div id="message_creator" style="display: none; position: absolute; z-index: 1000">
            <div style="width: 26em" id="tabs">
                <ul>
                    <li>
                        <a href="#tabs-1">
                            <i class="material-icons">text_format</i>
                        </a>
                    </li>
                    <li>
                        <a href="#tabs-2">
                            <i class="material-icons">view_carousel</i>
                        </a>
                    </li>
                    <li>
                        <a href="#tabs-3">
                            <i class="material-icons">add_a_photo</i>
                        </a>
                    </li>
                    <li>
                        <a href="#tabs-4">

                            <i class="material-icons">movie</i>
                        </a>
                    </li>
                    <li>
                        <a href="#tabs-7">

                            <i class="material-icons">music_video</i>
                        </a>
                    </li>
                    <li>
                        <a href="#tabs-8">

                            <i class="material-icons">tag_faces</i>
                        </a>
                    </li>
                    <li>
                        <a href="#tabs-5">
                            <i class="material-icons">power_input</i>
                        </a>
                    </li>
                    <li>
                        <a id="close_icon" href="#tabs-6">
                            <i class="material-icons">close</i>

                        </a>
                    </li>
                </ul>
                <div id="tabs-1">
                    <p id="text-container">

                        <label style="width: 100%; text-align: right">הוסף הודעת טקסט</label>

                        <input type="text" style="width: 100%;" id="text-container-input" />

                    </p>

                    <i id="text-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-2">
                    <div id="caruosel-container">
                        <label style="width: 100%; text-align: right">הוסף קרוסלת מידע</label>
                        <img src="images/caruosel_masseage.JPG" />
                    </div>

                    <i id="caruosel-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-3">
                    <div id="image-card-container">
                        <label style="width: 100%; text-align: right">הוסף כרטיס תמונה</label>
                        <div class="form-group">
                            <input id="image-card-title" type="text" class="form-control" placeholder="Image Title" />
                            <input id="image-card-subtitle" type="text" class="form-control" placeholder="Image Subtitle" />
                            <input id="image-card-text" type="text" class="form-control" placeholder="Image Text" />
                            <input id="image-card-image_url" type="text" class="form-control" placeholder="Image Url" />
                            <input id="image-card-button_action_1_text" type="text" class="form-control" placeholder="Image Action text" />
                            <input id="image-card-button_action_1_value" type="text" class="form-control" placeholder="Image Action Value" />
                        </div>
                    </div>

                    <i id="image-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-4">
                    <div id="video-card-container">
                        <label style="width: 100%; text-align: right">הוסף כרטיס וידאו</label>
                        <div class="form-group">
                            <input id="video-card-title" type="text" class="form-control" placeholder="Video Title" />
                            <input id="video-card-subtitle" type="text" class="form-control" placeholder="Video Subtitle" />
                            <input id="video-card-text" type="text" class="form-control" placeholder="Video Text" />
                            <input id="video-card-image_url" type="text" class="form-control" placeholder="Video Image Url" />
                            <input id="video-card-media_url" type="text" class="form-control" placeholder="Video Media Url" />
                            <input id="video-card-button_action_1_text" type="text" class="form-control" placeholder="Video Action text" />
                            <input id="video-card-button_action_1_value" type="text" class="form-control" placeholder="Video Action Value" />
                        </div>
                    </div>

                    <i id="video-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-7">
                    <div id="Aideo-card-container">
                        <label style="width: 100%; text-align: right">הוסף כרטיס אודיו</label>
                        <div class="form-group">
                            <input id="audio-card-title" type="text" class="form-control" placeholder="Audio Title" />
                            <input id="audio-card-subtitle" type="text" class="form-control" placeholder="Audio Subtitle" />
                            <input id="audio-card-text" type="text" class="form-control" placeholder="Audio Text" />
                            <input id="audio-card-image_url" type="text" class="form-control" placeholder="Audio Image Url" />
                            <input id="audio-card-media_url" type="text" class="form-control" placeholder="Audio Media Url" />
                            <input id="audio-card-button_action_1_text" type="text" class="form-control" placeholder="Audio Action text" />
                            <input id="audio-card-button_action_1_value" type="text" class="form-control" placeholder="Audio Action Value" />
                        </div>
                    </div>

                    <i id="audio-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-8">
                    <div id="animation-card-container">
                        <label style="width: 100%; text-align: right">הוסף כרטיס אנימציה</label>
                        <div class="form-group">
                            <input id="animation-card-title" type="text" class="form-control" placeholder="Animation Title" />
                            <input id="animation-card-subtitle" type="text" class="form-control" placeholder="Animation Subtitle" />
                            <input id="animation-card-text" type="text" class="form-control" placeholder="Animation Text" />
                            <input id="animation-card-image_url" type="text" class="form-control" placeholder="Animation Image Url" />
                            <input id="animation-card-media_url" type="text" class="form-control" placeholder="Animation Media Url" />
                            <input id="animation-card-button_action_1_text" type="text" class="form-control" placeholder="Animation Action text" />
                            <input id="animation-card-button_action_1_value" type="text" class="form-control" placeholder="Animation Action Value" />
                        </div>
                    </div>

                    <i id="animation-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-5">



                    <div id="quick-reply-container">


                        <label style="width: 100%; text-align: right">הוסף תפריט תגובות משתמש</label>
                        <div class="form-group">
                            <input id="quick-reply-container-input-1" type="text" class="form-control" placeholder="Reply 1" />
                            <input id="quick-reply-container-input-2" type="text" class="form-control" placeholder="Reply 2" />
                            <input id="quick-reply-container-input-3" type="text" class="form-control" placeholder="Reply 3" />
                        </div>


                    </div>

                    <i id="quick-replys-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-6">
                    <i class="material-icons">add_circle</i>   הוסף אובייקט חדש ולחץ על ה 
                </div>
            </div>
        </div>


        <div class="wrapper">
            <div class="sidebar" data-color="azure" data-image="https://www.azrieli.com/assets/themes/Azrieli/images/logo.png?8835a451">

                <!--

        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
        Tip 2: you can also add an image using data-image tag

    -->

                <div class="sidebar-wrapper">
                    <div class="logo">

                        <a href="#" class="simple-text">
                            <img width="100%" src="https://www.azrieli.com/assets/themes/Azrieli/images/logo.png?8835a451" />
                        </a>
                    </div>

                    <ul class="nav">
                        <li class="active">
                            <a href="dashboard.html">
                                <i class="pe-7s-graph"></i>
                                <p>Conversation Trees</p>
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
                            <a class="navbar-brand" href="#">Dashboard</a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-left">
                                <li>
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-dashboard"></i>
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
                                    <a href="">Account
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
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Create Conversation Tree</h4>
                                        <p class="category">Create Conversation Tree Performance</p>
                                    </div>
                                    <div class="content">

                                        <div id="loader_spinner" class="loader">Loading...</div>
                                        <!-- add here -->
                              
                                      <!--  <div>
                                                                                        
                                            <div class="card" style="width: 30rem;">
                                                
                                                <div class="card-block">
                                                    <h4 class="card-title">Card title</h4>
                                                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                                </div>
                                            </div>
                                            <div class="card" style="width: 30rem;">
                                                <img class="card-img-top" style="width: 30rem;" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20%282%29.jpg" alt="Card image cap">
                                                <div class="card-block">
                                                    <input type="text" class="form-control card-title" placeholder="Country" value=""/>
                                                    <h4 class="card-title">Card title</h4>
                                                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                                </div>
                                            </div>-->

                                        <div id="orgChartContainer">

                                            <div id="orgChart"></div>
                                        </div>
                                        <div id="consoleOutput">
                                        </div>

                                        <script type="text/javascript" src="jquery.orgchart.js"></script>
                                        <script type="text/javascript">

                                            $(function () {

                                                loadConversationTree('1');

                                                // show the add/delete buttons
                                                $(".node").hover(function () {
                                                    $(this).find(".org-add-button").css("display", "block");
                                                }, function () {
                                                    $(this).find(".org-add-button").css("display", "none");
                                                });

                                                
                                                                                               

                                                $(".node").hover(function () {
                                                    //$(this).find(".org-controls").css("display", "block");

                                                    // omclick to show message creator
                                                    $(this).find(".org-add-button").click(function () {
                                                        log('Clicked node אקדא');
                                                        // add the id of the clicked object
                                                        var thisId = $(this).parent().attr('node-id');
                                                        console.log('the_thisId ' + thisId);

                                                        $('#last_clicked').val(thisId);

                                                        log('Clicked node ' + thisId);

                                                        $("#message_creator").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                                    });
                                                }, function () {
                                                    $(this).find(".org-controls").css("display", "none");
                                                });



                                                // close message creator
                                                $("#close_icon").click(function () {
                                                    $("#message_creator").fadeOut();
                                                });

                                                $(".card-title").click(function () {
                                                    log('Clicked card-title');
                                                    //$(this).parent().find("#title_input").css("display", "block");

                                                });

                                                connectClickButtons();


                                                $("#tabs").tabs();
                                            });


                                            function connectClickButtons() {
                                                /*static string dialog_type_text="1";
                                                static string dialog_type_quick_replys = "2";
                                                static string dialog_type_image = "3";
                                                static string dialog_type_buttons = "4";
                                                static string dialog_type_caruosel = "5";*/
                                                var node_type = 0;
                                                var url = "SendArgs.aspx/addTreeNode";
                                                var data = "{tree_id: '" + 1 + "',parent_dialog_id: '" + $('#last_clicked').val() + "',dialog_type_id: '" + 1 + "'}";

                                                // add html to new object
                                                $("#text-button").click(function () {

                                                    url = "SendArgs.aspx/addTreeNode_text";
                                                    data = "{tree_id: '" + 1 + "',parent_dialog_id: '" + $('#last_clicked').val() + "',message: '" + $('#text-container-input').val() + "'}";

                                                    // add new object to server
                                                    node_type = '1';
                                                    sendToServer(1, $('#last_clicked').val(), node_type, url, data);
                                                    org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                    log('Clicked text-button ' + $('#last_clicked').val());
                                                    $("#message_creator").fadeOut();
                                                });
                                                // add html to new object
                                                $("#caruosel-button").click(function () {
                                                    // add new object to server
                                                    node_type = '5';
                                                    sendToServer(1, $('#last_clicked').val(), node_type, url, data);
                                                    org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                    log('Clicked caruosel-button ' + $('#last_clicked').val());
                                                    $("#message_creator").fadeOut();
                                                });
                                                // add html to new object
                                                $("#image-button").click(function () {



                                                    url = "SendArgs.aspx/addTreeNode_HeroCard";
                                                    data = "{tree_id: '" + 1 + "',parent_dialog_id: '" + $('#last_clicked').val() + "'" +
                                                        ",title: '" + $('#image-card-title').val() + "'" +
                                                        ",subtitle: '" + $('#image-card-subtitle').val() + "'" +
                                                        ",text: '" + $('#image-card-text').val() + "'" +
                                                        ",image_url: '" + $('#image-card-image_url').val() + "'" +
                                                        ",button_action_1_text: '" + $('#image-card-button_action_1_text').val() + "'" +
                                                        ",button_action_1_value: '" + $('#image-card-button_action_1_value').val() + "'" +
                                                        "}";

                                                    node_type = '3';
                                                    sendToServer(1, $('#last_clicked').val(), node_type, url, data);
                                                    org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                    log('Clicked image-button ' + $('#last_clicked').val());
                                                    $("#message_creator").fadeOut();
                                                });
                                                // add html to new object
                                                $("#video-button").click(function () {

                                                    url = "SendArgs.aspx/addTreeNode_VideoCard";
                                                    data = "{tree_id: '" + 1 + "',parent_dialog_id: '" + $('#last_clicked').val() + "'" +
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
                                                    sendToServer(1, $('#last_clicked').val(), node_type, url, data);
                                                    org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
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
                                                    sendToServer(1, $('#last_clicked').val(), node_type, url, data);
                                                    org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
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
                                                    sendToServer(1, $('#last_clicked').val(), node_type, url, data);
                                                    org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);
                                                    log('Clicked audio-button ' + $('#last_clicked').val());
                                                    $("#message_creator").fadeOut();
                                                });
                                                // add html to new object
                                                $("#quick-replys-button").click(function () {

                                                    var url = "SendArgs.aspx/addTreeNode_quick_replys";
                                                    var data = "{tree_id: '" + 1 + "',parent_dialog_id: '" +
                                                                $('#last_clicked').val() +
                                                                "',option1: '" + $('#quick-reply-container-input-1').val() + "',option2: '" + $('#quick-reply-container-input-2').val() + "',option3: '" + $('#quick-reply-container-input-3').val() + "'}";

                                                    //alert(data);
                                                    // add new object to server
                                                    node_type = '2';
                                                    sendToServer(1, $('#last_clicked').val(), node_type, url, data);
                                                    org_chart.newNode($('#last_clicked').val(), getHtmlByNodeType(node_type, 0), node_type);

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
                                                    success: function (response) {
                                                        //alert(response.d);
                                                    },
                                                    failure: function (response) {
                                                        alert(response.d);
                                                    },
                                                    error: function (response) {
                                                        alert(response.d);
                                                    }
                                                });
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
                                                        //alert(response.d);
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
                                                    url: "SendArgs.aspx/getConversationTree",
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

                                                var dataset = eval('(' + response.d + ')');

                                                /*var dataset = [
                                                   { id: 1, name: 'My Organization', parent: 0 },
                                                   { id: 2, name: 'CEO Office', parent: 1 },
                                                   { id: 3, name: 'Division 1', parent: 1 },
                                                   { id: 4, name: 'Division 2', parent: 1 },
                                                   { id: 6, name: 'Division 3', parent: 1 },
                                                   { id: 7, name: 'Division 4', parent: 1 },
                                                   { id: 8, name: 'Division 5', parent: 1 },
                                                   { id: 5, name: 'Sub Division', parent: 3 },

                                                                                            ];

                                                console.log('server answer eval ' + eval('(' + response.d + ')'));*/

                                                console.log('server answer dataset' + dataset);

                                                // alert(response.d);
                                                org_chart = $('#orgChart').orgChart({
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
                                                                                        
                                            function getHtmlByNodeType_HeroCard(id,title, subtitle, text, image_url, media_url, button_action_1_text, button_action_1_value) {
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
                                                                "</div>"+
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
                                            <i class="fa fa-circle text-info"></i>Open
                                       
                                                <i class="fa fa-circle text-danger"></i>Bounce
                                       
                                                <i class="fa fa-circle text-warning"></i>Unsubscribe
                                   
                                        </div>
                                        <hr>
                                        <div class="stats">
                                            <i class="fa fa-clock-o"></i>Last Edited 2 days ago
                                   
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div>


                        </div>




                    </div>
                </div>




            </div>
        </div>


    </form>
</body>
</html>
