<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Sign Up.aspx.cs" Inherits="Sign_Up" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Sign Up</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 

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
            
                <h2>Sign Up</h2>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                           
            <div class="col-xs-11">
                <label>First Name<span class="required-sign"> *</span></label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbfname" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:TextBox ID="tbfname" runat="server" Class="form-control"></asp:TextBox>
            </div>

            <div class="col-xs-11">
            <label>Last Name<span class="required-sign"> *</span></label>
            <asp:TextBox ID="tblname" runat="server" Class="form-control"></asp:TextBox>
            </div>

            <div class="col-xs-11">
            <label>Date Of Birth<span class="required-sign"> *</span></label>
            <asp:TextBox ID="tbdob" runat="server" Class="form-control" TextMode="Date"></asp:TextBox>
            </div>

            <div class="col-xs-11">
            <label>Email<span class="required-sign"> *</span></label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbemail" InitialValue="0"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tbemail" runat="server" Class="form-control" TextMode="Email"></asp:TextBox>
            </div>

            <div class="col-xs-11">
            <label>Phone  No.<span class="required-sign"> *</span></label>
            <asp:TextBox ID="tbphone" runat="server" Class="form-control"></asp:TextBox>
            </div>

            <div class="col-xs-11">
            <label>Address<span class="required-sign"> *</span></label>
            <asp:TextBox ID="tbaddress" runat="server" Class="form-control"></asp:TextBox>
            </div>

            <div class="col-xs-11">
            <label>City<span class="required-sign"> *</span></label>
            <asp:DropDownList ID="tbdcity" runat="server" Class="form-control" DataSourceID="Rentrackdb" DataTextField="city_name" DataValueField="city_name">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Rentrackdb" runat="server" ConnectionString="<%$ ConnectionStrings:RentrackdbConnectionString %>" SelectCommand="SELECT [city_name] FROM [City]"></asp:SqlDataSource>
            </div>

            <div class="col-xs-11">
            <label>Password<span class="required-sign"> *</span></label>
            <asp:TextBox ID="tbpassword" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>
			<asp:RegularExpressionValidator ID="tbpasswordexp" runat="server" CssClass="text-danger" ErrorMessage="Password length must be between 7 to 10 characters" ControlToValidate="tbpassword"  ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,10}$" />
  
		    </div>

            <div class="col-xs-11">
            <label>Re-Enter Password<span class="required-sign"> *</span></label>
            <asp:TextBox ID="tbrepassword" runat="server" Class="form-control" TextMode="Password"></asp:TextBox>
            </div>
                
            <div class="col-xs-11 space-vert form-group"  id="signupbtnstyle">   
            <asp:Button id="signupbtn" runat="server" class="btn btnpad"  OnClick="signup_btn" Text="Sign Up" />
            </div>

            <div class="col-xs-11 space-vert align-content-center" id="loginlink">
            <asp:Label ID="member"  runat="server" Text="Already a Member?"></asp:Label> 
				<a href="Login.aspx" id="lgbtn" ><p>Login</p></a>              
            
            </div>
        
          
            </div>    
        </div>
    </div>
   </div>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</asp:Content>
