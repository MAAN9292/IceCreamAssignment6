<%@ Page Title="Add categories" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddCategories.aspx.cs" Inherits="admin_AddCategories" %>

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
                               <li class="breadcrumb-item active">Categories</li>
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
                        <h4>Add Categories</h4>

                    </div>
                    <br />
                    <div class="card-body">
                        <div class="basic-form">
                            <div class="form-group">
                                <label>Category</label>
                                <asp:TextBox ValidationGroup="vg1" ID="txtCategoryName" cssClass="form-control" placeholder="Category name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="vg1" ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtCategoryName" ErrorMessage="Please enter category name" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:HiddenField ID="hfCatId" runat="server" />
                                 </div>


                            <asp:Button ID="btnAddCategory" ValidationGroup="vg1" runat="server" cssClass="btn btn-default " Text="Add Category" OnClick="btnAddCategory_Click" />

                            <br />
                            <br />
                            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--ROW 1 END here--%>

        <%--ROW 2 begin--%>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-title">
                        <h4>Categories </h4>

                    </div>
                    <div class="card-body table-responsive">

                        <br />
                        <asp:Repeater ID="repCategories" runat="server" OnItemCommand="repCategories_ItemCommand" OnItemDataBound="repCategories_ItemDataBound">
                            <HeaderTemplate>
                                <table class="table table-hover table-condensed table-sm">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Sr. No.</th>
                                            <th scope="col">Category Name</th>
                                            <th scope="col" class="text-left"></th>
                                            <th scope="col" class="text-left"><asp:Button ID="btnDelete" OnClientClick="return confirm('Are you sure to delete this category?')" CommandName="delall" CommandArgument='<%# Eval("CategoryId") %>' runat="server" CssClass="btn btn-default btn-block" Text="Delete All"></asp:Button></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("CategoryId") %>
                                        <asp:HiddenField ID="hfCategoryID" Value='<%# Eval("CategoryId") %>' runat="server" />
                                    </td>
                                    <td><asp:Label runat="server" ID="CatNm" Text='<%# Eval("CategoryName") %>'></asp:Label></td>
                                    <td class="text-left">
                                        <asp:Button ID="btnEdit" runat="server" CommandName="ed" CommandArgument='<%# Eval("CategoryId") %>' CssClass="btn btn-default btn-block" Text="Edit"></asp:Button></td>
                                    <td class="text-left">
                                        <asp:Button ID="btnDelete" OnClientClick="return confirm('Are you sure to delete this category?')" CommandName="del" CommandArgument='<%# Eval("CategoryId") %>' runat="server" CssClass="btn btn-default btn-block" Text="Delete"></asp:Button></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                              </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <%--ROW 2 END here--%>

      </section>
     <!-- /# row -->
             <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2019 © icecreamparlour.com. </p>
                </div>
            </div>
                </div>
</asp:Content>

