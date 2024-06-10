<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/BiteBoxRestaurant.Master" AutoEventWireup="true" CodeBehind="MenuManager.aspx.cs" Inherits="BiteBox.RestaurantDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/loginforms.css" rel="stylesheet" />
    <style>
    /*------------------GridView---------------------*/
    .gridView {
        margin-top: 2rem;
        background-color: white;
        box-shadow: 0 4px 8px 0 #333;
        border-collapse: collapse;
        width: 100%;
    }

    .gridView th {
        background-color: #5e4e4e;
        color: white;
        padding: 8px;
        text-align: left;
    }

    .gridView td {
        padding: 8px;
        border: 1px solid #ddd;
    }

    .gridView tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .gridView tr:hover {
        background-color: #ddd;
    }

    .editButton, .deleteButton {
        border: none;
        border-radius: 5px;
        padding: 5px 10px;
        color: white;
        cursor: pointer;
        background-color: #fe8b00;
    }

    .editButton:hover, .deleteButton:hover {
        background-color: #e47a00;
    }

    .cont {
        height: 82.2vh;
        /*width: 80vw;*/
    }

    .custom-grid-footer {
        background-color: #F7DFB5;
        color: #8C4510;
    }

    .custom-grid-header {
        background-color: #5e4e4e;
        color: white;
        font-weight: bold;
    }

    .custom-grid-pager {
        color: #8C4510;
        text-align: center;
    }

    .custom-grid-row {
        background-color: white;
        color: #8C4510;
    }

    .custom-grid-selected {
        background-color: #738A9C;
        font-weight: bold;
        color: white;
    }

    .custom-grid-sorted-asc {
        background-color: #FFF1D4;
    }

    .custom-grid-sorted-desc {
        background-color: #F1E5CE;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="menuItems" runat="server" CssClass="gridView" OnRowEditing="menuItems_RowEditing" OnRowUpdating="menuItems_RowUpdating" OnRowCancelingEdit="menuItems_RowCancelingEdit" OnRowDeleting="menuItems_rowdeleting" AutoGenerateColumns="False" DataKeyNames="menu_id" EnableViewState="False" Width="706px">
        <Columns>
            <asp:BoundField DataField="menu_id" HeaderText="Menu ID" ReadOnly="True" />

            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCategory" runat="server" Text='<%# Bind("Category") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Item Name">
                <ItemTemplate>
                    <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("item_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtItemName" runat="server" Text='<%# Bind("item_name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Item Description">
                <ItemTemplate>
                    <asp:Label ID="lblItemDescription" runat="server" Text='<%# Eval("item_description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtItemDescription" runat="server" Text='<%# Bind("item_description") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Item Price">
                <ItemTemplate>
                    <asp:Label ID="lblItemPrice" runat="server" Text='<%# Eval("item_price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtItemPrice" runat="server" Text='<%# Bind("item_price") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="editButton">
                <ControlStyle CssClass="editButton"></ControlStyle>
            </asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="deleteButton">
                <ControlStyle CssClass="deleteButton"></ControlStyle>
            </asp:CommandField>
        </Columns>
        <FooterStyle CssClass="custom-grid-footer" />
        <HeaderStyle CssClass="custom-grid-header" />
        <PagerStyle CssClass="custom-grid-pager" />
        <RowStyle CssClass="custom-grid-row" />
        <SelectedRowStyle CssClass="custom-grid-selected" />
        <SortedAscendingCellStyle CssClass="custom-grid-sorted-asc" />
        <SortedDescendingCellStyle CssClass="custom-grid-sorted-desc" />
    </asp:GridView>

    <div class="cont">
        <div class="loginform">
            <br>
            <h2 style="font-size: 20px; margin-bottom: -1rem;">
                <asp:Label ID="Label1" runat="server" Text="Add menu item:"></asp:Label>
            </h2>
            <br />
            <asp:TextBox ID="textItemName" runat="server" placeholder="Item Name"></asp:TextBox>
            <asp:TextBox ID="txtCateg" runat="server" placeholder="Item Category"></asp:TextBox>
            <asp:TextBox ID="textItemDescr" runat="server" placeholder="Item Description"></asp:TextBox>
            <asp:TextBox ID="textItemPrice" runat="server" placeholder="Item Price"></asp:TextBox>
            <br>
            <asp:Button ID="btnRestLogin" CssClass="loginButton" runat="server" Text="Add" OnClick="btnMenuItem_Click" />
            <br />
            <asp:Label ID="updateErrorMsgRest" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>
            <br>
        </div>
    </div>
</asp:Content>
