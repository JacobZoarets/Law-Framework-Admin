<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewClient.aspx.cs" Inherits="AddNewClient" %>

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

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

    <%--<script src="js/DrawJs.js"></script>--%>
    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Light Bootstrap Table core CSS  -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <%--<script src="assets/jquery.fbmessenger-develop/src/js/jquery.fbmessenger.js"></script>--%>
    <!--<script src="assets/jquery.fbmessenger-develop/dist/jquery.fbmessenger.min.js"></script>-->
    <%--<link href="assets/jquery.fbmessenger-develop/dist/jquery.fbmessenger.css" rel="stylesheet" />--%>

    <style>
        .wizard {
            margin: 20px auto;
            background: #fff;
        }

            .wizard .nav-tabs {
                position: relative;
                margin: 40px auto;
                margin-bottom: 0;
                border-bottom-color: #e0e0e0;
            }

            .wizard > div.wizard-inner {
                position: relative;
            }

        .connecting-line {
            height: 2px;
            background: #e0e0e0;
            position: absolute;
            width: 80%;
            margin: 0 auto;
            left: 0;
            right: 0;
            top: 50%;
            z-index: 1;
        }

        .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
            color: #555555;
            cursor: default;
            border: 0;
            border-bottom-color: transparent;
        }

        span.round-tab {
            width: 70px;
            height: 70px;
            line-height: 70px;
            display: inline-block;
            border-radius: 100px;
            background: #fff;
            border: 2px solid #e0e0e0;
            z-index: 2;
            position: absolute;
            left: 0;
            text-align: center;
            font-size: 25px;
        }

            span.round-tab i {
                color: #555555;
            }

        .wizard li.active span.round-tab {
            background: #fff;
            border: 2px solid #5bc0de;
        }

            .wizard li.active span.round-tab i {
                color: #5bc0de;
            }

        span.round-tab:hover {
            color: #333;
            border: 2px solid #333;
        }

        .wizard .nav-tabs > li {
            width: 25%;
        }

        .wizard li:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 0;
            margin: 0 auto;
            bottom: 0px;
            border: 5px solid transparent;
            border-bottom-color: #5bc0de;
            transition: 0.1s ease-in-out;
        }

        .wizard li.active:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 1;
            margin: 0 auto;
            bottom: 0px;
            border: 10px solid transparent;
            border-bottom-color: #5bc0de;
        }

        .wizard .nav-tabs > li a {
            width: 70px;
            height: 70px;
            margin: 20px auto;
            border-radius: 100%;
            padding: 0;
        }

            .wizard .nav-tabs > li a:hover {
                background: transparent;
            }

        .wizard .tab-pane {
            position: relative;
            padding-top: 50px;
        }

        .wizard h3 {
            margin-top: 0;
        }

        @media( max-width : 585px ) {

            .wizard {
                width: 90%;
                height: auto !important;
            }

            span.round-tab {
                font-size: 16px;
                width: 50px;
                height: 50px;
                line-height: 50px;
            }

            .wizard .nav-tabs > li a {
                width: 50px;
                height: 50px;
                line-height: 50px;
            }

            .wizard li.active:after {
                content: " ";
                position: absolute;
                left: 35%;
            }
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
                        <li >


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="AddNewReference.aspx">

                                <p style="font-size: 20px">חוקים ואסמכתאות</p>


                            </a>
                        </li>
                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href='http://localhost:62801/Framework.aspx?tree_id=6'>

                                <p style="font-size: 20px">חוק הספאם</p>


                            </a>
                        </li>
                        <li class="divider">&nbsp</li>
                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href='ChatPage.aspx'>

                                <p style="font-size: 20px">ממשק שיחה</p>


                            </a>
                        </li>
                        <li class="active">


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
                        <div class="card" >
                            
                                <div class="row" style="width:50%;margin-left:40px">
                                    <section>
                                        <div class="wizard">
                                            <div class="wizard-inner">
                                                <div class="connecting-line"></div>
                                                <ul class="nav nav-tabs" role="tablist">

                                                    <li role="presentation" class="active">
                                                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                                                            <span class="round-tab">
                                                                <i class="glyphicon glyphicon-folder-open"></i>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li role="presentation" class="disabled">
                                                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                                                            <span class="round-tab">
                                                                <i class="glyphicon glyphicon-pencil"></i>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li role="presentation" class="disabled">
                                                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                                                            <span class="round-tab">
                                                                <i class="glyphicon glyphicon-picture"></i>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li role="presentation" class="disabled">
                                                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                                                            <span class="round-tab">
                                                                <i class="glyphicon glyphicon-ok"></i>
                                                            </span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>

                                            <form role="form">
                                                <div class="tab-content" style="direction:rtl" >
                                                    <div class="tab-pane active" role="tabpanel" id="step1">
                                                        <h3>הכנס את פרטי הלקוח החדש</h3>
                                                        <p>שם לקוח</p>
                                                        <div class="input-group">
                                                             <input id="desktop_bk_image_url" type="text" placeholder="הכנס שם לקוח" class="form-control" value="">

                                                        </div>
                                                        <br />
                                                        
                                                        <ul class="list-inline pull-left">
                                                            <li>
                                                                <button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                                                        </ul>
                                                    </div>
                                                    <div class="tab-pane" role="tabpanel" id="step2">
                                                        <h3>הכנס אימייל לקבלת התראות</h3>
                                                        <p>כתובת אימייל </p>
                                                        <div class="input-group">
                                                             <input id="desktop_bk_image_url" type="text" placeholder="הכנס כתובת אימייל" class="form-control" value="">

                                                        </div>
                                                        <ul class="list-inline pull-left">
                                                            <li>
                                                                <button type="button" class="btn btn-default prev-step">Previous</button></li>
                                                            <li>
                                                                <button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                                                        </ul>
                                                    </div>
                                                    <div class="tab-pane" role="tabpanel" id="step3">
                                                        <h3>הכנס מידע נוסף</h3>
                                                        <p>מידע נוסף </p>
                                                        <div class="input-group">
                                                             <input id="desktop_bk_image_url" type="text" placeholder="הכנס מידע נוסף" class="form-control" value="">

                                                        </div>
                                                        <ul class="list-inline pull-left">
                                                            <li>
                                                                <button type="button" class="btn btn-default prev-step">Previous</button></li>
                                                            <li>
                                                                <button type="button" class="btn btn-default next-step">Skip</button></li>
                                                            <li>
                                                                <button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
                                                        </ul>
                                                    </div>
                                                    <div class="tab-pane" role="tabpanel" id="complete">
                                                        <h3>תהליך הוספת לקוח הושלם</h3>
                                                        <p>הלקוח נוסף למערכת</p>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </form>
                                        </div>
                                    </section>
                                </div>
                           
        </div>
        </div>
                </div>




            </div>
    </form>


    <script type="text/javascript">

        $(document).ready(function () {
            //Initialize tooltips
            $('.nav-tabs > li a[title]').tooltip();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                var $target = $(e.target);

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

            });
            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

            });
        });

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }
        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }
    </script>

</body>
</html>
