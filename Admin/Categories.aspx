<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Admin_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div class="full_w">
	<div class="h_title">Products</div>
    <p><asp:TextBox ID="txtSearch" runat="server" class="text err" 
        Height="20px"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text=" Search " Height="25px" 
            onclick="btnSearch_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnAddnew" runat="server" 
            Text=" + Add new product " Height="25px" onclick="btnAddnew_Click" />
        </p>
        <asp:Label ID="lblSuccess" runat="server" 
        Text="<div class='n_ok'><p>Added a category success!</p></div>" />
    <asp:Panel ID="pnlAdd" runat="server">
        <table class="style1">
            <tr>
                <td class="style2">
                    <p>Mã loại:</p></td>
                <td>
                    <asp:TextBox ID="txtCategory" runat="server" class="text err" 
        Height="20px" Width="90%"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="style2">
                    <p>Nhóm SP:</p></td>
                <td>

    <asp:DropDownList ID="ddlCat0" runat="server" Height="25px">
    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    </td>
                <td>
                    <asp:Button ID="btnOK" runat="server" Height="25px" Text=" Thêm " 
                        onclick="btnOK_Click"  />
                </td>
            </tr>
        </table>
       </asp:Panel>
</div>

        <asp:GridView ID="GridView1" Width="100%" HorizontalAlign="Center" runat="server" 
                                          DataKeyNames="category_id"  
            AutoGenerateColumns="False" onrowdatabound="GridView1_RowDataBound" 
            onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
            onrowupdating="GridView1_RowUpdating" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <ItemTemplate>
                                                        <%# Eval("category_id") %>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="10px"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Categories name">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtEditName" runat="server" Text='<%# Eval("category_name") %>' />
                                                    </EditItemTemplate>
                                                    <ItemTemplate >
                                                        <b><%# Eval("category_name") %></b>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Parent category">
                                                     <EditItemTemplate>
                                                         <asp:DropDownList ID="ddlCategory" runat="server">
                                                         </asp:DropDownList>
                                                     </EditItemTemplate>
                                                    <ItemTemplate >
                                                        <b><%# Eval("parent_id") %></b>                                 
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:CommandField ButtonType="Image" HeaderText="Modify" DeleteImageUrl="~/Admin/img/i_delete.png" 
                                                    EditImageUrl="~/Admin/img/i_edit.png" ShowDeleteButton="True" 
                                                    ShowEditButton="True" CancelImageUrl="~/Admin/img/i_delete.png" 
                                                    UpdateImageUrl="~/Admin/img/i_ok.png">
                                                <ItemStyle HorizontalAlign="Center" />
                                                </asp:CommandField>
                                            </Columns>
           </asp:GridView>
    </div>
</asp:Content>

