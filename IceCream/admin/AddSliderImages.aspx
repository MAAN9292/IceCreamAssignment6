<%@ Page Title="Add slider images" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddSliderImages.aspx.cs" Inherits="admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContent" Runat="Server">
    
          <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                            
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                               <li class="breadcrumb-item active">Banners</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
          <!-- /# row -->
     
          <section id="main-content">
            <div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-title">
                    <h4>Add Banner</h4>
                        
                  </div>
                    <br />
                     <div class="card-body">
                                    <div class="basic-form">
                                        
                                            <div class="form-group">
                                                <label>Banners</label>
                                                <asp:FileUpload class="form-control" AllowMultiple="true" ID="fuFile" runat="server" />
                                           <label id="desc">*Banner Size: 1920 x 930 pixels</label>
                                                 </div>
                                           <div class="form-group">
                                            <asp:Button ID="btnUpload" class="btn btn-default" runat="server" Text="Add Banners" OnClick="btnUpload_Click" />
                                        </div>
                                               <div class="form-group">
                                            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                            </div>
                                    </div>
                                </div>
                </div>
                <!-- /# card -->
              </div>
              <!-- /# column -->
            </div>
            <!-- /# row -->
              <asp:panel id="imgPanel" runat="server">
              <div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-title">
                    <h4>Banners</h4>
                        
                  </div>
                     <div class="card-body">
                        
 <link rel="stylesheet" href="bootstrap-responsive.min.css" />
<link rel="stylesheet" href="matrix-style.css" />

                        
               
                <asp:Repeater ID="repSliderImages" runat="server" OnItemCommand="repSliderImages_ItemCommand">
                                    <HeaderTemplate>
                                       
                                         <asp:Button runat="server" id="btnDelAll" OnClientClick="return confirm('Are you sure you want delete all the images')" CommandName="delAll" class="btn btn-default btn-sm" Text="Delete All"></asp:Button>              
                                        
                                            <div class="widget-content">
                                        <ul class="thumbnails">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                  
                                   <li class="span2"> <img class="img-responsive img-thumbnail" width="175" height="100" src='../SliderImages/<%# Eval("PhotoSize") %><%# Eval("PhotoName") %>' alt='<%# Eval("PhotoName") %>'/>
                                  <div class="actions"> <asp:LinkButton ID="lnkdel" OnClientClick="return confirm('Are you sure you want delete');" CommandName="del" CommandArgument='<%# Eval("PhotoID") %>' runat="server"><i class="fa fa-trash"></i></asp:LinkButton> <a class="lightbox_trigger" href="img/gallery/imgbox3.jpg"></a> </div>
                                  </li>
                                       
                                     </ItemTemplate>
                                                    
                                   <FooterTemplate>
                                    </ul>
                             </div>
                                   </FooterTemplate>
                                   </asp:Repeater>
                              
                            <script src="jquery.min.js"></script> 
                            <script src="jquery.ui.custom.js"></script> 
                            <script src="bootstrap.min.js"></script> 
                            <script src="matrix.js"></script>
                         <div style="clear:both;">
                             <br style="clear:both;"/>
                                 
                                 

        </div>
                                          
          
                                  
                </div>
                <!-- /# card -->
              </div>
           </div>

                  </asp:panel>
              <!-- /# column -->
            
           
          </section>
      <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2019 © Icecreamparlour.com.</p> </div>
            </div>
       </div>
</asp:Content>

