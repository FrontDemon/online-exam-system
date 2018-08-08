<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试科目选择</title>
<link rel="stylesheet" type="text/css" href="css/base.css"/>
<script src="js/jquery.min.js"></script>
<style type="text/css">
	.subject-box {margin:50px auto;width:1150px;margin-bottom:300px;}
	.subject-box table {padding:20px;text-align:center;}
	.subject-box table .subject-a {width:150px;height:180px;border:3px solid #ddd;border-radius:10px;padding:20px;curson:pointer;margin:0px 0 50px 70px;}
	.subject-box table .subject-a:hover {width:150px;height:180px;border:3px solid lightblue;border-radius:10px;padding:20px;box-shadow:2px 2px 6px #ddd;}
	.subject-box table .subject-a .subject-div {line-height:100px;text-align:center;}
	.subject-box table .subject-a .subject-icon {height:100px;width:100px;}
	.subject-box table .subject-a .subject-name {font-size:30px;font-weight:bold;padding-top:10px;}
</style>
<script>
	$(function(){
		$.ajax({
			async:false,
			url:"subject.action",
			success:function(data){
				if(data !== null){
					for(var i = 0;i <= data.length;i++){
						if(i%4 == 0){
							var createtr = $("<tr></tr>");
							$("#subject_table").append(createtr);	
						}
						var createtd = $("<td></td>");
						createtr.append(createtd);
						var createa = $("<a href='paper?subName="+data[i].sub_name+"&subId="+data[i].sub_id+"'></a>");
						createtr.append(createa);
						var firstdiv = $("<div class='subject-a'></div>");
						createa.append(firstdiv);
						var seconddiv = $("<div class='subject-div'></div>");
						firstdiv.append(seconddiv);
						var img = $("<img class='subject-icon' src='img/subject.png'/>");
						seconddiv.append(img);
						var thirddiv = $("<div class='subject-div'></div>");
						firstdiv.append(thirddiv);
						var fourthdiv = $("<div class='subject-name'>"+data[i].sub_name+"</div>");
						thirddiv.append(fourthdiv);
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

		<div class="index-banner" style="margin:50px auto;width:70%;height:400px;background:url(img/bg_login.jpg) no-repeat;background-size:cover;border-radius:10px;">
			<div style="font-size:50px;color:rgba(255,255,255,0.9);text-align:center;position:relative;top:35%;margin-bottom:50px;">选择科目开始在线考试</div>
		</div>
		
		<div style="margin:50px auto;width:70%;">
			<img alt="" src="img/cutline.png" style="width:99%;border:1px solid #ddd;border-radius:8px;"/>
		</div>
		
		<div class="subject-box">
			<table id="subject_table">
				<!--<c:choose>
					<c:when test="${not empty subjectListMap }">
						<c:forEach items="${subjectListMap }" var="subject" varStatus="vs">
							<c:if test="${vs.index % 4 == 0 }">
								<c:set var="flagIndex" value="${vs.index + 4}"></c:set>
								<tr>
							</c:if>
								<td >
									<a href="action?act=start&subject=${subject.sub_id}">
										<div class="subject-a">
											<div class="subject-div">
												<img class="subject-icon" src="img/subject.png"/>
											</div>
											<div class="subject-div">
												<div class="subject-name">${subject.sub_name}</div>
											</div>
										</div>
									</a>
								</td>
							<c:if test="${(vs.index eq flagIndex)||vs.last}">
								</tr>
							</c:if>
						</c:forEach>
					</c:when>
				</c:choose>
				<tr>
					<td>
						<a href="#">
							<div class="subject-a">
								<div class=".subject-div">
									<img class="subject-icon" src="img/subject.png"/>
								</div>
								<div class=".subject-div">
									<div class="subject-name">JAVA</div>
								</div>
							</div>
						</a>
					</td>
					<td>
						<a href="#">
							<div class="subject-a">
								<div class=".subject-div">
									<img class="subject-icon" src="img/subject.png"/>
								</div>
								<div class=".subject-div">
									<div class="subject-name">PHP</div>
								</div>
							</div>
						</a>
					</td>
					<td>
						<a href="#">
							<div class="subject-a">
								<div class=".subject-div">
									<img class="subject-icon" src="img/subject.png"/>
								</div>
								<div class=".subject-div">
									<div class="subject-name">.NET</div>
								</div>
							</div>
						</a>
					</td>
					<td>
						<a href="#">
							<div class="subject-a">
								<div class=".subject-div">
									<img class="subject-icon" src="img/subject.png"/>
								</div>
								<div class=".subject-div">
									<div class="subject-name">C++</div>
								</div>
							</div>
						</a>
					</td>
				</tr>-->
			</table>
		</div>
</body>
</html>