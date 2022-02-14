<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MultiSelectionForm.aspx.cs" Inherits="MultiSelectionForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>

    <link href="css/material-kit.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/materialize.css" rel="stylesheet" />
    <link href="css/materialize.min.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css' />
    <%--<link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    <link href="css/dashboard.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <script src="http://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/bootstrap-notify.js"></script>

    <style>
        .card .header-primary {
            background: linear-gradient(60deg, #fc0748, #a5032e)
        }
    </style>
    <script>
        $(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.com/en_US/messenger.Extensions.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'Messenger'));

        $(function () {

            $(document).ready(function () {

                //$('.pref_checkbox').change(function () {
                //    if ($(this).is(":checked")) {
                //        // it is checked
                //        alert("it is checked");
                //    }
                //    else
                //        alert("it is unchecked");
                //});
                getUserPreferences($("#bot_user_id").val());
            });

            var prefrence_delimiter = ';';
            var prefrence_in_delimiter = ':';

            $("#closeButton").click(function () {
                var pref_data = '';
                $("input:checkbox[name=optionsCheckboxes]").each(function () {
                    //alert(" Value: " + $(this).val() + " Checked: " + $(this).is(":checked"));
                    pref_data += $(this).val() + prefrence_in_delimiter + $(this).is(":checked") + prefrence_delimiter;
                });

                saveUserPreferences($("#bot_user_id").val(), pref_data);
                return false;

                //alert("hit me");
                //MessengerExtensions.requestCloseBrowser(
                //    function success() {
                //        alert("hit me success");
                //    },
                //    function error(err) {
                //        alert("error" + err)
                //    }
                //);
                //return false;
            });

            function saveUserPreferences(user_id, pref_data) {
                               
                url = "SendArgs.aspx/updateUserPreferences";


                data = "{user_id: '" + user_id + "',pref_data: '" + pref_data + "'}";
                               
                //alert(data);

                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                        showNotification("sss", "תמונותיך הועלו בהצלחה.");
                    },
                    failure: function (response) {
                        alert(response.d);
                    },
                    error: function (response) {
                        alert(response.d);
                    }
                });

            }

            function getUserPreferences(user_id) {

                //$('#loader_spinner').show();
                //alert(user_id);
                $.ajax({
                    type: "POST",
                    url: "SendArgs.aspx/getUserPreferences",
                    data: "{user_id:'" + user_id + "'}",
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

                if (response.d != "") {
                    var res = response.d.split(prefrence_delimiter);

                    //for (var i = 0; i < res.length; i++) {
                    //    var in_res = res[i].split(prefrence_in_delimiter);
                    //    //alert(in_res[0]);
                    //    $("select[value='" + in_res[0] + "']").
                    //    $("select[value='" + in_res[0] + "']").prop('checked', true);
                    //    //$("input:checkbox[title=" + in_res[0] + "]").prop('checked', in_res[1]);
                    //}

                    //$('#loader_spinner').hide();                
                    $("input:checkbox[name=optionsCheckboxes]").each(function () {
                        //alert(" Value: " + $(this).val() + " Checked: " + $(this).is(":checked"));
                        for (var i = 0; i < res.length; i++) {
                            var in_res = res[i].split(prefrence_in_delimiter);
                            if (in_res[0] == $(this).val()) {
                                if (in_res[1] == "true") {
                                    $(this).prop('checked', true);
                                }
                                else
                                {
                                    $(this).prop('checked', false);
                                }

                                break;
                            }
                        }
                    });
                }

                
            };

            function showNotification(user_name, message) {
                $.notify({
                    // options
                    icon: 'glyphicon glyphicon-warning-sign',
                    message: 'תמונותיך יוצגו באתר לאחר אישורן.',
                    title: message,
                    url: '',
                    target: ''
                }, {
                        // settings
                        element: 'body',
                        position: null,
                        type: "info",
                        allow_dismiss: true,
                        newest_on_top: false,
                        showProgressbar: false,
                        placement: {
                            from: "top",
                            align: "right"
                        },
                        offset: 20,
                        spacing: 10,
                        z_index: 1031,
                        delay: 5000,
                        timer: 1000,
                        url_target: '_blank',
                        mouse_over: null,
                        animate: {
                            enter: 'animated fadeInDown',
                            exit: 'animated fadeOutUp'
                        },
                        onShow: null,
                        onShown: null,
                        onClose: null,
                        onClosed: null,
                        icon_type: 'class',
                        template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
                        '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
                        '<span data-notify="icon"></span> ' +
                        '<span data-notify="title">{1}</span> ' +
                        '<span data-notify="message">{2}</span>' +
                        '<div class="progress" data-notify="progressbar">' +
                        '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
                        '</div>' +
                        '<a href="{3}" target="{4}" data-notify="url"></a>' +
                        '</div>'
                    });
            }

        });

        window.extAsyncInit = function () {
            //alert("js sdk finished loading");
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <input runat="server" id="bot_user_id" type="hidden" value="" />
    </form>
    <div class="wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-signup">
                            <form class="form" method="" action="">
                                <div class="header header-primary text-center">
                                    <%--<h4>Sign Up</h4>--%>
                                    <img src="https://www.quaker.co.il/img/logo.png" style="width: 200px" />
                                    <%--<div class="social-line">
                                        <a href="#pablo" class="btn btn-simple btn-just-icon">
                                            <i class="fa fa-facebook-square"></i>
                                        </a>
                                        <a href="#pablo" class="btn btn-simple btn-just-icon">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                        <a href="#pablo" class="btn btn-simple btn-just-icon">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </div>--%>
                                </div>
                                <p class="text-divider">הדברים שאני הכי אוהב</p>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="מתוק" type="checkbox" name="optionsCheckboxes"  /><span class="checkbox-material"><span class="check"></span></span>
                                                        מתוק
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox" type="checkbox" value="מלוח" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        מלוח
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="שוקולד" type="checkbox" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        שוקולד
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="בצק" type="checkbox" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        בצק
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p class="text-divider">הדברים שאני לא נוגע בהם</p>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="סוכר" type="checkbox" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        סוכר
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="גלוטן" type="checkbox" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        גלוטן
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="לקטוז"  type="checkbox" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        לקטוז
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="בוטנים"  type="checkbox" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        בוטנים
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="מטוגן"  type="checkbox" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        מטוגן
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="pref_checkbox"  value="חצילים" type="checkbox" name="optionsCheckboxes" /><span class="checkbox-material"><span class="check"></span></span>
                                                        חצילים
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button id="closeButton" style="background: linear-gradient(60deg, #fc0748, #a5032e);" class="btn btn-primary align-content-center">שמור את ההעדפות שלי<div class="ripple-container"></div>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>

        </div>


    </div>



    <div>
        <table>
            <tr>
                <td>

                    <table>
                        <tr>
                            <td>
                                <img width="200px" height="125px" src="https://www.quaker.co.il/Areas/Uploads/dd1fed07-fc1b-4a52-b8ab-f229a33fa465.jpg" />
                            </td>
                            <td>
                                 קובלר תותים ובננה
                            </td>                           
                            <td>
                                <img width="20px" height="20px" width src="https://cdn0.iconfinder.com/data/icons/round-ui-icons/512/close_red.png" />
                            </td>
                            
                        </tr>
                    </table>

                </td>
            </tr>
        </table>
    </div>

</body>
</html>
