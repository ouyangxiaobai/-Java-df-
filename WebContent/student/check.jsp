<%@page pageEncoding="GBK" import="vo.*, dao.*"%>
<%
	Student student = (Student) session.getAttribute("user");
	if (student == null || student.getNumber() == null) {
		response.sendRedirect("../index.jsp");
		return;
	}
%>
