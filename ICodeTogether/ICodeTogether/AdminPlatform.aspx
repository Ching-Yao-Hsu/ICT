<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="AdminPlatform.aspx.cs" Inherits="ICodeTogether.AdminPlatform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />

    <style>
        body, html {
            background-color: aliceblue;
            position: relative;
            height: 100%;
        }


        .iframe {
            width: 100%;
            height: 100%;
        }

        iframe {
            width: 100%;
            /*//overflow:hidden;*/
            height: 70%;
        }

        /*.adminbottom {
            height:100px;
        }*/

        .dropdown-menu li {
            padding: 0;
            margin: 0;
            background-color: aliceblue;
        }

        .footer {
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        .container {
            height: 100%;
            margin-bottom: 80px;
        }

        .container {
            position: fixed;
            right: 0;
            left: 0;
            top: 50px;
            bottom: 0;           
        }
    </style>

    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {
            $(".dropdown-menu li a").click(function () {
                var _link = $(this).data("link");
                //alert(_link);
                $("iframe").attr("src", "admin/" + _link + ".aspx");
            });
        })
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">

    <div class="container">
        <nav>
            <div>
                <h1><strong>管理者平台</strong></h1>
            </div>
            <div>
                <ul class="nav nav-pills">
                    <li role="presentation" class="active">
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                會員資料 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:;" data-link="CustModify">會員資料修改</a></li>
                                <li><a href="javascript:;" data-link="GuestbookModify">留言板修改</a></li>
                            </ul>
                        </div>
                    </li>
                    <li role="presentation">
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                網站課程 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:;" data-link="CourseModify">課程修改</a></li>
                                <li><a href="javascript:;" data-link="ExamModify">題庫修改</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="iframe">

            <iframe src="admin/CustModify.aspx"></iframe>

        </div>
    </div>
</asp:Content>
