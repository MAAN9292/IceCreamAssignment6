using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_enquiry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRepEnquiry(); // method calling to get enquiries
        }
    }

    //Get all enquries in view
    private void BindRepEnquiry() 
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        repEnquiry.DataSource = data.EnquiryInfoes.ToList();
        repEnquiry.DataBind();
    }

    protected void repEnquiry_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("del"))  //delete enquiry
        {
            int id = int.Parse(e.CommandArgument.ToString());
            RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
            EnquiryInfo cid = new EnquiryInfo();
            cid = data.EnquiryInfoes.Single(v => v.EnquiryId == id); // get "enquiry id" to delete!
            data.EnquiryInfoes.Attach(cid);
            data.EnquiryInfoes.Remove(cid);
            data.SaveChanges();
            BindRepEnquiry();
            lblMsg.Text = "*Enquiry Deleted!!";

        }
    }
}