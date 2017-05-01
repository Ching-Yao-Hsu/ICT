<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_noteupdate.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_noteupdate" %>

<%@ PreviousPageType VirtualPath="cus_notefix.aspx" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link href="CSS_cus_manage/cus_noteupdate.css" rel="stylesheet" />
    <script src="Scripts/ckeditor/ckeditor.js"></script>
    <%-- <style>
        .note {
            margin: 0;
            padding: 0;
            margin:auto;
            margin-top:50px;
            width: 800px;
            height: auto;
            font-size: 20px;
        }
        .note th{
            background-color: #a5dfff;
            color: #f07800;
            font-family:bold;
            width:200px;
        }
        .note td{
            width:600px;
        }

    </style>--%>
</head>
<body>
    <form id="form1" runat="server" method="post">

        <div class="note">
            <table border="1">
                <tr>
                    <th>日期</th>
                    <td>
                        <asp:Label ID="lbl_notedate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th>標題</th>
                    <td>
                        <asp:Label ID="lbl_ntetitle" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th colspan="2" style="width: 100%">內容</th>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="txt_notecontent" runat="server" class="ckeditor" TextMode="MultiLine" Width="800px " Height="600px"></asp:TextBox>
                        <script type="text/javascript">
                            CKEDITOR.replace('TextBox1');
                        </script>

                    </td>
                </tr>
                <tr>
                    <th colspan="2" style="width: 800px">
                        <asp:Button ID="btn_update" runat="server" Text="更新" OnClick="btn_update_Click" />
                        <asp:Button ID="btn_exit" runat="server" Text="返回" OnClick="btn_exit_Click" />
                    </th>
                </tr>
            </table>
        </div>


    </form>
</body>
</html>
