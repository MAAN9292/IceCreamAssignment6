using RealStarIceCream.App_Code.Operation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    ///  //Login admin panel
    ///  //Enter username and password to login
    /// </summary>

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
           
            string userName, pswd;
            userName = txtUserName.Text.Trim();
            pswd = txtPswd.Text.Trim();

            if (Checks.Empty(userName) && Checks.Empty(pswd))
            {
                lblMsg.Text = "User name and password are required!";
            }
            else if (Checks.Empty(userName))
            {
                lblMsg.Text = "User name is required!";
            }
            else if (Checks.Empty(pswd))
            {
                lblMsg.Text = "Password is required!";
            }
            else
            {
                RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
                loginInfo li = new loginInfo();

                // linq query
                li = (from log in data.loginInfoes
                      where log.UserName == userName & log.Password == pswd
                      select log).First();
                if (li != null)
                {
                    // create session for the user
                    Session["Username"] = userName;
                    Session["UserID"] = li.LoginInfoId;
                    Response.Redirect("admin/Dashboard.aspx");
                }
                else
                {
                    lblMsg.Text = "*Invalid Username Or Password!!";
                }

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

   
}