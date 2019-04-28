<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Login</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"/>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css"/>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->  

        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>

    <style>
        .body {
			background-image:url("Images/bg1.jpeg");
			background-size: cover; 
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            color: #888;
            line-height: 30px;
            text-align: center;
            
			
        }

        strong { font-weight: 500; }

        h1, h2 {
	        margin-top: 10px;
	        font-size: 38px;
            font-weight: 100;
            color: #555;
            line-height: 50px;
        }

        h3 {
	        font-size: 22px;
            font-weight: 300;
            color: #555;
            line-height: 30px;
        }

        .remember{
            font-size: 15px;
            font-weight: 300;
            color: #fff;
            line-height: 30px;
            margin: 5px;
        }


        /***** Top content *****/
		
        .inner-bg {
            padding: 100px 0 170px 0;
			background-image:url("Images/bg1.jpeg");
			background-size: cover; 
        }

		.linkto p{
			
			text-align:center;
			color:#fff;
			
		}
		.linkto :hover{
			
			text-align:center;
			color:black;
			text-decoration: none;
			
		}

		.row{
		 padding-left:35%; 
		}
        .top-content .text {
	        color: #fff;
        }

        .top-content .text h1 { color: #fff; }

        .top-content .description {
	        margin: 20px 0 10px 0;
        }

        .top-content .description p { opacity: 0.8; }

        .form-box {
	        margin-top: 35px;
        }

        .form-top {
	        overflow: hidden;
			margin-bottom:40px;
	        padding: 0 25px 15px 25px;
	        background: #444;
	        background: rgba(0, 0, 0, 0.35);
	        -moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; border-radius: 4px 4px 0 0;
	        text-align: center;
            float: left;
	        width: 100%;
	        padding-top: 25px;
        }

        .form-top h3 { margin-top: 0; color: #fff; }
        .form-top p { opacity: 0.8; color: #fff; }

        .form-bottom {
	        padding: 25px 25px 30px 25px;
	        background: #444;
	        background: rgba(0, 0, 0, 0.3);
	        -moz-border-radius: 0 0 4px 4px; -webkit-border-radius: 0 0 4px 4px; border-radius: 0 0 4px 4px;
	        text-align: left;
        }

        .form-bottom form textarea {
	        height: 100px;
        }
        
        .form-bottom form button.btn {
	        width: 100%;
        }

    
        
		

        .form-bottom form .input-error {
	        border-color: #de615e;
        }

       


 /*Form input css*/
        #tbemail,#tbpassword, 
        textarea, 
        textarea.form-control {
	        height: 50px;
            margin: 0;
            padding: 0 20px;
            vertical-align: middle;
            background: #fff;
            border: 3px solid #fff;
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            line-height: 50px;
            color: #888;
            -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
            -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
            -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
        }

        textarea, 
        textarea.form-control {
	        padding-top: 10px;
	        padding-bottom: 10px;
	        line-height: 30px;
        }

        #tbpassword:focus, 
        #tbemail:focus, 
        textarea:focus, 
        textarea.form-control:focus {
	        outline: 0;
	        background: #fff;
            border: 3px solid #fff;
            -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
        }

        input[type="email"]:-moz-placeholder, input[type="password"]:-moz-placeholder, 
        textarea:-moz-placeholder, textarea.form-control:-moz-placeholder { color: #888; }

        input[type="email"]:-ms-input-placeholder, input[type="password"]:-ms-input-placeholder, 
        textarea:-ms-input-placeholder, textarea.form-control:-ms-input-placeholder { color: #888; }

        asp.text[type="email"]::-webkit-input-placeholder, input[type="password"]::-webkit-input-placeholder, 
        textarea::-webkit-input-placeholder, textarea.form-control::-webkit-input-placeholder { color: #888; }

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
		
		#button-div{
			text-align: center;
		
		}
	</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="body">        
        <div class="top-content">
        	
          <div class="inner-bg"> 
                <div class="container">

                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        			<h3>Login</h3>
                            		<p>Enter your Email and Password to log in</p>
                            </div>
                            <div class="form-bottom">
			                    <div class="form-group">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-email">Email</label>
                                        <asp:TextBox ID="tbemail" runat="server" Class="form-email form-control" TextMode="Email" placeholder="Enter Email"></asp:TextBox>
							            <asp:RequiredFieldValidator ID="RequiredFieldValidatortbemail"  CssClass="text-danger" runat="server" ErrorMessage="The email field is Required !" ControlToValidate="tbemail"></asp:RequiredFieldValidator>
                                    </div>
			                        <div class="form-group" >
			                        	<label class="sr-only" for="form-password">Password</label>
                                        <asp:TextBox ID="tbpassword" placeholder="Enter Password" name="form-password" runat="server" Class="form-password form-control" TextMode="Password"></asp:TextBox>
			                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortbpassword"  CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="tbpassword"></asp:RequiredFieldValidator> 
										<div class="linkto"><asp:LinkButton ID="tbForgotPass" runat="server" href="ForgotPassword.aspx"><p>Forgot Password?</p></asp:LinkButton></div>
									</div>
                                    <div class="form-inline">
                                        <asp:CheckBox ID="remembercheck" runat="server" Class="form-check"/>
                                        <asp:Label ID="lblremember" Class="remember" runat="server" Text="Remember me" for="form-check"></asp:Label>
                                    </div> 

								  
                                  
									<div class="form-group" id="button-div">
                                 <asp:Button id="loginbtn" runat="server" class="btn btnpad"  OnClick="Login_btn" Text="Login" /> 
                                    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
									 <asp:LinkButton ID="signuplink" runat="server" class="btn"  href="Sign Up.aspx">Register</asp:LinkButton>
                                    </div>
									   
									<div class="form-group linkto">
										<asp:LinkButton ID="agentsigninlink" runat="server" href="#"><p>Sign in as agent</p></asp:LinkButton>
									</div>

			                    </div>
		                    </div>
                        </div>

                           
                    </div>
                </div>
         </div> 
            
        </div>
    </div>
	

</asp:Content>


