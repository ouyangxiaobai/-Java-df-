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
				alert("������ѧ��!");
				document.frm.St_number.focus();
				return false;
			}
			if (document.frm.St_name.value.length == 0) {
				alert("������ѧ����!");
				document.frm.St_name.focus();
				return false;
			}
			if (document.frm.St_class.value.length == 0) {
				alert("������༶!");
				document.frm.St_class.focus();
				return false;
			}
			if (document.frm.St_phone.value.length == 0) {
				alert("�������ֻ���!");
				document.frm.St_phone.focus();
				return false;
			}
			if (document.frm.St_group.value.length == 0) {
				alert("�����������!");
				document.frm.St_group.focus();
				return false;
			}
			return true;
		}
	</script>
	<title>�鿴ѧ��</title>
</head>
<!-- 
��ӵ���ѧ������ʾѧ���Ƿ��Ѿ����ڣ�ajax��
-->
<script type="text/javascript">
	var req;
	function validate() {
		var idField = document.getElementById("St_number");
		var url = "student_validate.jsp?id=" + escape(idField.value);
		if (document.frm.St_number.value.length == 0) {
			document.getElementById("usermsg").innerHTML = "<font color='red'>ѧ�Ų���Ϊ�գ�</font>";
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
			mdiv.innerHTML = "<font color='red'>ѧ���Ѵ��ڣ�������ӣ�</font>";
		} else {
			mdiv.innerHTML = "<font color='green'>��ϲ��!����������ѧ�����!</font>";
		}
	}
</script>

<%
	request.setCharacterEncoding("GBK");
	String result = request.getParameter("Result");
	/*
	�ж��ύ�Ĳ����Ƿ���ɾ���������Ǿ͵���StudengManager�е�deleterBySno���� 
	*/
	if (result != null && result.trim().equals("delete")) {
		String id = (String) request.getParameter("ID");
		if (StudentManager.deleteBySno(id)) {
			response.sendRedirect("student_list.jsp");
			return;
		} else {
			out.println("ɾ��δ�ɹ�");
			return;
		}
		//out.println(id);
	}
%>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>ѧ��������ӣ��޸�ѧ����Ϣ</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6"><a
				href="student_add.jsp?Result=Add">���ѧ��</a><font color="#E1E6F6">&nbsp;|&nbsp;</font><a
				href="student_list.jsp">�鿴����ѧ��</a></td>
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
								<td height="20" align="right">ѧ�ţ�</td>
								<td>
									<div align="left">
										<input name="St_number" id="St_number" onblur="validate()" />
										<span id="usermsg"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">ѧ��������</td>
								<td>
									<div align="left">
										<input name="St_name" id="St_name" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">�༶��</td>
								<td>
									<div align="left">
										<input name="St_class" id="St_class" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">��¼���룺</td>
								<td>
									<div align="left">
										<input name="St_password" id="st_password" value="admin" />
										&nbsp;Ĭ������ admin
									</div>
								</td>
							</tr>

							<tr>
								<td height="20" align="right">�Ա�</td>
								<td>
									<div align="left">
										&nbsp; <label> <input type="radio" name="St_sex"
											value="��" checked="checked" /> ��
										</label> <label> <input type="radio" name="St_sex" value="Ů" />
											Ů
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">��ţ�</td>
								<td>
									<div align="left">
										<input name="St_group" id="St_group" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">�ֻ����룺</td>
								<td>
									<div align="left">
										<input name="St_phone" id="St_m_phone" /> &nbsp;* �������д��Ч��ϵ��ʽ
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">�������䣺</td>
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
											id="submitSaveEdit" value=" �� �� " style="WIDTH: 60;" /> <input
											name="submitSaveEdit2" type="reset" class="button"
											id="submitSaveEdit2" value=" �� �� " style="WIDTH: 60;" />
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
		��ȡform�ύ������ѧ����Ϣ�����浽st�����У��ڵ���StudentManager�е�sava�������浽���ݿ��� 
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
			out.println("��ӳɹ���");
			response.sendRedirect("student_list.jsp");
		} else {
			out.println("ѧ���Ѵ��ڣ����δ�ɹ���");
		}
	}
%>
