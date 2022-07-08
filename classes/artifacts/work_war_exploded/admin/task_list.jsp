<%@ page pageEncoding="GBK" import="vo.*, dao.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>�����б�</title>
</head>
</html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<%
	final int PAGE_SIZE = 5; //ÿҳ��ʾ��������¼
	final int PAGES_PER_TIME = 3;//ÿ����ʾ���ٸ�ҳ������
	int pageNo = 1;
	String strPageNo = request.getParameter("pageNo");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		} 
	}
	if (pageNo <= 0)
		pageNo = 1;
%>

<%
	List<Topic> topics = new ArrayList<Topic>();
	String action = request.getParameter("action");
	int totalRecords = 1;
	if (action != null && action.trim().equals("query")) {
		totalRecords = TopicManager.query(topics, 1, 200,
				new String(request.getParameter("category").getBytes("ISO8859_1"), "GBK"),
				new String(request.getParameter("teacher").getBytes("ISO8859_1"), "GBK"),
				new String(request.getParameter("keyword").getBytes("ISO8859_1"), "GBK"),false);
	} else {
		totalRecords = TopicManager.getTopics(topics, pageNo, PAGE_SIZE,false);
	}
	int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;
	if (pageNo > totalPages)
		pageNo = totalPages;
%>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>����ѡ�⣺�鿴����ѡ�⡢����Ƿ����ظ���ѡ�⡭��</strong>
			</font></td>
		</tr>
		<tr>
			<td align="center" nowrap bgcolor="#E1E6F6">

				<form id="form1" name="form1" method="post" action="">
					<input name="action" value="query" type="hidden" /> ���ͣ� <input
						name="category" id="category" size="12" /> ��Դ�� <input
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
			<%
				for (Topic t : topics) {
			%>
			<tr bgcolor=white onmouseover="this.bgColor='f1f1f1'"
				onmouseout="this.bgColor='FFFFFF'" style='cursor: hand' title="">
				<td><%=t.getNumber()%></td>
				<td><%=t.getName()%></td>
				<td><%=t.getType()%></td>
				<td><%=t.getKind()%></td>
				<td><%=t.getSource()%></td>

				<td><%=t.getTnumber()%></td>
				<td><a href="task_add.jsp?t_num=<%=t.getNumber()%>&Result=verify"><font
						color='#330099'>�鿴����</font> </a></td>
				<%
					}
				%>
			
		</table>
		<table align="left" border="0" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tbody>
				<tr>&nbsp;
				</tr>
				<tr color="#f3f6fa">
					<td>������:&nbsp;<%=totalRecords%>&nbsp;
					</td>
					<td style="display:none;">��ǰλ��&nbsp;<%=pageNo%>/<%=totalPages%>&nbsp;
					</td>
					<td>&nbsp; <a href="/work/admin?type=3&pageNo=1"><b>|</b>&lt; </a>&nbsp;
					</td>
					<td>&nbsp; <a href="/work/admin?type=3&pageNo=<%=pageNo - 1%>">&lt;</a>&nbsp;
					</td>

					<%
						int start = ((pageNo - 1) / PAGES_PER_TIME) * PAGES_PER_TIME + 1;
						for (int i = start; i < start + PAGES_PER_TIME; i++) {
							if (i > totalPages)
								break;
							if (pageNo == i) {
					%>

					<td>&nbsp; <u><b>[<%=i%>]
						</b> </u>&nbsp;
					</td>
					<%
						} else {
					%>
					<%-- <td>&nbsp; <a href="/work/admin?type=3&pageNo=<%=i%>">[<%=i%>]
					</a>&nbsp;
					</td> --%>
					<%
						}
						}
					%>
					<td>&nbsp; <a href="/work/admin?type=3&pageNo=<%=pageNo + 1%>">&gt;</a>&nbsp;
					</td>
					<td>&nbsp; <a href="/work/admin?type=3&pageNo=<%=totalPages%>">&gt;<b>|</b>
					</a>&nbsp;
					</td>
					<td style="padding: 0px;"><input name="custompage" size="2"
						style="border: 1px solid rgb(77, 118, 179);"
						onKeyDown="javascript: if(window.event.keyCode == 13) window.location='speciality_List.jsp?pageNo='+this.value;"
						type="text"></td>
				</tr>
			</tbody>
		</table>
		<br />
	</center>
</body>
</html>

