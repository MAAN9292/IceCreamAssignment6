<%@ Page Title="Contact us" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="myContent" Runat="Server">
     <!-- Title page -->
	<section class="bg-img1 my txt-center p-lr-15 p-tb-92" style="background-image: url('images/contactbg.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Contact
		</h2>
	</section>

    <!-- Content page -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
					
						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Send Us A Message
						</h4>

						<div class="bor8 m-b-20 how-pos4-parent">
                            <asp:textbox class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="*Your Name" runat="server" id="txtName"></asp:textbox>
						
							<img class="how-pos4 pointer-none" src="images/icons/user-icon.png" alt="ICON">
						</div>
                        <div class="bor8 m-b-20 how-pos4-parent">
                            <asp:textbox class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="*Your Email Address" runat="server" id="txtemail"></asp:textbox>
						
							<img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON"/>
						</div>
                        <div class="bor8 m-b-20 how-pos4-parent">
                            <asp:textbox class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" placeholder="*Your Mobile Number" runat="server" id="txtMobile"></asp:textbox>
						
							<img class="how-pos4 pointer-none" src="images/icons/goods_tab_phone.png" alt="ICON"/>
						</div>
                        <div class="bor8 m-b-20 how-pos4-parent">
                            <asp:dropdownlist id="ddlSubject" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" OnDataBound="ddlSubject_DataBound" runat="server">
                                
                            </asp:dropdownlist>
						
							<img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
						</div>

						<div class="bor8 m-b-30">
                            <asp:TextBox ID="txtUrcomments" TextMode="MultiLine" class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="msg" placeholder="*How Can We Help ?" runat="server"></asp:TextBox>
							
						</div>                        
                    <asp:Button ID="btnSubmit" class="flex-c-m stext-101 cl0 size-121 bg2 bor1 hov-btn1 p-lr-15 trans-04 " runat="server" Text="Submit" OnClick="btnSubmit_Click" />
					<br />	
                     <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
				</div>
               

				<div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md">
					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-map-marker"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Address
							</span>

							<p class="stext-115 cl6 size-213 p-t-18">
								Auckland, New Zealand
							</p>
						</div>
					</div>

					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-phone-handset"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Lets Talk
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								  +64-XXXX-XXXXX <br />
                                  +64-XXXX-XXXXX

							</p>
						</div>
					</div>

					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-envelope"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Sale Support
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								 Icecreameparlour@gmail.com
							</p>
						</div>

					</div>
                    <div class="flex-w w-full">
                         <span class="fs-18 cl5 txt-center size-211">
							
						</span>
                        <div class="size-212 p-t-2">
							<h3 class="mtext-111 cl2">
								Social
							</h3>

							<div class="stext-115 cl1 size-213 p-t-18">
								
                           <a href="#"><span class="fa fa-facebook-square"></span> </a>
                            <a href="About.aspx"><span class="fa fa-instagram"></span></a>
                            <a href="#"><span class="fa fa-google-plus"></span></a>
                            <a href="#"><span class="fa fa-youtube"></span></a>
                            <a href="#"><span class="fa fa-pinterest-p"></span></a>
                       
							</div>
						</div>
                    </div>
				</div>

					</div>



				</div>

		
	</section>	
	
	
	<!-- Map -->
	<div class="map">
        <iframe class="size-303" id="google_map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d408598.85460965784!2d174.585280398196!3d-36.862144781710086!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6d0d47fb5a9ce6fb%3A0x500ef6143a29917!2sAuckland%2C%20New%20Zealand!5e0!3m2!1sen!2sin!4v1574341692050!5m2!1sen!2sin" width="100%" height="390" frameborder="0" style="border:0" allowfullscreen></iframe>
            
	</div>
        

</asp:Content>

