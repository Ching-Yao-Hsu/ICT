<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_storedhome.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_storedhome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="CSS_cus_manage/cus_storedhome.css" rel="stylesheet" />
   <%-- <style>
        .menu{
            height: 50px;
            width: 400px;
            margin: 0;
            padding: 0;
            
        }
        .menu ul {
            margin: 0;
            padding: 0;
        }
        
        .menu li {
            list-style: none;
            float: left;
        }
        
        .menu a {
            
            display: block;
            width: 150px;
            padding-left: 20px;
            padding-right: 20px;
            text-align: center;
            text-decoration: none;
            font-size: 26px;
            background-color: #00882a;
            color:#efefef;
            transition: 2s all;
        }
        .menu a:hover{
            color: black;
            background-color: #fff9b0;
        }
        .content{
            margin:0;
            padding:0;
        }
    </style>--%>

</head>
<body>
    <form id="form1" runat="server">
         <div class="menu">
        <ul>
            <li><a href="cus_stored.aspx" target="iframe_b">儲值中心</a></li>
            <li><a href="cus_stored_details.aspx" target="iframe_b">交易明細</a></li>
        </ul>
    </div>
    <div class="content">
        <iframe src="cus_stored.aspx"  name="iframe_b"  width="900"  height="900"></iframe>
    </div>
    </form>
</body>
</html>
