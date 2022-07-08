<%@page pageEncoding="GBK" import="java.sql.*"%>
<%
 String y= request.getParameter("y");
 String msg="失败！";
 if(y.equals("1")){ msg="登录时间超时！请重新登录！";}
 if(y.equals("2")){ msg="您已发布该课题了，本次发布未成功！";}
 if(y.equals("3")){ msg="您已发布该课题了，本次发布未成功！";}
 if(y.equals("4")){ msg="修改未成功";}
 if(y.equals("5")){ msg="此功能尚未开启，不能做次操作！";}
 if(y.equals("6")){ msg="教师功能尚未开启，只能查看课题信息，不能修改！";}
 if(y.equals("7")){ msg="删除失败！";}
%>
<%=msg%>