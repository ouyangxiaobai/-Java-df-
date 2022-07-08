<%@page pageEncoding="GBK" import="java.sql.*"%>
<%
 String y= request.getParameter("y");
 String msg="失败！";
 if(y.equals("1")){ msg="修改成功！";}
 if(y.equals("2")){ msg="修改失败！";}
 if(y.equals("3")){ msg="选题成功!";}
 if(y.equals("4")){ msg="选题未成功未!";}
 if(y.equals("5")){ msg="撤销成功!";}
 if(y.equals("6")){ msg="撤销失败!";}
%> 
<%=msg%>