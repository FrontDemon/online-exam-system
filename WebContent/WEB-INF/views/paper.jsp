<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试试卷选择</title>
<link rel="stylesheet" type="text/css" href="css/base.css"/>
<script src="js/jquery.min.js"></script>
<style type="text/css">
	.paper-box {margin:50px auto;width:1150px;margin-bottom:300px;clear:both;}
	.paper-box table {padding:20px;text-align:center;}
	.paper-box table .paper-a {width:160px;height:240px;border:3px solid #ddd;border-radius:10px;padding:20px;curson:pointer;margin:0px 0 50px 70px;}
	.paper-box table .paper-a:hover {width:160px;height:240px;border:3px solid lightblue;border-radius:10px;padding:20px;box-shadow:2px 2px 6px #ddd;}
	.paper-box table .paper-a .paper-div {height:100px;text-align:center;}
	.paper-box table .paper-a .paper-icon {height:100px;width:100px;}
	.paper-box table .paper-a .paper-name {font-size:14px;padding-top:10px;}
	.paper-box table .paper-a .paper-time {font-size:14px;padding-top:10px;}
	.paper-box table .paper-a .paper-grade {font-size:14px;padding-top:10px;}
	.paper-box table .paper-a .paper-start {font-size:14px;padding-top:10px;}
	.paper-box table .paper-a .paper-createtime {font-size:14px;padding-top:10px;}
</style>
<script>
	$(function(){
		var subId = ${subId};
		$.ajax({
			async:false,
			url:"paper.action",
			data:{"subId":subId},
			success:function(data){
				if(data !== null){
					for(var i = 0;i <= data.length;i++){
						if(i%4 == 0){
							var createtr = $("<tr></tr>");
							$("#paper_table").append(createtr);	
						}
						var createtd = $("<td></td>");
						createtr.append(createtd);
						var createa = $("<a href='que?pI="+data[i].paper_id+"&pG="+data[i].paper_grade+"&pT="+data[i].paper_time_of_answer+"&qC="+data[i].qC+"&rC="+data[i].rC+"&cC="+data[i].cC+"'></a>");
						createtr.append(createa);
						var firstdiv = $("<div class='paper-a'></div>");
						createa.append(firstdiv);
						var seconddiv = $("<div class='paper-div'></div>");
						firstdiv.append(seconddiv);
						var img = $("<img class='paper-icon' src='img/paper.png'/>");
						seconddiv.append(img);
						var thirddiv = $("<div class='paper-div'></div>");
						firstdiv.append(thirddiv);
						var fourthdiv = $("<div class='paper-name'>"+data[i].paper_name+"</div>");
						var fivethdiv = $("<div class='paper-time'>时间："+data[i].paper_time_of_answer+"分钟</div>");		
						var sixthdiv = $("<div class='paper-grade'>总分："+data[i].paper_grade+"分</div>");	
						var seventhdiv = $("<div class='paper-start'><img alt='level' src='img/start.png'></div>");					
						var eightthdiv = $("<div class='paper-createtime'>"+data[i].paper_creation_of_time+"</div>");
						thirddiv.append(fourthdiv);
						thirddiv.append(fivethdiv);
						thirddiv.append(sixthdiv);
						thirddiv.append(seventhdiv);
						thirddiv.append(eightthdiv);
					}
				}
			},
			error:function(){alert('error');}
		});
	});	
</script>
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
					<div class="fl search" style="line-height:0.8;">
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

		<div class="index-banner" style="margin:50px auto;width:70%;height:400px;background:url(img/bg_paper.jpg) no-repeat;background-size:cover;border-radius:10px;clear:both;">
			<div style="font-size:50px;color:rgba(255,255,255,0.9);text-align:center;position:relative;top:35%;margin-bottom:50px;">选择试卷开始在线考试</div>
		</div>
		
		<div style="margin:50px auto;width:70%;padding:10px 0 30px 0;">
			<img alt="" src="img/paper_icon.png" style="width:25px;height:25px;margin-left:10px;float:left;"/>
			<div style="line-height:25px;float:left;font-size:25px;margin-left:25px;">${subName}科目考试试卷</div>
		</div>
		
		<div class="paper-box">
			<table id="paper_table">
				  <!--  <tr>
					<td>
						<a href="#">
							<div class="paper-a">
								<div class="paper-div">
									<img class="paper-icon" src="img/paper.png"/>
								</div>
								<div class="paper-div">
									<div class="paper-name">JAVA测试</div>
									<div class="paper-time">时间：50分钟</div>
									<div class="paper-grade">总分：100分</div>
									<div class="paper-start"><img alt="level" src="img/start.png"></div>
									<div class="paper-createtime">2018-6-17</div>
								</div>
							</div>
						</a>
					</td>
					<td>
						<a href="#">
							<div class="paper-a">
								<div class=".paper-div">
									<img class="paper-icon" src="img/paper.png"/>
								</div>
								<div class=".paper-div">
									<div class="paper-name">PHP测试</div>
									<div class="paper-time">时间：50分钟</div>
									<div class="paper-grade">总分：100分</div>
									<div class="paper-start"><img alt="level" src="img/start.png"></div>
									<div class="paper-createtime">2018-6-17</div>
								</div>
							</div>
						</a>
					</td>
					<td>
						<a href="#">
							<div class="paper-a">
								<div class=".paper-div">
									<img class="paper-icon" src="img/paper.png"/>
								</div>
								<div class=".paper-div">
									<div class="paper-name">.NET测试</div>
									<div class="paper-time">时间：50分钟</div>
									<div class="paper-grade">总分：100分</div>
									<div class="paper-start"><img alt="level" src="img/start.png"></div>
									<div class="paper-createtime">2018-6-17</div>
								</div>
							</div>
						</a>
					</td>
					<td>
						<a href="#">
							<div class="paper-a">
								<div class=".paper-div">
									<img class="paper-icon" src="img/paper.png"/>
								</div>
								<div class=".paper-div">
									<div class="paper-name">C++测试</div>
									<div class="paper-time">时间：50分钟</div>
									<div class="paper-grade">总分：100分</div>
									<div class="paper-start"><img alt="level" src="img/start.png"></div>
									<div class="paper-createtime">2018-6-17</div>
								</div>
							</div>
						</a>
					</td>
				</tr>-->
			</table>
		</div>
</body>
</html>