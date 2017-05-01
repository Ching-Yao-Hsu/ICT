<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateNotebook.aspx.cs" Inherits="ICodeTogether.notebook" ValidateRequest="False" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="Scripts/ckeditor/ckeditor.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <style>
        * {
            font-family: "Roboto";
            box-sizing: border-box;
        }

        #form {
            margin-left: 20px;
            margin-right: 20px;
        }
    </style>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Notebook Manager

            </h1>
            <p>Edit your note :)</p>
            <p>
                選擇筆記
                <asp:DropDownList ID="DropDownList1" runat="server"  DataTextField="NoteTitle" DataValueField="NoteContent" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True" DataSourceID="SqlDataSource2">
                    <asp:ListItem Value="">請選擇</asp:ListItem>
                </asp:DropDownList>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [NoteTitle], [NoteContent] FROM [Note]"></asp:SqlDataSource>
                
            </p>

            <asp:TextBox ID="txtContent" runat="server" class="ckeditor" TextMode="MultiLine"></asp:TextBox>
            <script type="text/javascript">
                CKEDITOR.replace('TextBox1');
            </script>

            <br />

            <br />
            <asp:Button ID="btnUpdate" runat="server" Text="修改" OnClick="btnUpdate_Click"/>
            <asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" Text="刪除" OnClientClick="return confirm('刪除掉的筆記就像瑞凡一樣，回不去了~您確定要刪除?');" />
            <asp:Button ID="btnBackAdd" runat="server" OnClick="btnBackAdd_Click" Text="新增筆記" OnClientClick="return confirm('請先確認修改後的筆記是否已儲存-&omega;-');"  />
            <br />
        </div>

    </form>

</body>
</html>
