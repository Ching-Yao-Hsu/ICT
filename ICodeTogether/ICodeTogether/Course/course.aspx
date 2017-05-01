<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="ICodeTogether.course" MaintainScrollPositionOnPostback="true" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
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
        }
        
        body,
        h1,
        h2,
        h3,
        p {
            margin: 0;
            padding: 0;
        }
        
        .full-width {
            width: 100%;
        }
        
        .fixed-width {
            width: 1200px;
            margin: auto;
        }
        
        #container {
            height: 100%;
        }
        
        .box1 {
            height: 600px;
            background-color: whitesmoke;
        }
        
        .HTML {
            top: 0;
            bottom: 0;
            height: 600px;
            background-color: rgba(0, 0, 0, .2);
            vertical-align: middle;
        }
        
        .content {
            color: #fff;
            padding-top: 175px;
            text-align: center;
        }
        
        .content h1 {
            font-size: 120px;
        }
        
        .content a {
            display: inline-block;
            width: 160px;
            color: #fff;
            padding-top: 15px;
            padding-bottom: 15px;
            background-color: #ff004e;
            text-decoration: none;
            margin-top: 20px;
        }
        
        .box2 {
            height: 600px;
            background-color: white;
        }
        
        .CSS {
            top: 0;
            bottom: 0;
            height: 600px;
            background-color: rgba(0, 0, 0, .1);
            vertical-align: middle;
        }
        
        .content2 {
            color: #fff;
            padding-top: 175px;
            text-align: center;
        }
        
        .content2 h1 {
            font-size: 120px;
        }
        
        .content2 a {
            display: inline-block;
            width: 160px;
            color: #fff;
            padding-top: 15px;
            padding-bottom: 15px;
            background-color: #ff004e;
            text-decoration: none;
            margin-top: 20px;
        }
        
        .box3 {
            height: 600px;
            background-color: whitesmoke;
        }
        
        .CSharp {
            top: 0;
            bottom: 0;
            height: 600px;
            background-color: rgba(0, 0, 0, .2);
            vertical-align: middle;
        }
        
        .content3 {
            color: #fff;
            padding-top: 175px;
            text-align: center;
        }
        
        .content3 h1 {
            font-size: 120px;
        }
        
        .content3 a {
            display: inline-block;
            width: 160px;
            color: #fff;
            padding-top: 15px;
            padding-bottom: 15px;
            background-color: #ff004e;
            text-decoration: none;
            margin-top: 20px;
        }

    </style>
</head>

<body>
        <div id="container" class="full-width">
            <div class="box1">

                <div class="HTML">
                    <div class="content">
                        <h1>HTML</h1>
                        <p>建立你的HTML文件</p>
                        <p><a class="btn btn-primary btn-lg" href="C_HTML1.aspx" role="button" target="_self" >LEARN HTML</a></p>
                    </div>
                </div>
            </div>
            <div class="box2">
                <div class="CSS">
                    <div class="content2">
                        <h1>CSS</h1>
                        <p>設計你的CSS樣式</p>
                        <p><a class="btn btn-primary btn-lg" href="C_CSS1.aspx" role="button" target="_self" >LEARN CSS</a></p>
                    </div>
                </div>
            </div>
            <div class="box3">
                <div class="CSharp">
                    <div class="content3">
                        <h1>CSharp</h1>
                        <p>寫下你的CSharp程式</p>
                        <p><a class="btn btn-primary btn-lg" href="C_CSharp.aspx" role="button" target="_self" >LEARN CSS</a></p>
                    </div>
                </div>
            </div>

        </div>
    </body>

</html>
</asp:Content>
