<%@ Page Title="" Language="C#" MasterPageFile="~/Restaurant/BiteBoxRestaurant.Master" AutoEventWireup="true" CodeBehind="RestaurantOrders.aspx.cs" Inherits="BiteBox.Restaurant.RestaurantOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container{
            height: 79.3vh;
            width: auto;
            margin-left: 19rem;
        }
        .custom-grid {
            background-color: white;
            margin-top: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px 0 #333;
            border-collapse: collapse;
            width: 100%;
        }

        .custom-grid th {
            background-color: #5e4e4e;
            color: white;
            padding: 8px;
            text-align: left;
        }

        .custom-grid td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .custom-grid tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .custom-grid tr:hover {
            background-color: #ddd;
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
    <asp:GridView ID="gridOrders" runat="server" AutoGenerateColumns="False" OnRowDataBound="gridOrders_RowDataBound" Width="838px" CssClass="custom-grid">
        <Columns>
            <asp:BoundField DataField="order_id" HeaderText="Order ID" HeaderStyle-CssClass="custom-grid-header" />
            <asp:BoundField DataField="Cust_id" HeaderText="Customer ID" HeaderStyle-CssClass="custom-grid-header" />
            <asp:BoundField DataField="Order_Total" HeaderText="Order Total" HeaderStyle-CssClass="custom-grid-header" />
            <asp:BoundField DataField="rider_id" HeaderText="Rider ID" HeaderStyle-CssClass="custom-grid-header" />
            <asp:BoundField DataField="order_status" HeaderText="Order Status" HeaderStyle-CssClass="custom-grid-header" />
            <asp:TemplateField HeaderText="Items" HeaderStyle-CssClass="custom-grid-header">
                <ItemTemplate>
                    <asp:GridView ID="gridOrderItems" runat="server" AutoGenerateColumns="False" CssClass="custom-grid">
                        <Columns>
                            <asp:BoundField DataField="menu_id" HeaderText="Menu ID" HeaderStyle-CssClass="custom-grid-header" />
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
