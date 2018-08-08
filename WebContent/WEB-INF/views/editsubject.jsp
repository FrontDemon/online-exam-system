<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科目编辑页面</title>
<link rel="stylesheet" type="text/css" href="js/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="js/themes/color.css">
<link rel="stylesheet" type="text/css" href="js/themes/icon.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<style type="text/css">
	.headbar .box a:hover{color:#ee491f;text-decoration:none;text-shadow: 0px 0.5px 1px #ee491f;}
</style>
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
		
		
		<!--  easyui编辑页面-->
		<!--  新增科目-->
		<div id="formdialog" class="easyui-dialog" data-options="closed:true,width:430,height:300,title:'新增科目'" style="display: none;top:25%;left:40%;">
			<div style="padding-top:50px;padding-left:80px;font-size:18px;">
				<form id="addSubiectForm" action="addsubject" method="post" >
					<input type="hidden" value="add" name="action" />
					<table style="text-align:center;padding:5px" >
						<tr>
							<td>科目名称：</td>
							<td><input type="text" id="subName" name="subName" style="height:22px;"/></td>
						</tr>
					</table>
				</form>
				<div style="text-align:center;padding:5px;margin-top:20px;">
		    		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm('addSubiectForm')">保存</a>
		    		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm('addSubiectForm')" style="margin-left:20px;">重置</a>
		    	</div>
		    </div>
		</div>
	<!--  修改科目-->
	<div id="formEditdialog" class="easyui-dialog" data-options="closed:true,width:430,height:300,title:'修改科目'" style="display: none;top:25%;left:40%;">
		<div style="padding-top:50px;padding-left:80px;font-size:18px;">
			<form id="updateSubiectForm" action="updatesubject" method="post" >
				<input type="hidden" value="" name="sub_id" id="sub_idedit" />
				<input type="hidden" value="edit" name="action" />
				<table style="text-align:center;padding:5px" >
					<tr>
						<td>科目名称：</td>
						<td><input type="text" id="KEMUedit" name="sub_name" style="height:22px;"/></td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px;margin-top:20px;">
	    		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updatesubmitForm('updateSubiectForm')">保存</a>
	    		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm('updateSubiectForm')">重置</a>
	    	</div>
	    </div>
	</div>
	
		<script>
		//easyui提交表单 ，增加科目操作
			function submitForm(parm){
				$('#'+parm).form('submit',{
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success:function(data){
						if (data === "yes" ){
							alert ('科目添加成功,请刷新一次!');
							$('#formdialog').dialog('close');
							//window.location.href = 'editsubject';
						}else{
							alert ('科目添加失败');
							$('#formdialog').dialog('close');
						}
					}
				});
			}
			//easyui提交表单 ，更新科目操作
			function updatesubmitForm(parm){
				$('#'+parm).form('submit',{
					onSubmit:function(){
						return $(this).form('enableValidation').form('validate');
					},
					success:function(data){
						if (data === "yes" ){
							alert ('科目更新成功,请刷新一次!');
							$('#formEditdialog').dialog('close');
							//window.location.href = 'editsubject';
						}else{
							alert ('科目更新失败');
							$('#formEditdialog').dialog('close');
						}
					}
				});
			}
			
			
			
			
			
			function clearForm(parm){
				$('#'+parm).form('clear');
			}
			
			function openSubjectAddDialog(){
				$("#formdialog").show();
				$("#formdialog").dialog("open");
			}
		</script>

	
	<!-- *******************************************************  SUBJECT 列表        *********************************************************************************** -->
	
	<div class="easyui-panel" title="" style="width:100%;">
		<table id="editSubjectDg" class="easyui-datagrid" title="列表"
					data-options="pagination:true,singleSelect:true,collapsible:true,method:'get',pageSize:10,rownumbers:true,singleSelect:true">		
		</table>
		<div id="subjectBar" style="height: auto">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true" onclick="openSubjectAddDialog()">新增</a>
		</div>
	</div>	
	<script type="text/javascript">
			
				$("#editSubjectDg").datagrid({
					url:'getSubject',
					toolbar: '#subjectBar',
				    columns:[[
				              {field:'sub_name',title:'科目',width:300},
				              {field:'sub_creation_time',title:'创建时间',width:300},
				              {field:'sub_id',title:'编辑',width:350,formatter: function(value, row, index){
				            	  return "<a href='javascript:void(0)' onclick='editSubject("+'"'+value+'","'+row.sub_name+'"'+")'>编辑</a>"
				            	  		+"&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='deleteSubject("+'"'+value+'"'+")'>删除</a>";
				              }}
				          ]]
				});
			
				function deleteSubject(parm){
					var t = confirm("是否确认删除该科目？");
		    		if(t == true){
		    			$.ajax({
							url: "deletesubject",
							type:"POST",
							data:{"sub_id":parm},
							success: function(data){
								if(data == 'yes') {
									alert ('科目删除成功,请刷新一次!');
								}else{
									alert ('科目删除失败');
								}
							},
							error:function(){'服务器无响应'}
						});
		    		}
		    		else{
		    			
		    		}
				}
				
				function editSubject(sub_id,sub_name){

					$("#KEMUedit").val(sub_name);
					$("#sub_idedit").val(sub_id)
					
					$("#formEditdialog").show();
					$("#formEditdialog").dialog("open");
					
				}
				
		</script>
</body>
</html>