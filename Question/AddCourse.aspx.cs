using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AddCourse : System.Web.UI.Page
{
   SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
            if (!IsPostBack)
            {
                
                string s = "select top 1 courseid From Course ORDER BY courseid Desc";
                con.Open();
                SqlCommand cmd = new SqlCommand(s, con);
                object count = cmd.ExecuteScalar();
                if (count != null)
                {
                    int i = Convert.ToInt32(count);
                    i++;
                    cid.Text = i.ToString();
                }
                else
                {
                    cid.Text = "101";
                }
                con.Close();
                string sel = "select TName, TId from Teach";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sel, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                con.Close();
                int count1 = ds.Tables[0].Rows.Count;
                for (int i = 0; i < count1; i++)
                {
                    string tname = ds.Tables[0].Rows[i][0].ToString();
                    string tid = ds.Tables[0].Rows[i][1].ToString();
                    teacher1.Items.Add(new ListItem(tname, tid));
                    teacher2.Items.Add(new ListItem(tname, tid));
                    teacher3.Items.Add(new ListItem(tname, tid));
                    teacher4.Items.Add(new ListItem(tname, tid));
                    teacher5.Items.Add(new ListItem(tname, tid));
                }
            }
            
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void subject_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        string total = subject.Text;
          if(total == "1")
            {
            TextBox1.Visible = true;
            teacher1.Visible = true;
            second.Visible = false;
            third.Visible = false;
            fourth.Visible = false;
            five.Visible = false;
        }
          else if (total == "2")
        {
            TextBox1.Visible = true;
            teacher1.Visible = true;
            second.Visible = true;
            third.Visible = false;
            fourth.Visible = false;
            five.Visible = false;
        }
        else if (total == "3")
        {
            TextBox1.Visible = true;
            teacher1.Visible = true;
            second.Visible = true;
            third.Visible = true;
            fourth.Visible = false;
            five.Visible = false;
        }
        else if (total == "4")
        {
            TextBox1.Visible = true;
            teacher1.Visible = true;
            second.Visible = true;
            third.Visible = true;
            fourth.Visible = true;
            five.Visible = false;
        }
        else if (total == "5")
        {
            TextBox1.Visible = true;
            teacher1.Visible = true;
            second.Visible = true;
            third.Visible = true;
            fourth.Visible = true;
            five.Visible = true;
        }
    }

    protected void add_Click(object sender, EventArgs e)
    {
        int j = 0;
        
        int count = Convert.ToInt32(subject.Text);
        for (int i = 1; i <= count; i++)
        {
            ContentPlaceHolder cph = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
            string subjectn = ((TextBox)cph.FindControl("TextBox" + i + "")).Text;
            if (subjectn == "")
            {
                j++;
            }
        }
        if (j == 0)
        {
            for (int i=1; i<=count; i++)
        {
            ContentPlaceHolder cph = (ContentPlaceHolder)this.Master.FindControl("ContentPlaceHolder1");
            string subjectn = ((TextBox)cph.FindControl("TextBox" + i + "")).Text;
                string teachern = ((DropDownList)cph.FindControl("teacher" + i + "")).Text;

                string ins = "insert into Course (courseid, coursename, subject, teacherid) values ('" + cid.Text + "', '" + courseName.Text + "', '" + subjectn + "', '" + teachern + "')";
                SqlCommand cmd = new SqlCommand(ins, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Added Successfully!'); window.location.href='AddCourse.aspx';", true);
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Total Number of subjects are not equal to total subject names!');", true); 
        }


       
    }
}