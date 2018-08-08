package com.oes.mwt.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.portlet.ModelAndView;

import com.oes.mwt.service.ExamService;
import com.oes.mwt.service.SystemService;
import com.oes.mwt.util.ExamUtils;


/**
 * 
 * @author 马伟涛
 * 
 * 控制器拦截登录、注册、注销操作
 * 
 * 这里使用4种请求方式 put、delete、get、post，对每种请求各司其职。
 * 
 * 1、get请求负责路径转发，查找
 * 2、delete请求负责删除数据
 * 3、put请求负责更新
 * 4、post请求负责新增
 * 
 */
@Controller
@SessionAttributes(value={"studentName","sno","studentEmail","teacherName","tno","teacherEmail","subId","subName"})
public class SystemLogin {
	//创建系统服务的对象
	private static final SystemService SYSTEM_SERVICE= new SystemService();
	
	//创建考试服务对象
	private static final ExamService EXAMSERVICE= new ExamService();
	
	//登录控制
	@RequestMapping("login_to_main")
	public String login(@RequestParam("userName")String userName,@RequestParam("passWord")String passWord,@RequestParam("position")String position,Model model){
//		System.out.println(userName);
//		System.out.println(passWord);
//		System.out.println(position);
		//判断选中学生端登录
		if(userName.equals("用户名/UID")||passWord.equals("******")&&position.equals(null)==false){
			model.addAttribute("message", "用户名或密码不能为空!");
			return "loginerror";
		}
		else {
			if(position.equals("1")){
				Map<String, Object> studentResult = SYSTEM_SERVICE.selectBySno(userName);
				if(studentResult != null){
					if(passWord.equals(studentResult.get("student_psw"))){
						model.addAttribute("studentName", studentResult.get("student_name"));
						model.addAttribute("sno", studentResult.get("sno"));
						model.addAttribute("studentEmail", studentResult.get("student_email"));
						model.addAttribute("message", "学生端登录成功!");
						return "studentmain";
					}
					else {
						model.addAttribute("message", "用户名或密码错误!");
						return "loginerror";
					}
				}
				else {
					model.addAttribute("message", "用户名或密码错误!");
					return "loginerror";
				}
			}
			//判断选中教师端登录
			else if(position.equals("2")){
				Map<String, Object> teacherResult = SYSTEM_SERVICE.selectByTno(userName);
				if(teacherResult != null){
					if(passWord.equals(teacherResult.get("teacher_psw"))){
						model.addAttribute("teacherName", teacherResult.get("teacher_name"));
						model.addAttribute("tno", teacherResult.get("tno"));
						model.addAttribute("teacherEmail", teacherResult.get("teacher_email"));
						model.addAttribute("message", "教师端登录成功!");
						return "teachermain";
					}
					else {
						model.addAttribute("message", "用户名或密码错误!");
						return "loginerror";
					}
				}
				else {
					model.addAttribute("message", "用户名或密码错误!");
					return "loginerror";
				}
			}
		}
		return  "404error_login";
	}
	
	//学生端首页关于系统
	@RequestMapping("studentaboutsystem")
	public ModelAndView studentAboutSystem(@ModelAttribute("studentName")String studentName,@ModelAttribute("sno")String sno,@ModelAttribute("studentEmail")String studentEmail){
//		System.out.println(studentName);
//		System.out.println(sno);
		ModelAndView modelAndView = new ModelAndView("studentaboutsystem.jsp");
		modelAndView.addObject("studentName",studentName);
		modelAndView.addObject("sno",sno);
		modelAndView.addObject("studentEmail",studentEmail);
		return modelAndView;
	}
	
	//教师端首页关于系统
	@RequestMapping("teacheraboutsystem")
	public ModelAndView teacherAboutSystem(@ModelAttribute("teacherName")String teacherName,@ModelAttribute("tno")String tno,@ModelAttribute("techerEmail")String techerEmail){
		ModelAndView modelAndView = new ModelAndView("teacheraboutsystem.jsp");
		modelAndView.addObject("teacherName",teacherName);
		modelAndView.addObject("tno",tno);
		modelAndView.addObject("techerEmail",techerEmail);
		return modelAndView;
	}
	
	//注销登录账号时清空session数据，再跳转到登录界面
	@RequestMapping("loginout")
	public ModelAndView  loginout(SessionStatus status){
		ModelAndView modelAndView = new ModelAndView("loginout.jsp");
		status.setComplete();
		return modelAndView;
	}
	
	//学生首页重定向
	@RequestMapping("studentmain")
	public ModelAndView studentMain(@ModelAttribute("studentName")String studentName,@ModelAttribute("sno")String sno,@ModelAttribute("studentEmail")String studentEmail){
		ModelAndView modelAndView = new ModelAndView("studentmain.jsp");
		modelAndView.addObject("studentName",studentName);
		modelAndView.addObject("sno",sno);
		modelAndView.addObject("studentEmail",studentEmail);
		return modelAndView;
	}
	
	//教师首页重定向
	@RequestMapping("teachermain")
	public ModelAndView teacherMain(@ModelAttribute("teacherName")String teacherName,@ModelAttribute("tno")String tno,@ModelAttribute("teacherEmail")String teacherEmail){
		ModelAndView modelAndView = new ModelAndView("teachermain.jsp");
		modelAndView.addObject("teacherName",teacherName);
		modelAndView.addObject("tno",tno);
		modelAndView.addObject("teacherEmail",teacherEmail);
		return modelAndView;
	}
	
	
	//学生端跳转到在线考试页面，传回学生基本信息
	@RequestMapping("subject")
	public ModelAndView studentSubject(@ModelAttribute("studentName")String studentName,@ModelAttribute("sno")String sno,@ModelAttribute("studentEmail")String studentEmail){
		ModelAndView modelAndView = new ModelAndView("subject.jsp");
		modelAndView.addObject("studentName",studentName);
		modelAndView.addObject("sno",sno);
		modelAndView.addObject("studentEmail",studentEmail);
		return modelAndView;
	}
	
	
	//学生端跳转到在线考试页面，利用ajax显示科目信息
	@RequestMapping("subject.action")
	@ResponseBody
	public List<Map<String, String>> studentSubjectAjax(){
		
		//将全部科目信息存入modelAndView传回到前台页面
		List<Map<String, String>> subjectListMap = EXAMSERVICE.getAllSubPage();
//		System.out.println(subjectListMap);
		return subjectListMap;
	}
		
	
	//取回前台用户在科目页面中点击的科目，获取科目ID和科目名称并存入session
	@RequestMapping("paper")
	public String getSubIdName(@RequestParam("subId") String subId,@RequestParam("subName") String subName,@ModelAttribute("studentName")String studentName,@ModelAttribute("sno")String sno,@ModelAttribute("studentEmail")String studentEmail,Model model){
//		ModelAndView modelAndView = new ModelAndView("paper.jsp"); 
		model.addAttribute("studentName",studentName);
		model.addAttribute("sno",sno);
		model.addAttribute("studentEmail",studentEmail);
		model.addAttribute("subId",subId);
		model.addAttribute("subName",subName);
//		System.out.println(subId);
//		System.out.println(subName);
		return "paper";
	}
	
	
	//利用Ajax显示点击相应科目的试卷信息
	@RequestMapping("paper.action")
	@ResponseBody
	public List<Map<String, String>> paperAjax(String subId){
		//将全部试卷信息存入modelAndView传回到前台页面
		List<Map<String, String>> paperListMap = EXAMSERVICE.getMainBySubject(subId);
//		System.out.println(paperListMap);
		return paperListMap;
	}
	
	
	//取回前台用户在科目页面中点击的科目，获取科目ID和科目名称并存入session
		@RequestMapping("que")
		public String getPaperIdName(@RequestParam("pI") String pI,@RequestParam("pT") String pT,@RequestParam("pG") String pG,@RequestParam("qC") String qC,@RequestParam("rC") String rC,@RequestParam("cC") String cC,@ModelAttribute("studentName")String studentName,@ModelAttribute("sno")String sno,@ModelAttribute("studentEmail")String studentEmail,Model model){
//			ModelAndView modelAndView = new ModelAndView("paper.jsp");
//			try {
//				paper = new String(paper .getBytes("iso8859-1"),"utf-8");
//			} catch (UnsupportedEncodingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} 
			//获取用户信息
			model.addAttribute("studentName",studentName);
			model.addAttribute("sno",sno);
			model.addAttribute("studentEmail",studentEmail);
			//获取试卷名、试卷id、试卷答题时间、试卷创建时间、试卷总分
//			model.addAttribute("pN",pN);
			model.addAttribute("pI",pI);
			model.addAttribute("pT",pT);
//			model.addAttribute("pC",pC);
			model.addAttribute("pG",pG);
			//获取试卷总题数、试卷单选题试卷、试卷多选题数量
			model.addAttribute("qC",qC);
			model.addAttribute("rC",rC);
			model.addAttribute("cC",cC);	
			return "question";
		}
		
		
		//利用Ajax显示点击相应试卷的问题信息
		@RequestMapping("question.action")
		@ResponseBody
		public Map<String,Object> questionAjax(String paperId){
			//将全部试卷信息存入modelAndView传回到前台页面
			Map<String,Object> questionMap = EXAMSERVICE.getAllQuestion(paperId);
//			System.out.println(questionMap.get("answers"));
			return questionMap;
		}
		
		//考试页面点击提交按钮后将数据传回后台计算成绩，并跳转到成绩查询页面显示学生学号的全部成绩记录
		@RequestMapping("jumpToGrade")
		public String jumpToGrade(@RequestBody MultiValueMap<String, String> body,@ModelAttribute("studentName")String studentName,@ModelAttribute("sno")String sno,@ModelAttribute("studentEmail")String studentEmail,Model model){
			model.addAttribute("studentName",studentName);
			model.addAttribute("sno",sno);
			model.addAttribute("studentEmail",studentEmail);
//			System.out.println(body);
//			Set<Entry<String, List<String>>> entrySet = body.entrySet();
//			System.out.println(entrySet);	
			int resultint = EXAMSERVICE.countScore(body, sno);
			if(resultint == 1){
				return "queryGrade";
			}
			else {
				return "loginerror";
			}
//			return "queryGrade";
		}
		
		
		
		//导航栏成绩查询页面，显示学生成绩记录
		@RequestMapping("queryGrade")
		public String studentGrade(@ModelAttribute("studentName")String studentName,@ModelAttribute("sno")String sno,@ModelAttribute("studentEmail")String studentEmail,Model model){
			model.addAttribute("studentName",studentName);
			model.addAttribute("sno",sno);
			model.addAttribute("studentEmail",studentEmail);
			return "queryGrade";
		}
		//利用Ajax显示学生成绩信息
		@RequestMapping("queryGrade.action")
		@ResponseBody
		public List<Map<String, String>> gradeAjax(String sno){
			//将全部学生成绩通过ajax传回到前台页面
			List<Map<String, String>> gradeMap = EXAMSERVICE.getSnoGrade(sno);
//			System.out.println(gradeMap);
			return gradeMap;
		}
		
		//跳转搜索结果页面
		@RequestMapping("searchpaper")
		public String searchpaper(@RequestParam String searchpaperName,@ModelAttribute("studentName")String studentName,@ModelAttribute("sno")String sno,@ModelAttribute("studentEmail")String studentEmail,Model model){
			model.addAttribute("studentName",studentName);
			model.addAttribute("sno",sno);
			model.addAttribute("studentEmail",studentEmail);
			model.addAttribute("searchpaperName",searchpaperName);
			return "searchpaper";
		}
		
		//利用Ajax显示搜索的试卷信息
		@RequestMapping("searchpaperaction")
		@ResponseBody
		public List<Map<String, String>> searchpaperAjax(String searchpaperName){
			//将全部试卷信息存入modelAndView传回到前台页面
			List<Map<String, String>> paperListMap = EXAMSERVICE.searchPaper(searchpaperName);
//			System.out.println(paperListMap);
			return paperListMap;
		}
		
		
		//教师科目编辑页面
		@RequestMapping("editsubject")
		public String editsubject(@ModelAttribute("teacherName")String teacherName,@ModelAttribute("tno")String tno,@ModelAttribute("teacherEmail")String teacherEmail,Model model){
			model.addAttribute("teacherName",teacherName);
			model.addAttribute("tno",tno);
			model.addAttribute("teacherEmail",teacherEmail);
			return "editsubject";
		}
		
		
		//教师端显示全部科目信息
		@RequestMapping("getSubject")
		@ResponseBody
		public String getSubject(@RequestParam("page")String strpage,@RequestParam("rows")String strrows) throws Exception{
//			System.out.println(page);
//			System.out.println(rows);
			Integer page = Integer.parseInt(strpage);
			Integer row = Integer.parseInt(strrows);
			if (page > 0){
				page = (page-1)*row;
			}
			List<Map<String, String>> listMaps = EXAMSERVICE.getSubPage(page, row);
			long count = EXAMSERVICE.getSubCount();
			String sb = ExamUtils.getEasyUIDataGridModel(listMaps, count);
//			System.out.println(listMaps.toString());
			//将List<Map<String, String>>转换成json
//			StringBuilder sb = new StringBuilder();//用了stringbuffer，效率快，但是线程不安全的  
//			sb.append("[");  
//			  
//		       for (Map<String, String> map : listMaps) {//这里用了增强for遍历  
//		  
//		           for (String key : map.keySet()) {   
//		                 
//		               //根据不同需求，拼接数据  
//		               sb.append("{").append("\"").append(key).append("\":\"").append(map.get(key))  
//		                       .append("\"").append("}").append(",");  
//		           }  
//		  
//		       }  
//		         
//		       sb.deleteCharAt(sb.lastIndexOf(","));  
//		       sb.append("]");  
		         
//		       System.out.println(sb);//看看结果是不是自己想要的  
		       return sb;//返回需要的结果
		}
		
		
		//教师端删除科目
		@RequestMapping("deletesubject")
		@ResponseBody
		public String deleteSubject(String sub_id){
//			System.out.println(sub_id);
			int checkdelete = EXAMSERVICE.deleteById(sub_id);
			if(checkdelete != 0){
				return "yes";
			}
			else {
				return "no";
			}
		}
		//教师端添加科目
		@RequestMapping("addsubject")
		@ResponseBody
		public String addSubject(@RequestParam("subName")String subName) {
			int checkinsert = EXAMSERVICE.insert(subName);
			if(checkinsert != 0){
				return "yes";
			}
			else {
				return "no";
			}
		}
		//教师端更新科目
		@RequestMapping("updatesubject")
		@ResponseBody
		public String updateSubject(@RequestParam("sub_id")String sub_id,@RequestParam("sub_name")String sub_name) {
			int checkupdate = EXAMSERVICE.updateById(sub_name, sub_id);
//			System.out.println(sub_id);
//			System.out.println(sub_name);
			if(checkupdate != 0){
				return "yes";
			}
			else {
				return "no";
			}
		}
		
		//教师科目编辑页面
		@RequestMapping("editquestion")
		public String editquestion(@ModelAttribute("teacherName")String teacherName,@ModelAttribute("tno")String tno,@ModelAttribute("teacherEmail")String teacherEmail,Model model){
			model.addAttribute("teacherName",teacherName);
			model.addAttribute("tno",tno);
			model.addAttribute("teacherEmail",teacherEmail);
			return "editquestion";
		}
				
				
		//教师端显示全部科目信息
		@RequestMapping("getPaper")
		@ResponseBody
		public Map<String, Object> getPaper(@RequestParam("page")String strpage,@RequestParam("rows")String strrows) throws Exception{
			Integer page = Integer.parseInt(strpage);
			Integer row = Integer.parseInt(strrows);
			if (page > 0){
				page = (page-1)*row;
			}
			List<Map<String, String>> listMaps = EXAMSERVICE.getMain(page, row);
//			System.out.println(listMaps);
			long count = EXAMSERVICE.getMainCount();
//			String sb = ExamUtils.getEasyUIDataGridModel(listMaps, count);
//			System.out.println(sb);
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("rows", listMaps);
			resultMap.put("total", count);
		    return resultMap;//返回需要的结果
		}
		
		
		//通过ajax显示点击新增编辑时列出隶属于的科目信息
		@RequestMapping("getsubinfo.action")
		@ResponseBody
		public List<Map<String, String>> getSubInfo(){
			
			//将全部科目信息存入modelAndView传回到前台页面
			List<Map<String, String>> subjectListMap = EXAMSERVICE.getAllSubPage();
//			System.out.println(subjectListMap);
			return subjectListMap;
		}
		
		
		//教师端删除科目
		@RequestMapping("deleteMain")
		@ResponseBody
		public String deleteMain(String paper_id){
//			System.out.println(sub_id);
			int checkdelete = EXAMSERVICE.deleteByPaperId(paper_id);
			if(checkdelete != 0){
				return "yes";
			}
			else {
				return "no";
			}
		}
		
		
		//教师端添加试卷
		@RequestMapping("addpaper")
		@ResponseBody
		public String addPaper(@RequestParam("action")String action,@RequestParam("paper_name")String paper_name,
				@RequestParam("paper_time_of_answers")String paper_time_of_answers,@RequestParam("sub_id")String sub_id,@RequestParam("paper_id")String paper_id) {
//			System.out.println(action);
			//判断请求参数字符串是否与某个值相等要用equals方法
			if(action.equals("add")){
				int checkinsert = EXAMSERVICE.insertMain(paper_name, paper_time_of_answers, sub_id);
//				System.out.println(checkinsert);
				if(checkinsert != 0){
					return "addyes";
				}
				else {
					return "addno";
				}
			}
			else {
				int checkupdate = EXAMSERVICE.updatetMain(paper_name, paper_time_of_answers, sub_id, paper_id);
				if(checkupdate != 0){
					return "updateyes";
				}
				else {
					return "updateno";
				}
			}
		}
		
		
		//教师端添加问题到试卷
		@RequestMapping("addquestion")
		@ResponseBody
		public String addQuestion(@RequestParam("paper_id")String paper_id,@RequestParam("que_name")String que_name,
				@RequestParam("que_type")String que_type,@RequestParam("que_grade")Integer que_grade,
				@RequestParam("ans_content1")String ans_content1,
				@RequestParam("ans_content2")String ans_content2,
				@RequestParam("ans_content3")String ans_content3,
				@RequestParam("ans_content4")String ans_content4,@RequestParam("ans_content_check")String ans_content_check){
			
			int lastAnsId = EXAMSERVICE.getLastAnsId();
//			System.out.println(lastAnsId);
			
			
			List<String> check = new ArrayList<>();
			Map<String,String> answerMap= new HashMap<>();
			
			String ansId1 = (lastAnsId+1)+"";
			answerMap.put(ansId1, ans_content1);
			String ansId2 = (lastAnsId+2)+"";
			answerMap.put(ansId2, ans_content2);
			String ansId3 = (lastAnsId+3)+"";
			answerMap.put(ansId3, ans_content3);
			String ansId4 = (lastAnsId+4)+"";
			answerMap.put(ansId4, ans_content4);
//			System.out.println(ans_content_check);
			if (ans_content_check.equals("1")){
				check.add(ansId1);
			}
			
			if (ans_content_check.equals("2")){
				check.add(ansId2);
			}
			
			if (ans_content_check.equals("3")){
				check.add(ansId3);
			}
			
			if (ans_content_check.equals("4")){
				check.add(ansId4);
			}
			//List转换为String[],这里我们使用的是答案编码，答案编码的实现是通过UUID生成字符串，
			//转换为char[]，把char[]里的每一个元素转换为对应的ascⅡ码，把ascⅡ码相加得出答案编码
//			System.out.println(check);
			long que_answer_code = ExamUtils.statistics(check);
			int checkinsert = EXAMSERVICE.InsertQuestionAndAnswers(que_name, que_type, que_answer_code, que_grade, paper_id, answerMap);
//			System.out.println(checkinsert);
			if(checkinsert != 0){
				return "yes";
			}
			else {
				return "no";
			}
		}
		
		
}
