<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="HoaDon.aspx.cs" Inherits="Admin_HoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        width: 101px;
    }
    .auto-style2 {
        width: 180px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div id="main">
        <div class="full_w">
            
         
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="679px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="makh" HeaderText="makh" SortExpression="makh" />
                    <asp:BoundField DataField="tenkh" HeaderText="tenkh" SortExpression="tenkh" />
                </Columns>

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KiwanPro %>" DeleteCommand="DELETE FROM [HoaDon] WHERE [id] = @id" InsertCommand="INSERT INTO [HoaDon] ([id], [makh], [tenkh]) VALUES (@id, @makh, @tenkh)" SelectCommand="SELECT [id], [makh], [tenkh] FROM [HoaDon]" UpdateCommand="UPDATE [HoaDon] SET [makh] = @makh, [tenkh] = @tenkh WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="String" />
                    <asp:Parameter Name="makh" Type="String" />
                    <asp:Parameter Name="tenkh" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="makh" Type="String" />
                    <asp:Parameter Name="tenkh" Type="String" />
                    <asp:Parameter Name="id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            
         
            </div>
          </div>

      <table style="width: 100%;">
          <tr>
              <td class="auto-style1">ID hóa đơn</td>
              <td class="auto-style2">
                  <asp:TextBox ID="txtidhd" runat="server"></asp:TextBox>
              </td>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td class="auto-style1">Mã HD</td>
              <td class="auto-style2">
                  <asp:TextBox ID="txtmahd" runat="server"></asp:TextBox>
              </td>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td class="auto-style1">Mã khách hàng</td>
              <td class="auto-style2">
                  <asp:TextBox ID="txttenkh" runat="server"></asp:TextBox>
              </td>
              <td>
                  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Thêm" />
              </td>
          </tr>
</table>

      <br />
</asp:Content>

