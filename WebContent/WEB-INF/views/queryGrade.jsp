<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩查询页面</title>
<script src="js/jquery.min.js"></script>
<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.headbar .box a:hover{color:#ee491f;text-decoration:none;text-shadow: 0px 0.5px 1px #ee491f;}
</style>
<script type="text/javascript">
$(function(){
	var sno = ${sno};
	$.ajax({
		async:false,
		url:"queryGrade.action",
		data:{"sno":sno},
		success:function(data){
			if(data !== null){
				console.log(data);
				for(var i=0;i<data.length;i++){
					var tr = $("<tr></tr>");
					$("#gradeTable").append(tr);
					
					var firsttd = $("<td></td>");
					firsttd.appendTo(tr);
					var firststrong = $("<strong>"+(i+1)+"</strong>");
					firsttd.append(firststrong);
					
					var secondtd = $("<td></td>");
					secondtd.appendTo(tr);
					var secondstrong = $("<strong>"+data[i].paper_name+"</strong>");
					secondtd.append(secondstrong);
					
					var thirdtd = $("<td></td>");
					thirdtd.appendTo(tr);
					var thirdstrong = $("<strong>"+data[i].paper_creation_of_time+"</strong>");
					thirdtd.append(thirdstrong);
					
					var fourtd = $("<td></td>");
					fourtd.appendTo(tr);
					var fourstrong = $("<strong>"+data[i].mark_grade+"</strong>");
					fourtd.append(fourstrong);
				}	
			}
		},
		error:function(){
			alert('成绩加载出错!');
		}
	});
});
</script>
</head>
<body>
	<link rel="stylesheet" type="text/css" href="css/base.css"/>
	<div class="headbar">
			<div class="box" style="height:85px;">
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
        			<a href="javascript:;" class="img-box"><img class="img-box" src="img/icon_user.png" style="width:30px;height:30px;"></a>
        			<a href="javascript:;" class="name" onmouseover="$('#info').css('display','block');" onmouseout = "$('#info').css('display','none');">学生端：<span id="user_name">${studentName}</span> </a>
        			<a href="loginout" class="name" style="margin-left:25px;" onclick="alert('注销成功!');">注销</a>
        		</div>
        		<div id="info" style="z-index:9999;width:250px;height:80px;position:absolute;top:50px;right:150px;background:rgba(0,0,0,0.5);border-radius: 6px;color:white;text-align:left;padding-left:20px;font-size:16px;line-height:2.3;display:none;">
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
		
		
		<div class="index-banner" style="margin:50px auto;width:70%;height:400px;background:url(img/grade03.jpg) no-repeat;background-size:cover;border-radius:10px;">
			<div style="font-size:50px;color:rgba(255,255,255,0.9);text-align:center;position:relative;top:35%;margin-bottom:50px;">考生成绩单</div>
		</div>
		
		<div style="margin:50px auto;width:70%;">
			<img alt="" src="img/query_grade.png" style="width:99%;border:1px solid #ddd;border-radius:8px;"/>
		</div>
		
		<div class="container" style="font-size:18px;margin-bottom:500px;">
		<table id="gradeTable" class="table table-bordered text-center">
			<tr>
				<th class="text-center" style="background-color: #F1FAEA">序列</th>
				<th class="text-center" style="background-color: #F1FAEA">所属课程</th>
				<th class="text-center" style="background-color: #F1FAEA">考卷发布日期</th>
				<th class="text-center" style="background-color: #F1FAEA">考试分数</th>
			</tr>
			<!-- <tr>
				<td class="text-center" style="background-color: #F1FAEA">序列</td>
				<td class="text-center" style="background-color: #F1FAEA">所属课程</td>
				<td class="text-center" style="background-color: #F1FAEA">考卷发布日期</td>
				<td class="text-center" style="background-color: #F1FAEA">考试分数</td>
			</tr> -->
		</table>
</div>
		
</body>
</html>