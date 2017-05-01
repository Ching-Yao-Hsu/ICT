using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

namespace ICodeTogether
{
    public partial class Exam : System.Web.UI.Page
    {
                
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                //紀錄Repeater1綁定的SqlDataSource的資料長度
                Session["CourseNo"] =Request.QueryString["CourseNo"];
                Session["count_Exam"] = "0";
                Session["Topic_count"] = null;
                Session["Random_ExNo"] = null;
                Session["TopicNo"] = null;
            }
        }

        protected void rpt_CourseName_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {            
            int num = int.Parse(Session["count_Exam"].ToString());
            string rowsTestNo = string.Empty;
            string rowsTestName = string.Empty;
            //抓取 RepeaterItemEventArgs e 的 DataRowView
            DataRowView dv = (DataRowView)e.Item.DataItem;
            DataRow dr = dv.Row;
            Label lbl = new Label();            
            Repeater rpt = new Repeater();
            //判斷Repeater1內ItemTemplate裡的Control            
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //存取dr.Table內的值
                rowsTestNo = dr.Table.Rows[num]["TestNo"].ToString();
                rowsTestName = dr.Table.Rows[num]["TestName"].ToString();
                //抓取Repeater1裡的Label
                lbl = e.Item.FindControl("lbl_CourseNo") as Label;
                lbl.Text = rowsTestName;
                rpt = e.Item.FindControl("rpt_ExName") as Repeater;
                rpt.DataSource = SetDataSourse(rowsTestNo);
                rpt.DataBind();                
            }
            //將ViewState["count_Exam"]轉換成int後+1再轉成string
            num++;
            Session["count_Exam"] = num.ToString();
        }

        protected object SetDataSourse(string _rowsTestNo)
        {            
            SqlDataSource sds = new SqlDataSource();
            Parameter conp = new Parameter();
            //設定SqlDataSource
            sds.ID = "datasourse";
            sds.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            sds.SelectCommand = "SELECT TopicName,TopicNo FROM Exam_Test_Topic WHERE TestNo = @TestNo";
            //設定SqlDataSource所需的Parameter
            conp.DefaultValue = _rowsTestNo;
            conp.Name = "TestNo";
            sds.SelectParameters.Add(conp);
            return sds;
        }        
    }
}