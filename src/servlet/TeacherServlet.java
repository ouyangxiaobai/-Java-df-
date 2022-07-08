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
import vo.Teacher;
import vo.Topic;
import dao.MsgManager;
import dao.StudentManager;
import dao.TeacherManager;
import dao.TopicManager;

public class TeacherServlet extends HttpServlet {

	private static final long serialVersionUID = -6030727340944647548L;

	public TeacherServlet() {
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
	    Teacher teacher = (Teacher)session.getAttribute("user");
	    if(teacher==null || teacher.getNumber()==null) {
	    	response.sendRedirect("../index.jsp");
	    	return ;
	    }

		String type=request.getParameter("type");
		if(type==null) 
			return; 
		
		if(type.equals("1")){// teacher/task_mysel.jsp
			String result = request.getParameter("Result");
			if (result != null && result.trim().equals("delete")) {
				if (!TopicManager.deleteByHno(request.getParameter("number"))) {
					response.sendRedirect("teacher/msg.jsp?y=7");
				}
			}
			String start = MsgManager.getTexts("教师相关功能");
			request.getSession().setAttribute("start", start);
			
			String t_num = new String(teacher.getNumber());
			List<Topic> tasks = TopicManager.getByTno(t_num);
			request.getSession().setAttribute("tasks2", tasks);
			
			response.sendRedirect("teacher/task_mysel2.jsp");
		}else if(type.equals("2")){// teacher/task_add.jsp
			String result = request.getParameter("Result");
			Teacher u = (Teacher) session.getAttribute("user");
			if (u == null) {
				response.sendRedirect("teacher/msg.jsp?y=1");
				return;
			}
			request.getSession().setAttribute("u", u);
			u = TeacherManager.getByTno(u.getNumber());
			
			String action = null;
			action = request.getParameter("Action");
			if (action != null && action.trim().equals("addnew")) {
				Topic t = new Topic();
				t.setNumber(request.getParameter("number").trim());
				t.setContent(request.getParameter("content").trim());
				t.setDirection(request.getParameter("direction").trim());
				System.out.println(request.getParameter("kind").trim());
				if(request.getParameter("kind").trim().equals("1")){
					t.setKind("工程设计");
				}else if(request.getParameter("kind").trim().equals("2")){
					t.setKind("技术科学");
				}else if(request.getParameter("kind").trim().equals("3")){
					t.setKind("软件研究");
				}else if(request.getParameter("kind").trim().equals("4")){
					t.setKind("理论研究");
				}
				t.setName(request.getParameter("topic").trim());
				t.setResult(request.getParameter("result").trim());
				if(request.getParameter("source").trim().equals("1")){
					t.setSource("结合科研");
				}else if(request.getParameter("source").trim().equals("2")){
					t.setSource("结合生产实际");
				}
				else if(request.getParameter("source").trim().equals("3")){
					t.setSource("结合实验室建设");
				}
				else if(request.getParameter("source").trim().equals("4")){
					t.setSource("自拟题目");
				}
				if(request.getParameter("category").trim().equals("1")){
					t.setType("毕业设计");
				}else{
					t.setType("毕业论文");
				}
				
				t.setStatus("false");
				t.setTnumber(u.getNumber().trim());
				if (TopicManager.getByTnumAndHname(t.getTnumber(), t.getName()) != null) {
					response.sendRedirect("teacher/msg.jsp?y=2");
					return;
				}
				if (TopicManager.save(t)) {
					response.sendRedirect("teacher/task_mysel.jsp");
					return;
				} else {
					response.sendRedirect("teacher/msg.jsp?y=3");
					return;
				}
			}

			if (action != null && action.trim().equals("SaveEdit")) {
				Topic t = new Topic();
				t.setNumber(request.getParameter("number").trim());
				t.setContent(request.getParameter("content").trim());
				t.setDirection(request.getParameter("direction").trim());
				t.setKind(request.getParameter("kind").trim());
				t.setName(request.getParameter("topic").trim());
				t.setResult(request.getParameter("result").trim());
				t.setSource(request.getParameter("source").trim());
				t.setType(request.getParameter("category").trim());
				t.setStatus("false");
				t.setTnumber(u.getNumber().trim());
				if (TopicManager.update(t)) {
					response.sendRedirect("teacher/task_mysel.jsp");
					return;
				} else {
					response.sendRedirect("teacher/msg.jsp?y=4");
					return;
				}
				
			}
			
			Integer rindex=0;
			Integer rindex2=0;
			Integer rindex3=0;
			if (result != null && result.trim().equals("Add")) {
				if (MsgManager.getTexts("教师相关功能") == null) {
					response.sendRedirect("teacher/msg.jsp?y=5");
					return;
				}else{
					rindex2=1;
				}
				rindex=0;
				
			}else if (result != null && result.trim().equals("Modify")) {
				Topic t = TopicManager.getByNum(request.getParameter("t_num"));
				u = TeacherManager.getByTno(t.getTnumber());
				Student stu = null;
				if (t.getSnumber() != null) {
					stu = StudentManager.getBySno(t.getSnumber());
					request.getSession().setAttribute("stu", stu);
				}
				request.getSession().setAttribute("t", t);
				rindex=1;
				System.out.println(t.getTnumber());
				System.out.println(t.getNumber());
				System.out.println(MsgManager.getTexts("教师相关功能"));
				if (MsgManager.getTexts("教师相关功能") != null) {
					System.out.println("111111111");
					rindex3=1;
				}else if ((MsgManager.getTexts("教师相关功能") == null )){
					System.out.println("22222222");
					response.sendRedirect("teacher/msg.jsp?y=6");
					return;
				}
			}
			request.getSession().setAttribute("rindex", rindex);
			request.getSession().setAttribute("rindex2", rindex2);
			request.getSession().setAttribute("rindex3", rindex3);
			request.getSession().setAttribute("result", result);
			response.sendRedirect("teacher/task_add2.jsp");
			return;
		}else if(type.equals("3")){// teacher/task_list.jsp
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
						false);
			} else {
				totalRecords = TopicManager.getTopics(topics, pageNo, PAGE_SIZE, false);
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
			response.sendRedirect("teacher/task_list2.jsp");
			return;
		}
		
		
	}

	public void init() throws ServletException {
	}

}
