<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cus_default.aspx.cs" Inherits="ICodeTogether.Cus_managemant.cus_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
         @keyframes test{
             0%{transform: translate(100px,0px);}
            50%{transform: translate(500px,0px)}
            
            100%{transform: translate(100px,0px)}
        }
       
        
        body{
            background-color: #eaeaea;
        }
        .default{
            margin: 0;
            padding: 0;
            margin: auto;
            width: 600px;
            text-align: center;
            background-color: #d8edea;
            border: 10px;
            border-style: double;
            border-color: #6e8caa;
        }
        .default h1{
            color: #437aa2;
           
        }
        .pic {
            display: block;
            width: 500px;
            height: 500px;
            background-image: url('../images/main/阿財_副本_副本.png');
            background-size: contain;
            background-repeat: no-repeat;
            animation: test 10s infinite linear;
        }

        
        
       
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div class="default">
    <h1>會員中心公告</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque dignissimos quos quas vitae pariatur itaque voluptate necessitatibus placeat praesentium quae libero voluptatum, distinctio omnis dicta, quibusdam, iure! Veniam, soluta, voluptatibus?</p>
</div>
<div>
   <span class="pic" ></span>
</div>
    </form>
</body>
</html>
