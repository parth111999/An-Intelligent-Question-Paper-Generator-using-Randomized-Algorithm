<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewMcq.aspx.cs" Inherits="ViewMcq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style type="text/css">
        .check td{
            padding: 6px;
        }
        input[type=checkbox]
{
pointer-events: none;
}
        </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#print").click(function () {
                var printContents = document.getElementById("printarea").innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;
              
            });
        });
        
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin: 20px;">
        <asp:Label ID="Label1" runat="server" Text="Label"  CssClass="heading" style="text-align: left">MCQ Questions</asp:Label>
        <br/>
         <br/>

        <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
</asp:Content>

