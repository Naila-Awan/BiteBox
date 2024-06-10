<%@ Page Title="" Language="C#" MasterPageFile="~/Main/BiteBoxMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="BiteBox.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Styles for the contact form */
        .contact-form {
            margin: auto;
            width: 60%;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-family: Arial,sans-serif;
            margin-top: 25px; /* Adjust the top margin */
            margin-bottom: 50px; /* Adjust the top margin */  
        }

        /* Styles for the form elements */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .textbox {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
            color: #5e4e4e;
        }

        .textbox:focus {
            border-color: #007bff;
        }

        .textbox::placeholder {
            color: #333;
        }

        .textbox:focus::placeholder {
            color: transparent;
        }

        .button {
            background-color: #5e4e4e;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #fe8b00;
        }

        .status {
            display: block;
            margin-top: 10px;
            color: #28a745;
            font-size: 16px;
        }

        .error {
            color: #dc3545;
        }

        /* Center the heading */
        h2 {
            text-align: center;
            font-size: 22px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-form">
        <h2>Contact Us</h2>
        <div class="form-group">
            <label for="txtFrom">From (Your Email)</label>
            <asp:TextBox ID="txtFrom" runat="server" CssClass="textbox" placeholder="Enter your email address" type="email"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtSubject">Subject</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="textbox" placeholder="Enter email subject"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtMessage">Message</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="5" placeholder="Enter your message"></asp:TextBox>
        </div>
        <asp:Button ID="btnSend" runat="server" CssClass="button" Text="Send" OnClick="btnSend_Click" />
        <asp:Label ID="lblStatus" runat="server" CssClass="status"></asp:Label>
    </div>
</asp:Content>
