using OnlineShop.Business;
using OnlineShop.Common;
using OnlineShop.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShop.Admins
{
    public partial class User : System.Web.UI.Page
    {
        public static bool Insert;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        public void BindGrid()
        {
            grdUser.DataSource = UserService.db.User_GetByAll();
            grdUser.DataBind();
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            pnUpdate.Visible = true;
            pnShow.Visible = false;
            ControlClass.ResetControlValues(pnUpdate);
            Insert = true;
        }

        protected void grdUser_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            UserInfo obj = new UserInfo();
            string Id = e.CommandArgument.ToString();
            if (e.CommandName == "Edit")
            {
                Insert = false;
                DataTable dt = UserService.db.User_GetById(Id);
                txtId.Text = Id;
                txtUserName.Text = dt.Rows[0]["UserName"].ToString();
                txtMatKhau.Text = dt.Rows[0]["Password"].ToString();
                txtName.Text = dt.Rows[0]["Name"].ToString();
                ddlRole.SelectedValue = dt.Rows[0]["Rule"].ToString();
                ddlStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
                pnUpdate.Visible = true;
                pnShow.Visible = false;
            }else
            {
                UserService.db.User_Delete(Id);
                BindGrid();
            }
        }

        protected void lbtUpdate_Click(object sender, EventArgs e)
        {
            #region[TestInput]
            if (txtUserName.Text.Trim().Equals(""))
            {
                WebMsgBox.Show("Ban chua nhap ten login");
                txtUserName.Focus();
                return;
            }
            if (txtMatKhau.Text.Trim().Equals(""))
            {
                WebMsgBox.Show("Ban chua nhap password");
                txtMatKhau.Focus();
                return;
            }
            #endregion
            var obj = new UserInfo();
            obj.Id = txtId.Text;
            obj.Name = txtName.Text;
            obj.UserName = txtUserName.Text;
            obj.Password = txtMatKhau.Text;
            obj.Rule = ddlRole.SelectedValue;
            obj.Status = ddlStatus.SelectedValue;
            if (Insert)
            {
                UserService.db.User_Insert(obj);
            }else
            {
                UserService.db.User_Update(obj);
            }
            BindGrid();
            pnUpdate.Visible = false;
            pnShow.Visible = true;
        }

        protected void lbtBack_Click(object sender, EventArgs e)
        {
            pnShow.Visible = true;
            pnUpdate.Visible = false;
        }

        protected void grdUser_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            grdUser.CurrentPageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}