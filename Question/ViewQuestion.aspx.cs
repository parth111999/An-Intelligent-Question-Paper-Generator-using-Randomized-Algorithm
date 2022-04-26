using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ViewQuestion : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["name"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "yes")
        {
            string i = Convert.ToString(e.CommandArgument.ToString());
            string m = "delete from Ques where QId='" + i + "'";
            SqlCommand cmd;
            cmd = new SqlCommand(m, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Session["delete"] = "delete";
            Response.Redirect("ViewQuestion.aspx");


        }
    }
}