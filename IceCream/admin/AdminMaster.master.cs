
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Today Total Enquiry
        DateTime dt = DateTime.Parse(DateTime.Now.ToString("yyyy-MM-dd"));
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        var eq = (from e1 in data.EnquiryInfoes where e1.EnquiryDate==dt select e1).Count();
        if (eq > 0)
        {
            cc.InnerText = eq.ToString();
        }
        else
        {
            cc.InnerText = "0";
        }

        //Active Menu Bar
        String activepage = Request.RawUrl;
        if (activepage.Contains("Dashboard"))
        {

            page1.Attributes.Add("class", "active");

        }
        else if (activepage.Contains("AddSliderImages"))
        {
            page2.Attributes.Add("class", "active");

        }
        else if (activepage.Contains("AddProducts"))
        {
            page3.Attributes.Add("class", "active");

        }
        else if (activepage.Contains("AddCategories"))
        {
            page4.Attributes.Add("class", "active");

        }
        else if (activepage.Contains("Enquiry"))
        {
            page5.Attributes.Add("class", "active");

        }
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        //Logout
        Session.Abandon();
        Response.Redirect("../login.aspx");
    }
}
