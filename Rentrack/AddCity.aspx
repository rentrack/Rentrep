<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCity.aspx.cs" Inherits="AddCity" %>

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
        function isLetterKey(evt)
        {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode == 45 || charCode == 32)
                return true;    
             return false;
        }

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

            if ($('td').text() == '') {
                $("#tablemsg").text("The table is empty.");
            }
        });
        

    </script>


    <title>Add City</title>
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
            
            <!-- Nav tabs -->
                
            <a href="AddSubarea.aspx">Add Subarea</a>
            <a href="AddArea.aspx">Add Area</a>
            <ul class="nav nav-tabs nav-justified" id="tabs">
              <li class="nav-item">
                  <asp:Panel ID="addheading" runat="server" CssClass="nav-link active tabheadings" data-toggle="tab" href="#addrow"><i class="fa fa-plus-circle tabicons"></i>Add City</asp:Panel>
                  <!--<a class="nav-link active tabheadings" data-toggle="tab" href="#addrow" runat="server">Add City</a>-->
              </li>
              <li class="nav-item">
                  <asp:Panel ID="remheading" runat="server" CssClass="nav-link tabheadings" data-toggle="tab" href="#remrow"><i class="fa fa-trash tabicons"></i>Remove City</asp:Panel>
                <!--<a class="nav-link tabheadings" data-toggle="tab" href="#remrow">Remove City</a>-->
              </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">

                <!--Add City-->
                <asp:Panel ID="addrow" runat="server" CssClass="tab-pane container active col-12">
                    <!--Country-->
                    <br />
                    <label class="form-label">Country<span class="required-sign"> *</span></label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortbcountry" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbcountry" validationgroup="Addcityfields"></asp:RequiredFieldValidator>
                         <asp:TextBox ID="tbcountry" runat="server" class="form-control narrower" onkeypress="return isLetterKey(event)"></asp:TextBox>                           
                    <br />

                    <!--Province/State-->
                    <label class="form-label">Province/State</label>
                         <asp:TextBox ID="tbprovince" runat="server" class="form-control narrower" onkeypress="return isLetterKey(event)"></asp:TextBox>                   
                    <br />

                    <!--City-->
                    <label class="form-label">City<span class="required-sign"> *</span></label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortbcity" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbcity" validationgroup="Addcityfields"></asp:RequiredFieldValidator> 
                         <asp:TextBox ID="tbcity" runat="server" class="form-control narrower" onkeypress="return isLetterKey(event)"></asp:TextBox>    
                    <br /><br />
                    <div style="text-align: center">
                        <asp:Button ID="addtodbbtn" runat="server" Text="Add to Database" class="add-button btn" OnClick="Addtodbbtn_Click" validationgroup="Addcityfields"/>
                        <br />
                        <asp:Label ID="lblMsg" runat="server" Text="" class="labelmsg"></asp:Label>
                    </div>
                </asp:Panel>
            
                <!--Remove City-->
                <asp:Panel ID="remrow" runat="server" CssClass="tab-pane container fade col-12">
                    <p class="alert-danger" id="remwarning"><i class="fa fa-exclamation-triangle"></i> The record will be deleted permanently.</p>
                    <!--City ID-->
                    <label class="form-label">City ID<span class="required-sign"> *</span></label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatortbcityid" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbcityid" validationgroup="Remcityfields"></asp:RequiredFieldValidator>
                         <asp:TextBox ID="tbcityid" runat="server" class="form-control narrower" onkeypress="return isNumberKey(event)"></asp:TextBox>                    
                    <br />
                    <div style="text-align: center">
                        <asp:Button ID="removebtn" runat="server" Text="Remove" class="rem-button btn" OnClick="removebtn_Click" validationgroup="Remcityfields"/><br />   
                        <asp:Label ID="remlblmsg" runat="server" Text="" class="labelmsg"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
            </div>
  
            <div id="tablediv" runat="server">
                <!--Table-->
                <div class="container" id="tableheadingdiv">
                  <h3 class="pageheadings" id="tableheading">City Table</h3>
                </div>
                <asp:Repeater ID="rptrcities" runat="server">
                    <HeaderTemplate>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                  <th scope="col">City_ID</th>
                                  <th scope="col">City</th>
                                  <th scope="col">Province or State</th>
                                  <th scope="col">Country</th>
                                </tr>
                            </thead>
                        <tbody>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr>
                          <td><%# Eval ("city_id") %></td>
                          <td><%# Eval ("city_name") %></td>
                          <td><%# Eval ("province_state") %></td>
                          <td><%# Eval ("country") %></td>
                           
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

