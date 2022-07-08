<%@page pageEncoding="GBK" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js">
	
</script>
<%@ include file="check.jsp"%>
<title>查看学生</title>
</head>

<body> 
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>修改个人信息</strong>
			</font></td>
		</tr>
	</table>
	<center>
		<br />
		<%Student stu = StudentManager.getBySno(student.getNumber());%>
		<table width="100%" border="0" cellpadding="3" cellspacing="2"
			bgcolor="#E1E6F6">
			<form name="frm" method="post" action="/work/student?type=1" onsubmit="return depart_add()">
				<input name="oprate" value="Modify" type="hidden" />
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
								<td height="20" align="right">学号：</td>
								<td>
									<div align="left">
										<input name="St_number" id="St_number" readonly = "readonly" 
											value="<%=stu.getNumber()%>" />&nbsp; 不能修改
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">学生姓名：</td>
								<td>
									<div align="left">
										<input name="St_name" id="St_name" value="<%=stu.getName()%>" />
										&nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">班级：</td>
								<td>
									<div align="left">
										<input name="St_class" id="St_class"
											value="<%=stu.getSclass()%>" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">登录密码：</td>
								<td>
									<div align="left">
										<input name="St_password" id="st_password" type="password"
											value="<%=stu.getPassword()%>" /> &nbsp;默认密码 admin
									</div>
								</td>
							</tr>

							<tr>
								<td height="20" align="right">性别：</td>
								<td>
									<div align="left">
										&nbsp; <label> <input type="radio" name="St_sex"
											value="男"
											<%if (stu.getSex().equals("男"))
				out.print("checked='checked'");%> />
											男
										</label> <label> <input type="radio" name="St_sex" value="女"
											<%if (stu.getSex().equals("女"))
				out.print("checked='checked'");%> />
											女
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">组号：</td>
								<td>
									<div align="left">
										<input name="St_group" id="St_group"
											value="<%=stu.getGroup()%>" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">手机号码：</td>
								<td>
									<div align="left">
										<input name="St_phone" id="St_m_phone"
											value="<%=stu.getPhone()%>" /> &nbsp;* 请务必填写有效联系方式
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">电子邮箱：</td>
								<td>
									<div align="left">
										<input name="St_email" id="St_email"
											value="<%=stu.getEmail()%>" />
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
			</form>
		</table>
	</center>
</body>
</html>

