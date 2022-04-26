using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AddMcq : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
            if (!IsPostBack)
            {
               
                string s = "select top 1 mcq_id From mcq ORDER BY mcq_id Desc";
                con.Open();
                SqlCommand cmd = new SqlCommand(s, con);
                object count = cmd.ExecuteScalar();
                if (count != null)
                {
                    int i = Convert.ToInt32(count);
                    i++;
                    mid.Text = i.ToString();
                }
                else
                {
                    mid.Text = "101";
                }
                con.Close();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void add_Click(object sender, EventArgs e)
    {
        
        string insert = "insert into mcq(mcq_id, question, option1, option2, option3, option4) values ('" + mid.Text + "', '" + question.Text + "', '" + option1.Text + "', '" + option2.Text + "', '" + option3.Text + "', '" + option4.Text + "')";
        SqlCommand cmd = new SqlCommand(insert, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Added Successfully!'); window.location.href='AddMcq.aspx';", true);
    }
}