<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamModify.aspx.cs" Inherits="ICodeTogether.admin.ExamModify" MaintainScrollPositionOnPostback="true"%>

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
                <h1>測驗題庫查詢</h1>
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

            <asp:ListView ID="lv_joincourse" runat="server" DataSourceID="sds_joincourse" DataKeyNames="TopicNo" OnItemCommand="lv_joincourse_ItemCommand">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="CourseNoLabel" runat="server" Text='<%# Eval("CourseNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CoursePriceLabel" runat="server" Text='<%# Eval("CoursePrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNoLabel" runat="server" Text='<%# Eval("TestNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNoLabel" runat="server" Text='<%# Eval("TopicNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNameLabel" runat="server" Text='<%# Eval("TopicName") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" Enabled="True" class="btn btn-primary" />
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
                        <td>
                            <asp:TextBox ID="CoursePriceTextBox" runat="server" Text='<%# Bind("CoursePrice") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TestNoTextBox" runat="server" Text='<%# Bind("TestNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TestNameTextBox" runat="server" Text='<%# Bind("TestName") %>' />
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
                    <table runat="server" style="color:red;">
                        <tr>
                            <td><h3>查無此資料~~~!!</h3></td>
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
                        <td>
                            <asp:TextBox ID="CoursePriceTextBox" runat="server" Text='<%# Bind("CoursePrice") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TestNoTextBox" runat="server" Text='<%# Bind("TestNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TestNameTextBox" runat="server" Text='<%# Bind("TestName") %>' />
                        </td>
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
                            <asp:Label ID="CourseNoLabel" runat="server" Text='<%# Eval("CourseNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CoursePriceLabel" runat="server" Text='<%# Eval("CoursePrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNoLabel" runat="server" Text='<%# Eval("TestNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNoLabel" runat="server" Text='<%# Eval("TopicNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNameLabel" runat="server" Text='<%# Eval("TopicName") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" Enabled="True" class="btn btn-primary" />
                        </td>

                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table">
                                    <tr runat="server" style="">
                                        <th runat="server">課程編號</th>
                                        <th runat="server">課程名稱</th>
                                        <th runat="server">課程價格</th>
                                        <th runat="server">測驗編號</th>
                                        <th runat="server">測驗名稱</th>
                                        <th runat="server">項目編號</th>
                                        <th runat="server">測驗項目</th>
                                        <th></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
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
                            <asp:Label ID="CoursePriceLabel" runat="server" Text='<%# Eval("CoursePrice") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNoLabel" runat="server" Text='<%# Eval("TestNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TestNameLabel" runat="server" Text='<%# Eval("TestName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNoLabel" runat="server" Text='<%# Eval("TopicNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TopicNameLabel" runat="server" Text='<%# Eval("TopicName") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" Enabled="True" class="btn btn-primary" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>



            <asp:ListView ID="lv_joinexamination" runat="server" DataKeyNames="ExNo" DataSourceID="sds_joinexamination" Visible="False">
                <AlternatingItemTemplate>
                    <tr style="">
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
                        <td>
                            <asp:TextBox ID="ExOptionTextBox" runat="server" Text='<%# Bind("ExOption") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="color:red;">
                        <tr>
                            <td><h3>尚未建立題目~~!!</h3></td>
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
                        <td>
                            <asp:TextBox ID="ExOptionTextBox" runat="server" Text='<%# Bind("ExOption") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
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
                        <td>
                            <asp:Label ID="ExOptionLabel" runat="server" Text='<%# Eval("ExOption") %>' />
                        </td>                        
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table">
                                    <tr runat="server" style="">
                                        <th runat="server">題目編號</th>
                                        <th runat="server">題目名稱</th>
                                        <th runat="server">題目內容</th>
                                        <th runat="server">題目答案</th>
                                        <th runat="server">題目選項</th>
                                        <th></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
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
                        <td>
                            <asp:Label ID="ExOptionLabel" runat="server" Text='<%# Eval("ExOption") %>' />
                        </td>                        
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            

            <asp:SqlDataSource ID="sds_joincourse" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [CourseNo], [CourseName], [CoursePrice], [TestNo], [TestName], [TopicNo], [TopicName] FROM [join_course_ExamTest_ExamTestTopic] ORDER BY [CourseNo]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_joinexamination" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [ExNo], [ExName], [ExContent], [ExAnswer], [ExOption] FROM [join_ExamnitionANDExamnition_detail] WHERE ([TopicNo] = @TopicNo) ORDER BY [ExNo]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lv_joincourse" Name="TopicNo" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_search" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [CourseNo], [CourseName], [CoursePrice], [TestNo], [TestName], [TopicNo], [TopicName] FROM [join_course_ExamTest_ExamTestTopic] WHERE (([CourseNo] LIKE '%' + @CourseNo + '%') OR ([CourseName] LIKE '%' + @CourseName + '%') OR ([TestName] LIKE '%' + @TestName + '%') OR ([TestNo] LIKE '%' + @TestNo + '%') OR ([TopicName] LIKE '%' + @TopicName + '%') OR ([TopicNo] LIKE '%' + @TopicNo + '%')) ORDER BY [CourseNo]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_search" Name="CourseNo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txt_search" Name="CourseName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txt_search" Name="TestName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txt_search" Name="TestNo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txt_search" Name="TopicName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txt_search" Name="TopicNo" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>


        </div>
    </form>
</body>
</html>
