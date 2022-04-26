using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AddQ : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["name"] != null)
            {
                //if (Session["add"] == "add")
                //{
                //    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert(' New Question Saved');", true);
                //    Session["add"] = "";
                //}
                
                string s = "select top 1 QId From Ques ORDER BY QId Desc";
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
                    TextBox1.Text = "1001";
                }
                con.Close();
                string sel = "select distinct(courseid), coursename from Course where teacherid = '" + Session["tid"].ToString() + "'";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sel, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                int count1 = ds.Tables[0].Rows.Count;
                if(count1 > 0)
                {
                    for(int i=0; i< count1; i++)
                    {
                        string courseid =ds.Tables[0].Rows[i][0].ToString();
                        string coursename = ds.Tables[0].Rows[i][1].ToString();
                        course.Items.Add(new ListItem(coursename, courseid));
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('You have not assigned any subject');", true);
                }
               
                //string subject1 = dr["TSubject"].ToString();
                //string[] si = subject1.Split(',');
                //foreach (string sub in si)
                //{
                //    subject.Items.Add(new ListItem(sub, sub));
                //}
                
                con.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
                
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Ques (QId, TId, Ques, Course, Subject, Section, Difficulty, Marks) values (@QId, @TId, @Ques, @Course, @Subject, @Section, @Difficulty, @Marks)", con);
                cmd.Parameters.AddWithValue("@QId", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Ques", TextBox2.Text);
        cmd.Parameters.AddWithValue("@TId",  Session["tid"]);
               cmd.Parameters.AddWithValue("@Course", course.Text);
                cmd.Parameters.AddWithValue("@Subject", subject.Text);
               // cmd.Parameters.AddWithValue("@SemesterType", semester.Text);
                cmd.Parameters.AddWithValue("@Section", section.Text);
                cmd.Parameters.AddWithValue("@Difficulty", DropDownList1.Text);
                cmd.Parameters.AddWithValue("@Marks", TextBox5.Text);

                cmd.ExecuteReader();
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Question Added Successfully!');window.location.href='AddQ.aspx';", true);
            
    }

    //protected void semester_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string semester_type = semester.Text;
    //    if(semester_type == "1")
    //    {
    //        section_data.Visible = false;
    //    }
    //    else
    //    {
    //        section_data.Visible = true;
    //        section.Items.Add(new ListItem("1", "1"));
    //        section.Items.Add(new ListItem("2", "2"));
    //    }
    //}

    protected void course_SelectedIndexChanged(object sender, EventArgs e)
    {
        

        subject.Items.Clear();
        string courseid = course.Text;
        string sel = "select subject from Course where teacherid = '" + Session["tid"].ToString() + "' and courseid='"+courseid+"'";
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
}