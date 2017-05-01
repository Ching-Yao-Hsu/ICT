using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezICT;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Collections;

namespace ICodeTogether.Examination
{
    public partial class TestPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string random_exno;
            string[] array_exno;
            string field_exno = "";
            string cmdParameters = "ExNo";

            if (!IsPostBack)
            {
                string strtopicno = Request.QueryString["TopicNo"];
                Session["TopicNo"] = strtopicno;
                if (Session["Topic_count"] == null)
                {
                    Session["Topic_count"] = 0;
                    random_exno = GetRandom_ExNo();
                    array_exno = ArrayRandomExNo(random_exno);
                    field_exno = array_exno[0];
                    Session["Random_ExNo"] = array_exno;
                    sds_option_AddParameters(cmdParameters, field_exno);
                    PrintTitleContent(field_exno);
                    FindAns(field_exno);
                    lkbtn_next.Visible = false;
                }
                else if (Session["Topic_count"].ToString() == ArrayExNoLength())
                {
                    lkbtn_next.Visible = false;
                    lkbtn_pass.Visible = true;
                    lkbtn_pass.Attributes.Add("class", "btn btn-danger animated swing");
                }
                else
                {
                    array_exno = Session["Random_ExNo"] as string[];
                    int arrayexno_length = array_exno.Length - 1;

                    if (Session["Topic_count"] != null)
                    {
                        for (int i = 1; i < arrayexno_length; i++)
                        {
                            //Response.Write("000000000");
                            if (int.Parse(Session["Topic_count"].ToString()) == i)
                            {
                                field_exno = array_exno[i];
                                Session["Topic_count"] = i;
                            }
                        }
                    }
                    sds_option_AddParameters(cmdParameters, field_exno);
                    PrintTitleContent(field_exno);
                    FindAns(field_exno);
                    lkbtn_next.Visible = false;
                }
            }
            else if (Session["Topic_count"] != null && Session["Random_ExNo"] != null)
            {
                if (Session["Topic_count"].ToString() == ArrayExNoLength())
                {
                    lkbtn_next.Visible = false;
                    lkbtn_pass.Visible = true;
                    lkbtn_pass.Attributes.Add("class", "btn btn-danger animated swing");
                }
                //Response.Write("213213");
            }
        }

        protected void lkbtn_next_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.ToString());
        }

        protected void btn_checktrue_Click(object sender, EventArgs e)
        {
            int i = int.Parse(ViewState["count"].ToString());

            rbl_Option.Attributes.CssStyle.Remove("animated");
            if (rbl_Option.SelectedItem.Value == ViewState["answer"].ToString())
            {
                Session["Topic_count"] = int.Parse(Session["Topic_count"].ToString()) + 1;
                if (Session["Topic_count"].ToString() == ArrayExNoLength())
                {
                    lkbtn_next.Visible = false;
                    lkbtn_pass.Visible = true;
                    lkbtn_pass.Attributes.Add("class", "btn btn-danger animated swing");
                }
                else
                {
                    lkbtn_pass.Visible = false;
                    lkbtn_next.Visible = true;
                }
                lkbtn_next.Attributes.Add("class", "btn btn-success animated zoomIn");
                rbl_Option.Items[i].Attributes.CssStyle.Add("color", "red");
                rbl_Option.Attributes.Add("class", "");
                btn_checktrue.Visible = false;
                //Response.Write(int.Parse(Session["Topic_count"].ToString()));
            }
            else
            {
                rbl_Option.Items[i].Attributes.CssStyle.Add("color", "red");
                rbl_Option.Attributes.Add("class", "animated swing");
            }
        }

        protected void sds_option_AddParameters(string _ExNo, string _field_exno)
        {
            Parameter para = new Parameter();
            para.DefaultValue = _field_exno;
            para.Name = _ExNo;
            sds_option.SelectParameters.Add(para);
        }

        protected void PrintTitleContent(string _field_exno)
        {
            rbl_Option.SelectedIndex = 0;
            string option0 = "", option1 = "";
            GetExOption(ref option0, ref option1, _field_exno);
            lbl_exname.Text = option0;
            lbl_content.Text = option1;
        }

        protected void GetExOption(ref string sOption0, ref string sOption1, string _field_exno)
        {
            string strconn = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            string strcmd = "SELECT ExName,ExContent,ExAnswer FROM Examination WHERE ExNo = @ExNo";
            string parameters_ExNo = _field_exno;
            SqlConnection conn = new SqlConnection(strconn);
            SqlCommand cmd = new SqlCommand(strcmd);

            try
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ExNo", parameters_ExNo);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    sOption0 = dr["ExName"].ToString();
                    sOption1 = dr["ExContent"].ToString();
                    ViewState["answer"] = dr["ExAnswer"].ToString();
                }
                cmd.Cancel();
                dr.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }

        protected void FindAns(string _field_exno)
        {
            string strconn = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            string strcmd = "SELECT ExOption FROM Examination_detail WHERE ExNo = @ExNo";
            string parameters_ExNo = _field_exno;
            SqlConnection conn = new SqlConnection(strconn);
            SqlCommand cmd = new SqlCommand(strcmd);

            try
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ExNo", parameters_ExNo);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    string ans = ViewState["answer"].ToString();
                    int count = 0;
                    string str = "";

                    while (dr.Read())
                    {
                        str = dr["ExOption"].ToString();
                        if (str == ans)
                        {
                            break;
                        }
                        count++;
                    }
                    ViewState["count"] = count;
                }
                cmd.Cancel();
                dr.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }

        //取得RandomExNo字串
        protected string GetRandom_ExNo()
        {
            string strpara = Session["TopicNo"].ToString();
            string strconn = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            string strcmd = "SELECT ExNo FROM Examination WHERE TopicNo = @TopicNo ORDER BY NEWID()";
            string _GetRandom_ExNo = "";
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(strcmd))
                {
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@TopicNo", strpara);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            _GetRandom_ExNo += dr["ExNO"].ToString() + ".";
                        }
                    }
                }
            }
            return _GetRandom_ExNo;
        }

        //將RandomExNo字串分解存入陣列
        protected string[] ArrayRandomExNo(string _RandomExNo)
        {
            char chars = '.';
            string[] TestNo = _RandomExNo.Split(chars);
            return TestNo;
        }

        //抓取陣列長度
        protected string ArrayExNoLength()
        {
            string strexno = GetRandom_ExNo();
            string[] arrayexno = ArrayRandomExNo(strexno);
            string arraylength = (arrayexno.Length - 1).ToString();
            return arraylength;
        }

        protected void lkbtn_pass_Click(object sender, EventArgs e)
        {
            string str_courseno = Session["CourseNo"].ToString();
            Response.Redirect("../Exam.aspx?CourseNo=" + str_courseno);
        }
    }
}