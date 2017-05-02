<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_pwdfix.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_pwdfix" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="CSS_cus_manage/cus_pwdfix.css" rel="stylesheet" />
    <%-- <style>
        .mypwd h3 {
            margin: 0;
            padding: 0;
            display: block;
            width:600px;
            text-align: center;
            color: darkblue;
            background-color: palevioletred;
            font-weight: bold;
        }

        .mypwd {
            margin: auto;
            margin-top:50px;
            width: 600px;
            font-size: 18px;
        }

            .mypwd table {
                width: 600px;
            }

            .mypwd th {
                background-color: lightyellow;
            }

            .mypwd td {
                text-align:center;
            }
    </style>--%>

</head>
<body>
    <form id="form1" runat="server">
        <div class="mypwd">
            <div class="row">

                <div class="col-md-4 ">
                    <h3>修改我的密碼</h3>
                    <table border="1">
                        <tr>
                            <th class="auto-style1">請輸入舊密碼:</th>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:TextBox ID="txt_oldpwd" runat="server"></asp:TextBox></td>

                        </tr>
                        <tr>
                            <td class="auto-style1">請輸入6字元以上的英文或數字</td>

                        </tr>

                        <tr>
                            <th class="auto-style1">輸入新密碼:</th>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:TextBox ID="txt_newpwd" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <th class="auto-style1">新密碼確認:</th>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:TextBox ID="txt_newpwd2" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text=""></asp:Label> </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Button ID="btn_check" class="btn btn-success" runat="server" Text="確認送出" OnClick="btn_check_Click" />
                                <asp:Button ID="btn_exit"  class="btn btn-success" runat="server" Text="重新填寫" OnClick="btn_exit_Click" />
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
