using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ViewMcq : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] != null)
        {
            if (!IsPostBack)
            {
                
                string s = "select top 15 * From mcq ORDER BY NEWID()";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                int count = ds.Tables[0].Rows.Count;
                string str = "";
                int j = 1;
                if (count != 0 && count == 15)
                {
                    str += "<div id='printarea'><table class='table check' style='width: 80%'>"; 
                    for(int i = 0; i< count; i++)
                    {
                        str += "<tr><td colspan='2'><label class='text' id='question'>" + j + ") " + ds.Tables[0].Rows[i][1].ToString() + "</label></td></tr>";
                        str += "<tr><td><input type='checkbox'/> <label id='option1'>"+ ds.Tables[0].Rows[i][2].ToString() + "</label></td>";
                        str += "<td><input type='checkbox'/> <label id='option2'>" + ds.Tables[0].Rows[i][3].ToString() + "</label></td></tr>";
                        str += "<tr><td><input type='checkbox'/> <label id='option1'>" + ds.Tables[0].Rows[i][4].ToString() + "</label></td>";
                        str += "<td><input type='checkbox'/> <label id='option2'>" + ds.Tables[0].Rows[i][5].ToString() + "</label></td></tr>";
                        str += "<tr><td colspan='2'></td></tr>";
                        j++;
                    }
                        
                    str += "</table></div><center><input type = 'button' id = 'print' value = 'Print' class='button' Height='50px' Width='20%' ></center>";
                    Label2.Text = str;
                    Label2.Visible = true;
                }
                else
                {
                    Label2.Text = "Kindly! add more MCQ Questions";
                    Label2.Visible = true;
                }
                con.Close();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
}