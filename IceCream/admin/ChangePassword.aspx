<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="admin_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminContent" Runat="Server">
    <section id="main-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-title">
                        <h4>Change Password</h4>

                    </div>
                    <br />
                    <div class="card-body">
                        <div class="basic-form">
                            <div class="form-group">
                                <label>Old Password</label>
                                <asp:TextBox ValidationGroup="vg1" ID="txtOldPswd" cssClass="form-control" placeholder="Old password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="vg1" ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtOldPswd" ErrorMessage="Please enter old password" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                             <div class="form-group">
                                <label>New Password</label>
                                <asp:TextBox ValidationGroup="vg1" ID="txtNewPswd" cssClass="form-control" placeholder="New Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="vg1" ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtNewPswd" ErrorMessage="Please enter new password" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>
                             <div class="form-group">
                                <label>Confirm-Password</label>
                                <asp:TextBox ValidationGroup="vg1" ID="txtCpswd" cssClass="form-control" placeholder="Confirm-password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="vg1" ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtCpswd" ErrorMessage="Please confirm your password" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div>

                            <asp:Button ID="btnsubmit" ValidationGroup="vg1" runat="server" cssClass="btn btn-default" Text="Submit" OnClick="btnsubmit_Click" />
                            <asp:Button ID="btnHome" runat="server" cssClass="btn btn-info" Text="Back Home" OnClick="btnHome_Click" />
                            <br />
                            <br />
                            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
     <!-- /# row -->
            <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2019 © Icecreameparlour. </div>
            </div>
</asp:Content>

