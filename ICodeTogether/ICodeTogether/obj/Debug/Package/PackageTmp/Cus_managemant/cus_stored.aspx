<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_stored.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_stored" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Asar" rel="stylesheet"/>
    <link href="CSS_cus_manage/cus_stored.css" rel="stylesheet" />
    <%--<style>
        #logo {
            margin: auto;
            display: block;
            width: 300px;
            height: 200px;
            background-image: url('http://localhost:54950/image/logo_副本_副本_副本.png');
            background-size: contain;
            background-repeat: no-repeat;
        }
        
        .stored {
             margin: 0;
            padding: 0;
            margin: auto;
            width: 600px;
            text-align: center;
            font-family: 'Asar';
        }
        .stored h2{
            margin: auto;
            display: block;
            width: 500px;
            height: 80px;
            line-height: 80px;
            border: 10px;
            border-style:double;
            border-color: #CCCCCC;
            background-color: #FF6666;
           font-weight: bold;
        }
        
        .stored table {   
           
            margin: auto;
           margin-top: 20px;
            width: 500px;
          
            border-style:double;
        }
        
        .stored th {
            margin: auto;
            display: block;
            text-align: center;
            font-size: 26px;
            width: 500px;
            background-color: #ffe3ce;
            border: 5px;
            border-style: double;
            border-color: #f0c44c;
            
        }
        .stored_details{
             margin: 0;
            padding: 0;
            margin: auto;
            margin-top:100px;
            width: 600px;
            text-align: center;
            font-family: 'Asar';
        }
        .stored_details table {   
            margin: auto;
           margin-top: 20px;
            width: 500px;
            border-style:double;
        }
         .stored_details th{
            font-size: 20px;
            width: 100px;
        }
          .stored_details td{
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
        
            <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="stored">
                    <div><span id="logo" ></span></div>
                    
                    <h2>I Code Together &nbsp;儲值平台</h2>
                   <h3>帳戶餘額:<asp:Label ID="lbl_balance" runat="server"></asp:Label>
                       
                      </h3>
                   
                    <table >
                        <tr>
                            <th>帳號ID</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_cusid" runat="server" Font-Size="20px" Width="200px"></asp:TextBox></td>
                        </tr>


                        <tr>
                            <th>選擇付款方式</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#FFFFF4" Font-Size="20px" ForeColor="Blue" Width="200px">
                                    <asp:ListItem>ATM轉帳</asp:ListItem>
                                    <asp:ListItem>信用卡付費</asp:ListItem>
                                    <asp:ListItem>超商付費</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>


                        <tr>
                            <th>儲存面額</th>
                        </tr>
                        <tr>
                            <td>
                                <h3>選擇儲值金額:</h3>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="20px" ForeColor="#0066FF" RepeatDirection="Horizontal" BorderStyle="None">
                                    <asp:ListItem Selected="True">300</asp:ListItem>
                                    <asp:ListItem>500</asp:ListItem>
                                    <asp:ListItem>1000</asp:ListItem>
                                    <asp:ListItem>1500</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>


                    </table>
                       
                    <div>
                        <asp:Button ID="btn_next" runat="server" Text="下一步" class="btn btn-success" style="height: 30px" OnClick="btn_next_Click"/>
                   
                    </div>
                </div>
                <asp:Panel ID="Panel_details" runat="server" Visible="False">
                     <div class="stored_details">
                    <table>
                        <tr><th colspan="2">交易明細</th></tr>
                        <tr>
                            <th>日期</th>
                            <td >
                                <asp:Label ID="lbl_date" runat="server" Width="400px" Font-Size="18px" Font-Strikeout="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>帳號ID</th>
                            <td >
                                <asp:Label ID="lbl_id" runat="server" Width="400px" Font-Size="18px" Font-Strikeout="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>付款方式</th>
                            <td >
                                <asp:Label ID="lbl_function" runat="server" Width="400px" Font-Size="18px" Font-Strikeout="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <th class="auto-style1">儲值金額</th>
                            <td class="auto-style1" >
                                <asp:Label ID="lbl_money" runat="server" Width="400px" Font-Size="18px" Font-Strikeout="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2"> <hr /></td>
                           
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btn_check" runat="server" Text="確定送出"  class="btn btn-success" Font-Size="20px" OnClick="btn_check_Click"/> 
                              <asp:Button ID="btn_cancel" runat="server" Text="取消" class="btn btn-danger" Font-Size="20px" OnClick="btn_cancel_Click"/></td> 
                        </tr>
                    </table>
                </div> 
                </asp:Panel>
               
            </div>
        </div>
      
    </form>
    <%--  <script>
         $(document).ready(function () {
             $(".stored_details").hide();

             $("#btn_next").on('submit', function (e) {
                 //e.preventDefault();  
                 //$(".stored_details").show();
                 $(".stored_details").show();
             });

         });
    </script>--%>
</body>
</html>
