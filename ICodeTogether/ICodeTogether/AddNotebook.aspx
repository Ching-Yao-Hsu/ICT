<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNotebook.aspx.cs" Inherits="ICodeTogether.AddNotebook" ValidateRequest="False"%>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <script src="Scripts/ckeditor/ckeditor.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"/>

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

</head>

<body>
    <form id="form1" runat="server">
        <div>
             <h1>Notebook</h1>
             <p>Take a note :)</p>
             <asp:Label ID="lblTitle" runat="server" Text="筆記標題："></asp:Label>
             <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
             <br />
             <br />
             <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine"></asp:TextBox>
             <script type="text/javascript">
                CKEDITOR.replace('txtContent');</script>

            <br />
             <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="儲存" />
             <asp:Button ID="btnSearch" runat="server" Text="查詢" OnClick="btnSearch_Click" OnClientClick="return confirm('請先確定新增筆記是否已儲存:&quot;&gt; ');" /> 
            <br />

        </div>
    </form>
</body>
</html>
