<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Framework.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        -->
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
    <style type="text/css">
        body {
            padding-top: 0px;
            font-family: "Roboto","Helvetica Neue",Arial,sans-serif;
        }

        #svgContainer {
            position: absolute;
            background-color: white;
            opacity: 0.5;
        }

        .org-add-button,
        .org-del-button,
        .org-confirm-del-button {
            position: absolute;
            font-size: 12px;
        }

        .org-add-button {
            bottom: 3px;
            left: 5px;
            padding-left: 13px;
            background: url(./add.png) no-repeat 0 3px;
            /* display:none;*/
        }

            .org-add-button:hover,
            .org-del-button:hover {
                border-radius: 2px;
                cursor: pointer;
            }

        .org-del-button {
            background: url(./delete.png) no-repeat;
            width: 12px;
            height: 12px;
            bottom: 7px;
            right: 5px;
        }

        .draggeble_object {
            margin: 20px;
        }
    </style>
    <script type="text/javascript">

        function setAsDefaultTree(tree_id) {
            //alert(tree_id);

            url = "SendArgs.aspx/setDefaultConversationTree";


            data = "{tree_id: " + tree_id + "}";

            // add new object to server
            //node_type = '1';
            //alert(data);

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



        function updateTextElement(input_id, type) {
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
                        <li class="active">


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="LawsManagment.aspx">

                                <p style="font-size: 20px">חוקים ואסמכתאות</p>


                            </a>
                        </li>
                        <li class="divider">&nbsp</li>

                        <li >


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="ChatPage.aspx?conversation_id=11">

                                <p style="font-size: 20px">שאלון היכרות</p>


                            </a>
                        </li>
                        <li class="divider">&nbsp</li>

                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="ClientsManagment.aspx">

                                <p style="font-size: 20px">ממשק פריסת סיכונים</p>


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

                                <iframe runat="server" id="iframe_comp" width="100%" height="1500px" frameborder="0" src="Default.aspx?tree_id=6" />


                            </div>


                        </div>




                    </div>
                </div>




            </div>
    </form>
</body>
</html>


