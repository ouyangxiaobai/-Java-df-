<%@page import="vo.*, dao.*"%>
<%
	response.setContentType("text/xml");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0); //prevents catching at proxy server
	String id = request.getParameter("id");
	Teacher user = TeacherManager.getByTno(id);

	if (user == null) {
		response.getWriter().write("<msg>valid</msg>");
	} else
		response.getWriter().write("<msg>invalid</msg>"); 
%>
