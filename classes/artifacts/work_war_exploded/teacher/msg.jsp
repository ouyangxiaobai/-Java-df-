<%@page pageEncoding="GBK" import="java.sql.*"%>
<%
 String y= request.getParameter("y");
 String msg="ʧ�ܣ�";
 if(y.equals("1")){ msg="��¼ʱ�䳬ʱ�������µ�¼��";}
 if(y.equals("2")){ msg="���ѷ����ÿ����ˣ����η���δ�ɹ���";}
 if(y.equals("3")){ msg="���ѷ����ÿ����ˣ����η���δ�ɹ���";}
 if(y.equals("4")){ msg="�޸�δ�ɹ�";}
 if(y.equals("5")){ msg="�˹�����δ�������������β�����";}
 if(y.equals("6")){ msg="��ʦ������δ������ֻ�ܲ鿴������Ϣ�������޸ģ�";}
 if(y.equals("7")){ msg="ɾ��ʧ�ܣ�";}
%>
<%=msg%>