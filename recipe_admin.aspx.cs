using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class recipe_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cards_html = generateRecipeCards();
        cards_container.InnerHtml = cards_html;
    }

    private string generateRecipeCards()
    {
        string retValue = "";

        List<Dictionary<string, string>> rows = dbHandler.getTableData("recipe_tags");
        if (rows.Count > 0)
        {
            string retvalue_end = "";
            retValue += "<div><table>";
            for (int i = 0; i < rows.Count; i++)
            {
                if ((i % 5) == 0)
                {
                    retValue += retvalue_end + "<tr class='card-group row'>";
                    retvalue_end += "</tr>";
                }
                string card = generateRecipeCard(rows[i]);
                retValue += "<td>" + card + "</td>";
            }

            retValue += retvalue_end + "</table></div>";
        }

        return retValue;
    }

    private string generateRecipeCard(Dictionary<string, string> row)
    {
        //getHtmlByNodeType_HeroCard(title, subtitle, text, image_url, media_url, button_action_1_text, button_action_1_value)
        //Dictionary<string, Object> values = new Dictionary<string, object>();


        //string controls = "<div class='card-controls'><div class='org-add-button'>new</div><div class='org-del-button'></div></div>";

        //string stats = "<div class='twPc-divStats'>" +
        //               "<ul class='twPc-Arrange'>" +
        //                   "<li class='twPc-ArrangeSizeFit'>" +
        //                       "<a href = '#' >" +
        //                           "<span class='twPc-StatLabel twPc-block'>visitors</span>" +
        //                           "<span class='twPc-StatValue'>" + row["visitors"] + "</span>" +
        //                       "</a>" +
        //                   "</li>" +
        //                   "<li class='twPc-ArrangeSizeFit'>" +
        //                       "<a href = '#' >" +
        //                          "<span class='twPc-StatLabel twPc-block'>ab option</span>" +
        //                            "<span class='twPc-StatValue'>" + "1" + "</span>" +
        //                       "</a>" +
        //                   "</li>" +
        //                   "<li class='twPc-ArrangeSizeFit'>" +
        //                       "<a href = '#' >" +
        //                           "<span class='twPc-StatLabel twPc-block'>percent</span>" +
        //                           "<span class='twPc-StatValue'>" + row["uniques"] + "%</span>" +
        //                       " </a>" +
        //                   "</li>" +
        //               "</ul>" +
        //           "</div>";
        string cardWidth = "250px";
        return "<div id='card_" + row["id"] + "' class='draggeble_object card text-right' style='width:" + cardWidth + "'  >" +
                    "<img  " +
                        "class='card-img-top' src='" + row["recipe_image_url"] + "' alt='Card image cap'>" +
                    "<div class='card-block'>" +
                    "<a href='" + row["recipe_url"] + "' target='_blank'>" + "פתח מתכון" + "</a>" +
                    "<h4 id='title_" + row["id"] + "' class='card-title'>" + row["recipe_title"] + "</h4>" +                    
                    "<div class='form-group'><label for='email'>תגיות (מופרדות ע''י פסיקים)</label><textarea rows='3' id='recipe_hashtags_"+ row["id"] + "' style='height:60px;direction:rtl'  class='form-control' >" + row["recipe_tags"] + "</textarea></div><a id='btn-tag-button_" + row["id"] + "' href='#' class='btn btn-primary btn-tag-button'>עדכן תגיות</a>" +
                    "</div></br>" +
                    "</div>";







    }

}