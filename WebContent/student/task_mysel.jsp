<%@page pageEncoding="GBK" import="java.util.*"%>
<%@include file="check.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	Topic t = TopicManager.getBySnum(student.getNumber());
	if (t == null) {
		out.println("����δѡ�⣬���ܲ鿴������ѡ�⣡");
		return;
	}
	Teacher u = TeacherManager.getByTno(t.getTnumber());
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>��������</title>
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
	 	bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>�ҵ�ѡ��</strong>
			</font></td>
		</tr>
	</table>
	<center>
		<br />
		<table width="100%" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tr>
				<td height="24" nowrap bgcolor="#E1E6F6">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						id="editProduct">
						<tr>
							<td width="120" height="20" align="right">&nbsp;</td>
							<td>
								<div align="left"></div>
							</td>
						</tr>
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
									<textarea name="content" cols="60" rows="8" style="WIDTH: 350;"><%=t.getContent()%>
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
							<td height="20" align="right" valign="top"></td>
							<td style="text-indent: 150px;">
								<form action="/work/student?type=4&hno=<%=t.getNumber()%>" method="post">
									<input style="margin-top:20px; cursor:pointer;" type="submit" value="������ǰѡ��" />
								</form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</center>
</body>
</html>