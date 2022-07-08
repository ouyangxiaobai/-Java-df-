<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="vo.*, dao.*"%>
<%
	Teacher teacher = (Teacher) session.getAttribute("user");
	int ty = 0;
	if (teacher == null)
		response.sendRedirect("../index.jsp");
	else {
		ty = (Integer) session.getAttribute("type");
		if (ty != 3)
			response.sendRedirect("../index.jsp");
	}
%>
