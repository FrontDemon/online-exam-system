<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在进行在线考试</title>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
	.headbar .box a:hover{color:#ee491f;text-decoration:none;text-shadow: 0px 0.5px 1px #ee491f;}
	.ln-guild {
	  clear: both;
	  position: fixed;
	  right: 0px;
	  top: 130px;
	  z-index: 0;
	}
	
	.rn-guild {
	  clear: both;
	  position: fixed;
	  left: 0px;
	  top: 130px;
	  z-index: 0;
	}
	#cardflag {text-decoration:none;}
	#cardflag:hover {color:lightred !important;}
</style>
<script type="text/javascript">
	
	var paperTime = ${pT};
	var endtimes = new Date().getTime() + paperTime*60000;
	function timer(){ 
	    var ts = endtimes - new Date().getTime();//计算剩余的毫秒数
	    var h=0;
	    var m=0;
	    var s=0;
	    if(ts>=0){
            var h = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数  
            var m = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数  
            var s = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数  
            h = checkTime(h);  
            m = checkTime(m);
            s = checkTime(s);
            document.getElementById("t_h").innerHTML = h;
    	    document.getElementById("t_m").innerHTML = m;
    	    document.getElementById("t_s").innerHTML = s; 
		}
	    else{
	    	document.getElementById("t_h").innerHTML = '00';
    	    document.getElementById("t_m").innerHTML = '00';
    	    document.getElementById("t_s").innerHTML = '00';
    	    alert('考试时间结束，系统将自动提交试卷跳转到成绩查询页面!');
    	    $("#actionSub").submit();
	    }
	 }  
	 function checkTime(i){
		 if(i<10)
			 i = "0" + i;
		 return i;
	 } 
	 setInterval("timer()",1000);
</script>
<script type="text/javascript">
$(function(){
	var paperId = ${pI};
	$.ajax({
		async:false,
		url:"question.action",
		data:{"paperId":paperId},
		success:function(data){
			if(data !== null){
				console.log(data);
				$("#paperName").html(data.paper_name);
				$("#paperTimeOfAnswer").html(data.paper_time_of_answer);
				$("#paperCreationTime").html(data.paper_creation_of_time);
				var paperid = $("<input type='text' name='paper_id' value='"+paperId+"' style='display:none;'/>");
				$("#questionTable").append(paperid);
				if(data.questions !== null){
					var tb = $("<tbody></tbody>");
					$("#questionTable").append(tb);
					var questions = data.questions;
					for(var i=0;i<questions.length;i++){
						//加载答题卡
						if(i%5 == 0){
							var cardtr = $("<tr></tr>");
							$("#cardTable").append(cardtr);	
						}
						var cardtd = $("<td></td>");
						cardtr.append(cardtd);
						var carda = $("<a id='dtk"+i+"' class='btn btn-info btn-xs' href='javascript:void(0);' onclick='goIndex("+i+")'></a>");
						cardtd.append(carda);
						if(i<9){
							var cardspan = $("<span>0"+(i+1)+"</span>");
						}
						if(i>=9){
							var cardspan = $("<span>"+(i+1)+"</span>");
						}
						carda.append(cardspan);
						//加载试题和答案
						var tr1 = $("<tr></tr>");
						tb.append(tr1);
						var th = $("<th></th>");
						tr1.append(th);
						var a = $("<a name='a"+i+"' id='a"+i+"' style='padding-top: 61px;'></a>");
						th.append(a);
						var index = i+1;
						if(questions[i].que_type === 'radio'){
							var h4 = $("<h4 style='font-weight:bold;color:#000000'><span class='glyphicon glyphicon-paperclip text-danger'></span><span style='margin-left:8px;margin-right:8px;''>"+index+".</span>【单选题】<xmp style='display:inline;'>"+questions[i].que_name+"</xmp>【"+questions[i].que_grade+"分】[<a href='javascript:void(0)' onclick='setFlag("+i+")'><span id='cardflag'>答题标记</span></a>]</h4>");
						}
						if(questions[i].que_type === 'checkbox'){
							var h4 = $("<h4 style='font-weight:bold;color:#000000'><span class='glyphicon glyphicon-paperclip text-danger'></span><span style='margin-left:8px;margin-right:8px;''>"+index+".</span>【多选题】<xmp style='display:inline;'>"+questions[i].que_name+"</xmp>【"+questions[i].que_grade+"分】[<a href='javascript:void(0)' onclick='setFlag("+i+")'><span id='cardflag'>答题标记</span></a>]</h4>");
						}
						
						
						th.append(h4);
						var tr2 = $("<tr></tr>");
						tb.append(tr2);
						
						if(data.answers !== null){
							var td = $("<td></td>");
							tr2.append(td);
							var tdol = $("<ol class='text-primary' style='font-size:16px;margin:30px 0 30px 50px;'></ol>");
							td.append(tdol);
							var answers = data.answers;
							for(var j=0;j<answers.length;j++){
								if(questions[i].que_id == answers[j].que_id){
									if(questions[i].que_type === 'radio'){
										var olli = $("<li></li>");
										tdol.append(olli);
										var div1 = $("<div class='radio' style='margin-bottom:15px;'></div>");
										tdol.append(div1);
										var label = $("<label><input type='radio' value='"+answers[j].ans_id+"' name='"+answers[j].que_id+"' id='"+i+"' aria-label='...'><xmp style='display:inline;'>"+answers[j].ans_content+"</xmp></label>");
										div1.append(label);
									}
									if(questions[i].que_type === 'checkbox'){
										var olli = $("<li></li>");
										tdol.append(olli);
										var div1 = $("<div class='checkbox' style='margin-bottom:15px;'></div>");
										tdol.append(div1);
										var label = $("<label><input type='checkbox' value='"+answers[j].ans_id+"' name='"+answers[j].que_id+"' id='"+i+"' aria-label='...'><xmp style='display:inline;'>"+answers[j].ans_content+"</xmp></label>");
										div1.append(label);
									}
								}
							}
						}
						//alert($("#"+questions[i].que_id).prop("value"));
					}
				}
			}
		},
		error:function(){
			$("#paperName").html("暂无任何题目，等待教师发布");
			$("#paperTimeOfAnswer").html("0");
			$("#paperCreationTime").html("待定");
		}
	});
	
});
$(function(){
	$("body").on("click","input[type=radio],input[type=checkbox]",function(){
		var n = $(this).attr("id");
		if($(this).attr("type") == "radio"){
			
			if($(this).prop("checked") == true){
				//alert(n);
				$("#dtk"+n).removeClass('btn-info').addClass('btn-warning');
			}
			if($(this).prop("checked") == false){
				$("#dtk"+n).removeClass('btn-warning').addClass('btn-info');
			}
		}
		if($(this).attr("type") == "checkbox"){
			var $cb = $(this).parent().parent().parent().find("input");
			var f = false;
			for(var k=0;k<$cb.length;k++){
				if($cb.eq(k).prop("checked") == true){
					f = true;
				}
			}
			if(f == false){
				$("#dtk"+n).removeClass('btn-warning').addClass('btn-info');
			}
			if(f == true){
				$("#dtk"+n).removeClass('btn-info').addClass('btn-warning');
			}
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
		<!--  <div>${pN}</div>
		<div>${pI}</div>
		<div>${pT}</div>
		<div>${pC}</div>-->
		
		<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
		<div class="container bg-warning" style="padding-top: 40px;padding-bottom:40px;margin-top:50px;margin-bottom:200px;background:#fffff0;">
			<form id="actionSub" action="jumpToGrade" method="post">
				<h3 class="text-primary text-center" style="margin-bottom:40px;"><span class="glyphicon glyphicon-tags"></span><span style="padding-left: 12px;font-size:30px;"><span id="paperName"></span></span></h3>
				<div class="well text-primary" style="font-size:18px;line-height:2;">
					<span class="glyphicon glyphicon-book"><span style="margin-left:12px;">试卷说明：</span></span>
					<br />
					<ol>
						<li>试题汇总：本卷共${qC}小题，单项选择${rC}道，多项选择${cC}道，作答时间为<span id="paperTimeOfAnswer"></span>分钟，总分${pG}分.</li>
						<li>试题发布时间：<span id="paperCreationTime"></span>.</li>
						<li>试卷来源：考试资料网在线考试中心.</li>
				        <li>注意：鼠标左键点击答题标记可在答题卡制作标记，再次点击可取消标记，考试时间结束系统将自动提交试卷.</li>
					</ol>
				</div>
				<table id="questionTable" class="table table-hover" style="color: #000000;">
					<!--  <tbody>
						  <tr class="success">
						  	<th>
						  		<a name="a1" id="a1" style="padding-top: 61px;"></a>
						  		<h4 style="font-weight:bold;"><span class="glyphicon glyphicon-paperclip text-danger"></span><span style="margin-left:8px;margin-right:8px;">1.</span>【单选题】关于sleep()和wait()，以下描述错误的一项是（ ）</h4>
						  	</th>
						  </tr>
						  <tr>
						  	<td>
						  		<ol class="text-primary" style="font-size: 16px;margin:30px 0 30px 50px;">
						  			<li>
						  				<div class="radio" style="margin-bottom:15px;">
						  					<label><input type="radio" name="first" value="option1">A. sleep是线程类（Thread）的方法，wait是Object类的方法</label>
						  				</div>
						  			</li>
						  			<li>
						  				<div class="radio" style="margin-bottom:15px;">
						  					<label><input type="radio" name="first" value="option1">B. sleep不释放对象锁，wait放弃对象锁</label>
						  				</div>
						  			</li>
						  			<li>
						  				<div class="radio" style="margin-bottom:15px;">
						  					<label><input type="radio" name="first" value="option1">C. sleep暂停线程、但监控状态仍然保持，结束后会自动恢复</label>
						  				</div>
						  			</li>
						  			<li>
						  				<div class="radio" style="margin-bottom:15px;">
						  					<label><input type="radio" name="first" value="option1">D.通过调用suspend()方法而停止的线程</label>
						  				</div>
						  			</li>
						  		</ol>
						  	</td>
						  </tr>
						 </tbody>
						 <tbody>
						   <tr class="success">
						  	<th>
						  		<a name="a2" id="a2" style="padding-top: 61px;"></a>
						  		<h4 style="font-weight:bold;"><span class="glyphicon glyphicon-paperclip text-danger"></span><span style="margin-left:8px;margin-right:8px;">2.</span>【多选题】下面哪个可以改变容器的布局？( )</h4>
						  	</th>
						  </tr>
						  <tr>
						  	<td>
						  		<ol class="text-primary" style="font-size: 16px;margin:30px 0 30px 50px;">
						  			<li>
						  				<div class="checkbox" style="margin-bottom:15px;">
						  					<label><input type="checkbox" value="option1" aria-label="...">A. setLayout(aLayoutManager</label>
						  				</div>
						  			</li>
						  			<li>
						  				<div class="checkbox" style="margin-bottom:15px;">
						  					<label><input type="checkbox" value="option1" aria-label="...">B. addLayout(aLayoutManage</label>
						  				</div>
						  			</li>
						  			<li>
						  				<div class="checkbox" style="margin-bottom:15px;">
						  					<label><input type="checkbox" value="option1" aria-label="...">C. layout(aLayoutManager</label>
						  				</div>
						  			</li>
						  			<li>
						  				<div class="checkbox" style="margin-bottom:15px;">
						  					<label><input type="checkbox" value="option1" aria-label="...">D. setLayoutManager(aLayoutManager</label>
						  				</div>
						  			</li>
						  		</ol>
						  	</td>
						  </tr>
					 </tbody>-->
				</table>
				
			</form>
			
			<!--  考试剩余时间提醒-->
			<div class="rn-guild" style="width:200px;text-align:center;font-size:18px;font-weight:bold;">
				<div class="panel panel-success">
					<div class="panel-heading">
						考试剩余时间
					</div>
					<div class="panel-body">
						<span id="t_h">00</span>时<span id="t_m">00</span>分<span id="t_s">00</span>秒
					</div>
			</div>
			
			<!-- 答题卡-->
			<div id="card_body" class="ln-guild">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h4 style="font-weight:bold;">答题卡</h4>
					</div>
					<div class="panel-body" style="padding:30px;">
			    		<table id="cardTable" class="table table-bordered" style="margin-bottom:0px;">
				    		<!--  <tr class="success" onclick="setFlag(1)">
				    			<td >
				    				<a id="dtk1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">01</a>		
				    			</td>
				    			<td >
				    				<a id="dtk2" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(2)">02</a>		
				    			</td>
				    			<td >
				    				<a id="1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">03</a>		
				    			</td>
				    			<td >
				    				<a id="1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">04</a>		
				    			</td>
				    			<td >
				    				<a id="1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">05</a>		
				    			</td>
				    		</tr>
				    		<tr>
				    			<td >
				    				<a id="1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">06</a>		
				    			</td>
				    			<td >
				    				<a id="1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">07</a>		
				    			</td>
				    			<td >
				    				<a id="1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">08</a>		
				    			</td>
				    			<td >
				    				<a id="1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">09</a>		
				    			</td>
				    			<td >
				    				<a id="1" class="btn btn-info btn-xs" href="javascript:void(0);" onclick="goIndex(1)">10</a>		
				    			</td>
				    		</tr>-->
				    	</table>
					</div>
					<div class="panel-footer" >
						<p class="text-center"><button type="button" class="btn btn-success btn-sm" onclick="submitGo();"><span class="glyphicon glyphicon-pencil" ></span>交卷</button></p>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script type="text/javascript">
    	function setFlag(flag){
    		if ($("#dtk"+flag).hasClass('btn-info')){
    			$("#dtk"+flag).removeClass('btn-info').addClass('btn-warning');
    		}else{
    			$("#dtk"+flag).removeClass('btn-warning').addClass('btn-info');
    		}
    	}
    	
    	function goIndex (flag){
    		window.location.hash = "a"+flag;
    		window.location.href = "#a"+flag;
    	}
    	
    	function submitGo(){
    		var t = confirm("是否确认提交试卷？");
    		if(t == true){
    			$("#actionSub").submit();
    		}
    		else{
    			
    		}
    	} 
    	   
    </script>
</body>
</html>