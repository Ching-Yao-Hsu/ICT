using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICodeTogether
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                PrintScreen();
            }
        }

        protected void PrintScreen()
        {
            ezBtn nav_menubtn = new ezBtn();
            string str_mname = "會員修改";
            string str_admin = "管理介面";
            int admin_isenable;
            int member_isenable;
            if (Request.Cookies["ICT"] != null || Session["savepass"] != null)
            {
                member_isenable = 1;
                nav_menubtn.Menu_isenable(str_mname, member_isenable);
                lkb_login.Visible = false;
                lkb_logout.Visible = true;
                if (Request.Cookies["ICT"] != null)
                {
                    lbl_loginmsg.Text = Request.Cookies["ICT"]["username"].ToString() + "~~你好!!";
                    if (Request.Cookies["ICT"]["username"].ToString() == "Admin")
                    {
                        admin_isenable = 1;
                        member_isenable = 0;
                        nav_menubtn.Menu_isenable(str_mname, member_isenable);
                        nav_menubtn.Menu_isenable(str_admin, admin_isenable);
                    }                     
                }
                else if (Session["username"] != null)
                {
                    if (Session["username"].ToString() == "Admin")
                    {
                        admin_isenable = 1;
                        member_isenable = 0;
                        nav_menubtn.Menu_isenable(str_mname, member_isenable);
                        nav_menubtn.Menu_isenable(str_admin, admin_isenable);
                    }
                    lbl_loginmsg.Text = Session["username"].ToString() + "~~你好!!";
                }
            }
            else
            {
                member_isenable = 0;
                admin_isenable = 0;
                nav_menubtn.Menu_isenable(str_mname, member_isenable);                
                nav_menubtn.Menu_isenable(str_admin, admin_isenable);
                lkb_login.Visible = true;
                lkb_logout.Visible = false;
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["ICT"] != null || Session["savepass"] != null)
            {
                Session["search"] = txt_search.Text.ToString();
                Response.Redirect("Search.aspx");
                //Response.End();
            }
            else
            {
                Response.Redirect("SecondPage/Login.aspx");
                //Response.End();
            }
        }

        protected void lkb_logout_Click(object sender, EventArgs e)
        {
            //HttpCookie myCookie = new HttpCookie("savepass");
            ezBtn nav_menubtn = new ezBtn();
            string str_mname = "會員修改";
            int str_isenable = 0;

            nav_menubtn.Menu_isenable(str_mname, str_isenable);
            Session.Remove("savepass");
            Session.Remove("search");
            Session.Remove("username");
            Response.Cookies["ICT"].Expires = DateTime.Now.AddDays(-1d);
            //myCookie.Expires = DateTime.Now.AddDays(-1d);
            //Response.Cookies.Add(myCookie);
            lkb_login.Visible = true;
            lkb_logout.Visible = false;
            Response.Redirect("HomePage.aspx");
            //Response.Redirect(Request.Url.ToString());
            Response.End();
        }






    }
}