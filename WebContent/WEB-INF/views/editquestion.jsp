<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题编辑页面</title>
<link rel="stylesheet" type="text/css" href="js/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/color.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<style type="text/css">
	.headbar .box a:hover{color:#ee491f;text-decoration:none;text-shadow: 0px 0.5px 1px #ee491f;}
</style>
<script type="text/javascript">
	$(function(){
		$.ajax({
			async:false,
			url:"getsubinfo.action",
			success:function(data){
				if(data !== null){
					var select = $("<select name='sub_id' id='selectSubject'></select>");
					$("#subjectInfoTd").append(select);
					for(var i in data){
						var option = $("<option value='"+data[i].sub_id+"'>"+data[i].sub_name+"</option>");
						select.append(option);
					}
				}
			},
			error:function(){alert('科目信息加载出错!')}
		})
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
   	 				<a href="teachermain">首页</a> 
     				<a href="editsubject" >科目编辑</a>
   					<a href="editquestion">试卷编辑</a> 
   					<a href="http://www.chinanews.com/">新闻资讯</a> 
  					<a href="teacheraboutsystem">关于系统</a> 
				</div>
				<form action="searchpaper" method="post">
					<div class="fl search">
	            		<input type="text" value="搜索试题关键字" onfocus="if(this.value == '搜索试题关键字') {this.value='';}" onblur="if(this.value == '') {this.value='搜索试题关键字';}" maxlength="35" class="search-box" name="searchpaperName" id="keyword"/>
	            		<input name="提交" type="submit" class="btn" value=""/>
	        		</div>
        		</form>
        		<div class="fr islogin">
        			<a href="javascript:;" class="img-box"><img class="img-box" src="img/icon_user.png" style="width:30px;height:30px;"></a>
        			<a href="javascript:;" class="name" onmouseover="$('#info').css('display','block');" onmouseout = "$('#info').css('display','none');">教师端：<span id="user_name">${teacherName}</span> </a>
        			<a href="loginout" class="name" style="margin-left:25px;" onclick="alert('注销成功!');">注销</a>
        		</div>
        		<div id="info" style="z-index:9999;width:250px;height:80px;position:absolute;top:50px;right:150px;background:rgba(0,0,0,0.5);border-radius: 6px;color:white;text-align:left;padding-left:20px;font-size:16px;line-height:2.3;display:none;">
        			<div>教职工号：${tno}</div>
        			<div>邮箱：${teacherEmail}</div>
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
		
		
		<div id="questionFormDialog" class="easyui-dialog" data-options="closed:true,width:430,height:300,title:'新增试题'" style="display: none;top:25%;left:40%;">
		<div style="padding-top:30px;padding-left:80px;line-height:2;">
			<form id="addQuestionForm" action="addquestion" method="post" >
				<input type="hidden" value="add" name="action" />
				<input type="hidden" value="" name="paper_id" id="mainIdAdd" />
				<table style="text-align:center;padding:5px;" >
					<tr>
						<td>问题标题：</td>
						<td><input type="text" id="WENTI" name="que_name" /><label style="margin-left:10px;visibility:hidden;"><input type="radio" name="flag">正确</label></td>
					</tr>
					<tr>
						<td>问题类型：</td>
						<td>
							<select name="que_type" id="que_type">
								<option value="radio">单选题</option>
								<!--  <option value="checkbox">多选题</option>-->
							</select>
						</td>
					</tr>
					<tr>
						<td>分数：</td>
						<td><input type="text" id="FENSHU" name="que_grade" /><label style="margin-left:10px;visibility:hidden;"><input type="radio" name="flag">正确</label></td>
					</tr>
					<tr>
						<td>答案1：</td>
						<td><input type="text" id="DAAN1" name="ans_content1" /><label style="margin-left:10px;"><input type="radio" name="ans_content_check" value="1">正确</label></td>
					</tr>
					<tr>
						<td>答案2：</td>
						<td><input type="text" id="DAAN2" name="ans_content2" /><label style="margin-left:10px;"><input type="radio" name="ans_content_check" value="2">正确</label></td>
					</tr>
					<tr>
						<td>答案3：</td>
						<td><input type="text" id="DAAN3" name="ans_content3" /><label style="margin-left:10px;"><input type="radio" name="ans_content_check" value="3">正确</label></td>
					</tr>
					<tr>
						<td>答案4：</td>
						<td><input type="text" id="DAAN4" name="ans_content4" /><label style="margin-left:10px;"><input type="radio" name="ans_content_check" value="4">正确</label></td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
	    		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitAddQuestionForm('addQuestionForm')">保存</a>
	    		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearQuestionForm('addQuestionForm')">重置</a>
	    	</div>
	    </div>
	</div>

	<!--  增加更新试卷-->
	<div id="mainFormDialog" class="easyui-dialog" data-options="closed:true,width:430,height:300,title:'增加试卷'" style="display: none;top:25%;left:40%;">
		<div style="padding-top:30px;padding-left:80px;line-height:3;">
			<form id="editMainForm" action="addpaper" method="post" >
				<input type="hidden" value="" name="action" />
				<input type="hidden" value="" name="paper_id" class="paper_id">
				<table style="text-align:center;padding:5px" >
					<tr>
						<td>试卷名称：</td>
						<td><input type="text" id="BIATOadd" name="paper_name" /></td>
					</tr>
					<tr>
						<td>答题时间：</td>
						<td><input type="text" id="SHIJIANadd" name="paper_time_of_answers" /></td>
					</tr>
					<tr>
						<td>隶属于科目：</td>
						<td id="subjectInfoTd">
							<!--  <c:choose>
								<c:when test="${not empty sub_name }">
									<select name="sub_id" id="selectSubject">
										<c:forEach items="${sub_name }" var="item" varStatus="vs">
											<option value="${item.sub_id }">${item.sub_name }</option>
										</c:forEach>
									</select>
								</c:when>
							</c:choose>-->
						</td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
	    		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitAddPaperForm('editMainForm')">保存</a>
	    		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearQuestionForm('editMainForm')">重置</a>
	    	</div>
	    </div>
	</div>
	
		<script>
			
		
			//EasyUI方式提交表单,增加试卷信息
			function submitAddPaperForm(parm){
				$('#'+parm).form('submit',{
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success:function(data){
						if (data === "addyes"){
							alert ('试卷添加成功,请刷新一次!');
							$('#mainFormDialog').dialog('close');
							//window.location.href = 'editquestion';
						}
						else if(data === "addno"){
							alert ('试卷添加失败');
							$('#mainFormDialog').dialog('close');
						}
						else if(data === "updateyes"){
							alert ('试卷更新成功,请刷新一次!');
							$('#mainFormDialog').dialog('close');
							//window.location.href = 'editquestion';
						}
						else if(data === "updateno"){
							alert ('试卷更新失败');
							$('#mainFormDialog').dialog('close');
						}
					}
				});
			}
			
			
			//EasyUI方式提交表单,增加问题信息
			function submitAddQuestionForm(parm){
				$('#'+parm).form('submit',{
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success:function(data){
						console.log(data);
						if (data === "yes"){
							alert ('问题添加成功');
							$('#questionFormDialog').dialog('close');
							//window.location.href = 'editquestion';
						}
						else{
							alert ('问题添加失败');
							$('#editMainForm').dialog('close');
						}
					}
				});
			}
			
			
			function clearQuestionForm(parm){
				$('#'+parm).form('clear');
			}
			//新增窗口
			function openAddDialog(dialog){
				$("#"+dialog).find("[name='action']").val('add');
				$("#selectSubject").val(1);
				$("#BIATOadd").val("");
				$("#SHIJIANadd").val("");
				$("#"+dialog).show();
				$("#"+dialog).dialog("open");
			}
			//编辑窗口
			function openEditDialog(dialog,id,selectid,papername,answertime){
				//jquery 选择器 
				$("#"+dialog).find("[name='action']").val('edit');
				$("#"+dialog).find("input.paper_id").val(id);
				$("#selectSubject").val(selectid);
				$("#BIATOadd").val(papername);
				$("#SHIJIANadd").val(answertime);
				$("#"+dialog).show();
				$("#"+dialog).dialog("open");
				
			}
			//增加问题
			function openAddQuestionDialog (paperId){
				$('#questionFormDialog').show();
				$('#questionFormDialog').dialog("open");

				$("#mainIdAdd").val(paperId);
				
			}
		</script>
		
<!-- ************************************************列表********************************************************** -->
	<div class="easyui-panel" title="" style="width:100%">
		<table id="editQuestionDg" class="easyui-datagrid" title="列表"
					data-options="pagination:true,singleSelect:true,collapsible:true,method:'get',pageSize:10,rownumbers:true,singleSelect:true">
		</table>
		<div id="questionBar" style="height: auto">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true" onclick="openAddDialog('mainFormDialog')">新增</a>
		</div>
	</div>	
	<script type="text/javascript">
		$("#editQuestionDg").datagrid({
			url:'getPaper',
			toolbar: '#questionBar',
		    columns:[[
		              {field:'paper_name',title:'试卷名称',width:270},
		              {field:'paper_time_of_answer',title:'答题时间',width:100,formatter:function(value, row, index){
		            	  return value+"分钟";
		              }},
		              {field:'paper_creation_of_time',title:'创建时间',width:200},
		              {field:'sub_name',title:'科目',width:270},
		              {field:'paper_id',title:'编辑',width:270,formatter:function(value, row, index){
		            	  return "<a href='javascript:void(0)' onclick='  openEditDialog("+'"mainFormDialog","'+value+'","'+row.sub_id+'","'+row.paper_name+'","'+row.paper_time_of_answer+'"'+")'>编辑</a>"
	            	  		+"&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='deleteMain("+'"'+value+'"'+")'>删除</a>"
	            	  		+"&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='openAddQuestionDialog("+'"'+value+'"'+")'>增加问题</a>";
		              }}
		          ]]
		});
	
		function deleteMain(parm){
			var t = confirm("是否确认删除该试卷？");
    		if(t == true){
    			$.ajax({
    				url: "deleteMain",
    				type:"POST",
    				data:{"paper_id":parm},
    				success: function(data){
    					if(data == 'yes') {
    						alert ('试卷删除成功,请刷新一次!');
    						//window.location.href = 'editquestion';
    					}else{
    						alert ('试卷删除失败');
    					}
    				},
    				error:function(){'服务器无响应'}
    			});
    		}
    		else{
    			
    		}
		}
	</script>
</body>
</html>