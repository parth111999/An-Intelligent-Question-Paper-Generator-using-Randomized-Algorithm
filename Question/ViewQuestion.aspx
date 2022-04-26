<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewQuestion.aspx.cs" Inherits="ViewQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .view_question td, th{
            padding: 10px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin: 20px;" class="view_question">
        <asp:Label ID="Label2" runat="server" 
                 Font-Size="X-Large" Font-Underline="False" 
            Text="View Question" CssClass="heading"></asp:Label>
        <br/>
        <br/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="QId" HeaderText="QId" SortExpression="QId" />
                <asp:BoundField DataField="Ques" HeaderText="Ques" SortExpression="Ques" />
                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                <asp:BoundField DataField="Difficulty" HeaderText="Difficulty" SortExpression="Difficulty" />
                <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                <asp:TemplateField>
         <ItemTemplate>

        <asp:LinkButton ID="yes" runat ="server" CommandArgument='<%#Eval("QId")%>' Text ="Delete" CommandName ="yes" ></asp:LinkButton>
      </ItemTemplate>
    </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True" 
            SelectCommand="SELECT [QId], [Ques], [Course], [Subject], [Section], [Difficulty], [marks] FROM [Ques] WHERE ([TId] = @TId) ORDER BY QID ASC">
            <SelectParameters>
                <asp:SessionParameter Name="TId" SessionField="tid" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
</asp:Content>

