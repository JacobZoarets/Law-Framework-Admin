<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webchat.aspx.cs" Inherits="webchat" %>

<!DOCTYPE html>

<html><head>
    <meta charset="UTF-8">
    <title>LeoBot</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
    </style>
    <link href="webchat/botchat.css" rel="stylesheet" />    
    <link href="webchat/botchat-fullwindow.css" rel="stylesheet" />

    <!-- <link href="/css/botchat.css" rel="stylesheet">
    <link href="/css/botchat-fullwindow.css" rel="stylesheet">-->
</head>
<body>
    <div id="BotChatElement"><div data-reactroot="" class="wc-app"><div class="wc-chatview-panel"><div class="wc-header"><span>Chat</span></div><div class="wc-message-pane"><div class="wc-message-groups"><div class="wc-message-group-content" style="margin-top: 0px;"><div class="wc-message-wrapper list" data-activity-id="4cBMxwVzry3H9BgjeJFbfo|0000000"><div class="wc-message wc-message-from-me"><div class="wc-message-content"><svg class="wc-message-callout"><path class="point-left" d="m0,6 l6 6 v-12 z"></path><path class="point-right" d="m6,6 l-6 6 v-12 z"></path></svg><div><span class="format-plain"><span><!-- react-text: 44 -->hi<!-- /react-text --><br></span></span><!-- react-empty: 46 --></div></div></div><div class="wc-message-from wc-message-from-me"><span><!-- react-text: 78 -->You<!-- /react-text --></span></div></div><div data-activity-id="4cBMxwVzry3H9BgjeJFbfo|0000001" class="wc-message-wrapper list"><div class="wc-message wc-message-from-bot"><div class="wc-message-content"><svg class="wc-message-callout"><path class="point-left" d="m0,6 l6 6 v-12 z"></path><path class="point-right" d="m6,6 l-6 6 v-12 z"></path></svg><div><div class="format-markdown"><p>בחר:</p>
</div><!-- react-empty: 57 --></div></div></div><div class="wc-message-from wc-message-from-bot"><span><!-- react-text: 60 -->LeoBot<!-- /react-text --></span></div></div><div class="wc-message-wrapper list" data-activity-id="4cBMxwVzry3H9BgjeJFbfo|0000002"><div class="wc-message wc-message-from-me"><div class="wc-message-content"><svg class="wc-message-callout"><path class="point-left" d="m0,6 l6 6 v-12 z"></path><path class="point-right" d="m6,6 l-6 6 v-12 z"></path></svg><div><span class="format-plain"><span><!-- react-text: 88 -->תצוגת אופנה<!-- /react-text --><br></span></span><!-- react-empty: 90 --></div></div></div><div class="wc-message-from wc-message-from-me"><span><!-- react-text: 139 -->You<!-- /react-text --></span></div></div><div data-activity-id="4cBMxwVzry3H9BgjeJFbfo|0000003" class="wc-message-wrapper list"><div class="wc-message wc-message-from-bot"><div class="wc-message-content"><svg class="wc-message-callout"><path class="point-left" d="m0,6 l6 6 v-12 z"></path><path class="point-right" d="m6,6 l-6 6 v-12 z"></path></svg><div><span class="format-plain"><span><!-- react-text: 102 -->תצוגת האופנה שלנו היא המדהימה ביותר<!-- /react-text --><br></span></span><!-- react-empty: 104 --></div></div></div><div class="wc-message-from wc-message-from-bot"><span><!-- react-text: 107 -->LeoBot<!-- /react-text --></span></div></div><div data-activity-id="4cBMxwVzry3H9BgjeJFbfo|0000004" class="wc-message-wrapper list"><div class="wc-message wc-message-from-bot"><div class="wc-message-content"><svg class="wc-message-callout"><path class="point-left" d="m0,6 l6 6 v-12 z"></path><path class="point-right" d="m6,6 l-6 6 v-12 z"></path></svg><div><!-- react-empty: 116 --><div class="wc-list"><div class="wc-card wc-adaptive-card hero"><div class="ac-container" style="background-color: rgba(0, 0, 0, 0); padding: 8px; box-sizing: border-box;"><div class="ac-container" style="background-color: rgba(0, 0, 0, 0); padding: 0px; box-sizing: border-box;"><div class="ac-image" style="display: flex; align-items: flex-start; justify-content: flex-start; box-sizing: border-box;"><img src="https://cdn.buy2v.co.il/Placement/0e750322-36a2-49ed-8b09-5df9f711f9ce/5f8f659e.jpg" style="max-height: 100%; width: 100%;"></div><div style="height: 8px;"></div><div style="font-family: &quot;Segoe UI&quot;, sans-serif; text-align: left; font-size: 15px; line-height: 19.95px; color: rgb(0, 0, 0); font-weight: 700; white-space: nowrap; box-sizing: border-box;"><p style="margin-top: 0px; width: 100%; overflow: hidden; text-overflow: ellipsis; margin-bottom: 0px;">כותרת</p>
</div><div style="font-family: &quot;Segoe UI&quot;, sans-serif; text-align: left; font-size: 13px; line-height: 17.29px; color: rgb(128, 140, 149); font-weight: 400; word-wrap: break-word; box-sizing: border-box;"><p style="margin-top: 0px; width: 100%; margin-bottom: 0px;">זוהי כותרת משנה</p>
</div><div style="height: 8px;"></div><div style="font-family: &quot;Segoe UI&quot;, sans-serif; text-align: left; font-size: 13px; line-height: 17.29px; color: rgb(0, 0, 0); font-weight: 400; word-wrap: break-word; box-sizing: border-box;"><p style="margin-top: 0px; width: 100%; margin-bottom: 0px;">זה טקסט ארוך</p>
</div></div><div style="height: 8px;"></div><div><div style="overflow: hidden;"><div style="display: flex; flex-direction: column; align-items: flex-start;"><button class="ac-pushButton" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; flex: 0 1 auto;">לפרטים נוספים</button></div></div><div style="background-color: rgba(0, 0, 0, 0);"></div></div></div></div></div></div></div></div><div class="wc-message-from wc-message-from-bot"><span><!-- react-text: 121 -->LeoBot<!-- /react-text --></span></div></div><div data-activity-id="4cBMxwVzry3H9BgjeJFbfo|0000005" class="wc-message-wrapper list"><div class="wc-message wc-message-from-bot"><div class="wc-message-content"><svg class="wc-message-callout"><path class="point-left" d="m0,6 l6 6 v-12 z"></path><path class="point-right" d="m6,6 l-6 6 v-12 z"></path></svg><div><!-- react-empty: 130 --><div class="wc-list"><div class="wc-card wc-adaptive-card video"><div class="non-adaptive-content"><video controls="" type="video" src="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3" poster="https://upload.wikimedia.org/wikipedia/en/3/3c/SW_-_Empire_Strikes_Back.jpg"></video></div><div class="ac-container" style="background-color: rgba(0, 0, 0, 0); padding: 8px; box-sizing: border-box;"><div class="ac-container" style="background-color: rgba(0, 0, 0, 0); padding: 0px; box-sizing: border-box;"><div style="font-family: &quot;Segoe UI&quot;, sans-serif; text-align: left; font-size: 15px; line-height: 19.95px; color: rgb(0, 0, 0); font-weight: 700; white-space: nowrap; box-sizing: border-box;"><p style="margin-top: 0px; width: 100%; overflow: hidden; text-overflow: ellipsis; margin-bottom: 0px;">title</p>
</div><div style="font-family: &quot;Segoe UI&quot;, sans-serif; text-align: left; font-size: 13px; line-height: 17.29px; color: rgb(128, 140, 149); font-weight: 400; word-wrap: break-word; box-sizing: border-box;"><p style="margin-top: 0px; width: 100%; margin-bottom: 0px;">subtitle</p>
</div><div style="height: 8px;"></div><div style="font-family: &quot;Segoe UI&quot;, sans-serif; text-align: left; font-size: 13px; line-height: 17.29px; color: rgb(0, 0, 0); font-weight: 400; word-wrap: break-word; box-sizing: border-box;"><p style="margin-top: 0px; width: 100%; margin-bottom: 0px;">audio text</p>
</div></div><div style="height: 8px;"></div><div><div style="overflow: hidden;"><div style="display: flex; flex-direction: column; align-items: flex-start;"><button class="ac-pushButton" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis; flex: 0 1 auto;">button</button></div></div><div style="background-color: rgba(0, 0, 0, 0);"></div></div></div></div></div></div></div></div><div class="wc-message-from wc-message-from-bot"><span><!-- react-text: 137 -->LeoBot<!-- /react-text --><!-- react-text: 138 --> at 2:47:01 PM<!-- /react-text --></span></div></div></div></div><div class="wc-suggested-actions"><div><button class="scroll previous" disabled=""><svg><path d="M 16.5 22 L 19 19.5 L 13.5 14 L 19 8.5 L 16.5 6 L 8.5 14 L 16.5 22 Z"></path></svg></button><div class="wc-hscroll-outer"><div class="wc-hscroll" style="margin-bottom: -17px;"><ul><li><button title="תצוגת אופנה">תצוגת אופנה</button></li><li><button title="מעצבים">מעצבים</button></li><li><button title="קולקציות">קולקציות</button></li></ul></div></div><button class="scroll next"><svg><path d="M 12.5 22 L 10 19.5 L 15.5 14 L 10 8.5 L 12.5 6 L 20.5 14 L 12.5 22 Z"></path></svg></button></div></div></div><div class="wc-console"><input type="file" id="wc-upload-input" multiple=""><label class="wc-upload" for="wc-upload-input"><svg><path d="M19.96 4.79m-2 0a2 2 0 0 1 4 0 2 2 0 0 1-4 0zM8.32 4.19L2.5 15.53 22.45 15.53 17.46 8.56 14.42 11.18 8.32 4.19ZM1.04 1L1.04 17 24.96 17 24.96 1 1.04 1ZM1.03 0L24.96 0C25.54 0 26 0.45 26 0.99L26 17.01C26 17.55 25.53 18 24.96 18L1.03 18C0.46 18 0 17.55 0 17.01L0 0.99C0 0.45 0.47 0 1.03 0Z"></path></svg></label><div class="wc-textbox"><input type="text" class="wc-shellinput" value="" placeholder="Type your message..."></div><label class="wc-send"><svg><path d="M26.79 9.38A0.31 0.31 0 0 0 26.79 8.79L0.41 0.02C0.36 0 0.34 0 0.32 0 0.14 0 0 0.13 0 0.29 0 0.33 0.01 0.37 0.03 0.41L3.44 9.08 0.03 17.76A0.29 0.29 0 0 0 0.01 17.8 0.28 0.28 0 0 0 0.01 17.86C0.01 18.02 0.14 18.16 0.3 18.16A0.3 0.3 0 0 0 0.41 18.14L26.79 9.38ZM0.81 0.79L24.84 8.79 3.98 8.79 0.81 0.79ZM3.98 9.37L24.84 9.37 0.81 17.37 3.98 9.37Z"></path></svg></label><label class="wc-mic hidden inactive"><svg width="28" height="22" viewBox="0 0 58 58"><path d="M 44 28 C 43.448 28 43 28.447 43 29 L 43 35 C 43 42.72 36.72 49 29 49 C 21.28 49 15 42.72 15 35 L 15 29 C 15 28.447 14.552 28 14 28 C 13.448 28 13 28.447 13 29 L 13 35 C 13 43.485 19.644 50.429 28 50.949 L 28 56 L 23 56 C 22.448 56 22 56.447 22 57 C 22 57.553 22.448 58 23 58 L 35 58 C 35.552 58 36 57.553 36 57 C 36 56.447 35.552 56 35 56 L 30 56 L 30 50.949 C 38.356 50.429 45 43.484 45 35 L 45 29 C 45 28.447 44.552 28 44 28 Z"></path><path id="micFilling" d="M 28.97 44.438 L 28.97 44.438 C 23.773 44.438 19.521 40.033 19.521 34.649 L 19.521 11.156 C 19.521 5.772 23.773 1.368 28.97 1.368 L 28.97 1.368 C 34.166 1.368 38.418 5.772 38.418 11.156 L 38.418 34.649 C 38.418 40.033 34.166 44.438 28.97 44.438 Z"></path><path d="M 29 46 C 35.065 46 40 41.065 40 35 L 40 11 C 40 4.935 35.065 0 29 0 C 22.935 0 18 4.935 18 11 L 18 35 C 18 41.065 22.935 46 29 46 Z M 20 11 C 20 6.037 24.038 2 29 2 C 33.962 2 38 6.037 38 11 L 38 35 C 38 39.963 33.962 44 29 44 C 24.038 44 20 39.963 20 35 L 20 11 Z"></path></svg></label></div></div></div></div>
    <script src="/scripts/botchat.js"></script>
    <script>
        var model = {
  "userId": "GW4shLViZ2n",
  "userName": "You",
  "botId": "yacovzoarets",
  "botIconUrl": "//bot-framework.azureedge.net/bot-icons-v1/bot-framework-default-3.png",
  "botName": "LeoBot",
  "secret": "2fnMb29hgy0.cwA.VOE.PKXf9JbVF2J4Q90_siauUzrxci84B7sGoEROrZVWGgM",
  "iconUrl": "//bot-framework.azureedge.net/bot-icons-v1/bot-framework-default-3.png",
  "directLineUrl": "https://webchat.botframework.com/v3/directline",
  "webSocketEnabled": "false"
};
    </script>
    <script>
        BotChat.App({
            directLine: {
                secret: model.secret,
                token: model.token,
                domain: model.directLineUrl,
                webSocket: false
            },
            user: { id: model.userId, name: model.userName },
            bot: { id: model.botId, name: model.botName },
            resize: 'window'
        }, document.getElementById("BotChatElement"));

    </script>

</body></html>
