<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BiteBoxAdmin.Master" AutoEventWireup="true" CodeBehind="Resturants.aspx.cs" Inherits="BiteBox.Admin.Resturants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/AdminResturant.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="restaurant-panel-title">
        Admin Restaurant Panel
    </div>
    <asp:GridView ID="GridViewRestaurants" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="rest_id" OnRowDeleting="GridViewRestaurants_RowDeleting" OnRowEditing="GridViewRestaurants_RowEditing" OnRowUpdating="GridViewRestaurants_RowUpdating" OnRowCancelingEdit="GridViewRestaurants_RowCancelingEdit">
        <Columns>
            <asp:BoundField DataField="rest_id" HeaderText="ID" ReadOnly="True" SortExpression="rest_id" />
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("rest_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("rest_name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="rest_password" HeaderText="Password" SortExpression="rest_password" ReadOnly="True" />
            <asp:BoundField DataField="rest_description" HeaderText="Description" SortExpression="rest_description" ReadOnly="True" />
            <asp:TemplateField HeaderText="Location">
                <ItemTemplate>
                    <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("rest_location") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtLocation" runat="server" Text='<%# Bind("rest_location") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("rest_email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("rest_email") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sales_tax" HeaderText="Sales Tax" SortExpression="sales_tax" ReadOnly="True" />
            <asp:BoundField DataField="order_lead_time" HeaderText="Order Lead Time" SortExpression="order_lead_time" ReadOnly="True" />
            <asp:BoundField DataField="delivery_extra_time" HeaderText="Delivery Extra Time" SortExpression="delivery_extra_time" ReadOnly="True" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CssClass="button" Text="Edit" CommandName="Edit" />
                    <asp:Button ID="btnDelete" runat="server" CssClass="button" Text="Delete" CommandName="Delete" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CssClass="button" Text="Update" CommandName="Update" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancel" CommandName="Cancel" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>