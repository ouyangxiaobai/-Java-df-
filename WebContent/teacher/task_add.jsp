<%@page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="check.jsp"%>
<%
	request.setCharacterEncoding("GBK");
	response.setCharacterEncoding("GBK");
	String result = request.getParameter("Result");
	Teacher u = (Teacher) session.getAttribute("user");
	if (u == null) {
		out.println("��¼ʱ�䳬ʱ�������µ�¼��");
		return;
	}
	u = TeacherManager.getByTno(u.getNumber());
%>

<script language="javascript" type="text/javascript">
function depart_add() {
	if (document.frm.number.value.length == 0) {
		alert("����������!");
		document.frm.number.focus();
		return false;
	}
	if (document.frm.topic.value.length == 0) {
		alert("�����������!");
		document.frm.topic.focus();
		return false;
	}
	if (document.frm.content.value.length == 0) {
		alert("������ÿ���������Ҫ��!");
		document.frm.St_class.focus();
		return false;
	}
	if (document.result.value.length == 0) {
		alert("������ÿ���ĳɹ�Ҫ��!");
		document.frm.content.focus();
		return false;
	}
	return true;
}
</script>

<script type="text/javascript">
	var req;
	function validate() {
		var idField = document.getElementById("number");
		var url = "task_validate.jsp?id=" + escape(idField.value);
		if (document.frm.number.value.length == 0) {
			document.getElementById("usermsg").innerHTML = "<font color='red'>����Ų���Ϊ�գ�</font>"; 
			return ;
		}
		if(window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("GET", url, true);
		req.onreadystatechange = callback1;
		req.send(null);
	}
	
	function callback1() {
		if(req.readyState == 4) {
			if(req.status == 200) {
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
		if(msg == "invalid") {
			mdiv.innerHTML = "<font color='red'>������Ѵ��ڣ�������ӣ�</font>";
		} else {
			mdiv.innerHTML = "<font color='green'>��ϲ��!������������������!</font>";
		}
	}
	

</script>


<script type="text/javascript">
	var req;
	function validate2() {
		var idField = "<%=u.getNumber()%>";
		var nameField = document.getElementById("topic");
		var url = "task_validate2.jsp?name=" + nameField.value + "&id="
				+ escape(idField);
		if (document.frm.topic.value.length == 0) {
			document.getElementById("usermsg2").innerHTML = "<font color='red'>����������Ϊ�գ�</font>";
			return;
		} 
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("POST", url, true);
		req.onreadystatechange = callback2;
		req.send(null);
	}

	function callback2() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				//alert(req.responseText);
				var msg = req.responseXML.getElementsByTagName("msg")[0];
				//alert(msg);
				setMsg2(msg.childNodes[0].nodeValue);
			}
		}
	}

	function setMsg2(msg) {
		//alert(msg);
		mdiv = document.getElementById("usermsg2");
		if (msg == "invalid") {
			mdiv.innerHTML = "<font color='red'>���ѷ����ÿ��⣬���ܷ�����ͬ���⣡</font>";
		} else {
			mdiv.innerHTML = "<font color='green'>��ϲ��!�������������������!</font>";
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>����޸Ŀ���</title>
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>���������ӣ��޸Ŀ�����Ϣ</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6"><a
				href="/work/teacher?type=3" onClick='changeAdminFlag("ϵͳ����Ա")'><font color=black> �鿴���п���</a> 
				<a href="/work/teacher?type=1&t_num=<%=u.getNumber()%>"
				onClick='changeAdminFlag("ϵͳ����Ա")'><font color=black> �ҵ�ѡ���б�</a></td>
		</tr>
	</table>
	<center>
		<br />
		<%
			if (result != null && result.trim().equals("Add")) {
				if (MsgManager.getTexts("��ʦ��ع���") == null) {
					out.println("�˹�����δ�������������˲�����");
					return;
				}
		%>

		<table width="100%" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<form name="frm" method="post" action="/work/teacher?type=2&Action=addnew"
				onsubmit="return depart_add()">
				<tr></tr>
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
								<td height="20" align="right"><font color=black> �����ţ�</td>
								<td>
									<div align="left">
										<input name="number" id="number" onblur="validate()" />
										&nbsp;* &nbsp; <span id="usermsg"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color=black> �������ƣ�</td>
								<td>
									<div align="left">
										<input name="topic" id="topic" size="20" onblur="validate2()" />&nbsp;
										* &nbsp; <span id="usermsg2"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color=black> �������ͣ�</td>
								<td>
									<div align="left">
										<select name="category" id="dnum">
											<option value="1" selected="selected"><font color=black> ��ҵ���</option>
											<option value="2"><font color=black> ��ҵ����</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color=black> �������ʣ�</td>
								<td>
									<div align="left">
										<select name="kind" id="kind">
											<option value="1" selected="selected">�������</option>
											<option value="2">������ѧ�о��빤�̼���</option>
											<option value="3">����о�</option>
											<option value="4">�����о�</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color=black> ������Դ��</td>
								<td>
									<div align="left">
										<select name="source" id="source">
											<option value="1" selected="selected">��Ͽ���</option>
											<option value="2">�������ʵ��</option>
											<option value="3">���ʵ���ҽ���</option>
											<option value="4">������Ŀ</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top"><font color=black> ���������Ҫ��</td>
								<td>
									<div align="left">
										<textarea name="content" cols="60" rows="8" vaulue=""
											class="textfield" id="content" style="WIDTH: 350;">
											</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top"><font color=black> �ɹ�Ҫ��</td>
								<td>
									<div align="left">
										<textarea name="result" cols="60" rows="8" value=""
											class="textfield" id="result" style="WIDTH: 280;">
													</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top"><font color=black> ��ע��</td>
								<td>
									<div align="left">
										<textarea name="direction" cols="60" rows="8" value=""
											class="textfield" id="result" style="WIDTH: 280;">
													</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="white"> ָ����ʦ��</td>
								<td>
									<div align="left">
										<%=u.getName()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="white"> ��ʦ�绰��</td>
								<td>
									<div align="left">
										<%=u.getPhone()%>
									</div>
								</td>
							</tr>
							

							<%
								if (MsgManager.getTexts("��ʦ��ع���") != null) {
							%>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
			id="submitSaveEdit" value="�� ��"  onclick="<% int i=Integer.parseInt(teacher.getGroup())-1; String s=String.valueOf(i);teacher.setGroup(s);%>" style="WIDTH: 60;">
											
											<input name="submitSaveEdit2" type="reset" class="button"
											id="submitSaveEdit2" value=" �� �� " style="WIDTH: 60;">
									</div>
								</td>
							</tr>
							<%
								}
							%>
						</table>
					</td>
				</tr>
			</form>
		</table>
		<%
			} else if (result != null && result.trim().equals("Modify")) {
				Topic t = TopicManager.getByNum(request.getParameter("t_num"));
				u = TeacherManager.getByTno(t.getTnumber());
				Student stu = null;
				if (t.getSnumber() != null) {
					stu = StudentManager.getBySno(t.getSnumber());
				}
		%>
		<table width="100%" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#6298E1">
			<form name="editForm" method="post"
				action="/work/teacher?type=2&Action=SaveEdit">
				<tr></tr>
				<tr>
					<td height="24" nowrap bgcolor="#E1E6F6">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							id="editProduct" idth="100%">
							<tr>
								<td width="120" height="20" align="right">&nbsp;</td>
								<td>
									<div align="left"></div>
								</td>
								<%
									if (stu != null) {
								%>
								<td><div align="right">ѡ������ѧ����Ϣ</div></td>
								<%
									}
								%>
							</tr>
							<tr>
								<td height="20" align="right">�����ţ�</td>
								<td>
									<div align="left">
										<input name="number" value="<%=t.getNumber()%>"
											readonly="readonly" />
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">ѧ�ţ�</td>
								<td>
									<div align="left">
										<%=stu.getNumber()%>
									</div>
								</td>
								<%
									}
								%>
							</tr>
							<tr>
								<td height="20" align="right">�������ƣ�</td>
								<td>
									<div align="left">
										<input name="topic" id="topic" value="<%=t.getName()%>"
											readonly="readonly" />
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">ѧ��������</td>
								<td>
									<div align="left">
										<%=stu.getName()%>
									</div>
								</td>
								<%
									}
								%>
							</tr>
							<tr>
								<td height="20" align="right">�������ͣ�</td>
								<td>
									<div align="left">
										<select name="category" id="dnum">
											<option value="��ҵ���"
												<%if (t.getType().trim().equals("��ҵ���"))
					out.print("selected='selected'");%>>��ҵ���</option>
											<option value="��ҵ����"
												<%if (t.getType().trim().equals("��ҵ����"))
					out.print("selected='selected'");%>>��ҵ����</option>
										</select>
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">ѧ���Ա�</td>
								<td>
									<div align="left">
										<%=stu.getSex()%>
									</div>
								</td>
								<%
									}
								%>
							</tr>
							<tr>
								<td height="20" align="right">�������ʣ�</td>
								<td>
									<div align="left">
										<select name="kind" id="kind">
											<option value="�������"
												<%if (t.getKind().trim().equals("�������"))
					out.print("selected='selected'");%>>�������</option>
											<option value="������ѧ�о��빤�̼���"
												<%if (t.getKind().trim().equals("������ѧ�о��빤�̼���"))
					out.print("selected='selected'");%>>������ѧ�о��빤�̼���</option>
											<option value="����о�"
												<%if (t.getKind().trim().equals("����о�"))
					out.print("selected='selected'");%>>����о�</option>
											<option value="�����о�"
												<%if (t.getKind().trim().equals("�����о�"))
					out.print("selected='selected'");%>>�����о�</option>
										</select>
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">ѧ���༶��</td>
								<td>
									<div align="left">
										<%=stu.getSclass()%>
									</div>
								</td>
								<%
									}
								%>
							</tr>
							<tr>
								<td height="20" align="right">������Դ��</td>
								<td>
									<div align="left">
										<select name="source" id="source">
											<option value="��Ͽ���"
												<%if (t.getSource().trim().equals("��Ͽ���"))
					out.print("selected='selected'");%>>��Ͽ���</option>
											<option value="�������ʵ��"
												<%if (t.getSource().trim().equals("�������ʵ��"))
					out.print("selected='selected'");%>>�������ʵ��</option>
											<option value="���ʵ���ҽ���"
												<%if (t.getSource().trim().equals("���ʵ���ҽ���"))
					out.print("selected='selected'");%>>���ʵ���ҽ���</option>
											<option value="������Ŀ"
												<%if (t.getSource().trim().equals("������Ŀ"))
					out.print("selected='selected'");%>>������Ŀ</option>
										</select>
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">ѧ���绰��</td>
								<td>
									<div align="left">
										<%=stu.getPhone()%>
									</div>
								</td>
								<%
									}
								%>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">���������Ҫ��</td>
								<td>
									<div align="left">
										<textarea name="content" cols="60" rows="8"
											vaulue="<%=t.getContent()%>" class="textfield" id="content"
											style="WIDTH: 350;"><%=t.getContent()%>
													</textarea>
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">ѧ�����䣺</td>
								<td>
									<div align="left">
										<%=stu.getEmail()%>
									</div>
								</td>
								<%
									}
								%>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">�ɹ�Ҫ��</td>
								<td>
									<div align="left">
										<textarea name="result" cols="60" rows="8"
											value="<%=t.getResult()%>" class="textfield" id="result"
											style="WIDTH: 280;"><%=t.getResult()%>
													</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top">��ע��</td>
								<td>
									<div align="left">
										<textarea name="direction" cols="60" rows="8"
											value="<%=t.getDirection()%>" class="textfield" id="result"
											style="WIDTH: 280;"><%=t.getDirection()%>
													</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">ָ����ʦ��</td>
								<td>
									<div align="left">
										<%=u.getName()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">��ʦ�绰��</td>
								<td>
									<div align="left">
										<%=u.getPhone()%>
									</div>
								</td>
							</tr>
							<%
								if (MsgManager.getTexts("��ʦ��ع���") != null && t.getTnumber().equals(teacher.getNumber())) {
							%>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
											id="submitSaveEdit" value=" �޸�" style="WIDTH: 60;"> <input
											name="submitSaveEdit2" type="reset" class="button"
											id="submitSaveEdit2" value=" �� �� " style="WIDTH: 60;">
									</div>
								</td>
							</tr>
							<%
								} else if ((MsgManager.getTexts("��ʦ��ع���") == null && t.getTnumber().equals(teacher.getNumber()))||TopicManager.getByTno(teacher.getNumber())!=null) {
										out.println("��ʦ������δ������ֻ�ܲ鿴������Ϣ�������޸ģ�");
									}
							%>
						</table>
					</td>
				</tr>
			</form>
		</table>
		<%
			}
		%>
		</td>
		</tr>
		</form>
	</center>
</body>
</html>

<%
	request.setCharacterEncoding("GBK");
	String action = null;
	action = request.getParameter("Action");
	if (action != null && action.trim().equals("addnew")) {
		Topic t = new Topic();
		t.setNumber(request.getParameter("number").trim());
		t.setContent(request.getParameter("content").trim());
		t.setDirection(request.getParameter("direction").trim());
		t.setKind(request.getParameter("kind").trim());
		t.setName(request.getParameter("topic").trim());
		t.setResult(request.getParameter("result").trim());
		t.setSource(request.getParameter("source").trim());
		t.setType(request.getParameter("category").trim());
		t.setStatus("false");
		t.setTnumber(u.getNumber().trim());
		if (TopicManager.getByTnumAndHname(t.getTnumber(), t.getName()) != null) {
			out.println("11111111���ѷ����ÿ����ˣ����η���δ�ɹ���");
		}
		if (TopicManager.save(t)) {
			response.sendRedirect("/work/teacher?type=1");
		} else {
			out.println("22222222222���ѷ����ÿ����ˣ����η���δ�ɹ���");
		}
	}

	if (action != null && action.trim().equals("SaveEdit")) {
		Topic t = new Topic();
		t.setNumber(request.getParameter("number").trim());
		t.setContent(request.getParameter("content").trim());
		t.setDirection(request.getParameter("direction").trim());
		t.setKind(request.getParameter("kind").trim());
		t.setName(request.getParameter("topic").trim());
		t.setResult(request.getParameter("result").trim());
		t.setSource(request.getParameter("source").trim());
		t.setType(request.getParameter("category").trim());
		t.setStatus("false");
		t.setTnumber(u.getNumber().trim());
		if (TopicManager.update(t)) {
			//out.println("�޸ĳɹ���");
			response.sendRedirect("/work/teacher?type=1");
		} else {
			out.println("�޸�δ�ɹ�");
		}
	}
%>
