
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

public partial class admin_Home : System.Web.UI.Page
{
    private int PageSize = 12;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetSliderImages();//method calling to Bind images for slider
            
        }

    }

    // Get the images to view below for slider
    private void GetSliderImages()
    {
        RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
        if (data != null)
        {
            imgPanel.Visible = true;
            repSliderImages.DataSource = data.ImageSliders.ToList();
            repSliderImages.DataBind();
        }
        else
        {
            imgPanel.Visible = false; ;
        }

    }

    //Add New Banner / slider image
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            if (fuFile.HasFiles) 
            {
                foreach (HttpPostedFile file in fuFile.PostedFiles)
                {
                    ImageSlider data = new ImageSlider();
                    data.PhotoName = file.FileName;
                    data.ExtName = file.FileName.Substring(file.FileName.LastIndexOf('.'));
                    data.PhotoSize = file.ContentLength;
                    data.PhotoType = file.ContentType;

                    // only .jpeg or .png files allowed to upload
                    if (file.ContentType == "image/jpeg" || file.ContentType == "image/png")
                    {

                        RealStarIceCreamEntities2 data1 = new RealStarIceCreamEntities2();
                        data1.ImageSliders.Add(data);
                        int ans = data1.SaveChanges();
                        string path;
                        if (ans > 0)
                        {
                            //save image on the specified path
                            path = Server.MapPath("~/SliderImages/" + file.ContentLength + file.FileName);
                            file.SaveAs(path);
                            GetSliderImages();
                            imgPanel.Visible = true;
                        }

                        lblMsg.Text = "*Banner Uploaded successfully!!";

                    }
                    else
                    {
                        lblMsg.Text = "Please choose a .JPEG or .PNG file only";
                    }
                }
            }

            else
            {
                lblMsg.Text = " Please select an image to upload ";
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }

    protected void repSliderImages_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("del"))   //delete Banner images
        {
            string path;
            int BannerID = int.Parse(e.CommandArgument.ToString());
            RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();
            ImageSlider Img = new ImageSlider();
            Img = data.ImageSliders.Single(c => c.PhotoId == BannerID); // lamda expression
            if (Img != null)
            {
                data.ImageSliders.Attach(Img);
                data.ImageSliders.Remove(Img);
                data.SaveChanges();
                path = Server.MapPath("~/SliderImages/" + Img.PhotoName);
                if (File.Exists(path))
                {
                    File.Delete(path); // delete the image path
                   
                    lblMsg.Text = "*Banner Deleted!!";
                }
                GetSliderImages();
            }
        }
        else if (e.CommandName.Equals("delAll")) ///delete all banner images
        {
            RealStarIceCreamEntities2 data = new RealStarIceCreamEntities2();

            var BannerId = from b in data.ImageSliders select b.PhotoId;

            string path;
            foreach (var bid in BannerId)
            {
                ImageSlider bt = new ImageSlider();
                bt = data.ImageSliders.Single(c => c.PhotoId == bid); // lamda expression


                path = Server.MapPath("~/SliderImages/" + bt.PhotoName);
                if (File.Exists(path))
                {
                    File.Delete(path);

                }

                data.ImageSliders.Attach(bt);
                data.ImageSliders.Remove(bt);


            }

            data.SaveChanges();
            GetSliderImages();
            imgPanel.Visible = false;

        }
    }

}