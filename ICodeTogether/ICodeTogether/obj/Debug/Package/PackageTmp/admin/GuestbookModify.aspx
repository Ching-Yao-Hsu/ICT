<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestbookModify.aspx.cs" Inherits="ICodeTogether.admin.GuestbookModify" %>

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


            <asp:ListView ID="lv_show" runat="server" DataKeyNames="guestbookNo" DataSourceID="sds_show">
                <AlternatingItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="guestbookNoLabel" runat="server" Text='<%# Eval("guestbookNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitNoLabel" runat="server" Text='<%# Eval("UnitNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookDateLabel" runat="server" Text='<%# Eval("guestbookDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookNameLabel" runat="server" Text='<%# Eval("guestbookName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookContentLabel" runat="server" Text='<%# Eval("guestbookContent") %>' />
                        </td>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" class="btn btn-primary" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確定要刪除??')" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                       
                        <td>
                            <asp:Label ID="guestbookNoLabel1" runat="server" Text='<%# Eval("guestbookNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="UnitNoTextBox" runat="server" Text='<%# Bind("UnitNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="guestbookDateTextBox" runat="server" Text='<%# Bind("guestbookDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="guestbookNameTextBox" runat="server" Text='<%# Bind("guestbookName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="guestbookContentTextBox" runat="server" Text='<%# Bind("guestbookContent") %>' />
                        </td>
                         <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>查無此資料</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="UnitNoTextBox" runat="server" Text='<%# Bind("UnitNo") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="guestbookDateTextBox" runat="server" Text='<%# Bind("guestbookDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="guestbookNameTextBox" runat="server" Text='<%# Bind("guestbookName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="guestbookContentTextBox" runat="server" Text='<%# Bind("guestbookContent") %>' />
                        </td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                       
                        <td>
                            <asp:Label ID="guestbookNoLabel" runat="server" Text='<%# Eval("guestbookNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitNoLabel" runat="server" Text='<%# Eval("UnitNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookDateLabel" runat="server" Text='<%# Eval("guestbookDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookNameLabel" runat="server" Text='<%# Eval("guestbookName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookContentLabel" runat="server" Text='<%# Eval("guestbookContent") %>' />
                        </td>
                         <td>
                            <asp:Button ID="DeleteButton" runat="server" class="btn btn-primary" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確定要刪除??')"/>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table">
                                    <tr runat="server" style="">
                                        
                                        <th runat="server">留言編號</th>
                                        <th runat="server">單元編號</th>
                                        <th runat="server">留言日期</th>
                                        <th runat="server">留言主題</th>
                                        <th runat="server">留言內容</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="10">
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
                            <asp:Label ID="guestbookNoLabel" runat="server" Text='<%# Eval("guestbookNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UnitNoLabel" runat="server" Text='<%# Eval("UnitNo") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookDateLabel" runat="server" Text='<%# Eval("guestbookDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookNameLabel" runat="server" Text='<%# Eval("guestbookName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="guestbookContentLabel" runat="server" Text='<%# Eval("guestbookContent") %>' />
                        </td>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" class="btn btn-primary" CommandName="Delete" Text="刪除" />
                        </td>
                    </tr>
                </SelectedItemTemplate>

            </asp:ListView>


            
            <asp:SqlDataSource ID="sds_show" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" DeleteCommand="DELETE FROM [guestbook] WHERE [guestbookNo] = @guestbookNo" InsertCommand="INSERT INTO [guestbook] ([UnitNo], [guestbookDate], [guestbookName], [guestbookContent]) VALUES (@UnitNo, @guestbookDate, @guestbookName, @guestbookContent)" SelectCommand="SELECT [guestbookNo], [UnitNo], [guestbookDate], [guestbookName], [guestbookContent] FROM [guestbook]" UpdateCommand="UPDATE [guestbook] SET [UnitNo] = @UnitNo, [guestbookDate] = @guestbookDate, [guestbookName] = @guestbookName, [guestbookContent] = @guestbookContent WHERE [guestbookNo] = @guestbookNo">
                <DeleteParameters>
                    <asp:Parameter Name="guestbookNo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UnitNo" Type="String" />
                    <asp:Parameter Name="guestbookDate" Type="DateTime" />
                    <asp:Parameter Name="guestbookName" Type="String" />
                    <asp:Parameter Name="guestbookContent" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="UnitNo" Type="String" />
                    <asp:Parameter Name="guestbookDate" Type="DateTime" />
                    <asp:Parameter Name="guestbookName" Type="String" />
                    <asp:Parameter Name="guestbookContent" Type="String" />
                    <asp:Parameter Name="guestbookNo" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="sds_search" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [guestbookNo], [UnitNo], [guestbookDate], [guestbookName], [guestbookContent] FROM [guestbook] WHERE (([guestbookName] LIKE '%' + @guestbookName + '%') OR ([UnitNo] = @UnitNo))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_search" Name="guestbookName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txt_search" Name="UnitNo" PropertyName="Text" Type="String" />                    
                </SelectParameters>
            </asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>
