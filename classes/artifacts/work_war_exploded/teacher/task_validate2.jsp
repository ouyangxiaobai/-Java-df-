<%@page import="vo.*, dao.*"%>
<%@page pageEncoding="GBK"%>
<%
	response.setContentType("text/xml");
	response.setHeader("Cache-Control", "no-store"); //HTTP1.1
	response.setHeader("Pragma", "no-cache"); //HTTP1.0
	response.setDateHeader("Expires", 0); //prevents catching at proxy server
	request.setCharacterEncoding("GBK");
	String id = request.getParameter("id");
	String name = new String(request.getParameter("name").getBytes("ISO8859_1"), "GBK");
	Topic user = TopicManager.getByTnumAndHname(id, name);
	//check the database
	if (user == null) {
		response.getWriter().write("<msg>valid</msg>");
	} else
		response.getWriter().write("<msg>invalid</msg>");
%>
 