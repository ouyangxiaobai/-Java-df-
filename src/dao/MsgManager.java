package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.Msg;
import util.DB;

public class MsgManager {
	/**
	 * 获取所有Msg的标题
	 * 
	 * @return 返回存放所有Msg标题的字符串数组
	 */
	public static String[] getTitles() {
		String[] ts = new String[10000];
		Connection conn = DB.getConn();// 调用DB类中静态方法获得数据库的连接
		String sql = "select title from msg";
		Statement stmt = DB.getStatement(conn);// 调用DB内中得静态方法执行sql语句
		ResultSet rs = DB.getResultSet(stmt, sql);// 获得结果集
		try {
			int i = 0;
			/*
			 * 将结果集中得数据放到字符串数组中
			 */
			while (rs.next()) {
				ts[i] = rs.getString("title");
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ts;
	}

	public static List<Msg> getMsgs() {
		Connection conn = DB.getConn();
		String sql = "select * from msg ";
		List<Msg> msgs = new ArrayList<Msg>();
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				/*
				 * 将结果集中的数据存放到Msg对象的List中
				 */
				Msg msg = new Msg();
				msg.setText(rs.getString("text"));
				msg.setTitle(rs.getString("title"));
				msgs.add(msg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return msgs;
	}

	public static String getTexts(String til) {
		String ts = null;
		Connection conn = DB.getConn();
		String sql = "select text from msg where title='" + til + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				ts = rs.getString("text");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return ts;
	}

	public static boolean insert(Msg msg) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = "insert into msg values('" + msg.getTitle() + "','" + msg.getText() + "')";
		Statement stmt = DB.getStatement(conn);
		try {
			stmt.executeUpdate(sql);
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return b;
	}

	public static boolean delete(String til) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = "delete from msg where title='" + til + "'";
		Statement stmt = DB.getStatement(conn);
		try {
			stmt.executeUpdate(sql);
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return b;
	}
}
