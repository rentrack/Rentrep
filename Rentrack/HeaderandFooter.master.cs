﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HeaderandFooter : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            loginlink.Text = "Logout";
        }

    }
        protected void Loginlinkbutton(object sender, EventArgs e)
        {
            if (Session["email"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            else if (Session["email"] != null)
                {
                    Session["email"] = null;
                    Response.Redirect("~/Default.aspx");
                }
    }
}
