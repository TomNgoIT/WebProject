using System;
using System.Web.UI.WebControls;

namespace OnlineShop.Admins
{
    public partial class Administrator : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null) Response.Redirect("~/Admins/login.aspx");
            if (Session["Username"] != null)
            {
                if (int.Parse(Session["Role"].ToString()) == 1)
                    lbthoten.Text = "Hello : " + Session["Username"] + " - Administrator";
                else lbthoten.Text = "Hello : " + Session["Username"] + " - Employees";
            }
        }

        protected void Linkbutton_Click(object sender, EventArgs e)
        {
            LinkButton lbt = (LinkButton)sender;
            Response.Redirect("~/Admins/" + lbt.ID.Trim() + ".aspx");
        }
        protected void lbtthoat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Admins/Login.aspx");
        }
    }
}