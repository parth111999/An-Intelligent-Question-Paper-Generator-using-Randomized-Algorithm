<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style>
        .lab {
            text-align: left;
            padding-left: 200px;
            font-size: large;
            font-family: @MS PGothic;
        }

        .tx {
            text-align: left;
        }
    </style>
    <script type="text/javascript">
        function check() {
           <%-- if ($("input:checked").length == 0) {
                $("#<%=checkboxCount.ClientID%>").val('1');
            }
            else {
                $("#<%=checkboxCount.ClientID%>").val(' ');
            }

            var favorite = [];
            $.each($("input[name='subject']:checked"), function () {
                favorite.push($(this).val());
            });
            var subject = favorite.join(", ");
            $("#<%=allSubjects.ClientID%>").val(subject);--%>
        }

       


    </script>
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
                <td colspan="2" align="center">
                    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Font-Underline="False"
                        Text="Add Teacher Details" CssClass="heading"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="lab">
                    <asp:Label ID="Label3" runat="server" Text="User ID :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" CssClass="txt" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Id"
                        ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="lab">
                    <asp:Label ID="Label4" runat="server" Text="Name  :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Name"
                        ForeColor="Red" ControlToValidate="TextBox2" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                        ErrorMessage="Enter Name" ValidationExpression="[a-zA-z]*$"
                        ForeColor="Red" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>--%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="lab">
                    <asp:Label ID="Label5" runat="server" Text="Email  :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txt" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td align="left">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3"
                        ErrorMessage="Invalid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>
            <tr>
                <td class="lab">
                    <asp:Label ID="Label6" runat="server" Text="Mobile No  :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="txt" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td align="left">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4"
                        ErrorMessage="Invalid Mobile No" ValidationExpression="^[7-9]\d{9}$" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>

<%--            <tr>
                <td class="lab">
                    <asp:Label ID="Label1" runat="server" Text="Course  :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Style="padding: 8px;">
                        <asp:ListItem Text="----Select Courses----" Value="" disabled Selected></asp:ListItem>
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
                    <asp:Label ID="Label9" runat="server" Text="Subject  :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:Label ID="Label10" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:HiddenField ID="checkboxCount" runat="server" />
                    <asp:HiddenField ID="subjectValue1" runat="server" />
                    <asp:HiddenField ID="subjectValue2" runat="server" />
                    <asp:HiddenField ID="subjectValue3" runat="server" />
                    <asp:HiddenField ID="subjectValue4" runat="server" />
                    <asp:HiddenField ID="subjectValue5" runat="server" />
                    <asp:HiddenField ID="allSubjects" runat="server" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>--%>
            <tr>
                <td class="lab">
                    <asp:Label ID="Label7" runat="server" Text="Password  :-" CssClass="lable"></asp:Label>
                </td>
                <td class="tx">
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" CssClass="txt" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td align="left">
                    <%--       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Enter Password" ControlToValidate="TextBox5" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <br />
                </td>
            </tr>



            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button3" runat="server" CssClass="button" OnClick="Button3_Click"
                        Text="Add" Height="50px" Width="20%" OnClientClick="check()" />&nbsp;&nbsp;
                    
                </td>
            </tr>
        </table>
    </div>



</asp:Content>
