<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseModify.aspx.cs" Inherits="ICodeTogether.admin.CourseModify" MaintainScrollPositionOnPostback="true"%>

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
                <h1>課程資料修改</h1>
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
            <asp:ListView ID="lv_show" runat="server" DataKeyNames="rowid" DataSourceID="sds_show" InsertItemPosition="LastItem" OnItemCommand="lv_show_ItemCommand">
                <AlternatingItemTemplate>
                    <tr style="">                        
                        
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
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
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" Enabled="True" class="btn btn-primary" />

                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                       
                        
                       
                        <td>
                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
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
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" class="btn btn-primary"/>
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" class="btn btn-primary"/>
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        
                        
                        <td>
                            &nbsp;</td>
                        <td>
                            
                        </td>
                        <td>
                            <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CoursePriceTextBox" runat="server" Text='<%# Bind("CoursePrice") %>' />
                        </td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" class="btn btn-primary"/>
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" class="btn btn-primary"/>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="" class="table">
                        <tr>
                            <td>查無此資料。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <tr style="">                        
                        
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
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
                                                                                
                                        <th runat="server">編號</th>
                                        <th runat="server">課程編號</th>
                                        <th runat="server">課程名稱</th>
                                        <th runat="server">課程價格</th>
                                        <th runat="server"></th>
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
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
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
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" Enabled="True" class="btn" />

                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="sds_show" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [rowid], [CourseNo], [CourseName], [CoursePrice] FROM [Course]" DeleteCommand="DELETE FROM [Course] WHERE [rowid] = @rowid" InsertCommand="AddCourse" UpdateCommand="UPDATE [Course] SET [CourseNo] = @CourseNo, [CourseName] = @CourseName, [CoursePrice] = @CoursePrice WHERE [rowid] = @rowid" InsertCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="CoursePrice" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseNo" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="CoursePrice" Type="Int32" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="sds_search" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [rowid], [CourseNo], [CourseName], [CoursePrice] FROM [Course] WHERE (([CourseName] LIKE '%' + @CourseName + '%') OR ([CourseNo] LIKE '%' + @CourseNo + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_search" Name="CourseName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txt_search" Name="CourseNo" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>



            <asp:ListView ID="ListView1" runat="server" DataKeyNames="rowid" DataSourceID="sds_selected" OnItemCommand="ListView1_ItemCommand" >
                <AlternatingItemTemplate>
                    <tr style="">                        
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" class="btn btn-primary" OnClientClick="return confirm('確定要刪除??')"/>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" class="btn btn-primary"/>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
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
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" class="btn btn-primary"/>
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" class="btn btn-primary"/>
                        </td>
                    </tr>
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    <tr style="">
                        
                        <td>&nbsp;</td>
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
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" class="btn btn-primary"/>
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" class="btn btn-primary"/>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" class="btn btn-primary" OnClientClick="return confirm('確定要刪除??')"/>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" class="btn btn-primary"/>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">rowid</th>
                                        <th runat="server">CourseNo</th>
                                        <th runat="server">CourseName</th>
                                        <th runat="server">CoursePrice</th>
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
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
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
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" class="btn btn-primary" OnClientClick="return confirm('確定要刪除??')"/>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" class="btn btn-primary" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView> 













            <asp:SqlDataSource ID="sds_selected" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" DeleteCommand="DELETE FROM [Course] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [Course] ([CourseNo], [CourseName], [CoursePrice]) VALUES (@CourseNo, @CourseName, @CoursePrice)" SelectCommand="SELECT [rowid], [CourseNo], [CourseName], [CoursePrice] FROM [Course] WHERE ([rowid] = @rowid)" UpdateCommand="UPDATE [Course] SET [CourseNo] = @CourseNo, [CourseName] = @CourseName, [CoursePrice] = @CoursePrice WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseNo" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="CoursePrice" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lv_show" Name="rowid" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseNo" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="CoursePrice" Type="Int32" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>




        </div>
    </form>
</body>
</html>
