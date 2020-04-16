<%@ Page Title="Products" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="myContent" Runat="Server">
    <!-- custom css theme files -->
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all"/>
	
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all"/>
<!-- //custom css theme files -->
<link rel="stylesheet" href="css/lightbox.css"/>

  <!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					 <asp:button id="btnAllCategories" cssClass="cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" runat="server" text="All Products" OnClick="btnAllCategories_Click" />

                    <asp:repeater id="repCategories" runat="server" OnItemCommand="repCategories_ItemCommand">
                         <ItemTemplate>
                           <asp:Button id="btnCate" CommandName="vw" CommandArgument='<%# Eval("CategoryId") %>' cssClass="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" runat="server" Text='<%# Eval("CategoryName") %>' OnClick="btnCate_Click"></asp:Button> 
                         </ItemTemplate>
                    </asp:repeater>


				</div>

				
			</div>
            <!--gallery-->
	<div class="gallery">
		<div class="container py-md-4 mt-md-3">
			
			<div class="row gallery-info">
				<asp:Repeater ID="repProductsOfCategory" runat="server">
                 <ItemTemplate>
                    <div class="col-md-3 gallery-grids">
					<a href='ProductImages/<%# Eval("PhotoSize") %><%# Eval("PhotoName") %>' class="gallery-box" data-lightbox="example-set" data-title="">
						<img src='ProductImages/<%# Eval("PhotoSize") %><%# Eval("PhotoName") %>' alt='<%# Eval("ProductTitle") %>' class="img-fluid zoom-img">
                        
					</a>
			      &nbsp;<p  class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<%# Eval("ProductTitle") %>
								</p>

                    </div>
                 </ItemTemplate>
               </asp:Repeater>
				
			</div>
			<script src="js/lightbox-plus-jquery.min.js"></script>
		</div>
</div
			<!--//gallery-->
	<!-- Default-JavaScript-File -->
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- //Default-JavaScript-File -->

		<script src="js/jquery.fatNav.js"></script>
		<script>
		(function() {
			
			$.fatNav();
			
		}());
		</script>
		</div>
	</div>
</asp:Content>

