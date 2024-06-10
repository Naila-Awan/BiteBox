<%@ Page Title="" Language="C#" MasterPageFile="~/Main/BiteBoxMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BiteBox.Main.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/loginforms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">

    <div class="left-div"><img src="../Images/LogIn2.png" /></div>
  <div class="right-div">
      <div class="loginpage">
          <h2>Login</h2>
<div id="userType" class="userSelection">
    <button id="btnCustomer" type="button" class="selected" onclick="selectUserType('customer')">Customer</button>
    <button id="btnAdmin" type="button" onclick="selectUserType('admin')">Admin</button>
    <button id="btnRestaurant" type="button" onclick="selectUserType('restaurant')">Restaurant</button>
    <button id="btnRider" type="button" onclick="selectUserType('rider')">Rider</button>
</div>

    <!-------Customer Login Form--------------------------->
    <div id="customerLoginForm" class="loginform">
    <asp:TextBox ID="txtCEmail" runat="server" placeholder="Customer Email"></asp:TextBox>
    <asp:TextBox ID="txtCPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
    <br>
    <asp:Button ID="btnCLogin" CssClass="loginButton" runat="server" Text="Login" OnClick="btnCustomerLogin_Click" />
    <br>
    <asp:Label ID="loginErrorMsg" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>
    <asp:Label ID="signupC" runat="server" Text="" ForeColor="#fe8b00" CssClass="labelText">
        <a href="Signup.aspx">Don't have an account? Click here to sign up!</a>
    </asp:Label>
    </div>

    <!-------Admin Login Form-------------------------------->
    <div id="adminLoginForm" style="display:none;" class="loginform">
    <asp:TextBox ID="txtAEmail" runat="server" placeholder="Admin Email"></asp:TextBox>
    <asp:TextBox ID="txtAPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
    <br>
    <asp:Button ID="btnALogin" CssClass="loginButton" runat="server" Text="Login" OnClick="btnAdminLogin_Click" />
    <br>
    <asp:Label ID="loginErrorMsgA" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>
    </div>

    <!-------Restaurant Login Form----------------------------->
    <div id="restaurantLoginForm" style="display:none;" class="loginform">
    <asp:TextBox ID="txtRestEmail" runat="server" placeholder="Restaurant Email"></asp:TextBox>
    <asp:TextBox ID="txtRestPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
    <br>
    <asp:Button ID="btnRestLogin" CssClass="loginButton" runat="server" Text="Login" OnClick="btnRestaurantLogin_Click" />
    <br>
    <asp:Label ID="loginErrorMsgRest" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>
    <asp:Label ID="LabelRest" runat="server" Text="" ForeColor="#fe8b00" CssClass="labelText">
    <a href="Signup.aspx">Don't have an account? Click here to sign up!</a>
    </asp:Label>
    </div>

    <!-------Rider Login Form---------------------------------->
    <div id="riderLoginForm" style="display:none;" class="loginform">
    <asp:TextBox ID="txtREmail" runat="server" placeholder="Rider Email"></asp:TextBox>
    <asp:TextBox ID="txtRPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
    <br>
    <asp:Button ID="btnRLogin" CssClass="loginButton" runat="server" Text="Login" OnClick="btnRiderLogin_Click" />
    <br>
    <asp:Label ID="loginErrorMsgR" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>
    <asp:Label ID="LabelR" runat="server" Text="" ForeColor="#fe8b00" CssClass="labelText">
        <a href="Signup.aspx">Don't have an account? Click here to sign up!</a>
    </asp:Label>
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
            document.getElementById('customerLoginForm').style.display = 'block';
            document.getElementById('adminLoginForm').style.display = 'none';
            document.getElementById('restaurantLoginForm').style.display = 'none';
            document.getElementById('riderLoginForm').style.display = 'none';

        } else if (userType === 'admin') {
            document.getElementById('customerLoginForm').style.display = 'none';
            document.getElementById('adminLoginForm').style.display = 'block';
            document.getElementById('restaurantLoginForm').style.display = 'none';
            document.getElementById('riderLoginForm').style.display = 'none';

        } else if (userType == 'restaurant') {
            document.getElementById('customerLoginForm').style.display = 'none';
            document.getElementById('adminLoginForm').style.display = 'none';
            document.getElementById('restaurantLoginForm').style.display = 'block';
            document.getElementById('riderLoginForm').style.display = 'none';

        } else if (userType == 'rider') {
            document.getElementById('customerLoginForm').style.display = 'none';
            document.getElementById('adminLoginForm').style.display = 'none';
            document.getElementById('restaurantLoginForm').style.display = 'none';
            document.getElementById('riderLoginForm').style.display = 'block';

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
