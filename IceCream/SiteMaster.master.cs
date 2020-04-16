
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRepCategories();
        }
        // Active links in menubar---------------------------
        String activepage = Request.RawUrl;
        if (activepage.Contains("Home"))
        {

            page1.Attributes.Add("class", "active-menu");
            page11.Attributes.Add("class", "active-menu");
        }
        else if (activepage.Contains("Products"))
        {
            page2.Attributes.Add("class", "active-menu");
            page22.Attributes.Add("class", "active-menu");
        }
        else if (activepage.Contains("About"))
        {
            page4.Attributes.Add("class", "active-menu");
            page44.Attributes.Add("class", "active-menu");
        }
        else if (activepage.Contains("Contact"))
        {
            page5.Attributes.Add("class", "active-menu");
            page55.Attributes.Add("class", "active-menu");
        }

        
    }

    //Get All Ice-cream Categories in Footer
    private void BindRepCategories()
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        var cate=from c in data.CategoryInfoes select c;
        repCategories.DataSource = cate.ToList();
        repCategories.DataBind();
    }
}
