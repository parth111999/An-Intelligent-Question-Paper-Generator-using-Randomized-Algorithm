using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Check;
public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Default2.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        string s = "select TId,TName,TPass,TEmail from Teach where TId ='" + TextBox1.Text + "'";
        con.Open();
        SqlCommand cmd = new SqlCommand(s, con);
        SqlDataReader dr;
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Read();
            string s1 = dr[2].ToString();
            string s2 = TextBox2.Text;
            if (s1 == s2)
            {
                Session["type"] = "user";
                Session["name"] = dr["TName"];
                Session["tid"] = dr["TId"];
                Session["Email"] = dr[2].ToString();
                Response.Redirect("AddQ.aspx");
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Login Successful');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Wrong Password');", true);
            }
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Wrong User ID');", true);
        }
        con.Close();
    }
}