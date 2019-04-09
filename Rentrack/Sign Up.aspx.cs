using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.IO;

public partial class Sign_Up : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void signup_btn(object sender, EventArgs e)
    {
        if (tbfname.Text != "" & tblname.Text != "" && tbaddress.Text != "" && tbdcity.Text != "" && tbdob.Text != "" && tbphone.Text != "" && tbpassword.Text != "" && tbemail.Text != "")
        {
            if (tbpassword.Text == tbrepassword.Text)
            {

                String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand com = new SqlCommand("SELECT city_id FROM [City] WHERE city_name = '" + tbdcity.SelectedValue + "'", con);
                    con.Open();
                    int tbcity = (int)com.ExecuteScalar();
                    com.ExecuteNonQuery();
                    com.Parameters.Clear();


                    SqlCommand cmd = new SqlCommand("INSERT INTO [User](f_name, l_name, address, dob, phone_no, password, email, city_id) VALUES ('" + tbfname.Text + "','" + tblname.Text + "','" + tbaddress.Text + "','" + tbdob.Text + "','" + tbphone.Text + "','" + tbpassword.Text + "','" + tbemail.Text + "','" + tbcity + "')", con);
                    cmd.ExecuteNonQuery();
                    lblMsg.Text = "Registration Successfull";
                    lblMsg.ForeColor = Color.Green;
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Your account has been created successfully');", true);
                }

            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Passwords do not match";
            }
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All Fields Are Mandatory";

        }


    }
}