<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BiteBoxAdmin.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="BiteBox.Admin.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/AdminCustomer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="customer-panel-title">Admin Customer Panel</div>
    <asp:GridView ID="GridViewCustomers" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="Cust_id" OnRowDeleting="GridViewCustomers_RowDeleting" OnRowEditing="GridViewCustomers_RowEditing" OnRowUpdating="GridViewCustomers_RowUpdating" OnRowCancelingEdit="GridViewCustomers_RowCancelingEdit">
        <Columns>
            <asp:BoundField DataField="Cust_id" HeaderText="ID" ReadOnly="True" SortExpression="Cust_id" />
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Cust_Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Cust_Name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Cust_email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Cust_email") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Cust_password") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Cust_password") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone">
                <ItemTemplate>
                    <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Cust_phone") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Cust_phone") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location">
                <ItemTemplate>
                    <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("Cust_location") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtLocation" runat="server" Text='<%# Bind("Cust_location") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <div class="button-group">
                        <asp:Button ID="btnDelete" runat="server" CssClass="button" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Cust_id") %>' />
                        <asp:Button ID="btnEdit" runat="server" CssClass="button" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("Cust_id") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="button-group">
                        <asp:Button ID="btnSave" runat="server" CssClass="button" Text="Save" CommandName="Update" CommandArgument='<%# Eval("Cust_id") %>' />
                        <asp:Button ID="btnCancel" runat="server" CssClass="button" Text="Cancel" CommandName="Cancel" CommandArgument='<%# Eval("Cust_id") %>' />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
