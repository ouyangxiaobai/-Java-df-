<%@page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<%@ include file="check.jsp"%>
<%
	request.setCharacterEncoding("GBK");
	String action = null;
	action = request.getParameter("Action");
	if (action != null && action.trim().equals("SaveEdit")) {
		Teacher te = new Teacher();
		te.setDegree(request.getParameter("tdegree").trim());
		te.setDept(request.getParameter("tdept").trim());
		if (request.getParameter("temail") != null)
			te.setEmail(request.getParameter("temail").trim());
		te.setGroup(teacher.getGroup());
		
		te.setName(request.getParameter("tname").trim());
		te.setNumber(request.getParameter("tnumber").trim());
		te.setPassword(request.getParameter("tpassword").trim());
		te.setPhone(request.getParameter("tphone").trim());
		te.setSex(request.getParameter("tsex").trim());
		te.setRight(teacher.getRight());
		te.setTitle(request.getParameter("title").trim());
		if (TeacherManager.update(te)) {
			out.println("�޸ĳɹ�");
		} else {
			out.println("�޸�ʧ��");
		}
		return;
	} 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript">
	function depart_add() {
		if (document.editForm.tgroup.value.length == 0) {
			alert("�������ʦ����������!");
			document.editForm.tgroup.focus();
			return false;
		}
		if (document.editForm.tname.value.length == 0) {
			alert("�������ʦ��!");
			document.editForm.tname.focus();
			return false;
		}
		if (document.editForm.tphone.value.length == 0) {
			alert("�������ʦ�ĵ绰����!");
			document.editForm.tphone.focus();
			return false;
		}
		return true;

	}
</script>
<title>�鿴��ʦ</title>
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black>&nbsp;<strong>�������ģ��޸ĸ�������</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6">
				�������̣����޸ĸ�����Ϣ--&gt;�ڹ����Լ���ѡ��--&gt;�۲鿴ѧ��ѡ�����--&gt;��ָ��ѧ����ɿ������</td>
		</tr>
	</table>
	<center>
		<br />
		<%
			Teacher tea = TeacherManager.getByTno(teacher.getNumber());
		%>

		<table width="100%" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<form name="editForm" method="post" action="?Action=SaveEdit">
				<tr>
					<tr>
						<td height="24" nowrap bgcolor="#E1E6F6">
							<table width="100%" border="0" cellpadding="3" cellspacing="2">
								<tr>
									<td height="24" nowrap="nowrap" bgcolor="#E1E6F6">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											id="editProduct" idth="100%">
											<tr>
												<td width="120" height="20" align="right">&nbsp;</td>
												<td>
													<div align="left"></div>
												</td>
											</tr>
											<tr>
												<td width="120" height="20" align="right">&nbsp;</td>
												<td>
													<div align="left"></div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">��ʦ��ţ�</td>
												<td>
													<div align="left">
														<input name="tnumber" readonly="true" id="tnumber"
														readonly = "readonly"	 value="<%=tea.getNumber()%>">
														&nbsp;*�����޸�
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">��ʦ������</td>
												<td>
													<div align="left">
														<input name="tname" id="tname" value="<%=tea.getName()%>"
															size="19" /> &nbsp;*
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">�Ա�</td>
												<td>
													<div align="left">
														&nbsp; <label> <input type="radio" name="tsex"
															value="��"
															<%if (tea.getSex().trim().equals("��"))
				out.println("checked='checked'");%> />
															��
														</label> <label> <input type="radio" name="tsex"
															<%if (tea.getSex().trim().equals("Ů"))
				out.println("checked='checked'");%>
															value="Ů" /> Ů
														</label>
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">��¼���룺</td>
												<td>
													<div align="left">
														<input name="tpassword" id="tpassword" type="password"
															value="<%=tea.getPassword()%>" size="20" /> &nbsp;* Ĭ������
														admin
													</div>
												</td>
											</tr>

											<tr>
												<td height="20" align="right">����ϵ��</td>
												<td>
													<div align="left">
														<input name="tdept" id="tdept" value="<%=tea.getDept()%>" />
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">�绰���룺</td>
												<td>
													<div align="left">
														<input name="tphone" id="tphone"
															value="<%=tea.getPhone()%>" size="19" /> &nbsp;
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">��ʦ���䣺</td>
												<td>
													<div align="left">
														<input name="temail" id="temail"
															value="<%=tea.getEmail()%>" /> &nbsp;
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">��ʦְ�ƣ�</td>
												<td>
													<div align="left">
														<select name="title" id="title">
															<option value="����"
																<%if (tea.getTitle().trim().equals("����"))
				out.print("selected='selected'");%>>����</option>
															<option value="��ʦ"
																<%if (tea.getTitle().trim().equals("��ʦ"))
				out.print("selected='selected'");%>>��ʦ</option>
															<option value="������"
																<%if (tea.getTitle().trim().equals("������"))
				out.print("selected='selected'");%>>������</option>
															<option value="����"
																<%if (tea.getTitle().trim().equals("����"))
				out.print("selected='selected'");%>>����</option>
														</select>
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" valign="top">��ʦѧ����</td>
												<td>
													<div align="left">
														<select name="tdegree" id="tdegree">
															<option value="˶ʿ"
																<%if (tea.getDegree().trim().equals("˶ʿ"))
				out.print("selected='selected'");%>>˶ʿ</option>
															<option value="��ʿ"
																<%if (tea.getDegree().trim().equals("��ʿ"))
				out.print("selected='selected'");%>>��ʿ</option>
															<option value="��ʿ��"
																<%if (tea.getDegree().trim().equals("��ʿ��"))
				out.print("selected='selected'");%>>��ʿ��</option>
															<option value="����"
																<%if (tea.getDegree().trim().equals("����"))
				out.print("selected='selected'");%>>����</option>
														</select>
													</div>
												</td>
											</tr>

											<tr>
												<td height="30" align="right">&nbsp;</td>
												<td valign="bottom">
													<div align="left">
														<input name="submitSaveEdit3" type="submit" class="button"
															id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;">

														<input name="submitSaveEdit22" type="reset" class="button"
															id="submitSaveEdit22" value=" �� �� " style="WIDTH: 60;" />
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">&nbsp;</td>
												<td valign="bottom">
													<div align="left"></div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
			</form>
		</table>
	</center>
</body>
</html>

