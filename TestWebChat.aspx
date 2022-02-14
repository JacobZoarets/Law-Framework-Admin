<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestWebChat.aspx.cs" Inherits="TestWebChat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body style="background-image:url('http://lbi.co.il/clients/Azrieli/Bot-Framework-Admin/azrieli_bkrd.JPG')">
    <form id="form1" runat="server">
    <div>
         <script type="text/javascript">

             $(function () {
                 var div = document.createElement("div");
                 document.getElementsByTagName('body')[0].appendChild(div);
                 div.outerHTML = "<div id='botDiv' style='height: 38px; position: fixed; bottom: 0; z-index: 1000; background-color: #fff'><div id='botTitleBar' style='height: 38px; width: 400px; position:fixed; cursor: pointer;'></div><iframe width='400px' height='600px' src='https://webchat.botframework.com/embed/yacovzoarets?s=2fnMb29hgy0.cwA.VOE.PKXf9JbVF2J4Q90_siauUzrxci84B7sGoEROrZVWGgM'></iframe></div>";

                 document.querySelector('body').addEventListener('click', function (e) {
                     e.target.matches = e.target.matches || e.target.msMatchesSelector;
                     if (e.target.matches('#botTitleBar')) {
                         var botDiv = document.querySelector('#botDiv');
                         botDiv.style.height = botDiv.style.height == '600px' ? '38px' : '600px';
                     };
                 });
             }());

         </script>

    
    </div>
    </form>
</body>
</html>
