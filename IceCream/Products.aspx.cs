using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                //Method calling to get all Ice-cream categories on page to filter products
                BindRepCategories();

                //Method calling to get all Products on page load
                BindRepAllProducts();
            }
            //active link of categories
            for (int i = 0; i < repCategories.Items.Count; i++)
            {
                Button btn = repCategories.Items[i].FindControl("btnCate") as Button;
                btn.CssClass = "stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5";
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //Get All Ice-cream Categories on page to filter products
    private void BindRepCategories()
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        var cate = from c in data.CategoryInfoes select c;
        repCategories.DataSource = cate.ToList();
        repCategories.DataBind();
    }

    protected void repCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("vw"))
            {
                //bind product category wise
                int Id = int.Parse(e.CommandArgument.ToString());
                RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
                var pro = from p in data.ProductInfoes join c in data.CategoryInfoes on p.CategoryId equals c.CategoryId where p.CategoryId == Id select new { p.ProductId, p.ProductTitle, p.PhotoType, p.PhotoSize, p.PhotoName, p.ExtName, c.CategoryName };
                repProductsOfCategory.DataSource = pro.ToList();
                repProductsOfCategory.DataBind();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    /// <summary>
    /// Method calling to get "All Products" on button click
    /// </summary>
    protected void btnAllCategories_Click(object sender, EventArgs e)
    {
        try
        {   
            BindRepAllProducts();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //Get all Products on page load
    private void BindRepAllProducts()
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        var pro = from p in data.ProductInfoes select p;
        repProductsOfCategory.DataSource = pro.ToList();
        repProductsOfCategory.DataBind();
    }
    protected void btnCate_Click(object sender, EventArgs e)
    {
        //active link button "All Products"
        if (sender is Button)
        {
            Button btn = sender as Button;

            btnAllCategories.CssClass = "cl6 hov1 bor3 trans-04 m-r-32 m-tb-5";

            btn.CssClass = "stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1";

        }
    }
}