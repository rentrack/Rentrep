 <%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="OurServices.aspx.cs" Inherits="OurServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/jquery-3.2.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />

    <title>Our Services</title>

<style type="text/css">
		.serv{
            margin-left:50px;
            margin-right:50px;
		}
    
        h2{
            text-align:center;
            margin-top: 50px;
		}
        h5{
            color:navy;
            
		}
    
        #box1{
            margin-top:50px;
            margin-bottom:20px;
		}
        #box2{
            margin-top:20px;
            margin-bottom:20px;
		}
        #box3{
            margin-top:20px;
            margin-bottom:20px;
		}
        #box4{
            margin-top:20px;
            margin-bottom:20px;
		}
         #box5{
            margin-top:20px;
            margin-bottom:20px;
		}
        #box6{
            margin-top:20px;
            margin-bottom:50px;
		}
        #para1, #para2, #para3, #para4, #para5, #para6{
            margin:auto;
            text-align:justify;
        }
        #image1, #image3{
           
        }
		
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="serv">
         <div id="head">
            <h2>Our Services</h2>
	    </div>

        <div id="box1" class="container-fluid">
            <div class="row">
                <div id="image1" class="col-md-6">
                  <img src="Images\con3.jpg" class="mx-auto d-block" style="height:80%; width:80%;"/>
                </div>

                <div id="para1" class="col-md-6">
                    <h5>Create Contract Templates</h5>
                    <p>Create your contracts in a streamlined way by filling in a contract form. For dealings to proceed smoothly throughout the contractual period, it is essential that both parties are clear on all the terms and conditions. To avoid ambiguity and disagreements, we allow you to generate contracts through our contract templates. </p>
                </div>  
            </div>   
        </div>

        <div id="box2" class="container-fluid">
            <div class="row">
                <div id="para2" class="col-md-6">
                    <h5>Highlighting</h5>
                    <p>If you receive a contract and disagree with certain conditions, you can highlight those specific parts and recommend adjustments.</p>
                </div>  

                <div id="image2" class="col-md-6">
                  <img src="Images/conhilight1.png" class="mx-auto d-block" style="height:80%; width:80%;"/>
                </div>
            </div>   
        </div>


        <div id="box3" class="container-fluid">
            <div class="row">
                <div id="image3" class="col-md-6">
                  <img src="Images/dashboard.jpg" class="mx-auto d-block" style="height:80%; width:80%;"/>
                </div>

                <div id="para3" class="col-md-6">
                    <h5>Dashboard</h5>
                    <p>Stay on top of rent dates, inspections, contract renewals and plumber visits. The dasboard gives you the capability to view upcoming events in a yearly, monthly or even weekly setting.</p>
                </div>  
            </div>   
        </div>

        <div id="box4" class="container-fluid">
            <div class="row">
                <div id="para4" class="col-md-6">
                    <h5>Notifications</h5>
                    <p>Managing contracts means keeping track of activities and deadlines. If a tenant requests an event such as re-painting the lounge, you get a notification to accept, decline or edit the request. Notifications also come to ask for ratings after an event so we may know your point of view.</p>
                </div>
                
                <div id="image4" class="col-md-6">
                  <img src="Images/notif.jpg" class="mx-auto d-block" style="height:80%; width:80%"/>
                </div>
            </div>   
        </div>

        <div id="box5" class="container-fluid">
            <div class="row">
                <div id="image5" class="col-md-6">
                  <img src="Images/rating1.jpg" class="mx-auto d-block" style="height:80%; width:80%;"/>
                </div>

                <div id="para5" class="col-md-6">
                    <h5>Ratings and Reviews</h5>
                    <p>Give feedback on tenants, landlord, buyer, seller and the properties by rating and giving your reviews about them.</p>
                    <p>Give your reviews on how well your request for an event was handled to let other users know of your experience.</p>
                </div>  
            </div>   
        </div>

        <div id="box6" class="container-fluid">
            <div class="row">
                <div id="para6" class="col-md-6">
                    <h5>Agent</h5>
                    <p>Contact agents through our website.</p>
                    <p>You can directly upload/sell or buy/rent properties from our website or you could use the help of an agent through our website to buy a property according to your requirement or sell your property to prosepective buyers. You can also find suitable tenants with the help of agents to rent your properties.</p>
                </div>      
            
                <div id="image6" class="col-md-6">
                  <img src="Images/agent2.jpg" class="mx-auto d-block" style="height:80%; width:80%"/>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

