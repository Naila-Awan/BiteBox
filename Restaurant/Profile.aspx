<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/BiteBoxRestaurant.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BiteBox.Restaurant.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/loginforms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="restaurantUpdateForm" class="loginform" style="margin-left: auto; margin-right:auto; width:550px">
    <asp:Label ID="updateErrorMsgRest" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>
        <p>Contact the administrator to edit these: </p>
    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
    <asp:TextBox ID="textRestName" runat="server"></asp:TextBox>
    <br><asp:Label ID="Label1" runat="server" Text="Email:"></asp:Label>
    <asp:TextBox ID="txtRestEmail" runat="server"></asp:TextBox>
    
    <br><asp:Label ID="Label6" runat="server" Text="Location:"></asp:Label>
    <asp:TextBox ID="textRestaurantLocation" runat="server" ></asp:TextBox>

                      <p>Editable Details: </p>
    <div style="display:flex;gap: 20px; margin-left:2rem;">
    <asp:Label ID="Label2" runat="server" Text="Description:"></asp:Label>
   <asp:TextBox ID="txtRestDescr" runat="server" TextMode="MultiLine" Rows="2" placeholder="Description"
       style=" width: 70%; padding: 8px; border: 1px solid #ccc; border-radius: 5px; background-color: #fff; 
                font-size: 11px; color: #333; margin-bottom: 10px; border: 1px solid #ccc;"></asp:TextBox>
   </div> 
   
    <asp:Label ID="Label3" runat="server" Text="Order Lead Time:"></asp:Label>
    <asp:TextBox ID="RestLeadT" runat="server" TextMode="Number" placeholder="Order Lead Time" ToolTip="in minutes" min="0" CssClass="numberSelector"></asp:TextBox>
    <br><asp:Label ID="Label4" runat="server" Text="Delivery Extra Time:"></asp:Label>
    <asp:TextBox ID="DeliveryextraT" runat="server" TextMode="Number" placeholder="Delivery Extra Time" ToolTip="in minutes" min="0" CssClass="numberSelector"></asp:TextBox>
    <br><asp:Label ID="Label5" runat="server" Text="Sales Tax(X %)"></asp:Label>
    <asp:TextBox ID="SalestaxT" runat="server" TextMode="Number" placeholder="Sales Tax: X %" min="0" CssClass="numberSelector"></asp:TextBox>
    <br><p>Enter your password to verify changes: </p>
    <asp:TextBox ID="txtRestPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
    <br>
    <asp:Button ID="btnRestUpdate" CssClass="loginButton" runat="server" Text="Verify" OnClick="btnRestaurantUpdate_Click"/>
    <br>
    </div>

    <script>
        window.onload = function () {
            // Check if the form was submitted
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        };

    </script>
</asp:Content>
