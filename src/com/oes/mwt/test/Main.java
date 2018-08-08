package com.oes.mwt.test;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.oes.mwt.dao.DaoConnection;
import com.oes.mwt.entity.StudentInfo;

public class Main {
	
	public void connectJDBC() {
		DaoConnection dc = DaoConnection.initDaoConnection();
		int resultInt = 0;
		try {
			String id = "201521314324",psw="123456",name="xxx",email="815699563@qq.com";
			PreparedStatement 预处理执行 = dc.getPreExec(StudentInfo.INSERT.toString(),id,psw,name,email);
			resultInt = 预处理执行.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(resultInt);
	}
	
	@Test
	public void SELECTBYUSERNAME() {
		
		Map<String, Object> studentResult = new HashMap<String, Object>();
		String username = "201521314321";
		try {
			DaoConnection dc = DaoConnection.initDaoConnection();
			PreparedStatement preparedStatement = dc.getPreExec(StudentInfo.SELECTBYUSERNAME.toString(), username);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				studentResult.put(StudentInfo.SNO.toString(), resultSet.getString(1));
				System.out.println(resultSet.getString(1));
				studentResult.put(StudentInfo.STUDENTPSW.toString(), resultSet.getString(2));
				studentResult.put(StudentInfo.STUDENTNAME.toString(), resultSet.getString(3));
				studentResult.put(StudentInfo.STUDENTNAME.toString(), resultSet.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
