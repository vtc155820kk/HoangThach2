<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Gioithieu.aspx.cs" Inherits="Gioithieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">

     <div class="row">
       <iframe src="https://www.google.com/maps/d/embed?mid=11SJ1oDPptaoTsjG_gB5YBhoGqLY&hl=vi" height="480" style="width: 942px"></iframe>
         <br />
         <table style="width:100%;">
             <tr>
                 <td style="width: 74px; height: 22px;" class="input-medium">
         <asp:Label ID="Label1" runat="server" Text="Địa chỉ :"></asp:Label>
                 </td>
                 <td style="height: 22px">
                     <asp:Label ID="Label3" runat="server" Text="Khu đô thị Mỹ Đình 2"></asp:Label>
                 </td>
                 <td style="height: 22px"></td>
             </tr>
             <tr>
                 <td style="width: 74px" class="input-medium">
           <asp:Label ID="Label2" runat="server" Text="SDT :"></asp:Label>
                 </td>
                 <td>
                     <asp:Label ID="Label4" runat="server" Text="0983805032 "></asp:Label>
                 </td>
                 <td>&nbsp;</td>
             </tr>
             <tr>
                 <td style="width: 74px" class="input-medium">&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
             </tr>
         </table>
        </div>
        </div>

</asp:Content>

