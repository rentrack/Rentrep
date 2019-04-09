<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	
	 <!--Font Awesome-->
    <link rel="stylesheet" href="Content/font-awesome.min.css"/>
    <style>
		 #maindiv {
            
            padding: 0px;
            margin: 0px;
            height:100%;
			background-image:url("Images/6.jpg");
			background-size: cover; 
            background-repeat: no-repeat; 
            background-attachment: fixed;
        }
        body {
	        margin: 0;
			
			background-size: cover;
            font-family:Georgia;
        }
    	.headingfaq p {
    		 font-family: Georgia, 'Times New Roman';
    	}
    	.headingfaq  {
			 
    		text-align: center;
    		margin: 0 auto;
			padding:0px;
    		color: black;
    		font-family:Georgia;
    		font-size: 40px;
    	}
     
        .faqcontainer {
            
            margin: 50px auto;
            padding: 0px 0px 0px 0px;
            width: 70%;
            background-color:  #132542;
			opacity:0.8;
        }
        .acc h3 {
            font-size: 25px; 
            color: white;
            padding: 15px;
            margin: 0;
            cursor: pointer;
           
            letter-spacing: 2px;
            position: relative;
        }
        .acc h3:after {
            content: '+';
            position: absolute;
            right: 20px;
            font-size: 40px;
            top: 50%;
            transform: translateY(-50%);
        }
        .acc.active h3:after {
	        content: '-';
        }
        .content {
            background-color: lightgrey;
            display: none;
        }
        .content-inner {
            padding: 15px;
        }
    		.content-inner ul li
			{
				list-style-type: square;
    		}
        .content * {
            margin-top: 0;
            line-height: 1.5;
			color:#132542;
        }
        .acc {
            border-bottom: 1px solid #fff;
        }
    </style>

    <script>
        $(document).ready(function () {
            $('.acc h3').click(function () {
                $(this).next('.content').slideToggle();
                $(this).parent().toggleClass('active');
                $(this).parent().siblings().children('.content').slideUp();
                $(this).parent().siblings().removeClass('active');
            });
        });
    </script>
</asp:Content>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div id="maindiv">
	<div class="headingfaq"><p>FAQ Section</p></div>
    <div class="faqcontainer">
		\
		<div class="acc">
			<h3> What is RentTrack?</h3>
			<div class="content">
				<div class="content-inner">
					<p>The main idea behind Rentrack is to provide a reliable real state website along with contract
						management lifecycle a way for people to manage their contracts related to real state
						accommodation from the initial creation of a contract to its execution and renewal stages</p>
				</div>
			</div>
		</div>
        <!-- Accordian -->
		<div class="acc">
			<h3>How can i use it?</h3>
			<div class="content">
				<div class="content-inner">
					<p>On our website we offer two choices for our users</p>
					<p> In first choice user can register them selves as  landlord/seller and tenant/buyer on our website
						and directly buy/sell or rent property with each other along with complete 
						contract lifecycle management means all the record after the contract has been signed 
						will be kept on the website and important things like rent paying dates, yearly contract renewal 
						dates cane be remembered through the CLM feature. Also complaints and other house maintenance facilities
						can be communicated through it. Users can also give review about each 
						other after contract ends for other users who will be interested in that property and or
						the buyer /tenant in future.</p>
					  <p>  In second choice the user landlord/seller, tenant/buyer and estate agent (agency) register them self on website
						and all the buying and selling is done through the middle men agent/broker along with complete contract lifecycle 
						management</p>
				</div>
			</div>
		</div>
		

		<!-- Accordian -->
		<div class="acc">
			<h3>How to add propetry?</h3>
			<div class="content">
				<div class="content-inner">
					<p>
					   sign in to rentrack.com using your legible email addres.click on add
						property fil the form and provide all re required documents and publish your
						property on rentrack.
					</p>
				</div>
			</div>
		</div>

		<!-- Accordian -->
		<div class="acc">
			<h3>how to sign up as multiple user?</h3>
			<div class="content">
				<div class="content-inner">
					<p>
                      In sign up form we have provided checkbox for user types, simply check mark it according to your need.
					</p>
				</div>
			</div>
		</div> 
        <!-- Accordian -->
        <div class="acc">
			<h3>How to sell property on Rentrack?</h3>
			<div class="content">
				<div class="content-inner">
					<p> 
						<ul>
						<li>sign in to our website </li>
						<li>look for market rates.</li>
						<li>add your property by providing all the erequired info</li>
						<li>look for market rates.add your property by providing all the erequired info</li>
						<li>set up your rate and publish on rentrack</li>
                        <li>OR</li>
                        <li>look for agent provie all the info to him and let him post property on your behalf</li>
						</ul>
					</p>
				</div>
			</div>
		</div>
        <!-- Accordian -->
        <div class="acc">
			<h3>what is contract life cycle management?</h3>
			<div class="content">
				<div class="content-inner">
					<p>methodical management of a residential contract from initiation through award, compliance 
						and renewal. Implementing CLM can lead to significant improvements in cost savings and 
						efficiency.Understanding and automating CLM can increase compliance with legal requirements.</p>
				</div>
			</div>
		</div>
	</div>
</div>
</asp:Content>

