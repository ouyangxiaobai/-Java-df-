<%@page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>学生选课</title>
</head>
<%@include file="check.jsp"%>

<%
	String start = MsgManager.getTexts("学生相关功能");
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
				href="/work/student?type=3" onClick='changeAdminFlag("系统管理员")'>查看所有课题</a></td>
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
			<form name="editForm" method="post"
				action="/work/student?type=2&Action=choose&t_num=<%=t.getNumber()%>&snumber=<%=student.getNumber() %>">
				<tr></tr>
				<tr>
					<td height="24" nowrap bgcolor="#E1E6F6">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							id="editProduct" idth="100%">

							<tr>
								<td height="20" align="right">课题编号：</td>
								<td>
									<div align="left">
										<span style="display:inline-block;width:200px"><%=t.getNumber()%></span>
										<span>教师号：<%=u.getNumber()%></span>
									</div>
									
								</td>
								<%-- <td height="20" align="right">教师号：</td>
								<td>
									<div align="left">
										<%=u.getNumber()%>
									</div>
								</td> --%>
							</tr>
							<tr>
								<td height="20" align="right">课题名称：</td>
								<td>
									<div align="left">
										<span style="display:inline-block;width:200px"><%=t.getName()%></span>
										<span>教师名：<%=u.getName()%></span>
									</div>
								</td>
								<%-- <td height="20" align="right">教师名：</td>
								<td>
									<div align="left">
										<%=u.getName()%>
									</div>
								</td> --%>
							</tr>
							<tr>
								<td height="20" align="right">课题类型：</td>
								<td>
									<div align="left">
										<span style="display:inline-block;width:200px"><%=t.getType()%></span>
										<span>教师性别：<%=u.getSex()%></span>
									</div>
								</td>
								<%-- <td height="20" align="right">教师性别：</td>
								<td>
									<div align="left">
										<%=u.getSex()%>
									</div>
								</td> --%>
							</tr>
							<tr>
								<td height="20" align="right">课题性质：</td>
								<td>
									<div align="left">
										<span style="display:inline-block;width:200px"><%=t.getKind()%></span>
										<span>教师电话：<%=u.getPhone()%></span>
									</div>
								</td>
								<%-- <td height="20" align="right">教师电话：</td>
								<td>
									<div align="left">
										<%=u.getPhone()%>
									</div>
								</td> --%>
							</tr>
							<tr>
								<td height="20" align="right">课题来源：</td>
								<td>
									<div align="left">
										<span style="display:inline-block;width:200px"><%=t.getSource()%></span>
										<span>教师学历：<%=u.getDegree()%></span>
									</div>
								</td>
								<%-- <td height="20" align="right">教师学历：</td>
								<td>
									<div align="left">
										<%=u.getDegree()%>
									</div>
								</td> --%>
							</tr>
							<tr>
								<td></td>
								<td><div>
									<span style="display:inline-block;width:200px"></span>
									<span>教师邮箱：<%=u.getEmail()%></span>
								</div></td>
								
							</tr>
							<tr>
								<td></td>
								<td><div>
									<span style="display:inline-block;width:200px"></span>
									<span>教师职称：<%=u.getTitle()%></span>
								</div></td>
								
							</tr>
							
							<tr>
								<td height="20" align="right" valign="top">课题任务和要求：</td>
								<td>
									<div align="left">
										<textarea name="content" cols="60" rows="8"
											style="WIDTH: 350;" readonly="readonly"><%=t.getContent()%>
													</textarea>
									</div>
								</td>
								<%-- <td height="20" align="right">教师邮箱：</td>
								<td>
									<div align="left">
										<%=u.getEmail()%>
									</div>
								</td> --%>
							</tr>
							<tr>
								<td height="20" align="right" valign="top" >成果要求：</td>
								<td>
									<div align="left">
										<textarea name="result" cols="60" rows="8" style="WIDTH: 280;" readonly="readonly"><%=t.getResult()%>
													</textarea>
									</div>
								</td>
								<%-- <td height="20" align="right">教师职称：</td>
								<td>
									<div align="left">
										<%=u.getTitle()%>
									</div>
								</td> --%>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">备注：</td>
								<td>
									<div align="left">
										<textarea name="direction" cols="60" rows="8"
											style="WIDTH: 280;" readonly="readonly"><%=t.getDirection()%>
													</textarea>
									</div>
								</td>
							</tr>
							<%
								if (TopicManager.getBySnum(student.getNumber()) == null && start != null) {
							%>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
											id="submitSaveEdit" value=" 选择" style="WIDTH: 60;">
									</div>
								</td>
							</tr>
							<%
								}
								if (start == null) {
									out.println("学生选题功能尚未开启！不能选题！");
								}
							%>
							</form>
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
