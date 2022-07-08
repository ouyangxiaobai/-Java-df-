<%@ page pageEncoding="GBK" import="vo.*, dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>��ʦ�б�</title>
</head>
<%@ include file="check.jsp"%>
<script language=JavaScript>
function DoEmpty(id) {
	if (confirm("���Ҫɾ������Ϣ��"))
		window.location = "teacher_add.jsp?Result=delete&ID=" + id;
}
</script>

<script type="text/javascript">
			function checkDelete() {
				var ids = document.getElementsByName("id");
				if(document.formDelete.selectAll.checked) {
					for(var i=0; i<ids.length; i++) {
						ids[i].checked="checked";
					}
				} else { 
					for(var i=0; i<ids.length; i++) {
						ids[i].checked="";
					}
				}
			}
</script>

<%
	final int PAGE_SIZE = 8; //ÿҳ��ʾ��������¼
	final int PAGES_PER_TIME = 3;//ÿ����ʾ���ٸ�ҳ������
	int pageNo = 1;
	request.setCharacterEncoding("GBK");
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
	List<Teacher> teachers = new ArrayList<Teacher>();
	int totalRecords = 0;
	request.setCharacterEncoding("GBK");
	String action = null;
	int totalPages = 1;
	action = request.getParameter("action");
	if (action != null && action.trim().equals("query")) {
		totalRecords = TeacherManager.query(teachers, pageNo, 200, request.getParameter("tdept"),
				request.getParameter("tnum"), request.getParameter("tname"));
	} else if (action != null && action.trim().equals("delete")) {
		String[] idArray = request.getParameterValues("id");
		if (idArray == null || idArray.length == 0) {
			out.println("ID���������");
			return;
		} else {
			for (int i = 0; i < idArray.length; i++) {
				if (!TeacherManager.deleteByTno(idArray[i])) {
					out.println(idArray[i] + "ɾ��δ�ɹ�");
				}
			}
			out.println("ɾ���ɹ���");
			response.sendRedirect("teacher_list.jsp");
		}
	} else {
		totalRecords = TeacherManager.getTeachers(teachers, pageNo, PAGE_SIZE);
		totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;
	}
	if (pageNo > totalPages)
		pageNo = totalPages;
%>

<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black> &nbsp;<strong>��ʦ������ӣ��޸Ľ�ʦ��Ϣ</strong>
			</font></td>
		</tr>
		<tr>
			<td height="24" align="center" nowrap bgcolor="#E1E6F6">

				<form method="post" name="frm" action="">
					<input name="action" value="query" type="hidden" /> ����ϵ�� <input
						name="tdept" type="text" id="tnum" size="12" /> ��ʦ�ţ� <input
						name="tnum" type="text" id="tnum" size="12" /> ������ <input
						name="tname" type="text" id="tname" size="12" /> <input
						type="submit" name="Submit" value=" �� �� " /> <a
						href="teacher_list.jsp"
						onclick='changeAdminFlag(&quot;�鿴��ʦ�б�&quot;)'>�鿴���н�ʦ</a> | <a
						href="teacher_add.jsp?Result=Add"
						onclick='changeAdminFlag(&quot;��ӹ���Ա&quot;)'>��ӽ�ʦ</a> <font
						color="#E1E6F6">&nbsp;|&nbsp;</font>
				</form>
			</td>
		</tr>
	</table>
	<br />
	<center>
		<form action="teacher_list.jsp?action=delete" name="formDelete"
			method="post">
			<table width="100%" border="0" cellpadding="3" cellspacing="1"
				bgcolor="#E1E6F6">
				<tr>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>ѡ��</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>��ʦ��</strong>
					</font></td>
					<td nowrap bgcolor="#E1E6F6"><font color=black><strong>��ʦ��</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>�Ա�</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>ϵ�e</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>ѧ��</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>ְ��</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>���</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>�绰</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>����</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>�ֽM</strong>
					</font></td>
					<td nowrap="nowrap" bgcolor="#E1E6F6"><font color=black><strong>�ܴa</strong>
					</font></td>
					<td nowrap bgcolor="#E1E6F6"><font color=black><strong>ɾ��</strong>
					</font></td>
				</tr>
				<%
					for (Teacher t : teachers) {
				%>
				<tr bgcolor=white onmouseover="this.bgColor='f1f1f1'"
					onmouseout="this.bgColor='FFFFFF'">
					<td align="center"><input type="checkbox" name="id"
						value="<%=t.getNumber()%>" /></td>
					<td><%=t.getNumber()%></td>
					<td><%=t.getName()%></td>
					<td><%=t.getSex()%></td>
					<td><%=t.getDept()%></td>
					<td><%=t.getDegree()%></td>
					<td><%=t.getTitle()%></td>
					<td>
						<%
							if (t.getRight() == 1)
									out.print("��ͨ��ʦ");
								else
									out.print("����Ա");
						%>
					</td>
					<td><%=t.getPhone()%></td>
					<td><%=t.getEmail()%></td>
					<td><%=t.getGroup()%></td>
					<td><%=t.getPassword()%></td>
					<td align="center"><a
						href="javascript:DoEmpty('<%=t.getNumber()%>');"><font
							color='#330099'>ɾ��</font> </a></td>
				</tr>
				<%
					}
				%>
			</table>
			<table align="center" width="100%" border="0" cellpadding="3"
				cellspacing="1" bgcolor="#E1E6F6">
				<tr>
					<td align="left"><input name="selectAll" type="checkbox"
						onclick="checkDelete()" /> <input type="submit" value="Delete" />
					</td>
				</tr>
			</table>
			<table align="left" border="0" cellpadding="3" cellspacing="1"
				bgcolor="#E1E6F6">
				<tbody>
					<tr color="#f3f6fa">
						<td>������: &nbsp;<%=totalRecords%>&nbsp;
						</td>
						<td style="display:none;">&nbsp;<%=pageNo%>/<%=totalPages%>&nbsp;
						</td>
						<td>&nbsp; <a href="teacher_list.jsp?pageNo=1"><b>|</b>&lt;
						</a>&nbsp;
						</td>
						<td>&nbsp; <a href="teacher_list.jsp?pageNo=<%=pageNo - 1%>">&lt;</a>&nbsp;
						</td>

						<%
							int start = ((pageNo - 1) / PAGES_PER_TIME) * PAGES_PER_TIME + 1;
							for (int i = start; i < start + PAGES_PER_TIME; i++) {
								if (i > totalPages)
									break;
								if (pageNo == i) {
						%>

						<td style="display:none;" bgcolor=black>&nbsp; <u><b>[<%=i%>]
							</b> </u>&nbsp;
						</td>
						<%
							} else {
						%>
						<td style="display:none;">&nbsp; <a href="teacher_list.jsp?pageNo=<%=i%>">[<%=i%>]
						</a>&nbsp;
						</td>
						<%
							}
							}
						%>
						<td>&nbsp; <a href="teacher_list.jsp?pageNo=<%=pageNo + 1%>">&gt;</a>&nbsp;
						</td>
						<td>&nbsp; <a href="teacher_list.jsp?pageNo=<%=totalPages%>">&gt;<b>|</b>
						</a>&nbsp;
						</td>
						<!-- <td style="padding: 0px;"><input name="custompage" size="2"
							style="border: 1px solid rgb(77, 118, 179);"
							onKeyDown="javascript: if(window.event.keyCode == 13) window.location='teacher_list.jsp?pageNo='+this.value;"
							type="text"></td> -->
					</tr>
				</tbody>
			</table>
		</form>
	</center>
</body>
</html>
