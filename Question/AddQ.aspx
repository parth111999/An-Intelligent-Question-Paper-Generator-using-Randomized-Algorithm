<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddQ.aspx.cs" Inherits="AddQ" %>

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
        .style1
        {
            text-align: left;
            padding-left: 200px;
            font-size: large;
            font-family: @MS PGothic;
            height: 45px;
        }
        .style2
        {
            text-align: left;
            height: 45px;
        }
    </style>

    <script type="text/javascript">
        function validation()
        {
            var course = document.getElementById("<%=course.ClientID%>").value;
            var subject = document.getElementById("<%=subject.ClientID%>").value;
            var section = document.getElementById("<%=section.ClientID%>").value;
            var difficulty = document.getElementById("<%=DropDownList1.ClientID%>").value;
            
            if (course == "0")
            {
               swal("Kindly select Course");
                return false;
            }
            else if (subject == "0") {
                swal("Kindly select subject");
                return false;
            }
            else if (section == "0") {
                swal("Kindly select section");
                return false;
            }
            else if (difficulty == "0") {
                swal("Kindly select difficulty");
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
            Text="Add Question" CssClass="heading"></asp:Label>
             </td>
         </tr>

            <tr><td colspan="2"><br /></td></tr>

            <tr>
                <td class="style1"> 
                    <asp:Label ID="Label3" runat="server" Text="Question Id " 
                    CssClass="lable"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="TextBox1" 
                        runat="server" ReadOnly="True" CssClass="txt"></asp:TextBox>
                </td>
            </tr>

            <tr><td colspan="2"><br /></td></tr>

            <tr>
                <td class="lab">
                    <asp:Label ID="Label4" runat="server" Text="Your Question" 
                    CssClass="lable"></asp:Label>
                </td>
                <td class="tx"> 
                    <asp:TextBox ID="TextBox2" 
                        runat="server" Height="39px" TextMode="MultiLine" CssClass="txt" required></asp:TextBox>
                </td>
            </tr>

            <tr><td colspan="2"><br /></td></tr>

             <tr>
              <td class="lab"> 
                  <asp:Label ID="Label9" runat="server" Text="Course" 
                  CssClass="lable"></asp:Label>
              </td>
              <td class="tx">
                  <asp:DropDownList ID="course" runat="server" CssClass="txt" AutoPostBack="true" OnSelectedIndexChanged="course_SelectedIndexChanged">
                      <asp:ListItem Value="0">--Select Course --</asp:ListItem>
                  </asp:DropDownList>
                 <%-- <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="course" Display="Dynamic" Operator="NotEqual" ValueToCompare="0" Style="position: static"></asp:CompareValidator>--%>
                  <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Kindly Select Course" InitialValue="0" ControlToValidate="course" ForeColor="Red" ValidationGroup="test"></asp:RequiredFieldValidator>--%>
              </td>
          </tr>

          <tr><td colspan="2"><br /></td></tr>

             <tr>
              <td class="lab">
                   <asp:Label ID="Label7" runat="server" Text="Subject" 
                  CssClass="lable"></asp:Label>
              </td>
              <td class="tx">
                  <asp:DropDownList ID="subject" runat="server" CssClass="txt">
                      <asp:ListItem Value="0">--Select Subject --</asp:ListItem>
                  </asp:DropDownList>
                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Kindly Select Subject" InitialValue="0" ControlToValidate="subject" ForeColor="Red" ValidationGroup="test"></asp:RequiredFieldValidator>--%>
              </td>

          </tr>

          <tr><td colspan="2"><br /></td></tr>

             <%--<tr>
              <td class="lab">
                  <asp:Label ID="Label8" runat="server" Text="Semester Type" 
                  CssClass="lable"></asp:Label>
              </td>
              <td class="tx">
                  <asp:DropDownList ID="semester" runat="server" CssClass="txt" AutoPostBack="true" OnSelectedIndexChanged="semester_SelectedIndexChanged">
                      <asp:ListItem Value="0">--Select Semester Type--</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Kindly Select Semester" InitialValue="0" ControlToValidate="semester" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
          </tr>

          <tr><td colspan="2"><br /></td></tr>--%>

              <tr id="section_data" runat="server">
              <td class="lab"> 
                  <asp:Label ID="Label6" runat="server" Text="Section" 
                  CssClass="lable"></asp:Label>
              </td>
              <td class="tx">
                  <asp:DropDownList ID="section" runat="server" CssClass="txt">
                      <asp:ListItem Value="0">--Select Section --</asp:ListItem>
                      <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                  </asp:DropDownList>
                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Kindly Select Section" InitialValue="0" ControlToValidate="section" ForeColor="Red" ValidationGroup="test"></asp:RequiredFieldValidator>--%>
              </td>
          </tr>

          <tr><td colspan="2"><br /></td></tr>

            <tr>
                <td class="lab">
                    <asp:Label ID="Label5" runat="server" 
                    Text="Difficulty Of Question" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="txt">
                         <asp:ListItem Value="0">--Select Difficulty Level--</asp:ListItem>
                        <asp:ListItem >Easy</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>Hard</asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Kindly Select Difficulty Level" InitialValue="0" ControlToValidate="DropDownList1" ForeColor="Red" ValidationGroup="test"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>

        <tr><td colspan="2"><br /></td></tr>

          <tr>
              <td class="lab"> 
                  <asp:Label ID="Label1" runat="server" Text="Marks" 
                  CssClass="lable"></asp:Label>
              </td>
              <td class="tx">
                  <asp:TextBox ID="TextBox5" 
                      runat="server" CssClass="txt"  type="number" required></asp:TextBox>
              </td>
          </tr>
                
          <tr><td colspan="2"><br /></td></tr>

           <tr>
               <td colspan="2" class="intabular" align="center" width="50%">
               <asp:Button ID="Button2" runat="server" Text="Submit" onclick="Button2_Click" 
                   Height="50px" Width="20%" CssClass="button" OnClientClick="return validation();"/>
               </td>
           </tr>

           <tr><td colspan="2"><br /></td></tr>

         </table>   
       

        
            
    </div>
</asp:Content>