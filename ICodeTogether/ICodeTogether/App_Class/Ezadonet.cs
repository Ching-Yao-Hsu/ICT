using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ezICT
{
    public class Ezadonet
    {
        private SqlConnection _dbconn;
        private SqlCommand _cmd;

        public Ezadonet(){
            _dbconn = new SqlConnection();
            _cmd = new SqlCommand();
            _cmd.Connection = _dbconn;
        }

        public void Open()
        {
            _dbconn.ConnectionString = WebConfigurationManager.ConnectionStrings["ICodeTogetherConnectionString"].ConnectionString;
            _dbconn.Open();
        }

        public void Close()
        {
            _dbconn.Close();
        }

        public SqlConnection dbconn
        {
            get { return _dbconn; }
            set { _dbconn = value; }
        }

        public SqlCommand cmd
        {
            get { return _cmd; }
            set { _cmd = value; }
        }

        public string CommandText
        {
            get { return _cmd.CommandText; }
            set {                
                _cmd.CommandText = value; }
        }

        public bool HasRow
        {
            get
            {
                bool bln_hasrow=false;
                SqlDataReader dr = _cmd.ExecuteReader();
                bln_hasrow = dr.HasRows;
                dr.Close();
                return bln_hasrow;
            }
        }

        public void ParametersClear()
        {
            _cmd.Parameters.Clear();
        }

        public void ParametersAdd(string sParmName, object oValue)
        {            
            _cmd.Parameters.AddWithValue(sParmName, oValue);
        }


        public void ExecuteNonQuery()
        {
            _cmd.ExecuteNonQuery();            
        }

        public string GetStringValue(string sColName)
        {
            string str_name = string.Empty;
            SqlDataReader dr = _cmd.ExecuteReader();

            if (dr.HasRows) {
                dr.Read();
                str_name = (dr[sColName] == null) ? string.Empty : dr[sColName].ToString();
            }
            dr.Close();
            return str_name;
        }

        public int GetIntValue(string sColName)
        {
            int int_value = 0;
            string str_name = GetStringValue(sColName);
            if (!string.IsNullOrEmpty(str_name))
            {
                int_value = int.Parse(str_name);
            }
            return int_value;
        }
    }
}
