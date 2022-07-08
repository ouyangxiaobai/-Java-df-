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
		PreparedStatement pstmt = DB.prepare(conn, sql);// Ԥ����������
		try {
			/*
			 * ��stu�б������Ϣ�ֱ�ŵ����ݿ��ж�Ӧ��Ķ�Ӧ����
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
			totalRecords = rsCount.getInt(1);// �õ��������һ���ж�������¼

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
	 * ����¼ʱѧ�ź������Ƿ���ȷ
	 * 
	 * @param num
	 *            ѧ��
	 * @param password
	 *            ����
	 * @return ��ȷ����true���򷵻�false
	 * @throws UserNotFoundException
	 *             �׳�ѧ�Ų����ڵ��쳣
	 * @throws PasswordNotCorrectException
	 *             �׳����������쳣
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
				throw new UserNotFoundException("�û�������:" + num);
			} else {
				if (!password.equals(rs.getString("spassword"))) {
					throw new PasswordNotCorrectException("���벻��ȷ!");
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
	 * ��ѧ�Ż��ѧ����Ϣ
	 * 
	 * @param num
	 *            ѧ��
	 * @return ���ظ�ѧ�ŵ�ѧ������
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
	 * ����ѧ��stu�������Ϣ��ѧ�Ų��ܸ��£�
	 * 
	 * @param stu
	 *            ��������Ϣ��ѧ������
	 * @return ���³ɹ�����true���򷵻�false
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
	 * ��ָ��������������з���������ѧ����Ϣ students ��ŷ���������ѧ����Ϣ��List pageNo ��ҳ��ʾʱ����ǰ��ҳ�� pageSize
	 * ÿҳ��ʾѧ����Ϣ������ sclass ѧ�����ڵİ༶ num ѧ�� name ѧ������ ���ط���������ѧ���б�
	 */
	public static int query(List<Student> students, int pageNo, int pageSize, String sclass, String num, String name) {
		int totalRecords = -1;

		Connection conn = DB.getConn();
		String sql = null;
		/*
		 * �����Щ����Ϊ�յĽ������´�������ģ����ѯʱ���ܻᱨ��ָ���쳣
		 */
		if (sclass == null)
			sclass = "";
		if (name == null)
			name = "";
		if (num == null)
			num = "";
		/*
		 * ģ����Ѱ
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
	 * ��������excel����ѧ������Ϣ�����ݿ��У��õ����jxl.jar) file excel�����ڵ����·�������·���������ļ����������֣�
	 * ������Щѧ�������ݿ����Ѿ����ڵ�ѧ��
	 */
	public static List<String> adds(String file) throws Exception{
		Connection conn = DB.getConn();
		List<String> snumber = new ArrayList<String>();
		Workbook info;// ���幤����
		String sql = "insert into student_info values (?, ?, ?, ?, ?, ?, ?, ?)";
		
			info = Workbook.getWorkbook(new FileInputStream(file));
			Sheet sheet = info.getSheet(0);// ��ù������б�����
			int size = sheet.getRows(); // ��ñ�������
			for (int i = 1; i < size; i++) {
				Cell c = sheet.getCell(0, i);// ��ñ���i��0�еĵ�Ԫ��ѧ��
				/*
				 * �鿴ѧ���Ƿ��Ѿ�����
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
