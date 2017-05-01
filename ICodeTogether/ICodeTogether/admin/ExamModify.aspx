<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamModify.aspx.cs" Inherits="ICodeTogether.admin.ExamModify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />

    <style>
        .container {
            padding: 20px;
        }
    </style>

    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div>
                <h1>留言板修改</h1>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="input-group">
                        <asp:TextBox ID="txt_search" runat="server" class="form-control" PlaceHolder="輸入關鍵字"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button ID="btn_search" runat="server" Text="搜尋" class="btn btn-default" OnClick="btn_search_Click" />
                        </span>
                    </div>
                </div>
            </div>

            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="CourseNo">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="CourseNoLabel" runat="server" Text='<%# Eval("CourseNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />
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
                            <asp:TextBox ID="CourseNoTextBox" runat="server" Text='<%# Bind("CourseNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未傳回資料。</td>
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
                            <asp:TextBox ID="CourseNoTextBox" runat="server" Text='<%# Bind("CourseNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="CourseNoLabel" runat="server" Text='<%# Eval("CourseNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server">CourseNo</th>
                                        <th runat="server">CourseName</th>
                                        <th></th>
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
                    <tr style="background-color:antiquewhite;">
                        <td>
                            <asp:Label ID="CourseNoLabel" runat="server" Text='<%# Eval("CourseNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [CourseNo], [CourseName] FROM [Course]"></asp:SqlDataSource>
            
            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="rowid" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />                            
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />                        
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNoLabel" runat="server" Text='<%# Eval("TestNo") %>' />
                        </td>
                         <td>
                             <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
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
                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TestNoTextBox" runat="server" Text='<%# Bind("TestNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TestNameTextBox" runat="server" Text='<%# Bind("TestName") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未傳回資料。</td>
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
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="TestNoTextBox" runat="server" Text='<%# Bind("TestNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TestNameTextBox" runat="server" Text='<%# Bind("TestName") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />                            
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />                      
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNoLabel" runat="server" Text='<%# Eval("TestNo") %>' />
                        </td>
                         <td>
                             <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">rowid</th>
                                        <th runat="server">TestNo</th>
                                        <th runat="server">TestName</th>
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />                           
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />                      
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNoLabel" runat="server" Text='<%# Eval("TestNo") %>' />
                        </td>
                         <td>
                             <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [rowid], [TestNo], [TestName] FROM [Exam_Test] WHERE ([CourseNo] = @CourseNo)" DeleteCommand="DELETE FROM [Exam_Test] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [Exam_Test] ([TestNo], [TestName]) VALUES (@TestNo, @TestName)" UpdateCommand="UPDATE [Exam_Test] SET [TestNo] = @TestNo, [TestName] = @TestName WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TestNo" Type="String" />
                    <asp:Parameter Name="TestName" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListView1" Name="CourseNo" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TestNo" Type="String" />
                    <asp:Parameter Name="TestName" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" DataKeyNames="rowid" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />                            
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />                        
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNoLabel" runat="server" Text='<%# Eval("TopicNo") %>' />
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
                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TopicNoTextBox" runat="server" Text='<%# Bind("TopicNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TopicNameTextBox" runat="server" Text='<%# Bind("TopicName") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未傳回資料。</td>
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
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="TopicNoTextBox" runat="server" Text='<%# Bind("TopicNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TopicNameTextBox" runat="server" Text='<%# Bind("TopicName") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />     
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNoLabel" runat="server" Text='<%# Eval("TopicNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNameLabel" runat="server" Text='<%# Eval("TopicName") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">rowid</th>
                                        <th runat="server">TopicNo</th>
                                        <th runat="server">TopicName</th>
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />     
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNoLabel" runat="server" Text='<%# Eval("TopicNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNameLabel" runat="server" Text='<%# Eval("TopicName") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [rowid], [TopicNo], [TopicName] FROM [Exam_Test_Topic] WHERE ([TestNo] = @TestNo)" DeleteCommand="DELETE FROM [Exam_Test_Topic] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [Exam_Test_Topic] ([TopicNo], [TopicName]) VALUES (@TopicNo, @TopicName)" UpdateCommand="UPDATE [Exam_Test_Topic] SET [TopicNo] = @TopicNo, [TopicName] = @TopicName WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TopicNo" Type="String" />
                    <asp:Parameter Name="TopicName" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListView2" Name="TestNo" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TopicNo" Type="String" />
                    <asp:Parameter Name="TopicName" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:ListView ID="ListView4" runat="server" DataKeyNames="ExNo" DataSourceID="SqlDataSource4" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />     
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNoLabel" runat="server" Text='<%# Eval("ExNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNameLabel" runat="server" Text='<%# Eval("ExName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExContentLabel" runat="server" Text='<%# Eval("ExContent") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExAnswerLabel" runat="server" Text='<%# Eval("ExAnswer") %>' />
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
                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNoLabel1" runat="server" Text='<%# Eval("ExNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExNameTextBox" runat="server" Text='<%# Bind("ExName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExContentTextBox" runat="server" Text='<%# Bind("ExContent") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExAnswerTextBox" runat="server" Text='<%# Bind("ExAnswer") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未傳回資料。</td>
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
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="ExNoTextBox" runat="server" Text='<%# Bind("ExNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExNameTextBox" runat="server" Text='<%# Bind("ExName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExContentTextBox" runat="server" Text='<%# Bind("ExContent") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExAnswerTextBox" runat="server" Text='<%# Bind("ExAnswer") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNoLabel" runat="server" Text='<%# Eval("ExNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNameLabel" runat="server" Text='<%# Eval("ExName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExContentLabel" runat="server" Text='<%# Eval("ExContent") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExAnswerLabel" runat="server" Text='<%# Eval("ExAnswer") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">rowid</th>
                                        <th runat="server">ExNo</th>
                                        <th runat="server">ExName</th>
                                        <th runat="server">ExContent</th>
                                        <th runat="server">ExAnswer</th>
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />     
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNoLabel" runat="server" Text='<%# Eval("ExNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNameLabel" runat="server" Text='<%# Eval("ExName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExContentLabel" runat="server" Text='<%# Eval("ExContent") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExAnswerLabel" runat="server" Text='<%# Eval("ExAnswer") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [rowid], [ExNo], [ExName], [ExContent], [ExAnswer] FROM [Examination] WHERE ([TopicNo] = @TopicNo)" DeleteCommand="DELETE FROM [Examination] WHERE [ExNo] = @ExNo" InsertCommand="INSERT INTO [Examination] ([ExNo], [ExName], [ExContent], [ExAnswer]) VALUES (@ExNo, @ExName, @ExContent, @ExAnswer)" UpdateCommand="UPDATE [Examination] SET [rowid] = @rowid, [ExName] = @ExName, [ExContent] = @ExContent, [ExAnswer] = @ExAnswer WHERE [ExNo] = @ExNo">
                <DeleteParameters>
                    <asp:Parameter Name="ExNo" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ExNo" Type="String" />
                    <asp:Parameter Name="ExName" Type="String" />
                    <asp:Parameter Name="ExContent" Type="String" />
                    <asp:Parameter Name="ExAnswer" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListView3" Name="TopicNo" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                    <asp:Parameter Name="ExName" Type="String" />
                    <asp:Parameter Name="ExContent" Type="String" />
                    <asp:Parameter Name="ExAnswer" Type="String" />
                    <asp:Parameter Name="ExNo" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView5" runat="server" DataKeyNames="rowid" DataSourceID="SqlDataSource5" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />     
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNoLabel" runat="server" Text='<%# Eval("ExNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExOptionLabel" runat="server" Text='<%# Eval("ExOption") %>' />
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
                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExNoTextBox" runat="server" Text='<%# Bind("ExNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExOptionTextBox" runat="server" Text='<%# Bind("ExOption") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未傳回資料。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="ExNoTextBox" runat="server" Text='<%# Bind("ExNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ExOptionTextBox" runat="server" Text='<%# Bind("ExOption") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />     
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNoLabel" runat="server" Text='<%# Eval("ExNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExOptionLabel" runat="server" Text='<%# Eval("ExOption") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">rowid</th>
                                        <th runat="server">ExNo</th>
                                        <th runat="server">ExOption</th>
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
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" />
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />     
                        </td>
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExNoLabel" runat="server" Text='<%# Eval("ExNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ExOptionLabel" runat="server" Text='<%# Eval("ExOption") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>



            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [rowid], [ExNo], [ExOption] FROM [Examination_detail] WHERE ([ExNo] = @ExNo)" DeleteCommand="DELETE FROM [Examination_detail] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [Examination_detail] ([ExNo], [ExOption]) VALUES (@ExNo, @ExOption)" UpdateCommand="UPDATE [Examination_detail] SET [ExNo] = @ExNo, [ExOption] = @ExOption WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ExNo" Type="String" />
                    <asp:Parameter Name="ExOption" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListView4" Name="ExNo" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ExNo" Type="String" />
                    <asp:Parameter Name="ExOption" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>



        </div>
    </form>
</body>
</html>
