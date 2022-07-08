package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DB;
import vo.Topic;

public class TopicManager {

	public static boolean save(Topic t) {
		Connection conn = DB.getConn();
		String sql = null;
		boolean b = false;
		sql = "insert into topic_info values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, t.getNumber());
			pstmt.setString(2, t.getName());
			pstmt.setString(3, t.getType());
			pstmt.setString(4, t.getKind());
			pstmt.setString(5, t.getSource());
			pstmt.setString(6, t.getStatus());
			pstmt.setString(7, t.getContent());
			pstmt.setString(8, t.getResult());
			pstmt.setString(9, t.getDirection());
			pstmt.setString(10, t.getTnumber());
			pstmt.setString(11, t.getSnumber());
			pstmt.execute();
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		return b;
	}

	public static int getTopics(List<Topic> topics, int pageNo, int pageSize, boolean status) {

		int totalRecords = -1;

		Connection conn = DB.getConn();
		String sql = null;
		if(status==true)
			sql = "select * from topic_info where hstatus='" + status + "'limit " + (pageNo - 1) * pageSize + "," + pageSize;
		else
			sql = "select * from topic_info limit " + (pageNo - 1) * pageSize + "," + pageSize;
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);

		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = null;
		rsCount = DB.getResultSet(stmtCount, "select count(*) from topic_info");

		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);

			while (rs.next()) {
				Topic topic = new Topic();
				topic.setContent(rs.getString("hcontent"));
				topic.setDirection(rs.getString("direction"));
				topic.setKind(rs.getString("hkind"));
				topic.setName(rs.getString("hname"));
				topic.setNumber(rs.getString("hno"));
				topic.setResult(rs.getString("hresult"));
				topic.setSnumber(rs.getString("sno"));
				topic.setSource(rs.getString("hsource"));
				topic.setStatus(rs.getString("hstatus"));
				topic.setType(rs.getString("htype"));
				topic.setTnumber(rs.getString("tno"));
				topics.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rsCount);
			DB.close(stmtCount);
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}

		return totalRecords;
	}

	public static boolean deleteByHno(String hno) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = null;
		sql = "delete from topic_info where hno = '" + hno + "'";
		Statement stmt = DB.getStatement(conn);
		try {
			DB.executeUpdate(stmt, sql);
			b = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
		return b;
	}

	public static boolean check(String tno, String hname) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from topic_info where tno = '" + tno + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			if (rs.next())
				b = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return b;
	}

	public static boolean update(Topic t) {
		Connection conn = DB.getConn();
		String sql = null;
		boolean b = false;
		sql = "update topic_info set htype=?, tno=?, hname=?, hsource=?, hkind=?, hstatus=?, hresult=?, sno=?, direction=?,  hcontent=? where hno = ?";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, t.getType());
			pstmt.setString(2, t.getTnumber());
			pstmt.setString(3, t.getName());
			pstmt.setString(4, t.getSource());
			pstmt.setString(5, t.getKind());
			pstmt.setString(6, t.getStatus());
			pstmt.setString(7, t.getResult());
			pstmt.setString(8, t.getSnumber());
			pstmt.setString(9, t.getDirection());
			pstmt.setString(10, t.getContent());
			pstmt.setString(11, t.getNumber());
			pstmt.executeUpdate();
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		return b;
	}
	
	public static boolean updatesno(String hno) {
		boolean b = false;
		
		Connection conn = DB.getConn();
		String sql2 = "select * from topic_info where hno = '" + hno + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql2);
		Topic t = new Topic();
		try {
			if (rs.next()){
				t.setContent(rs.getString("hcontent"));
				t.setDirection(rs.getString("direction"));
				t.setKind(rs.getString("hkind"));
				t.setName(rs.getString("hname"));
				t.setNumber(rs.getString("hno"));
				t.setResult(rs.getString("hresult"));
				t.setSnumber(rs.getString("sno"));
				t.setSource(rs.getString("hsource"));
				t.setStatus(rs.getString("hstatus"));
				t.setType(rs.getString("htype"));
				t.setTnumber(rs.getString("tno"));
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
			DB.close(stmt);
			DB.close(conn);
			return b;
		}
		String sql3 = "delete from topic_info where hno = '" + hno + "'";
		PreparedStatement pstmt3 = DB.prepare(conn, sql3);
		try {
			pstmt3.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
			DB.close(pstmt3);
			DB.close(conn);
			return b;
		}
		
		String sql4 = "insert into topic_info (hno,hname,htype,hkind,hsource,hstatus,hcontent,hresult,direction,tno)values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt4 = DB.prepare(conn, sql4);
		try {
			pstmt4.setString(1, t.getNumber());
			pstmt4.setString(2, t.getName());
			pstmt4.setString(3, t.getType());
			pstmt4.setString(4, t.getKind());
			pstmt4.setString(5, t.getSource());
			pstmt4.setString(6, t.getStatus());
			pstmt4.setString(7, t.getContent());
			pstmt4.setString(8, t.getResult());
			pstmt4.setString(9, t.getDirection());
			pstmt4.setString(10, t.getTnumber());
			pstmt4.execute();
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt4);
			DB.close(conn);
		}
		
		/*String sql = "update topic_info set sno=? where hno = ?";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, "");
			pstmt.setString(2, hno);
			pstmt.executeUpdate();
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}*/
		return b;
	}

	public static Topic getByNum(String num) {
		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from topic_info where hno='" + num + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		Topic topic = null;
		try {
			if (rs.next()) {
				topic = new Topic();
				topic.setContent(rs.getString("hcontent"));
				topic.setDirection(rs.getString("direction"));
				topic.setKind(rs.getString("hkind"));
				topic.setName(rs.getString("hname"));
				topic.setNumber(rs.getString("hno"));
				topic.setResult(rs.getString("hresult"));
				topic.setSnumber(rs.getString("sno"));
				topic.setSource(rs.getString("hsource"));
				topic.setStatus(rs.getString("hstatus"));
				topic.setType(rs.getString("htype"));
				topic.setTnumber(rs.getString("tno"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return topic;
	}

	public static List<Topic> getByTno(String num) {
		Connection conn = DB.getConn();
		String sql = null;
		List<Topic> topics = new ArrayList<Topic>();
		sql = "select * from topic_info where tno='" + num + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		Topic topic = null;
		try {
			while (rs.next()) {
				topic = new Topic();
				topic.setContent(rs.getString("hcontent"));
				topic.setDirection(rs.getString("direction"));
				topic.setKind(rs.getString("hkind"));
				topic.setName(rs.getString("hname"));
				topic.setNumber(rs.getString("hno"));
				topic.setResult(rs.getString("hresult"));
				topic.setSnumber(rs.getString("sno"));
				topic.setSource(rs.getString("hsource"));
				topic.setStatus(rs.getString("hstatus"));
				topic.setType(rs.getString("htype"));
				topic.setTnumber(rs.getString("tno"));
				topics.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return topics;
	}

	public static int query(List<Topic> topics, int pageNo, int pageSize, String str, String kind, String name, boolean status) {
		int totalRecords = -1;

		Connection conn = DB.getConn();
		String sql = null;
		if (str == null)
			str = "";
		if (kind == null)
			kind = "";
		if (name == null)
			name = "";
		if(status==true){
			sql = "select * from topic_info where hstatus='" + status + "' hname like '%" + name + "%' and htype like '%" + str
					+ "%' and hkind like '%" + kind + "%'";
			sql += "limit " + (pageNo - 1) * pageSize + "," + pageSize;
		}else{
			sql = "select * from topic_info where hname like '%" + name + "%' and htype like '%" + str
					+ "%' and hkind like '%" + kind + "%'";
			sql += "limit " + (pageNo - 1) * pageSize + "," + pageSize;
		}
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);

		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = null;
		rsCount = DB.getResultSet(stmtCount, "select count(*) from topic_info where hname like '%" + name
				+ "%' and htype like '%" + str + "%' and hkind like '%" + kind + "%'");

		try {
			if (rsCount != null)
				rsCount.next();
			totalRecords = rsCount.getInt(1);

			while (rs.next()) {
				Topic topic = new Topic();
				topic.setContent(rs.getString("hcontent"));
				topic.setDirection(rs.getString("direction"));
				topic.setKind(rs.getString("hkind"));
				topic.setName(rs.getString("hname"));
				topic.setNumber(rs.getString("hno"));
				topic.setResult(rs.getString("hresult"));
				topic.setSnumber(rs.getString("sno"));
				topic.setSource(rs.getString("hsource"));
				topic.setStatus(rs.getString("hstatus"));
				topic.setType(rs.getString("htype"));
				topic.setTnumber(rs.getString("tno"));
				topics.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rsCount);
			DB.close(stmtCount);
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}

		return totalRecords;
	}

	public static List<Topic> getByStatus(String num) {
		Connection conn = DB.getConn();
		List<Topic> topics = new ArrayList<Topic>();
		String sql = null;
		sql = "select * from topic_info where hstatus='" + num + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		Topic topic = null;
		try {
			while (rs.next()) {
				topic = new Topic();
				topic.setContent(rs.getString("hcontent"));
				topic.setDirection(rs.getString("direction"));
				topic.setKind(rs.getString("hkind"));
				topic.setName(rs.getString("hname"));
				topic.setNumber(rs.getString("hno"));
				topic.setResult(rs.getString("hresult"));
				topic.setSnumber(rs.getString("sno"));
				topic.setSource(rs.getString("hsource"));
				topic.setStatus(rs.getString("hstatus"));
				topic.setType(rs.getString("htype"));
				topic.setTnumber(rs.getString("tno"));
				topics.add(topic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return topics;
	}

	public static Topic getBySnum(String num) {
		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from topic_info where sno='" + num + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		Topic topic = null;
		try {
			if (rs.next()) {
				topic = new Topic();
				topic.setContent(rs.getString("hcontent"));
				topic.setDirection(rs.getString("direction"));
				topic.setKind(rs.getString("hkind"));
				topic.setName(rs.getString("hname"));
				topic.setNumber(rs.getString("hno"));
				topic.setResult(rs.getString("hresult"));
				topic.setSnumber(rs.getString("sno"));
				topic.setSource(rs.getString("hsource"));
				topic.setStatus(rs.getString("hstatus"));
				topic.setType(rs.getString("htype"));
				topic.setTnumber(rs.getString("tno"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return topic;
	}

	public static Topic getByTnumAndHname(String tnum, String hname) {
		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from topic_info where tno='" + tnum + "' and hname='" + hname + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		Topic topic = null;
		try {
			if (rs.next()) {
				topic = new Topic();
				topic.setContent(rs.getString("hcontent"));
				topic.setDirection(rs.getString("direction"));
				topic.setKind(rs.getString("hkind"));
				topic.setName(rs.getString("hname"));
				topic.setNumber(rs.getString("hno"));
				topic.setResult(rs.getString("hresult"));
				topic.setSnumber(rs.getString("sno"));
				topic.setSource(rs.getString("hsource"));
				topic.setStatus(rs.getString("hstatus"));
				topic.setType(rs.getString("htype"));
				topic.setTnumber(rs.getString("tno"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return topic;
	}
}
