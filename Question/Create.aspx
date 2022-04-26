<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Create" %>


<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.lab
{
    text-align:left;
    padding-left:200px;
    font-size:large;
    font-family:@MS PGothic;
}
.tx
{
   text-align:left;
   
}
</style>

    <script  type="text/javascript">
        function validation1() {
            var mail = document.getElementById("<%=TextBox7.ClientID%>").value;
            if (mail == "") {
                swal("Kindly enter mail id");
                return false;
            }
        }
        function validation()
        {
            var course = document.getElementById("<%=course.ClientID%>").value;
            var subject = document.getElementById("<%=subject.ClientID%>").value;
            var difficulty = document.getElementById("<%=difficulty.ClientID%>").value;
            var semester = document.getElementById("<%=DropDownList1.ClientID%>").value;
            if(course == "0")
            {
                swal("Kindly select course");
                return false;
            }
            else if (subject == "0") {
                swal("Kindly select subject");
                return false;
            }
            else if (difficulty == "0") {
                swal("Kindly select Difficulty");
                return false;
            }
            else if (semester == "0") {
                swal("Kindly select Semester");
                return false;
            }
        }
        </script>

</asp:Content>

<asp:Content ID="body" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
    
       <table width="80%">

       <tr><td colspan="2"><br /></td></tr>

       <tr>
           <td colspan="2" align="center">
               <asp:Label ID="Label2" runat="server" 
               Font-Size="X-Large" Font-Underline="False" 
            Text="Get Question Paper" CssClass="heading"></asp:Label>
           </td>
       </tr>

       <tr><td colspan="2"><br /></td></tr>

       <tr>
           <td class="lab"> 
               <asp:Label ID="Label8" runat="server" 
               Text="Course  :-" CssClass="lable"></asp:Label>
           </td>
           <td class="tx">
           <asp:DropDownList ID="course" runat="server" AutoPostBack="True" 
         onselectedindexchanged="course_SelectedIndexChanged" 
         CssClass="txt">
            <asp:ListItem Selected="True" Text="--Select--" Value="0" />   
        </asp:DropDownList>
           </td>
       </tr>

    <tr><td colspan="2"><br /></td></tr>

    <tr><td></td><td class="tx">&nbsp;</td></tr>
      
       <tr>
           <td class="lab">
               <asp:Label ID="Label3" runat="server" Text="Subject  :-" 
               CssClass="lable"></asp:Label>
           </td>
           <td class="tx">
             <asp:DropDownList ID="subject" runat="server" AutoPostBack="True"
        onselectedindexchanged="subject_SelectedIndexChanged" CssClass="txt">
               <asp:ListItem Value="0">--Select--</asp:ListItem>
            </asp:DropDownList>
           </td>
       </tr>

       <tr><td colspan="2"><br /></td></tr>

       <tr>
           <td class="lab">
               <asp:Label ID="Label4" runat="server" Text="Difficulty Level  :-" 
               CssClass="lable"></asp:Label>
           </td>
           <td class="tx">
           <asp:DropDownList ID="difficulty" runat="server" DataTextField="Subject" 
        DataValueField="Subject" CssClass="txt">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
               <asp:ListItem>Easy</asp:ListItem>
            <asp:ListItem>Medium</asp:ListItem>
            <asp:ListItem>Hard</asp:ListItem>
        </asp:DropDownList>
           </td>
       </tr>

    <tr><td colspan="2"><br /></td></tr>

           <tr>
           <td class="lab">
               <asp:Label ID="Label5" runat="server" Text="Semester Type  :-" 
               CssClass="lable"></asp:Label>
           </td>
           <td class="tx">
           <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="Subject" 
        DataValueField="Subject" CssClass="txt">
            <asp:ListItem Value="0">--Select--</asp:ListItem>
               <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
        </asp:DropDownList>
           </td>
       </tr>

    <tr><td colspan="2"><br /></td></tr>

    <tr>
        <td class="lab">
            <asp:Label ID="Label9" runat="server" 
            Text="Name Of Question Paper  :-" CssClass="lable"></asp:Label>
        </td>
        <td class="tx">
            <asp:TextBox ID="TextBox2" runat="server" Width="77px" CssClass="txt" required></asp:TextBox>
        </td>
        <td align="left" style="vertical-align:top">
           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>--%>
        </td>
    </tr>

           <tr><td colspan="2"><br /></td></tr>

           <tr>
               <td class="lab">
                   <asp:Label ID="Label10" runat="server" 
                   Text="Question Paper Code  :-" CssClass="lable"></asp:Label>
               </td>
               <td class="tx"> 
                   <asp:TextBox ID="TextBox3" runat="server" Width="80px" CssClass="txt" required></asp:TextBox>
               </td>
               <td align="left" style="vertical-align:top;">
                       <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                           ErrorMessage="Paper Code" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>  </td>--%>
           </tr>

       <tr><td colspan="2"></td></tr>

       <tr><td class="lab">
           <asp:Label ID="Label13" runat="server" 
               Text="Time For Exam  :-" CssClass="lable"></asp:Label>
           </td>
           <td class="tx">
               <asp:DropDownList ID="DropDownList7" runat="server" CssClass="txt">
                    <asp:ListItem>1/2</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>1 1/2</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>2 1/2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>3 1/2</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>4 1/2</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
           </td>
       </tr>

       <tr><td colspan="2"><br /></td></tr>

       <tr>
           <td colspan="2" align="center" class="intabular">
               <asp:Button ID="download" runat="server" Text="Download"  Width="20%" Height="50px"  CssClass="button" OnClientClick="return validation();" OnClick="download_Click"/></td></tr>
              
       </table>
        
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:Label ID="error" runat="server" Text="Label" Visible="false" ForeColor="Red"></asp:Label>

    

    <asp:Panel ID="Panel1" runat="server" Height="182px">
    <table width="80%">
     <tr><td colspan="2"><br /></td></tr>
    
       <tr><td class="lab"><asp:Label ID="Label16" runat="server" Text="Mail To  :-" 
               CssClass="lable"></asp:Label></td><td class="tx"> <asp:TextBox ID="TextBox7" 
                   runat="server" CssClass="txt"></asp:TextBox></td><td align="left" style="vertical-align:top;"> 
           </td></tr>
       <tr><td colspan="2"><br /></td></tr>
       <tr><td colspan="2" align="center"> 
           <asp:Button ID="mail" runat="server"
    Text="Email" Width="20%" Height="50px" CssClass="button" OnClick="mail_Click" OnClientClick="return validation1();"/></td></tr>
    </table>
       
        
       
    </asp:Panel>
    <br />
    <br />
    </asp:Content>