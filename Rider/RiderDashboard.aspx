<%@ Page Title="" Language="C#" MasterPageFile="~/Rider/BiteBoxRider.Master" AutoEventWireup="true" CodeBehind="RiderDashboard.aspx.cs" Inherits="BiteBox.Rider.RiderDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/loginforms.css" rel="stylesheet" />
    <style>
        .container{
            height: 82.2vh;
            width: auto;
        }

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

        .confirmButton {
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            color: white;
            cursor: pointer;
            background-color: #fe8b00;
        }

        .confirmButton:hover {
            background-color: #e47a00;
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
    <div style="display: block;">
        <asp:GridView ID="RiderOrders" runat="server" CssClass="gridView" AutoGenerateColumns="False" OnRowDataBound="gridOrders_RowDataBound" DataKeyNames="order_id" EnableViewState="False" Height="291px" Width="1054px">
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
                        <asp:Button ID="btnConfirmDel" runat="server" CssClass="confirmButton" Text="Confirm Delivery" CommandArgument='<%# Eval("order_id") %>' OnClick="btnConfirmDelivery_Click" />
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
        <div class="loginform">
            <asp:Label ID="riderSalary" runat="server" Text="Balance:"></asp:Label>
            <asp:TextBox ID="riderSalaryvalue" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
    </div>
</asp:Content>
