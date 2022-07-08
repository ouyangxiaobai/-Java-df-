<%@ page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link rel="stylesheet" href="../js/CssAdmin.css"></link>
	<title>课题列表</title>
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>所有选题：查看所有选题、检查是否有重复的选题……</strong>
			</font></td>
		</tr>
		<tr>
			<td align="center" nowrap bgcolor="#E1E6F6">

				<form id="form1" name="form1" method="post" action="/work/student?type=3">
					<input name="action" value="query" type="hidden" /> 课题类型： <input
						name="category" id="category" size="12" /> 课题性质： <input
						name="teacher" id="teacher" size="12" /> 课题名称： <input
						name="keyword" type="text" id="keyword" size="12" /> <input
						type="submit" name="Submit" value=" 检 索 " />
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
					color=black><strong>题目编号</strong> </font></td>
				<td width="15%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目名称</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目类型</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目性质</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>题目来源</strong> </font></td>

				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>指导老师</strong> </font></td>
				<td width="12%" nowrap="nowrap" bgcolor="#E1E6F6"><font
					color=black><strong>详情</strong> </font></td>
			</tr>
			
			<c:forEach items="${listtopics}" var="t">
				<tr bgcolor=white onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'" style='cursor: hand' title="">
					<td>${t.number}</td>
					<td>${t.name}</td>
					<td>${t.type}</td>
					<td>${t.kind}</td>
					<td>${t.source}</td>
					<td>${t.tnumber}</td>
					<td><a href="/work/teacher?type=2&Result=Modify&t_num=${t.getNumber()}"><font color='#330099'>查看详情</font> </a></td>
				</tr>
			</c:forEach>
			
		</table>
		<table align="left" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tbody>
				<tr><&nbsp;</tr>
				<tr color="#f3f6fa">
					<td>总条数:&nbsp;${totalRecords}&nbsp;
					</td>
					<td style="display:none;">当前位于第&nbsp;${pageNo}/${totalPages}&nbsp;页
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

