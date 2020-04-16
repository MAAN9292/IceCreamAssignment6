using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                BindHomeSlider();//method calling to bind Banner images
                BindFeaturedProducts();//method calling to Bind products
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        
    }

    // Get Featured products on page load 
    private void BindFeaturedProducts()
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        var pro = from p in data.ProductInfoes select p;
        repFeaturedProducts.DataSource = pro.ToList();
        repFeaturedProducts.DataBind();
    }

    // Get all images for home slider / banner
    private void BindHomeSlider()
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        var ban = from b in data.ImageSliders select b;
        repHomeSlider.DataSource = ban.ToList();
        repHomeSlider.DataBind();
    }
}