<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_mag_basic.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_mag_basic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"/>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="CSS_cus_manage/cus_mag_basic.css" rel="stylesheet" />
    <%--<style>
        #cusmag{
            margin: auto;
             width: 600px;
             margin-top:50px;
           height:auto;
            font-size: 18px;
            font-weight: bold;
        }
        #cusmag h3{
            margin: 0;
            padding: 0;
            display: block;
            text-align: center;
            color: darkblue;
            background-color:palevioletred;
            font-weight: bold;
        }
    
        .auto-style1 {
            height: 44px;
        }
    
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
      <div id="cusmag">
          <h3>客戶基本資料維護</h3>
<table class="table table-bordered ">
 <tr>
     <td>使用者名稱</td>
     <td>
         <asp:TextBox ID="txt_username" runat="server" Width="400px"></asp:TextBox></td>
 </tr>
  <tr>
     <td>帳號</td>
     <td>
         <asp:TextBox ID="txt_useraccount" runat="server" Width="400px"></asp:TextBox></td>
 </tr>
  <tr>
     <td>生日</td>
     <td>
         <asp:TextBox ID="txt_userbirth" runat="server" Width="400px"></asp:TextBox></td>
 </tr>
  <tr>
     <td>手機</td>
     <td>
         <asp:TextBox ID="txt_userphone" runat="server" Width="400px"></asp:TextBox></td>
 </tr>
  <tr>
     <td>住址</td>
     <td>
         <asp:TextBox ID="txt_add" runat="server" Width="400px"></asp:TextBox></td>
 </tr>
  <tr>
     <td class="auto-style1">E-Mail</td>
     <td class="auto-style1">
         <asp:TextBox ID="txt_email" runat="server" Width="400px"></asp:TextBox></td>
 </tr>
    <tr  >
     
     <td  colspan="2" style="vertical-align: middle; text-align: center">
         <asp:Button Cssclass="btn btn-info" ID="btn_submit" runat="server" Text="確定送出" ClientIDMode="AutoID" OnClick="btn_submit_Click" OnClientClick='return confirm("abc")' /> 
         <asp:Button Cssclass="btn btn-info" ID="btn_exit" runat="server" Text="重新填寫" OnClick="btn_exit_Click" />
         </td>
 </tr>
</table>
</div>
    </form>
</body>
</html>
