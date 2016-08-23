<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ChiTietHD.aspx.cs" Inherits="Admin_ChiTietHD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Width="515px">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KwMobileConnectionString4 %>" DeleteCommand="DELETE FROM [Chitiethoadon] WHERE [id] = @id" InsertCommand="INSERT INTO [Chitiethoadon] ([id], [mahd], [masp], [sotien]) VALUES (@id, @mahd, @masp, @sotien)" SelectCommand="SELECT [id], [mahd], [masp], [sotien] FROM [Chitiethoadon]" UpdateCommand="UPDATE [Chitiethoadon] SET [mahd] = @mahd, [masp] = @masp, [sotien] = @sotien WHERE [id] = @id">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="id" Type="String" />
        <asp:Parameter Name="mahd" Type="String" />
        <asp:Parameter Name="masp" Type="String" />
        <asp:Parameter Name="sotien" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="mahd" Type="String" />
        <asp:Parameter Name="masp" Type="String" />
        <asp:Parameter Name="sotien" Type="String" />
        <asp:Parameter Name="id" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

