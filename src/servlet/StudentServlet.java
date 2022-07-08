package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Student;
import vo.Topic;
import dao.StudentManager;
import dao.TopicManager;

public class StudentServlet extends HttpServlet {

	private static final long serialVersionUID = -6030727340944647548L;

	public StudentServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter(); 
		response.setCharacterEncoding("GBK");
	    response.setContentType("text/html;charset=GBK");

		String type=request.getParameter("type");
		if(type==null){ return; }
		if(type.equals("1")){// student_add.jsp
			String action = null;
			action = request.getParameter("oprate");
			if (action != null && action.trim().equals("Modify")) {
				Student st = new Student();
				if (request.getParameter("St_email") != null)
					st.setEmail(new String(request.getParameter("St_email").getBytes("ISO-8859-1"),"GBK"));
				st.setGroup(new String(request.getParameter("St_group").getBytes("ISO-8859-1"),"GBK"));
				st.setName(new String(request.getParameter("St_name").getBytes("ISO-8859-1"),"GBK"));
				st.setNumber(new String(request.getParameter("St_number").getBytes("ISO-8859-1"),"GBK"));
				st.setPassword(new String(request.getParameter("St_password").getBytes("ISO-8859-1"),"GBK"));
				st.setSclass(new String(request.getParameter("St_class").getBytes("ISO-8859-1"),"GBK"));
				st.setPhone(new String(request.getParameter("St_phone").getBytes("ISO-8859-1"),"GBK"));
				st.setSex(new String(request.getParameter("St_sex").getBytes("ISO-8859-1"),"GBK"));
				if (StudentManager.update(st)) {
					response.sendRedirect("student/msg.jsp?y=1");
				} else {
					response.sendRedirect("student/msg.jsp?y=2");
				}
				
				return;
			}
		}else if(type.equals("2")){//task_choose.jsp
			String action = request.getParameter("Action");
			if (action != null && action.trim().equals("choose")) {
				Topic top = TopicManager.getByNum(request.getParameter("t_num"));
				top.setSnumber(request.getParameter("snumber"));
				if (TopicManager.update(top)) {
					response.sendRedirect("student/msg.jsp?y=3");
					return;
				} else {
					response.sendRedirect("student/msg.jsp?y=4");
					return;
				}
			}
		}else if(type.equals("3")){//  student/task_list2.jsp
			final int PAGE_SIZE = 5; //每页显示多少条记录
			final int PAGES_PER_TIME = 3;//每次显示多少个页码链接
			int pageNo = 1;
			String strPageNo = request.getParameter("pageNo");
			if (strPageNo != null && !strPageNo.trim().equals("")) {
				try {
					pageNo = Integer.parseInt(strPageNo);
				} catch (NumberFormatException e) {
					pageNo = 1;
				}
			}
			if (pageNo <= 0)
				pageNo = 1;
			List<Topic> topics = new ArrayList<Topic>();
			String action = request.getParameter("action");
			int totalRecords = 1;
			if (action != null && action.trim().equals("query")) {
				totalRecords = TopicManager.query(topics, 1, 200,
						new String(request.getParameter("category").getBytes("ISO8859_1"), "GBK"),
						new String(request.getParameter("teacher").getBytes("ISO8859_1"), "GBK"),
						new String(request.getParameter("keyword").getBytes("ISO8859_1"), "GBK"),
						true);
			} else {
				totalRecords = TopicManager.getTopics(topics, pageNo, PAGE_SIZE, true);
			}
			int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;
			if (pageNo > totalPages)
				pageNo = totalPages;
			
			request.getSession().setAttribute("listtopics", topics);
			request.getSession().setAttribute("pageNo", pageNo);
			request.getSession().setAttribute("PAGES_PER_TIME", PAGES_PER_TIME);
			request.getSession().setAttribute("totalPages", totalPages);
			request.getSession().setAttribute("totalRecords", totalRecords);
			
			int start = ((pageNo - 1) / PAGES_PER_TIME) * PAGES_PER_TIME + 1;
			int iindex=0;
			int iindex2=0;
			for (int i = start; i < start + PAGES_PER_TIME; i++) {
				if (i > totalPages){break;}
				if (pageNo == i) {
					iindex=0;
				}else {
					iindex=1;
				}
				iindex2=i;
			}
			request.getSession().setAttribute("i", iindex2);
			request.getSession().setAttribute("i2", iindex);
			response.sendRedirect("student/task_list2.jsp");
			
		}else if(type.equals("4")){//学生撤销当前选题
			String hno= request.getParameter("hno");
			if(hno==null){
				return;
			}
			if(TopicManager.updatesno(hno)){//成功
				response.sendRedirect("student/msg.jsp?y=5");
			}else{//失败
				response.sendRedirect("student/msg.jsp?y=6");
			}
			
		}
		
	}

	public void init() throws ServletException {
	}

}
