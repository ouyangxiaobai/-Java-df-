<%@ page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../js/CssAdmin.css"></link>
	<title>�����б�</title>
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>����ѡ�⣺�鿴����ѡ�⡢����Ƿ����ظ���ѡ�⡭��</strong>
			</font></td>
		</tr>
		<tr>
			<td align="center" nowrap bgcolor="#E1E6F6">

				<form id="form1" name="form1" method="post" action="/work/student?type=3">
					<input name="action" value="query" type="hidden" /> �������ͣ� <input
						name="category" id="category" size="12" /> �������ʣ� <input
						name="teacher" id="teacher" size="12" /> �������ƣ� <input
						name="keyword" type="text" id="keyword" size="12" /> <input
						type="submit" name="Submit" value=" �� �� " />
				</form> 
			</td>
		</tr>
	</table>
	<br />
	<center>
		<table width="100%" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tr>
				<td width="15%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ���</strong> </font></td>
				<td width="15%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ����</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ����</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ����</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>��Ŀ��Դ</strong> </font></td>

				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>ָ����ʦ</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>����</strong> </font></td>
			</tr>
			
			<c:forEach items="${listtopics}" var="t">
				<tr bgcolor=white onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'" style='cursor: hand' title="">
					<td>${t.number}</td>
					<td>${t.name}</td>
					<td>${t.type}</td>
					<td>${t.kind}</td>
					<td>${t.source}</td>
					<td>${t.tnumber}</td>
					<td><a href="/work/teacher?type=2&Result=Modify&t_num=${t.getNumber()}"><font color='#330099'>�鿴����</font> </a></td>
				</tr>
			</c:forEach>
			
		</table>
		<table align="left" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tbody>
				<tr><&nbsp;</tr>
				<tr color="#f3f6fa">
					<td>������:&nbsp;${totalRecords}&nbsp;
					</td>
					<td style="display:none;">��ǰλ�ڵ�&nbsp;${pageNo}/${totalPages}&nbsp;ҳ
					</td>
					<td>&nbsp; <a href="task_list.jsp?pageNo=1"><b>|</b>&lt; </a>&nbsp;
					</td>
					<td>&nbsp; <a href="task_list.jsp?pageNo=${pageNo-1}">&lt;</a>&nbsp;
					</td>
					
					<%-- <c:choose>
					   <c:when test="${i2==0}">
						   <td>&nbsp; <u><b>[${i}]
								</b> </u>&nbsp;
							</td>
					   </c:when>
					   <c:otherwise> 
							<td>&nbsp; <a href="task_list.jsp?pageNo=${i}">[${i}]
							</a>&nbsp;
							</td>
					   </c:otherwise>
					</c:choose> --%>

					<td>&nbsp; <a href="task_list.jsp?pageNo=${pageNo + 1}">&gt;</a>&nbsp;
					</td>
					<td>&nbsp; <a href="task_list.jsp?pageNo=${totalPages}">&gt;<b>|</b>
					</a>&nbsp;
					</td>
					<!-- <td style="padding: 0px;"><input name="custompage" size="2"
						style="border: 1px solid rgb(77, 118, 179);"
						onKeyDown="javascript: if(window.event.keyCode == 13) window.location='speciality_List.jsp?pageNo='+this.value;"
						type="text"/></td> -->
				</tr>
			</tbody>
		</table>
		<br />
	</center>
</body>
</html>

