<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统注册页面</title>
	<style type="text/css">
			.regtitle {height:102px; line-height:102px;background:#f6f6f6;}
			.regtitle strong {font-size: 22px;padding-left: 400px;}
			.reg-main {width: 880px;min-width: 880px;margin: 0 auto;
				margin-bottom: 200px;}
			.reg-main .reg-box {padding: 40px;width: 100%;
				display: inline-block;}
			.reg-main .reg-box .item {height: 70px;line-height: 35px;position: relative;}
			.reg-main .reg-box .label-span {width: 150px;text-align: right;
				font-size: 18px;
				color: #666666;
				padding-right: 10px;
				display: inline-block;}
			.reg-main .reg-box .red {color: red;margin-right: 5px;}
			.reg-main .reg-box .item input {width: 270px;
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
			.reg-main .reg-box .item .position {width: 80px;
				line-height: 18px;
				padding: 9px 10px;
				border: 1px solid #CCCCCC;
				font-weight: bold;
				font-size: 16px;
				font-family: arial,"宋体";
				color: #666666;
				-moz-border-radius: 3px;
				-webkit-border-radius: 3px;
				border-radius: 3px;}
			.reg-main .reg-box .item input[type="submit"] {width: 150px;
				color: white;
				background-color: #34BD74;
				cursor: pointer;}
			.reg-main .reg-box .item input[type="submit"]:hover {background-color: #289E5F;}
			.reg-main .reg-box .image {width: 18px;height: 18px;
				margin-left: 10px;
				display: none;}
			.reg-main .reg-box	.hintspan {margin-left: 3px;font-size:18px;color:red;display:none;}
		</style>
		<script src="./js/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$('#user').blur(function(){
					var user_val = $('#user').val();
					var position_val = $('#position').val();
					$.ajax({
						url:"checkUser.action",
						type:"POST",
						data:{"user":user_val},
						success:function(data){
							if(data == "yes"){	
							}
							else if(data == "no"){
								$('#userCorrectImg').css('display','none');
								$('#userErrorImg').css('display','inline');
								$('#userhint').css('display','inline');
								$('#userhint').html('该用户名已被注册');
							}
						},
						error:function(){alert('error');}
					});
				});
			});
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
      					<a class="btn-register" href="register.jsp">
      						注册
      					</a> 
        			</span>
        			<!--unloginend-->
        		</div>
			</div>
		</div>
		
		
		<div class="regtitle">
			<div class="mainbox">
				<strong>填写注册表单</strong>
			</div>
		</div>
	
		<div class="reg-main">
			<div class="reg-box">
				<form action="register_to_login" method="post" id="registerForm">
					<div class="item">
						<label for="user">
							<span class="label-span"><b class="red">*</b>用户名 ：</span>
						</label>
						<input class="input-box" type="text" name="user" id="user" maxlength="20" placeholder="学生为12位学号，教师为6位教职工号" onblur="if(this.value.length == 6||this.value.length == 12){
								$('#userCorrectImg').css('display','inline');
								$('#userErrorImg').css('display','none');
								$('#userhint').css('display','none');
								}
							else if(this.value == ''){
								$('#userCorrectImg').css('display','none');
								$('#userErrorImg').css('display','inline');
								$('#userhint').css('display','inline');
								$('#userhint').html('用户名不能为空');
							}
							else if(this.value.length != 6||this.value.length != 12){
								$('#userCorrectImg').css('display','none');
								$('#userErrorImg').css('display','inline');
								$('#userhint').css('display','inline');
								$('#userhint').html('用户名为6位教工号或12位学号');
							}"/>
						<img class="image" id="userCorrectImg" src="img/correct.png"/>
						<img class="image" id="userErrorImg" src="img/error.png"/>
						<span class="hintspan" id="userhint">用户名不能为空</span>
					</div>
					<div class="item">
						<label for="psw">
							<span class="label-span"><b class="red">*</b>密码 ：</span>
						</label>
						<input class="input-box" type="password" name="psw" id="psw" maxlength="20" placeholder="6~20位英文、中文、数字的组合" onblur="if(this.value.length >= 6&&this.value.length <= 20){
								$('#pswCorrectImg').css('display','inline');
								$('#pswErrorImg').css('display','none');
								$('#pswError').css('display','none');
								$('#pswhint').css('display','none');}
							else if(this.value == ''){
								$('#pswCorrectImg').css('display','none');
								$('#pswErrorImg').css('display','inline');
								$('#pswError').css('display','none');
								$('#pswhint').css('display','inline');
							}
							else{
								$('#pswCorrectImg').css('display','none');
								$('#pswErrorImg').css('display','inline');
								$('#pswError').css('display','inline');
								$('#pswhint').css('display','none');
							}"/>
						<img class="image" id="pswCorrectImg" src="img/correct.png"/>
						<img class="image" id="pswErrorImg" src="img/error.png"/>
						<span class="hintspan" id="pswError">密码长度为6~20位</span>
						<span class="hintspan" id="pswhint">密码不能为空</span>
					</div>
					<div class="item">
						<label for="confirmpsw">
							<span class="label-span"><b class="red">*</b>确认密码 ：</span>
						</label>
						<input class="input-box" type="password" name="confirmpsw" id="confirmpsw" maxlength="20" placeholder="请再输入一遍上面的密码" onblur="if(this.value == $('#psw').val()&&$('#psw').val() != ''&&$('#psw').val().length>=6&&$('#psw').val().length<=20){
								$('#confirmpswCorrectImg').css('display','inline');
								$('#confirmpswErrorImg').css('display','none');
								$('#confirmpswError').css('display','none');
								$('#confirmpswhint').css('display','none');}
							else if(this.value == ''){
								$('#confirmpswCorrectImg').css('display','none');
								$('#confirmpswErrorImg').css('display','inline');
								$('#confirmpswError').css('display','none');
								$('#confirmpswhint').css('display','inline');
							}
							else{
								$('#confirmpswCorrectImg').css('display','none');
								$('#confirmpswErrorImg').css('display','inline');
								$('#confirmpswError').css('display','inline');
								$('#confirmpswhint').css('display','none');
							}"/>
						<img class="image" id="confirmpswCorrectImg" src="img/correct.png"/>
						<img class="image" id="confirmpswErrorImg" src="img/error.png"/>
						<span class="hintspan" id="confirmpswError">两次输入的密码不一致</span>
						<span class="hintspan" id="confirmpswhint">确认密码不能为空</span>
					</div>
					<div class="item">
						<label for="name">
							<span class="label-span"><b class="red">*</b>姓名 ：</span>
						</label>
						<input class="input-box" type="text" name="name" id="name" maxlength="20" placeholder="请输入真实姓名" onblur="if(this.value == ''){
								$('#nameCorrectImg').css('display','none');
								$('#nameErrorImg').css('display','inline');
								$('#namehint').css('display','inline');}
							else{
								$('#nameCorrectImg').css('display','inline');
								$('#nameErrorImg').css('display','none');
								$('#namehint').css('display','none');
							}"/>
						<img class="image" id="nameCorrectImg" src="img/correct.png"/>
						<img class="image" id="nameErrorImg" src="img/error.png"/>
						<span class="hintspan" id="namehint">姓名不能为空</span>
					</div>
					<div class="item">
						<label for="position">
							<span class="label-span"><b class="red">*</b>职务 ：</span>
						</label>
						<select class="position" name="position">
							<!-- <option value="0">请选择</option> -->
							<option value="1">学生</option>
							<option value="2">教师</option>
						</select>
					</div>
					<div class="item">
						<label for="email">
							<span class="label-span"><b class="red">*</b>电子邮箱 ：</span>
						</label>
						<input class="input-box" type="text" name="email" id="email" maxlength="20"  placeholder="请输入邮箱作为找回密码的凭证" onblur="if(this.value == ''){
								$('#emailCorrectImg').css('display','none');
								$('#emailErrorImg').css('display','inline');
								$('#emailhint').css('display','inline');}
							else if(!this.value.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){
								$('#emailCorrectImg').css('display','none');
								$('#emailErrorImg').css('display','inline');
								$('#emailhint').css('display','inline');
								$('#emailhint').html('邮箱名不合法');
							}
							else{
								$('#emailCorrectImg').css('display','inline');
								$('#emailErrorImg').css('display','none');
								$('#emailhint').css('display','none');
							}"/>
						<img class="image" id="emailCorrectImg" src="img/correct.png"/>
						<img class="image" id="emailErrorImg" src="img/error.png"/>
						<span class="hintspan" id="emailhint">电子邮箱不能为空</span>
					</div>
					<div class="item">
						<label>
							<span class="label-span"><b class="red"></b></span>
						</label>
						<input class="input-box" type="submit" value="同意注册"/>
					</div>
				</form>
			</div>
		</div>
</body>
</html>