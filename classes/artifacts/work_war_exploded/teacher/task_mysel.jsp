<%@ page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<%@ include file="check.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>�����б�</title>
</head>
<script language=JavaScript>
	function DoEmpty(id) {
		if (confirm("���Ҫɾ������Ϣ��"))
			window.location = "/work/teacher?type=1&Result=delete&number=" + id;
	}
</script>

</html>
<%
	String result = request.getParameter("Result");
	if (result != null && result.trim().equals("delete")) {
		if (!TopicManager.deleteByHno(request.getParameter("number"))) {
			out.println("ɾ��ʧ�ܣ�");
		}
	}
	String start = MsgManager.getTexts("��ʦ��ع���");
%>
<html xmlns="http://www.w3.org/1999/xhtml"> 

<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>����ѡ�⣺�鿴����ѡ�⡢����Ƿ����ظ���ѡ�⡭��</strong>
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
					color=black><strong>����/�޸�</strong> </font></td>
				<%
					if (start != null) {
				%>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>ɾ������</strong> </font></td>
				<%
					}
				%>
			</tr>
			<%
				String t_num = new String(teacher.getNumber());
				List<Topic> tasks = TopicManager.getByTno(t_num);
				for (Topic t : tasks) {
			%>
			<tr bgcolor=black onmouseover="this.bgColor='f1f1f1'"
				onmouseout="this.bgColor='FFFFFF'" style='cursor: hand' title="">
				<td><%=t.getNumber()%></td>
				<td><%=t.getName()%></td>
				<td><%=t.getType()%></td>
				<td><%=t.getKind()%></td>
				<td><%=t.getSource()%></td>
				<td><%=t.getStatus()%></td>
				<td><%=t.getTnumber()%></td>
				<td><a
					href="/work/teacher?type=2&Result=Modify&t_num=<%=t.getNumber()%>"><font
						color='#330099'>�鿴/�޸�</font> </a></td>
				<%
					if (start != null) {
				%>
				<td><a href="javascript:DoEmpty('<%=t.getNumber()%>');"><font
						color='#330099' >ɾ��</font> </a></td>
				<%
					}
					}
				%>
			
		</table>
		<br />
	</center>
</body>
</html>

