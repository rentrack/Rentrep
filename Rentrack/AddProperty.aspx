<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="AddProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
             
        });

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
            margin-top: 3%;
            margin-bottom: 3%;
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
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
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
            height: 35px;
            width: 35px;            
            border-radius: 50%;
            display: inline-block;
            display: flex;
            align-items: center;
            justify-content: center;
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
        #proptypediv {
            padding-top: 20px;
            padding-bottom: 20px;
        }

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
            margin-left: 10px;
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
            font-size: 22px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="offset-lg-2 col-lg-8 offset-md-2 col-md-8 offset-sm-2 offset-1 col-10 container-fluid" id="centerdiv">
            
            <div id="topdiv">
                <!--Add Property Heading -->
                <p id="addpropheading">Add a Property</p>

                <!--The Progress Bar -->
                <div id="theprogressbar">
                    <div class="progress" runat="server" id="prog1">
                      <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"> </div>
                    </div>
                    <span class="dot" id="dot1" runat="server"><i class="fa fa-map-marker"></i></span>
                    <div class="progress" runat="server" id="prog2">
                      <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"> </div>
                    </div>
                    <span class="dot" id="dot2" runat="server"><i class="fa fa-home"></i></span>
                    <div class="progress" runat="server" id="prog3">
                      <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"> </div>
                    </div>
                    <span class="dot" id="dot3" runat="server"><i class="fa fa-image" style="font-size: 18px"></i></span>
                    <div class="progress" runat="server" id="prog4">
                      <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"> </div>
                    </div>
                </div>

                <!--The Progress Text -->
                <div id="progresstext">
                    <p>Property Location and Type</p>
                    <p>Property Details</p>
                    <p>Property Images</p>
                </div>

            </div>

            <div id="formdiv" class="row">

                <!--Property Type and Location Form -->
                
                <div runat="server" id="proptypediv" style="padding-bottom: 3%; padding-top: 3%" class="offset-lg-3 col-lg-6 offset-md-2 col-md-8 offset-sm-1 col-sm-10 offset-1 col-10" >
                    <p class="heading">Property Type</p>
                    <label>Property Type<span class="required-sign"> *</span></label><br />
                    <asp:DropDownList ID="propertytypedropdown" runat="server" class="dropdowndesign narrower">
                        <asp:ListItem class="headfield" disabled >Residential</asp:ListItem>
                        <asp:ListItem class="normalfield" Selected="True">House</asp:ListItem>
                        <asp:ListItem class="normalfield">Apartment</asp:ListItem>
                        <asp:ListItem class="normalfield">Upper Portion</asp:ListItem>
                        <asp:ListItem class="normalfield">Lower Portion</asp:ListItem>
                        <asp:ListItem class="normalfield">Room</asp:ListItem>
                        <asp:ListItem class="headfield" disabled>Commercial</asp:ListItem>
                        <asp:ListItem class="normalfield">Office</asp:ListItem>
                        <asp:ListItem class="normalfield">Shop</asp:ListItem>
                    </asp:DropDownList>
                    <br /><br />

                    <label>Property Purpose<span class="required-sign"> *</span></label>
                    <br />
                    <asp:RadioButton ID="sellradio" runat="server" value="Sell" Selected="True" GroupName="propertypurpose" class="proppurradios buylabel" Text="Sell"/>
                    <asp:RadioButton ID="rentradio" runat="server" value="Rent" GroupName="propertypurpose" class="proppurradios rentlabel" Text="Rent"/>
                    <br />

                    <hr />

                    <p class="heading">Property Location</p>
                    <label>City<span class="required-sign"> *</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="cityddl" InitialValue="0"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="cityddl" runat="server" class="dropdowndesign narrower"></asp:DropDownList>
                    <br /><br />

                    <label>Area<span class="required-sign"> *</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTbArea" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbarea"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="tbarea" runat="server" class="form-control narrower areafield" placeholder="E.g: Gulshan-e-Iqbal"></asp:TextBox>                   
                    <br />


                    <label>Street Name</label>
                    <asp:TextBox ID="tbstreet" runat="server" class="form-control narrower" placeholder="E.g: University Road"></asp:TextBox>
                    <br />

                    <label>Block</label>
                    <asp:TextBox ID="tbblock" runat="server" class="form-control narrower" placeholder="E.g: Block 13-D"></asp:TextBox>
                    <br />

                    <div style="width: 100%; text-align: center">
                        <!--<div class="btn nextbutton" id="ptnxtbtn"></div>-->
                        <asp:Button ID="proptypenextbtn" runat="server" Text="CONTINUE" class="btn nextbutton ptnxtbtn" OnClick="proptypenextbtn_Click"/>
                    </div>
                </div>

                <!--Property Details Form -->
                <div id="propdetaildiv" style="padding-bottom: 5%; padding-top: 3%" class="offset-lg-3 col-lg-6 offset-md-2 col-md-8 offset-sm-1 col-sm-10 offset-1 col-10" runat="server">
                    <label>Property Title<span class="required-sign"> *</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortbproptitle" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbproptitle"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="tbproptitle" runat="server" class="form-control narrower areafield" placeholder="E.g: 400 Sq. Yard House for Sale"></asp:TextBox>                   
                    <br />

                    <label>Property Description<span class="required-sign"> *</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortbpropdesc" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbpropdesc"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="tbpropdesc" TextMode="MultiLine" runat="server" class="form-control narrower areafield" placeholder="E.g: Double Story, West Open"></asp:TextBox>                   
                    <br />

                    <label>Price (PKR)<span class="required-sign"> *</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortbprice" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbprice"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="tbprice" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)"></asp:TextBox>                   
                    <br />

                    <label>Land Area (in Square Feet)<span class="required-sign"> *</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortblandarea" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblandarea"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="tblandarea" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)"></asp:TextBox>
                    <a href="https://bit.ly/2OTqwKC" target="_blank" id="sqftconv">Square Feet Converter</a>
                    <br /><br />

                    <label>Expires After<span class="required-sign"> *</span></label>
                    <asp:DropDownList ID="expafterdropdown" runat="server" class="dropdowndesign">
                        <asp:ListItem class="normalfield">1 month</asp:ListItem>
                        <asp:ListItem class="normalfield">3 months</asp:ListItem>
                        <asp:ListItem class="normalfield">6 months</asp:ListItem>
                    </asp:DropDownList>
          
                               
                    
                    <br />

                    <div style="width: 100%; text-align: center; margin-top: 40px">
                        <asp:Button ID="propdetprevbtn" runat="server" Text="BACK" class="btn btn-light prevbutton" OnClick="propdetprevbtn_Click"/>
                        <asp:Button ID="propdetnextbtn" runat="server" Text="CONTINUE" class="btn nextbutton" OnClick="propdetnextbtn_Click"/>
                    </div>
                </div>


                <!--Property Images Form -->
                <div id="propimgdiv" runat="server" style="padding-bottom: 5%; padding-top: 3%" class="offset-lg-3 col-lg-6 offset-md-2 col-md-8 offset-sm-1 col-sm-10 offset-1 col-10">
                    <label>Add a Main Image<span class="required-sign"> *</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbproptitle"></asp:RequiredFieldValidator>
                    <asp:FileUpload ID="fumainimg" CssClass="form-control" runat="server" class="mainimg" style="height: 43px;"/>                   
                    <br />

                    <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                    <hr />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="File Name" />
                        </Columns>
                    </asp:GridView>

                    <div style="width: 100%; text-align: center; margin-top: 40px">
                        <asp:Button ID="propimgprevbtn" runat="server" Text="BACK" class="btn btn-light prevbutton" OnClick="propimgprevbtn_Click"/>
                        <asp:Button ID="propimgnextbtn" runat="server" Text="FINISH" class="btn nextbutton" OnClick="propimgnextbtn_Click"/>
                    </div>
                </div>

                <div id="successdiv" runat="server" style="padding-bottom: 5%; padding-top: 5%; text-align: center" class="offset-lg-3 col-lg-6 offset-md-2 col-md-8 offset-sm-1 col-sm-10 offset-1 col-10">
                    <p id="successmsg">Your Property was added successfully.</p>
                </div>
            </div>
            
            

        </div>
    </div>
</asp:Content>

