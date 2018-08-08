<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于在线考试系统</title>
<link rel="stylesheet" type="text/css" href="css/base.css"/>
<script src="js/jquery.min.js"></script>
</head>
<body>
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
   	 				<a href="studentmain">首页</a> 
     				<a href="subject" >在线考试</a> 
   					<a href="queryGrade">成绩查询</a> 
   					<a href="http://www.chinanews.com/">新闻资讯</a> 
  					<a href="studentaboutsystem">关于系统</a> 
				</div>
				<form action="searchpaper" method="post">
					<div class="fl search">
	            		<input type="text" value="搜索试题关键字" onfocus="if(this.value == '搜索试题关键字') {this.value='';}" onblur="if(this.value == '') {this.value='搜索试题关键字';}" maxlength="35" class="search-box" name="searchpaperName" id="keyword"/>
	            		<input name="提交" type="submit" class="btn" value=""/>
	        		</div>
        		</form>
        		<div class="fr islogin">
        			<a href="javascript:;" class="img-box"><img class="img-box" src="img/icon_user.png"></a>
        			<a href="javascript:;" class="name" onmouseover="$('#info').css('display','block');" onmouseout = "$('#info').css('display','none');">学生端：<span id="user_name">${studentName}</span> </a>
        			<a href="loginout" class="name" style="margin-left:25px;" onclick="alert('注销成功!');">注销</a>
        		</div>
        		<div id="info" style="z-index:9999;width:220px;height:80px;position:absolute;top:40px;right:150px;background:rgba(0,0,0,0.5);border-radius: 6px;color:white;text-align:left;padding-left:20px;font-size:16px;line-height:2.3;display:none;">
        			<div>学号：${sno}</div>
        			<div>邮箱：${studentEmail}</div>
        		</div>
        		<div class="fr nologin" id="nologin" style="display:none;">
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

		<div class="index-banner" style="width:100%;height:400px;background:url(img/main.jpg) no-repeat 50% 0;">
		</div>
		
		<div style="margin:0 auto;width:800px;margin-top:50px;margin-bottom:300px;line-height:2.5;">
			<div style="font-size:24px">项目名称：在线考试系统的设计与实现</div>
			<div style="font-size:24px">作者：马伟涛</div>
			<div style="font-size:24px">开发语言：JAVA</div>
			<div style="font-size:24px">研发周期：4周</div>
			<div style="font-size:24px">功能实现：学生端教师端登录注册注销与找回密码、试卷搜索、科目选择、试卷选择、生成试卷在线考试、答题标记、系统计时器提醒、时间截止自动提交试卷、试卷分数查询、客观题评分、考试答案即使上传到服务器、教师端可对试题库中科目和试题进行增删查改、新闻资讯</div>
			<div style="font-size:24px">关键技术：HTML、CSS、Javascript、Ajax、JSON、EasyUI框架、BookStrap UI框架、JDBC、Spring MVC框架、MySQL数据库、多线程</div>
		</div>
</body>
</html>