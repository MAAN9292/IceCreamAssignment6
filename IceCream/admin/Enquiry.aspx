<%@ Page Title="Enquiry" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Enquiry.aspx.cs" Inherits="admin_enquiry" %>

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
                               <li class="breadcrumb-item active">Enquiries</li>
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
                        <h4>Enquiry</h4>
                        
                    </div>
                    <div class="card-body table-responsive">
                        
                        <br />
                      <asp:Repeater ID="repEnquiry" runat="server" OnItemCommand="repEnquiry_ItemCommand">
                          <HeaderTemplate>
                             <table class="table table-hover table-condensed table-sm">
                              <thead class="thead-dark">
                                <tr>
                                  <th scope="col">SrNo</th>
                                  <th scope="col">Name</th>
                                  <th scope="col">Email</th>
                                  <th scope="col">Mobile</th>
                                  <th scope="col">Subject</th>
                                  <th scope="col">Message</th>
                                  <th scope="col" class="text-left">Date</th>
                                    <th scope="col" class="text-left"></th>
                                </tr>
                              </thead>
                              <tbody>
                          </HeaderTemplate>
                          <ItemTemplate>
                             <tr>
                              <td><%# Eval("EnquiryID") %></td>
                              <td><%# Eval("Name") %></td>
                              <td><%# Eval("Email") %></td>
                              <td><%# Eval("Mobile") %></td>
                              <td><%# Eval("Subject") %></td>
                              <td><%# Eval("Message") %></td>
                              <td class="text-left"><%# Eval("EnquiryDate") %></td>
                                 <td class="text-left"><asp:Button ID="btnDelete" OnClientClick="return confirm('Are you sure to delete this Enquiry?')" CommandName="del" CommandArgument='<%# Eval("EnquiryId") %>' runat="server" CssClass="btn btn-default btn-sm" Text="Delete"></asp:Button></td>
                            </tr>
                          </ItemTemplate>
                          <FooterTemplate>
                               </tbody>
                              </table>
                          </FooterTemplate>
                        </asp:Repeater>
                        <br />
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        </section>
       <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2019 © Icecreameparlour.com. </div>
            </div>
</asp:Content>

