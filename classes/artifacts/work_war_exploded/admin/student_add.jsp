<%@page pageEncoding="GBK" import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<%@ include file="check.jsp"%>
	<script language="javascript" type="text/javascript">
		function depart_add() {
			if (document.frm.St_number.value.length == 0) {
				alert("请输入学号!");
				document.frm.St_number.focus();
				return false;
			}
			if (document.frm.St_name.value.length == 0) {
				alert("请输入学生名!");
				document.frm.St_name.focus();
				return false;
			}
			if (document.frm.St_class.value.length == 0) {
				alert("请输入班级!");
				document.frm.St_class.focus();
				return false;
			}
			if (document.frm.St_phone.value.length == 0) {
				alert("请输入手机号!");
				document.frm.St_phone.focus();
				return false;
			}
			if (document.frm.St_group.value.length == 0) {
				alert("请输入手组号!");
				document.frm.St_group.focus();
				return false;
			}
			return true;
		}
	</script>
	<title>查看学生</title>
</head>
<!-- 
添加单个学生是提示学号是否已经存在（ajax）
-->
<script type="text/javascript">
	var req;
	function validate() {
		var idField = document.getElementById("St_number");
		var url = "student_validate.jsp?id=" + escape(idField.value);
		if (document.frm.St_number.value.length == 0) {
			document.getElementById("usermsg").innerHTML = "<font color='red'>学号不能为空！</font>";
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
			mdiv.innerHTML = "<font color='red'>学号已存在，不能添加！</font>";
		} else {
			mdiv.innerHTML = "<font color='green'>恭喜你!你可以用这个学号添加!</font>";
		}
	}
</script>

<%
	request.setCharacterEncoding("GBK");
	String result = request.getParameter("Result");
	/*
	判断提交的操作是否是删除操作，是就调用StudengManager中的deleterBySno方法 
	*/
	if (result != null && result.trim().equals("delete")) {
		String id = (String) request.getParameter("ID");
		if (StudentManager.deleteBySno(id)) {
			response.sendRedirect("student_list.jsp");
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
			<td height="24" nowrap><font color=black> &nbsp;<strong>学生管理：添加，修改学生信息</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6"><a
				href="student_add.jsp?Result=Add">添加学生</a><font color="#E1E6F6">&nbsp;|&nbsp;</font><a
				href="student_list.jsp">查看所有学生</a></td>
		</tr>
	</table>
	<center>
		<br />
		<table width="100%" border="0" cellpadding="3" cellspacing="2"
			bgcolor="#E1E6F6">
			<form name="frm" method="post" action="student_add.jsp"
				onsubmit="return depart_add()">
				<input name="oprate" value="Add" type="hidden" />
				<tr>
					<td height="24" nowrap bgcolor="#E1E6F6">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							id=editProduct idth="100%">

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
										<input name="St_number" id="St_number" onblur="validate()" />
										<span id="usermsg"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">学生姓名：</td>
								<td>
									<div align="left">
										<input name="St_name" id="St_name" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">班级：</td>
								<td>
									<div align="left">
										<input name="St_class" id="St_class" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">登录密码：</td>
								<td>
									<div align="left">
										<input name="St_password" id="st_password" value="admin" />
										&nbsp;默认密码 admin
									</div>
								</td>
							</tr>

							<tr>
								<td height="20" align="right">性别：</td>
								<td>
									<div align="left">
										&nbsp; <label> <input type="radio" name="St_sex"
											value="男" checked="checked" /> 男
										</label> <label> <input type="radio" name="St_sex" value="女" />
											女
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">组号：</td>
								<td>
									<div align="left">
										<input name="St_group" id="St_group" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">手机号码：</td>
								<td>
									<div align="left">
										<input name="St_phone" id="St_m_phone" /> &nbsp;* 请务必填写有效联系方式
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">电子邮箱：</td>
								<td>
									<div align="left">
										<input name="St_email" id="St_email" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
											id="submitSaveEdit" value=" 添 加 " style="WIDTH: 60;" /> <input
											name="submitSaveEdit2" type="reset" class="button"
											id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;" />
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
<%@page import="vo.*, dao.*"%>
<%
	request.setCharacterEncoding("GBK");
	String action = null;
	action = request.getParameter("oprate");
	if (action != null && action.trim().equals("Add")) {
		Student st = new Student();
		/*
		获取form提交过来的学生信息，保存到st对象中，在调用StudentManager中的sava方法保存到数据库中 
		*/
		if (request.getParameter("St_email") != null)
			st.setEmail(request.getParameter("St_email").trim());
		st.setGroup(request.getParameter("St_group").trim());
		st.setName(request.getParameter("St_name").trim());
		st.setNumber(request.getParameter("St_number").trim());
		st.setPassword(request.getParameter("St_password").trim());
		st.setSclass(request.getParameter("St_class").trim());
		st.setPhone(request.getParameter("St_phone").trim());
		st.setSex(request.getParameter("St_sex").trim());
		if (StudentManager.save(st)) {
			out.println("添加成功！");
			response.sendRedirect("student_list.jsp");
		} else {
			out.println("学号已存在！添加未成功！");
		}
	}
%>
