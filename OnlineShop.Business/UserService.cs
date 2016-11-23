using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineShop.Data;
using System.Data;

namespace OnlineShop.Business
{
    public class UserService
    {
        public static UserController db = new UserController();
        #region[User_Insert]
        public void User_Insert(UserInfo data)
        {
            db.User_Insert(data);
        }
        #endregion
        #region[User_CheckLogin]
        public int User_CheckLogin(string UserName, string Password)
        {
            return db.User_CheckLogin(UserName, Password);
        }
        #endregion
        #region[User_Update]
        public void User_Update(UserInfo data)
        {
            db.User_Update(data);
        }
        #endregion
        #region[User_Delete]
        public void User_Delete(string id)
        {
            db.User_Delete(id);
        }
        #endregion
        #region[User_GetByAll]
        public DataTable User_GetByAll()
        {
            return db.User_GetByAll();
        }
        #endregion
        #region[User_GetById]
        public DataTable User_GetById(string Id)
        {
            return db.User_GetById(Id);
        }
        #endregion
        #region[User_GetByTop]
        public void User_GetByTop(string Top, string Where, string Order)
        {
            db.User_GetByTop(Top, Where, Order);
        }
        #endregion
    }
}
