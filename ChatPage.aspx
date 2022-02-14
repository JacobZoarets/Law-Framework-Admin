<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatPage.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Light Bootstrap Table core CSS  -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <script src="assets/jquery.fbmessenger-develop/src/js/jquery.fbmessenger.js"></script>
    <!--<script src="assets/jquery.fbmessenger-develop/dist/jquery.fbmessenger.min.js"></script>-->
    <link href="assets/jquery.fbmessenger-develop/dist/jquery.fbmessenger.css" rel="stylesheet" />

    <style>
        div.myautoscroll:hover {
            overflow: auto;
            /*padding-right: 1px;*/
        }
    </style>

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

                        <li class="active">


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="ChatPage.aspx?conversation_id=11">

                                <p style="font-size: 20px">שאלון היכרות</p>


                            </a>
                        </li>
                        <li class="divider">&nbsp</li>

                        <li>


                            <div style="width: 10px; float: left">&nbsp</div>
                            <a href="ClientsManagment.aspx">

                                <p style="font-size: 20px">ממשק פריסת סיכונים</p>


                            </a>
                        </li>

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
                            <div class="col-md-7">
                                <div style="height: 750px">
                                    <div class="screen-content">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">

                                <div class="screen-content1" style="height: 750px">
                                    <div id="accordion">
                                        <h3>לשון המחוקק</h3>
                                        <div>
                                            <div style="width: 100%; height: 470px; background-color: white;">
                                                <p class="myautoscroll" id="law_raw_text" style="direction: rtl; margin: 0px; padding-right: 20px">
                                                    חוק התקשורת (בזק ושידורים) (תיקון מס" 40), התשס"ח–2008*


החלפת סעיף 30א	1.	בחוק התקשורת (בזק ושידורים), התשמ"ב–1982  , במקום סעיף 30א יבוא:
		"שיגור דבר
פרסומת באמצעות מיתקן בזק	30א.	(א)	בסעיף זה –
						"דבר פרסומת" – מסר המופץ באופן מסחרי, שמטרתו לעודד רכישת מוצר או שירות או לעודד הוצאת כספים בדרך אחרת;
						"הודעה אלקטרונית" – מסר בזק מקודד המועבר ברשת האינטרנט אל נמען או קבוצה של נמענים, וניתן לשמירה ולאחזור בדרך ממוחשבת;
						"הודעת מסר קצר" – מסר בזק הכולל כתב, לרבות אותות או סימנים, או מסר בזק הכולל חוזי או שמע, ומועבר באמצעות רשת בזק ציבורית אל ציוד קצה של נמען או קבוצה של נמענים;
						"מערכת חיוג אוטומטי" – מיתקן בזק המשמש לחיוג או לניתוב אוטומטיים של רצף שיחות לקבוצה של נמענים לשם העברת מסר קולי מוקלט אל אותם נמענים;
						"מפרסם" – מי ששמו או מענו מופיעים בדבר הפרסומת כמען להתקשרות לשם רכישתו של נושא דבר הפרסומת, מי שתוכנו של דבר הפרסומת עשוי לפרסם את עסקיו או לקדם את מטרותיו, או מי שמשווק את נושא דבר הפרסומת בעבור אחר; לעניין זה, לא יראו כמפרסם מי שביצע, בעבור אחר, פעולת שיגור של דבר פרסומת כשירות בזק לפי רישיון כללי, רישיון מיוחד או מכוח היתר כללי, שניתנו לפי חוק זה.
						(ב)	לא ישגר מפרסם דבר פרסומת באמצעות פקסימיליה, מערכת חיוג אוטומטי, הודעה אלקטרונית או הודעת מסר קצר, בלא קבלת הסכמה מפורשת מראש של הנמען, בכתב, לרבות בהודעה אלקטרונית או בשיחה מוקלטת; פנייה חד-פעמית מטעם מפרסם לנמען שהוא בית עסק, באחת הדרכים האמורות בסעיף קטן זה, המהווה הצעה להסכים לקבל דברי פרסומת מטעמו, לא תיחשב הפרה של הוראות סעיף זה.
						(ג)	על אף הוראות סעיף קטן (ב), רשאי מפרסם לשגר דבר פרסומת כאמור באותו סעיף קטן אף אם לא התקבלה הסכמת הנמען, בהתקיים כל אלה:
							(1)	הנמען מסר את פרטיו למפרסם במהלך רכישה של מוצר או שירות, או במהלך משא ומתן לרכישה כאמור, והמפרסם הודיע לו כי הפרטים שמסר ישמשו לצורך משלוח דבר פרסומת מטעמו, באחת הדרכים האמורות בסעיף קטן (ב);
							(2)	המפרסם נתן לנמען הזדמנות להודיע לו כי הוא מסרב לקבל דברי פרסומת כאמור, דרך כלל או מסוג מסוים, והנמען לא עשה כן;
							(3)	דבר הפרסומת מתייחס למוצר או לשירות מסוג דומה למוצר או לשירות האמורים בפסקה (1).
						(ד)	הסכים הנמען לקבל דברי פרסומת לפי הוראות סעיף קטן (ב) או לא הודיע על סירובו לקבלם לפי הוראות סעיף קטן (ג), רשאי הוא, בכל עת, להודיע למפרסם על סירובו לקבל דברי פרסומת, דרך כלל או מסוג מסוים, ולחזור בו מהסכמתו, ככל שניתנה (בסעיף זה – הודעת סירוב); הודעת הסירוב לא תהיה כרוכה בתשלום, למעט עלות משלוח ההודעה; הודעת הסירוב תינתן בכתב או בדרך שבה שוגר דבר הפרסומת, לפי בחירת הנמען.
						(ה)	(1)	מפרסם המשגר דבר פרסומת בהתאם להוראות סעיף זה יציין בו את הפרטים האלה באופן בולט וברור, שאין בו כדי להטעות:
								(א)	היותו דבר פרסומת; המילה "פרסומת" תופיע בתחילת דבר הפרסומת, ואם דבר הפרסומת משוגר באמצעות הודעה אלקטרונית – בכותרת ההודעה;
								(ב)	שמו של המפרסם, כתובתו ודרכי יצירת הקשר עמו;
								(ג)	זכותו של הנמען לשלוח בכל עת הודעת סירוב כאמור בסעיף קטן (ד), ודרך אפשרית למשלוח הודעה כאמור שהיא פשוטה וסבירה בנסיבות העניין, ואם דבר הפרסומת משוגר באמצעות הודעה אלקטרונית – כתובת תקפה של המפרסם ברשת האינטרנט לצורך מתן הודעת סירוב.
							(2)	על אף הוראות פסקה (1), מפרסם המשגר דבר פרסומת באמצעות הודעת מסר קצר יציין בדבר הפרסומת רק את שמו ואת דרכי יצירת הקשר עמו לצורך מתן הודעת סירוב.
						(ו)	(1)	מפרסם המשגר דבר פרסומת בניגוד להוראות סעיפים קטנים (ב) או (ג), דינו – קנס כאמור בסעיף 61(א)(4) לחוק העונשין.
							(2)	מפרסם המשגר דבר פרסומת שלא צוינו בו הפרטים האמורים בסעיף קטן (ה) באופן בולט וברור, או שיש בפרטים שצוינו בו כדי להטעות, בניגוד להוראות אותו סעיף קטן, דינו – קנס כאמור בסעיף 61(א)(3) לחוק העונשין.
						(ז)	בבואו להטיל קנס על מפרסם שהורשע בעבירה לפי סעיף קטן (ו), רשאי בית המשפט להתחשב בכך שנפסקו נגד אותו מפרסם, בפסק דין סופי בשל המעשה שבשלו הורשע כאמור, פיצויים לדוגמה לפי סעיף קטן (י).
						(ח)	מנהל של תאגיד וכן מי שאחראי לתחומי השיווק או הפרסום בתאגיד )בסעיף זה – נושא משרה בתאגיד) חייב לפקח ולעשות כל שניתן למניעת עבירה לפי סעיף קטן (ו) בידי התאגיד או בידי עובד מעובדיו; המפר הוראה זו, דינו – קנס כאמור בסעיף 61(א)(3) לחוק העונשין; נעברה עבירה בידי התאגיד או בידי עובד מעובדיו, חזקה היא כי נושא משרה בתאגיד הפר את חובתו לפי סעיף קטן זה, אלא אם כן עשה כל שניתן כדי למלא את חובתו.
						(ט)	הפרת הוראות סעיף זה היא עוולה אזרחית והוראות פקודת הנזיקין [נוסח חדש] , יחולו עליה, בכפוף להוראות סעיף זה.
						(י)	(1)	שוגר דבר פרסומת ביודעין   בניגוד להוראות סעיף זה, רשאי בית המשפט לפסוק בשל הפרה זו פיצויים שאינם תלויים בנזק (בסעיף זה – פיצויים לדוגמה), בסכום שלא יעלה על 1,000 שקלים חדשים בשל כל דבר פרסומת שקיבל הנמען בניגוד להוראות סעיף זה.
							(2)	בבואו לקבוע את גובה הפיצויים לדוגמה, רשאי בית המשפט להתחשב בכך שאותו מפרסם הורשע, בשל אותו מעשה, בעבירה לפי סעיף קטן (ו).
							(3)	בבואו לקבוע את גובה הפיצויים לדוגמה, יתחשב בית המשפט, בין השאר, בשיקולים המפורטים להלן, ולא יתחשב בגובה הנזק שנגרם לנמען כתוצאה מביצוע ההפרה:
								(א)	אכיפת החוק והרתעה מפני הפרתו;
								(ב)	עידוד הנמען למימוש זכויותיו;
								(ג)	היקף ההפרה.
							(4)	אין בהוראות סעיף קטן זה כדי לגרוע מזכותו של הנמען לפיצויים לפי סעיף קטן (ט) או לכל סעד אחר, בשל אותה הפרה.
							(5)	חזקה על מפרסם ששיגר דבר פרסומת בניגוד להוראות סעיף זה, שעשה כך ביודעין כאמור בפסקה (1), אלא אם כן הוכיח אחרת; לעניין זה, לא תהיה למפרסם הגנה במקרים המפורטים להלן:
								(א)	שיגור דבר הפרסומת נעשה לאחר שניתנה למפרסם הודעת סירוב מאת הנמען כאמור בסעיף קטן (ד);
								(ב)	המפרסם שיגר בעבר דבר פרסומת לנמען בניגוד להוראות סעיף זה, אף אם לא ביודעין;
								(ג)	דבר הפרסומת שוגר לנמען לפי רשימה של מענים או מספרי טלפון, לפי העניין, שהורכבו בהתאם לרצף אקראי של אותיות, ספרות או סימנים אחרים, או שילוב שלהם, כולם או חלקם.
						(יא)	השר, באישור ועדת הכלכלה של הכנסת, רשאי לקבוע הוראות לעניין ביצוע סעיף זה, לרבות לעניין – 
							(1)	אופן מסירת הודעת נמען על הסכמה מפורשת מראש כאמור בסעיף קטן (ב);
							(2)	אופן מסירת הודעת המפרסם כאמור בסעיף קטן (ג)(1);
							(3)	אופן מתן הודעת סירוב כאמור בסעיף קטן (ד);
							(4)	אופן ציון הפרטים שיש לציין בדבר פרסומת כאמור בסעיף קטן (ה) ודרכים אחרות להבאת הפרטים האמורים בסעיף קטן (ה)(2) לידיעת הנמען;
							(5)	פרטים נוספים שעל מפרסם לציין בדבר פרסומת המשוגר בהתאם להוראות סעיף זה.
						(יב)	השר, באישור ועדת הכלכלה של הכנסת, רשאי לקבוע דרכים נוספות של שיגור דבר פרסומת באמצעות מיתקן בזק שהוראות סעיף זה יחולו לגביהן.
						(יג)	אין בהוראות סעיף זה כדי לגרוע מהוראות כל דין."
תיקון חוק התובענות הייצוגיות 
– מס" 3	2. 	בחוק התובענות הייצוגיות, התשס"ו–2006 , בתוספת השניה, אחרי פרט 11, יבוא:
		"12.	תביעה נגד מפרסם כהגדרתו בסעיף 30א לחוק התקשורת (בזק ושידורים), התשמ"ב–1982 , בעילה לפי הסעיף האמור."
תחילה	3. 	תחילתו של חוק זה שישה חודשים מיום פרסומו.



	אהוד אולמרט
ראש הממשלה		אריאל אטיאס
שר התקשורת

			

שמעון פרס
נשיא המדינה		דליה איציק
יושבת ראש הכנסת	

                                                    
                                                </p>
                                            </div>
                                        </div>
                                        <h3>פסיקות רלוונטיות</h3>
                                        <div id="relevant_verdicts">
                                            <p>
                                                ת"צ (מחוזי ת"א-יפו) 60132-03-15 רן זינגר ואח נגד בזק - החברה הישראלית לתקשורת בע"מ (9.1.2018)
                                            </p>
                                            <p>
                                                במקרה דומה שנפסק לאחרונה בעניין בזק  נקבע כי משלוח מסרון ללקוחות ובו קישור לאתר חברת בזק המיידע את הלקוחות אודות פעולות שונות שניתן לבצע באתר, מהווה פרסומת אסורה וזאת בשל העובדה כי במסגרת האתר ישנה הפנייה לפעולות שונות כדוגמת הזמנת ציוד, שדרוג "חבילות" וכד' שמטרתן עידוד בעקיפין הוצאת כסף מכיסו של הלקוח.
                                            </p>
                                        </div>
                                        <h3>הרחבות רלוונטיות</h3>
                                        <div id="relevant_extentions">
                                            <p>
                                                תאמ (הרצ) 21784-11-16‏ ‏ לילך זוננשיין נגד הוצאת עתון הארץ בע"מ (20.7.2017)
                                            </p>
                                            <p>
                                                וראו גם מקרה בו נקבע כי מסר מעורב שנשלח ללקוח מטעם עיתון הארץ שכלל קישור לכתבות פופולאריות, המכיל תוכן ענייני לצד תוכן פרסומי, מהווה דבר פרסומת ; מקרה בו נקבע כי משלוח קישור להורדת ישומון מהווה עידוד עקיף לצורך שירות, ומהווה דבר פרסומת  וכן מקרה בו משלוח הודעות שתכליתן לשמור על קשר עם הלקוח כחלק ממטרה עסקית להשאת רווחי החברה נכלל תחת ההגדרה של "דבר פרסומת".                                        

                                            </p>
                                        </div>
                                        <h3>רשימת סיכונים</h3>
                                        <div>
                                            <div style="width: 100%; height: 100px; direction: rtl; overflow-y: auto">
                                                <p id="danger_list">
                                                    רשימת סיכונים לאנליזה נוכחית
                                                </p>
                                                <ul id="danger_list_ul">
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <%--<br /><a href="ChatPage.aspx?conversation_id=6" ><img style="max-width:200px;max-height:200px" src="https://kontak.me/rw_common/plugins/stacks/armadillo/media/spambot.jpg" /> </a>
                                    --%>
                                    <%-- <br /> <br /><a href="ClientsManagment.aspx" >ממשק פריסת סיכונים </a>
                                    <div style="height: 30px">
                                        
                                    </div>--%>

                                    <div style="width: 100%; height: 30px; background-color: white; direction: rtl">
                                        <center>
                                        <p id="danger_level">
                                           
                                            <%--danger_level : 1-4--%>
                                                
                                        </p>
                                             </center>
                                    </div>
                                    <div style="width: 100%; height: 30px; background-color: white; direction: rtl">
                                        <center>
                                        <p id="financial_danger_level">
                                            
                                            <%--financial_danger_level : 1000$--%>
                                                
                                        </p>
                                            </center>
                                    </div>
                                    <div style="width: 100%; height: 30px; background-color: white; direction: rtl">
                                        <center>
                                        <p id="question_number">
                                            
                                            <%--question_number : 1 of 25--%>
                                                
                                        </p>
                                            </center>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>




            </div>
    </form>
    <script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>

    <script type="text/javascript">

        $(function () {
            var now = new Date();

            $('.screen-content').fbMessenger({
                botName: 'Agmon Law',
                botBannerUrl: 'http://www.agmon-law.co.il/uploaded_files/91410081887.png',
                botLogoUrl: 'assets/jquery.fbmessenger-develop/demo/logo.png',
                botWelcomeMessage: 'סידרה של שאלות המתוכננות לבדוק סיכונים מול חוק הספאם',
                likes: {
                    totalCount: 25123,
                    friendName: 'John Doe',
                    otherFriendsCount: 42
                },
                loop: false
            })
                .fbMessenger('start', { delay: 0 })


            $('.jsm-get-started-button').click(function () {
                get_response('test111')
            });

            var myVar = setInterval(get_next_node, 100);



            $("#accordion").accordion();

            if (getUrlVars()['conversation_id'] != undefined) {
                conversation_id = getUrlVars()['conversation_id'];
                if (conversation_id != '6') {
                    $("#law_raw_text").hide();
                    $(".jsm-bot-welcome-status").hide();
                    $(".jsm-get-started-info").hide();
                }
            }

        });

        var unique_conversation_id = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,
            function (c) {
                var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });

        var user_clicked = false;
        var quick_replys_payload = null;
        var selected_reply_payload = "";
        var prev_selected_reply_payload = "";
        var user_id = "2323232";
        var conversation_id = "6";
        var anotation_index = 0;
        var danger_count = 0;
        var question_counter = 0;
        var user_clicked_pinMessage = false;

        function get_next_node() {

            if (user_clicked) {
                user_clicked = false;
                get_response();
            }


        }

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

        function scrollToLine(line) {

            document.getElementById('selected_text_' + +anotation_index).scrollIntoView({ block: 'start', behavior: 'smooth' });

        }


        function addHiddenInputToPage(id, value) {
            $('<input>').attr({
                type: 'hidden',
                id: id,
                value: value
            }).appendTo('.screen-content');
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
            var relevant_extentions = $('#relevant_extentions').parent().html().replace("'", "");
            var relevant_danger_links = $('#danger_list_ul').parent().html().replace("'", "");

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
                    if (response.d == "False") {
                        alert("Something is wrong with saving.");
                    }
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
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
            question_counter += 1;

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
                            //quick_replys.push("חזור");
                            quick_replys.push('<img src="https://findicons.com/files/icons/77/icandy_junior_toolbar/128/back_2.png" style="width:25px;height:25px;border:0" />');
                            quick_replys_payload.push(prev_selected_reply_payload);
                        }

                        //quick_replys.push("נעץ שאלה");
                        quick_replys.push('<img src="https://cdn3.iconfinder.com/data/icons/classic-icons-1/512/09.png" style="width:25px;height:25px;border:0" />');
                        quick_replys_payload.push("pin_message_action");


                        $('.screen-content').fbMessenger('showQuickReplies',
                            quick_replys,
                            { timestamp: new Date(), delay: 0 }
                        );

                        quick_replay_click_interval = setInterval(setQuickReplayClickEvent, 1000);
                        //setQuickReplayClickEvent();

                    }


                    if (response_obj.message_origin != "") {
                        anotation_index += 1;
                        var txt = response_obj.message_origin;
                        var txt_source = '#' + response_obj.message_origin_source;



                        if (txt_source == '#law_raw_text') {
                            $("#accordion").accordion("option", "active", 0);
                        }
                        else if (txt_source == '#relevant_verdicts') {
                            $("#accordion").accordion("option", "active", 1);
                        }
                        else if (txt_source == '#relevant_extentions') {
                            $("#accordion").accordion("option", "active", 2);
                        }
                        else if (response_obj.danger_level == '4') {
                            $("#accordion").accordion("option", "active", 3);
                        }

                        if ($(txt_source).html().indexOf(txt) != -1) {
                            $('.selected-text').css("background-color", "#F5F5F5");
                            $('.selected-text').css("color", "black");

                            $(txt_source).html($(txt_source).html().replace(txt, '<span class="selected-text" id="selected_text_' + anotation_index + '" style="background-color: #007fff;font-weight: bold;color:white">' + response_obj.message_origin + '</span>'))
                            document.getElementById('selected_text_' + +anotation_index).scrollIntoView({ block: 'center', behavior: 'smooth' });

                        }

                        //$('#message_explenation').html(response_obj.message_explenation);
                        $('#danger_level').html(response_obj.danger_level);
                        $('#financial_danger_level').html(response_obj.financial_danger_level);
                        $('#question_number').html(response_obj.question_number);
                        $('.jsm-input-prompt').html(response_obj.message_explenation);

                        var text = 'שאלה ' + question_counter + ' מתוך 25 שאלות';
                        $('#question_number').html(text);


                        //console.log('prev last node id was:' + prev_selected_reply_payload);


                    }
                }
            }




            $('.screen-content').fbMessenger('run');
            save_html_tree();

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

        var isFound = false;
        var quick_replay_click_interval;
        function setQuickReplayClickEvent() {
            //setTimeout(function () {
            
            isFound = false;
            //console.log('in');

            $(".jsm-quick-reply-option").each(function () {
                $(this).click(function () {
                    //alert($(this).text());
                    var index = Number($(this).attr('id').replace("reply_option_", ""));
                    $('.screen-content').fbMessenger('selectQuickReply', index, { timestamp: new Date() });
                    $('.screen-content').fbMessenger('hideQuickReplies', { delay: 0 });

                    // clear the script array
                    $('.screen-content').fbMessenger('clear_scripts');


                    if (quick_replys_payload[index] == "pin_message_action") {

                        //$(this).css('background-color', 'red');
                        $(".jsm-left:last").css('background-color', '#007aff');
                        $(".jsm-left:last").css('color', 'white');

                        //if (the_text != last_danger_message) {
                            danger_count += 1;
                            //last_danger_message = the_text;

                            $(".jsm-left:last").attr('id', 'danger_message_' + danger_count);

                            $("#danger_list_ul").append('<li><a id="danger_click_id_' + danger_count + '" href="#">מיקום שמור -  ' + danger_count + '</a></li>');
                            $('#danger_click_id_' + danger_count).click(function () {
                                var elment = document.getElementById('danger_message_' + danger_count);
                                $('.jsm-chat-content').animate({
                                    scrollTop: $("#danger_message_" + danger_count).offset().top
                                }, 1000);
                            });
                        //}
                        $("#accordion").accordion("option", "active", 3);

                        prev_selected_reply_payload = selected_reply_payload;
                        selected_reply_payload = quick_replys_payload[0];

                        setTimeout(function () {
                            user_clicked = true;
                            save_html_tree();
                        }, 1000);
                    }
                    else
                    {
                        prev_selected_reply_payload = selected_reply_payload;
                        selected_reply_payload = quick_replys_payload[index];

                        setTimeout(function () {
                            user_clicked = true;
                            save_html_tree();
                        }, 1000);
                    }

                    
                });
                $(this).css('font-weight', 'bold');
                //isFound = true;
                
            });
            
            if (isFound) {
                isFound = false;
                clearInterval(quick_replay_click_interval);
            }
            //}, 5000);
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


