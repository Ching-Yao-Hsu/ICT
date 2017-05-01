<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="ICodeTogether.Examination.TestPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">

    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/bootstrap-theme.css" rel="stylesheet" />
    <%--<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>--%>
    <link href="animate.css" rel="stylesheet" />
    <style>    
        body ,html{
            position:relative;
            height:100%;            
            background-size:cover;
            background-image: url(../images/exam_images/001.jpg);
        }
        .jumbotron {
            background-size:cover;
            background-image: url(../images/exam_images/001.jpg);
            width: 400px;
            margin: auto;
            margin-top: 15%;
        }

            .jumbotron h1 {
                font-size:xx-large;
            }
        .footer {             
            position: fixed;
            width:100%;
            bottom:0;
        }
    </style>


    <script src="../../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../../Scripts/bootstrap.js"></script>




    <script>
        //$(document).ready(function () {
        //    $(".jumbotron").click(function () {
        //        $(".jumbotron").addClass("rollIn");
        //    })
        //});


    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">

   
        <div class="container">
            <div id="abc" class="jumbotron">
                <h1>
                    <asp:Label ID="lbl_exname" runat="server"></asp:Label>
                </h1>
                <p>
                    <asp:Label ID="lbl_content" runat="server"></asp:Label>
                </p>
                <div>
                    <div class="input-group">
                        <asp:RadioButtonList ID="rbl_Option" runat="server" DataSourceID="sds_option" DataTextField="ExOption" DataValueField="ExOption" Font-Size="Medium">
                        </asp:RadioButtonList>

                        <asp:SqlDataSource ID="sds_option" runat="server" ConnectionString="<%$ ConnectionStrings:ICodeTogetherConnectionString %>" SelectCommand="SELECT [ExOption] FROM [Examination_detail] WHERE ([ExNo] = @ExNo)"></asp:SqlDataSource>
                    </div>
                </div>                
                <asp:Button ID="btn_checktrue" runat="server" Text="Sure" OnClick="btn_checktrue_Click" class="btn btn-primary"/>      
                <asp:LinkButton ID="lkbtn_next" runat="server" class="btn btn-primary" OnClick="lkbtn_next_Click">NEXT</asp:LinkButton>                
                <asp:LinkButton ID="lkbtn_pass" runat="server" class="btn btn-Danger" Visible="False"  OnClick="lkbtn_pass_Click">恭喜你答對啦~~~~~Amazing~~~</asp:LinkButton>

            </div>
            
        </div>
  


</asp:Content>
