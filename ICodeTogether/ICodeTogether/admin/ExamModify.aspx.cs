using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICodeTogether.admin
{
    public partial class ExamModify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (txt_search.Text == string.Empty)
            {
                lv_joincourse.DataSourceID = "sds_joincourse";
            }
            else
            {
                lv_joincourse.DataSourceID = "sds_search";
            }
            lv_joinexamination.DataSourceID = "";
            lv_joinexamination.Visible = false;            
        }

        protected void lv_joincourse_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                lv_joinexamination.DataSourceID = "sds_joinexamination";
                lv_joinexamination.Visible = true;                
            }
        }        

        protected void lv_modifyExam_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            lv_joinexamination.DataSourceID = "sds_joinexamination";
        }        
    }
}