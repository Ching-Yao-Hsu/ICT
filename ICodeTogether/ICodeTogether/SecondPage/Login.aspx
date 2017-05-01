<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ICodeTogether.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css3/login.css" rel="stylesheet" />
    <style>
        @media screen and (max-width:480px) {
            .login .header {
                width: 100%;
                margin: auto;
                line-height: 2em;
                letter-spacing: 1px;
                padding-top: 5%;
            }
        }

        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-image: url(../images/login_images/DSC_1134_副本.jpg);
            background-size: cover;
            background-repeat: no-repeat;
        }


        #lbl_message {
            text-align: center;
            width: 300px;
            display: block;
            margin: auto;
        }

        #RequiredFieldValidator1, #RequiredFieldValidator2 {
            margin-left: 5px;
            margin-right: 5px;
        }

        #chb_save, #btn_register {
            display: inline-block;
            padding: 5px;
        }

        .container_savepass {
            text-align: center;
            padding-top: 10px;
            font-size: 10px;
        }

            .container_savepass a {
                text-decoration: none;
            }

        .login_btn {
            /*margin-bottom:10px;*/
        }

        /*.palceholder {
            height:50px;
        }*/


        .header {
            text-align: justify;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <div class="header">
                <h1><strong>登入</strong><a href="../HomePage.aspx"><img src="../images/main/logo_副本_副本.png" width="150" height="60" /></a></h1>
                <p>
                    語言是了解對方的第一個步驟，先進的國家逐
                    漸地將程式語言納為他
                    們小孩必需學習的課程，他們從
                    小開始接觸，程式語言不再只是個媒介，更是訓練邏輯思考重要
                    的一環，所以程式語言已是不可避
                </p>
            </div>
            <div class="col-1">
                <div class="login_table">
                    <table>
                        <tr>
                            <th>帳號</th>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:TextBox ID="txt_account" runat="server" Width="100%" Height="100%" Style="text-align: center" BorderStyle="None" BorderColor="White" placeholder="輸入帳號"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txt_account" Width="5px" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>密碼</th>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:TextBox ID="txt_password" runat="server" Width="100%" Height="100%" TextMode="Password" Style="text-align: center" BorderStyle="None" placeholder="輸入密碼"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txt_password" Width="5px" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="login_btn">
                <asp:Button ID="btn_login" runat="server" Text="登入" Height="40px" OnClick="btn_login_Click" Width="100px" />
            </div>
            <div class="ErrorMessage" style="color: #FF0000">
                <asp:Label ID="lbl_message" runat="server"></asp:Label></div>
            <div class="container_savepass">
                <asp:CheckBox ID="chb_save" runat="server" /><span>記得密碼?</span>
                <a href="Registering.aspx">註冊</a>
            </div>
            <div class="palceholder"></div>
        </div>
    </form>
</body>
</html>
