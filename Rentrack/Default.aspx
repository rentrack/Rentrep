<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="propertylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--Owl Carousel-->
    <link rel="stylesheet" href="OwlCarousel2-2.3.4\docs\assets\owlcarousel\assets\owl.carousel.min.css"/>
    <script src="OwlCarousel2-2.3.4/docs/assets/owlcarousel/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="OwlCarousel2-2.3.4\docs\assets\owlcarousel\assets\owl.theme.default.min.css"/>
    
    <!--Font Awesome-->
    <link rel="stylesheet" href="Content/font-awesome.min.css"/>

    <title>Rentrack</title>

    <script>
        $(document).ready(function () {
            $("#buybutton").css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
            $("#buynewprops").show();
            $("#rentfeaturedprops").hide();

            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                responsiveClass: true,
                navText: [
                    '<i class="left-arrow fa fa-angle-left" aria-hidden="true"></i>',
                    '<i class="right-arrow fa fa-angle-right" aria-hidden="true"></i>'
                ],
                dots: true,
                responsive: {
                    0: {
                        items: 1,
                        nav: true
                    },
                    600: {
                        items: 2,
                        nav: true
                    },
                    1000: {
                        items: 3,
                        nav: true,
                        loop: false
                    }
                }
            })
        });

        function showRentOptions() {
            $("#rentbutton").css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
            $("#buybutton").css({ "color": "#b2b2b2", "border-bottom": "3px solid #b2b2b2" });
            $("#buybutton").hover(function () {
                $(this).css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
                /*},function () {
                    $(this).css({ "color": "#b2b2b2", "border-bottom": "3px solid #b2b2b2" });*/
            });
            $("#buynewprops").hide();
            $("#rentfeaturedprops").show();
        }
        function showBuyOptions() {
            $("#buybutton").css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
            $("#rentbutton").css({ "color": "#b2b2b2", "border-bottom": "3px solid #b2b2b2" });
            $("#rentbutton").hover(function () {
                $(this).css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
            });
            $("#buynewprops").show();
            $("#rentfeaturedprops").hide();

        }


    </script>

    <style>
        /*filters*/
        #bigdiv {
            display: flexbox;
            flex-direction: column;
            padding: 0px;
            margin: 0px;
            height:100%;
        }
        .filterdiv {
            background-image:url("Images/6.jpg");
            background-size: cover; 
            background-repeat: no-repeat;  
            background-attachment: fixed;
            padding: 90px 0px 0px 0px;
            width:100%;
            height: 500px;
            display:flex;
            flex-direction: column;
            text-align: center;
        }
        
        #slogan {
            color: white;
            font-family: Georgia;
            font-size: 30px;
        }
        #buyorrent {
            list-style-type: none;
            padding: 0px;
            margin-bottom: 20px;
        }
        #fildiv {
            background: rgba(0, 0, 0, 0.5);
            padding: 50px;
        }
        #buybutton, #rentbutton {
            border-bottom: 3px solid #b2b2b2;
            font-family: Calibri;
            display: inline-block;
            font-size: 22px;
            color: #b2b2b2; /*Gray*/
            padding-top: 8px;
            padding-bottom: 8px;
        }
            #buybutton:hover, #rentbutton:hover {
                border-bottom: 3px solid #eda136;
                color: #eda136;
                transition-duration: 0.6s;
                cursor: pointer;
            }
        #search-button {
            background-color: #eda136; /*orange*/
            color: white;
            border: none;
        }

        /*Featured Properties Sliders*/
        #buynewprops, #rentfeaturedprops {
            max-width: 900px;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
        }
        .left-arrow {
            left: 40%;
        }
        .right-arrow {
            right: 40%;
        }
        .right-arrow, .left-arrow {
            position: absolute;
            font-size: 30px;
            color: gray;
        }
        .propdesc ul {
            list-style-type: none;
            padding: 0px;
        }
        .propdesc ul li{
            display: inline;
        }
        .buyprops, .rentprops {
            text-align: center;
            font-family: Georgia;
            margin: 10px;
            box-shadow: 2px 2px 5px #CACACA;
            color: black;
            border-radius: 5px;
        }
            .rentprops:hover, .buyprops:hover {
                transform: scale(1.03);
                transition-duration: 0.7s;
            }
        .propdesc, .proplocation, .proptitle{
            margin-left: 8%;
            font-size: 16px;
            text-align: left;
        }
        .propprice {
            font-weight: 500;
            font-family: Calibri;
            font-size: 22px;
            margin-top: 10%;
            background-color: #132542;
            color: white;
            text-align: center;
        }
        .gotoproppage {
            margin-bottom: 10%;
            border: 3px solid #eda136;
            color: #eda136;
            background-color: white;
        }
            .gotoproppage:hover {
                background-color: #eda136;
                border: 3px solid #eda136;
                color: white;
                transition-duration: 0.4s;
            }
        #buynewpropstitle, #rentfeaturedpropstitle {
            font-family: Georgia;
            font-size: 30px;
            margin-bottom: 2%;
        }
        .propimg {
            border-radius: 5px;
        } 


        /*Our Services*/
        #ourservicesdiv {
            margin-top: 50px;
            margin-bottom: 70px;
            background-color: #1e284c;
            padding: 0px;
        }
        .serviceblock {
            width: 100%;
            text-align: center;
            background-color: #11172D ; /*Our Services Dark blue*/
            padding: 0px;
        }
        .osheadings {
            color: orange;
            margin-top: 14%;
            font-family: Georgia, 'Times New Roman';
            font-size: 22px;
        }
        .ospara {
            color: white;
            font-size: 14px;
            padding: 0px 5px 5px 5px;
            margin-bottom: 14%;
            margin-left: 5%;
            margin-right: 5%;
        }
        #osbutton {
            background-color: orange;
            color: white;
            border: none;
            font-size: 20px;
            box-shadow: 4px 4px 15px #1e284c; 
        }
            #osbutton:hover {
                transform:translateY(-2px);
                transition-duration: 0.5s;
                background-color: #364b96;
            }
            #osbutton a{
                color: white;
            }
            #osbutton a:hover{
                text-decoration: none;
                color: white;
            }
        #ostitle {
            font-family: Georgia;
            font-size: 30px;
            text-align: center;
            padding-bottom: 20px;
            padding-top: 40px;
            color: white;
        }
        /*Small and Extra Small Screens*/
        @media (max-width: 768px) {
            .osimg{
                display: none;
            }
            .ospara {
                margin-bottom: 0px;
                padding-bottom: 10%;
            }
            .osheadings {
                margin-top: 0px;
                padding-top: 10%;
                color: orange;
            }
            .serviceblock {
                background-color: black;          
            }
            #conblock {     
                background-image: url('Images/con1.jpg');
            }
            #dbblock {     
                background-image: url('Images/db.jpg');
                background-position: center;
            }
            #dbblock {
                
            }
            #notifblock {     
                background: rgba(0, 0, 0, 0.5);
            }
            .morediv {     
                background: rgba(0, 0, 0, 0.5);
            }
            #osbutton {
                display: inline;
                margin-bottom: 5%;
                padding: 15px;
                box-shadow: 4px 4px 15px #23305D; 
                background-color: orange;
            }
        }

        /*Large Screens*/
        @media (min-width: 992px) {
            #moreimg {
                display: none;              
            }
            #osbutton {
                display: inline;
                margin-bottom: 5%;
                padding: 15px;
            }
            #morediv {
                text-align: center;
            }
                #moreheading {
                    margin-top: 5%;
                }
        }
        /*Extra Large Screens*/
        @media (min-width: 1200px) {
            #moreimg {
                display: inline;   
            }
            #moreheading {
                margin-top: 14%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="thebigdiv">

        <!--Search Bar-->
        <div class="container filterdiv col-lg-12 col-md-12 col-sm-12 col-xs-12 parallax">
            <div id="fildiv" class="offset-xl-3 col-xl-6 offset-lg-3 col-lg-6 offset-md-2 col-md-8 offset-sm-1 col-sm-10 col-12">
                    <p id="slogan">Find your perfect home.</p>
                    <div id="buyorrent" class="row">
                        <p class="offset-xl-1 col-xl-4 offset-lg-1 col-lg-4 offset-md-1 col-md-4 offset-sm-1 col-sm-4 offset-1 col-4" id="buybutton" onclick="showBuyOptions()">Buy</p>
                        <p class="offset-xl-2 col-xl-4 offset-lg-2 col-lg-4 offset-md-2 col-md-4 offset-sm-2 col-sm-4 offset-2 col-4" id="rentbutton" onclick="showRentOptions()">Rent</p>
                    </div>
                    <div class="row">
                        <input id="search-bar" class="offset-xl-1 col-xl-8 offset-lg-1 col-lg-8 offset-md-1 col-md-8 offset-sm-1 col-sm-7 offset-1 col-10" type="text" placeholder="Enter Location"/>
                        <button class="btn offset-xl-0 col-xl-2 offset-lg-0 col-lg-2 offset-md-0 col-md-2 offset-sm-0 col-sm-3 offset-4 col-4" id="search-button">Search</button>
                    </div>
            </div>
        </div>

        <!--New/Featured Properties-->

        <!--New Properties on Sale-->
        <div id="buynewprops">
            <div id="buynewpropstitle">Latest Properties on Sale</div>
            <div id="buynewpropsslider" class="owl-carousel">
              <div id="buyprop1" class="buyprops"> 
                  <img class="propimg img-responsive" src="Images/buy1.jpg" /> 
                  <p class="propprice">PKR 25 Lakh</p>
                  <p class="proptitle">Two Bed Flat for Sale</p>
                  <div class="propdesc">
                      <ul>
                          <li>2 Bed |</li>
                          <li>2 Bath |</li>
                          <li>1500 Sqft</li>
                      </ul>
                  </div>
                  <p class="proplocation">Gulistan-e-Jauhar</p>
                  <button class="gotoproppage btn">View Property</button>
              </div>

              <div id="buyprop2" class="buyprops"> 
                  <img class="propimg img-responsive" src="Images/buy2.jpeg" /> 
                  <p class="propprice">PKR 50 Lakh</p>
                  <p class="proptitle">House for Sale</p>
                  <div class="propdesc">
                      <ul>
                          <li>3 Bed |</li>
                          <li>2 Bath |</li>
                          <li>1700 Sqft</li>
                      </ul>
                  </div>
                  <p class="proplocation">Gulshan-e-Iqbal</p>
                  <button class="gotoproppage btn">View Property</button>
              </div>
              
              <div id="buyprop3" class="buyprops"> 
                  <img class="propimg img-responsive" src="Images/buy3.jpg" /> 
                  <p class="propprice">PKR 98 Lakh</p>
                  <p class="proptitle">Villa Available For Sale</p>
                  <div class="propdesc">
                      <ul>
                          <li>4 Bed |</li>
                          <li>3 Bath |</li>
                          <li>2,115 sqft</li>
                      </ul>
                  </div>
                  <p class="proplocation">Bahria Town Karachi</p>
                  <button class="gotoproppage btn">View Property</button>
              </div>
              
              <div id="buyprop4" class="buyprops"> 
                  <img class="propimg img-responsive" src="Images/buy4.jpg" /> 
                  <p class="propprice">PKR 44 Lakh</p>
                  <p class="proptitle">Flat for Sale</p>
                  <div class="propdesc">
                      <ul>
                          <li>2 Bed |</li>
                          <li>2 Bath |</li>
                          <li>1450 Sqft</li>
                      </ul>
                  </div>
                  <p class="proplocation">Gulshan-e-Maymar</p>
                  <button class="gotoproppage btn">View Property</button>
              </div>
            </div>
        </div>

        <!--Featured Properties for Rent-->
        <div id="rentfeaturedprops">
            <div id="rentfeaturedpropstitle">Featured Properties for Rent</div>
            <div id="rentfeaturedpropsslider" class="owl-carousel">
              <div id="rentprop1" class="buyprops"> 
                  <img class="propimg img-responsive thumb-img" src="Images/rent1.jpeg" /> 
                  <p class="propprice">PKR 25 Lakh</p>
                  <p class="proptitle">Two Bed Flat for Sale</p>
                  <div class="propdesc">
                      <ul>
                          <li>2 Bed |</li>
                          <li>2 Bath |</li>
                          <li>1500 Sqft</li>
                      </ul>
                  </div>
                  <p class="proplocation">Gulistan-e-Jauhar</p>
                  <a href="#"><button class="gotoproppage btn">View Property</button></a>
              </div>

              <div id="rentprop2" class="buyprops"> 
                  <img class="propimg img-responsive thumb-img" src="Images/rent5.jpg" /> 
                  <p class="propprice">PKR 50 Lakh</p>
                  <p class="proptitle">House for Sale</p>
                  <div class="propdesc">
                      <ul>
                          <li>3 Bed |</li>
                          <li>2 Bath |</li>
                          <li>1700 Sqft</li>
                      </ul>
                  </div>
                  <p class="proplocation">Gulshan-e-Iqbal</p>
                  <a href="#"><button class="gotoproppage btn">View Property</button></a>
              </div>
              
              <div id="rentprop3" class="buyprops"> 
                  <img class="propimg img-responsive thumb-img" src="Images/rent3.jpg" /> 
                  <p class="propprice">PKR 98 Lakh</p>
                  <p class="proptitle">Villa Available For Sale</p>
                  <div class="propdesc">
                      <ul>
                          <li>4 Bed |</li>
                          <li>3 Bath |</li>
                          <li>2,115 sqft</li>
                      </ul>
                  </div>
                  <p class="proplocation">Bahria Town Karachi</p>
                  <a href="#"><button class="gotoproppage btn">View Property</button></a>
              </div>
              
              <div id="rentprop4" class="buyprops"> 
                  <img class="propimg img-responsive thumb-img" src="Images/rent4.jpg" /> 
                  <p class="propprice">PKR 44 Lakh</p>
                  <p class="proptitle">Flat for Sale</p>
                  <div class="propdesc">
                      <ul>
                          <li>2 Bed |</li>
                          <li>2 Bath |</li>
                          <li>1450 Sqft</li>
                      </ul>
                  </div>
                  <p class="proplocation">Gulshan-e-Maymar</p>
                  <a href="#"><button class="btn btn-success gotoproppage">View Property</button></a>
              </div>
            </div>
        </div>

        <!--Our Services-->

        <div id="ourservicesdiv" class="container-fluid ">
            <div class="row" style="width: 100%; margin-left: 0px; padding-bottom: 0px;">
                <div  class="col-lg-12">
                    <p id="ostitle">We are not just an ordinary property listing website.</p>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 serviceblock" id="conblock">
                    <p class="osheadings">Contract Templates</p>
                    <p class="ospara">Create your contracts in a streamlined way by filling using our contract form and templates.</p>
                    <img src="Images/con4.jpg" class="img-fluid osimg"/>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 serviceblock" id="notifblock">
                    <img src="Images/notif1.jpg" class="img-fluid osimg"/>
                    <p class="osheadings">Notifications and Reminders</p>
                    <p class="ospara">Managing contracts means keeping track of activities and deadlines. Our notifications help you do just that.</p>      
                </div>


                <div class="col-xl-3 col-lg-4 col-md-6 serviceblock" id="dbblock">
                    <p class="osheadings">Dashboard</p>
                    <p class="ospara">Stay on top of rent payment dates, inspections, contract renewals and plumber visits.</p>
                    <img src="Images/db.jpg" class="img-fluid osimg"/>
                </div>
                <div class="col-xl-3 col-lg-12 col-md-6 serviceblock morediv">
                    <img src="Images/am.jpg" class="img-fluid osimg" id="moreimg"/>
                    <p class="osheadings" id="moreheading">... and more.</p>
                    <button id="osbutton" class="btn"><a href="OurServices.aspx">Our Services</a></button>
                </div>
            </div>

        </div>



      </div>
</asp:Content>

