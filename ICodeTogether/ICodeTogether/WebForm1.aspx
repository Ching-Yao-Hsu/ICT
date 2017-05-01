<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ICodeTogether.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT          dbo.Course.CourseNo, dbo.Course.CourseName, dbo.Course.CoursePrice, dbo.Exam_Test.TestNo, 
                            dbo.Exam_Test.TestName, dbo.Exam_Test_Topic.TopicNo, dbo.Exam_Test_Topic.TopicName
FROM            dbo.Course 
				left JOIN
                dbo.Exam_Test ON dbo.Course.CourseNo = dbo.Exam_Test.CourseNo 
				left JOIN
                dbo.Exam_Test_Topic ON dbo.Exam_Test.TestNo = dbo.Exam_Test_Topic.TestNo"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
