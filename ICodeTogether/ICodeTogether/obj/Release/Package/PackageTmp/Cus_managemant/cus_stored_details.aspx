<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_stored_details.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_stored_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Asar" rel="stylesheet" />
    <link href="CSS_cus_manage/cus_stored_details.css" rel="stylesheet" />
   <%-- <style>
        .details {
            margin: 0;
            padding: 0;
            margin: auto;
            font-family: 'Asar';
        }

            .details table {
                margin: auto;
                margin-top: 20px;
                width: 600px;
                border-style: double;
            }

            .details th {
                background-color: rgba(216, 0, 67, 0.87);
                color: #f7f7f7;
                font-size: 20px;
                text-align: center;
            }

            .details td {
                font-size: 18px;
                
            }
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="details">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table border="1">
                        <tr>
                            <th>帳號</th>
                            <th>日期</th>
                            <th>明細</th>
                            <th>交易金額</th>
                            <th>帳戶餘額</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("CustID") %></td>
                        <td><%# Eval("OrderDate") %></td>
                        <td><%# Eval("CourseName") %></td>
                        <td><%# Eval("amount") %></td>
                        <td><%# Eval("balance") %>
                           </td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" 
                SelectCommand="SELECT * , (SELECT SUM(amount) FROM [dbo].[vi_course_detail] AS T2 WHERE [OrderDate] &lt;= T1.[OrderDate] and [CustID] = @custid ) AS balance 
                FROM [dbo].[vi_course_detail] AS T1 
                WHERE [CustID] = @custid 
                ORDER BY [OrderDate]  ">
                <SelectParameters>
                    <asp:SessionParameter Name="custid" SessionField="savepass" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
