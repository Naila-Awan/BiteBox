<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/BiteBoxCustomer.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BiteBox.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/Cart.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="CartGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="CartID" CssClass="custom-grid" OnRowDeleting="CartGrid_RowDeleting" EnableViewState="False" OnRowCancelingEdit="CartGrid_RowCancelingEdit" OnRowEditing="CartGrid_RowEditing" OnRowUpdating="CartGrid_RowUpdating1" AutoPostBack="true" Width="802px">
        <Columns>
            <asp:TemplateField HeaderText="Cart#" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:Label ID="CartID" runat="server" Text='<%#Bind("CartID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCartID" runat="server" Text='<%#Bind("CartID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Menu Item" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:Label ID="MenuItemName" runat="server" Text='<%#Bind("MenuItemName") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblMenuItemName" runat="server" Text='<%#Bind("MenuItemName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Quantity" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%#Bind("Quantity") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblQuantity" runat="server" Text='<%#Bind("Quantity") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Total Price" HeaderStyle-HorizontalAlign="Left">
                <EditItemTemplate>
                    <asp:Label ID="TotalPrice" runat="server" Text='<%#Bind("TotalPrice") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblTotalPrice" runat="server" Text='<%#Bind("TotalPrice") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" ControlStyle-CssClass="grid-button edit-button" />
            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Delete" ControlStyle-CssClass="grid-button delete-button" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333" />
        <HeaderStyle BackColor="#5e4e4e" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#333" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>

     <div>
        <asp:Label ID="lblTotalPrice" runat="server" CssClass="total-price-label"></asp:Label>
    </div>
    <br />
    <asp:Button ID="Button" runat="server" Text="Confirm Order" CssClass="confirm-order-button" OnClick="ConfirmOrderButton_Click" />
</asp:Content>
