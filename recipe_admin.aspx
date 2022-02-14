<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recipe_admin.aspx.cs" Inherits="recipe_admin" %>

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

    <style>
        .card-img-top {
            max-height:250px;
        }
    </style>
    <script>

        $(function () {

            $(document).ready(function () {
                $("#loadfromurl-button").click(function () {
                    getRecipe_data();
                });

                $(".btn-tag-button").click(function () {
                    var the_id = $(this).attr('id').replace("btn-tag-button_", "");

                    updateTags(the_id);
                });

            });

            function getRecipe_data() {
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
                    $('#image-card-button_action_1_value').val(url);

                    var delimiter = ";z;";
                    var recipe_data = $('#image-card-title').val() + delimiter +
                        $('#image-card-subtitle').val() + delimiter +
                        $('#image-card-image_url').val() + delimiter +
                        $('#image-card-button_action_1_value').val() + delimiter +
                        $('#image-card-recipe-hashtags').val();

                    addNewRecipe(recipe_data);
                    /*$('#image-button').show();
                    $("#image-button").click(function () {
                        addNewRecipe(recipe_data);
                    });*/
                });


            }

            function addNewRecipe(recipe_data) {

                url = "SendArgs.aspx/addNewRecipe";


                data = "{recipe_data: '" + recipe_data + "'}";

                //alert(data);

                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                        //showNotification("sss", "תמונותיך הועלו בהצלחה.");
                        window.location.reload(1);
                    },
                    failure: function (response) {
                        alert(response.d);
                    },
                    error: function (response) {
                        alert(response.d);
                    }
                });

            }

            function updateTags(row_id) {
                alert(row_id);

                var recipe_data = $("#recipe_hashtags_" + row_id).val();
                alert(recipe_data);

                url = "SendArgs.aspx/updateRecipeTags";


                data = "{row_id: '" + row_id + "', recipe_data: '" + recipe_data + "'}";

                //alert(data);

                $.ajax({
                    type: "POST",
                    url: url,
                    data: data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                        //showNotification("sss", "תמונותיך הועלו בהצלחה.");
                        window.location.reload(1);
                    },
                    failure: function (response) {
                        alert(response.d);
                    },
                    error: function (response) {
                        alert(response.d);
                    }
                });
            }
        });


    </script>
</head>
<body style="direction: rtl">
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="content">
                <div class="container-fluid">
                    <div class="row ">
                        <div class="col-md-12">
                            <div>
                                <div id="image-card-container" style="width: 500px">
                                    <label style="width: 100%; text-align: right">הוסף מתכון</label>
                                    <div class="form-group">
                                        <input id="loadfromurl" type="text" class="form-control" placeholder="הכנס לינק למתכון" />

                                        <a id="loadfromurl-button" href="#" class="btn btn-primary">הוסף מתכון</a>
                                    </div>

                                    <div class="form-group">
                                        <input id="image-card-title" type="hidden" class="form-control" placeholder="Image Title" />
                                        <input id="image-card-subtitle" type="hidden" class="form-control" placeholder="Image Subtitle" />
                                        <input id="image-card-text" type="hidden" class="form-control" placeholder="Image Text" />
                                        <input id="image-card-image_url" type="hidden" class="form-control" placeholder="Image Url" />

                                        <input id="image-card-button_action_1_value" type="hidden" class="form-control" placeholder="Image Action Value" />
                                        <input id="image-card-recipe-hashtags" type="hidden" class="form-control" placeholder="Recipe Hashtags" />
                                    </div>
                                </div>
                                <i id="image-button" class="material-icons" style="display: none; cursor: pointer">add_circle</i>

                                <div runat="server" id="cards_container">
                                </div>

                                <%--<div class="card text-right" style="width: 20rem;">
                <img class="card-img-top" src="https://www.quaker.co.il/Areas/Uploads/ebe96bd6-9708-4b62-a74c-5a15e066037c.jpg" alt="Card image cap"/>
                <div class="card-block">                    
                    <h4 class="card-title">עוגיות גרנולה ושוקלד ציפס, עוגיות בריאות וטעימות | קוואקר</h4>
                    <a target="_blank" href="https://www.quaker.co.il/%D7%9E%D7%AA%D7%9B%D7%95%D7%A0%D7%99%D7%9D/%D7%A2%D7%95%D7%92%D7%99%D7%95%D7%AA_%D7%92%D7%A8%D7%A0%D7%95%D7%9C%D7%94_%D7%A9%D7%95%D7%A7%D7%95%D7%9C%D7%93_%D7%A6%D7%B3%D7%99%D7%A4%D7%A1">למתכון באתר</a>
                    <p class="card-text text-right">כשמתחשק חטיף גרנולה בשילוב עוגיות בריאות - משלבים עוגיות גרנולה עם שוקולד ציפס של קוואקר. טעים ומפנק בכל בוקר מחדש</p>
                    <div class="form-group">
                        <label for="email">תגיות</label>
                    <input id="recipe_hashtags" type="text" class="form-control" value="גרנולה בוקר5דקות שוקולד וניל בצק סוכר" />
                        </div>

                    
                    <a href="#" class="btn btn-primary">עדכן תגיות</a>

                </div>
            </div>--%>
                            </div>
                        </div>
                    </div>


                </div>

            </div>


        </div>

    </form>
</body>
</html>
