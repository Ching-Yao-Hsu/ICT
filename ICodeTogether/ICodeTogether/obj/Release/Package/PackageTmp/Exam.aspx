<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Exam.aspx.cs" Inherits="ICodeTogether.Exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <!-- Optional theme -->
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />



    <style>
        body ,html{
            position:relative;
            height:100%;            
            background-size:cover;
            background-image: url(images/exam_images/001.jpg);
        }
        .test_menu {            
            text-align: center;
            margin-top:10%;
            margin-bottom:60px;
        }

        .footer {             
            position: fixed;
            width:100%;
            bottom:0;
        }

        .nav ul li a{            
            font-weight:bolder;
            text-decoration:none;            
        }

        
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">


    <div class="test_menu">
        <ul class="nav nav-pills nav-stacked" id="title">
            <asp:Repeater ID="rpt_CourseName" runat="server" OnItemDataBound="rpt_CourseName_ItemDataBound1" DataSourceID="sds_Course">
                <ItemTemplate>
                    <li role="presentation"><a href="javascript:;" data-link='<%# Eval("TestName") %>'>
                        <h2>
                            <asp:Label ID="lbl_CourseNo" runat="server"></asp:Label></h2>
                    </a>
                        <ul class="nav nav-pills nav-stacked" id='<%# Eval("TestName") %>'>

                            <asp:Repeater ID="rpt_ExName" runat="server">
                                <ItemTemplate>
                                    <li role="presentation"><a href="Examination/TestPage.aspx?TopicNo=<%# Eval("TopicNo") %>"><h4><%# Eval("TopicName") %></h4></a></li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <asp:SqlDataSource ID="sds_Course" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [TestNo], [TestName] FROM [Exam_Test] WHERE ([CourseNo] = @CourseNo)">
        <SelectParameters>
            <asp:SessionParameter Name="CourseNo" SessionField="CourseNo" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="Scripts/bootstrap.js"></script>

    <script>
        $(document).ready(function () {            
            $("li a").click(function () {                
                var _link = $(this).data("link")
                $("#" + _link).slideToggle();
            })
        });
    </script>

</asp:Content>

