<%@page pageEncoding="GBK" import="vo.*, dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<script language="javascript" type="text/javascript">
		function depart_add() {
			if (document.frm.tnum.value.length == 0) {
				alert("�������ʦ���!");
				document.frm.tnum.focus();
				return false;
			}
			if (document.frm.tname.value.length == 0) {
				alert("�������ʦ��!");
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
				document.getElementById("usermsg").innerHTML = "<font color='red'>��ʦ�Ų���Ϊ�գ�</font>";
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
				mdiv.innerHTML = "<font color='red'>��ʦ���Ѵ��ڣ�������ӣ�</font>";
			} else {
				mdiv.innerHTML = "<font color='green'>��ϲ��!������������ʦ�����!</font>";
			}
		}
	</script>

	<title>�鿴��ʦ</title>
</head>
<%@ include file="check.jsp"%>
<%
	request.setCharacterEncoding("GBK");
	String result = request.getParameter("Result");
	if (result != null && result.trim().equals("delete")) {
		String id = (String) request.getParameter("ID");
		if (teacher.getNumber().equals(id)) {
			out.println(id + "���û��Ѿ���¼������ɾ����");
			return;
		}
		if (TeacherManager.deleteByTno(id)) {
			response.sendRedirect("teacher_list.jsp");
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
			<td height="24" nowrap>&nbsp;<strong><font color="black"> ��ʦ������ӣ��޸Ľ�ʦ��Ϣ</font></strong>
			</td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6"><a
				href="teacher_add.jsp?Result=Add" color="#000000"><font color="black">��ӽ�ʦ</a><font color="#E1E6F6">&nbsp;|&nbsp;</font><a
				href="teacher_list.jsp"><font color="black">�鿴���н�ʦ</a></td>
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
								<td height="20" align="right"><font color="black">��ʦ��ţ�</td>
								<td>
									<div align="left">
										<input name="tnumber" id="tnumber" onblur="validate()">
											&nbsp;*&nbsp; <span id="usermsg"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">��ʦ������</td>
								<td>
									<div align="left">
										<input name="tname" id="tname" size="19" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">�Ա�</td>
								<td>
									<div align="left">
										&nbsp; <label> <input type="radio" name="tsex"
											value="��" checked="checked" /><font color="black">��
										</label> <label> <input type="radio" name="tsex" value="Ů" />
											<font color="black">Ů
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">��¼���룺</td>
								<td>
									<div align="left">
										<input name="tpassword" id="tpassword" value="admin" size="20" />
										<font color="black">&nbsp;* Ĭ������ admin
									</div>
								</td>
							</tr>
							<td height="20" align="right"><font color="black">��ʦ��ݣ�</td>
							<td>
								<div align="left">
									&nbsp; <label> <input type="radio" name="tright"
										value="1" checked="checked" /> <font color="black">��ͨ��ʦ
									</label> <label> <input type="radio" name="tright" value="0" />
										<font color="black">����Ա
									</label>
								</div>
							</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">����ϵ��</td>
								<td>
									<div align="left">
										<input name="tdept" id="tdept" />
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">�绰���룺</td>
								<td>
									<div align="left">
										<input name="tphone" id="tphone" size="19" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">��ʦ���䣺</td>
								<td>
									<div align="left">
										<input name="temail" id="temail" /> &nbsp;
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">���</td>
								<td>
									<div align="left">
										<input name="tgroup" id="tgroup" /> &nbsp;*
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="black">��ʦְ�ƣ�</td>
								<td>
									<div align="left">
										<select name="title" id="title">
											<option value="����" selected="selected">����</option>
											<option value="��ʦ">��ʦ</option>
											<option value="������">������</option>
											<option value="����">����</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top"><font color="black">��ʦѧ����</td>
								<td>
									<div align="left">
										<select name="tdegree" id="tdegree">
											<option value="˶ʿ" selected="selected">˶ʿ</option>
											<option value="��ʿ">��ʿ</option>
											<option value="��ʿ��">��ʿ��</option>
											<option value="����">����</option>
										</select>
									</div>
								</td>
							</tr>

							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit3" type="submit" class="button"
											id="submitSaveEdit3" value="�ύ" style="WIDTH: 60;"> <input
											name="submitSaveEdit22" type="reset" class="button"
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
			out.println("����ʧ��");
		}
	}
%>