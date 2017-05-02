<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_myclass.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_myclass" %>

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
    <link href="CSS_cus_manage/cus_myclass.css" rel="stylesheet" />
    <%-- <style>
        .myclass h3{
            margin: 0;
            padding: 0;
            display: block;
            text-align: center;
            width:600px;
            color: darkblue;
            background-color:palevioletred;
            font-weight: bold;
        }

        .myclass {
            margin: auto;
            margin-top:50px;
            width: 600px;
            font-size: 18px;
        }

            .myclass table {
                width: 600px;
            }

            .myclass th {
                background-color: lightyellow;
            }
             .order_details{
             margin: 0;
            padding: 0;
            margin: auto;
            margin-top:100px;
            width: 600px;
            text-align: center;
            font-family: 'Asar';
        }
        .order_details table {   
            margin: auto;
           margin-top: 20px;
            width: 500px;
            border-style:double;
        }
         .order_details th{
            font-size: 20px;
            width: 100px;
        }
          .order_details td{
           text-align:left;
        }
    
        .auto-style1 {
            height: 28px;
        }
        hr{
            border:solid 1px;
            
        }
    
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="myclass">
            <div class="row">

                <div class="col-md-4 ">
                    <h3>我的課程</h3>
                    <table>
                        <tr>
                            <th colspan="3">購買明細</th>
                         
                        </tr>
                        <tr>
                            <td colspan="3">

                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                    <HeaderTemplate>
                                        <table border="1">
                                            <tr>
                                                <td>帳號</td>
                                                <td>編號</td>
                                                <td>日期</td>                                   
                                                <td>課程</td>
                                                <td>價格</td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("CustID") %></td>
                                            <td><%# Eval("OrderID") %></td>
                                            <td><%# Eval("OrderDate") %></td>
                                            <td><%# Eval("CourseName") %></td>
                                            <td><%# Eval("amount") %></td>
                                        </tr>
                                       
                                    </ItemTemplate>
                                    <FooterTemplate>
                                         </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                             
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT  A.OrderID,A.CustID, A.OrderDate, C.CourseName, (C.CoursePrice) AS amount FROM Order_Master AS A INNER JOIN Course AS C ON A.CourseNo = C.CourseNo WHERE A.CustID = @custid">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="custid" SessionField="savepass" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                             
                            </td>
                          
                        </tr>
                       

                    </table>
                    <table border="1" >
                        <tr>
                            <th>我要加購:</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButtonList ID="Radiobtn_courses" runat="server">
                                    <asp:ListItem Selected="True">HTML5</asp:ListItem>
                                    <asp:ListItem>CSS3</asp:ListItem>
                                    <asp:ListItem>Csharp</asp:ListItem>
                                </asp:RadioButtonList></td>

                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_next" runat="server" Text="下一步" class="btn btn-success" Font-Size="18px" OnClick="btn_next_Click" /> 
                            </td>

                        </tr>
                     
                    
                    </table>
                </div>
            </div>
        </div>
        <asp:Panel ID="Order_Panel" runat="server" Visible="False">
             <div class="order_details">
                    <table>
                        <tr><th colspan="2">購買明細</th></tr>
                        <tr>
                            <th>日期</th>
                            <td >
                                <asp:Label ID="lbl_date" runat="server" Width="400px" Font-Size="18px" Font-Strikeout="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>帳號</th>
                            <td >
                                <asp:Label ID="lbl_id" runat="server" Width="400px" Font-Size="18px" Font-Strikeout="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>課程</th>
                            <td >
                                <asp:Label ID="lbl_course" runat="server" Width="400px" Font-Size="18px" Font-Strikeout="False"></asp:Label></td>
                        </tr>
                        
                        <tr>
                            <th class="auto-style1">購買金額</th>
                            <td class="auto-style1" >
                                <asp:Label ID="lbl_money" runat="server" Width="400px" Font-Size="18px" Font-Strikeout="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2"> <hr /></td>
                           
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btn_buy" runat="server" Text="確定購買" class="btn btn-info" Font-Size="18px" OnClick="btn_buy_Click" OnClientClick="return confirm('確定購買?');" />
                                <asp:Button ID="btn_cancel" runat="server" Text="取消" class="btn btn-danger" Font-Size="18px" OnClick="btn_cancel_Click" />
                            </td> 
                        </tr>
                    </table>
                </div> 
        </asp:Panel>
    </form>
</body>
</html>
