<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="學習網站ICodeTogether.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">

    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Cabin+Sketch" rel="stylesheet">
    <link href="http://www.fontsaddict.com/fontface/dflikaishu1b.TTF" rel="stylesheet" />
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body,html{
            background-color:beige;
            position:relative;
            height:100%;
        }

        .clearfix::after {
            content: "";
            display: block;
            clear: both;
        }

        @media screen and (min-width:700px) {
            .about {
                width: 700px;
                margin: auto;
                font-size: 20px;
                
            }

            #map {
                float: right;
                width: 380px;
                height: 600px;
                background-color: #eee;
                margin-top: 20px;                
                border: 2px groove;
                border-radius: 25px;
            }
        }

        @media screen and (max-width:700px) {
            .about {
                text-align: center;
                width: 300px;
                margin: auto;
                font-size: 20px;
            }

            #map {
                float: left;
                width: 300px;
                height: 300px;
                background-color: #eee;
                margin-top:20px;
                margin-bottom: 20px;
                border: 2px groove;
                border-radius: 25px;
                
            }
        }

        .content {
            float: left;
            margin: auto;
        }

            .content div {
                width: 300px;
                margin: auto;
                text-align: justify;
            }

            .content h1 {
                text-align: center;
                color: #837b7b;
            }

        .contact {
            padding-top: 20px;
        }

            .contact div {
                padding-top: 10px;
                color: #234674;
            }

        .jumbotron {
            padding: 0;
            margin: 0;
            background-color: beige;
        }

            .jumbotron h1 {
                padding-bottom: 10px;
            }

            .jumbotron p {
                font-family: Cabin Sketch;
            }

        .footer {
            position:fixed;
            bottom:0;
            width:100%;
        }
        .about {
            margin-top:5%;
            margin-bottom:60px;
        }
    </style>



    <script>
        function initMap() {
            var geocoder = new google.maps.Geocoder();

            geocoder.geocode({ "address": "台北市大安區忠孝東路四段178號" }, function (req, res) {
                console.log(res);
                console.log(req);
                console.log(req[0].geometry.location.lat());
                console.log(req[0].geometry.location.lng());
                console.log(req[0].formatted_address);
                var map = new google.maps.Map(document.getElementById("map"), {
                    zoom: 17,
                    //                    center:req[0].geometry.location
                    center: {
                        lat: req[0].geometry.location.lat(),
                        lng: req[0].geometry.location.lng()
                    }
                });
                var marker = new google.maps.Marker({
                    map: map,
                    position: req[0].geometry.location,
                    title: "HI",
                    draggable: true
                });
            });
        }

    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIvdwsc3MZJtezTpVg0bkV_RRIW9_5JjY&callback=initMap">
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">

    <div class="about clearfix">
        <div class="content">
            <div class="jumbotron">
                <h1>關於我們</h1>
                <p>
                    我們提供一個程式語言學習平台，網頁前端設計HTML5，CSS以及由微軟所主導、目前業界較常使用的語言C#基礎課程。
            讓對程式設計有興趣的人能從零開始，在使用學習網站過程中對程式語言有基本的了解與認識
                </p>
            </div>
            <div class="contact">
                <hr />
                <h1>歡迎聯絡</h1>
                <div>
                    <span class="fa fa-envelope-o fa-lg"></span>&ensp;<br />
                    E-Mail:icodetogether@gmail.com
                </div>
                <div><span class="fa fa-phone fa-lg"></span>&ensp;Tel:02-xxxxxxx</div>
                <div><span class="fa fa-fax fa-lg"></span>&ensp;Fax:02-xxxxxxx</div>
                <div><span class="fa fa-address-card fa-lg"></span>&ensp;Add:桃園市幼獅路二段三號</div>
                <hr />

            </div>

        </div>
        <div id="map"></div>
    </div>

</asp:Content>
