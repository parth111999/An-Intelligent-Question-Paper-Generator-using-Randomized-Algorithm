<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionLog.aspx.cs" Inherits="QuestionLog" %>

<asp:Content ID="Body" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
    
    <br />
    <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Font-Underline="False" 
        Text="Question Paper Logs" CssClass="heading"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Width="80%" OnRowCommand="GridView1_RowCommand" 
            AutoGenerateColumns="False" >
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
        <Columns>
                        <asp:BoundField HeaderText="Question ID" DataField="QId"/>
                <asp:BoundField HeaderText="Course Name" DataField="Course"/>
             <asp:BoundField HeaderText="Subject Name" DataField="Subject"/>
             <asp:BoundField HeaderText="Question Name" DataField="QName"/>
                <asp:BoundField HeaderText="Question Code" DataField="QCode" />
                <asp:BoundField HeaderText="Date" DataField="Date" />
          <asp:TemplateField>
         <ItemTemplate>

        <asp:LinkButton ID="yes" runat ="server" CommandArgument='<%#Eval("QId")%>' Text ="Delete" CommandName ="yes" ></asp:LinkButton>
      </ItemTemplate>
    </asp:TemplateField>
        </Columns>

    </asp:GridView>
    <br />
    
</div>
</asp:Content>