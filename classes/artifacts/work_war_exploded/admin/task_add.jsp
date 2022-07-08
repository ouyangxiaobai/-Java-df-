<%@page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>审核课题</title>
</head>

<%
	String action = request.getParameter("Action");
	if (action != null && "update".equals(action)) {
		Topic top = TopicManager.getByNum(request.getParameter("t_num"));
		top.setStatus("true");
		if (TopicManager.update(top)) {
			response.sendRedirect("task_verify.jsp");

			out.println("审核完成！还有以上课题未审核！");
			return;
		} else { 
			out.println("审核未完成!");
			return;
		}
	}
%>

<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>课题管理：查看课题详细信息</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6"><a
				href="/work/admin?type=3" onClick='changeAdminFlag("系统管理员")'>查看所有课题</a></td>
		</tr>
	</table>
	<center>
		<br />
		<%
			Topic t = TopicManager.getByNum(request.getParameter("t_num"));
			String result = request.getParameter("Result");
			Teacher u = TeacherManager.getByTno(t.getTnumber());
		%>
		<table width="100%" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<%
				if (result != null && result.equals("verify")) {
			%>
			<form name="editForm" method="post"
				action="task_add.jsp?Action=update&t_num=<%=t.getNumber()%>">
				<%
					}
				%>
				<tr></tr>
				<tr>
					<td height="24" nowrap bgcolor="#E1E6F6">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							id="editProduct" idth="100%">

							<tr>
								<td height="20" align="right">课题编号：</td>
								<td>
									<div align="left">
										<%=t.getNumber()%>
									</div>
								</td>
								<td height="20" align="right">教师号：</td>
								<td>
									<div align="left">
										<%=u.getNumber()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">课题名称：</td>
								<td>
									<div align="left">
										<%=t.getName()%>
									</div>
								</td>
								<td height="20" align="right">教师名：</td>
								<td>
									<div align="left">
										<%=u.getName()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">课题类型：</td>
								<td>
									<div align="left">
										<%=t.getType()%>
									</div>
								</td>
								<td height="20" align="right">教师性别：</td>
								<td>
									<div align="left">
										<%=u.getSex()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">课题性质：</td>
								<td>
									<div align="left">
										<%=t.getKind()%>
									</div>
								</td>
								<td height="20" align="right">教师电话：</td>
								<td>
									<div align="left">
										<%=u.getPhone()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">课题来源：</td>
								<td>
									<div align="left">
										<%=t.getSource()%>
									</div>
								</td>
								<td height="20" align="right">教师学历：</td>
								<td>
									<div align="left">
										<%=u.getDegree()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">课题任务和要求：</td>
								<td>
									<div align="left">
										<textarea name="content" cols="60" rows="8"
											style="WIDTH: 350;"><%=t.getContent()%>
													</textarea>
									</div>
								</td>
								<td height="20" align="right">教师邮箱：</td>
								<td>
									<div align="left">
										<%=u.getEmail()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">成果要求：</td>
								<td>
									<div align="left">
										<textarea name="result" cols="60" rows="8" style="WIDTH: 280;"><%=t.getResult()%>
													</textarea>
									</div>
								</td>
								<td height="20" align="right">教师职称：</td>
								<td>
									<div align="left">
										<%=u.getTitle()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">备注：</td>
								<td>
									<div align="left">
										<textarea name="direction" cols="60" rows="8"
											style="WIDTH: 280;"><%=t.getDirection()%>
													</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">课题状态：</td>
								<td>
								<%	
									if("false".equals(t.getStatus())){
								%><font color="red">未审核</font>
								<%
									}else{
								%>
								<font color="black">已审核<font>
								<% 
									}
								%>
								</td>
							</tr>
							<%
								if (result != null && result.equals("verify")) {
							%>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
											id="submitSaveEdit" value=" 提交审核" style="WIDTH: 60;">
									</div>
								</td>
							</tr>
							</form>
							<%
								}
							%>
						</table>
					</td>
				</tr>
			</form>
		</table>
		</td>
		</tr>
		</form>
	</center>
</body>
</html>
