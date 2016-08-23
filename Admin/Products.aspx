<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Admin_Products" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 219px;
        }
        .style3
        {
            width: 219px;
            height: 47px;
        }
        .style4
        {
            height: 47px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
<div class="full_w">
	<div class="h_title">Products</div>
    <p><asp:TextBox ID="txtSearch" runat="server" class="text err" 
        Height="20px"></asp:TextBox>

    <asp:DropDownList ID="ddlCat" runat="server" Height="25px">
    </asp:DropDownList>
    <asp:Button ID="btnSearch" runat="server" Text=" Search " 
        onclick="btnSearch_Click" Height="25px" />
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnAddnew" runat="server" Text=" + Add new product " Height="25px" 
        onclick="btnAddnew_Click"/>
        </p>
        <asp:Label ID="lblSuccess" runat="server" 
        Text="<div class='n_ok'><p>Added a product success!</p></div>" />
    <asp:Panel ID="pnlAdd" runat="server">
        <table class="style1">
            <tr>
                <td class="style2">
                    <p>Product name:</p></td>
                <td>
                    <asp:TextBox ID="txtProductname" runat="server" class="text err" 
        Height="20px" Width="90%"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="style2">
                    <p>Category:</p></td>
                <td>

    <asp:DropDownList ID="ddlCat0" runat="server" Height="25px">
    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <p>Product images:</p></td>
                <td class="style4">

                    <asp:FileUpload ID="uplImg" runat="server" Width="90%" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <p>Price:</p></td>
                <td>

                    <asp:TextBox ID="txtPrice" runat="server" class="text err" 
        Height="20px" Width="90%"></asp:TextBox> &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <p>Description:</p></td>
                <td>

                    <asp:TextBox ID="txtDes" runat="server" class="text err" 
        Height="100px" TextMode="MultiLine" Width="90%"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="style2">
                    </td>
                <td>
                    <asp:Button ID="btnOK" runat="server" Height="25px" Text=" Sumit " 
                        onclick="btnOK_Click" />
                </td>
            </tr>
        </table>
       </asp:Panel>
</div>
<asp:GridView ID="GridView1" Width="100%" HorizontalAlign="Center" runat="server" 
                                          DataKeyNames="product_id"  AutoGenerateColumns="False" 
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdatabound="GridView1_RowDataBound" 
        onrowupdating="GridView1_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <ItemTemplate>
                                                        <%# Eval("product_id") %>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="10px"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Images">
                                                    <EditItemTemplate>
                                                        <asp:FileUpload ID="uplImg" runat="server" EnableTheming="True" 
                                                            Font-Size="Smaller" Width="100px" />
                                                        <br />
                                                        <br />
                                                        <asp:TextBox ID="txtImg" runat="server" Width="100px" Text='<%# Eval("product_img") %>'/>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <img src='../<%# Eval("product_img") %>' height="100px" width="100px" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Product name">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtEditName" runat="server" Text='<%# Eval("product_name") %>'  />
                                                    </EditItemTemplate>
                                                    <ItemTemplate >
                                                        <b><%# Eval("product_name") %></b>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="120px"></ItemStyle>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Category">
                                                     <EditItemTemplate>
                                                         <asp:DropDownList ID="ddlCategory" runat="server">
                                                         </asp:DropDownList>
                                                     </EditItemTemplate>
                                                    <ItemTemplate >
                                                        <b><%# Eval("category_name") %></b>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Price">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("price") %>' 
                                                            Width="80px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <font color="red"><%# Eval("price", "{0:0,0}").Replace(",", ".") %> VNĐ</font>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="80px"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Description">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtDescription" runat="server" Height="100px" 
                                                            Text='<%# Eval("description") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate >
                                                        <%# Eval("description") %>
                                                    </ItemTemplate>
                                                    <ItemStyle></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:CommandField ButtonType="Image" HeaderText="Modify" DeleteImageUrl="~/Admin/img/i_delete.png" 
                                                    EditImageUrl="~/Admin/img/i_edit.png" ShowDeleteButton="True" 
                                                    ShowEditButton="True" CancelImageUrl="~/Admin/img/i_delete.png" 
                                                    UpdateImageUrl="~/Admin/img/i_ok.png">
                                                </asp:CommandField>
                                            </Columns>
                                        </asp:GridView>



</div>
</asp:Content>

