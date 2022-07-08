<%@ page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<%@ include file="check.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>课题列表</title>
</head>
<script language=JavaScript>
	function DoEmpty(id) {
		if (confirm("真的要删除该信息吗？"))
			window.location = "/work/teacher?type=1&Result=delete&number=" + id;
	}
</script>

</html>
<%
	String result = request.getParameter("Result");
	if (result != null && result.trim().equals("delete")) {
		if (!TopicManager.deleteByHno(request.getParameter("number"))) {
			out.println("删除失败！");
		}
	}
	String start = MsgManager.getTexts("教师相关功能");
%>
<html xmlns="http://www.w3.org/1999/xhtml"> 

<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>所有选题：查看所有选题、检查是否有重复的选题……</strong>
			</font></td>
		</tr>
	</table>
	<br />
	<center>
		<table width="100%" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tr>
				<td width="15%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目编号</strong> </font></td>
				<td width="15%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目名称</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目类型</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目性质</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目来源</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目状态</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>指导老师</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>详情/修改</strong> </font></td>
				<%
					if (start != null) {
				%>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>删除课题</strong> </font></td>
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
						color='#330099'>查看/修改</font> </a></td>
				<%
					if (start != null) {
				%>
				<td><a href="javascript:DoEmpty('<%=t.getNumber()%>');"><font
						color='#330099' >删除</font> </a></td>
				<%
					}
					}
				%>
			
		</table>
		<br />
	</center>
</body>
</html>

