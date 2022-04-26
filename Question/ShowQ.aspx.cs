using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class ShowQ : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\workspace\Question Paper Generator system\Question\App_Data\Question.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlDataAdapter da;
            DataSet ds = new DataSet();
            string po = "select distinct Branch from Ques";
            da = new SqlDataAdapter(po, con);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList5.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
        }
    }
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        Sem.Items.Clear();
        Sem.Items.Add("--Select--");
        SqlDataAdapter da = new SqlDataAdapter("SELECT distinct Sem FROM Ques WHERE (Branch = '" + DropDownList5.Text + "')", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        int i = Convert.ToInt32(ds.Tables[0].Rows.Count);
        for (int j = 0; j < i; j++)
        {
            Sem.Items.Add(ds.Tables[0].Rows[j][0].ToString());
        }
        con.Close();
    }
    protected void Sem_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add("--Select--");
        
        SqlDataAdapter da = new SqlDataAdapter("SELECT distinct Subject FROM Ques WHERE (Sem = '" + Sem.Text + "') And (Branch ='"+DropDownList5.Text+"')", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        int i = Convert.ToInt32(ds.Tables[0].Rows.Count);
        for (int j = 0; j < i; j++)
        {
            DropDownList2.Items.Add(ds.Tables[0].Rows[j][0].ToString());
        }
        con.Close();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        
        string s = "SELECT * FROM Ques WHERE (Branch='" + DropDownList5.Text + "') And (Sem='" + Sem.Text + "') And (Subject='" + DropDownList2.Text + "') Order by Mod ASC";
        SqlDataAdapter da = new SqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}