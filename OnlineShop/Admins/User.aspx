<%@ Page Title="" Language="C#" MasterPageFile="~/Admins/Administrator.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="OnlineShop.Admins.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title">User management</div>
    <asp:Panel ID="pnShow" Width="100%" runat="server">
        <table id="table1" style="border-collapse:collapse; background-color: #DODEFO;">
            <tr>
                <td>
                    <asp:Button ID="btnThem" runat="server" CssClass="btnthem" Text="Add new" OnClick="btnThem_Click" />
                </td>
            </tr>
        </table>
        <asp:DataGrid ID="grdUser" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#033333" Width="100%" OnItemCommand="grdUser_ItemCommand" OnPageIndexChanged="grdUser_PageIndexChanged">
            <AlternatingItemStyle BackColor="White" />
            <HeaderStyle CssClass="trHeader" />
            <Columns>
                <asp:BoundColumn DataField="UserName" HeaderText="Username"></asp:BoundColumn>
                <asp:BoundColumn DataField="Name" HeaderText="Real Name"></asp:BoundColumn>
                <asp:BoundColumn DataField="Rule" HeaderText="Role"></asp:BoundColumn>
                <asp:BoundColumn DataField="Status" HeaderText="Status"></asp:BoundColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>Function</HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbt1" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id") %>' CommandName="Edit" CssClass="edit" ToolTip="Edit" />
                        <asp:LinkButton runat="server" ID="lbt2" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id") %>' CommandName="Delete" CssClass="delete" ToolTip="Delete" OnClientClick="return confirm(Are you sure to delete it ?)" />
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
            <EditItemStyle BackColor="#2461BF" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="#F3F8FE" Font-Bold="true" ForeColor="Blue" HorizontalAlign="Center" Mode="NumericPages" />
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="#33333" />
        </asp:DataGrid>
    </asp:Panel>
    <asp:Panel ID="pnUpdate" runat="server" Visible="False">
        <table id="table2" style="border-collapse:collapse;" cellpadding="0" width="100%" border="0">
            <tr>
                <td width="150" class="name_fild_row">
                    <asp:Label Text="Username" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" /><asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="150" class="name_fild_row">
                    <asp:Label ID="Label1" Text="Password" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtMatKhau" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="150" class="name_fild_row">
                    <asp:Label Text="Real name" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" />
                </td>
            </tr>
           <tr>
                <td width="150" class="name_fild_row">
                    <asp:Label ID="Label2" Text="Rule" runat="server" />
                </td>
                <td>
                    <asp:DropDownList ID="ddlRole" runat="server">
                        <asp:ListItem Value="1">Admin</asp:ListItem>
                        <asp:ListItem Value="2">User</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="150" class="name_fild_row">
                    <asp:Label ID="Label3" Text="Status" runat="server" />
                </td>
                <td>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Value="1">Su dung</asp:ListItem>
                        <asp:ListItem Value="0">Cam su dung</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="150" class="name_fild_row">
                </td>
                <td>
                    <asp:LinkButton ID="lbtUpdate" CssClass="update" runat="server" OnClick="lbtUpdate_Click">Update</asp:LinkButton>
                    <asp:LinkButton ID="lbtBack" CssClass="back" runat="server" OnClick="lbtBack_Click">Back</asp:LinkButton>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
