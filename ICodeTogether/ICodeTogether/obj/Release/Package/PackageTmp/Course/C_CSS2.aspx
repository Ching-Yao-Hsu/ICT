<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_CSS2.aspx.cs" Inherits="ICodeTogether.C_CSS2" MaintainScrollPositionOnPostback="true" ValidateRequest="false" %>

<!DOCTYPE html>
<html>

<head>
    <title>Untitled Document</title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>


        function MM_openBrWindow(theURL, winName, features) {
            window.open(theURL, winName, features);
        }

    </script>
    <style>
        * {
            font-family: "Roboto";
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        #CSS2 {
            height: 100%;
        }

        #gbcontent {
            width: 500px;
            margin-left: 40px;
        }

        .page-header {
            padding-left: 40px;
            margin-top: 5px;
        }

            .page-header h1 {
                font-size: 60px;
            }

        .content {
            height: 100%;
            padding-left: 40px;
            padding-right: 40px;
            font-size: 20px;
        }

        .page-header h1 button {
            float: right;
            margin-right: 40px;
            margin-top: 20px;
        }

        .content img {
            width: 800px;
            border: 5px groove;
        }

        .guestbook {
            margin: 45px;
            width: auto;
            padding: 10px;
            color: darkolivegreen;
        }

            .guestbook h1 {
                font-size: 40px;
            }

            .guestbook p {
                padding-left: 5px;
            }

        .page-header h1 a {
            float: right;
            margin-right: 40px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dropdown">

            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                請選擇其他CSS課程
           <span class="caret"></span>

            </button>

            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="C_CSS1.aspx">CSS簡介</a></li>
                <li><a href="../StudyPage.aspx">回首頁選擇其他課程</a></li>
            </ul>
        </div>
        <div id="CSS2">

            <div class="page-header">
                <h1>CSS <small>套用</small>
                    <a href="../StudyPage.aspx" class="btn btn-info btn-lg" target="_self">回課程首頁 </a>

                    <button type="button" class="btn btn-success btn-lg" onclick="MM_openBrWindow('../AddNotebook.aspx','Notebook','width=800,height=770')" onkeypress="MM_openBrWindow('../AddNotebook.aspx','Notebook','width=800,height=770')">使用筆記本</button>

                    <a href="../Exam.aspx?CourseNo=C003" class="btn btn-warning btn-lg">牛刀小試 </a>
                </h1>
            </div>
            <asp:Label ID="lblcontent1" runat="server" Text="Label"></asp:Label>
            <div class="guestbook">
                <h3>GUESTBOOK <span class="label label-default">New</span></h3>
                <p>說些話唄</p>
                <hr>

                <input type="hidden" name="fields" value="Name,Comments">
                Name:&nbsp;
               <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
                <br>
                Comments:
            <br>
                &nbsp;<asp:TextBox ID="txtContent" runat="server" Height="56px" TextMode="MultiLine" Width="272px"></asp:TextBox>
                <br>
                &nbsp;<asp:Button ID="Button1" runat="server" Text="送出留言" OnClick="Button1_Click1" />

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請填寫內容" ControlToValidate="txtContent"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div id="gbcontent">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <HeaderTemplate>
                        <div>
                            留言板內容
                        <hr />
                        </div>
                    </HeaderTemplate>

                    <ItemTemplate>

                        <div>時間： <%# Eval("guestbookDate") %>  </div>

                        <div>姓名： <%# Eval("guestbookName") %>  </div>

                        <div>
                            內容：
                        <br />
                            <%# Eval("guestbookContent") %>
                            <hr />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT * FROM [guestbook] WHERE ([UnitNo] = @UnitNo)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="U004" Name="UnitNo" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
