<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/BiteBoxRestaurant.Master" AutoEventWireup="true" CodeBehind="RestaurantOrders.aspx.cs" Inherits="BiteBox.Restaurant.RestaurantOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gridOrders" runat="server" AutoGenerateColumns="False" OnRowDataBound="gridOrders_RowDataBound" Width="838px">
        <Columns>
            <asp:BoundField DataField="order_id" HeaderText="Order ID" />
            <asp:BoundField DataField="Cust_id" HeaderText="Customer ID" />
            <asp:BoundField DataField="Order_Total" HeaderText="Order Total" />
            <asp:BoundField DataField="rider_id" HeaderText="Rider ID" />
            <asp:BoundField DataField="order_status" HeaderText="Order Status" />
            <asp:TemplateField HeaderText="Items">
                <ItemTemplate>
                    <asp:GridView ID="gridOrderItems" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="menu_id" HeaderText="Menu ID" />
                            <asp:BoundField DataField="item_qty" HeaderText="Quantity" />
                        </Columns>
                    </asp:GridView>
                </ItemTemplate>
            </asp:TemplateField>
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
</asp:Content>
