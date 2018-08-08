package com.oes.mwt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.junit.Test;


/**
 * 
 * @author 马伟涛 JDBC,初始化与MySQL数据库的连接
 */

public class DaoConnection {

	private static DaoConnection dc;

	private Connection JDBCConnection;

	private static final String url = "jdbc:mysql://127.0.0.1:3306/online_exam?useUnicode=true&characterEncoding=utf-8";
	private static final String username = "root";
	private static final String password = "123456";
	private static final String driver = "com.mysql.jdbc.Driver";

	// 私有构造函数
	private DaoConnection() {}

	// 匿名内部类加载驱动类
	{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 初始化
	public static DaoConnection initDaoConnection() {
		if (dc == null) {
			dc = new DaoConnection();
		}
		return dc;
	}

	/**
	 * @return the jDBC连接
	 * @throws SQLException
	 */
	public Connection getJDBCConnection() throws SQLException {
		JDBCConnection = DriverManager.getConnection(url, username, password);
		return JDBCConnection;
	}
	
	/**
	 * 
	 * @param sql
	 * @param paramArr
	 * @return
	 * @throws SQLException
	 */
	//Object ...objects这种参数定义是在不确定方法参数的情况下的一种多态表现形式。即这个方法可以传递多个参数，这个参数的个数是不确定的
	public PreparedStatement getPreExec(String sql, Object...paramArr) throws SQLException {
		
		DaoConnection dc = initDaoConnection();

		PreparedStatement ps = dc.getJDBCConnection().prepareStatement(sql);
		int i = 1;
		if (paramArr != null & paramArr.length > 0) {
			for (Object param : paramArr) {
				ps.setObject(i, param);
				i++;
			}
		}
		return ps;
	}
}
