<%@page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="check.jsp"%>
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
		var idField = "${u.number}";
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
				href="/work/teacher?type=3" onClick='changeAdminFlag("系统管理员")'>查看所有课题</a> <a
				href="/work/teacher?type=1&t_num=${u.number}"
				onClick='changeAdminFlag("系统管理员")'>我的选题列表</a></td>
		</tr>
	</table>
	<center>
		<br />
			<c:choose>
			   <c:when test="${rindex==0}" >
				   <table width="100%" border="0" cellpadding="3" cellspacing="1"
						bgcolor="#E1E6F6">
						<form name="frm" method="post" action="/work/teacher?type=2&Action=addnew" onsubmit="return depart_add()">
							<tr></tr>
							<tr>
								<td height="24" nowrap bgcolor="#E1E6F6">
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										id="editProduct" idth="100%">
										<tr>
											<td style="display:none" width="120" height="20" align="right">&nbsp;</td>
											<td style="display:none">
												<div align="left" ></div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">课题编号：</td>
											<td>
												<div align="left">
													<input name="number" id="number" onblur="validate()" />
													&nbsp;* &nbsp; <span id="usermsg"></span>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">课题名称：</td>
											<td>
												<div align="left">
													<input name="topic" id="topic" size="20" onblur="validate2()" />&nbsp;
													* &nbsp; <span id="usermsg2"></span>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">课题类型：</td>
											<td>
												<div align="left">
													<select name="category" id="dnum">
														<option value="1" selected="selected">毕业设计</option>
														<option value="2">毕业论文</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">课题性质：</td>
											<td>
												<div align="left">
													<select name="kind" id="kind">
														<option value="1" selected="selected">工程设计</option>
														<option value="2">技术科学</option>
														<option value="3">软件研究</option>
														<option value="4">理论研究</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">课题来源：</td>
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
											<td height="20" align="right" valign="top">课题任务和要求：</td>
											<td>
												<div align="left">
													<textarea name="content" cols="60" rows="8" vaulue=""
														class="textfield" id="content" style="WIDTH: 350;">
																</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right" valign="top">成果要求：</td>
											<td>
												<div align="left">
													<textarea name="result" cols="60" rows="8" value=""
														class="textfield" id="result" style="WIDTH: 280;">
																</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right" valign="top">备注1：</td>
											<td>
												<div align="left">
													<textarea name="direction" cols="60" rows="8" value=""
														class="textfield" id="result" style="WIDTH: 280;">
																</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">指导老师：</td>
											<td>
												<div align="left">
													${u.name}
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">老师电话：</td>
											<td>
												<div align="left">
													${u.phone}
												</div>
											</td>
										</tr>
										
										<c:if test="${rindex2==1}">
											<tr>
												<td height="30" align="right">&nbsp;</td>
												<td valign="bottom">
													<div align="left">
														<input name="submitSaveEdit" type="submit" class="button" id="submitSaveEdit" value="添 加"  onclick="" style="WIDTH: 60;" />
															<input name="submitSaveEdit2" type="reset" class="button"
															id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;" />
													</div>
												</td>
											</tr>
										</c:if>
										
									</table>
								</td>
							</tr>
						</form>
					</table>
			   </c:when>
			   <c:otherwise> 
					<table width="100%" border="0" cellpadding="3" cellspacing="1"
						bgcolor="#6298E1">
						<form name="editForm" method="post" action="/work/teacher?type=2&Action=SaveEdit">
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
											<c:if test="${stu!=null}">
												<td><div align="right">选择该题的学生信息</div></td>
											</c:if>
										</tr>
										<tr>
											<td height="20" align="right">课题编号：</td>
											<td>
												<div align="left">
													<input name="number" value="${t.number}"
														readonly="readonly" />
												</div>
											</td>
											<c:if test="${stu!=null}">
												<td height="20" align="right">学号：</td>
												<td>
													<div align="left">
														${u.number}
													</div>
												</td>
											</c:if>
										</tr>
										<tr>
											<td height="20" align="right">课题名称：</td>
											<td>
												<div align="left">
													<input name="topic" id="topic" value="${t.name}"
														readonly="readonly" />
												</div>
											</td>
											<c:if test="${stu!=null}">
												<td height="20" align="right">学生姓名：</td>
											<td>
												<div align="left">
													${stu.name}
												</div>
											</td>
											</c:if>
										</tr>
										<tr>
											<td height="20" align="right">课题类型：</td>
											<td>
												<div align="left">
													<select name="category" id="dnum">
														
														<c:choose>
														   <c:when test="${t.type=='毕业设计'}">
															 <option value="毕业设计" selected='selected' >毕业设计</option>
														   </c:when>
														   <c:otherwise> 
																<option value="毕业设计" >毕业设计</option>
														   </c:otherwise>
														</c:choose>
														<c:choose>
														   <c:when test="${t.type=='毕业论文'}"> 
														   		<option value="毕业论文" selected='selected' >毕业论文</option>
														   </c:when>
														   <c:otherwise> 
																<option value="毕业论文" >毕业论文</option>
														   </c:otherwise>
														</c:choose>
													</select>
												</div>
											</td>
											<c:if test="${stu!=null}">
												<td height="20" align="right">学生性别：</td>
												<td>
													<div align="left">
														${stu.sex}
													</div>
												</td>
											</c:if>
										</tr>
										<tr>
											<td height="20" align="right">课题性质：</td>
											<td>
												<div align="left">
													<select name="kind" id="kind">
														<c:choose>
														   <c:when test="${t.kind=='工程设计'}"> 
														   		<option value="工程设计" selected='selected' >工程设计</option>
														   </c:when>
														   <c:otherwise> 
																<option value="工程设计" >工程设计</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.kind=='技术科学研究与工程技术'}"> 
														   		<option value="技术科学研究与工程技术" selected='selected' >技术科学研究与工程技术</option>
														   </c:when>
														   <c:otherwise> 
																<option value="技术科学研究与工程技术" >技术科学研究与工程技术</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.kind=='软件研究'}"> 
														   		<option value="软件研究" selected='selected' >软件研究</option>
														   </c:when>
														   <c:otherwise> 
																<option value="软件研究" >软件研究</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.kind=='理论研究'}"> 
														   		<option value="理论研究" selected='selected' >理论研究</option>
														   </c:when>
														   <c:otherwise> 
																<option value="理论研究" >理论研究</option>
														   </c:otherwise>
														</c:choose>
														
													</select>
												</div>
											</td>
											
											<c:if test="${stu!=null}">
												<td height="20" align="right">学生班级：</td>
												<td>
													<div align="left">
														${stu.sclass}
													</div>
												</td>
											</c:if>
											
										</tr>
										<tr>
											<td height="20" align="right">课题来源：</td>
											<td>
												<div align="left">
													<select name="source" id="source">
														<c:choose>
														   <c:when test="${t.source=='结合科研'}"> 
														   		<option value="结合科研" selected='selected' >结合科研</option>
														   </c:when>
														   <c:otherwise> 
																<option value="结合科研" >结合科研</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.source=='结合生产实际'}"> 
														   		<option value="结合生产实际" selected='selected' >结合生产实际</option>
														   </c:when>
														   <c:otherwise> 
																<option value="结合生产实际" >结合生产实际</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.source=='结合实验室建设'}"> 
														   		<option value="结合实验室建设" selected='selected' >结合实验室建设</option>
														   </c:when>
														   <c:otherwise> 
																<option value="结合实验室建设" >结合实验室建设</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.source=='自拟题目'}"> 
														   		<option value="自拟题目" selected='selected' >自拟题目</option>
														   </c:when>
														   <c:otherwise> 
																<option value="自拟题目" >自拟题目</option>
														   </c:otherwise>
														</c:choose>
														
													</select>
												</div>
											</td>
											
											<c:if test="${stu!=null}">
												<td height="20" align="right">学生电话：</td>
												<td>
													<div align="left">
														${stu.phone}
													</div>
												</td>
											</c:if>
											
										</tr>
										<tr>
											<td height="20" align="right" valign="top">课题任务和要求：</td>
											<td>
												<div align="left">
													<textarea name="content" cols="60" rows="8"
														vaulue="${t.content}" class="textfield" id="content"
														style="WIDTH: 350;">${t.content}
																</textarea>
												</div>
											</td>
											
											<c:if test="${stu!=null}">
												<td height="20" align="right">学生邮箱：</td>
												<td>
													<div align="left">
														${stu.email}
													</div>
												</td>
											</c:if>
											
										</tr>
										<tr>
											<td height="20" align="right" valign="top">成果要求：</td>
											<td>
												<div align="left">
													<textarea name="result" cols="60" rows="8"
														value="${t.result}" class="textfield" id="result"
														style="WIDTH: 280;">${t.result}
																</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right" valign="top">备注2：</td>
											<td>
												<div align="left">
													<textarea name="direction" cols="60" rows="8"
														value="${t.direction}" class="textfield" id="result"
														style="WIDTH: 280;">${t.direction}
																</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">指导老师：</td>
											<td>
												<div align="left">
													${u.name}
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">老师电话：</td>
											<td>
												<div align="left">
													${u.phone}
												</div>
											</td>
										</tr>
										<c:if test="${rindex3==1}">
											<tr>
												<td height="30" align="right">&nbsp;</td>
												<td valign="bottom">
													<div align="left">
														<input name="submitSaveEdit" type="submit" class="button"
															id="submitSaveEdit" value=" 修改" style="WIDTH: 60;" /> <input
															name="submitSaveEdit2" type="reset" class="button"
															id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;" />
													</div>
												</td>
											</tr>
										</c:if>
										
									</table>
								</td>
							</tr>
						</form>
					</table>
			   </c:otherwise>
			</c:choose>
		
		</td>
		</tr>
		</form>
	</center>
</body>
</html>
