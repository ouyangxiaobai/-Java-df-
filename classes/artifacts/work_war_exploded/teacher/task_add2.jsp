<%@page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="check.jsp"%>
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
		var idField = "${u.number}";
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
				href="/work/teacher?type=3" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���п���</a> <a
				href="/work/teacher?type=1&t_num=${u.number}"
				onClick='changeAdminFlag("ϵͳ����Ա")'>�ҵ�ѡ���б�</a></td>
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
											<td height="20" align="right">�����ţ�</td>
											<td>
												<div align="left">
													<input name="number" id="number" onblur="validate()" />
													&nbsp;* &nbsp; <span id="usermsg"></span>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">�������ƣ�</td>
											<td>
												<div align="left">
													<input name="topic" id="topic" size="20" onblur="validate2()" />&nbsp;
													* &nbsp; <span id="usermsg2"></span>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">�������ͣ�</td>
											<td>
												<div align="left">
													<select name="category" id="dnum">
														<option value="1" selected="selected">��ҵ���</option>
														<option value="2">��ҵ����</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">�������ʣ�</td>
											<td>
												<div align="left">
													<select name="kind" id="kind">
														<option value="1" selected="selected">�������</option>
														<option value="2">������ѧ</option>
														<option value="3">����о�</option>
														<option value="4">�����о�</option>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">������Դ��</td>
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
											<td height="20" align="right" valign="top">���������Ҫ��</td>
											<td>
												<div align="left">
													<textarea name="content" cols="60" rows="8" vaulue=""
														class="textfield" id="content" style="WIDTH: 350;">
																</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right" valign="top">�ɹ�Ҫ��</td>
											<td>
												<div align="left">
													<textarea name="result" cols="60" rows="8" value=""
														class="textfield" id="result" style="WIDTH: 280;">
																</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right" valign="top">��ע1��</td>
											<td>
												<div align="left">
													<textarea name="direction" cols="60" rows="8" value=""
														class="textfield" id="result" style="WIDTH: 280;">
																</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">ָ����ʦ��</td>
											<td>
												<div align="left">
													${u.name}
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">��ʦ�绰��</td>
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
														<input name="submitSaveEdit" type="submit" class="button" id="submitSaveEdit" value="�� ��"  onclick="" style="WIDTH: 60;" />
															<input name="submitSaveEdit2" type="reset" class="button"
															id="submitSaveEdit2" value=" �� �� " style="WIDTH: 60;" />
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
												<td><div align="right">ѡ������ѧ����Ϣ</div></td>
											</c:if>
										</tr>
										<tr>
											<td height="20" align="right">�����ţ�</td>
											<td>
												<div align="left">
													<input name="number" value="${t.number}"
														readonly="readonly" />
												</div>
											</td>
											<c:if test="${stu!=null}">
												<td height="20" align="right">ѧ�ţ�</td>
												<td>
													<div align="left">
														${u.number}
													</div>
												</td>
											</c:if>
										</tr>
										<tr>
											<td height="20" align="right">�������ƣ�</td>
											<td>
												<div align="left">
													<input name="topic" id="topic" value="${t.name}"
														readonly="readonly" />
												</div>
											</td>
											<c:if test="${stu!=null}">
												<td height="20" align="right">ѧ��������</td>
											<td>
												<div align="left">
													${stu.name}
												</div>
											</td>
											</c:if>
										</tr>
										<tr>
											<td height="20" align="right">�������ͣ�</td>
											<td>
												<div align="left">
													<select name="category" id="dnum">
														
														<c:choose>
														   <c:when test="${t.type=='��ҵ���'}">
															 <option value="��ҵ���" selected='selected' >��ҵ���</option>
														   </c:when>
														   <c:otherwise> 
																<option value="��ҵ���" >��ҵ���</option>
														   </c:otherwise>
														</c:choose>
														<c:choose>
														   <c:when test="${t.type=='��ҵ����'}"> 
														   		<option value="��ҵ����" selected='selected' >��ҵ����</option>
														   </c:when>
														   <c:otherwise> 
																<option value="��ҵ����" >��ҵ����</option>
														   </c:otherwise>
														</c:choose>
													</select>
												</div>
											</td>
											<c:if test="${stu!=null}">
												<td height="20" align="right">ѧ���Ա�</td>
												<td>
													<div align="left">
														${stu.sex}
													</div>
												</td>
											</c:if>
										</tr>
										<tr>
											<td height="20" align="right">�������ʣ�</td>
											<td>
												<div align="left">
													<select name="kind" id="kind">
														<c:choose>
														   <c:when test="${t.kind=='�������'}"> 
														   		<option value="�������" selected='selected' >�������</option>
														   </c:when>
														   <c:otherwise> 
																<option value="�������" >�������</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.kind=='������ѧ�о��빤�̼���'}"> 
														   		<option value="������ѧ�о��빤�̼���" selected='selected' >������ѧ�о��빤�̼���</option>
														   </c:when>
														   <c:otherwise> 
																<option value="������ѧ�о��빤�̼���" >������ѧ�о��빤�̼���</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.kind=='����о�'}"> 
														   		<option value="����о�" selected='selected' >����о�</option>
														   </c:when>
														   <c:otherwise> 
																<option value="����о�" >����о�</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.kind=='�����о�'}"> 
														   		<option value="�����о�" selected='selected' >�����о�</option>
														   </c:when>
														   <c:otherwise> 
																<option value="�����о�" >�����о�</option>
														   </c:otherwise>
														</c:choose>
														
													</select>
												</div>
											</td>
											
											<c:if test="${stu!=null}">
												<td height="20" align="right">ѧ���༶��</td>
												<td>
													<div align="left">
														${stu.sclass}
													</div>
												</td>
											</c:if>
											
										</tr>
										<tr>
											<td height="20" align="right">������Դ��</td>
											<td>
												<div align="left">
													<select name="source" id="source">
														<c:choose>
														   <c:when test="${t.source=='��Ͽ���'}"> 
														   		<option value="��Ͽ���" selected='selected' >��Ͽ���</option>
														   </c:when>
														   <c:otherwise> 
																<option value="��Ͽ���" >��Ͽ���</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.source=='�������ʵ��'}"> 
														   		<option value="�������ʵ��" selected='selected' >�������ʵ��</option>
														   </c:when>
														   <c:otherwise> 
																<option value="�������ʵ��" >�������ʵ��</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.source=='���ʵ���ҽ���'}"> 
														   		<option value="���ʵ���ҽ���" selected='selected' >���ʵ���ҽ���</option>
														   </c:when>
														   <c:otherwise> 
																<option value="���ʵ���ҽ���" >���ʵ���ҽ���</option>
														   </c:otherwise>
														</c:choose>
														
														<c:choose>
														   <c:when test="${t.source=='������Ŀ'}"> 
														   		<option value="������Ŀ" selected='selected' >������Ŀ</option>
														   </c:when>
														   <c:otherwise> 
																<option value="������Ŀ" >������Ŀ</option>
														   </c:otherwise>
														</c:choose>
														
													</select>
												</div>
											</td>
											
											<c:if test="${stu!=null}">
												<td height="20" align="right">ѧ���绰��</td>
												<td>
													<div align="left">
														${stu.phone}
													</div>
												</td>
											</c:if>
											
										</tr>
										<tr>
											<td height="20" align="right" valign="top">���������Ҫ��</td>
											<td>
												<div align="left">
													<textarea name="content" cols="60" rows="8"
														vaulue="${t.content}" class="textfield" id="content"
														style="WIDTH: 350;">${t.content}
																</textarea>
												</div>
											</td>
											
											<c:if test="${stu!=null}">
												<td height="20" align="right">ѧ�����䣺</td>
												<td>
													<div align="left">
														${stu.email}
													</div>
												</td>
											</c:if>
											
										</tr>
										<tr>
											<td height="20" align="right" valign="top">�ɹ�Ҫ��</td>
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
											<td height="20" align="right" valign="top">��ע2��</td>
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
											<td height="20" align="right">ָ����ʦ��</td>
											<td>
												<div align="left">
													${u.name}
												</div>
											</td>
										</tr>
										<tr>
											<td height="20" align="right">��ʦ�绰��</td>
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
															id="submitSaveEdit" value=" �޸�" style="WIDTH: 60;" /> <input
															name="submitSaveEdit2" type="reset" class="button"
															id="submitSaveEdit2" value=" �� �� " style="WIDTH: 60;" />
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
