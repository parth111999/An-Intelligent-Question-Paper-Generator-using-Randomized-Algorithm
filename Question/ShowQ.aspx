<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ShowQ.aspx.cs" Inherits="ShowQ" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style>
        .lab
        {
            text-align: left;
            padding-left: 200px;
            font-size: large;
            font-family: @MS PGothic;
        }
        .tx
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="body" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
        <table width="80%">
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Questions" Font-Size="X-Large" 
                        Font-Underline="False" CssClass="heading"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="lab">
                    <asp:Label ID="Label8" runat="server" Text="Paper for Course  :-" 
                        CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" Height="20px"
                        OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged" Width="118px" 
                        CssClass="txt">
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="lab">
                    <asp:Label ID="Label3" runat="server" Text="Semester  :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:DropDownList ID="Sem" runat="server" AutoPostBack="True" Height="20px" OnSelectedIndexChanged="Sem_SelectedIndexChanged"
                        Width="118px" CssClass="txt">
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="lab">
                    <asp:Label ID="Label4" runat="server" Text="Subject  :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataTextField="Subject" DataValueField="Subject"
                        Height="20px" Width="118px" 
                        OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" CssClass="txt">
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Show" Height="50px"
                        Width="20%" CssClass="button" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                        Width="80%">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
