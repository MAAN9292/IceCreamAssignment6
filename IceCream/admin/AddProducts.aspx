<%@ Page Title="Add products" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="admin_AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContent" Runat="Server">
    
   <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                             <%--   <h1>Hello, <span>Welcome Here</span></h1>--%>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-l-0 title-margin-left">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                               <li class="breadcrumb-item active">Products</li>
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
                    <h4>Add Products</h4>

                </div>
                <br />
                <div class="card-body">
                    <div class="basic-form">
                        <div class="form-group">
                            <label>Product Category</label>
                            <asp:DropDownList ID="ddlCategory" ValidationGroup="vg1" cssClass="form-control" runat="server" OnDataBound="ddlCategory_DataBound"></asp:DropDownList>
                            <asp:RequiredFieldValidator ValidationGroup="vg1" ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="ddlCategory" ErrorMessage="Please select a category" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Product Title</label>
                            <asp:TextBox ID="txtProductTitle" ValidationGroup="vg1" cssClass="form-control" placeholder="Product title" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="vg1" ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtProductTitle" ErrorMessage="Please enter product title" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Product Image</label>
                            <asp:FileUpload cssClass="form-control" AllowMultiple="true" ID="fuFile" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ValidationGroup="vg1" ForeColor="Red" ControlToValidate="fuFile" ErrorMessage="Please choose a product image"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnAddProduct" runat="server" cssClass="btn btn-default" Text="Add Product" ValidationGroup="vg1" OnClick="btnAddProduct_Click" />

                        <br />
                        <br />
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <asp:panel id="pnlProducts" runat="server">
              <div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-title">
                    <h4>Products</h4>
                        
                  </div>
                     <div class="card-body">
                        
                <link rel="stylesheet" href="bootstrap-responsive.min.css" />
                <link rel="stylesheet" href="matrix-style.css" />


                
                 <div class="inbox-head">
                            <div class="input-text">Select Category</div>
                            <div class="pull-left position">
                              <div class="input-append inner-append">
                                <asp:DropDownList  id="ddlAllCategory" cssClass="form-control cls " runat="server" OnDataBound="ddlAllCategory_DataBound"></asp:DropDownList>
                                
                              <asp:Button runat="server" id="btnView" cssClass="btn btn-default" Text="View Products" OnClick="btnView_Click"></asp:Button>
                             <%-- <asp:Button runat="server" id="btnDelAllCatProd" ToolTip="Delete products accoring to category" cssClass="btn btn-default" OnClientClick="return confirm('Are you sure to delete?')" Text="Delete Products" OnClick="btnDelAllCatProd_Click"></asp:Button>
                             --%><asp:HiddenField id="hfCategoryIdForPaging" runat="server"></asp:HiddenField>
                                   </div>
                            </div>
                          </div>
                          <script src="jquery.min.js"></script> 
                            <script src="jquery.ui.custom.js"></script> 
                            <script src="bootstrap.min.js"></script> 
                            <script src="matrix.js"></script>

            
            <asp:GridView DataKeyNames="ProductId" id="gvProducts" cssClass="table table-hover myTable" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDeleting="gvProducts_RowDeleting">
                
                <Columns>
                    <asp:TemplateField HeaderText="Sr. No.">
                       
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Name">
                        
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("productTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Product Category">
                       
                        <ItemTemplate>
                            <asp:Label ID="lblCategoryName" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Image">
                    <ItemTemplate>
                        <img src='../ProductImages/<%# Eval("PhotoSize") %><%# Eval("PhotoName") %>' id="imgProducts" alt='<%# Eval("ProductTitle") %>' width="100" height="150" /> 
                    
                    </ItemTemplate>
                       
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                    <ItemTemplate>
                    <asp:Button runat="server" CssClass="btn btn-default btn-block"  OnClientClick="return confirm('Are you sure to delete this Product?')" id="btnDel" CommandArgument='<%# Eval("ProductId") %>' CommandName="Delete" Text="Delete"></asp:Button>
                    </ItemTemplate>
                       
                    </asp:TemplateField>
                   
                </Columns>
                 <EmptyDataTemplate>
                <h3>No Products to show in this category</h3>
            </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
              
                         <div style="clear:both;">
                             <br style="clear:both;"/>
                                  <asp:Repeater ID="rptPager" runat="server">
   <ItemTemplate>
     <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
      CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
      OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
   </ItemTemplate>

 </asp:Repeater> 
                                 

        </div>
                        
       </div>
  <!-- /# card -->
       </div>
           </div>

                  </asp:panel>
              <!-- /# column -->
            
            <!-- /# row -->
        </section>
     <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2019 © Icecrreameparlour.com. </div>
            </div>
</asp:Content>

