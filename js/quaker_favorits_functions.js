$(function () {



   

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
getUserFavorits(getUrlParameter('user_id'), getUrlParameter('recipe_id'));

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
                showNotification('', 'הנתונים עודכנו');
            }
        };
        xhttp.open("GET", "https://eca96839.ngrok.io/SendArgs.aspx?function_name=updateUserPreferences&user_id=" + user_id + "&pref_data=" + pref_data, true);
        xhttp.send();
    }

}

function test() {
}

function getUserFavorits(user_id,recipe_id) {
    
    //alert("in getUserFavorits");
    if (user_id != null && user_id != "") {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                //document.getElementById("demo").innerHTML =
                //    this.responseText;
                //var response;
                //response.d = this.responseText;
                //OnSuccess(this.responseText);
               // alert(this.responseText);
                document.getElementById("html_content").innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "https://eca96839.ngrok.io/SendArgs.aspx?function_name=getUserFavorits&user_id=" + user_id + "&recipe_id=" + recipe_id, true);
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
    console.log('server answer 1 ' + response);

    if (document.getElementById("html_content") != null) {
        console.log('html_content found ' + response);
    }
    else {
        console.log('html_content NOT found ' + response);
    }
    //alert('server answer ' + response);
    if (response != "") {
        //var res = response.split(prefrence_delimiter);

        //$('#html_content').innerHTML = response;
        

        //document.getElementById("Obj_html_0").innerHTML = response;


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