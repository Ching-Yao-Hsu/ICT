using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ICodeTogether.admin
{
    public partial class CourseModify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (txt_search.Text == string.Empty)
            {
                lv_show.DataSourceID = "sds_show";                
            }
            else
            {
                lv_show.DataSourceID = "sds_search";
            }
            ListView1.DataSourceID = "";
            ListView1.Visible = false;
        }      

        protected void lv_show_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {                
                ListView1.DataSourceID = "sds_selected";
                ListView1.Visible = true;
            }
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            lv_show.DataSourceID = "sds_show";
        }
    }
}