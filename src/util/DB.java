package util;

import java.sql.*;

/**
 * 
 * 对数据库连接的封装
 *
 */
public class DB {
	/**
	 * 获得对要用的数据库的连接
	 *  
	 * @return 返回数据库的连接
	 */
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");// 数据库的驱动类 若数据库为sqlserver 应为：// （"com.microsoft.sqlserver.jdbc.SQLServerDriver"）
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/select_course?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 获得多数据库的预编译的 SQL 语句的对象
	 * 
	 * @param conn
	 *            数据库的连接
	 * @param sql
	 *            要执行的SQL语句
	 * @return 返回预编译的 SQL 语句的对象
	 */
	public static PreparedStatement prepare(Connection conn, String sql) {
		PreparedStatement pstmt = null;
		try {
			if (conn != null) {
				pstmt = conn.prepareStatement(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}

	/**
	 * 
	 * @param conn
	 *            数据库的连接
	 * @return 返回执行静态 SQL 语句对象
	 */
	public static Statement getStatement(Connection conn) {
		Statement stmt = null;
		try {
			if (conn != null) {
				stmt = conn.createStatement();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}

	/**
	 * 
	 * @param stmt
	 *            执行静态SQl语句的对象
	 * @param sql
	 *            要执行的SQL语句
	 * @return 执行后的结果集
	 */
	public static ResultSet getResultSet(Statement stmt, String sql) {
		ResultSet rs = null;
		try {
			if (stmt != null) {
				rs = stmt.executeQuery(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 
	 * @param stmt
	 *            静态执行sql语句的对象
	 * @param sql
	 *            要执行的SQL语句
	 */

	public static void executeUpdate(Statement stmt, String sql) {
		try {
			if (stmt != null) {
				stmt.executeUpdate(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 关闭数据库的连接
	 * 
	 * @param conn
	 *            数据库的连接
	 */

	public static void close(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 关闭Statement
	 * 
	 * @param stmt
	 */
	public static void close(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 关闭ResultSet
	 * 
	 * @param rs
	 */
	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
