<%@page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>��˿���</title>
</head>

<%
	String action = request.getParameter("Action");
	if (action != null && "update".equals(action)) {
		Topic top = TopicManager.getByNum(request.getParameter("t_num"));
		top.setStatus("true");
		if (TopicManager.update(top)) {
			response.sendRedirect("task_verify.jsp");

			out.println("�����ɣ��������Ͽ���δ��ˣ�");
			return;
		} else { 
			out.println("���δ���!");
			return;
		}
	}
%>

<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>��������鿴������ϸ��Ϣ</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6"><a
				href="/work/admin?type=3" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���п���</a></td>
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
								<td height="20" align="right">�����ţ�</td>
								<td>
									<div align="left">
										<%=t.getNumber()%>
									</div>
								</td>
								<td height="20" align="right">��ʦ�ţ�</td>
								<td>
									<div align="left">
										<%=u.getNumber()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">�������ƣ�</td>
								<td>
									<div align="left">
										<%=t.getName()%>
									</div>
								</td>
								<td height="20" align="right">��ʦ����</td>
								<td>
									<div align="left">
										<%=u.getName()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">�������ͣ�</td>
								<td>
									<div align="left">
										<%=t.getType()%>
									</div>
								</td>
								<td height="20" align="right">��ʦ�Ա�</td>
								<td>
									<div align="left">
										<%=u.getSex()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">�������ʣ�</td>
								<td>
									<div align="left">
										<%=t.getKind()%>
									</div>
								</td>
								<td height="20" align="right">��ʦ�绰��</td>
								<td>
									<div align="left">
										<%=u.getPhone()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">������Դ��</td>
								<td>
									<div align="left">
										<%=t.getSource()%>
									</div>
								</td>
								<td height="20" align="right">��ʦѧ����</td>
								<td>
									<div align="left">
										<%=u.getDegree()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">���������Ҫ��</td>
								<td>
									<div align="left">
										<textarea name="content" cols="60" rows="8"
											style="WIDTH: 350;"><%=t.getContent()%>
													</textarea>
									</div>
								</td>
								<td height="20" align="right">��ʦ���䣺</td>
								<td>
									<div align="left">
										<%=u.getEmail()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">�ɹ�Ҫ��</td>
								<td>
									<div align="left">
										<textarea name="result" cols="60" rows="8" style="WIDTH: 280;"><%=t.getResult()%>
													</textarea>
									</div>
								</td>
								<td height="20" align="right">��ʦְ�ƣ�</td>
								<td>
									<div align="left">
										<%=u.getTitle()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">��ע��</td>
								<td>
									<div align="left">
										<textarea name="direction" cols="60" rows="8"
											style="WIDTH: 280;"><%=t.getDirection()%>
													</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">����״̬��</td>
								<td>
								<%	
									if("false".equals(t.getStatus())){
								%><font color="red">δ���</font>
								<%
									}else{
								%>
								<font color="black">�����<font>
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
											id="submitSaveEdit" value=" �ύ���" style="WIDTH: 60;">
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
