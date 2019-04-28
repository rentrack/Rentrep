<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddSubArea.aspx.cs" Inherits="AddSubArea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!--Bootstrap and jQuery-->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!--Font Awesome-->
    <link rel="stylesheet" href="Content/font-awesome.min.css"/>
    
    <script>

        function isNumberKey(evt)
          {
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;    
             return true;
        }

        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
            
        });
        

    </script>


    <title>Add Subarea</title>
    <style>
        body{
            margin: 0px;
            padding: 0px;
        }
        #bigdiv{
            width: 100%;
            display: flex;          
            height: 100%;
            position: absolute;
            top: 0; right: 0; bottom: 0; left: 0;
            background-color: white;
            justify-content: center;
            padding: 0px;
        }
        #formdiv{
            display: flex;     
            flex-direction: column;
            justify-content: center;
            background-color: white ;
            padding: 5%;
            box-shadow: 0px 0px 5px #aaa;
            width: 100%;
        }
        .dropdowndesign {
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 5px 20px 5px 5px;
            box-shadow: 0px 0px 1px #ddd;
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
        
        .narrower{
            font-size: 14px;
        }
        .add-button{
            color: white;
            background-color: #eda136; /*orange*/
            padding: 10px 35px 10px 35px;
        }
            .add-button:hover{
                color: white;
                background-color: #d68d26; /*orange*/
                padding: 10px 35px 10px 35px;
                transition-duration: 0.5s;
            }

        .rem-button{
            color: white;
            background-color: red;
            padding: 10px 35px 10px 35px;
        }
            .rem-button:hover{
                color: white;
                background-color: #ce3608; /*Dark red*/
                padding: 10px 35px 10px 35px;
                transition-duration: 0.5s;
            }

        hr{
            width: 100%;
            color: #AAA;
            height: 2px;
            margin-bottom: 30px;
            margin-top: 20px;
        }
        .pageheadings{
            text-align: center;
            font-family: Georgia;
            margin-top: 40px;
        }
        #tableheading{
            padding-bottom: 20px;
        }
        #tableheadingdiv{
            width: 100%;
        }
        table{
            text-align: center
        }
        #tablediv{
            padding: 40px 50px 20px 50px;
        }
        .labelmsg{
            font-family: Calibri;
            font-weight: 600;
            margin-top: 30px;
        }
        @media (min-width: 1050px){
            #formdiv{
                height: 100vh;
                width: 40%;
            }
            #tablediv{                
	            height: 100%;
	            overflow: auto;
                width: 60%;
            }
        }
        @media (max-width: 1050px) {
            #bigdiv{
                flex-direction: column;
                position: relative;
                font-size: 14px;
                align-items: center;
            }
            #formdiv{
                box-shadow: none;
                width: 70%;
                background-image:none;

            }
            #tablediv{
                width: 100%;
            }
            
        }
        @media (max-width: 576px) {
            #formdiv{
                width: 100%;
            }
            
        }
        .tabheadings{
            font-size: 18px;
            color: #ccc;
            cursor: pointer;
        }
        .tabheadings:hover{
            color: #777;
            transition-duration: 0.8s;

        }
        .tabicons{
            padding-right: 10px;
            color: #ccc;
        }
        #addrow, #remrow{
            border: 1px solid #ddd;
            border-top: none;
            padding: 20px 30px 40px 30px;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }
        #tablemsg{
           text-align: center;
           color: #aaa;
        }
        #remwarning{
            font-size: 14px;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" id="bigdiv">
            
            <div id="formdiv" runat="server">
            <a href="AddCity.aspx">Add City</a>
            <a href="AddArea.aspx">Add Area</a>

            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-justified" id="tabs">
              <li class="nav-item">
                  <asp:Panel ID="addheading" runat="server" CssClass="nav-link active tabheadings" data-toggle="tab" href="#addrow"><i class="fa fa-plus-circle tabicons"></i>Add Subarea</asp:Panel>
              </li>
              <li class="nav-item">
                  <asp:Panel ID="remheading" runat="server" CssClass="nav-link tabheadings" data-toggle="tab" href="#remrow"><i class="fa fa-trash tabicons"></i>Remove Subarea</asp:Panel>
              </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">

                <!--Add Subarea-->
                <asp:Panel ID="addrow" runat="server" CssClass="tab-pane container active col-12">
                    <!--Area-->
                    <br />
                    <label>Area<span class="required-sign"> *</span></label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorddcity" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="areaddl" InitialValue="0" validationgroup="Addareafields"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="areaddl" runat="server" class="dropdowndesign narrower"></asp:DropDownList>                           
                    <br /><br />

                    <!--Subarea-->
                    <label class="form-label">Subarea<span class="required-sign"> *</span></label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbsubarea" validationgroup="Addareafields"></asp:RequiredFieldValidator> 
                        <asp:TextBox ID="tbsubarea" runat="server" class="form-control narrower"></asp:TextBox>    
                    <br />

                    <div style="text-align: center">
                        <asp:Button ID="addtodbbtn" runat="server" Text="Add to Database" class="add-button btn" validationgroup="Addareafields" OnClick="Addtodbbtn_Click"/>
                        <br />
                        <asp:Label ID="lblMsg" runat="server" Text="" class="labelmsg"></asp:Label>
                    </div>
                </asp:Panel>
            
                <!--Remove Subarea-->
                <asp:Panel ID="remrow" runat="server" CssClass="tab-pane container fade col-12">
                    <!--Subarea ID-->
                    <br />
                    <p class="alert-danger" id="remwarning"><i class="fa fa-exclamation-triangle"></i> The record will be deleted permanently.</p>
                    <label class="form-label">Subarea ID<span class="required-sign"> *</span></label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatortbcityid" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbsubareaid" validationgroup="Remareafields"></asp:RequiredFieldValidator>
                         <asp:TextBox ID="tbsubareaid" runat="server" class="form-control narrower" onkeypress="return isNumberKey(event)"></asp:TextBox>                    
                    <br />
                    <div style="text-align: center">
                        <asp:Button ID="removebtn" runat="server" Text="Remove" class="rem-button btn" validationgroup="Remareafields"  OnClick="removebtn_Click" /><br />   
                        <asp:Label ID="remlblmsg" runat="server" Text="" class="labelmsg"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
            </div>
  
            <div id="tablediv" runat="server">
                <!--Table-->
                <div class="container" id="tableheadingdiv">
                  <h3 class="pageheadings" id="tableheading">Subarea Table</h3>
                </div>
                <asp:Repeater ID="rptrareas" runat="server">
                    <HeaderTemplate>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                  <th scope="col">Subarea_ID</th>
                                  <th scope="col">Subarea</th>
                                  <th scope="col">Area</th>
                                </tr>
                            </thead>
                        <tbody>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr>
                          <td><%# Eval ("subarea_id") %></td>
                          <td><%# Eval ("subarea") %></td>
                          <td><%# Eval ("area") %></td>                           
                        </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <p id="tablemsg"></p>
            </div>

        </div>
    </form>
</body>
</html>
