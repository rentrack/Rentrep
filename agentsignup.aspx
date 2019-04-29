<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="agentsignup.aspx.cs" Inherits="agentsignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

	 <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Sign Up</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
 

    <style>
    	#maindiv {
    		background-image: url("Images/bg1.jpeg");
    		background-size: cover;
    		background-repeat: no-repeat;
    		background-attachment: fixed;
    	}

        #box {
			font-family: 'Roboto', sans-serif;
            padding-top:100px;
            padding-bottom:100px;
            margin: 0px;
            width:100%;
            height:100%;
           
        }
        #form {
        
		     background: #444;
	        background: rgba(0, 0, 0, 0.3);
	       -moz-border-radius: 0 0 4px 4px; -webkit-border-radius: 0 0 4px 4px; border-radius: 0 0 4px 4px;
            padding:50px 100px 50px 100px;
            margin-left:20%;
			color:white;
			width:60%;
        }

		 #form2 {
        
		     background: #444;
	        background: rgba(0, 0, 0, 0.3);
	       -moz-border-radius: 0 0 4px 4px; -webkit-border-radius: 0 0 4px 4px; border-radius: 0 0 4px 4px;
            padding:50px 100px 50px 100px;
			margin-top:50px;
            margin-left:20%;
			color:white;
			width:60%;
        }
		  #form3 {
        
		     background: #444;
	        background: rgba(0, 0, 0, 0.3);
	       -moz-border-radius: 0 0 4px 4px; -webkit-border-radius: 0 0 4px 4px; border-radius: 0 0 4px 4px;
            padding:50px 100px 50px 100px;
			margin-top:50px;
            margin-left:20%;
			color:white;
			width:60%;
        }

        #signupbtnstyle{
			margin-top:20px; 
			margin-bottom:20px;
			text-align:center;
		    
		
          }

        #loginlink p{
			text-align:center;
			color:white;
			
        }

		#loginlink a{text-decoration:none;}

        h2 {
            color:white;
            text-align:center;
            margin-bottom:50px;

        }

        .required-sign{
            color: red;
            font-size: 20px;
        }
		.btn {
	        height: 50px;
            margin: 0;
            padding: 0 20px;
			text-align: center;
            
            vertical-align: middle;
            background: #eda136;
            border: 0;
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            line-height: 50px;
            color: #fff;
            -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
            text-shadow: none;
            -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
            -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s;  transition: all .3s;
        }

		
		 .btn:hover { opacity: 0.7; color: black; }
		 .btn:active { outline: 0; opacity: 0.6; color: #fff; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; }

		 .btnpad{
			padding-left:30px;
			padding-right:30px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="maindiv">
 <div class="container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div id="box" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div id="form">

			 <h2>Sign Up as agent</h2>
			 
			  <asp:Label ID="lmsg" runat="server"></asp:Label>
             <h3>Agent Information</h3>
			 <div class="col-xs-11">
             <label>First Name<span class="required-sign"> *</span></label>
             <asp:TextBox ID="fname" runat="server" Class="form-control" placeholder="First Name"></asp:TextBox>
             </div>
			 <div class="col-xs-11">
             <label>Last Name<span class="required-sign"> *</span></label>
             <asp:TextBox ID="lname" runat="server" Class="form-control" placeholder="Last Name"></asp:TextBox>
			 </div>
			<div class="col-xs-11">
            <label>CNIC No.<span class="required-sign"> *</span></label>
            <asp:TextBox  ID="cnicnum" runat="server" Class="form-control" ></asp:TextBox>
            </div>

            <div class="col-xs-11">
            <label>Address<span class="required-sign"> *</span></label>
            <asp:TextBox ID="agentaddress" runat="server" Class="form-control" ></asp:TextBox>
            </div>

			<div class="col-xs-11">
            <label>City<span class="required-sign"> *</span></label>
            <asp:DropDownList ID="agentcity" runat="server" Class="form-control"  >
            </asp:DropDownList>
            </div>

            <div class="col-xs-11">
            <label>Date Of Birth<span class="required-sign"> *</span></label>
            <asp:TextBox ID="agentdob" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <div class="col-xs-11">
            <label>Phone  No.<span class="required-sign"> *</span></label>
            <asp:TextBox ID="agentphone" runat="server" Class="form-control"></asp:TextBox>
            </div>
			<div class="col-xs-11">
            <label>Email<span class="required-sign"> *</span></label>
            <asp:TextBox  ID="agentemail" runat="server" Class="form-control" TextMode="Email" ></asp:TextBox>
            </div>
         </div>

	   <div id="form2">
			<h3>Agency Information</h3>
			 <div class="col-xs-11">
            <label>Agency Name<span class="required-sign"> *</span></label>
            <asp:TextBox ID="agencyname" runat="server" Class="form-control" placeholder="Agency Name"></asp:TextBox>
            </div>
			 <div class="col-xs-11">
            <label>Phone  No.<span class="required-sign"> *</span></label>
            <asp:TextBox  ID="agencyphnone" runat="server" Class="form-control"></asp:TextBox>
            </div>

           <div class="col-xs-11">
           <label>Email<span class="required-sign"> *</span></label>
           <asp:TextBox  ID="agencyemail" runat="server" Class="form-control" TextMode="Email" ></asp:TextBox>
           </div>

            <div class="col-xs-11">
            <label>City<span class="required-sign"> *</span></label>
            <asp:DropDownList ID="agnencycity" runat="server" Class="form-control"  >
            </asp:DropDownList>
            </div>

			  <div class="col-xs-11">
            <label>Enter Code<span class="required-sign"> *</span></label>
            <asp:TextBox ID="securitycode" runat="server" Class="form-control"></asp:TextBox>
            </div>
				</div>
			<div id="form3">
				<h3>Login Information</h3>
            <div class="col-xs-11">
            <label>Password<span class="required-sign"> *</span></label>
            <asp:TextBox  ID="agentpass" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>
			
		    </div>

            <div class="col-xs-11">
            <label>Re-Enter Password<span class="required-sign"> *</span></label>
            <asp:TextBox ID="reagentpass" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>
            </div>
                
            <div class="col-xs-11  form-group"  id="signupbtnstyle">   
            <asp:Button  ID="agsignupbtn" runat="server" class="btn btnpad" Text="Sign Up" OnClick="agsignupbtn_Click" />
            </div>

            <div class="col-xs-11" id="loginlink" >
            <asp:Label ID="logmember" runat="server" Text="Already a Member?"></asp:Label> 
			<a href="Login.aspx"  ><p>Login</p></a>              
            </div>


           </div>

		</div>
	</div>
</div>
</asp:Content>

