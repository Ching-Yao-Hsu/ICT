using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ICodeTogether.Cus_managemant
{
    public partial class cus_myclass : System.Web.UI.Page
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
           
        }
        /// <summary>
        /// 下一步
        /// </summary>

        protected void btn_next_Click(object sender, EventArgs e)
        {
            checkorder();     
        }
       
        /// <summary>
        /// 顯示購買金額
        /// </summary>
        protected void showmoney()
        {
            string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
            string strcmd = "SELECT CoursePrice FROM Course WHERE CourseName=@CourseName";
            SqlConnection Conn = new SqlConnection(strconn);
            Conn.Open();
            using (SqlCommand cmd = new SqlCommand(strcmd, Conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(strcmd, Conn))
                {
                    
                    da.SelectCommand.Parameters.AddWithValue("@CourseName", Radiobtn_courses.SelectedValue);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    lbl_money.Text = dt.Rows[0][0].ToString();
                }
            }         
            Conn.Close(); 
        }
        /// <summary>
        /// 購買明細表顯示
        /// </summary>
        protected void showdetails()
        {
            DateTime currentTime = System.DateTime.Now;
            lbl_date.Text = currentTime.ToString();
            lbl_id.Text = Session["savepass"].ToString();
            lbl_course.Text = Radiobtn_courses.Text;
        
        }
        /// <summary>
        /// 判斷是否購買過
        /// </summary>
        protected void checkorder()
        {
            string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
            SqlConnection Conn = new SqlConnection(strconn);
            Conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT*FROM Order_Master WHERE CustID=@CustID AND CourseNo=(SELECT CourseNo FROM Course WHERE CourseName=@CourseName)", Conn);
            cmd.Parameters.AddWithValue("@CustID", Session["savepass"].ToString());
            cmd.Parameters.AddWithValue("@CourseName", Radiobtn_courses.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('此課程以購買過,請選擇其他課程')", true);

            }
            else
            {
                showdetails();
                showmoney();
                Order_Panel.Visible = true;
            }
        }

        /// <summary>
        /// 新增訂單
        /// </summary>
        protected void InsertOrder()
        {
            string strconn = "Data Source=.;Initial Catalog=ICodeTogether;Integrated Security=True";
            SqlConnection Conn = new SqlConnection(strconn);
            Conn.Open();
            SqlCommand cmd = new SqlCommand("InsertOrder", Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CustID", lbl_id.Text);
            cmd.Parameters.AddWithValue("@OrderDate", DateTime.Parse(lbl_date.Text));
            cmd.Parameters.AddWithValue("@CourseName", lbl_course.Text);
            cmd.ExecuteNonQuery();
            Conn.Close();

        }
        /// <summary>
        /// 輸入訂單進資料庫
        /// </summary>

        protected void btn_buy_Click(object sender, EventArgs e)
        {
           
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertmessage", @"alert('已購買成功,開始使用課程')", true);
            InsertOrder();
            Response.Redirect(Request.Url.ToString());

        }
        /// <summary>
        /// 取消重新整理
        /// </summary>

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.ToString());
        }
    }
}