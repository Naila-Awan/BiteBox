<%@ Page Title="" Language="C#" MasterPageFile="~/Rider/BiteBoxRider.Master" AutoEventWireup="true" CodeBehind="RiderDashboard.aspx.cs" Inherits="BiteBox.Rider.RiderDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/loginforms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display: block;">
    <asp:GridView ID="RiderOrders" runat="server" AutoGenerateColumns="False" OnRowDataBound="gridOrders_RowDataBound" DataKeyNames="order_id" EnableViewState="False" Height="291px" Width="1054px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
    <Columns>
       
        <asp:BoundField DataField="order_id" HeaderText="Order ID" />
        <asp:BoundField DataField="Cust_name" HeaderText="Customer name" />
        <asp:BoundField DataField="Cust_location" HeaderText="Customer address" />
        <asp:BoundField DataField="rest_name" HeaderText="Restaurant name" />
        <asp:BoundField DataField="rest_location" HeaderText="Restaurant address" />
        <asp:TemplateField HeaderText="Order Total">
            <ItemTemplate>
                <asp:Label ID="txtordertotal" runat="server" Text='<%# Bind("order_total") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Order Status">
            <ItemTemplate>
                <asp:Label ID="txtorderstatus" runat="server" Text='<%# Bind("order_status") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
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
         <asp:TemplateField HeaderText="Order Confirmation">
            <ItemTemplate>
                <asp:Button ID="btnConfirmDel" runat="server" Text="Confirm Delivery" CommandArgument='<%# Eval("order_id") %>' OnClick="btnConfirmDelivery_Click" />
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
        <div class="loginform">
    <asp:Label ID="riderSalary" runat="server" Text="Balance:"></asp:Label>
    <asp:TextBox ID="riderSalaryvalue" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
</asp:Content>
