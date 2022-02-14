$(function () {






    $("#closeButton").click(function () {
        alert("hit me");
        var pref_data = '';
        $("input:checkbox[name=optionsCheckboxes]").each(function () {
            //alert(" Value: " + $(this).val() + " Checked: " + $(this).is(":checked"));
            pref_data += $(this).val() + prefrence_in_delimiter + $(this).is(":checked") + prefrence_delimiter;
        });
        console.log('pref_data: ' + pref_data);
        alert(pref_data);
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

});

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

//getUserPreferences('1796808803663934');
getUserPreferences(getUrlParameter('user_id'));

var prefrence_delimiter = ';';
var prefrence_in_delimiter = ':';



function saveUserPreferences(user_id, pref_data) {

    url = "SendArgs.aspx/updateUserPreferences";


    data = "{user_id: '" + user_id + "',pref_data: '" + pref_data + "'}";

    //alert(data);

    //$.ajax({
    //    type: "POST",
    //    url: url,
    //    data: data,
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (response) {
    //        alert(response.d);
    //        showNotification("sss", "תמונותיך הועלו בהצלחה.");
    //    },
    //    failure: function (response) {
    //        alert(response.d);
    //    },
    //    error: function (response) {
    //        alert(response.d);
    //    }
    //});

    if (user_id != null && user_id != "") {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                //document.getElementById("demo").innerHTML =
                //    this.responseText;
                //var response;
                //response.d = this.responseText;
                //OnSuccess(this.responseText);
                //showNotification('','הנתונים עודכנו');
            }
        };
        xhttp.open("GET", "https://eca96839.ngrok.io/SendArgs.aspx?function_name=updateUserPreferences&user_id=" + user_id + "&pref_data=" + pref_data, true);
        xhttp.send();
    }

}

function getUserPreferences(user_id) {
    //loadDoc();
    //$('#loader_spinner').show();
    //alert(user_id);
    //https://5ae4a538.ngrok.io/SendArgs.aspx?function_name=getUserPreferences&user_id=1796808803663934

    //$.ajax({
    //    type: "POST",
    //    url: "https://5ae4a538.ngrok.io/SendArgs.aspx?function_name=getUserPreferences&user_id=1796808803663934",
    //    data: "{user_id:'" + user_id + "'}",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: OnSuccess,
    //    failure: function (response) {
    //        alert("failure " + response.d);
    //    },
    //    error: function (response) {
    //        alert("error " + response.d);
    //    }
    //});
    if (user_id != null && user_id != "") {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                //document.getElementById("demo").innerHTML =
                //    this.responseText;
                //var response;
                //response.d = this.responseText;
                OnSuccess(this.responseText);
            }
        };
        xhttp.open("GET", "https://eca96839.ngrok.io/SendArgs.aspx?function_name=getUserPreferences&user_id=" + user_id, true);
        xhttp.send();
    }


}

function loadDoc() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            //document.getElementById("demo").innerHTML =
            //    this.responseText;
            //var response;
            //response.d = this.responseText;
            OnSuccess(this.responseText);
        }
    };
    xhttp.open("GET", "https://eca96839.ngrok.io/SendArgs.aspx?function_name=getUserPreferences&user_id=1796808803663934", true);
    xhttp.send();
}

function OnSuccess(response) {
    console.log('server answer1 ' + response);
    //alert('server answer ' + response);
    if (response != "") {
        var res = response.split(prefrence_delimiter);

        for (var j = 0; j < 10; j++) {

            if (document.getElementById("Input_dcheckbox_" + j) != null) {
                //alert(document.getElementById("Input_dcheckbox_" + j).getAttribute("title"));
                for (var i = 0; i < res.length; i++) {
                    var in_res = res[i].split(prefrence_in_delimiter);
                    if (in_res[0] == document.getElementById("Input_dcheckbox_" + j).getAttribute("title")) {
                        if (in_res[1] == "true") {
                            //$(this).prop('checked', true);
                            document.getElementById("Input_dcheckbox_" + j).classList.add("checked");
                        }
                        else {
                            //$(this).prop('checked', false);
                        }

                        break;
                    }
                }

            }

        }
        //alert(document.getElementById("Input_dcheckbox_0").getAttribute("aria-checked"));


        //for (var i = 0; i < res.length; i++) {
        //    var in_res = res[i].split(prefrence_in_delimiter);
        //    //alert(in_res[0]);
        //    $("select[value='" + in_res[0] + "']").
        //    $("select[value='" + in_res[0] + "']").prop('checked', true);
        //    //$("input:checkbox[title=" + in_res[0] + "]").prop('checked', in_res[1]);
        //}

        //$('#loader_spinner').hide();                
        //$("input:checkbox[name=optionsCheckboxes]").each(function () {
        //    //alert(" Value: " + $(this).val() + " Checked: " + $(this).is(":checked"));
        //    for (var i = 0; i < res.length; i++) {
        //        var in_res = res[i].split(prefrence_in_delimiter);
        //        if (in_res[0] == $(this).val()) {
        //            if (in_res[1] == "true") {
        //                $(this).prop('checked', true);
        //            }
        //            else {
        //                $(this).prop('checked', false);
        //            }

        //            break;
        //        }
        //    }
        //});
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