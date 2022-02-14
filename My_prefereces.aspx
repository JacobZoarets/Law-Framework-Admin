<%@ Page Language="C#" AutoEventWireup="true" CodeFile="My_prefereces.aspx.cs" Inherits="My_prefereces" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0,  minimum-scale=1.0"/>  

    <style>
        
@media all and (orientation: landscape) and (min-aspect-ratio: 14/9) {

}
        html,
 body {
    height: 100%;
    width: 100%;
  }  
        .pref_checkbox_1 {
            position:absolute;            
            left:325px;
            top:255px;
            height: 21px;
        }
        .pref_checkbox_2 {
            position:absolute;            
            left:250px;
            top:255px;
            height: 21px;
        }
        .pref_checkbox_3 {
            position:absolute;            
            left:169px;
            top:255px;
            height: 21px;
        }
        .pref_checkbox_4 {
            position:absolute;            
            left:94px;
            top:255px;
            height: 21px;
        }
    </style>
</head>
<body   >
    <form id="form1" runat="server">
        <div  >
            <img style="position:absolute;left:0px;top:0px;width:100%;height:100%" src="http://lbi.co.il/projects/quakerBot/images/71413_minisite-quaker_a_small.jpg" />

            <input class="pref_checkbox_1"  value="מתוק" type="checkbox" name="optionsCheckboxes"  />
            <input class="pref_checkbox_2"  value="מתוק" type="checkbox" name="optionsCheckboxes"  />
            <input class="pref_checkbox_3"  value="מתוק" type="checkbox" name="optionsCheckboxes"  />
            <input class="pref_checkbox_4"  value="מתוק" type="checkbox" name="optionsCheckboxes"  />
        </div>
    </form>
</body>
</html>
