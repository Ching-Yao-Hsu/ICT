<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="StudyPage.aspx.cs" Inherits="ICodeTogether.StudyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
    <style>
        body, html {
            background-image: url(images/StudyPage_images/003.jpg);
            background-size:cover;
            position: relative;            
            height: 100%;            
        }
        .clear {
            clear: both;
        }

        .row {
            text-align:justify;
            margin-bottom:40px;
        }

        footer {             
            position: fixed;
            width:100%;
            bottom:0;
        }

        .container {
            /*margin-top:2%;*/
        }

        .alert {
            /*background-color:azure;*/
            opacity:.9;
        }

        .row h1 strong {
            color:antiquewhite;
        }
    </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">

    <div class="clear"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1><strong>課程選擇</strong></h1>
            </div>
            <div class="col-md-12">
                <div class="alert alert-warning">
                    <h1>Csharp</h1>
                    <p>超文件標示語言（英語：HyperText Markup Language，簡稱：HTML）是一種用於建立網頁的標準標示語言。 HTML是一種基礎技術，常與CSS、JavaScript一起被眾多網站用於設計令人賞心悅目的網頁、網頁應用程式以及行動應用程式的使用者介面。</p>
                    <p>
                        <asp:HyperLink ID="hyl_Sin" runat="server" class="btn btn-primary btn-lg" Visible="False" href="Course/C_CSharp.aspx">進入</asp:HyperLink>
                        <asp:HyperLink ID="hyl_Sbuy" runat="server" class="btn btn-danger btn-lg" >前往購買</asp:HyperLink>
                    </p>
                </div>
            </div>
            <div class="col-md-12">
                <div class="alert alert-warning">
                    <h1>HTML5</h1>
                    <p>層疊式樣式表（英语：Cascading Style Sheets，簡寫CSS），又稱串樣式列表、即聯樣式表、串接樣式表、層疊樣式表、階層式樣式表，一種用来為結構化文檔（如HTML 文檔或XML 應用）添加樣式（字體、間距和颜色等）的計算機语言，由W3C 定義和維護。</p>
                    <p>
                        <asp:HyperLink ID="hyl_Hin" runat="server" class="btn btn-primary btn-lg" Visible="False" href="Course/C_HTML1.aspx">進入</asp:HyperLink>
                        <asp:HyperLink ID="hyl_Hbuy" runat="server" class="btn btn-danger btn-lg" >前往購買</asp:HyperLink></p>
                </div>
            </div>
            <div class="col-md-12">
                <div class="alert alert-warning">
                    <h1>CSS3</h1>
                    <p>C#（發音為"See Sharp"）是一個是微軟推出的一種基於.NET框架的、物件導向的高級程式語言。</p>
                    <p>
                        <asp:HyperLink ID="hyl_Cin" runat="server" class="btn btn-primary btn-lg" Visible="False" href="Course/C_CSS1.aspx">進入</asp:HyperLink>
                        <asp:HyperLink ID="hyl_Cbuy" runat="server" class="btn btn-danger btn-lg" >前往購買</asp:HyperLink></p>
                </div>
            </div>

        </div>
    </div>









</asp:Content>
