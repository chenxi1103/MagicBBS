package cn.chenxi.bbs.DBUtils;

import java.beans.PropertyVetoException;
import java.sql.SQLException;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mysql.jdbc.Connection;

public class C3p0Utils {
	private static ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
	static {
		try {
			comboPooledDataSource.setDriverClass("com.mysql.jdbc.Driver");
			comboPooledDataSource.setJdbcUrl("jdbc:mysql://127.0.0.1:3306/bbs_data?useSSL=false");
			comboPooledDataSource.setUser("root");
			comboPooledDataSource.setPassword("123456");
		} catch (PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static ComboPooledDataSource getDataSource() {
		return comboPooledDataSource;
	}
	public static Connection getConnection() {
		try {
			return (Connection) comboPooledDataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}	
}
