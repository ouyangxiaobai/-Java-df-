<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.* ,vo.*,util.*,dao.*"
    pageEncoding="UTF-8"%>
    <%@ include file="check.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<b><i>尊敬的老师，你还可以选<%=teacher.getGroup()%>道题目</i></b>
<%
String str = teacher.getGroup();
int n= Integer.valueOf(str);
    if(n>0)
    { 
%>
><a href="/work/teacher?type=2&Result=Add" target="mainFrame"
onClick='changeAdminFlag("添加选题")'><font size=2 color=black>添加课题</a>
<%}else{%>
<br>您已经不能添加题目
<% } %>
</body>
</html>