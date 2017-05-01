<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustModify.aspx.cs" Inherits="ICodeTogether.admin.CustModify" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                <h1>會員資料修改</h1>
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

            <asp:ListView ID="lv_show" runat="server" DataKeyNames="rowid" DataSourceID="sds_show" OnItemCommand="lv_show_ItemCommand">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustNameLabel" runat="server" Text='<%# Eval("CustName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustIDLabel" runat="server" Text='<%# Eval("CustID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustOverageLabel" runat="server" Text='<%# Eval("CustOverage") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="" class="table">
                        <tr>
                            <td>
                                <h3>查無此資料~~~!!</h3>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustNameLabel" runat="server" Text='<%# Eval("CustName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustIDLabel" runat="server" Text='<%# Eval("CustID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustOverageLabel" runat="server" Text='<%# Eval("CustOverage") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" class="btn btn-primary" />
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
                                        <th runat="server">會員名稱</th>
                                        <th runat="server">會員編號</th>
                                        <th runat="server">會員餘額</th>
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
                    <tr style="background-color: burlywood;">
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustNameLabel" runat="server" Text='<%# Eval("CustName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustIDLabel" runat="server" Text='<%# Eval("CustID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustOverageLabel" runat="server" Text='<%# Eval("CustOverage") %>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="選取" CommandName="Select" Enabled="True" class="btn " />

                        </td>
                    </tr>
                </SelectedItemTemplate>

            </asp:ListView>      



            <asp:ListView ID="lv_selected" runat="server" DataKeyNames="rowid" DataSourceID="sds_selected" OnItemCommand="lv_selected_ItemCommand">
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustNameLabel" runat="server" Text='<%# Eval("CustName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustPasswordLabel" runat="server" Text='<%# Eval("CustPassword") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustBirthdayLabel" runat="server" Text='<%# Eval("CustBirthday") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustTelLabel" runat="server" Text='<%# Eval("CustTel") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustAddrLabel" runat="server" Text='<%# Eval("CustAddr") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustEmailLabel" runat="server" Text='<%# Eval("CustEmail") %>' />
                        </td>

                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" class="btn btn-primary" OnClientClick="return confirm('確定要刪除??')"/>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" class="btn btn-primary" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="rowidLabel1" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustNameTextBox" runat="server" Text='<%# Bind("CustName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustPasswordTextBox" runat="server" Text='<%# Bind("CustPassword") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustBirthdayTextBox" runat="server" Text='<%# Bind("CustBirthday") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustTelTextBox" runat="server" Text='<%# Bind("CustTel") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustAddrTextBox" runat="server" Text='<%# Bind("CustAddr") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustEmailTextBox" runat="server" Text='<%# Bind("CustEmail") %>' />
                        </td>

                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" class="btn btn-primary" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" class="btn btn-primary" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="CustNameTextBox" runat="server" Text='<%# Bind("CustName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustPasswordTextBox" runat="server" Text='<%# Bind("CustPassword") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustBirthdayTextBox" runat="server" Text='<%# Bind("CustBirthday") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustTelTextBox" runat="server" Text='<%# Bind("CustTel") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustAddrTextBox" runat="server" Text='<%# Bind("CustAddr") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CustEmailTextBox" runat="server" Text='<%# Bind("CustEmail") %>' />
                        </td>

                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" class="btn btn-primary" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" class="btn btn-primary" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustNameLabel" runat="server" Text='<%# Eval("CustName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustPasswordLabel" runat="server" Text='<%# Eval("CustPassword") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustBirthdayLabel" runat="server" Text='<%# Eval("CustBirthday") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustTelLabel" runat="server" Text='<%# Eval("CustTel") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustAddrLabel" runat="server" Text='<%# Eval("CustAddr") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustEmailLabel" runat="server" Text='<%# Eval("CustEmail") %>' />
                        </td>

                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" class="btn btn-primary" OnClientClick="return confirm('確定要刪除??')"/>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" class="btn btn-primary" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <h1><span><strong>編輯資料</strong></span></h1>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table">
                                    <tr runat="server" style="">
                                        <th runat="server">編號</th>
                                        <th runat="server">會員名稱</th>
                                        <th runat="server">會員密碼</th>
                                        <th runat="server">會員生日</th>
                                        <th runat="server">會員電話</th>
                                        <th runat="server">會員地址</th>
                                        <th runat="server">會員e-mail</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="rowidLabel" runat="server" Text='<%# Eval("rowid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustNameLabel" runat="server" Text='<%# Eval("CustName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustPasswordLabel" runat="server" Text='<%# Eval("CustPassword") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustBirthdayLabel" runat="server" Text='<%# Eval("CustBirthday") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustTelLabel" runat="server" Text='<%# Eval("CustTel") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustAddrLabel" runat="server" Text='<%# Eval("CustAddr") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustEmailLabel" runat="server" Text='<%# Eval("CustEmail") %>' />
                        </td>

                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="刪除" class="btn btn-primary" OnClientClick="return confirm('確定要刪除??')"/>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編輯" class="btn btn-primary" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>



            <asp:SqlDataSource ID="sds_show" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>"
                SelectCommand="SELECT [rowid], [CustName], [CustID], [CustOverage] FROM [Customer]" DeleteCommand="DELETE FROM [Customer] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [Customer] ([CustName], [CustID], [CustOverage]) VALUES (@CustName, @CustID, @CustOverage)" UpdateCommand="UPDATE [Customer] SET [CustName] = @CustName, [CustID] = @CustID, [CustOverage] = @CustOverage WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustName" Type="String" />
                    <asp:Parameter Name="CustID" Type="String" />
                    <asp:Parameter Name="CustOverage" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CustName" Type="String" />
                    <asp:Parameter Name="CustID" Type="String" />
                    <asp:Parameter Name="CustOverage" Type="Int32" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="sds_search" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>"
                SelectCommand="SELECT [rowid], [CustName], [CustID], [CustOverage] FROM [Customer] WHERE (([CustName] LIKE '%' + @CustName + '%') or ([CustID] = @CustID))" DeleteCommand="DELETE FROM [Customer] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [Customer] ([CustName], [CustID], [CustOverage]) VALUES (@CustName, @CustID, @CustOverage)" UpdateCommand="UPDATE [Customer] SET [CustName] = @CustName, [CustID] = @CustID, [CustOverage] = @CustOverage WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustName" Type="String" />
                    <asp:Parameter Name="CustID" Type="String" />
                    <asp:Parameter Name="CustOverage" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_search" Name="CustName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txt_search" Name="CustID" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CustName" Type="String" />
                    <asp:Parameter Name="CustID" Type="String" />
                    <asp:Parameter Name="CustOverage" Type="Int32" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>



            <asp:SqlDataSource ID="sds_selected" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [CustName], [CustPassword], convert(nvarchar(10), [CustBirthday],120) as CustBirthday , [CustTel], [CustAddr], [CustEmail], [rowid] FROM [Customer] WHERE ([rowid] = @rowid2)" DeleteCommand="DELETE FROM [Customer] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [Customer] ([CustName], [CustPassword], [CustBirthday], [CustTel], [CustAddr], [CustEmail]) VALUES (@CustName, @CustPassword, @CustBirthday, @CustTel, @CustAddr, @CustEmail)" UpdateCommand="UPDATE [Customer] SET [CustName] = @CustName, [CustPassword] = @CustPassword, [CustBirthday] = @CustBirthday, [CustTel] = @CustTel, [CustAddr] = @CustAddr, [CustEmail] = @CustEmail WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustName" Type="String" />
                    <asp:Parameter Name="CustPassword" Type="String" />
                    <asp:Parameter DbType="Date" Name="CustBirthday" />
                    <asp:Parameter Name="CustTel" Type="String" />
                    <asp:Parameter Name="CustAddr" Type="String" />
                    <asp:Parameter Name="CustEmail" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="lv_show" Name="rowid2" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CustName" Type="String" />
                    <asp:Parameter Name="CustPassword" Type="String" />
                    <asp:Parameter DbType="Date" Name="CustBirthday" />
                    <asp:Parameter Name="CustTel" Type="String" />
                    <asp:Parameter Name="CustAddr" Type="String" />
                    <asp:Parameter Name="CustEmail" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>

    </form>
</body>
</html>
