package util;

import java.sql.*;

/**
 * 
 * �����ݿ����ӵķ�װ
 *
 */
public class DB {
	/**
	 * ��ö�Ҫ�õ����ݿ������
	 *  
	 * @return �������ݿ������
	 */
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");// ���ݿ�������� �����ݿ�Ϊsqlserver ӦΪ��// ��"com.microsoft.sqlserver.jdbc.SQLServerDriver"��
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/select_course?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * ��ö����ݿ��Ԥ����� SQL ���Ķ���
	 * 
	 * @param conn
	 *            ���ݿ������
	 * @param sql
	 *            Ҫִ�е�SQL���
	 * @return ����Ԥ����� SQL ���Ķ���
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
	 *            ���ݿ������
	 * @return ����ִ�о�̬ SQL ������
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
	 *            ִ�о�̬SQl���Ķ���
	 * @param sql
	 *            Ҫִ�е�SQL���
	 * @return ִ�к�Ľ����
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
	 *            ��ִ̬��sql���Ķ���
	 * @param sql
	 *            Ҫִ�е�SQL���
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
	 * �ر����ݿ������
	 * 
	 * @param conn
	 *            ���ݿ������
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
	 * �ر�Statement
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
	 * �ر�ResultSet
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
