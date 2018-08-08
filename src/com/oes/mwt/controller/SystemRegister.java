package com.oes.mwt.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oes.mwt.service.SystemService;
import com.oes.mwt.util.EmailUtil;

@Controller
public class SystemRegister {
	//新建一个系统服务的对象
	private static final SystemService SYSTEM_SERVICE= new SystemService();
	
	//控制注册
	@RequestMapping("register_to_login")
	public String register(@RequestParam("user")String user,@RequestParam("psw")String psw,@RequestParam("name")String name,@RequestParam("position")String position,@RequestParam("email")String email,Model model){
//		System.out.println(position.toString());
		if(!user.equals("")&&!psw.equals("")&&!name.equals("")&&!email.equals("")){
			System.out.println(user);
			//判断为学生端
			if(position.equals("1")){
				//判断学号长度是否为12
				if(user.length() == 12){
					//判断邮箱是否合法
					boolean flag = EmailUtil.isEmail(email);
//					System.out.println(email);
//					System.out.println(flag);
					if(!flag){
						model.addAttribute("message", "注册邮箱不合法!");
						return "registererror";
					}
					else {
//						try {
//							name = new String(name.getBytes(),"ISO8859_1");
//						} catch (UnsupportedEncodingException e) {
//							// TODO Auto-generated catch block
//							e.printStackTrace();
//						}
//						System.out.println(name);
						int insertStudentInfo = SYSTEM_SERVICE.insertStudentInfo(user, psw, name, email);
//						System.out.println(insertStudentInfo);
						if(insertStudentInfo != 0){
							model.addAttribute("message", "学生端注册成功，请登录!");
							return "registersuccess";
						}
						else {
							model.addAttribute("message", "该用户名已被注册!");
							return "registererror";
						}
					}
				}
//				else if(user.length() == 0){
//					model.addAttribute("message", "");
//					return "registererror";
//				}
				else {
					model.addAttribute("message", "学生学号长度应为12位数!");
					return "registererror";
				}
			}
			//判断为教师端
			else if(position.equals("2")){
				//判断教工号长度是否为6位数
				if(user.length() == 6){
					//判断邮箱是否合法
					boolean flag = EmailUtil.isEmail(email);
					if(!flag){
						model.addAttribute("message", "注册邮箱不合法!");
						return "registererror";
					}
					else {
						int insertTeacherInfo = SYSTEM_SERVICE.insertTeacherInfo(user, psw, name, email);
						if(insertTeacherInfo != 0){
							model.addAttribute("message", "教师端注册成功，请登录!!");
							return "registersuccess";
						}
						else {
							model.addAttribute("message", "该用户名已被注册!");
							return "registererror";
						}
					}
				}
				else {
					model.addAttribute("message", "教师教职工号长度应为6位数!");
					return "registererror";
				}
			}
		}
		else {
			model.addAttribute("message", "请填写完整的注册表单!");
			return "registererror";
		}
		return "404error_register";
		
	}
	//Ajax验证用户名是否已存在
	@RequestMapping("checkUser.action")
	@ResponseBody
	public String checkUser(String user){
		int checkuser = SYSTEM_SERVICE.checkSno(user);
		if(checkuser != 0){
			return "no";
		}
		else {
			return "yes";
		}
	}
	
	@RequestMapping("checkTeacher.action")
	@ResponseBody
	public String checkTeacher(String user){
		int checkteacher = SYSTEM_SERVICE.checkTno(user);
		if(checkteacher != 0){
			return "no";
		}
		else {
			return "yes";
		}
	}
}
