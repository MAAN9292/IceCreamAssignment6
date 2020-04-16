<%@ Page Title="Home" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="myContent" Runat="Server">
    
	<link rel="stylesheet" href="css/owl.carousel.min.css"/>
   <link rel="stylesheet" href="css/owl.theme.default.css"/>

<script src="js/owl.carousel.min.js"></script>
	<style>
		.abc div
		{
			
		}
	</style>
	<!-- Slider -->
	

                <asp:Repeater ID="repHomeSlider" runat="server">
                    <HeaderTemplate>
                       <div id="demo1" >
                    </HeaderTemplate>
                  <ItemTemplate>
                       <div class="slide">
                   <img  src='SliderImages/<%# Eval("PhotoSize") %><%# Eval("PhotoName") %>' alt='<%# Eval("PhotoName") %>' />
                           </div>
                    </ItemTemplate>
                    <FooterTemplate>
            
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
			


        <div class="container ccHome">
			<div class="row p-b-100">
                <div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							Our Story
						</h3>

						<p class="stext-113 cl6 p-b-26 myFs">
							Ice Creame Parlour was the first organization to bring up the idea of in house production of ice cream in auckland New Zealand in 2007. Since Inception, our constant emphasis on quality consciousness and innovating with new flavors has delighted the taste buds of many customers. Our presence in world has been adding wholesome goodness to the lives of thousands since decade. 
Since its launch in 2007, we are growing as a manufacturer as well as a supplier. We are equipped with all sort of modern and high – tech machineries to ensure a high standard production. <a href="About.aspx">read more...</a>

						</p>

					</div>
				</div>
                <div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							<img src="images/abtHome.jpg" alt="IMG"/>
						</div>
					</div>
				</div>
                
            </div>
            <div style="text-align:center">
           <p class="gfs">Enjoy Our Heart's Connecting Taste</p>
            <div style="margin:auto;background-color:red;width:90px;height:4px;"></div>
                </div>
            <br />
          
            <div class="row">
              
                  
              
                <asp:Repeater ID="repFeaturedProducts" runat="server">
                    <HeaderTemplate>
                         <div class="owl-carousel abc">
                    </HeaderTemplate>
                    <ItemTemplate>
                    
						<img class="mYwidth" src='ProductImages/<%# Eval("PhotoSize") %><%# Eval("PhotoName") %>' alt='<%# Eval("ProductTitle") %>'>

                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
				<script>
	$(document).ready(function(){
  $(".owl-carousel").owlCarousel();
		
});
	</script>
	<script>
	var owl = $('.owl-carousel');
owl.owlCarousel({
    items:4,
    loop:true,
    margin:10,
    autoplay:true,
    autoplayTimeout:1000,
    autoplayHoverPause:true
});
$('.play').on('click',function(){
    owl.trigger('play.owl.autoplay',[1000])
})
$('.stop').on('click',function(){
    owl.trigger('stop.owl.autoplay')
})
	</script>
		
            <!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45 p-b-140">
				<a href="Products.aspx" class="flex-c-m stext-101 cl0 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					View More
				</a>
			</div>
        </div>
            </div>
  
    <br />
    <br />
            <div class="container-fluid" style="background-color:#ED1C24;">
                <br />
             <div style="text-align:center;font-size:25px;font-family:cursive">
           <p style="color:white">OUR ACHIEVEMENTS</p>
            <div style="margin:auto;background-color:black;width:90px;height:4px;"></div>
                </div>
            <br />
        <div class="row">
             
            <div class="wrapper">
    <div class="counter col_fourth">
      <i class="fa fa-users fa-2x"></i>
      <h2 class="timer count-title count-number" data-to="2007" data-speed="1500">2007</h2>
       <p class="count-text ">SINCE</p>
    </div>

    <div class="counter col_fourth">
      <i class="fa fa-product-hunt fa-2x"></i>
      <h2 class="timer count-title count-number" data-to="170" data-speed="1500">170</h2>
      <p class="count-text ">PRODUCTS</p>
    </div>

    <div class="counter col_fourth">
      <i class="fa fa-user fa-2x"></i>
      <h2 class="timer count-title count-number" data-to="119" data-speed="1500">119</h2>
      <p class="count-text ">DEALERS</p>
    </div>

    <div class="counter col_fourth end">
      <i class="fa fa-user fa-2x"></i>
      <h2 class="timer count-title count-number" data-to="157" data-speed="1500">157</h2>
      <p class="count-text ">DISTRIBUTORS</p>
    </div>
</div>
        </div>
                </div>


	
</asp:Content>

