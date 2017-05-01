using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Compilation;
using ezICT;


namespace ICodeTogether
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string str_name = "";
            string str_id = "";                

            if (CheckUser(ref str_name,ref str_id))
            {                
                checksave(str_id, str_name);
                checkok();
            }
            else
            {
                checkfalse();
            }
            
        }

        private void checksave(string str_id,string str_name)
        {
            if (chb_save.Checked)
            {
                //HttpCookie myCookie = new HttpCookie("savepass");
                //myCookie.Value = str_id;
                //myCookie.Expires = DateTime.Now.AddMinutes(1);
                //Response.Cookies.Add(myCookie);

                Response.Cookies["ICT"]["savepass"] = str_id;
                Response.Cookies["ICT"].Expires = DateTime.Now.AddMinutes(1);

                Response.Cookies["ICT"]["username"] = str_name;
                Response.Cookies["ICT"].Expires = DateTime.Now.AddMinutes(1);
            }
            else
            {
                
                Session["username"] = str_name;
                Session["savepass"] = str_id;                
            }
        }


        private void checkok()
        {
            string str = "Admin";
            string cookies_username = (Request.Cookies["ICT"] != null)? Request.Cookies["ICT"]["username"].ToString() : null;
            string session_username = (Session["username"] != null) ? Session["username"].ToString() : null;


            //if (Request.Cookies["ICT"] != null && Session["username"] == null)
            //{
            //    cookies_username = Request.Cookies["ICT"]["username"].ToString();
            //}
            //else if(Request.Cookies["ICT"] == null && Session["username"] != null)
            //{
            //    session_username = Session["username"].ToString();
            //}

            if (session_username == str || cookies_username == str)
            {
                Response.Redirect("../AdminPlatform.aspx");
                Response.End();
            }
            else {
                Response.Redirect("../HomePage.aspx");
                Response.End();
            }            
        }

        private void checkfalse()
        {
            if(lbl_message.Text == string.Empty)
            lbl_message.Text = "帳號密碼有誤!!";
        }

        private bool CheckUser(ref string sUerName,ref string sUerID)
        {
            bool bln_checkok = false;
            Ezadonet ezdonet = new Ezadonet();
            try
            {                
                ezdonet.Open();
                ezdonet.CommandText = "SELECT CustName FROM Customer WHERE CustID = @mno AND CustPassword = @mpassword";
                ezdonet.ParametersClear();
                ezdonet.ParametersAdd("@mno", txt_account.Text);
                ezdonet.ParametersAdd("@mpassword", txt_password.Text);
                bln_checkok = ezdonet.HasRow;
                if (bln_checkok)
                {
                    sUerName = ezdonet.GetStringValue("CustName");
                    sUerID = txt_account.Text;
                }
            }
            catch (Exception e)
            {
                lbl_message.Text = e.Message;
            }
            finally
            {
                ezdonet.Close();
            }            

            return bln_checkok;
        }
    }
}