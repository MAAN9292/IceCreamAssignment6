
using RealStarIceCream.App_Code.Operation;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AddProducts : System.Web.UI.Page
{
    private int PageSize = 3;
    
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (!IsPostBack)
            {
                BindDdlCategory(); ////method calling to bind category

                BindddlAllCategories(); //method calling to bind category in View

                BindGridAllProducts(); // method calling to bind products in grid view


                this.GetProductsPageWise(1); // call paging for products on page load 
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
       
        
    }

    //Bind all the categories to select
    private void BindDdlCategory()
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        ddlCategory.DataSource = data.CategoryInfoes.ToList();
        ddlCategory.DataTextField = "CategoryName";
        ddlCategory.DataValueField = "CategoryID";
        ddlCategory.DataBind();
    }

    // Add products for the selected category
    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        try
        {
            string ProductTitle = txtProductTitle.Text.Trim();
            string CategoryId = ddlCategory.SelectedValue;
            if (CategoryId.Contains("-1"))
            {
                lblMsg.Text = "Please select a category";
            }
            else if (!Checks.checkNumber(CategoryId))
            {
                lblMsg.Text = "Category id must be a number";
            }
            else if (Checks.Empty(ProductTitle))
            {
                lblMsg.Text = "Please enter product title";
            }
            else if (fuFile.HasFile)  //add new product
            {
                ProductInfo data = new ProductInfo();
                data.CategoryId = int.Parse(CategoryId);
                data.ProductTitle = ProductTitle;
                data.PhotoName = fuFile.PostedFile.FileName;
                data.ExtName = fuFile.PostedFile.FileName.Substring(fuFile.PostedFile.FileName.LastIndexOf('.'));
                data.PhotoSize = fuFile.PostedFile.ContentLength;
                data.PhotoType = fuFile.PostedFile.ContentType;
                if (fuFile.PostedFile.ContentType == "image/jpeg" || fuFile.PostedFile.ContentType == "image/png")
                {
                    RealStarIceCreamEntities2 apData = new RealStarIceCreamEntities2();
                    apData.ProductInfoes.Add(data);
                    apData.SaveChanges();
                    string path1 = Server.MapPath("../ProductImages/" + fuFile.PostedFile.ContentLength + fuFile.PostedFile.FileName);
                    fuFile.PostedFile.SaveAs(path1); // save product image on the specififed path
                    txtProductTitle.Text = "";
                    lblMsg.Text = "Product Saved!";
                    pnlProducts.Visible = true;
                    BindddlAllCategories();
                    BindGridAllProducts();
                }
                else
                {
                    lblMsg.Text = "Please choose a .JPEG or .PNG image only";
                }
            }
            else
            {
                lblMsg.Text = "Please choose a product image";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    //Bind all the categories in preview
    private void BindddlAllCategories()
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        ddlAllCategory.DataSource = data.CategoryInfoes.ToList();
        ddlAllCategory.DataTextField = "CategoryName";
        ddlAllCategory.DataValueField = "CategoryID";
        ddlAllCategory.DataBind();
    }

    protected void ddlCategory_DataBound(object sender, EventArgs e)
    {
        ddlCategory.Items.Insert(0, new ListItem("-- Please Select --", "-1"));
        
    }
    protected void ddlAllCategory_DataBound(object sender, EventArgs e)
    {
        ddlAllCategory.Items.Insert(0, new ListItem("All", "-1"));
    }

    // View Products according to selected Category
    protected void btnView_Click(object sender, EventArgs e)
    {
        try
        {
            int CategoryId = int.Parse(ddlAllCategory.SelectedValue);
            if (CategoryId == -1)
            {
                BindGridAllProducts();
            }
            else
            {
                BindGridProductsCategoryWise(CategoryId);

                //method calling for paging the products came according to category
                GetProductsPageWiseForSelectedCategory(1, CategoryId);
                hfCategoryIdForPaging.Value = CategoryId.ToString();

            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    private void BindGridProductsCategoryWise(int CategoryId) //bind product category wise.
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        var pro = from p in data.ProductInfoes join c in data.CategoryInfoes on p.CategoryId equals c.CategoryId where p.CategoryId == CategoryId select new { p.ProductId, p.ProductTitle, p.PhotoType, p.PhotoSize, p.PhotoName, p.ExtName, c.CategoryName };
        gvProducts.DataSource = pro.ToList();
        gvProducts.DataBind();
    }

    //bind all products on page load
    private void BindGridAllProducts() 
    {
        try
        {
            RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
            if (data == null)
            {
                pnlProducts.Visible = false;
            }
            else
            {
                pnlProducts.Visible = true;
                var pro = from p in data.ProductInfoes join c in data.CategoryInfoes on p.CategoryId equals c.CategoryId select new { p.ProductId, p.ProductTitle, p.PhotoType, p.PhotoSize, p.PhotoName, p.ExtName, c.CategoryId ,c.CategoryName };
                gvProducts.DataSource = pro.ToList();
                gvProducts.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    //-------------------------------Repeater Paging---------------------

    private void GetProductsPageWise(int pageIndex)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("GetProductsPageWise", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    con.Open();
                    IDataReader idr = cmd.ExecuteReader();
                    gvProducts.DataSource = idr;
                    gvProducts.DataBind();
                    idr.Close();
                    con.Close();
                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    this.PopulatePager(recordCount, pageIndex);
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }


    private void GetProductsPageWiseForSelectedCategory(int pageIndex, int categoryid)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("GetProductsPageWiseForSelectedCategory", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                    cmd.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                    cmd.Parameters.AddWithValue("@CategoryId", categoryid);
                    con.Open();
                    IDataReader idr = cmd.ExecuteReader();
                    gvProducts.DataSource = idr;
                    gvProducts.DataBind();
                    idr.Close();
                    con.Close();
                    int recordCount = Convert.ToInt32(cmd.Parameters["@RecordCount"].Value);
                    this.PopulatePager(recordCount, pageIndex);
                }
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    // Create pager for products
    private void PopulatePager(int recordCount, int currentPage)
    {
        try {

            double dblPageCount = (double)((decimal)recordCount / (decimal)PageSize);
            int pageCount = (int)Math.Ceiling(dblPageCount);
            List<ListItem> pages = new List<ListItem>();
            if (pageCount > 0)
            {
                pages.Add(new ListItem("First", "1", currentPage > 1));
                if (currentPage != 1)
                {
                    pages.Add(new ListItem("Previous", (currentPage - 1).ToString()));
                }
                if (pageCount < 4)
                {
                    for (int i = 1; i <= pageCount; i++)
                    {
                        pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                    }
                }
                else if (currentPage < 4)
                {
                    for (int i = 1; i <= 4; i++)
                    {
                        pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                    }
                    pages.Add(new ListItem("...", (currentPage).ToString(), false));
                }
                else if (currentPage > pageCount - 4)
                {
                    pages.Add(new ListItem("...", (currentPage).ToString(), false));
                    for (int i = currentPage - 1; i <= pageCount; i++)
                    {
                        pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                    }
                }
                else
                {
                    pages.Add(new ListItem("...", (currentPage).ToString(), false));
                    for (int i = currentPage - 2; i <= currentPage + 2; i++)
                    {
                        pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
                    }
                    pages.Add(new ListItem("...", (currentPage).ToString(), false));
                }
                if (currentPage != pageCount)
                {
                    pages.Add(new ListItem("Next", (currentPage + 1).ToString()));
                }
                pages.Add(new ListItem("Last", pageCount.ToString(), currentPage < pageCount));
            }
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void Page_Changed(object sender, EventArgs e)
    {
        try
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            if (hfCategoryIdForPaging.Value != null)
            {
                int cateID = int.Parse(hfCategoryIdForPaging.Value);
                GetProductsPageWiseForSelectedCategory(pageIndex, cateID);
            }
            else
            {
                this.GetProductsPageWise(pageIndex);
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
    //-------------------------------Repeater Paging END-------------------


    //Delete the selected product
    protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //delete products
        int Id = int.Parse(gvProducts.DataKeys[e.RowIndex].Value.ToString());
        string path;
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();

        ProductInfo bt = new ProductInfo();
        bt = data.ProductInfoes.Single(c => c.ProductId == Id); // lambda expression
        data.ProductInfoes.Attach(bt);
        data.ProductInfoes.Remove(bt);
        data.SaveChanges();
        path = Server.MapPath("../ProductImages/" + bt.PhotoSize + bt.PhotoName);
        if (File.Exists(path))
        {
            File.Delete(path); // delete the product image as well

            lblMsg.Text = "*Image Deleted!!";
        }
        BindGridAllProducts();
        

    }

   
}