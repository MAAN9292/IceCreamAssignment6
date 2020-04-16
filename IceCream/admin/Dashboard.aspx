<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContent" Runat="Server">
     
          <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>Hello, <span>Welcome Here</span></h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item active"><a href="Dashboard.aspx">Dashboard</a></li>
                               
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
          <!-- /# row -->
     
     <section id="main-content">
          <div class="row">
                            <div class="col-lg-3">
                                <a href="AddSliderImages.aspx">
                                <div class="card">
                                    <div class="stat-widget-one">
                                        <div class="stat-icon dib"><i class="ti-image color-success border-success"></i></div>
                                        <div class="stat-content dib">
                                            <div class="stat-text">Total Banners</div>
                                            <div class="stat-digit">
                                                <asp:Label ID="lblSliderImgCount" runat="server" Text=""></asp:Label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    </a>
                            </div>
                            <div class="col-lg-3">
                                 <a href="AddCategories.aspx">
                                <div class="card">
                                    <div class="stat-widget-one">
                                        <div class="stat-icon dib"><i class="ti-folder color-primary border-primary"></i></div>
                                        <div class="stat-content dib">
                                            <div class="stat-text">Total Categories</div>
                                            <div class="stat-digit">
                                                <asp:Label ID="lblCategoryCount" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                     </a>
                            </div>
                            <div class="col-lg-3">
                                 <a href="AddProducts.aspx">
                                <div class="card">
                                    <div class="stat-widget-one">
                                        <div class="stat-icon dib"><i class="ti-package color-pink border-pink"></i></div>
                                        <div class="stat-content dib">
                                            <div class="stat-text">Total Products</div>
                                            <div class="stat-digit">
                                            <asp:Label ID="lblProductCount" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                     </a>
                            </div>
                            <div class="col-lg-3">
                                 <a href="Enquiry.aspx">
                                <div class="card">
                                    <div class="stat-widget-one">
                                        <div class="stat-icon dib"><i class="ti-write color-danger border-danger"></i></div>
                                        <div class="stat-content dib">
                                            <div class="stat-text">Total Enquiries</div>
                                            <div class="stat-digit">
                                                <asp:Label ID="lblEnquiryCount" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                     </a>
                            </div>
                        </div>
     </section>
     <!-- /# row -->
             <!-- /# row -->
            <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2019 © Icecreameparlour.com. </div>
            </div>

</asp:Content>

