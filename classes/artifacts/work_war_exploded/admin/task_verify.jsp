<%@ page pageEncoding="GBK" import="vo.*,java.util.*, dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>�����б�</title>
</head>
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>

<% 
	List<Topic> topics = TopicManager.getByStatus("false");
%>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black>&nbsp;<strong>��ˣ���˽�ʦ�����Ŀ��⡤��������</strong>
			</font></td>
		</tr>
	</table>
	<br />
	<center>
		<table width="100%" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tr>
				<td width="15%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ���</strong> </font></td>
				<td width="15%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ����</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ����</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ����</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ��Դ</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ״̬</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>ָ����ʦ</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>����/���</strong> </font></td>
			</tr>
			<%
				for (Topic t : topics) {
			%>
			<tr bgcolor=white onmouseover="this.bgColor='f1f1f1'"
				onmouseout="this.bgColor='FFFFFF'" style='cursor: hand' title="">
				<td><%=t.getNumber()%></td>
				<td><%=t.getName()%></td>
				<td><%=t.getType()%></td>
				<td><%=t.getKind()%></td>
				<td><%=t.getSource()%></td>
				<td><%=t.getStatus()%></td>
				<td><%=t.getTnumber()%></td>
				<td><a
					href="task_add.jsp?Result=verify&t_num=<%=t.getNumber()%>"><font
						color='#330099'>���</font> </a></td>
			</tr>
			<%
				}
			%>
		</table>
		<br />
	</center>
</body>
</html>

