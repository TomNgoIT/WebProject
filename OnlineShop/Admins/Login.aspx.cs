using System;
using OnlineShop.Business;
using OnlineShop.Common;
using OnlineShop.Data;

namespace OnlineShop.Admins
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogon_Click(object sender, EventArgs e)
        {
            int qh = UserService.db.User_CheckLogin(txtUsername.Text, /*StringClass.Encrypt(*/txtPassword.Text);
            if (qh > 0)
            {
                Session["Role"] = qh;
                Session["Username"] = txtUsername.Text.Trim();
                Response.Redirect("~/Admins/User.aspx");
            }
            else
            {
                WebMsgBox.Show("Username or Password is not correct! Try again !");
            }
        }
        protected void btnHuyBo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}