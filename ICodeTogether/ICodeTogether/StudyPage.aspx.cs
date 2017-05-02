using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace ICodeTogether
{
    public partial class StudyPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckBuy();
                ChangeURL();
            }
        }


        protected void CheckBuy()
        {
            string str_custid = "";
            bool bcheckdb = false;
            string[] arrayCourseNo;
            int count = 0;

            if (Request.Cookies["ICT"] != null )
            {
                str_custid = Request.Cookies["ICT"]["savepass"].ToString();                
            }
            else if (Session["savepass"] != null)
            {
                str_custid = Session["savepass"].ToString();
            }

            arrayCourseNo = Checkdb(str_custid, ref bcheckdb, ref count);
            
            if (bcheckdb)
            {
                for (int i = 0; i < count; i++)
                {
                    switch (arrayCourseNo[i])
                    {
                        case "C001":
                            hyl_Sin.Visible = true;
                            hyl_Sbuy.Visible = false;
                            break;
                        case "C002":
                            hyl_Hin.Visible = true;
                            hyl_Hbuy.Visible = false;
                            break;
                        case "C003":
                            hyl_Cin.Visible = true;
                            hyl_Cbuy.Visible = false;                            
                            break;
                    }
                }
            }
            if (Request.Cookies["ICT"] != null)
            {
                if (Request.Cookies["ICT"]["username"].ToString() == "Admin")
                {
                    hyl_Sin.Visible = true;
                    hyl_Sbuy.Visible = false;
                    hyl_Hin.Visible = true;
                    hyl_Hbuy.Visible = false;
                    hyl_Cin.Visible = true;
                    hyl_Cbuy.Visible = false;
                }
            }
            else if (Session["username"] != null)
            {
                if (Session["username"].ToString() == "Admin")
                {
                    hyl_Sin.Visible = true;
                    hyl_Sbuy.Visible = false;
                    hyl_Hin.Visible = true;
                    hyl_Hbuy.Visible = false;
                    hyl_Cin.Visible = true;
                    hyl_Cbuy.Visible = false;
                }
            }
            
        }

        protected string[] Checkdb(string _strCustID,ref bool _checkdb, ref int _count)
        {
            _checkdb = false;
            string _str_conn = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            string _str_cmd = "SELECT CourseNo FROM Order_Master WHERE CustID = @CustID";
            string[] _str_CourseNo;
            using (SqlConnection conn = new SqlConnection(_str_conn))
            {               
                using (SqlCommand cmd = new SqlCommand(_str_cmd, conn))
                {
                    using (SqlDataAdapter ada = new SqlDataAdapter(_str_cmd, conn))
                    {
                        ada.SelectCommand.Parameters.AddWithValue("@CustID", _strCustID);
                        DataTable dt = new DataTable();
                        ada.Fill(dt);
                        _count = dt.Rows.Count;
                        _str_CourseNo = new string[dt.Rows.Count];
                        if (dt.Columns["CourseNo"] != null)
                        {                            
                            if (dt.Rows.Count > 0)
                            {
                                _checkdb = true;
                                for (int i = 0; i < dt.Rows.Count; i++)
                                {
                                    _str_CourseNo[i] = dt.Rows[i]["CourseNo"].ToString();                                    
                                }                                                                                            
                            }
                            else 
                            {
                                _checkdb = false;
                            }
                        }                        
                    }
                }
            }
            return _str_CourseNo;
        }


        protected void ChangeURL()
        {
            if (Session["savepass"] != null || Request.Cookies["ICT"] != null)
            {
                hyl_Hbuy.NavigateUrl = "cus_mag.aspx";
                hyl_Cbuy.NavigateUrl = "cus_mag.aspx";
                hyl_Sbuy.NavigateUrl = "cus_mag.aspx";
            }
            else
            {
                hyl_Hbuy.NavigateUrl = "SecondPage/Login.aspx";
                hyl_Cbuy.NavigateUrl = "SecondPage/Login.aspx";
                hyl_Sbuy.NavigateUrl = "SecondPage/Login.aspx";
            }
        }
    }
}