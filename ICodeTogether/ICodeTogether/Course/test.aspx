<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="ICodeTogether.Course.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"/>

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

        #gbcontent {
            width: 500px;
            margin-left: 40px;
        }

        #HTML2 {
            height: 100%;
        }

        .page-header {
            padding-left: 40px;
            margin-top: 5px;
        }

            .page-header h1 {
                font-size: 60px;
            }

                .page-header h1 button {
                    float: right;
                    margin-right: 40px;
                    margin-top: 20px;
                }

        .content {
            height: 100%;
            padding-left: 40px;
            padding-right: 40px;
            font-size: 20px;
        }

            .content img {
                width: 800px;
                border: 5px groove;
            }

        .guestbook {
            height: 100%;
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
                請選擇其他HTML課程
           <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a href="C_HTML1.aspx">HTML簡介與架構</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="../StudyPage.aspx">回首頁選擇其他課程</a></li>
            </ul>
        </div>
        <div id="HTML2">
            <div class="page-header">
                <h1>HTML <small>文字</small>
                    <a href="../StudyPage.aspx" class="btn btn-info btn-lg" target="_self">回課程首頁 </a>

                    <button type="button" class="btn btn-success btn-lg" onclick="MM_openBrWindow('../AddNotebook.aspx','Notebook','width=800,height=770')" onkeypress="MM_openBrWindow('../AddNotebook.aspx','Notebook','width=800,height=770')">使用筆記本</button>

                    <a href="../Exam.aspx?CourseNo=C002" class="btn btn-warning btn-lg">牛刀小試 </a>


                </h1>
            </div>
            <asp:Label ID="lblcontent1" runat="server" Text="Label"></asp:Label>
            <div class="guestbook">
                <h3>GUESTBOOK <span class="label label-default">New</span></h3>
                <p>說些話唄</p>
                <hr/>

                <input type="hidden" name="fields" value="Name,Comments"/>
                Name:&nbsp;
               <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <br/>
                Comments:
            <br/>
                &nbsp;<asp:TextBox ID="txtContent" runat="server" Height="56px" TextMode="MultiLine" Width="272px"></asp:TextBox>
                <br/>
                &nbsp;<asp:Button ID="btnOk" runat="server" Text="送出留言" OnClick="Button1_Click1" />
                <br/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請填寫內容" ControlToValidate="txtContent"></asp:RequiredFieldValidator>

            </div>
            <asp:Label ID="lblGuestbook" runat="server"></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT * FROM [guestbook]">
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
