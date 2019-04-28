using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.Cookies["email"] != null && Request.Cookies["password"] != null)
            {
                tbemail.Text = Request.Cookies["email"].Value;
                tbpassword.Attributes["value"] = Request.Cookies["email"].Value;
                remembercheck.Checked = true;
            }
        }
    }

    protected void Login_btn(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE email = '" + tbemail.Text + "' and password = '" + tbpassword.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            SqlCommand com = new SqlCommand("SELECT user_id FROM [User] WHERE email = '" + tbemail.Text + "' and password = '" + tbpassword.Text + "'", con);
            int user_id = (int)com.ExecuteScalar();
            com.ExecuteNonQuery();
            com.Parameters.Clear();


            if (dt.Rows.Count != 0)
            {
                if(remembercheck.Checked)
                    {
                        Response.Cookies["user_id"].Value = user_id;
                        Response.Cookies["password"].Value = tbpassword.Text;

                        Response.Cookies["user_id"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
                    }
                else
                    {
                        Response.Cookies["user_id"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);   
                    }

                Session["user_id"] = user_id;
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                lblError.Text = "Email or Password is incorrect!";
            }
        }
    }
}