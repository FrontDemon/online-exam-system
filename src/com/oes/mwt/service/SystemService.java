package com.oes.mwt.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.oes.mwt.dao.DaoConnection;
import com.oes.mwt.entity.StudentInfo;
import com.oes.mwt.entity.TeacherInfo;



/**
 * 
 * @author 马伟涛
 * 
 *         系统服务层处理系统层面的操作，如登陆，注册，注销等等
 *
 */
public class SystemService {
	
	//返回学生登录后的结果集
	public Map<String, Object> selectBySno(String username) {

		Map<String, Object> studentResult = new HashMap<String, Object>();

		try {
			DaoConnection dc = DaoConnection.initDaoConnection();
			PreparedStatement preparedStatement = dc.getPreExec(StudentInfo.SELECTBYUSERNAME.toString(), username);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				studentResult.put(StudentInfo.SNO.toString(), resultSet.getString(1));
				studentResult.put(StudentInfo.STUDENTPSW.toString(), resultSet.getString(2));
				studentResult.put(StudentInfo.STUDENTNAME.toString(), resultSet.getString(3));
				studentResult.put(StudentInfo.STUDENTEMAIL.toString(), resultSet.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return studentResult;
	}
	
	//返回教师结果集
	public Map<String, Object> selectByTno(String username) {

		Map<String, Object> teachertResult = new HashMap<String, Object>();

		try {
			DaoConnection dc = DaoConnection.initDaoConnection();
			PreparedStatement preparedStatement = dc.getPreExec(TeacherInfo.SELECTBYUSERNAME.toString(), username);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				teachertResult.put(TeacherInfo.TNO.toString(), resultSet.getString(1));
				teachertResult.put(TeacherInfo.TEACHERPSW.toString(), resultSet.getString(2));
				teachertResult.put(TeacherInfo.TEACHERNAME.toString(), resultSet.getString(3));
				teachertResult.put(TeacherInfo.TEACHEREMAIL.toString(), resultSet.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return teachertResult;
	}
	
	//学生注册成功后插入数据库学生信息表
	public int insertStudentInfo (String sno,String psw,String studentname,String studentemai){
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		int resultInt = 0;
		try {
			PreparedStatement preparedStatement = dc.getPreExec(StudentInfo.INSERT.toString(),sno,psw,studentname,studentemai);
			resultInt = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultInt;
	}
	//教师注册成功后插入数据库教师信息表
	public int insertTeacherInfo (String tno,String psw,String teachername,String teacheremai){
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		int resultInt = 0;
		try {
			PreparedStatement preparedStatement = dc.getPreExec(StudentInfo.INSERT.toString(),tno,psw,teachername,teacheremai);
			resultInt = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultInt;
	}
	
	//验证学名是否已存在
	public int checkSno (String sno){
//		System.out.println(sno);
		DaoConnection dc = DaoConnection.initDaoConnection();
		int resultInt = 0;
		try {
			PreparedStatement preparedStatement = dc.getPreExec(StudentInfo.SELECTBYSNO.toString(),sno);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.last();
			resultInt = resultSet.getRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultInt;
	}
	
	//验证教师名是否已存在
	@Test
	public int checkTno (String tno){
		DaoConnection dc = DaoConnection.initDaoConnection();
		int resultInt = 0;
		try {
			PreparedStatement preparedStatement = dc.getPreExec(TeacherInfo.SELECTBYTNO.toString(),tno);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.last();
			resultInt = resultSet.getRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultInt;
	}
}
