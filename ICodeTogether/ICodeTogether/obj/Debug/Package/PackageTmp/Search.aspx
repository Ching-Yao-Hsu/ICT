<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="ICodeTogether.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
   <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />

    <style>
        .container {
            padding: 20px;
        }
        .footer {
            position:fixed;
            bottom:0;
            width:100%;
        }
    </style>

    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <a href="StudyPage.aspx"><asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' /></a>
                </td>
                <td>
                    <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
                </td>
                <td>
                    <asp:Label ID="TopicNameLabel" runat="server" Text='<%# Eval("TopicName") %>' />
                </td>                
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                </td>
                <td>
                    <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TestNameTextBox" runat="server" Text='<%# Bind("TestName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TopicNameTextBox" runat="server" Text='<%# Bind("TopicName") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="color:red;">
                <tr>
                    <td><h3>查無資料!!</h3></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                </td>
                <td>
                    <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TestNameTextBox" runat="server" Text='<%# Bind("TestName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TopicNameTextBox" runat="server" Text='<%# Bind("TopicName") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <a href="StudyPage.aspx"><asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' /></a>
                </td>
                <td>
                    <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
                </td>
                <td>
                    <asp:Label ID="TopicNameLabel" runat="server" Text='<%# Eval("TopicName") %>' />
                </td>
                
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="table">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table">
                            <tr runat="server" style="">
                                <th runat="server">課程名稱</th>
                                <th runat="server">測驗項目</th>
                                <th runat="server">測驗名稱</th>                                
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                </td>
                <td>
                    <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
                </td>
                <td>
                    <asp:Label ID="TopicNameLabel" runat="server" Text='<%# Eval("TopicName") %>' />
                </td>                
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [CourseName], [TestName], [TopicName] FROM [join_course_ExamTest_ExamTestTopic] WHERE (([CourseName] LIKE '%' + @CourseName + '%') OR ([TestName] LIKE '%' + @TestName + '%') OR ([TopicName] LIKE '%' + @TopicName + '%')) ORDER BY [CourseName]">
        <SelectParameters>
            <asp:SessionParameter Name="CourseName" SessionField="search" Type="String" />
            <asp:SessionParameter Name="TestName" SessionField="search" Type="String" />
            <asp:SessionParameter Name="TopicName" SessionField="search" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
