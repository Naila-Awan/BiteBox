<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/BiteBoxCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerOrders.aspx.cs" Inherits="BiteBox.Customer.CustomerOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/CustomerOrders.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gridOrders" runat="server" AutoGenerateColumns="False" OnRowDataBound="gridOrders_RowDataBound" Width="838px" CssClass="custom-grid" Height="211px">
        <Columns>
            <asp:BoundField DataField="order_id" HeaderText="Order ID" HeaderStyle-CssClass="custom-grid-header" />
            <asp:BoundField DataField="Order_Total" HeaderText="Order Total" HeaderStyle-CssClass="custom-grid-header" />
            <asp:BoundField DataField="order_status" HeaderText="Order Status" HeaderStyle-CssClass="custom-grid-header" />
            <asp:BoundField DataField="rest_name" HeaderText="Restaurant" HeaderStyle-CssClass="custom-grid-header" />

            <asp:TemplateField HeaderText="Items" HeaderStyle-CssClass="custom-grid-header">
                <ItemTemplate>
                    <asp:GridView ID="gridOrderItems" runat="server" AutoGenerateColumns="False" CssClass="custom-grid">
                        <Columns>
                            <asp:BoundField DataField="Category" HeaderText="Category" HeaderStyle-CssClass="custom-grid-header" />
                            <asp:BoundField DataField="item_name" HeaderText="Menu Item" HeaderStyle-CssClass="custom-grid-header" />
                            <asp:BoundField DataField="item_qty" HeaderText="Quantity" HeaderStyle-CssClass="custom-grid-header" />
                        </Columns>
                    </asp:GridView>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle CssClass="custom-grid-footer" />
        <HeaderStyle CssClass="custom-grid-header" />
        <PagerStyle CssClass="custom-grid-pager" />
        <RowStyle CssClass="custom-grid-row" />
        <SelectedRowStyle CssClass="custom-grid-selected" />
        <SortedAscendingCellStyle CssClass="custom-grid-sorted-asc" />
        <SortedDescendingCellStyle CssClass="custom-grid-sorted-desc" />
    </asp:GridView>
</asp:Content>
