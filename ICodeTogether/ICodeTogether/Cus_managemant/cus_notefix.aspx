<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_notefix.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_notefix" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />

    <!-- Latest compiled and minified JavaScript -->

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <link href="CSS_cus_manage/cus_notefix.css" rel="stylesheet" />
    <%--<style>
        .mynote h3 {
            margin: 0;
            padding: 0;
            display: block;
            text-align: center;
            width: 600px;
            color: darkblue;
            background-color: palevioletred;
            font-weight: bold;
        }

        .mynote {
            margin: auto;
            margin-top:50px;
            width: 600px;
            font-size: 18px;
        }

            .mynote table {
                width: 600px;
            }

            .mynote th {
                background-color: lightyellow;
            }

        .fa fa-trash-o {
            color: red;
        }
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="mynote">
                <div class="row">

                    <div class="col-md-4 ">
                        <h3>我的筆記</h3>
                        <table>

                            <tr>
                                <td colspan="3">

                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                                        <HeaderTemplate>
                                            <table border="1">
                                                <tr>
                                                    <th>日期</th>
                                                    <th>標題</th>
                                                    
                                                    <th>刪除</th>
                                                    <th>編輯</th>

                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("NoteDate") %></td>
                                                <td><%# Eval("NoteTitle") %></td>
                                               
                                                  <td> <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("NoteNo") %>'/></td>                                       
                                                <td><a href="cus_noteupdate.aspx?id=<%# Eval("NoteNo") %>" class="fa fa-pencil-square-o fa-2x"></a></td>
                                            </tr>


                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                            <asp:Button ID="btn_del" runat="server" Text="批次刪除" CommandName="mydelete" />
                                        </FooterTemplate>

                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [NoteDate],[NoteTitle], [NoteNo] FROM [Note]   WHERE CustID=@CustID">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="CustID" SessionField="savepass" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </td>

                            </tr>


                        </table>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
