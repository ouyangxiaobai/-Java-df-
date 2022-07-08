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
import util.DB;
import vo.Student;

public class StudentManager {

	public static boolean save(Student stu) {
		Connection conn = DB.getConn();
		String sql = null;
		boolean b = false;
		sql = "insert into student_info values (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = DB.prepare(conn, sql);// 预编译插入语句
		try {
			/*
			 * 将stu中保存的信息分别放到数据库中对应表的对应列上
			 */
			pstmt.setString(1, stu.getNumber());
			pstmt.setString(2, stu.getName());
			pstmt.setString(3, stu.getSex());
			pstmt.setString(4, stu.getSclass());
			pstmt.setString(5, stu.getPhone());
			pstmt.setString(6, stu.getEmail());
			pstmt.setString(7, stu.getGroup());
			pstmt.setString(8, stu.getPassword());
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

	public static int getStudents(List<Student> students, int pageNo, int pageSize) {

		int totalRecords = -1;

		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from student_info limit " + (pageNo - 1) * pageSize + "," + pageSize;
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);

		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = null;
		rsCount = DB.getResultSet(stmtCount, "select count(*) from student_info");

		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);// 得到结果集中一共有多少条记录

			while (rs.next()) {
				Student student = new Student();
				student.setEmail(rs.getString("semail"));
				student.setGroup(rs.getString("sgroup"));
				student.setName(rs.getString("sname"));
				student.setNumber(rs.getString("sno"));
				student.setPassword(rs.getString("spassword"));
				student.setPhone(rs.getString("stel"));
				student.setSclass(rs.getString("sclass"));
				student.setSex(rs.getString("ssex"));
				students.add(student);
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

	public static boolean deleteBySno(String id) {
		boolean b = false;
		Connection conn = DB.getConn();
		String sql = null;
		sql = "delete from student_info where sno = '" + id + "'";
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

	/**
	 * 检查登录时学号和密码是否真确
	 * 
	 * @param num
	 *            学号
	 * @param password
	 *            密码
	 * @return 正确返回true否则返回false
	 * @throws UserNotFoundException
	 *             抛出学号不存在的异常
	 * @throws PasswordNotCorrectException
	 *             抛出密码错误的异常
	 */
	public static Student check(String num, String password) throws UserNotFoundException, PasswordNotCorrectException {
		Student student = null;
		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from student_info where sno = '" + num + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		try {
			if (!rs.next()) {
				throw new UserNotFoundException("用户不存在:" + num);
			} else {
				if (!password.equals(rs.getString("spassword"))) {
					throw new PasswordNotCorrectException("密码不正确!");
				}
			}
			student = new Student();
			student.setEmail(rs.getString("semail"));
			student.setGroup(rs.getString("sgroup"));
			student.setName(rs.getString("sname"));
			student.setNumber(rs.getString("sno"));
			student.setPassword(rs.getString("spassword"));
			student.setPhone(rs.getString("stel"));
			student.setSclass(rs.getString("sclass"));
			student.setSex(rs.getString("ssex"));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return student;
	}

	/**
	 * 按学号获得学生信息
	 * 
	 * @param num
	 *            学号
	 * @return 返回该学号的学生对象
	 */
	public static Student getBySno(String num) {
		Connection conn = DB.getConn();
		String sql = null;
		sql = "select * from student_info where sno='" + num + "'";
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);
		Student student = null;
		try {
			if (rs.next()) {
				student = new Student();
				student.setEmail(rs.getString("semail"));
				student.setGroup(rs.getString("sgroup"));
				student.setName(rs.getString("sname"));
				student.setNumber(rs.getString("sno"));
				student.setPassword(rs.getString("spassword"));
				student.setPhone(rs.getString("stel"));
				student.setSclass(rs.getString("sclass"));
				student.setSex(rs.getString("ssex"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return student;
	}

	/**
	 * 更新学生stu的相关信息（学号不能更新）
	 * 
	 * @param stu
	 *            存有新信息的学生对象
	 * @return 更新成功返回true否则返回false
	 */
	public static boolean update(Student stu) {
		Connection conn = DB.getConn();
		String sql = null;
		boolean b = false;
		sql = "update student_info set spassword=?, sgroup=?, sname=?, ssex=?, stel=?, semail=?, sclass=?  where sno = ?";
		PreparedStatement pstmt = DB.prepare(conn, sql);
		try {
			pstmt.setString(1, stu.getPassword());
			pstmt.setString(2, stu.getGroup());
			pstmt.setString(3, stu.getName());
			pstmt.setString(4, stu.getSex());
			pstmt.setString(5, stu.getPhone());
			pstmt.setString(6, stu.getEmail());
			pstmt.setString(7, stu.getSclass());
			pstmt.setString(8, stu.getNumber());
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

	/**
	 * 按指定的条件获得所有符合条件的学生信息 students 存放符合条件的学生信息的List pageNo 分页显示时，当前的页号 pageSize
	 * 每页显示学生信息的数量 sclass 学生所在的班级 num 学号 name 学生姓名 返回符合条件的学生列表
	 */
	public static int query(List<Student> students, int pageNo, int pageSize, String sclass, String num, String name) {
		int totalRecords = -1;

		Connection conn = DB.getConn();
		String sql = null;
		/*
		 * 如何有些条件为空的进行如下处理，否则模糊查询时可能会报空指针异常
		 */
		if (sclass == null)
			sclass = "";
		if (name == null)
			name = "";
		if (num == null)
			num = "";
		/*
		 * 模糊查寻
		 */
		sql = "select * from student_info where sclass like '%" + sclass + "%' and sname like '%" + name
				+ "%' and sno like '%" + num + "%'";
		sql += "limit " + (pageNo - 1) * pageSize + "," + pageSize;
		Statement stmt = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stmt, sql);

		Statement stmtCount = DB.getStatement(conn);
		ResultSet rsCount = null;
		rsCount = DB.getResultSet(stmtCount, "select count(*) from student_info where sclass like '%" + sclass
				+ "%' and sname like '%" + name + "%' and sno like '%" + num + "%'");
		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);

			while (rs.next()) {
				Student student = new Student();
				student.setEmail(rs.getString("semail"));
				student.setGroup(rs.getString("sgroup"));
				student.setName(rs.getString("sname"));
				student.setNumber(rs.getString("sno"));
				student.setPassword(rs.getString("spassword"));
				student.setPhone(rs.getString("stel"));
				student.setSclass(rs.getString("sclass"));
				student.setSex(rs.getString("ssex"));
				students.add(student);
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

	/**
	 * 批量导入excel表中学生的信息到数据库中（用到组件jxl.jar) file excel表所在的相对路径或绝对路径（包括文件完整的名字）
	 * 返回那些学号在数据库中已经存在的学号
	 */
	public static List<String> adds(String file) throws Exception{
		Connection conn = DB.getConn();
		List<String> snumber = new ArrayList<String>();
		Workbook info;// 定义工作簿
		String sql = "insert into student_info values (?, ?, ?, ?, ?, ?, ?, ?)";
		
			info = Workbook.getWorkbook(new FileInputStream(file));
			Sheet sheet = info.getSheet(0);// 获得工作薄中表单对象
			int size = sheet.getRows(); // 获得表单的行数
			for (int i = 1; i < size; i++) {
				Cell c = sheet.getCell(0, i);// 获得表单的i行0列的单元格即学号
				/*
				 * 查看学号是否已经存在
				 */
				if (StudentManager.getBySno(c.getContents().trim()) != null) {
					snumber.add(c.getContents().trim());
					continue;
				}
				PreparedStatement pstmt = DB.prepare(conn, sql);
				for (int j = 0; j < 8; j++) {
					c = sheet.getCell(j, i);
					pstmt.setString(j + 1, c.getContents().trim());
				}
				pstmt.execute();
			}
		
		return snumber;
	}
}
