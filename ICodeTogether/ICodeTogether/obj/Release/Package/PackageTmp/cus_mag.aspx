<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="cus_mag.aspx.cs" Inherits="ICodeTogether.cus_mag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main_head" runat="server">
       <style>
        @import url(//fonts.googleapis.com/earlyaccess/cwtexming.css);
        .Cus {
            width:1200px;
            height: 100%;
            padding: 0;
            margin: 0;
            margin: auto;
            
        }
        
        .cus_menu {
            float: left;
            width: 200px;
            height: 1000px;
            margin: 0;
          background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
            text-align: center;
            font-family: 'cwTeXMing';
            
        }
        .cus_menu h3{
            color:deeppink;
        }
    
        
        .cus_fix {
            float: left;
            width: 1000px;
            height:1000px;
            margin: 0;
            
        }
        .cus_menu ul{
            margin: 0;
            padding: 0;
            border-bottom-style: double;
        }
        .cus_menu li{
            list-style: none;
        }
        .cus_menu a{
            display: block;
            
            width: 100%;
            height: 50px;
            line-height: 50PX;
/*            background-color: aliceblue;*/
            font-size: 20px;
            text-align: center;
            text-decoration: none;
            color:	#6495ED;
            
        }

        .footer {
            position:fixed;
            bottom:0;
            width:100%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
   <div class="Cus">
        <div class="col-md-2">
            <div class="cus_menu">
              <h3>會員中心</h3>
               <ul>
                  <li><a href="Cus_managemant/cus_mag_basic.aspx" target="iframe_a">基本資料修改</a></li>
                  <li><a href="Cus_managemant/cus_pwdfix.aspx" target="iframe_a">密碼修改</a></li>
               </ul>
               <h3>課程管理</h3>
               <ul>
                   <li><a href="Cus_managemant/cus_myclass.aspx" target="iframe_a">我的課程</a></li>
               </ul>
               <h3>筆記管理</h3>
               <ul>
                   <li><a href="Cus_managemant/cus_notefix.aspx" target="iframe_a">我的筆記</a></li>
               </ul>
                  <h3>儲值中心</h3>
               <ul>
                   <li><a href="Cus_managemant/cus_storedhome.aspx" target="iframe_a">我要加值</a></li>
               </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="cus_fix">
                <iframe src="Cus_managemant/cus_default.aspx"  width="1000" height="1000"  name="iframe_a" style="padding: 0px; margin: 0px"></iframe>
                
            </div>
        </div>

    </div>

</asp:Content>
