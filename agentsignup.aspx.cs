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

public partial class agentsignup : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
	
	}

	protected void agsignupbtn_Click(object sender, EventArgs e)
	{
		String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
		using (SqlConnection con = new SqlConnection(CS))
		{
			SqlCommand cmd=new SqlCommand("INSERT INTO [User](f_name, l_name, address,  city_id, dob, phone_no, password, email) VALUES ('" + fname.Text + "','" + lname.Text + "','" + agentaddress.Text + "','" + agentcity.Text + "','" + agentdob.Text + "','" + agentphone.Text + "','" + agentemail.Text + "','" + agentpass.Text + "')", con);
			con.Open();
			cmd.ExecuteNonQuery();
			lmsg.Text = "Registration Successfull";
			lmsg.ForeColor = Color.Green;
			Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Your account has been created successfully');", true);


		}
	}
}