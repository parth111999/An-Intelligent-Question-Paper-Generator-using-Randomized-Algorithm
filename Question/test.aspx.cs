using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string yourHtmlContent = "<b>Hello!.. </b><i>This is Kaptain!</i>";
        yourHtmlContent += "<center><div><center><table width='100%'><tr><td colspan='2'><center><a href='http://nevonprojects.com/' title='NevonProjects'><img src='images/new%20nevonprojects%20logo2.jpg' alt='NevonProjects' width='17%'></a></center></td></tr><tr><td colspan='2' style='font-family: 'Cursive',, Times, serif; color: #606060;><center>";
        var strBody = new StringBuilder();

        //-- add required formatting to html
        AddFormatting(strBody, yourHtmlContent);

        //-- download file.. of you can write code to save word in any application folder
        DownloadWord(strBody.ToString());
    }

    private void DownloadWord(string strBody)
    {
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Charset = "";
        HttpContext.Current.Response.ContentType = "application/msword";
        string strFileName = "DocumentName" + ".doc";
        HttpContext.Current.Response.AddHeader("Content-Disposition", "inline;filename=" + strFileName);

        HttpContext.Current.Response.Write(strBody);
        HttpContext.Current.Response.End();
        HttpContext.Current.Response.Flush();
    }


    private void AddFormatting(StringBuilder strBody, string yourHtmlContent)
    {
        strBody.Append("<html " +
            "xmlns:o='urn:schemas-microsoft-com:office:office' " +
            "xmlns:w='urn:schemas-microsoft-com:office:word'" +
            "xmlns='http://www.w3.org/TR/REC-html40'>" +
            "<head><title>Time</title>");

        //The setting specifies document's view after it is downloaded as Print
        //instead of the default Web Layout
        strBody.Append("<!--[if gte mso 9]>" +
            "<xml>" +
            "<w:WordDocument>" +
            "<w:View>Print</w:View>" +
            "<w:Zoom>90</w:Zoom>" +
            "<w:DoNotOptimizeForBrowser/>" +
            "</w:WordDocument>" +
            "</xml>" +
            "<![endif]-->");

        strBody.Append("<style>" +
            "<!-- /* Style Definitions */" +
            "@page Section1" +
            "   {size:8.5in 11.0in; " +
            "   margin:1.0in 1.25in 1.0in 1.25in ; " +
            "   mso-header-margin:.5in; " +
            "   mso-footer-margin:.5in; mso-paper-source:0;}" +
            " div.Section1" +
            "   {page:Section1;}" +
            "-->" +
            "</style></head>");

        strBody.Append("<body lang=EN-US style='tab-interval:.5in'>" +
            "<div class=Section1>");
        strBody.Append(yourHtmlContent);
        strBody.Append("</div></body></html>");
    }
}