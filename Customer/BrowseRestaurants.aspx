<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/BiteBoxCustomer.Master" AutoEventWireup="true" CodeBehind="BrowseRestaurants.aspx.cs" Inherits="BiteBox.BrowseRestaurants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/BrowseRestaurants.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="ItemGrid" runat="server" Height="291px" Width="1054px" CssClass="custom-grid">
        <Columns>
            <asp:TemplateField HeaderText="Add to Cart">
                <ItemTemplate>
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add" CommandName="AddToCart" CommandArgument='<%# Eval("menu_id") %>' OnClick="btnAddToCart_Click" CssClass="add-to-cart-button" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="quantityTextBox"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
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
</asp:Content>
