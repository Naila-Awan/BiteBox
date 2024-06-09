<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/BiteBoxRestaurant.Master" AutoEventWireup="true" CodeBehind="MenuManager.aspx.cs" Inherits="BiteBox.RestaurantDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/loginforms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:GridView ID="menuItems" runat="server" OnRowEditing="menuItems_RowEditing" OnRowUpdating="menuItems_RowUpdating" OnRowCancelingEdit="menuItems_RowCancelingEdit" OnRowDeleting="menuItems_rowdeleting" AutoGenerateColumns="False" DataKeyNames="menu_id" EnableViewState="False">
    <Columns>
        <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="editButton" />
        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="deleteButton" />

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

        <asp:BoundField DataField="item_rating" HeaderText="Item rating" ReadOnly="True" />

         <asp:BoundField DataField="ordered_count" HeaderText="Ordered Count" ReadOnly="True" />
    </Columns>

            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
</asp:GridView>

    <div class="loginform" style="">
        
        <br><h2 style="font-size: 20px; margin-bottom: -1rem;"><asp:Label ID="Label1" runat="server" Text="Add menu item:"></asp:Label></h2><br />
        <asp:TextBox ID="textItemName" runat="server" placeholder="Item Name"></asp:TextBox>
        <asp:TextBox ID="txtCateg" runat="server" placeholder="Item Category:"></asp:TextBox>
        <asp:TextBox ID="textItemDescr" runat="server" placeholder="Item Description:"></asp:TextBox>
        <asp:TextBox ID="textItemPrice" runat="server" placeholder="Item Price:"></asp:TextBox>

        <br>
        <asp:Button ID="btnRestLogin" CssClass="loginButton" runat="server" Text="Add" OnClick="btnMenuItem_Click" />
        <br /><asp:Label ID="updateErrorMsgRest" runat="server" Text="" ForeColor="Red" CssClass="labelText"></asp:Label>
        <br>
    </div>


</asp:Content>
