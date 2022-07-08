<%@page pageEncoding="GBK" import="vo.*, dao.*"%>
<%
Teacher teacher = (Teacher)session.getAttribute("user");
if(teacher==null || teacher.getNumber()==null) {
	response.sendRedirect("../index.jsp");
	return ; 
}
request.getSession().setAttribute("teacher", teacher);
%>
