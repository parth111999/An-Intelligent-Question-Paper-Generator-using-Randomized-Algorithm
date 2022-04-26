<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddMcq.aspx.cs" Inherits="AddMcq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .course td{
            padding: 15px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin: 20px;">
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow runat="server" HorizontalAlign="Center">
                <asp:TableCell runat="server" ColumnSpan="2"  CssClass="heading">Add MCQ</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">Id:</asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="mid" runat="server" CssClass="form-control txt" required ReadOnly></asp:TextBox>
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">Question:</asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="question" runat="server" CssClass="form-control txt" required></asp:TextBox>
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">Option1:</asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="option1" runat="server" CssClass="form-control txt" required></asp:TextBox>
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">Option 2:</asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="option2" runat="server" CssClass="form-control txt" required></asp:TextBox>
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">Option 3:</asp:TableCell> 
                <asp:TableCell runat="server"><asp:TextBox ID="option3" runat="server" CssClass="form-control txt" required></asp:TextBox>
</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">Option 4:</asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="option4" runat="server" CssClass="form-control txt" required></asp:TextBox>
</asp:TableCell>
            </asp:TableRow>
             <asp:TableRow runat="server" style="text-align: center"> 
                <asp:TableCell runat="server" ColumnSpan="2" CssClass="heading">
                    <asp:Button ID="add" runat="server" Text="Add" CssClass="button" Height="50px" Width="20%" OnClick="add_Click"
                        />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
</asp:Content>

