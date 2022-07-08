<%@page pageEncoding="GBK" import="vo.*, dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<script language="javascript" type="text/javascript">
		function depart_add() {
			if (document.frm.tnum.value.length == 0) {
				alert("请输入教师编号!");
				document.frm.tnum.focus();
				return false;
			}
			if (document.frm.tname.value.length == 0) {
				alert("请输入教师名!");
				document.frm.tname.focus();
				return false;
			}
			return true;
 
		}
	</script>

	<script type="text/javascript">
		var req;
		function validate() {
			var idField = document.getElementById("tnumber");
			var url = "teacher_validate.jsp?id=" + escape(idField.value);
			if (document.frm.tnumber.value.length == 0) {
				document.getElementById("usermsg").innerHTML = "<font color='red'>教师号不能为空！</font>";
				return;
			}
			if (window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.open("GET", url, true);
			req.onreadystatechange = callback1;
			req.send(null);
		}

		function callback1() {
			if (req.readyState == 4) {
				if (req.status == 200) {
					//alert(req.responseText);
					var msg = req.responseXML.getElementsByTagName("msg")[0];
					//alert(msg);
					setMsg(msg.childNodes[0].nodeValue);
				}
			}
		}

		function setMsg(msg) {
			//alert(msg);
			mdiv = document.getElementById("usermsg");
			if (msg == "invalid") {
				mdiv.innerHTML = "<font color='red'>教师号已存在，不能添加！</font>";
			} else {
				mdiv.innerHTML = "<font color='green'>恭喜你!你可以用这个教师号添加!</font>";
			}
		}
	</script>

	<title>查看教师</title>
</head>
<%@ include file="check.jsp"%>
<%
	request.setCharacterEncoding("GBK");
	String result = request.getParameter("Result");
	if (result != null && result.trim().equals("delete")) {
		String id = (String) request.getParameter("ID");
		if (teacher.getNumber().equals(id)) {
			out.println(id + "此用户已经登录，不能删除！");
			return;
		}
		if (TeacherManager.deleteByTno(id)) {
			response.sendRedirect("teacher_list.jsp");
			return;
		} else {
			out.println("删除未成功");
			return;
		}
		//out.println(id);
	}
%>

<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap>&nbsp;<strong><font color="black"> 教师管理：添加，修改教师信息</font></strong>
			</td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6"><a
				href="teacher_add.jsp?Result=Add" color="#000000"><font color="black">添加教师</a><font color="#E1E6F6">&nbsp;|&nbsp;</font><a
				href="teacher_list.jsp"><font color="black">查看所有教师</a></td>
		</tr>
	</table>
	<center>
		<br />
		<table width="100%" border="0" cellpadding="3" cellspacing="2"
			bgcolor="#E1E6F6">
			<form name="frm" method="post" action="teacher_add.jsp?Action=addnew"
				onsubmit="return depart_add()">
				<tr>
					<td height="24" nowrap bgcolor="#E1E6F6">
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
								<td height="20" align="right"><font color="black">教师编号：</td>
								<td>
									<div align="left">
										<input name="tnumber" id="tnumber" onblur="validate()">
											&nbsp;*&nbsp; <span id="usermsg"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">教师姓名：</td>
								<td>
									<div align="left">
										<input name="tname" id="tname" size="19" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">性别：</td>
								<td>
									<div align="left">
										&nbsp; <label> <input type="radio" name="tsex"
											value="男" checked="checked" /><font color="black">男
										</label> <label> <input type="radio" name="tsex" value="女" />
											<font color="black">女
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">登录密码：</td>
								<td>
									<div align="left">
										<input name="tpassword" id="tpassword" value="admin" size="20" />
										<font color="black">&nbsp;* 默认密码 admin
									</div>
								</td>
							</tr>
							<td height="20" align="right"><font color="black">教师身份：</td>
							<td>
								<div align="left">
									&nbsp; <label> <input type="radio" name="tright"
										value="1" checked="checked" /> <font color="black">普通教师
									</label> <label> <input type="radio" name="tright" value="0" />
										<font color="black">管理员
									</label>
								</div>
							</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">所在系：</td>
								<td>
									<div align="left">
										<input name="tdept" id="tdept" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">电话号码：</td>
								<td>
									<div align="left">
										<input name="tphone" id="tphone" size="19" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">教师邮箱：</td>
								<td>
									<div align="left">
										<input name="temail" id="temail" /> &nbsp;
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">组别：</td>
								<td>
									<div align="left">
										<input name="tgroup" id="tgroup" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">教师职称：</td>
								<td>
									<div align="left">
										<select name="title" id="title">
											<option value="助教" selected="selected">助教</option>
											<option value="讲师">讲师</option>
											<option value="副教授">副教授</option>
											<option value="教授">教授</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top"><font color="black">教师学历：</td>
								<td>
									<div align="left">
										<select name="tdegree" id="tdegree">
											<option value="硕士" selected="selected">硕士</option>
											<option value="博士">博士</option>
											<option value="博士后">博士后</option>
											<option value="本科">本科</option>
										</select>
									</div>
								</td>
							</tr>

							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit3" type="submit" class="button"
											id="submitSaveEdit3" value="提交" style="WIDTH: 60;"> <input
											name="submitSaveEdit22" type="reset" class="button"
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
<%
	request.setCharacterEncoding("GBK");
	String action = null;
	action = request.getParameter("Action");
	if (action != null && action.trim().equals("addnew")) {
		Teacher te = new Teacher();
		te.setDegree(request.getParameter("tdegree").trim());
		te.setDept(request.getParameter("tdept").trim());
		if (request.getParameter("temail") != null)
			te.setEmail(request.getParameter("temail").trim());
		te.setGroup(request.getParameter("tgroup").trim());
		te.setName(request.getParameter("tname").trim());
		te.setNumber(request.getParameter("tnumber").trim());
		te.setPassword(request.getParameter("tpassword").trim());
		te.setPhone(request.getParameter("tphone").trim());
		te.setSex(request.getParameter("tsex").trim());
		te.setRight(new Short(request.getParameter("tright")));
		te.setTitle(request.getParameter("title").trim());
		if (TeacherManager.save(te)) {
			response.sendRedirect("teacher_list.jsp");
		} else {
			out.println("保存失败");
		}
	}
%>