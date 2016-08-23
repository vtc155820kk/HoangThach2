<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="KhachHang.aspx.cs" Inherits="Admin_KhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1" Width="860px">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="user_id" HeaderText="user_id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
        <asp:BoundField DataField="passwd" HeaderText="passwd" SortExpression="passwd" />
        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
        <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
        <asp:BoundField DataField="lv" HeaderText="lv" SortExpression="lv" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KiwanPro %>" DeleteCommand="DELETE FROM [KhachHang] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [KhachHang] ([email], [passwd], [name], [phone], [address], [lv]) VALUES (@email, @passwd, @name, @phone, @address, @lv)" SelectCommand="SELECT [user_id], [email], [passwd], [name], [phone], [address], [lv] FROM [KhachHang]" UpdateCommand="UPDATE [KhachHang] SET [email] = @email, [passwd] = @passwd, [name] = @name, [phone] = @phone, [address] = @address, [lv] = @lv WHERE [user_id] = @user_id">
    <DeleteParameters>
        <asp:Parameter Name="user_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="passwd" Type="String" />
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="phone" Type="Int32" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="lv" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="passwd" Type="String" />
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="phone" Type="Int32" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="lv" Type="Int32" />
        <asp:Parameter Name="user_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

