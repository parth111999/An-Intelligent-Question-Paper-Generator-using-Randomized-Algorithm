using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class Register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
            if (!IsPostBack)
        {
            
            string s = "select top 1 TId From Teach ORDER BY TId Desc";
            con.Open();
            SqlCommand cmd = new SqlCommand(s, con);
            object count = cmd.ExecuteScalar();
            if (count != null)
            {
                int i = Convert.ToInt32(count);
                i++;
                TextBox1.Text = i.ToString();
            }
            else
            {
                TextBox1.Text = "1";
            }
            con.Close();
            //string sel = "select courseid, coursename from Course";
            //SqlDataAdapter da = new SqlDataAdapter(sel, con);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //int count1 = ds.Tables[0].Rows.Count;
            //if (count1 > 0)
            //{
               
            //    for (int i = 0; i < count1; i++)
            //    {
            //        string id = ds.Tables[0].Rows[i][0].ToString();
            //        string course = ds.Tables[0].Rows[i][1].ToString();
            //        DropDownList1.Items.Add(new ListItem(course, id));
            //    }
            //}
        }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }

    }

    //public string check()
    //{
    //    if (TextBox2.Text == "")
    //    {
    //        return "Please Enter Proper Name";
    //    }
    //    else if (TextBox3.Text == "")
    //    {
    //        return "Please Enter Proper Email";
    //    }
    //    else if (TextBox4.Text == "")
    //    {
    //        return "Please Enter Proper Mobile No";
    //    }
    //    else if (TextBox5.Text == "")
    //    {
    //        return "Please Enter Proper Password";
    //    }
    //    return "OK";
    //}
    protected void Button3_Click(object sender, EventArgs e)
    {
        //string s = check();
        //if (s == "OK")
        //{
        //string d = DropDownList1.Text;
        //string checkbox = this.checkboxCount.Value;
        //if (d != "")
        //{
        //    if (checkbox != "1")
        //    {
        //SqlConnection con = new SqlConnection();
        //con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True

        //string sel = "select coursename from Course where courseid = '"+d+"'";
        //SqlDataAdapter da = new SqlDataAdapter(sel, con);
        //con.Open();
        //DataSet ds = new DataSet();
        //da.Fill(ds);
        //con.Close();
        // string coursename = ds.Tables[0].Rows[0][0].ToString();

        

        string sel = "select * from Teach where TEmail = '" + TextBox3.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(sel, con);
        con.Open();
        DataSet ds = new DataSet();
        da.Fill(ds);
        int count = ds.Tables[0].Rows.Count;
        con.Close();
        if(count == 0)
        {
            
            SqlCommand cmd = new SqlCommand("Insert into Teach (TId,TName,TPass,TMobile,TEmail) values (@TId,@TName,@TPass,@TMobile,@TEmail)", con);
            con.Open();
            cmd.Parameters.AddWithValue("@TId", TextBox1.Text);
            cmd.Parameters.AddWithValue("@TName", TextBox2.Text);
            cmd.Parameters.AddWithValue("@TEmail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@TMobile", TextBox4.Text);
            cmd.Parameters.AddWithValue("@TPass", TextBox5.Text);
            // cmd.Parameters.AddWithValue("@TCourse", coursename);
            // cmd.Parameters.AddWithValue("@TSubject", this.allSubjects.Value);
            cmd.ExecuteReader();
            con.Close();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert(' New Teacher Registred ');window.location.href='Register.aspx';", true);
            string id = TextBox1.Text;
            string pass = TextBox5.Text;
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("parthshah111999@gmail.com");
                mail.To.Add(TextBox3.Text);
                mail.Subject = "Login Credentials";
                mail.IsBodyHtml = true;
                string htmlBody;
                htmlBody = "<h2>User Id: " + id + "</h2><h2>Pass: " + pass + "</h2> ";
                mail.Body = htmlBody;
                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("parthshah111999@gmail.com", "parth@1999");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
       else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert(' This Teacher is already entered!');", true);
        }
        //}
        //    else
        //    {
        //        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Minimum one subject should be selected!');", true);
        //    }
        //}
        //else
        //{
        //    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Course should be selected!');", true);
        //}

        //}
        //else
        //{
        //    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('"+s+"');", true);
        //}
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Login.aspx");
    //}

    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string course = DropDownList1.Text;
    //    SqlConnection con = new SqlConnection();
    //    con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True
        
    //    string sel = "select * from Course where courseid = '"+course+"'";
    //    SqlDataAdapter da = new SqlDataAdapter(sel, con);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds);
    //    int count1 = ds.Tables[0].Rows.Count;
    //    if (count1 > 0)
    //    {
    //        string subject = "", subject1 = "", subject2 = "", subject3 = "", subject4 = "";
    //        string text = "";
    //        for (int i = 0; i < count1; i++)
    //        {
    //             subject = ds.Tables[0].Rows[i][2].ToString();
    //            if(ds.Tables[0].Rows[i][3].ToString() != null)
    //            {
    //                 subject1 = ds.Tables[0].Rows[i][3].ToString();
    //            }
    //            if (ds.Tables[0].Rows[i][4].ToString() != null)
    //            {
    //                 subject2 = ds.Tables[0].Rows[i][4].ToString();
    //            }
    //            if (ds.Tables[0].Rows[i][5].ToString() != null)
    //            {
    //                 subject3 = ds.Tables[0].Rows[i][5].ToString();
    //            }
    //            if (ds.Tables[0].Rows[i][6].ToString() != null)
    //            {
    //                 subject4 = ds.Tables[0].Rows[i][6].ToString();
    //            }
    //            text += "<fieldset id='checkArray' style='border: none;'><input type='checkbox' name='subject' value='" + subject+"' id='subject1'>"+subject+"<br>";
    //            // DropDownList2.Items.Add(new ListItem("--Select Subject--", "--Select Subject--"));
    //            // DropDownList2.Items.Add(new ListItem(subject, subject));
    //            if (subject1 != "")
    //            {
    //                text += "<input type='checkbox' name='subject' value='" + subject1 + "' id='subject2'>" + subject1 + "<br>";
    //            }
    //            else if (subject2 != "")
    //            {
    //                text += "<input type='checkbox' name='subject' value='" + subject2 + "' id='subject3'>" + subject2 + "<br>";
    //            }
    //            if (subject3 != "")
    //            {
    //                text += "<input type='checkbox' name='subject' value='" + subject3 + "' id='subject4'>" + subject3 + "<br>";
    //            }
    //            if (subject4 != "")
    //            {
    //                text += "<input type='checkbox' name='subject' value='" + subject4 + "' id='subject5s'>" + subject4 + "<br>";
    //            }
    //            text += "</fieldset>";
    //        }
    //        Label10.Visible = true;
    //        Label10.Text = text;
    //    }
    //}
}