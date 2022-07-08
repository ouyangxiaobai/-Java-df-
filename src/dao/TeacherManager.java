package dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import vo.Teacher;
import util.DB;

public class TeacherManager {

	public static boolean save(Teacher te) {
		Connection conn = DB.getConn();
		String sql = null;
		boolean b = false;
		sql = "insert into teacher_info values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, te.getNumber());
			pstmt.setString(2, te.getName());
			pstmt.setString(3, te.getSex());
			pstmt.setString(4, te.getDept());
			pstmt.setString(5, te.getDegree());
			pstmt.setString(6, te.getTitle());
			pstmt.setShort(7, te.getRight());
			pstmt.setString(8, te.getPhone());
			pstmt.setString(9, te.getEmail());
			pstmt.setString(10, te.getGroup());
			pstmt.setString(11, te.getPassword());
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

	public static int getTeachers(List<Teacher> teachers, int pageNo, int pageSize) {

		int totalRecords = -1;

		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from teacher_info limit " + (pageNo - 1) * pageSize + "," + pageSize;
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);

		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = null;
		rsCount = DB.getResultSet(stmtCount, "select count(*) from teacher_info");

		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);

			while (rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setEmail(rs.getString("temail"));
				teacher.setGroup(rs.getString("tgroup"));
				teacher.setName(rs.getString("tname"));
				teacher.setNumber(rs.getString("tno"));
				teacher.setPassword(rs.getString("tpassword"));
				teacher.setPhone(rs.getString("ttel"));
				teacher.setDept(rs.getString("tdept"));
				teacher.setSex(rs.getString("tsex"));
				teacher.setDegree(rs.getString("tdegree"));
				teacher.setRight(rs.getShort("tright"));
				teacher.setTitle(rs.getString("ttitle"));
				teachers.add(teacher);
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

	public static boolean deleteByTno(String id) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = null;
		sql = "delete from teacher_info where tno = '" + id + "'";
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

	public static Teacher check(String num, String password) throws UserNotFoundException, PasswordNotCorrectException {
		Teacher teacher = null;
		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from teacher_info where tno = '" + num + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			if (!rs.next()) {
				throw new UserNotFoundException("用户不存在:" + num);
			} else {
				if (!password.equals(rs.getString("tpassword"))) {
					throw new PasswordNotCorrectException("密码不正确!");
				}
			}
			teacher = new Teacher();
			teacher.setEmail(rs.getString("temail"));
			teacher.setGroup(rs.getString("tgroup"));
			teacher.setName(rs.getString("tname"));
			teacher.setNumber(rs.getString("tno"));
			teacher.setPassword(rs.getString("tpassword"));
			teacher.setPhone(rs.getString("ttel"));
			teacher.setDept(rs.getString("tdept"));
			teacher.setSex(rs.getString("tsex"));
			teacher.setDegree(rs.getString("tdegree"));
			teacher.setRight(rs.getShort("tright"));
			teacher.setTitle(rs.getString("ttitle"));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return teacher;
	}

	public static Teacher getByTno(String num) {
		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from teacher_info where tno='" + num + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		Teacher teacher = null;
		try {
			if (rs.next()) {
				teacher = new Teacher();
				teacher.setEmail(rs.getString("temail"));
				teacher.setGroup(rs.getString("tgroup"));
				teacher.setName(rs.getString("tname"));
				teacher.setNumber(rs.getString("tno"));
				teacher.setPassword(rs.getString("tpassword"));
				teacher.setPhone(rs.getString("ttel"));
				teacher.setDept(rs.getString("tdept"));
				teacher.setSex(rs.getString("tsex"));
				teacher.setDegree(rs.getString("tdegree"));
				teacher.setRight(rs.getShort("tright"));
				teacher.setTitle(rs.getString("ttitle"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return teacher;
	}

	public static boolean update(Teacher te) {
		Connection conn = DB.getConn();
		String sql = null;
		boolean b = false;
		sql = "update teacher_info set tpassword=?, tgroup=?, tname=?, tsex=?, ttel=?, temail=?, tdept=?, ttitle=?, tright=?,  tdegree=? where tno = ?";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, te.getPassword());
			pstmt.setString(2, te.getGroup());
			pstmt.setString(3, te.getName());
			pstmt.setString(4, te.getSex());
			pstmt.setString(5, te.getPhone());
			pstmt.setString(6, te.getEmail());
			pstmt.setString(7, te.getDept());
			pstmt.setString(8, te.getTitle());
			pstmt.setShort(9, te.getRight());
			pstmt.setString(10, te.getDegree());
			pstmt.setString(11, te.getNumber());
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
	

	public static int query(List<Teacher> teachers, int pageNo, int pageSize, String dept, String num, String name) {
		int totalRecords = -1;

		Connection conn = DB.getConn();
		String sql = null;
		if (dept == null)
			dept = "";
		if (name == null)
			name = "";
		if (num == null)
			num = "";
		sql = "select * from teacher_info where tdept like '%" + dept + "%' and tname like '%" + name
				+ "%' and tno like '%" + num + "%'";
		sql += "limit " + (pageNo - 1) * pageSize + "," + pageSize;
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);

		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = null;
		rsCount = DB.getResultSet(stmtCount, "select count(*) from teacher_info where tdept like '%" + dept
				+ "%' and tname like '%" + name + "%' and tno like '%" + num + "%'");
		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);

			while (rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setEmail(rs.getString("temail"));
				teacher.setGroup(rs.getString("tgroup"));
				teacher.setName(rs.getString("tname"));
				teacher.setNumber(rs.getString("tno"));
				teacher.setPassword(rs.getString("tpassword"));
				teacher.setPhone(rs.getString("ttel"));
				teacher.setDept(rs.getString("tdept"));
				teacher.setSex(rs.getString("tsex"));
				teacher.setDegree(rs.getString("tdegree"));
				teacher.setRight(rs.getShort("tright"));
				teacher.setTitle(rs.getString("ttitle"));
				teachers.add(teacher);
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

	public static List<String> adds(String file) throws Exception{
		Connection conn = DB.getConn();
		Workbook info;
		List<String> tnumber = new ArrayList<String>();
		String sql = "insert into teacher_info values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
			info = Workbook.getWorkbook(new FileInputStream(file));
			Sheet sheet = info.getSheet(0);
			int size = sheet.getRows();
			for (int i = 1; i < size; i++) {
				Cell c = sheet.getCell(0, i);
				if (TeacherManager.getByTno(c.getContents().trim()) != null) {
					tnumber.add(c.getContents().trim());
					continue;
				}
				PreparedStatement pstmt = DB.prepare(conn, sql);
				for (int j = 0; j < 11; j++) {
					c = sheet.getCell(j, i);
					if (j != 6) {
						pstmt.setString(j + 1, c.getContents().trim());
					} else
						pstmt.setShort(j + 1, Short.parseShort(c.getContents()));
				}
				pstmt.execute();
			}
		
		return tnumber;
	}
}
