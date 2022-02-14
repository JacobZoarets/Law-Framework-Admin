<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetOpenGraphData.aspx.cs" Inherits="GetOpenGraphData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
</head>
<body>
    <a href="https://www.opengraph.io/" target="_blank">www.opengraph.io</a>
    <input type="text" id="urlval" />
    <button  id="loadOpenGraphData1">Load OpenGraph Data</button>
    
    <hr />
    <div>
        <div style="width: 100px; float: left;">
            <img id="icon" style="width: 90px;" />
        </div>
        <div>
            <h2 id="title"></h2>
            <span id="description"></span>
        </div>
    </div>
    <script>
        

        

        $('#loadOpenGraphData1').click(function () {
            var url = $('#urlval').val();// <-- 'https://www.azrieli.com/o/0c491c8f-bd0d-4673-8841-caa1aff2f054';
            //alert(url);
            var urlEncoded = encodeURIComponent(url);
            var apiKey = '5a2e6463651a1db7265fcb7f'; // <-- Replace with your AppId

            // The entire request is just a simple get request with optional query parameters
            var requestUrl = 'https://opengraph.io/api/1.1/site/' + urlEncoded + '?app_id=' + apiKey;

            //alert($('#urlval').val());
            $.getJSON(requestUrl, function (json) {

                // Throw the object in the console to see what it looks like!
                console.log('json', json);

                // Update the HTML elements!
                $('#title').text(json.hybridGraph.title);
                $('#description').text(json.hybridGraph.description);
                $('#icon').attr('src', json.hybridGraph.image);

            });
        });

    </script>
</body>
</html>