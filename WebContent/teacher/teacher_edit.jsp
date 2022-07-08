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
			out.println("修改成功");
		} else {
			out.println("修改失败");
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
			alert("请输入教师所属的组别号!");
			document.editForm.tgroup.focus();
			return false;
		}
		if (document.editForm.tname.value.length == 0) {
			alert("请输入教师名!");
			document.editForm.tname.focus();
			return false;
		}
		if (document.editForm.tphone.value.length == 0) {
			alert("请输入教师的电话号码!");
			document.editForm.tphone.focus();
			return false;
		}
		return true;

	}
</script>
<title>查看教师</title>
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black>&nbsp;<strong>个人中心：修改个人资料</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6">
				操作流程：①修改个人信息--&gt;②管理自己的选题--&gt;③查看学生选题情况--&gt;④指导学生完成课题设计</td>
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
												<td height="20" align="right">教师编号：</td>
												<td>
													<div align="left">
														<input name="tnumber" readonly="true" id="tnumber"
														readonly = "readonly"	 value="<%=tea.getNumber()%>">
														&nbsp;*不能修改
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">教师姓名：</td>
												<td>
													<div align="left">
														<input name="tname" id="tname" value="<%=tea.getName()%>"
															size="19" /> &nbsp;*
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">性别：</td>
												<td>
													<div align="left">
														&nbsp; <label> <input type="radio" name="tsex"
															value="男"
															<%if (tea.getSex().trim().equals("男"))
				out.println("checked='checked'");%> />
															男
														</label> <label> <input type="radio" name="tsex"
															<%if (tea.getSex().trim().equals("女"))
				out.println("checked='checked'");%>
															value="女" /> 女
														</label>
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">登录密码：</td>
												<td>
													<div align="left">
														<input name="tpassword" id="tpassword" type="password"
															value="<%=tea.getPassword()%>" size="20" /> &nbsp;* 默认密码
														admin
													</div>
												</td>
											</tr>

											<tr>
												<td height="20" align="right">所在系：</td>
												<td>
													<div align="left">
														<input name="tdept" id="tdept" value="<%=tea.getDept()%>" />
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">电话号码：</td>
												<td>
													<div align="left">
														<input name="tphone" id="tphone"
															value="<%=tea.getPhone()%>" size="19" /> &nbsp;
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">教师邮箱：</td>
												<td>
													<div align="left">
														<input name="temail" id="temail"
															value="<%=tea.getEmail()%>" /> &nbsp;
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right">教师职称：</td>
												<td>
													<div align="left">
														<select name="title" id="title">
															<option value="助教"
																<%if (tea.getTitle().trim().equals("助教"))
				out.print("selected='selected'");%>>助教</option>
															<option value="讲师"
																<%if (tea.getTitle().trim().equals("讲师"))
				out.print("selected='selected'");%>>讲师</option>
															<option value="副教授"
																<%if (tea.getTitle().trim().equals("副教授"))
				out.print("selected='selected'");%>>副教授</option>
															<option value="教授"
																<%if (tea.getTitle().trim().equals("教授"))
				out.print("selected='selected'");%>>教授</option>
														</select>
													</div>
												</td>
											</tr>
											<tr>
												<td height="20" align="right" valign="top">教师学历：</td>
												<td>
													<div align="left">
														<select name="tdegree" id="tdegree">
															<option value="硕士"
																<%if (tea.getDegree().trim().equals("硕士"))
				out.print("selected='selected'");%>>硕士</option>
															<option value="博士"
																<%if (tea.getDegree().trim().equals("博士"))
				out.print("selected='selected'");%>>博士</option>
															<option value="博士后"
																<%if (tea.getDegree().trim().equals("博士后"))
				out.print("selected='selected'");%>>博士后</option>
															<option value="本科"
																<%if (tea.getDegree().trim().equals("本科"))
				out.print("selected='selected'");%>>本科</option>
														</select>
													</div>
												</td>
											</tr>

											<tr>
												<td height="30" align="right">&nbsp;</td>
												<td valign="bottom">
													<div align="left">
														<input name="submitSaveEdit3" type="submit" class="button"
															id="submitSaveEdit3" value=" 修 改 " style="WIDTH: 60;">

														<input name="submitSaveEdit22" type="reset" class="button"
															id="submitSaveEdit22" value=" 重 置 " style="WIDTH: 60;" />
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

