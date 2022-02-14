<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

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
    <!-- Bootstrap core CSS     
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />-->
    <!--  Light Bootstrap Table core CSS  
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />-->
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

        .org-add-button_quick_reply,
        .org-add-button,
        .org-del-button,
        .org-confirm-del-button {
            position: absolute;
            font-size: 12px;
        }

        .org-add-button, .org-add-button_quick_reply {
            bottom: 3px;
            left: 5px;
            padding-left: 13px;
            background: url(./add_blue.png) no-repeat 0 3px;
            /* display:none;*/
        }

            .org-add-button:hover,
            .org-add-button_quick_reply,
            .org-del-button:hover {
                border-radius: 2px;
                cursor: pointer;
            }

        .org-del-button {
            background: url(./delete_icon.png) no-repeat;
            width: 12px;
            height: 12px;
            bottom: 7px;
            right: 5px;
        }

        .org-del-carusel-item-button {
            background: url(./delete_icon.png) no-repeat;
            width: 12px;
            height: 12px;
            cursor: pointer;
        }

        .update-parent-button {
            color: blue;
            cursor: pointer;
        }

        .draggeble_object {
            margin-left: 160px;
            margin-top: 80px;
        }

        .twPc-div {
            background: #fff none repeat scroll 0 0;
            border: 1px solid #e1e8ed;
            border-radius: 6px;
            height: 200px;
            max-width: 340px;
            // orginal twitter width: 290px;
        }

        .twPc-bg {
            background-image: url("https://pbs.twimg.com/profile_banners/50988711/1384539792/600x200");
            background-position: 0 50%;
            background-size: 100% auto;
            border-bottom: 1px solid #e1e8ed;
            border-radius: 4px 4px 0 0;
            height: 95px;
            width: 100%;
        }

        .twPc-block {
            display: block !important;
        }

        .twPc-button {
            margin: -35px -10px 0;
            text-align: right;
            width: 100%;
        }

        .twPc-avatarLink {
            background-color: #fff;
            border-radius: 6px;
            display: inline-block !important;
            float: left;
            margin: -30px 5px 0 8px;
            max-width: 100%;
            padding: 1px;
            vertical-align: bottom;
        }

        .twPc-avatarImg {
            border: 2px solid #fff;
            border-radius: 7px;
            box-sizing: border-box;
            color: #fff;
            height: 72px;
            width: 72px;
        }

        .twPc-divUser {
            margin: 5px 0 0;
        }

        .twPc-divName {
            font-size: 18px;
            font-weight: 700;
            line-height: 21px;
        }

            .twPc-divName a {
                color: inherit !important;
            }

        .twPc-divStats {
            margin-left: 0px;
            padding: 0px 0;
        }

        .twPc-Arrange {
            box-sizing: border-box;
            display: table;
            margin: 0;
            min-width: 100%;
            padding: 0;
            table-layout: auto;
        }

        ul.twPc-Arrange {
            list-style: outside none none;
            margin: 0;
            padding: 0;
        }

        .twPc-ArrangeSizeFit {
            display: table-cell;
            padding: 0;
            vertical-align: top;
        }

            .twPc-ArrangeSizeFit a:hover {
                text-decoration: none;
            }

        .twPc-StatValue {
            display: block;
            font-size: 15px;
            font-weight: 500;
            transition: color 0.15s ease-in-out 0s;
        }

        .twPc-StatLabel {
            color: #8899a6;
            font-size: 9px;
            letter-spacing: 0.02em;
            overflow: hidden;
            text-transform: uppercase;
            transition: color 0.15s ease-in-out 0s;
        }

        .material-icons {
            cursor: pointer;
        }
        /*h4,h5 {
            word-wrap: break-word;
        }*/
    </style>

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

        /*h5, .h5 {
            font-size: 1.57em;
            line-height: 1.4em;
            margin-bottom: 15px;
        }*/
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
                img: 'ToolTipFiles/images/notes1.jpg',
                w: 20
            },
            L2: {
                caption: '',
                img: 'ToolTipFiles/images/notes2.jpg',
                w: 20
            }
        }
    </script>

    <script type="text/javascript">
        function updateTextElement(input_id, type, field_name) {
            //alert("You chossed " + input_id +  " : " +type.toString());
            $('#last_clicked').val(input_id);

            document.getElementById("update_type").value = type;
            document.getElementById("update_field_name").value = field_name;

            //alert("You chossed " + document.getElementById("update_type").value);



            var title_id = type + "_" + input_id;
            var input_title_id = "update_title_panel" + input_id;
            var title_element = document.getElementById(title_id);
            var update_title_element = document.getElementById(input_title_id);

            /*$("#text_editor").style.left = $("#" + title_id).offset().left;
            $("#text_editor").style.top = $("#" + title_id).offset().top;
            $("#text_editor").fadeTo("slow", 0.33);*/

            $("#text_editor").fadeIn().animate({ "left": $("#" + title_id).offset().left }).animate({ "top": $("#" + title_id).offset().top });
            $("#text_editor_textarea").val($("#" + title_id).text());

            //alert($("#" + title_id).text());
            //alert(update_title_element);

            /*if (update_title_element.style.display == 'none') {

                update_title_element.style.display = 'block';
                //alert(update_title_element.style.display.toString());
                title_element.style.display = 'none';
                document.getElementById("title_input" + input_id).value = title_element.innerHTML;
            } else {
                update_title_element.style.display = 'none';
                title_element.style.display = 'block';
            }*/
        }

        function updateElementParentID(input_id, type, field_name) {
            //alert("You chossed " + input_id +  " : " +type.toString());
            $('#last_clicked').val(input_id);

            document.getElementById("update_type").value = type;
            document.getElementById("update_field_name").value = field_name;

            //alert("You chossed " + document.getElementById("update_type").value);



            var title_id = type + "_" + input_id;
            var input_title_id = "update_title_panel" + input_id;
            var title_element = document.getElementById(title_id);
            var update_title_element = document.getElementById(input_title_id);

            /*$("#text_editor").style.left = $("#" + title_id).offset().left;
            $("#text_editor").style.top = $("#" + title_id).offset().top;
            $("#text_editor").fadeTo("slow", 0.33);*/

            $("#text_editor").fadeIn().animate({ "left": $("#" + title_id).offset().left }).animate({ "top": $("#" + title_id).offset().top });
            $("#text_editor_textarea").val($("#" + title_id).text());

            //alert($("#" + title_id).text());
            //alert(update_title_element);

            /*if (update_title_element.style.display == 'none') {

                update_title_element.style.display = 'block';
                //alert(update_title_element.style.display.toString());
                title_element.style.display = 'none';
                document.getElementById("title_input" + input_id).value = title_element.innerHTML;
            } else {
                update_title_element.style.display = 'none';
                title_element.style.display = 'block';
            }*/
        }

        function updateText() {

            var input_id = $('#last_clicked').val();

            var title_id = document.getElementById("update_type").value + "_" + input_id;

            var title_element = document.getElementById(title_id);

            $("#" + title_id).text($("#text_editor_textarea").val());

            updateServer(input_id, document.getElementById("update_field_name").value, $("#text_editor_textarea").val());

            $("#text_editor_textarea").val('');
            $("#text_editor").fadeOut();
        }

        function updateRankElement(input_id, type, field_name) {
            //alert("You chossed " + input_id +  " : " +type.toString());
            $('#last_clicked').val(input_id);

            document.getElementById("update_type").value = type;
            document.getElementById("update_field_name").value = field_name;

            //alert("You chossed " + document.getElementById("update_type").value);



            var title_id = type + "_" + input_id;
            var input_title_id = "update_title_panel" + input_id;
            var title_element = document.getElementById(title_id);
            var update_title_element = document.getElementById(input_title_id);

            /*$("#text_editor").style.left = $("#" + title_id).offset().left;
            $("#text_editor").style.top = $("#" + title_id).offset().top;
            $("#text_editor").fadeTo("slow", 0.33);*/

            $("#text_editor").fadeIn().animate({ "left": $("#" + title_id).offset().left }).animate({ "top": $("#" + title_id).offset().top });
            $("#text_editor_textarea").val($("#" + title_id).text());

            //alert($("#" + title_id).text());
            //alert(update_title_element);

            /*if (update_title_element.style.display == 'none') {

                update_title_element.style.display = 'block';
                //alert(update_title_element.style.display.toString());
                title_element.style.display = 'none';
                document.getElementById("title_input" + input_id).value = title_element.innerHTML;
            } else {
                update_title_element.style.display = 'none';
                title_element.style.display = 'block';
            }*/
        }

        function updateTextElementBK(input_id, type, field_name) {
            //alert("You chossed " + input_id +  " : " +type.toString());
            document.getElementById("update_type").value = type;
            document.getElementById("update_field_name").value = field_name;

            //alert("You chossed " + document.getElementById("update_type").value);




            var title_id = type + "_" + input_id;
            var input_title_id = "update_title_panel" + input_id;
            var title_element = document.getElementById(title_id);
            var update_title_element = document.getElementById(input_title_id);

            //alert(update_title_element);

            if (update_title_element.style.display == 'none') {

                update_title_element.style.display = 'block';
                //alert(update_title_element.style.display.toString());
                title_element.style.display = 'none';
                document.getElementById("title_input" + input_id).value = title_element.innerHTML;
            } else {
                update_title_element.style.display = 'none';
                title_element.style.display = 'block';
            }
        }

        function updateTextBK(input_id, type) {
            alert("You chossed " + input_id.toString());

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

            updateServer(input_id, document.getElementById("update_field_name").value, document.getElementById(title_input).value);
        }

        function updateNodes(updatedValues) {


            url = "SendArgs.aspx/updateNodes";

            data = "{tree_id: '" + $('#tree_id').val() + "',updatedValues: '" + updatedValues + "'}";

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

        function updateServer(dialog_id, field, editedText) {

            if (!isNumeric(dialog_id)) {
                var sep = "";
                if (dialog_id.includes("-"))
                    sep = "-";
                else if (dialog_id.includes("_"))
                    sep = "_";

                var ar = dialog_id.split(sep);
                dialog_id = ar[0];
                //alert(dialog_id);
            }
            //updateTreeNode(int dialog_id,string field,string editedText)
            url = "SendArgs.aspx/updateTreeNode";


            data = "{dialog_id: " + dialog_id + ",field: '" + field + "',editedText: '" + editedText + "'}";

            // add new object to server
            node_type = '1';
            //alert(data);

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

        function isNumeric(num) {
            return !isNaN(num)
        }

        function cancelText(input_id, type) {
            //alert("You chossed " + input_id.toString());
            $("#text_editor").fadeOut();
            /*var title_id = document.getElementById("update_type").value + "_" + input_id;
            var input_title_id = "update_title_panel" + input_id;
            var title_element = document.getElementById(title_id);
            var update_title_element = document.getElementById(input_title_id);
            if (update_title_element.style.display === 'none') {
                update_title_element.style.display = 'block';
                title_element.style.display = 'none';
            } else {
                update_title_element.style.display = 'none';
                title_element.style.display = 'block';
            }*/
        }



        function updateParent_update() {

            var oldData = $('#last_clicked').val();

            var newData = $("#text_editor_parent_update_textarea").val();

            //alert(oldData + ';' + newData);
            updateNodes(oldData + ':' + newData);

            $("#text_editor_parent_update_textarea").val('');
            $("#text_editor_1").fadeOut();
        }

        function cancelParent_update() {
            //alert("You chossed cancelParent_update");
            $("#text_editor_1").fadeOut();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input runat="server" id="tree_id" type="hidden" value="-1" />
        <input runat="server" id="node_id" type="hidden" value="-1" />
        <input id="last_clicked" type="hidden" value="5" />
        <input id="update_type" type="hidden" value="5" />
        <input id="update_field_name" type="hidden" value="1" />
        <input id="caruosel-items-text" type="hidden" value="" />


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
                        <a href="#tabs-9">
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

                        <label style="width: 100%; text-align: right">הוסף הודעה</label>

                        <input type="text" style="width: 100%;" id="text-container-input" />

                    </p>
                    <p >
                        <label style="width: 100%; text-align: right">הכנס טקסט לשון החוק</label>
                        <input type="text" style="width: 100%;" id="caruosel-container-input" />
                    </p>
                    <p id="caruosel-container2">
                        <label style="width: 100%; text-align: right">הכנס הסבר</label>
                        <input type="text" style="width: 100%;" id="caruosel-container-input2" />
                    </p>
                    <p >
                        <label style="width: 100%; text-align: right">הכנס רמת סיכון כללית 1-4</label>
                        <input type="text" style="width: 100%;" id="caruosel-container-input3" />
                    </p>
                    <p >
                        <label style="width: 100%; text-align: right"> אם קיימת  - הכנס רמת סיכון כספית</label>
                        <input type="text" style="width: 100%;" id="caruosel-container-input4" />
                    </p>
                    <i id="text-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-2">
                    <p id="caruosel-container1">
                        <label style="width: 100%; text-align: right">הכנס טקסט לשון החוק</label>
                        <input type="text" style="width: 100%;" id="caruosel-container-input1" />
                    </p>
                    <i id="text-button-1" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-3">
                    <div id="image-card-container">
                        <label style="width: 100%; text-align: right">הוסף כרטיס תמונה</label>
                        <div class="form-group">
                            <input id="loadfromurl" type="text" class="form-control" placeholder="Url To load data" />
                            <i id="loadfromurl-button" class="material-icons">add_circle</i>
                        </div>

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
                            <input id="quick-reply-container-input-4" type="text" class="form-control" placeholder="Reply 4" />
                            <input id="quick-reply-container-input-5" type="text" class="form-control" placeholder="Reply 5" />
                        </div>
                    </div>
                    <i id="quick-replys-button" class="material-icons">add_circle</i>
                </div>
                <div id="tabs-6">
                    <i class="material-icons">add_circle</i>   הוסף אובייקט חדש ולחץ על ה 
                </div>
                <div id="tabs-9">
                    <div id="fb-quick-reply-container">
                        <label style="width: 100%; text-align: right">הוסף תפריט תגובות משתמש עבור פייסבוק</label>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-1" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-1"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>                        
                        <div class="row">
                            <input id="fb-quick-reply-container-input-2" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-2"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-3" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-3"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-4" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-4"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-5" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-5"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-6" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-6"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-7" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-7"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-8" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-8"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-9" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-9"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>
                        <div class="row">
                            <input id="fb-quick-reply-container-input-10" class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" />
                            <input id="fb-quick-reply-container-image-10"class="form-control col" type="text" value="" placeholder="כתובת אייקון" />
                        </div>

                        <script>
                            function addReply() {
                                $('#reply_container').append(
                                    '<div class="row"><input class="form-control col" type="text" value="" placeholder="כתוב תגובת משתמש" /><input class="form-control col" type="text" value="" placeholder="כתובת אייקון" /></div>');
                            }
                        </script>
                        <div id="reply_container" class="form-group">
                        </div>
                        <input type="button" class="form-control" onclick="addReply()" title="הוסף תגובה" value="הוסף תגובה" />

                    </div>
                    <i id="fb-quick-replys-button" class="material-icons">add_circle</i>
                </div>




            </div>
        </div>

        <div id="text_editor" style="display: none; position: absolute; z-index: 1000" class="card col-2">
            <div class="card-block" style="background-color: #f7f7f9">
                <textarea id="text_editor_textarea" style="direction: rtl" class='form-control'></textarea>
                <a href='#' onclick="cancelText('0')"><i class='material-icons'>close</i></a>
                <a href='#' onclick="updateText('0')"><i class='material-icons'>done</i></a>
            </div>
        </div>
        
        <div id="text_editor_1" style="display: none; position: absolute; z-index: 100" class="card col-2">
            <div class="card-block" style="background-color: #f7f7f9">
                <textarea id="text_editor_parent_update_textarea" style="direction: rtl" class='form-control'></textarea>
                <i onclick="cancelParent_update()" class='material-icons'>close</i>
                <i onclick="updateParent_update()" class='material-icons'>done</i>
            </div>
        </div>

        <div class="wrapper">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                  
                                </div>
                                <br />
                                <div class="content">
                                    <!--
                                    <div class="card text-center" style="width: 250px">

                                        <div class="card-block">
                                            <h4 class="card-title">Special title treatment</h4>
                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <a href="#" class="btn btn-primary">Go somewhere</a>
                                        </div>
                                        <div class="card-footer">
                                            
                                            <div class="twPc-divStats">
                                                <ul class="twPc-Arrange">
                                                    <li class="twPc-ArrangeSizeFit">
                                                        <a href="https://twitter.com/mertskaplan" title="9.840 Tweet">
                                                            <span class="twPc-StatLabel twPc-block">visitors</span>
                                                            <span class="twPc-StatValue">1000</span>
                                                        </a>
                                                    </li>
                                                    <li class="twPc-ArrangeSizeFit">
                                                        <a href="https://twitter.com/mertskaplan/following" title="885 Following">
                                                            <span class="twPc-StatLabel twPc-block">uniques</span>
                                                            <span class="twPc-StatValue">802</span>
                                                        </a>
                                                    </li>
                                                    <li class="twPc-ArrangeSizeFit">
                                                        <a href="https://twitter.com/mertskaplan/followers" title="1.810 Followers">
                                                            <span class="twPc-StatLabel twPc-block">percent</span>
                                                            <span class="twPc-StatValue">0%</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>

                                        </div>
                                    </div>
                                    -->
                                    <div id="loader_spinner" class="loader">Loading...</div>
                                    <!--add here -->


                                    <div id="html_content" style="width: 100%; height: 100%"></div>


                                    <script type="text/javascript">

                                        $(function () {
                                            //alert($('#tree_id').val());

                                            // $('#tree_id_label').html( "Conversation Tree: #" + $('#tree_id').val());
                                            $('#tree_id_label').html();

                                            $("#statistics_link").attr("href", "TreeStatistics.aspx?tree_id=" + +$('#tree_id').val());

                                            //alert($('#tree_id').val());


                                            if ($('#node_id').val() != "-1") {
                                                loadConversationTreeFromStartingNode($('#node_id').val());
                                            }
                                            else {
                                                loadConversationTree($('#tree_id').val());
                                            }



                                            // show the add/delete buttons
                                            /*$(".twPc-divStats").hover(function () {
                                                alert('gg');
                                                $(this).find(".card-controls").css("display", "block");
                                            }, function () {
                                                $(this).find(".card-controls").css("display", "none");
                                            });*/


                                            // omclick to show message creator
                                            /* $(".org-add-button").click(function () {
                                                 log('Clicked node אקדא');
                                                 // add the id of the clicked object
                                                 var thisId = $(this).parent().parent().parent().attr('id');
                                                 console.log('the_thisId ' + thisId);
 
                                                 $('#last_clicked').val(thisId);
 
                                                 log('Clicked node ' + thisId);
 
                                                 $("#message_creator").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                             });*/

                                            /*$(".org-add-button").hover(function (index) {
                                                // console.log(index + ": " + $(this).attr('id'));
                                                console.log('Clicked node אקדא');
                                                $(this).click(function () {
                                                    console.log('Clicked node אקדא');
                                                    // add the id of the clicked object
                                                    var thisId = $(this).parent().parent().parent().attr('id');
                                                    console.log('the_thisId ' + thisId);

                                                    $('#last_clicked').val(thisId);

                                                    log('Clicked node ' + thisId);

                                                    $("#message_creator").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                                });
                                            });*/

                                            /*$("#html_content").find(".add_button").click(function () {
                                                console.log('Clicked node אקדא');
                                                // add the id of the clicked object
                                                var thisId = $(this).parent().parent().parent().attr('id').replace("card_", "");
                                                console.log('the_thisId ' + thisId);


                                                $('#last_clicked').val(thisId);

                                                log('Clicked node ' + thisId);

                                                $("#message_creator").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                            });*/

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

                                                $(this).find(".update-parent-button").click(function () {

                                                    // add the id of the clicked object
                                                    //var thisId = $(this).parent().parent().parent().attr('id').replace("card_", "");
                                                    var thisId = $(this).attr('id');
                                                    console.log('update ' + thisId);
                                                    $('#last_clicked').val(thisId);

                                                    //$("#text_editor_Parent_update").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                                    //$("#text_editor_Parent_update_textarea").val(thisId);

                                                    $("#text_editor_1").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                                    $("#text_editor_parent_update_textarea").val(thisId);

                                                    //deleteFromServer($('#tree_id').val(), thisId);


                                                    //$("#message_creator").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
                                                });

                                                $(this).find(".org-add-button_quick_reply").click(function () {

                                                    var replayNumber = $(this).attr('id').replace("reply_text_position_", "");

                                                    // add the id of the clicked object
                                                    var thisId = $(this).parent().parent().parent().parent().attr('id').replace("card_", "");
                                                    console.log('add new ' + thisId + ' repnum ' + replayNumber);

                                                    //thisId +=  '_' + replayNumber;
                                                    $('#last_clicked').val(thisId);

                                                    log('Clicked node ' + thisId);

                                                    $("#message_creator").fadeIn().animate({ "left": $(this).offset().left }).animate({ "top": $(this).offset().top });
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
                                                // caruosel-container-input
                                                alert($('#caruosel-items-text').val());

                                                url = "SendArgs.aspx/addTreeNode_Caruosel";
                                                data = "{tree_id: '" + $('#tree_id').val() + "',parent_dialog_id: '" + $('#last_clicked').val() + "'" + ",data: '" + $('#caruosel-items-text').val() + "'" + "}";

                                                node_type = '5';
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);

                                                log('Clicked caruosel-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                                $('#caruosel-items-text').val('');
                                                $('.caruosel-item-class').remove();
                                            });



                                            $("#caruosel-add-item-button").click(function () {

                                                var url = $('#caruosel-container-input').val();// <-- 'https://www.azrieli.com/o/0c491c8f-bd0d-4673-8841-caa1aff2f054';
                                                //alert(url);
                                                var urlEncoded = encodeURIComponent(url);
                                                var apiKey = '5a2e6463651a1db7265fcb7f'; // <-- Replace with your AppId

                                                // The entire request is just a simple get request with optional query parameters
                                                var requestUrl = 'https://opengraph.io/api/1.1/site/' + urlEncoded + '?app_id=' + apiKey;

                                                //alert($('#urlval').val());
                                                $.getJSON(requestUrl, function (json) {
                                                    // Throw the object in the console to see what it looks like!
                                                    console.log('json', json);

                                                    // save item data for later use
                                                    var delimiter = ';a;';
                                                    var lastdelimiter = ';z;';
                                                    var cuurent_item_data = json.hybridGraph.title + delimiter + json.hybridGraph.description + delimiter + json.hybridGraph.image + delimiter + json.hybridGraph.url + lastdelimiter;

                                                    $('#caruosel-items-text').val($('#caruosel-items-text').val() + cuurent_item_data);


                                                    var items_in_caruosel = $("#caruosel-items-container").children().length;
                                                    items_in_caruosel += 1;

                                                    var html = "<div id='caruosel-item-" + items_in_caruosel + "' class='card caruosel-item-class' style='width: 200px;float:left'><img style='max-width:200px;max-height:200px;' class='card-img-top' src= '" + json.hybridGraph.image + "' alt= 'Card image cap'><div class='card-block'><h4 class='card-title' style='direction: rtl;'>" + json.hybridGraph.title.replace("'", "").substring(0, 30) + "</h4><p class='card-text' style='direction: rtl;'>" + json.hybridGraph.description.replace("'", "").substring(0, 40) + "..." + "</p><a href='" + json.hybridGraph.url + "' class='btn btn-primary'>פתח</a></div>" + "<div id='caruosel-item-" + items_in_caruosel + "-delete' onclick='deleteCaruselItem(" + items_in_caruosel + ")'  class='org-del-carusel-item-button'></div></div>";

                                                    $('#caruosel-items-container').css('width', '+=200px');
                                                    $('#caruosel-items-container').append(html);

                                                    $('#caruosel-container-input').val('');


                                                });
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
                                            // get head data from url web page
                                            $("#loadfromurl-button").click(function () {

                                                var url = $('#loadfromurl').val();// <-- 'https://www.azrieli.com/o/0c491c8f-bd0d-4673-8841-caa1aff2f054';
                                                //alert(url);
                                                var urlEncoded = encodeURIComponent(url);
                                                var apiKey = '5a2e6463651a1db7265fcb7f'; // <-- Replace with your AppId

                                                // The entire request is just a simple get request with optional query parameters
                                                var requestUrl = 'https://opengraph.io/api/1.1/site/' + urlEncoded + '?app_id=' + apiKey;

                                                //alert($('#urlval').val());
                                                $.getJSON(requestUrl, function (json) {

                                                    // Throw the object in the console to see what it looks like!
                                                    console.log('json', json);
                                                    $('#image-card-title').val(json.hybridGraph.title.replace("'", ""));
                                                    $('#image-card-subtitle').val(json.hybridGraph.description.replace("'", ""));
                                                    //$('#image-card-text').val('טקסט');
                                                    $('#image-card-image_url').val(json.hybridGraph.image);
                                                    $('#image-card-button_action_1_text').val('פתח');
                                                    $('#image-card-button_action_1_value').val(url);

                                                });
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
                                            $("#fb-quick-replys-button").click(function () {

                                                var url = "SendArgs.aspx/addTreeNode_quick_replys_facebook";
                                                var data = "{tree_id: '" + $('#tree_id').val() + "',parent_dialog_id: '" +
                                                    $('#last_clicked').val() +
                                                    "',option1: '" + $('#fb-quick-reply-container-input-1').val() +
                                                    "',option2: '" + $('#fb-quick-reply-container-input-2').val() +
                                                    "',option3: '" + $('#fb-quick-reply-container-input-3').val() +
                                                    "',option4: '" + $('#fb-quick-reply-container-input-4').val() +
                                                    "',option5: '" + $('#fb-quick-reply-container-input-5').val() +
                                                    "',option6: '" + $('#fb-quick-reply-container-input-6').val() +
                                                    "',option7: '" + $('#fb-quick-reply-container-input-7').val() +
                                                    "',option8: '" + $('#fb-quick-reply-container-input-8').val() +
                                                    "',option9: '" + $('#fb-quick-reply-container-input-9').val() +
                                                    "',option10: '" + $('#fb-quick-reply-container-input-10').val() +
                                                    "',image1: '" + $('#fb-quick-reply-container-image-1').val() +
                                                    "',image2: '" + $('#fb-quick-reply-container-image-2').val() +
                                                    "',image3: '" + $('#fb-quick-reply-container-image-3').val() +
                                                    "',image4: '" + $('#fb-quick-reply-container-image-4').val() +
                                                    "',image5: '" + $('#fb-quick-reply-container-image-5').val() +
                                                    "',image6: '" + $('#fb-quick-reply-container-image-6').val() +
                                                    "',image7: '" + $('#fb-quick-reply-container-image-7').val() +
                                                    "',image8: '" + $('#fb-quick-reply-container-image-8').val() +
                                                    "',image9: '" + $('#fb-quick-reply-container-image-9').val() +
                                                    "',image10: '" + $('#fb-quick-reply-container-image-10').val() +
                                                    "'}";

                                                //alert(data);
                                                // add new object to server
                                                node_type = '2';
                                                sendToServer($('#tree_id').val(), $('#last_clicked').val(), node_type, url, data);

                                                log('Clicked fb-quick-replys-button ' + $('#last_clicked').val());
                                                $("#message_creator").fadeOut();
                                            });

                                            // add html to new object
                                            $("#quick-replys-button").click(function () {


                                                var replays = new Array();


                                                $("reply_container").each(function () {

                                                    $("row").each(function () {
                                                        var text = $(this).attr('value');
                                                        if (href != undefined && href != "") {
                                                            hrefs = hrefs + (hrefs.length > 0 ? "," + href : href);
                                                        }
                                                    });

                                                });

                                                var url = "SendArgs.aspx/addTreeNode_quick_replys";

                                                var data = "{tree_id: '" + $('#tree_id').val() + "',parent_dialog_id: '" +
                                                    $('#last_clicked').val() +
                                                    "',option1: '" + $('#quick-reply-container-input-1').val() +
                                                    "',option2: '" + $('#quick-reply-container-input-2').val() +
                                                    "',option3: '" + $('#quick-reply-container-input-3').val() +
                                                    "',option4: '" + $('#quick-reply-container-input-4').val() +
                                                    "',option5: '" + $('#quick-reply-container-input-5').val() +
                                                    "'}";

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

                                        function loadConversationTreeFromStartingNode(nodeIndex) {

                                            $('#loader_spinner').show();

                                            $.ajax({
                                                type: "POST",
                                                url: "SendArgs.aspx/generateConversationTreeFromNode",
                                                data: '{node_id: ' + nodeIndex + '}',
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: OnSuccess,
                                                failure: function (response) {
                                                    alert("failure " + response.d);
                                                },
                                                error: function (response) {
                                                    alert("error " + response.d);
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
                                                    console.log('failure: ' + response);
                                                    alert('failure: ' + response);
                                                },
                                                error: function(xhr, status, error) {
                                                  var err = eval("(" + xhr.responseText + ")");
                                                    alert(err.Message);
                                                    console.log('ajax error: ' + err.Message);
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

                                        function deleteCaruselItem(item_id) {

                                            var thisId = '#caruosel-item-' + item_id;
                                            //alert(thisId);
                                            $(thisId).remove();
                                        }
                                    </script>
                                </div>
                                <!-- -->
                                <div class="footer">
                                   <%-- <div class="legend">
                                        &nbsp&nbsp
                                            <i class="fa fa-circle text-danger"></i>55% Usage &nbsp&nbsp
                                            <i class="fa fa-circle text-info"></i>25% Usage&nbsp&nbsp
                                            <i class="fa fa-circle text-warning"></i>25% Usage &nbsp&nbsp                                
                                    </div>--%>
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


        </div>



    </form>
</body>
</html>

