<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统找回密码页面</title>
	<style type="text/css">
			.findpswtitle {height:102px; line-height:102px;background:pink;}
			.findpswtitle strong {font-size: 22px;padding-left: 400px;}
			.findpsw-main {width: 880px;min-width: 880px;margin: 0 auto;
				margin-bottom: 200px;}
			.findpsw-main .findpsw-box {padding: 60px;width: 100%;
				display: inline-block;}
			.findpsw-main .findpsw-box .item {height: 70px;line-height: 35px;position: relative;}
			.findpsw-main .findpsw-box .label-span {width: 150px;text-align: right;
				font-size: 18px;
				color: #666666;
				padding-right: 10px;
				display: inline-block;}
			.findpsw-main .findpsw-box .item input {width: 270px;
				line-height: 18px;
				padding: 9px 10px;
				border: 1px solid #CCCCCC;
				font-size: 16px;
				font-family: arial,"宋体";
				color: #999999;
				overflow: hidden;
				-moz-border-radius: 3px;
				-webkit-border-radius: 3px;
				border-radius: 3px;}
			.findpsw-main .findpsw-box .item input[type="submit"] {width: 150px;
				color: white;
				background-color: #4997e2;
				cursor: pointer;}
			.findpsw-main .findpsw-box .item input[type="submit"]:hover {background-color: #4682B4;}
			.findpsw-main .findpsw-box .image {width: 18px;height: 18px;
				margin-left: 10px;
				display: none;}
		</style>
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
   					<a href="404error.html">新闻资讯</a> 
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
      					<a class="btn-findpswister" href="register.jsp">
      						注册
      					</a> 
        			</span>
        			<!--unloginend-->
        		</div>
			</div>
		</div>
		
		<div class="findpswtitle">
			<div class="mainbox">
				<strong>找回密码</strong>
			</div>
			<div class="findpsw-main">
			<div class="findpsw-box">
				<form action="" method="post" id="myfindpswForm">
					<div class="item">
						<label for="user">
							<span class="label-span">用户名 ：</span>
						</label>
						<input class="input-box" type="text" name="user" id="user" maxlength="20" placeholder="用户名/UID"/>
					</div>
					<div class="item">
						<label for="email">
							<span class="label-span">电子邮箱 ：</span>
						</label>
						<input class="input-box" type="email" name="email" id="email" maxlength="20"/>
					</div>
					<div class="item">
						<label>
							<span class="label-span"></span>
						</label>
						<span style="color: red;">填写您在本站注册时填写的Email</span>
					</div>
					<div class="item">
						<label>
							<span class="label-span"></span>
						</label>
						<input class="input-box" type="submit" value="确定提交" onclick="alert('请QQ联系管理员找回密码，管理员QQ:815699563')"/>
					</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>