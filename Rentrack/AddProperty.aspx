<%@ Page Title="Add Property" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="AddProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
            $(".finbtn").click(function () {
                if (fileUpload.value.length > 5) {    // CHECK IF FILE(S) SELECTED.
                    alert('You can add a maximum of five images.');
                    return false;
                }
            });
        });

        function fnOnUpdateValidators()
        {
           for (var i = 0; i < Page_Validators.length; i++)
           {
              var val = Page_Validators[i];
              var ctrl = document.getElementById(val.controltovalidate);
              if (ctrl != null && ctrl.style != null)
              {
                  if (!val.isvalid) {
                      ctrl.style.border = '2px solid #ff6868';
                      ctrl.style.boxShadow = '0px 0px 1px #ff6868';
                  }
                  else {
                      ctrl.style.border = '1px solid #ddd';
                      ctrl.style.boxShadow = '0px 0px 1px #ddd';
                  }
              }
           }
        }

        function isNumberKey(evt)
        {
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;    
             return true;
        }
        
    </script>
    <style>
        #header{
            position: relative;
        }
        #centerdiv {
            padding: 0px;
            box-shadow: 0px 0px 15px #AAA;
            border-radius: 5px;

        }
        #topdiv{
            width: 100%;
            background-color: #11172D ; /*Dark blue*/
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 5% 0% 5% 0%;
        }

        #addpropheading{
            color: orange;
            font-size: 25px;
            font-weight: 300;
            font-family: Calibri;
            margin-bottom: 3%;
        }

        /*Progress Bar*/
        #theprogressbar{
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            width: 100%;
        }
        .progress-bar{
            background-color: orange;
        }
        .progress {
            width: 17%;
            height: 7px;
            border-radius: 0px;
        }
        .dot {
            height: 35px;
            width: 35px;
            background-color: #dedede;
            border-radius: 50%;
            display: inline-block;
            display: flex;
            align-items: center;
            justify-content: center;
        }
            .dot i{
                font-size: 20px;
            }
        .activedot{
            background-color: orange;
            color: white;
            height: 50px;
            width: 50px;            
            border-radius: 50%;
            display: inline-block;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px
        }
        .completedot{
            background-color: orange;
            color: white;
            height: 35px;
            width: 35px;            
            border-radius: 50%;
            display: inline-block;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }
        .inactivedot{
            height: 35px;
            width: 35px;
            background-color: #dedede;
            color: gray;
            border-radius: 50%;
            display: inline-block;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }
        .activeprogbar{
            width: 17%;
            height: 7px;
            border-radius: 0px;
            background-color: orange;
        }
        .inactiveprogbar{
            width: 17%;
            height: 7px;
            border-radius: 0px;
            background-color: #dedede;
        }
        #progresstext {
            color: #bbb;
            margin-top: 1%;
            width: 60%;
            display: inline-grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-column-gap: 5%;
            text-align: center;
        }

        /*Forms*/
        #formdiv {
            width: 100%;
        }

        /*Property Type and Location*/

        .dropdowndesign {
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 5px 20px 5px 5px;
            box-shadow: 0px 0px 1px #ddd;
        }
        .headfield{
            color: gray;
            margin-top: 5px;
            text-transform: uppercase;
            font-family: Calibri;
            font-weight: 300;
        }
        .normalfield {
            font-size: 14px;
        }
        .buylabel, .rentlabel{
            margin-right: 20px;
        }
        .narrower{
            font-size: 14px;
        }
        .heading {
            color: orange;
            margin-top: 5px;
            text-transform: uppercase;
            font-family: Calibri;
            font-weight: 700;
            font-size: 18px;
        }
        .nextbutton{
            color: white;
            background-color: #eda136; /*orange*/
            padding: 10px 35px 10px 35px;
        }
        .nextbutton:hover{
            background-color: #555;
            color: white;
            transition-duration: 0.7s;
            box-shadow: 0px 2px 10px #aaa;
        }
        .prevbutton{
            padding: 10px 35px 10px 35px;
            color: black;
            background-color: #bbb;
        }
        .prevbutton:hover{
            transition-duration: 0.7s;
            box-shadow: 0px 2px 10px #aaa;
        }
        .error-design{
            color: red;
            font-family: Calibri;
            font-size: 14px;
            font-weight: 600;
        }
        .required-sign{
            color: red;
            font-size: 20px;
        }
        #sqftconv{
            font-size: 14px;    
            font-weight: 600;
        }
        #sqftconv:hover{
            text-decoration: none;
            transition-duration: 0.5s;
            color: #2a569e;
        }
        #successmsg{
            color: green;
            font-size: 20px;
        }
        .align-inline{
             display: grid; 
             grid-gap: 10px;
             grid-template-columns: 1fr 1fr 1fr;
        }
        .align-two-inline{            
             display: grid; 
             grid-gap: 10px;
             grid-template-columns: 1fr 1fr;
             grid-template-rows: 1fr 1fr;
        }
        .inlinefields{
            margin-right: 10px;
        }

        /*Extra Small Screen*/
        @media (max-width: 576px) {
            #topdiv {
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                padding: 30px;
            }
            .align-two-inline{
                 grid-template-columns: none;
                 grid-template-rows: 1fr 1fr 1fr 1fr 1fr;
            }
            #progresstext {
                display: none;
            }
            #theprogressbar{
                margin-top: 20px;
            }
        }

        /*Small Screen*/
        @media (max-width: 768px){
            
            .align-inline{
                grid-template-rows: 1fr 1fr 1fr;
                grid-template-columns: none;
                grid-gap: 0px;
            }
        }

        /*Medium Screen*/
        @media (max-width: 992px){
            #theprogressbar{
                margin-top: 20px;
                margin-bottom: 20px;
            }
            #progresstext {
                display: none;
            }
        }

        @media (min-width: 577px) {
            #topdiv {
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
            }
            #centerdiv {
                margin-top: 40px;
                margin-bottom: 40px;
            }
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%">
        <div class="offset-lg-2 col-lg-8 offset-sm-1 col-sm-10 col-12 container-fluid" id="centerdiv">
            
            <div id="topdiv">
                <!--Add Property Heading -->
                <p id="addpropheading">Post a Property</p>

                <!--The Progress Bar -->
                <div id="theprogressbar">
                    <div class="progress">
                      <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%" runat="server" id="prog1"> </div>
                    </div>
                    <span class="dot" id="dot1" runat="server"><i class="fa fa-map-marker"></i></span>
                    <div class="progress">
                      <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%" runat="server" id="prog2"> </div>
                    </div>
                    <span class="dot" id="dot2" runat="server"><i class="fa fa-home"></i></span>
                    <div class="progress">
                      <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%" runat="server" id="prog3"> </div>
                    </div>
                    <span class="dot" id="dot3" runat="server"><i class="fa fa-image" style="font-size: 18px"></i></span>
                    <div class="progress">
                      <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%" runat="server" id="prog4"> </div>
                    </div>
                </div>

                <!--The Progress Text -->
                <div id="progresstext">
                    <p id="txt1">Location and Type</p>
                    <p id="txt2">Property Details</p>
                    <p id="txt3">Property Images</p>
                </div>

            </div>

            <div id="formdiv">

                <!--Property Type and Location Form -->
                <div runat="server" id="proptypediv" style="padding-bottom: 40px; padding-top: 40px" class="offset-lg-2 col-lg-8 offset-md-1 col-md-10 offset-1 col-10" >
                    <p class="heading">Property Location</p>
                    <div class="align-inline">
                        <div class="dropdowndiv">
                            <label>City<span class="required-sign"> *</span></label><br />
                            <asp:DropDownList ID="cityddl" runat="server" class="dropdowndesign narrower inlinefields" OnSelectedIndexChanged="cityddl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorddcity" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="cityddl" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>

                        <div class="dropdowndiv">
                            <label>Area<span class="required-sign"> *</span></label><br />
                            <asp:DropDownList ID="areaddl" runat="server" class="dropdowndesign narrower inlinefields" OnSelectedIndexChanged="areaddl_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>                   
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorddarea" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="areaddl" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="dropdowndiv" style="margin-top: 5px">
                            <label>Subarea</label><br />
                            <asp:DropDownList ID="subareaddl" runat="server" class="dropdowndesign narrower inlinefields"></asp:DropDownList>                        
                        </div>
                    </div>
                    
                    
                    <hr />
                    
                    <p class="heading">Property Type</p>
                    <label>Property Type<span class="required-sign"> *</span></label><br />
                    <asp:DropDownList ID="propertytypedropdown" runat="server" class="dropdowndesign narrower">
                        <asp:ListItem class="normalfield" Value="0" Selected="True">- SELECT PROPERTY TYPE -</asp:ListItem>
                        <asp:ListItem class="headfield" disabled >Residential</asp:ListItem>
                        <asp:ListItem class="normalfield" >House</asp:ListItem>
                        <asp:ListItem class="normalfield">Apartment</asp:ListItem>
                        <asp:ListItem class="normalfield">Upper Portion</asp:ListItem>
                        <asp:ListItem class="normalfield">Lower Portion</asp:ListItem>
                        <asp:ListItem class="normalfield">Room</asp:ListItem>
                        <asp:ListItem class="headfield" disabled>Commercial</asp:ListItem>
                        <asp:ListItem class="normalfield">Office</asp:ListItem>
                        <asp:ListItem class="normalfield">Shop</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvproptype" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="propertytypedropdown" InitialValue="0"></asp:RequiredFieldValidator>
                    <br />

                    <label>Property Purpose<span class="required-sign"> *</span></label>
                    <br />
                    <asp:RadioButtonList ID="rentsellrb" runat="server">
                        <asp:ListItem Value="Sell" Selected="True">&nbsp;Sell</asp:ListItem>
                        <asp:ListItem Value="Rent">&nbsp;Rent</asp:ListItem>
                    </asp:RadioButtonList>
                    
                    <br />
                    <br />


                    <div style="width: 100%; text-align: center">
                        <!--<div class="btn nextbutton" id="ptnxtbtn"></div>-->
                        <asp:Button ID="proptypenextbtn" runat="server" Text="CONTINUE" class="btn nextbutton ptnxtbtn" OnClick="proptypenextbtn_Click"/>
                    </div>
                </div>

                <!--Property Details Form -->
                <div id="propdetaildiv" style="padding-bottom: 40px; padding-top: 40px" class="offset-lg-2 col-lg-8 offset-md-1 col-md-10 offset-1 col-10" runat="server">
                    <!--Property Details-->
                    <p class="heading">Property Description</p>
                    <label>Property Title<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbproptitle" runat="server" class="form-control narrower areafield" placeholder="E.g: 400 Sq. Yard House for Sale"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortbproptitle" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbproptitle"></asp:RequiredFieldValidator>
                    <br />

                    <label>Property Description<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbpropdesc" TextMode="MultiLine" runat="server" class="form-control narrower areafield" placeholder="E.g: Double Story, West Open"></asp:TextBox>                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortbpropdesc" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbpropdesc"></asp:RequiredFieldValidator>

                    <div class="align-inline">
                        <div>
                            <label>Price (PKR)<span class="required-sign"> *</span></label>
                            <asp:TextBox ID="tbprice" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" placeholder="0"></asp:TextBox>                   
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortbprice" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbprice"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label>Area (in Sq. Ft)<span class="required-sign"> *</span></label>
                            <asp:TextBox ID="tblandarea" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" placeholder="0"></asp:TextBox>
                            <a href="https://bit.ly/2OTqwKC" target="_blank" id="sqftconv">Square Feet Converter</a><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortblandarea" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblandarea"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <label>Expires After<span class="required-sign"> *</span></label>
                            <asp:DropDownList ID="expafterdropdown" runat="server" class="dropdowndesign">
                                <asp:ListItem class="normalfield" Value="1">1 month</asp:ListItem>
                                <asp:ListItem class="normalfield" Value="3">3 months</asp:ListItem>
                                <asp:ListItem class="normalfield" Value="6">6 months</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvexpafterdd" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="expafterdropdown"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <hr />
          
                    <!--Room Description-->
                    <p class="heading">Room Description (Optional) </p>
                    <div class="align-two-inline">
                        <div class="dropdowndiv">
                            <label>No. of Bedrooms</label><br />
                            <asp:TextBox ID="tbbed" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" TextMode="Number"></asp:TextBox>
                            <asp:RangeValidator ID="rvtbbed" ControlToValidate="tbbed" runat="server" ErrorMessage="Must be between 0 and 10" MaximumValue="10" MinimumValue="0" CssClass="text-danger error-design" Type="Integer"></asp:RangeValidator>                            
                        </div>

                        <div class="dropdowndiv">
                            <label>No. of Bathrooms</label><br />
                            <asp:TextBox ID="tbbath" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" TextMode="Number"></asp:TextBox>
                            <asp:RangeValidator ID="rvtbbath" ControlToValidate="tbbath" runat="server" ErrorMessage="Must be between 0 and 10" MaximumValue="10" MinimumValue="0" CssClass="text-danger error-design" Type="Integer"></asp:RangeValidator>
                        </div>
                        
                        <div class="dropdowndiv">
                            <label>No. of Kitchens</label><br />
                            <asp:TextBox ID="tbkitchen" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" TextMode="Number"></asp:TextBox>
                            <asp:RangeValidator ID="rvntbkitchen" ControlToValidate="tbkitchen" runat="server" ErrorMessage="Must be between 0 and 10" MaximumValue="10" MinimumValue="0" CssClass="text-danger error-design" Type="Integer"></asp:RangeValidator>                        
                        </div>

                        <div class="dropdowndiv">
                            <label>No. of Halls</label><br />
                            <asp:TextBox ID="tbhall" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" TextMode="Number"></asp:TextBox>
                            <asp:RangeValidator ID="rvtbhall" ControlToValidate="tbhall" runat="server" ErrorMessage="Must be between 0 and 10" MaximumValue="10" MinimumValue="0" CssClass="text-danger error-design" Type="Integer"></asp:RangeValidator>                        
                        </div>

                        <div class="dropdowndiv">
                            <label>No. of Floors</label><br />
                            <asp:TextBox ID="tbfloor" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" TextMode="Number"></asp:TextBox>
                            <asp:RangeValidator ID="rvtbloor" ControlToValidate="tbfloor" runat="server" ErrorMessage="Must be between 0 and 10" MaximumValue="10" MinimumValue="0" CssClass="text-danger error-design" Type="Integer"></asp:RangeValidator>                        
                        </div>
                    </div>        

                    <div style="width: 100%; text-align: center; margin-top: 40px">
                        <asp:Button ID="propdetprevbtn" runat="server" Text="BACK" class="btn btn-light prevbutton" OnClick="propdetprevbtn_Click" CausesValidation="false"/>
                        <asp:Button ID="propdetnextbtn" runat="server" Text="CONTINUE" class="btn nextbutton" OnClick="propdetnextbtn_Click"/>
                    </div>
                </div>


                <!--Property Images Form -->
                <div id="propimgdiv" runat="server" style="padding-bottom: 40px; padding-top: 40px" class="offset-lg-2 col-lg-8 offset-md-1 col-md-10 offset-1 col-10">
                    
                    <label>Add a Main Image<span class="required-sign"> *</span></label>
                    <asp:FileUpload ID="fumainimg" CssClass="form-control mainimg" runat="server" style="height: 43px;"/>
                    <asp:RegularExpressionValidator ID="revmainimg" runat="server" ErrorMessage="Please select a valid image file." CssClass="text-danger error-design" ControlToValidate="fumainimg" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>
                    <br />
                    <label>Add More Images (Optional)</label>
                    <asp:FileUpload ID="fuimgs" runat="server" AllowMultiple="true"  CssClass="form-control" style="height: 43px;"/>
                    <asp:RegularExpressionValidator ID="revfuimgs" runat="server" ErrorMessage="Please select a valid image file." CssClass="text-danger error-design" ControlToValidate="fuimgs" ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvmainimg" runat="server" ErrorMessage="You must upload a main image to proceed" CssClass="text-danger error-design" ControlToValidate="fumainimg"></asp:RequiredFieldValidator>

                    <div style="width: 100%; text-align: center; margin-top: 20px">
                        <asp:Button ID="propimgprevbtn" runat="server" Text="BACK" class="btn btn-light prevbutton" OnClick="propimgprevbtn_Click" CausesValidation="false"/>
                        <asp:Button ID="propimgnextbtn" runat="server" Text="FINISH" class="btn nextbutton finbtn" OnClick="propimgnextbtn_Click" />
                    </div>
                </div>

                <div id="successdiv" runat="server" style="padding-bottom: 5%; padding-top: 5%; text-align: center" class="offset-lg-3 col-lg-6 offset-md-2 col-md-8 offset-sm-1 col-sm-10 offset-1 col-10">
                    <img src="Images/success.gif" width="200"/>
                    <p id="successmsg">Your Property was added successfully.</p>
                </div>
            </div>

        </div>
        </div>
</asp:Content>

