<%@ Page Title="" Language="C#" MasterPageFile="~/Main/BiteBoxMaster.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="BiteBox.Main.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/loginforms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

    <div class="left-div"><img src="../Images/LogIn2.png" /></div>
  <div class="right-div">
      <div class="signuppage">
          <h2>SignUp</h2>
<div id="userType" class="userSelection">
    <button id="btnCustomer" type="button" class="selected" onclick="selectUserType('customer')">Customer</button>
    <button id="btnRestaurant" type="button" onclick="selectUserType('restaurant')">Restaurant</button>
    <button id="btnRider" type="button" onclick="selectUserType('rider')">Rider</button>
</div>

    <!-------Customer SignUp Form--------------------------->

    <div id="customerSignUpForm" class="loginform">
    <asp:TextBox ID="textCName" runat="server" placeholder="Name"></asp:TextBox>
    <asp:TextBox ID="txtCEmail" runat="server" placeholder="Email"></asp:TextBox>
    <asp:TextBox ID="txtCPhone" runat="server" placeholder="Phone"></asp:TextBox>

    <asp:DropDownList ID="ddlCLocation" runat="server" CssClass="locationDropdown">
        <asp:ListItem Text="Choose your Location" Value="" Selected="True"></asp:ListItem>
        <asp:ListItem Text="DHA" Value="DHA"></asp:ListItem>
        <asp:ListItem Text="Gulberg" Value="Gulberg"></asp:ListItem>
        <asp:ListItem Text="Lake City" Value="Lake City"></asp:ListItem>
        <asp:ListItem Text="Johar Town" Value="Johar Town"></asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="CAddress" runat="server" placeholder="Address" ToolTip="Your address within the chosen location"></asp:TextBox>
    <asp:TextBox ID="txtCPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
    <asp:TextBox ID="txtCConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>

    <br>
    <asp:Button ID="btnCSignUp" CssClass="loginButton" runat="server" Text="SignUp" OnClick="btnCustomerSignUp_Click"/>
    <br>
    <asp:Label ID="signupErrorMsg" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>

    <asp:Label ID="signupC" runat="server" Text="" ForeColor="#fe8b00" CssClass="labelText">
        <a href="Login.aspx">Already have an account? Click here to log in!</a>
    </asp:Label>
    </div>

    <!-------Restaurant SignUp Form----------------------------->

    <div id="restaurantSignUpForm" style="display:none;" class="loginform">
        <p>Basic information: </p>
    <asp:TextBox ID="textRestName" runat="server" placeholder="Restaurant Name"></asp:TextBox>
    <asp:TextBox ID="txtRestEmail" runat="server" placeholder="Restaurant Email"></asp:TextBox>
   <asp:TextBox ID="txtRestDescr" runat="server" TextMode="MultiLine" Rows="2" placeholder="Description"
       style=" width: 70%; padding: 8px; border: 1px solid #ccc; border-radius: 5px; background-color: #fff; 
                font-size: 11px; color: #333; margin-bottom: 10px; border: 1px solid #ccc;"></asp:TextBox>

    <asp:DropDownList ID="ddlRestLocation" runat="server" CssClass="locationDropdown">
        <asp:ListItem Text="Choose your Location" Value="" Selected="True"></asp:ListItem>
        <asp:ListItem Text="DHA" Value="DHA"></asp:ListItem>
        <asp:ListItem Text="Gulberg" Value="Gulberg"></asp:ListItem>
        <asp:ListItem Text="Lake City" Value="Lake City"></asp:ListItem>
        <asp:ListItem Text="Johar Town" Value="Johar Town"></asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="RestAddress" runat="server" placeholder="Restaurant Address" ToolTip="Your address within the chosen location"></asp:TextBox>
    
            <p>Other Details: </p>
    <asp:TextBox ID="RestLeadT" runat="server" TextMode="Number" placeholder="Order Lead Time" ToolTip="in minutes" min="0" CssClass="numberSelector"></asp:TextBox>
    <asp:TextBox ID="DeliveryextraT" runat="server" TextMode="Number" placeholder="Delivery Extra Time" ToolTip="in minutes" min="0" CssClass="numberSelector"></asp:TextBox>
    <asp:TextBox ID="SalestaxT" runat="server" TextMode="Number" placeholder="Sales Tax: X %" min="0" CssClass="numberSelector"></asp:TextBox>

        <p>Set a password for your account: </p>
    <asp:TextBox ID="txtRestPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
    <asp:TextBox ID="txtRestConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>

    <br>
    <asp:Button ID="btnRestSignUp" CssClass="loginButton" runat="server" Text="SignUp" OnClick="btnRestaurantSignUp_Click"/>
    <br>
    <asp:Label ID="signupErrorMsgRest" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>

    <asp:Label ID="signupRest" runat="server" Text="" ForeColor="#fe8b00" CssClass="labelText">
        <a href="Login.aspx">Already have an account? Click here to log in!</a>
    </asp:Label>
    </div>

    <!-------Rider SignUp Form---------------------------------->
    <div id="riderSignUpForm" style="display:none;" class="loginform">
    <asp:TextBox ID="textNameR" runat="server" placeholder="Name"></asp:TextBox>
    <asp:TextBox ID="textEmailR" runat="server" placeholder="Email"></asp:TextBox>
    <asp:TextBox ID="textPhoneR" runat="server" placeholder="Phone"></asp:TextBox>
    <asp:TextBox ID="textLicR" runat="server" placeholder="Driving license" ToolTip="Format: AA-XX-XXXXX"></asp:TextBox>

    <asp:DropDownList ID="ddlLocationR" runat="server" CssClass="locationDropdown">
        <asp:ListItem Text="Choose your Location" Value="" Selected="True"></asp:ListItem>
        <asp:ListItem Text="DHA" Value="DHA"></asp:ListItem>
        <asp:ListItem Text="Gulberg" Value="Gulberg"></asp:ListItem>
        <asp:ListItem Text="Lake City" Value="Lake City"></asp:ListItem>
        <asp:ListItem Text="Johar Town" Value="Johar Town"></asp:ListItem>
    </asp:DropDownList>

    <asp:TextBox ID="textAddrR" runat="server" placeholder="Address" ToolTip="Your address within the chosen location"></asp:TextBox>   
    <asp:TextBox ID="txtRPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
    <asp:TextBox ID="txtRConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
        
    <br>
    <asp:Button ID="btnSignUpR" CssClass="loginButton" runat="server" Text="SignUp" OnClick="btnRiderSignUp_Click"/>
    <br>
    <asp:Label ID="signupErrorMsgR" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>
    <asp:Label ID="signupR" runat="server" Text="" ForeColor="#fe8b00" CssClass="labelText">
        <a href="Login.aspx">Already have an account? Click here to log in!</a>    </asp:Label>
    </div>
  
</div>

  </div>
       </div>
<script>
    function selectUserType(userType) {

        var buttons = document.querySelectorAll('.userSelection button');
        buttons.forEach(function (button) {
            button.classList.remove('selected');
        });

        var selectedButton = document.getElementById('btn' + userType.charAt(0).toUpperCase() + userType.slice(1));
        selectedButton.classList.add('selected');

        if (userType === 'customer') {
            document.getElementById('customerSignUpForm').style.display = 'block';
            document.getElementById('restaurantSignUpForm').style.display = 'none';
            document.getElementById('riderSignUpForm').style.display = 'none';

        } else if (userType == 'restaurant') {
            document.getElementById('customerSignUpForm').style.display = 'none';
            document.getElementById('restaurantSignUpForm').style.display = 'block';
            document.getElementById('riderSignUpForm').style.display = 'none';

        } else if (userType == 'rider') {
            document.getElementById('customerSignUpForm').style.display = 'none';
            document.getElementById('restaurantSignUpForm').style.display = 'none';
            document.getElementById('riderSignUpForm').style.display = 'block';

        }
    }

    window.onload = function () {
        // Check if the form was submitted
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    };


</script>
</asp:Content>
