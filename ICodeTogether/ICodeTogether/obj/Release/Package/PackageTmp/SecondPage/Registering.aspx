<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registering.aspx.cs" Inherits="ICodeTogether.Registering" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="zh-tw" />
    <title></title>
    <link href="../css3/registering.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <style>
        @media screen and (min-width:1200px) {
            .container {
                padding-left:60px;
                width: 600px;
                margin: auto;
            }
        }
        @media screen and (max-width:1200px) {
            .container:nth-of-type(1) {
                display:none;
            }
            .registering h1 {
                font-size:50px;
            }            
        }



        * {
            margin: 0;
            padding: 0;
        }

        .registering .checkok {
            /*display: inline-block;*/
            width: 160px;
            /*color: black;
            padding-top: 15px;
            padding-bottom: 15px;
            background-color: Highlight;
            text-decoration: none;
            margin-top: 20px;*/
            font-size: xx-large;
        }

        .registering .middle {
            text-align: center;
        }

        .registering .bottom_message {
            text-align: center;
        }

        .registering .middle .content {
            padding-bottom: 50px;
        }

        .design_word {
            width: 300px;
            margin: auto;
            margin-top:20px;
            margin-bottom:50px;
            font-size:20px;
            text-align:justify;
        }        

        .content {
            margin: auto;
        }

        .content h2 {
            font-size: 50px;
        }

        .container {
            padding-bottom:50px;
        }

        table {
            border-radius:30px;
        }        
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registering fixed-width">
            <h1>建立你的ICT帳戶
            </h1>

            <div class="container">
                <div class="middle">
                    <div class="content">
                        <h2>ICodeTogether</h2>
                        <div class="design_word">
                            <p>
                                語言是了解對方的第一個步驟，先進的國家逐漸地將程式語言納為他們小孩必需學習的課程，他們從小開始接觸，程式語言不再只是個媒介，更是訓練邏輯思考重要的一環，所以程式語言已是不可避諱的趨
                            </p>
                        </div>
                        <asp:Button ID="btn_register1" runat="server" Text="註冊" OnClick="btn_register_Click" class="checkok btn btn-primary" />
                    </div>
                    <asp:Label ID="lbl_message1" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
            </div>

            <div class="container">
                <div class="col-2">
                    <table>
                        <tr>
                            <th>名稱</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_name" runat="server" placeholder="姓名" Height="100%" Width="95%" BorderStyle="None"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" BorderStyle="None" ControlToValidate="txt_name" ForeColor="Red" BackColor="White"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>帳號</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_account" runat="server" placeholder="帳號" Height="100%" Width="95%" BorderStyle="None"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" BorderStyle="None" ControlToValidate="txt_account" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>建立密碼</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_password" runat="server" placeholder="建立密碼" Height="100%" Width="95%" BorderStyle="None" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" BorderStyle="None" ControlToValidate="txt_password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>確認密碼</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_passwordcheck" runat="server" placeholder="確認密碼" Height="100%" Width="95%" BorderStyle="None" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" BorderStyle="None" ControlToValidate="txt_passwordcheck" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>生日</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_birthday" runat="server" Height="100%" Width="95%" BorderStyle="None" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" BorderStyle="None" ControlToValidate="txt_birthday" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>手機</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_phone" runat="server" Height="100%" Width="95%" BorderStyle="None"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" BorderStyle="None" ControlToValidate="txt_phone" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>地址</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_addr" runat="server" Height="100%" Width="95%" BorderStyle="None"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" BorderStyle="None" ControlToValidate="txt_addr" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Email</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_email" runat="server" Height="100%" Width="95%" BorderStyle="None" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" BorderStyle="None" ControlToValidate="txt_email" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="bottom_message">
                    <div>
                        <asp:Button ID="btn_register2" runat="server" Text="註冊" OnClick="btn_register_Click" class="checkok btn btn-primary" />
                    </div>
                    <div>
                        <asp:Label ID="lbl_message2" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
