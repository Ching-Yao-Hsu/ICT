<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ICodeTogether.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">

    <link rel="stylesheet" href="css3/jquery.bxslider.css">
    <link rel="stylesheet" href="css3/lightbox.css">
    <link rel="stylesheet" href="css3/homepage.css">
    <style>
        @media screen and (min-width:1200px){
            .col-3 {
                height:250px;
                line-height:2em;
            }
        }
        * {
            margin: 0;
            padding: 0;            
        }

        body {
            background-color:aliceblue;
        }

        .row {
            clear: both;
        }
        
        #footer {
            position:fixed;
            bottom:0;
            width:100%;
        }        
        
        .slider {
            margin-top:5%;
        }

        .slider ul{
            margin:0;
            padding:0;
        }

        .col-3 {
            margin-bottom:60px;
        }
        
    </style>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/lightbox.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".slider .bxslider").bxSlider({
                mode: "fade",
                speed: 1800,
                captions: true,
                //pager:false,
                //pagerType:"short",
                //controls:false,
                auto: true,
                //pause:3000
            });
        });

        lightbox.option({
            "resizeDuration": 200,
            "wrapAround": true
        })
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <div class="homepage fixed-width">
        <div class="slider">
            <ul class="bxslider">
                <li>
                    <div class="box">
                        <a href="images/main/阿財1.jpg" data-lightbox="lb">
                            <img src="images/main/阿財1.jpg" />
                        </a>
                    </div>
                </li>
                <li>
                    <div class="box">
                        <a href="images/main/小灰二.jpg" data-lightbox="lb">
                            <img src="images/main/小灰二.jpg" />
                        </a>
                    </div>
                </li>
                <li>
                    <div class="box">
                        <a href="images/main/小灰三.jpg" data-lightbox="lb">
                            <img src="images/main/小灰三.jpg" />
                        </a>
                    </div>
                </li>
            </ul>
        </div>

        <div class="classes">
            <div class="col-3" style="background-color: #FFFF99">
                <h1>HTML</h1>
                <p>超文件標示語言（英語：HyperText Markup Language，簡稱：HTML）是一種用於建立網頁的標準標示語言。 HTML是一種基礎技術，常與CSS、JavaScript一起被眾多網站用於設計令人賞心悅目的網頁、網頁應用程式以及行動應用程式的使用者介面。</p>
            </div>
            <div class="col-3" style="background-color: #CCFFCC">
                <h1>CSS</h1>
                <p>層疊式樣式表（英语：Cascading Style Sheets，簡寫CSS），又稱串樣式列表、即聯樣式表、串接樣式表、層疊樣式表、階層式樣式表，一種用来为結構化文檔（如HTML 文檔或XML 應用）添加樣式（字體、間距和颜色等）的計算機语言，由W3C 定義和維護。</p>
            </div>
            <div class="col-3" style="background-color: #CCFFFF">
                <h1>C Sharp</h1>
                <p>C#（發音為"See Sharp"）是一個是微軟推出的一種基於.NET框架的、物件導向的高級程式語言。</p>
            </div>            
        </div>        

        <%--<div class="row">
            <div class="col-md-4 col-sm-4" style="background-color: #FFFF99">
                <h1>HTML</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio sed minima eaque, voluptatibus laboriosam labore quo culpa quos nihil! Maiores nam sed, ad quia cupiditate illum ipsum consectetur molestias delectus.lorem fkaojfpaowwfpwkpfk[alw'L.W</p>
            </div>
            <div class="col-md-4 col-sm-4" style="background-color: #CCFFCC">
                <h1>CSS</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio sed minima eaque, voluptatibus laboriosam labore quo culpa quos nihil! Maiores nam sed, ad quia cupiditate illum ipsum consectetur molestias delectus.lorem fkaojfpaowwfpwkpfk[alw'L.W</p>
            </div>
            <div class="col-md-4 col-sm-4" style="background-color: #CCFFFF">
                <h1>C Sharp</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio sed minima eaque, voluptatibus laboriosam labore quo culpa quos nihil! Maiores nam sed, ad quia cupiditate illum ipsum consectetur molestias delectus.lorem fkaojfpaowwfpwkpfk[alw'L.W</p>
            </div>

        </div>--%>    
        
       
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
