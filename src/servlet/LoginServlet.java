package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet  .ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PasswordNotCorrectException;
import dao.StudentManager;
import dao.TeacherManager;
import dao.UserNotFoundException;
import vo.Student;
import vo.Teacher;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -6030727340944647548L;

	public LoginServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		response.setCharacterEncoding("GBK");
		PrintWriter out = response.getWriter(); 

		String username = request.getParameter("user_no").trim();
		String password = request.getParameter("user_pass").trim();
		int type = Integer.parseInt(request.getParameter("u_type").trim());
		try {
			if (type == 1) {
				Student student = StudentManager.check(username, password);
				session.setAttribute("user", student);
				session.setAttribute("type", type);
				response.sendRedirect("student/student.jsp");
			}
			if (type == 2) {
				Teacher teacher = TeacherManager.check(username, password);
				session.setAttribute("user", teacher);
				session.setAttribute("type", type);
				response.sendRedirect("teacher/teacher.jsp");
			}
			if (type == 3) {
				Teacher teacher = TeacherManager.check(username, password);
				if (teacher.getRight() == 0) {
					session.setAttribute("user", teacher);
					session.setAttribute("type", type);
					response.sendRedirect("admin/admin.jsp");
					//request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
				} else {
					out.println("您没有管理员权限！<a href='loginmsg/loginFailed.html'>返回</a>");
					response.sendRedirect("loginmsg/loginFailed.html");
					return;
				}
			}
		} catch (UserNotFoundException e) {
			out.println(e.getMessage());
			response.sendRedirect("loginmsg/loginFailed.html");
			System.err.println("!!!!"+e.getMessage());
		} catch (PasswordNotCorrectException e) {
			System.err.println(e.getMessage());
			response.sendRedirect("loginmsg/loginFailed.html");
		}
		
	}

	public void init() throws ServletException {
	}

}
