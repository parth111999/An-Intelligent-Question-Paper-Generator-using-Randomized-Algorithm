<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="AddCourse" %>

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
            <asp:TableRow runat="server" style="text-align: center"> 
                <asp:TableCell runat="server" ColumnSpan="2" CssClass="heading">Add Course & Subjects</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">
                    Course Id
                </asp:TableCell>
                <asp:TableCell runat="server" >
                    <asp:TextBox ID="cid" runat="server" CssClass="form-control txt" Readonly></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">
                    Course Name
                </asp:TableCell>
                <asp:TableCell runat="server" >
                    <asp:TextBox ID="courseName" runat="server" CssClass="form-control txt" required></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" CssClass="course">
                <asp:TableCell runat="server">
                    Total Subjects:
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:DropDownList ID="subject" runat="server" CssClass="Subject txt" OnSelectedIndexChanged="subject_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow runat="server" style="text-align: center"> 
                <asp:TableCell runat="server">
                    Subject Name
                </asp:TableCell>
                <asp:TableCell runat="server" CssClass="heading">
                    <asp:TextBox ID="TextBox1" runat="server" Placeholder="Subject 1" CssClass="txt" required></asp:TextBox>
                    &nbsp;
                    <asp:DropDownList ID="teacher1" CssClass="txt" runat="server"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" style="text-align: center" ID="second" Visible="false"> 
                 <asp:TableCell runat="server">
                </asp:TableCell>
                <asp:TableCell runat="server" CssClass="heading">
                    <asp:TextBox ID="TextBox2" runat="server" Placeholder="Subject 2" CssClass="txt"></asp:TextBox>
                     &nbsp;
                    <asp:DropDownList ID="teacher2" CssClass="txt" runat="server"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" style="text-align: center" ID="third" Visible="false"> 
                  <asp:TableCell runat="server">
                </asp:TableCell>
                <asp:TableCell runat="server"  CssClass="heading">
                    <asp:TextBox ID="TextBox3" runat="server" Placeholder="Subject 3" CssClass="txt" ></asp:TextBox>
                     &nbsp;
                    <asp:DropDownList ID="teacher3" CssClass="txt" runat="server"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" style="text-align: center" ID="fourth" Visible="false"> 
                 <asp:TableCell runat="server">
                </asp:TableCell>
                <asp:TableCell runat="server"  CssClass="heading">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="txt" Placeholder="Subject 4"></asp:TextBox>
                     &nbsp;
                    <asp:DropDownList ID="teacher4" CssClass="txt" runat="server"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" style="text-align: center" ID="five" Visible="false"> 
                 <asp:TableCell runat="server">
                </asp:TableCell>
                <asp:TableCell runat="server" CssClass="heading">
                    <asp:TextBox ID="TextBox5" runat="server" Placeholder="Subject 5" CssClass="txt"></asp:TextBox>
                     &nbsp;
                    <asp:DropDownList ID="teacher5" CssClass="txt" runat="server"></asp:DropDownList>
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

    <script type="text/javascript">
       
        </script>

</asp:Content>

