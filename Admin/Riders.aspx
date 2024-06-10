<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BiteBoxAdmin.Master" AutoEventWireup="true" CodeBehind="Riders.aspx.cs" Inherits="BiteBox.Admin.Riders" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link href="../Styles/AdminRider.css" rel="stylesheet" />
      <div class="admin-panel-title">
        Admin Rider Panel
    </div>
<asp:GridView ID="GridViewRiders" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="rider_id" OnRowDeleting="GridViewRiders_RowDeleting">
    <Columns>
        <asp:BoundField DataField="rider_id" HeaderText="ID" ReadOnly="True" SortExpression="rider_id" />
        <asp:BoundField DataField="rider_name" HeaderText="Name" SortExpression="rider_name" />
        <asp:BoundField DataField="rider_email" HeaderText="Email" SortExpression="rider_email" />
        <asp:BoundField DataField="rider_license" HeaderText="License" SortExpression="rider_license" />
        <asp:BoundField DataField="rider_phone" HeaderText="Phone" SortExpression="rider_phone" />
        <asp:BoundField DataField="rider_location" HeaderText="Location" SortExpression="rider_location" />
        <asp:BoundField DataField="rider_balance" HeaderText="Balance" SortExpression="rider_balance" />
        <asp:BoundField DataField="rider_rating" HeaderText="Rating" SortExpression="rider_rating" />
        <asp:BoundField DataField="rider_ttl_orders" HeaderText="Total Orders" SortExpression="rider_ttl_orders" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
<asp:Button ID="btnDelete" runat="server" CssClass="button" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("rider_id") %>' />
<asp:Button ID="btnGiveSalary" runat="server" CssClass="button" Text="Add Balance" OnClick="btnGiveSalary_Click" CommandArgument='<%# Eval("rider_id") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
