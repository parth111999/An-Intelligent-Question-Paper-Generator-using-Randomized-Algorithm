using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
//using Microsoft.Office.Interop.Word;
using System.Diagnostics;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class Create : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] != null)
            {
                string sel = "select distinct(courseid), coursename from Course";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sel, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                int count1 = ds.Tables[0].Rows.Count;
                if (count1 > 0)
                {
                    for (int i = 0; i < count1; i++)
                    {
                        string courseid = ds.Tables[0].Rows[i][0].ToString();
                        string coursename = ds.Tables[0].Rows[i][1].ToString();
                        course.Items.Add(new ListItem(coursename, courseid));
                    }
                }
                con.Close();
                
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }
    }

   
    
    

    protected void course_SelectedIndexChanged(object sender, EventArgs e)
    {
        error.Visible = false;
        error.Text = "";
        subject.Items.Clear();
        string courseid = course.Text;
        string sel = "select subject from Course where courseid='" + courseid + "'";
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(sel, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        int count1 = ds.Tables[0].Rows.Count;
        if (count1 > 0)
        {
            for (int i = 0; i < count1; i++)
            {
                string subjectname = ds.Tables[0].Rows[i][0].ToString();
                subject.Items.Add(new ListItem(subjectname, subjectname));
            }
        }
    }

    protected void subject_SelectedIndexChanged(object sender, EventArgs e)
    {
        error.Visible = false;
        error.Text = "";
    }

    protected void download_Click(object sender, EventArgs e)
    {
        string sel = "select coursename from Course where courseid='"+course.Text+"'";
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(sel, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string cname = ds.Tables[0].Rows[0][0].ToString();
        con.Close();

        string date = DateTime.Now.ToString("yyyy-MM-dd");
        string text = "";

  /* For UNIT Test */
        if(DropDownList1.Text == "1")
        {
            string errorText = "<span style='font-size: 20px; font-weight: bold;'>Question Paper can not be generated due to following reasons:</span><br/>";
            int errorCount = 0;
            text += "<p align='center'><strong> MGM College of Engineering & Technology</strong></p>";
            text += "<p align='center'><strong> Navi Mumbai, Kamothe </strong></p>";
            text += "<p align = 'center'><u> TEST </u></p> ";
            text += "<table class='table' align ='right' style='width: 46%'><tbody><tr><td style='text-align: right;'>Enrol No.</td><td colspan='2' style='border:2px solid black; width: 60%'></td></tr></tbody></table><br/> ";
            text += "<p><strong> Course : " + cname + "</strong ></p>";
            text += "<p><strong> Subject : Code: " + subject.Text + "[" + TextBox3.Text + "]</strong></p> ";
            text += "<p><strong> Duration : " + DropDownList7.Text + "</strong ></p> ";
            text += "<table class='table' style='width: 100%'><tbody><tr><td style='width: 80%;text-align: left;'><strong> Total Marks:  30[Max.]</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong>Date:" + date + " </strong></td></tr></tbody></table><br/> ";
            text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.1) Attempt any five of the following.</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (10) </strong></td></tr></tbody></table> ";

            string fsel = "select top 6 * from Ques where Difficulty='" + difficulty.Text + "' and marks = '2' and Course = '" + course.Text + "' and Subject = '" + subject.Text + "' Order by NEWID();";
            con.Open();
            SqlDataAdapter da1 = new SqlDataAdapter(fsel, con);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            con.Close();
            int count = ds1.Tables[0].Rows.Count;
            if (count > 0 && count == 6)
            {
                int alpha = 097;
                for (int i = 0; i < count; i++)
                {
                    char a = Convert.ToChar(alpha);
                    string ques = ds1.Tables[0].Rows[i][2].ToString();
                    text += "<p>" + a + ") " + ques + "</p>";
                    alpha++;
                }
            }
            else
            {
                errorText += "Kindly add more questions for " + subject.Text + " in " + difficulty.Text + " Level for 2 marks<br/>";
                errorCount++;
            }

            string ssel = "select top 2 * from Ques where Difficulty='" + difficulty.Text + "' and marks = '4' and Course = '" + course.Text + "' and Subject = '" + subject.Text + "' Order by NEWID();";
            con.Open();
            SqlDataAdapter da2 = new SqlDataAdapter(ssel, con);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            con.Close();
            int count1 = ds2.Tables[0].Rows.Count;
            if (count1 > 0 && count1 == 2)
            {
                string ques = ds2.Tables[0].Rows[0][2].ToString();
                text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.2) a) " + ques + "</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (04) </strong></td></tr></tbody></table> ";
                text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b) Attempt any one of the following. </strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (06) </strong></td></tr></tbody></table> ";
            }
            else
            {
                errorText += "Kindly add more questions for " + subject.Text + " in " + difficulty.Text + " Level for 4 marks<br/>";
                errorCount++;
            }

            string tsel = "select top 4 * from Ques where Difficulty='" + difficulty.Text + "' and marks = '6' and Course = '" + course.Text + "' and Subject = '" + subject.Text + "' Order by NEWID();";
            con.Open();
            SqlDataAdapter da3 = new SqlDataAdapter(tsel, con);
            DataSet ds3 = new DataSet();
            da3.Fill(ds3);
            int count2 = ds3.Tables[0].Rows.Count;
            if (count2 > 0 && count2 == 4)
            {
                string ques1 = ds3.Tables[0].Rows[0][2].ToString();
                string ques2 = ds3.Tables[0].Rows[1][2].ToString();
                text += "<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) " + ques1 + "</p>";
                text += "<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) " + ques2 + "</p>";
                string ques3 = ds2.Tables[0].Rows[1][2].ToString();
                text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.3) a) " + ques3 + "</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (04) </strong></td></tr></tbody></table> ";
                text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b) Attempt any one of the following. </strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (06) </strong></td></tr></tbody></table> ";
                string ques4 = ds3.Tables[0].Rows[2][2].ToString();
                string ques5 = ds3.Tables[0].Rows[3][2].ToString();
                text += "<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) " + ques4 + "</p>";
                text += "<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) " + ques5 + "</p>";
            }
            else
            {
                errorText += "Kindly add more questions for " + subject.Text + " in " + difficulty.Text + " Level for 6 marks<br/>";
                errorCount++;
            }
            con.Close();

            if (errorCount != 0)
            {
                error.Visible = true;
                error.Text = errorText;
            }
            else
            {
                string s = "select top 1 QId From QLog ORDER BY QId Desc";
                con.Open();
                string qid = "";
                SqlCommand cmd = new SqlCommand(s, con);
                object c = cmd.ExecuteScalar();
                if (c != null)
                {
                    int i = Convert.ToInt32(c);
                    i++;
                    qid = i.ToString();
                }
                else
                {
                    qid = "101";
                }
                con.Close();

                string ins = "insert into QLog (QId, QName, QCode, Date, Course, Subject) Values ('" + qid + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + date + "', '" + cname + "', '" + subject.Text + "')";
                SqlCommand cm = new SqlCommand(ins, con);
                con.Open();
                cm.ExecuteNonQuery();
                con.Close();

                var strBody = new StringBuilder();
                AddFormatting(strBody, text);
                DownloadWord(strBody.ToString());
            }
            
        }

 /* For Semester */
        else
        {
            semester();
        }
    }


    private void semester()
    {
        string sel = "select coursename from Course where courseid='" + course.Text + "'";
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(sel, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        string cname = ds.Tables[0].Rows[0][0].ToString();
        con.Close();

        string date = DateTime.Now.ToString("yyyy-MM-dd");
        string text = "";

        string errorText = "<span style='font-size: 20px; font-weight: bold;'>Question Paper can not be generated due to following reasons:</span><br/>";
        int errorCount = 0;

        text += "<table class='table' style='width: 100%'><tbody><tr><td style='text-align: left;'>MGM College of Engineering & Technology</td><td style='text-align: right;'>Enrol No.</td><td colspan='2' style='border:2px solid black; width: 15%'></td></tr>";
        text += "<tr><td style='text-align: left;'>NAVI-MUMBAI KAMOTHE  </td><td style='text-align: left;'><strong><u> WINTER  2022 </u></strong></td><td colspan='2'></td></tr></tbody></table><br/>";
        text += "<p align='center'><strong> SEMESTER EXAMINATION IN "+cname+" </strong></p>";
        text += "<table class='table' style='width: 100%'><tbody><tr><td style='text-align: left;'>Time Allowed: " + DropDownList7.Text + "</td><td style='text-align: right;'>Max Marks</td><td colspan='2' style='width: 15%'>100</td></tr></tbody></table><br/>";
        text += "<p align='center'><strong> SUBJECT & CODE : "+subject.Text+" ["+TextBox3.Text+"] </strong></p>";
        text += "<p align='left'><strong>INSTRUCTIONS</strong></p>";
        text += "<p>1) Instruction 1</p><p>2) Instruction 2</p><p>3) Instruction 3</p><p>4) Instruction 4</p> ";

 /*section1 */
        text += "<p align='center'><strong><u>SECTION I</u></strong></p>";
        
        text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.1) Attempt any six of the following.</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (18) </strong></td></tr></tbody></table> ";


        string fsel = "select top 16 * from Ques where Difficulty='" + difficulty.Text + "' and marks = '3' and Course = '" + course.Text + "' and Subject = '" + subject.Text + "' Order by NEWID();";
        con.Open();
        SqlDataAdapter da1 = new SqlDataAdapter(fsel, con);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        con.Close();
        int count = ds1.Tables[0].Rows.Count;
        string section21 = "";
        string section22 = "";
        string section23 = "";
        string section24 = "";
        if (count > 0 && count == 16)
        {
            
            int alpha = 097;
            for (int i = 0; i < 8; i++)
            {
                char a = Convert.ToChar(alpha);
                string ques = ds1.Tables[0].Rows[i][2].ToString();
                text += "<p>" + a + ") " + ques + "</p>";
                alpha++;
            }
            int alpha2 = 097;
            for (int i = 8; i < 16; i++)
            {
                char a = Convert.ToChar(alpha2);
                string ques = ds1.Tables[0].Rows[i][2].ToString();
                section21 += "<p>" + a + ") " + ques + "</p>";
                alpha2++;
            }
        }
        else
        {
            errorText += "Kindly add more questions for " + subject.Text + " in " + difficulty.Text + " Level for 3 marks<br/>";
            errorCount++;
        }

        text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.2) Attempt any four of the following.</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (16) </strong></td></tr></tbody></table> ";
        string sell = "select top 14 * from Ques where Difficulty='" + difficulty.Text + "' and marks = '4' and Course = '" + course.Text + "' and Subject = '" + subject.Text + "' Order by NEWID();";
        con.Open();
        SqlDataAdapter daa = new SqlDataAdapter(sell, con);
        DataSet dss = new DataSet();
        daa.Fill(dss);
        con.Close();
        int countt = dss.Tables[0].Rows.Count;
        if (countt > 0 && countt == 14)
        {
            int alpha = 097;
            for (int i = 0; i < 5; i++)
            {
                char a = Convert.ToChar(alpha);
                string ques = dss.Tables[0].Rows[i][2].ToString();
                text += "<p>" + a + ") " + ques + "</p>";
                alpha++;
            }
            text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.3) (A) Attempt the following</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (08) </strong></td></tr></tbody></table> ";
            int alpha1 = 097;
            for (int i = 5; i < 7; i++)
            {
                char a = Convert.ToChar(alpha1);
                string ques = dss.Tables[0].Rows[i][2].ToString();
                text += "<p>" + a + ") " + ques + "</p>";
                alpha1++;
            }
            int alpha3 = 097;
            for (int i = 7; i < 12; i++)
            {
                char a = Convert.ToChar(alpha3);
                string ques = dss.Tables[0].Rows[i][2].ToString();
                section22 += "<p>" + a + ") " + ques + "</p>";
                alpha3++;
            }
            int alpha4 = 097;
            for (int i = 12; i < 14; i++)
            {
                char a = Convert.ToChar(alpha4);
                string ques = dss.Tables[0].Rows[i][2].ToString();
                section23 += "<p>" + a + ") " + ques + "</p>";
                alpha4++;
            }
        }
        else
        {
            errorText += "Kindly add more questions for " + subject.Text + " in " + difficulty.Text + " Level for 4 marks<br/>";
            errorCount++;
        }

        

        text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> (B) Attempt any one of the following</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (08) </strong></td></tr></tbody></table> ";
        string sel2 = "select top 4 * from Ques where Difficulty='" + difficulty.Text + "' and marks = '8' and Course = '" + course.Text + "' and Subject = '" + subject.Text + "' Order by NEWID();";
        con.Open();
        SqlDataAdapter da2 = new SqlDataAdapter(sel2, con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        con.Close();
        int count2 = ds2.Tables[0].Rows.Count;
        if (count2 > 0 && count2 == 4)
        {
            int alpha = 097;
            for (int i = 0; i < 2; i++)
            {
                char a = Convert.ToChar(alpha);
                string ques = ds2.Tables[0].Rows[i][2].ToString();
                text += "<p>" + a + ") " + ques + "</p>";
                alpha++;
            }
            int alpha5 = 097;
            for (int i = 2; i < 4; i++)
            {
                char a = Convert.ToChar(alpha5);
                string ques = ds2.Tables[0].Rows[i][2].ToString();
                section24 += "<p>" + a + ") " + ques + "</p>";
                alpha5++;
            }
        }
        else
        {
            errorText += "Kindly add more questions for " + subject.Text + " in " + difficulty.Text + " Level for 8 marks<br/>";
            errorCount++;
        }

/*section2 */
        text += "<p align='center'><strong><u>SECTION II</u></strong></p>";
        text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.1) Attempt any six of the following.</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (18) </strong></td></tr></tbody></table> ";
        text += section21;

        text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.2) Attempt any four of the following.</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (16) </strong></td></tr></tbody></table> ";
        text += section22;


        text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> Q.3) (A) Attempt the following</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (08) </strong></td></tr></tbody></table> ";
        text += section23;

        text += "<table class='table' style='width: 100%'><tbody><tr><td style = 'width: 80%;text-align: left;'><strong> (B) Attempt any one of the following</strong></td><td colspan = '2' style='width: 20%; text-align: right;'><strong> (08) </strong></td></tr></tbody></table> ";
        text += section24;
        

        if (errorCount != 0)
        {
            error.Visible = true;
            error.Text = errorText;
        }
        else
        {
            string s = "select top 1 QId From QLog ORDER BY QId Desc";
            con.Open();
            string qid = "";
            SqlCommand cmd = new SqlCommand(s, con);
            object c = cmd.ExecuteScalar();
            if (c != null)
            {
                int i = Convert.ToInt32(c);
                i++;
                qid = i.ToString();
            }
            else
            {
                qid = "101";
            }
            con.Close();
            string ins = "insert into QLog (QId, QName, QCode, Date, Course, Subject) Values ('" + qid + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + date + "', '" + cname + "', '" + subject.Text + "')";
            SqlCommand cm = new SqlCommand(ins, con);
            con.Open();
            cm.ExecuteNonQuery();
            con.Close();
            var strBody = new StringBuilder();
            AddFormatting(strBody, text);
            DownloadWord(strBody.ToString());
            
        }

       
    }

    private void DownloadWord(string strBody)
    {
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Charset = "";
        HttpContext.Current.Response.ContentType = "application/msword";
        string strFileName = TextBox2.Text + " " + TextBox3.Text + ".doc";
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

    protected void mail_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            mail.From = new MailAddress("parthshah111999@gmail.com");
            mail.To.Add(TextBox7.Text);
            mail.Subject = "New Question Paper";
            mail.Body = "Question Paper";
        
            System.Net.Mail.Attachment attachment;
            attachment = new System.Net.Mail.Attachment("C:\\Users\\parth\\Downloads\\" + TextBox2.Text + " " + TextBox3.Text + ".doc");
            mail.Attachments.Add(attachment);

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("parthxxxxxxxxxx", "parthxxxxxxx");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }
    }
}
