<%@page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="check.jsp"%>
<%
	request.setCharacterEncoding("GBK");
	response.setCharacterEncoding("GBK");
	String result = request.getParameter("Result");
	Teacher u = (Teacher) session.getAttribute("user");
	if (u == null) {
		out.println("登录时间超时！请重新登录！");
		return;
	}
	u = TeacherManager.getByTno(u.getNumber());
%>

<script language="javascript" type="text/javascript">
function depart_add() {
	if (document.frm.number.value.length == 0) {
		alert("请输入课题号!");
		document.frm.number.focus();
		return false;
	}
	if (document.frm.topic.value.length == 0) {
		alert("请输入课题名!");
		document.frm.topic.focus();
		return false;
	}
	if (document.frm.content.value.length == 0) {
		alert("请输入该课题的任务和要求!");
		document.frm.St_class.focus();
		return false;
	}
	if (document.result.value.length == 0) {
		alert("请输入该课题的成果要求!");
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
			document.getElementById("usermsg").innerHTML = "<font color='red'>课题号不能为空！</font>"; 
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
			mdiv.innerHTML = "<font color='red'>课题号已存在，不能添加！</font>";
		} else {
			mdiv.innerHTML = "<font color='green'>恭喜你!你可以用这个课题号添加!</font>";
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
			document.getElementById("usermsg2").innerHTML = "<font color='red'>课题名不能为空！</font>";
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
			mdiv.innerHTML = "<font color='red'>您已发布该课题，不能发布相同课题！</font>";
		} else {
			mdiv.innerHTML = "<font color='green'>恭喜你!你可以用这个课题名添加!</font>";
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>添加修改课题</title>
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>课题管理：添加，修改课题信息</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6"><a
				href="/work/teacher?type=3" onClick='changeAdminFlag("系统管理员")'><font color=black> 查看所有课题</a> 
				<a href="/work/teacher?type=1&t_num=<%=u.getNumber()%>"
				onClick='changeAdminFlag("系统管理员")'><font color=black> 我的选题列表</a></td>
		</tr>
	</table>
	<center>
		<br />
		<%
			if (result != null && result.trim().equals("Add")) {
				if (MsgManager.getTexts("教师相关功能") == null) {
					out.println("此功能尚未开启，不能做此操作！");
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
								<td height="20" align="right"><font color=black> 课题编号：</td>
								<td>
									<div align="left">
										<input name="number" id="number" onblur="validate()" />
										&nbsp;* &nbsp; <span id="usermsg"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color=black> 课题名称：</td>
								<td>
									<div align="left">
										<input name="topic" id="topic" size="20" onblur="validate2()" />&nbsp;
										* &nbsp; <span id="usermsg2"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color=black> 课题类型：</td>
								<td>
									<div align="left">
										<select name="category" id="dnum">
											<option value="1" selected="selected"><font color=black> 毕业设计</option>
											<option value="2"><font color=black> 毕业论文</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color=black> 课题性质：</td>
								<td>
									<div align="left">
										<select name="kind" id="kind">
											<option value="1" selected="selected">工程设计</option>
											<option value="2">技术科学研究与工程技术</option>
											<option value="3">软件研究</option>
											<option value="4">理论研究</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color=black> 课题来源：</td>
								<td>
									<div align="left">
										<select name="source" id="source">
											<option value="1" selected="selected">结合科研</option>
											<option value="2">结合生产实际</option>
											<option value="3">结合实验室建设</option>
											<option value="4">自拟题目</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top"><font color=black> 课题任务和要求：</td>
								<td>
									<div align="left">
										<textarea name="content" cols="60" rows="8" vaulue=""
											class="textfield" id="content" style="WIDTH: 350;">
											</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top"><font color=black> 成果要求：</td>
								<td>
									<div align="left">
										<textarea name="result" cols="60" rows="8" value=""
											class="textfield" id="result" style="WIDTH: 280;">
													</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right" valign="top"><font color=black> 备注：</td>
								<td>
									<div align="left">
										<textarea name="direction" cols="60" rows="8" value=""
											class="textfield" id="result" style="WIDTH: 280;">
													</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="white"> 指导老师：</td>
								<td>
									<div align="left">
										<%=u.getName()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right"><font color="white"> 老师电话：</td>
								<td>
									<div align="left">
										<%=u.getPhone()%>
									</div>
								</td>
							</tr>
							

							<%
								if (MsgManager.getTexts("教师相关功能") != null) {
							%>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
			id="submitSaveEdit" value="添 加"  onclick="<% int i=Integer.parseInt(teacher.getGroup())-1; String s=String.valueOf(i);teacher.setGroup(s);%>" style="WIDTH: 60;">
											
											<input name="submitSaveEdit2" type="reset" class="button"
											id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;">
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
								<td><div align="right">选择该题的学生信息</div></td>
								<%
									}
								%>
							</tr>
							<tr>
								<td height="20" align="right">课题编号：</td>
								<td>
									<div align="left">
										<input name="number" value="<%=t.getNumber()%>"
											readonly="readonly" />
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">学号：</td>
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
								<td height="20" align="right">课题名称：</td>
								<td>
									<div align="left">
										<input name="topic" id="topic" value="<%=t.getName()%>"
											readonly="readonly" />
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">学生姓名：</td>
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
								<td height="20" align="right">课题类型：</td>
								<td>
									<div align="left">
										<select name="category" id="dnum">
											<option value="毕业设计"
												<%if (t.getType().trim().equals("毕业设计"))
					out.print("selected='selected'");%>>毕业设计</option>
											<option value="毕业论文"
												<%if (t.getType().trim().equals("毕业论文"))
					out.print("selected='selected'");%>>毕业论文</option>
										</select>
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">学生性别：</td>
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
								<td height="20" align="right">课题性质：</td>
								<td>
									<div align="left">
										<select name="kind" id="kind">
											<option value="工程设计"
												<%if (t.getKind().trim().equals("工程设计"))
					out.print("selected='selected'");%>>工程设计</option>
											<option value="技术科学研究与工程技术"
												<%if (t.getKind().trim().equals("技术科学研究与工程技术"))
					out.print("selected='selected'");%>>技术科学研究与工程技术</option>
											<option value="软件研究"
												<%if (t.getKind().trim().equals("软件研究"))
					out.print("selected='selected'");%>>软件研究</option>
											<option value="理论研究"
												<%if (t.getKind().trim().equals("理论研究"))
					out.print("selected='selected'");%>>理论研究</option>
										</select>
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">学生班级：</td>
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
								<td height="20" align="right">课题来源：</td>
								<td>
									<div align="left">
										<select name="source" id="source">
											<option value="结合科研"
												<%if (t.getSource().trim().equals("结合科研"))
					out.print("selected='selected'");%>>结合科研</option>
											<option value="结合生产实际"
												<%if (t.getSource().trim().equals("结合生产实际"))
					out.print("selected='selected'");%>>结合生产实际</option>
											<option value="结合实验室建设"
												<%if (t.getSource().trim().equals("结合实验室建设"))
					out.print("selected='selected'");%>>结合实验室建设</option>
											<option value="自拟题目"
												<%if (t.getSource().trim().equals("自拟题目"))
					out.print("selected='selected'");%>>自拟题目</option>
										</select>
									</div>
								</td>
								<%
									if (stu != null) {
								%>
								<td height="20" align="right">学生电话：</td>
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
								<td height="20" align="right" valign="top">课题任务和要求：</td>
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
								<td height="20" align="right">学生邮箱：</td>
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
								<td height="20" align="right" valign="top">成果要求：</td>
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
								<td height="20" align="right" valign="top">备注：</td>
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
								<td height="20" align="right">指导老师：</td>
								<td>
									<div align="left">
										<%=u.getName()%>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" align="right">老师电话：</td>
								<td>
									<div align="left">
										<%=u.getPhone()%>
									</div>
								</td>
							</tr>
							<%
								if (MsgManager.getTexts("教师相关功能") != null && t.getTnumber().equals(teacher.getNumber())) {
							%>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom">
									<div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
											id="submitSaveEdit" value=" 修改" style="WIDTH: 60;"> <input
											name="submitSaveEdit2" type="reset" class="button"
											id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;">
									</div>
								</td>
							</tr>
							<%
								} else if ((MsgManager.getTexts("教师相关功能") == null && t.getTnumber().equals(teacher.getNumber()))||TopicManager.getByTno(teacher.getNumber())!=null) {
										out.println("教师功能尚未开启，只能查看课题信息，不能修改！");
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
			out.println("11111111您已发布该课题了，本次发布未成功！");
		}
		if (TopicManager.save(t)) {
			response.sendRedirect("/work/teacher?type=1");
		} else {
			out.println("22222222222您已发布该课题了，本次发布未成功！");
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
			//out.println("修改成功！");
			response.sendRedirect("/work/teacher?type=1");
		} else {
			out.println("修改未成功");
		}
	}
%>
