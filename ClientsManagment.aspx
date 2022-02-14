<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClientsManagment.aspx.cs" Inherits="ClientsManagment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>


    <!--  CSS for Demo Purpose, don't include it in your project -->
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
    <%--<link href="http://lbi.co.il/projects/5NowAdmin/assets/Bootstrap%20v4.1.3/css/bootstrap.min.css" rel="stylesheet" />--%>
    <script src="http://bernii.github.io/gauge.js/dist/gauge.min.js"></script>

    <link rel="stylesheet" href="ToolTipFiles/ex.css" type="text/css" />

    <style type="text/css">
        div#tipDiv {
            font-size: 11px;
            line-height: 1.2;
            color: #000;
            background-color: #E1E5F1;
            border: 1px solid #667295;
        }

            div#tipDiv div.topBar {
                background-color: #0D2878;
                min-height: 14px; /* for bg color if no caption (close.gif is 14px) */
                text-align: center;
            }

            /* for ie < 7 */
            * html div#tipDiv div.topBar {
                height: 14px; /* ie will expand if needed  */
            }

            div#tipDiv span.caption {
                color: #fff;
                font-weight: bold;
            }

            div#tipDiv div.XtipContent {
                padding: 4px;
            }

            /* used in dw_Tooltip.wrapImageOverText */
            div#tipDiv div.img {
                text-align: center;
                margin: 4px 0;
            }

            div#tipDiv div.txt {
                text-align: center;
                margin: 4px 0;
            }

        h5, .h5 {
            font-size: 1.57em;
            line-height: 1.4em;
            margin-bottom: 15px;
        }
    </style>
    <%--<script src="js/dw_tooltip_c.js" type="text/javascript"></script>--%>
    <script src="ToolTipFiles/dw_tooltip_c.js"></script>

    <script type="text/javascript">

        
        // Problems, errors? See http://www.dyn-web.com/tutorials/obj_lit.php#syntax
        dw_Tooltip.defaultProps = {
            activateOnClick: true,
            supportTouch: true,
            showCloseBox: true,
            closeBoxImage: 'ToolTipFiles/images/close.gif',
            wrapFn: dw_Tooltip.wrapToWidth
        }

        // Most of the formatting functions support optional caption
        // See http://www.dyn-web.com/code/tooltips/documentation2.php#wrapFn
        dw_Tooltip.content_vars = {
            L1: {
                img: 'ToolTipFiles/images/email111.JPG',
                w: 20
            },
            L2: {
                caption: '',
                img: 'ToolTipFiles/images/email22.JPG',
                w: 20
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
                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="LawsManagment.aspx">

                                <p style="font-size: 20px">חוקים ואסמכתאות</p>


                            </a>
                        </li>
                        <li class="divider">&nbsp</li>

                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="ChatPage.aspx?conversation_id=11">

                                <p style="font-size: 20px">שאלון היכרות</p>


                            </a>
                        </li>
                        <li class="divider">&nbsp</li>

                        <li class="active">


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="ClientsManagment.aspx">

                                <p style="font-size: 20px">ממשק פריסת סיכונים</p>


                            </a>
                        </li>
                         <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="AgmonBunner.html" target="_blank">

                                <p style="font-size: 20px">טיזר ללקוח</p>


                            </a>
                        </li>
                        <li class="divider">&nbsp</li>
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
                            <div class="col-lg-12">
                                <div class="card card-chart">
                                    <div class="card-header">
                                        <div class="row">
                                            <a href="AddNewReference.aspx">
                                                <table style="margin-left: 45px; margin-top: 25px">
                                                    <tr>
                                                        <td>
                                                            <img src="https://4.bp.blogspot.com/-gfkXY65adsU/WepEU5oTR5I/AAAAAAAAADI/ZhPMS8-hN6ALM_MT95OdTUWfCz5qw0iSQCLcBGAs/s1600/FB.png" style="width: 55px" /></td>
                                                        <td>
                                                            <h5 class="card-text" style="margin-left: 10px">הוסף לקוח חדש</h5>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </a>

                                        </div>
                                        <h5 class="card-title"></h5>
                                        <%--<h4 class="card-category">A list of created campaigns</h4>--%>
                                        <%--<h6 class="card-category" id="users_count"></h6>--%>
                                    </div>
                                    <div class="card-body">
                                        <div class="row" id="campaigns_container" runat="server">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div class="card" style="width: 250px; direction: rtl; margin-left: 50px; margin-top: 25px;">
                                                            <a href="Saved_ChatPage.aspx" target="_blank">
                                                                <img class="card-img-top" alt="Card image cap" src="https://kontak.me/rw_common/plugins/stacks/armadillo/media/spambot.jpg" style="max-height: 157px; min-height: 157px; max-width: 250px" />
                                                            </a>
                                                            <div class="card-body">
                                                                <br />
                                                                <h6 class="card-text">שם הלקוח:</h6>
                                                                <h6 class="card-text">יעקב זוארץ </h6>
                                                                <h5 class="card-text">חוק הספאם</h5>
                                                                <h5 class="card-text">מספר שאלות: 25</h5>
                                                                <h5 id="saved_conversation_danger_count" class="card-text">מספר סיכונים: 1</h5>
                                                                <a id="saved_conversation_link" href="Saved_ChatPage.aspx" target="_blank">
                                                                    <h6 class="card-text">ארכיון שיחה</h6>
                                                                </a>
                                                                <p class="card-text">סידרה של שאלות המתוכננות לבדוק סיכונים מול חוק הספאם</p>

                                                                <%--<img class="card-img-top" alt="Card image cap" src="https://getmygraphics.com/files/2015/07/Gauge_0086-1080x675.jpg" style="max-height: 157px; min-height: 157px; max-width: 250px" />--%>
                                                                <canvas id="canvas_1" style="max-width: 250px"></canvas>
                                                                <h5 class="card-text">התראות שנשלחו ללקוח:</h5>

                                                                <table style="border: 0; width: 100%">
                                                                    <tr>
                                                                        <td colspan="3">לא נימצאו התראות</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp</td>
                                                                        <td>&nbsp</td>
                                                                        <td>&nbsp</td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                            </div>
                                                            <div class="card-footer">
                                                                <div id="saved_conversation_dateTime" class="stats" style="direction: ltr">
                                                                    <i class="now-ui-icons ">תאריך אנליזה אחרון - 28.10.18 12:45</i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="card" style="width: 250px; direction: rtl; margin-left: 50px; margin-top: 25px;">
                                                            <a href="#" target="_blank">
                                                                <img class="card-img-top" alt="Card image cap" src="http://ad3.co.il/_data/Pic/16-2434_1.GIF" style="max-height: 157px; min-height: 157px; max-width: 250px" />
                                                            </a>
                                                            <div class="card-body">
                                                                <br />
                                                                <h6 class="card-text">שם הלקוח:</h6>
                                                                <h6 class="card-text">יעקב זוארץ </h6>
                                                                <h5 class="card-text">חוק הגנת הצרכן</h5>
                                                                <h5 class="card-text">מספר שאלות: 32</h5>
                                                                <h5 class="card-text">מספר סיכונים: 5</h5>
                                                                <a href="#" target="_blank">
                                                                    <h6 class="card-text">ארכיון שיחה</h6>
                                                                </a>
                                                                <p class="card-text">סידרה של שאלות המתוכננות לבדוק סיכונים מול חוק הגנת הצרכן</p>
                                                                <%--<h6 class="card-text">שם הלקוח:</h6>--%>
                                                                <%--<img class="card-img-top" alt="Card image cap" src="https://getmygraphics.com/files/2015/07/Gauge_0086-1080x675.jpg" style="max-height: 157px; min-height: 157px; width: 250px" />--%>
                                                                <canvas id="canvas_2" style="max-width: 250px"></canvas>
                                                                <h5 class="card-text">התראות שנשלחו ללקוח:</h5>

                                                                <table style="border: 0; width: 100%">
                                                                    <tr>
                                                                        <td>31.10.18</td>
                                                                        <td><a href="#" class="showTip L1">התראת סיכון</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2.11.18</td>
                                                                        <td><a href="#" class="showTip L2">התראת הוראת דין</a></td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="stats" style="direction: ltr">
                                                                    <i class="now-ui-icons ">תאריך אנליזה אחרון - 28.10.18 12:45</i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="card" style="width: 250px; direction: rtl; margin-left: 50px; margin-top: 25px;">
                                                            <a href="Saved_ChatPage.aspx" target="_blank">
                                                                <img class="card-img-top" alt="Card image cap" src="https://www.vakrat.co.il/wp-content/uploads/%D7%9E%D7%A6%D7%9C%D7%9E%D7%94-%D7%A1%D7%9E%D7%95%D7%99%D7%94-200x200.jpg" style="max-height: 157px; min-height: 157px; width: 250px" />
                                                            </a>
                                                            <div class="card-body">
                                                                <br />
                                                                <h6 class="card-text">שם הלקוח:</h6>
                                                                <h6 class="card-text">יעקב זוארץ </h6>
                                                                <h5 class="card-text">מאגרי מידע והגנת הפרטיות</h5>
                                                                <h5 class="card-text">מספר שאלות: 18</h5>
                                                                <h5 class="card-text">מספר סיכונים: 3</h5>
                                                                <a href="Saved_ChatPage.aspx" target="_blank">
                                                                    <h6 class="card-text">ארכיון שיחה</h6>
                                                                </a>
                                                                <p class="card-text">סידרה של שאלות המתוכננות לבדוק סיכון מול חוק מאגרי מידע והגנת </p>
                                                                <%--<h6 class="card-text">שם הלקוח:</h6>--%>
                                                                <%--<img class="card-img-top" alt="Card image cap" src="https://getmygraphics.com/files/2015/07/Gauge_0086-1080x675.jpg" style="max-height: 157px; min-height: 157px; max-width: 250px" />--%>
                                                                <canvas id="canvas_3" style="max-width: 250px"></canvas>
                                                                <h5 class="card-text">התראות שנשלחו ללקוח:</h5>

                                                                <table style="border: 0; width: 100%">
                                                                    <tr>
                                                                        <td>31.10.18</td>
                                                                        <td><a href="#" class="showTip L1">התראת סיכון</a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2.11.18</td>
                                                                        <td><a href="#" class="showTip L2">התראת הוראת דין</a></td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="stats" style="direction: ltr">
                                                                    <i class="now-ui-icons ">תאריך אנליזה אחרון - 28.10.18 12:45</i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>






                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <%--<i class="now-ui-icons arrows-1_refresh-69"></i>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>




        </div>
    </form>


    <script type="text/javascript">

        $(function () {

            //var unique_conversation_id = 'e9365d63-b00e-4497-8bfc-62acc722d2cd';//getUrlVars()['unique_conversation_id'];
            //Get_Saved_conversation(unique_conversation_id);



            getLastConversationID();
            //set_gauge('canvas_1', 1);
            set_gauge('canvas_2', 5);
            set_gauge('canvas_3', 3);






        });

        function getLastConversationID() {

            url = "ClientsManagment.aspx/get_lastConversationData";
            data = "{user_id:'" + user_id + "'}";

            $.ajax({
                type: "POST",
                url: url,
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess_getLastConversationID,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        }
        function OnSuccess_getLastConversationID(response) {
            // $('.screen-content').fbMessenger('message', 'user', response.d, { timestamp: new Date(), delay: 0 });

            // $('.screen-content').fbMessenger('message', 'bot', 'Best thing I\'ve heard today!', { timestamp: new Date(), delay: 1000 })

            //alert(response.d);
            var values = response.d.split("&");

            // value 0 is unique_conversation_id
            $('#saved_conversation_link').attr("href", "/Saved_ChatPage.aspx?unique_conversation_id=" + values[0]);
            // value 1 is danger_count
            $('#saved_conversation_danger_count').text("מספר סיכונים: " + values[1]);
            // value 2 is dateTime
            $('#saved_conversation_dateTime').text("תאריך אנליזה אחרון - " + values[2]);

            set_gauge('canvas_1', values[1]);
        }



        function set_gauge(canvas_element, gauge_value) {
            var opts = {
                angle: -0.17, // The span of the gauge arc
                lineWidth: 0.44, // The line thickness
                radiusScale: 1, // Relative radius
                pointer: {
                    length: 0.6, // // Relative to gauge radius
                    strokeWidth: 0.035, // The thickness
                    color: '#000000' // Fill color
                },
                limitMax: false,     // If false, max value increases automatically if value > maxValue
                limitMin: false,     // If true, the min value of the gauge will be fixed
                colorStart: '#ff3300',   // Colors
                colorStop: '#33cc33',    // just experiment with them
                strokeColor: '#E0E0E0',  // to see which ones work best for you
                generateGradient: true,
                highDpiSupport: true,     // High resolution support

            };
            var target = document.getElementById(canvas_element); // your canvas element
            var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
            gauge.maxValue = 10; // set max gauge value
            gauge.setMinValue(0);  // Prefer setter over gauge.minValue = 0
            gauge.animationSpeed = 32; // set animation speed (32 is default value)
            gauge.set(gauge_value); // set actual value
        }

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
