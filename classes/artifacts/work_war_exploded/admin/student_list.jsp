<%@page pageEncoding="GBK" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link rel="stylesheet" href="../js/CssAdmin.css"></link>
<title>学生列表</title>
</head>
<%@ include file="check.jsp"%>
<script language="javascript">
function DoEmpty(id) {
	if (confirm("真的要删除"+id+"学生信息吗？"))
		window.location = "student_add.jsp?Result=delete&ID=" + id;
}
</script>
<!-- 批量删除 -->
<script type="text/javascript">
			function checkDelete() {
				var ids = document.getElementsByName("id");
				if(document.formDelete.selectAll.checked) {
					for(var i=0; i<ids.length; i++) {
						ids[i].checked="checked";
					}
				} else {
					for(var i=0; i<ids.length; i++) {
						ids[i].checked="";
					}
				}
			}
</script>

<%
	final int PAGE_SIZE = 10; //每页显示多少条记录
	final int PAGES_PER_TIME = 3;//每次显示多少个页码链接
	int pageNo = 1;
	request.setCharacterEncoding("GBK");
	String strPageNo = request.getParameter("pageNo");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
	}
	if (pageNo <= 0)
		pageNo = 1;
%>

<%
	List<Student> students = new ArrayList<Student>();
	int totalRecords = 0;
	request.setCharacterEncoding("GBK");
	String action = null;
	int totalPages = 1;
	action = request.getParameter("action");
	if ((action != null && action.trim().equals("query"))) {
		totalRecords = StudentManager.query(students, pageNo, 200, request.getParameter("St_class").trim(),
				request.getParameter("St_num").trim(), request.getParameter("St_name").trim());
	} else if (action != null && action.trim().equals("delete")) {
		String[] idArray = request.getParameterValues("id");
		if (idArray == null || idArray.length == 0) {
			out.println("ID号输入错误！");
			return;
		} else {
			for (int i = 0; i < idArray.length; i++) {
				if (!StudentManager.deleteBySno(idArray[i])) {
					out.println(idArray[i] + "删除未成功");
				}
			}
			out.println("删除成功！");
			response.sendRedirect("student_list.jsp");
		}
	} else {
		totalRecords = StudentManager.getStudents(students, pageNo, PAGE_SIZE);
		totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;//计算共有多少页 
	}
	if (pageNo > totalPages)
		pageNo = totalPages;
%>
<body>
	<table align="center" width="100%" border="0" cellpadding="3"
		cellspacing="1" bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap="nowrap"><font color=black>
					&nbsp;<strong>学生管理：添加，修改学生信息</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap="nowrap" bgcolor="#E1E6F6">

				<form method="post" name="frm" action="">
					<input name="action" value="query" type="hidden" /> 学号： <input
						name="St_num" type="text" id="St_name" size="12" /> 姓名： <input
						name="St_name" type="text" id="St_name" size="12" /> 班级： <input
						name="St_class" type="text" id="St_class" size="12" /> <input
						type="submit" name="Submit" value=" 检 索 " /> <a
						href="student_list.jsp"
						onclick='changeAdminFlag(&quot;系统学生&quot;)'>查看所有学生</a>
				</form>
			</td>
		</tr>
	</table>
	<br />
	<%
		if (!(action != null && action.trim().equals("query"))) {
	%>

	<%
		}
	%>

	<form action="student_list.jsp?action=delete" name="formDelete"
		method="post">

		<table align="center" width="100%" border="0" cellpadding="3"
			cellspacing="1" bgcolor="#E1E6F6">

			<tr>
				<td align="center" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>选择</strong> </font></td>
				<td align="center" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>学号</strong> </font></td>
				<td align="center" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>姓名</strong> </font></td>
				<td align="center" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>密码</strong> </font></td>
				<td align="center" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>性别</strong> </font></td>
				<td align="center" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>班级</strong> </font></td>
				<td align="center" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>组号</strong> </font></td>
				<td align="center" nowrap bgcolor="#E1E6F6"><strong><font
						color=black>手机号码</font> </strong></td>
				<td align="center" nowrap bgcolor="#E1E6F6"><font
					color=black><strong>邮箱</strong> </font></td>
				<td align="center" nowrap bgcolor="#E1E6F6"><font
					color=black><strong>删除</strong> </font></td>
			</tr>
			<%
				for (int i = 0; i < students.size(); i++) {
					Student u = students.get(i);
			%>
			<tr bgcolor=white onmouseover="this.bgColor='f1f1f1'"
				onmouseout="this.bgColor='FFFFFF'">
				<td align="center"><input type="checkbox" name="id"
					value="<%=u.getNumber()%>" /></td>
				<td align="center"><%=u.getNumber()%></td>
				<td align="center"><%=u.getName()%></td>
				<td align="center"><%=u.getPassword()%></td>
				<td align="center"><%=u.getSex()%></td>
				<td align="center"><%=u.getSclass()%></td>
				<td align="center"><%=u.getGroup()%></td>
				<td align="center"><%=u.getPhone()%></td>
				<td align="center"><%=u.getEmail()%></td>
				<td align="center"><a
					href="javascript:DoEmpty('<%=u.getNumber()%>');"><font
						color='#330099'>删除</font> </a></td>
			</tr>
			<%
				}
			%>
		</table>
		<table align="center" width="100%" border="0" cellpadding="3"
			cellspacing="1" bgcolor="#E1E6F6">
			<tr>
				<td><input name="selectAll" type="checkbox"
					onclick="checkDelete()" /> <input type="submit" value="Delete" /></td>
			</tr>
		</table>
		<table align="letf" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tbody>
				<tr color="#E1E6F6">
					<td>总条数:&nbsp;<%=totalRecords%>&nbsp;
					</td>
					<td style="display:none;">&nbsp;<%=pageNo%>/<%=totalPages%>&nbsp;
					</td>
					<td>&nbsp; <a href="student_list.jsp?pageNo=1"><b>|</b>&lt;
					</a>&nbsp;
					</td>
					<td>&nbsp; <a href="student_list.jsp?pageNo=<%=pageNo - 1%>">&lt;</a>&nbsp;
					</td>

					<%
						/*
						设置页码连接
						*/
						int start = ((pageNo - 1) / PAGES_PER_TIME) * PAGES_PER_TIME + 1;
						for (int i = start; i < start + PAGES_PER_TIME; i++) {
							if (i > totalPages)
								break;
							if (pageNo == i) {
					%>

					<td style="display:none;" bgcolor=black>&nbsp; <u><b>[<%=i%>]
						</b> </u>&nbsp;
					</td>
					<%
						} else {
					%>
					<td>&nbsp; <a href="student_list.jsp?pageNo=<%=i%>">[<%=i%>]
					</a>&nbsp;
					</td>
					<%
						}
						}
					%>
					<td>&nbsp; <a href="student_list.jsp?pageNo=<%=pageNo + 1%>">&gt;</a>&nbsp;
					</td>
					<td>&nbsp; <a href="student_list.jsp?pageNo=<%=totalPages%>">&gt;<b>|</b>
					</a>&nbsp;
					</td>
					<!-- <td style="padding: 0pt;"><input name="custompage" size="2"
						style="border: 1px solid rgb(77, 118, 179);"
						onKeyDown="javascript: if(window.event.keyCode == 13) window.location='student_list.jsp?pageNo='+this.value;"
						type="text"></td> -->
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>

