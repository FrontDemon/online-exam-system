<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统登录页面</title>
<script type="text/javascript">
	window.onload = function(){
		alert('${message}');
	};
</script>
</head>
<body>
	<link rel="stylesheet" type="text/css" href="css/base.css"/>
		<div class="headbar">
			<div class="box">
				<h1 class="f1 logo">
					<h1 class="fl logo" title="">
						<a href="main.html">
							<img src="img/icon_onlineexam.png"/><img src="img/logo_onlineexam.png"/>
						</a>
					</h1>
				</h1>
				<div class="fl exam-link"> 
   	 				<a href="main.html">首页</a> 
     				<a href="404error.html" onclick="alert('请先登录!');">在线考试</a> 
   					<a href="404error.html" onclick="alert('请先登录!');">成绩查询</a> 
   					<a href="http://www.chinanews.com/">新闻资讯</a> 
  					<a href="aboutsystem.html">关于系统</a> 
				</div>
				<div class="fl search">
            		<input type="text" value="搜索试题关键字" onfocus="if(this.value == '搜索试题关键字') {this.value='';}" onblur="if(this.value == '') {this.value='搜索试题关键字';}" maxlength="35" class="search-box" name="wd" id="keyword"/>
            		<input name="提交" type="button" class="btn" onclick="" value=""/>
        		</div>
        		<div class="fr islogin" style="display:none;">
        			<a href="javascript:;" class="img-box"><img src="img/icon_user.png"></a>
        			<a href="javascript:;" class="name">您好，尊敬的用户：<span id="user_name">马伟涛</span> </a>
        		</div>
        		<div class="fr nologin" id="nologin">
        			<!--unloginstart--> 
      				<span id="PopLoginTips">
      					<a class="self-ico" href="login.jsp">
      						 登录
      					</a> 
      					<a class="btn-register" href="register.jsp">
      						注册
      					</a> 
        			</span>
        			<!--unloginend-->
        		</div>
			</div>
		</div>
		
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
		<section class="login mainbox gray clearfix" style="min-height: 790px;background: url(img/loginback.jpg);width: 100%;background-size: cover;">
			<div class="title"></div>
			<div class="l_m">
				<!--普通用户登录 begin-->
		        <div class="logincontent">
		            <div class="login_box">
		                <h4>普通用户登录</h4>
		                <form name="myform" action="login_to_main" method="post" id="loginForm">
		                    <ul>
		                        <li style="margin-top:0px;">
		                            <input type="text" placeholder="用户名/UID" name="userName" id="userName" class="username">
		                        </li>
		                        <li>
		                            <input type="password" placeholder="密码/PSW" name="passWord" id="passWord" class="password">
		                        </li>
		                        <!--<li>
		                            <span style="display:none">
		                            	<input type="input" onfocus="this.value=(this.value==&#39;验证码&#39;)?&#39;&#39;:this.value" onblur="this.value=(this.value==&#39;&#39;)?&#39;验证码&#39;:this.value" name="VerifyCode" value="验证码" id="TxtVerifyCode" class="password" style="width:60px"/> 
		                            	<img title="点击刷新" id="verifyimg" src="" border="0" style="cursor:pointer;margin-top:10px" onclick="this.src=&#39;../plus/ValidateCode.aspx?t=&#39;+Math.random();">
		                            </span>
		                        </li>  -->
		                        <li>
		                            <!--  <select name="position">
		                            	<option value="学生">学生</option>
		                            	<option value="教师">教师</option>
		                            </select>-->
		                            <input type="radio" name="position" value="1" id="student"/>
		                            <label for="student"><span style="margin-left:10px;margin-right:20px;font-size:18px;color:#999999;">学生</span></label>
		                            <input type="radio" name="position" value="2" id="teacher"/>
		                            <label for="teacher"><span style="margin-left:10px;margin-right:20px;font-size:18px;color:#999999;">教师</span></label>
		                        </li>
		                        <li>
		                            <div class="cook">
		                                <div class="fr"><a href="findpsw.jsp">忘记密码？</a>
		                            </div>
		                            </div>
		                        </li>
		                        <li>
		                            <input name="Button1" value="立即登录" class="btn-login" onclick="return(CheckLoginForm())" type="submit">
		                        </li>
		                        <li>
		                        </li>
		                    </ul>
		                    <div class="apilogin">
		                        <div class="name">使用合作网站账号登录</div>
		                        <div class="clear"></div>
			                        <a href="http://iexam.kesion.com/qqlogin.aspx"><img src="./img/icon_qq.png" align="absmiddle" title="QQ登录"></a>
			                        <a href="http://iexam.kesion.com/weixinlogin.aspx"><img src="./img/icon_weixin.png" align="absmiddle" title="微信登录"></a>
			                        <a href="http://iexam.kesion.com/sinalogin.aspx"><img src="./img/icon_sina.png" align="absmiddle" title="新浪微博登录"></a>
			                        <a href="http://iexam.kesion.com/alipaylogin.aspx"><img src="./img/icon_alipay.png" align="absmiddle" title="支付宝快捷登录"></a>
		                    </div>
		                </form>
		              
		                 <!--微信扫码登录 begin-->
						 
						 <!--微信扫码登录 end-->
		              
		            </div>
		
		        </div>
		        <!--普通用户登录 end-->
		    </div>
		</section>
</body>
</html>