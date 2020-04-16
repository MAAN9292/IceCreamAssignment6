using RealStarIceCream.App_Code.Operation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AddCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                BindRepCategories(); // method calling to bind category
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    //Bind all Category
    private void BindRepCategories()    
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        repCategories.DataSource = data.CategoryInfoes.ToList();
        repCategories.DataBind();
    }


    // Add new category
    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        try
        {
            string CategoryName = txtCategoryName.Text.Trim();
            
            if (Checks.Empty(CategoryName))
            {
                lblMsg.Text = "Please enter Category name";
            }
            else
            {
                // if category name already filled in textbox then update the name else add new category
                
                if (btnAddCategory.Text == "Update Category")   //Update Category.....
                {
                    int Id = int.Parse(hfCatId.Value);
                    CategoryInfo ci = new CategoryInfo();
                    ci.CategoryName = CategoryName;
                    ci.CategoryId = Id;
                    RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
                    var CategoryInfo = from c in data.CategoryInfoes where c.CategoryId == Id select c;
                    foreach (CategoryInfo c in CategoryInfo)
                    {
                        c.CategoryName = CategoryName;
                    }
                    data.SaveChanges();
                    BindRepCategories();
                    lblMsg.Text = "Category name has been updated";
                }
                else  
                {
                    //Add new category
                    CategoryInfo ci1 = new CategoryInfo();
                    ci1.CategoryName = CategoryName;
                    RealStarIceCreamEntities2 data1 = new RealStarIceCreamEntities2();
                    data1.CategoryInfoes.Add(ci1);
                    data1.SaveChanges();
                    BindRepCategories();
                    lblMsg.Text = "*New Category Added!!";
                    txtCategoryName.Text = "";
                }
            }
        }
        catch (Exception ex)
        {
            if (ex.Message.Contains("UNIQUE"))
            {
                lblMsg.Text = "This category name already exists";
            }
            else
            {
                lblMsg.Text = ex.Message;
            }
        }
    }

    protected void repCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("del"))  //delete Category
            {
                int CategoryId = int.Parse(e.CommandArgument.ToString());
                RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
                CategoryInfo cid = new CategoryInfo();
                cid = data.CategoryInfoes.Single(v => v.CategoryId == CategoryId);
                data.CategoryInfoes.Attach(cid);
                data.CategoryInfoes.Remove(cid);
                data.SaveChanges();
                BindRepCategories();
                lblMsg.Text = "*Category Deleted!!";

            }
            else if (e.CommandName.Equals("ed")) //Edit Category
            {
                int CategoryId = int.Parse(e.CommandArgument.ToString());
                RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
                var cid = from c in data.CategoryInfoes where c.CategoryId == CategoryId select c;
                foreach (CategoryInfo c in cid)
                {
                    txtCategoryName.Text = c.CategoryName;
                    hfCatId.Value = c.CategoryId.ToString();
                    txtCategoryName.Focus();
                }
                btnAddCategory.Text = "Update Category"; // set the button text on edit command
            }
            else if (e.CommandName.Equals("delall"))  //delete all category
            {
                RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();

                var cateIds = from ct in data.CategoryInfoes select ct.CategoryId;

                foreach (var ctx in cateIds)
                {
                    CategoryInfo ci = new CategoryInfo();

                    ci = data.CategoryInfoes.Single(c => c.CategoryId == ctx); // lamda expression
                    data.CategoryInfoes.Attach(ci);
                    data.CategoryInfoes.Remove(ci);


                }

                data.SaveChanges();
                BindRepCategories();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void repCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
}