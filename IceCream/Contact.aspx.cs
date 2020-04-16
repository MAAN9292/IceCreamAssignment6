using RealStarIceCream.App_Code.Operation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDdlSubjectCategory(); // method calling to bind categories
        }
    }

    //bind categories for subject to enquiry
    private void BindDdlSubjectCategory() 
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        var cate = from c in data.CategoryInfoes select c;
        ddlSubject.DataSource = cate.ToList();
        ddlSubject.DataTextField = "CategoryName";
        ddlSubject.DataValueField = "CategoryID";
        ddlSubject.DataBind();
    }

    protected void ddlSubject_DataBound(object sender, EventArgs e)
    {
        ddlSubject.Items.Insert(0, new ListItem("-- Please Select --", "-1"));
    }


    //submiting customer query
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            
            string email, name, mobile, msg="",subject;
            email = txtemail.Text.Trim();
            mobile = txtMobile.Text.Trim();
            name = txtName.Text.Trim();
            subject = ddlSubject.SelectedItem.Text;

            msg += txtUrcomments.Text.Trim() + "<br/> <br/>";
            msg += "-Regards"+"<br/>"+(name + " | " + mobile + " | " + email);
            if (Checks.Empty(name) || Checks.Empty(email) || Checks.Empty(mobile))
            {
                lblMsg.Text = "Please fill all the fields";
                txtName.Focus();
            }
            else if (Checks.Empty(name))
            {
                lblMsg.Text = "Please enter your name";
               
            }
            else if (Checks.Empty(email))
            {
                lblMsg.Text = "Please enter your email address";
            }
            else if (Checks.Empty(mobile))
            {
                lblMsg.Text = "Please enter your mobile number";
            }
            else if (!Checks.checkNumber(mobile))
            {
                lblMsg.Text = "Please enter numbers only";
            }
            else if (subject.Contains("-1"))
            {
                lblMsg.Text = "Please select an item from the list";
            }
            else
            {
                EnquiryInfo data = new EnquiryInfo();
                data.Email = email;
                data.Mobile = long.Parse(mobile);
                data.Message = msg;
                data.Name = name;
                data.Subject = subject;
                RealStarIceCreamEntities2 real = new RealStarIceCreamEntities2();
                real.EnquiryInfoes.Add(data);
                real.SaveChanges();
                txtUrcomments.Text = "";
                txtemail.Text = "";
                txtMobile.Text = "";
                txtName.Text = "";
                ddlSubject.SelectedIndex = int.Parse("-1");
                BindDdlSubjectCategory();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

}
