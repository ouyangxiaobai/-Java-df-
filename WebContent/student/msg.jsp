<%@page pageEncoding="GBK" import="java.sql.*"%>
<%
 String y= request.getParameter("y");
 String msg="ʧ�ܣ�";
 if(y.equals("1")){ msg="�޸ĳɹ���";}
 if(y.equals("2")){ msg="�޸�ʧ�ܣ�";}
 if(y.equals("3")){ msg="ѡ��ɹ�!";}
 if(y.equals("4")){ msg="ѡ��δ�ɹ�δ!";}
 if(y.equals("5")){ msg="�����ɹ�!";}
 if(y.equals("6")){ msg="����ʧ��!";}
%> 
<%=msg%>