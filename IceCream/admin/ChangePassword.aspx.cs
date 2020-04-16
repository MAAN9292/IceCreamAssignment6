using RealStarIceCream.App_Code.Operation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //change password for admin login
            string OldPswd, NewPswd, ConfirmPswd;
            OldPswd = txtOldPswd.Text.Trim();
            NewPswd = txtNewPswd.Text.Trim();
            ConfirmPswd = txtCpswd.Text.Trim();
            string userid = Session["userid"].ToString();

            if (Checks.Empty(OldPswd) && Checks.Empty(NewPswd) && Checks.Empty(ConfirmPswd))
            {
                lblMsg.Text = "All fields required!";
            }
            else if (Checks.Empty(OldPswd))
            {
                lblMsg.Text = "Old password is required!";
            }
            else if (Checks.Empty(NewPswd))
            {
                lblMsg.Text = "New password is required!";
            }
            else if (Checks.Empty(ConfirmPswd))
            {
                lblMsg.Text = "Confirm-password is required!";
            }
            else
            {
                int user = int.Parse(Session["UserID"].ToString());
                RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
                loginInfo li = new loginInfo();
                li = (from l in data.loginInfoes where l.LoginInfoId == user where l.Password == OldPswd select l).FirstOrDefault(); //Linq query
                if (li != null)
                {
                    var image = from l in data.loginInfoes
                                where l.LoginInfoId == user
                                select l;
                    foreach (loginInfo li1 in image)
                    {
                        li1.Password = NewPswd;
                        lblMsg.Text = "!Password Changed Successfully";
                    }

                }
                else if (li == null)
                {
                    lblMsg.Text = "!Old Password Incorrect";
                }
                data.SaveChanges();


            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}