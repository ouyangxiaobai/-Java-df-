<%@page pageEncoding="GBK" import="vo.*, dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>��ع��ܵĿ����</title>
</head>
<%
	String teacher = MsgManager.getTexts("��ʦ��ع���");
	String student = MsgManager.getTexts("ѧ����ع���");
	/* if (teacher != null) {
		out.println("��ʦ��ع����ѿ��������ȹرս�ʦ���ܣ�");
		return;
	} */
%>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black><strong>ϵͳά������ع��ܵĿ��ͱ�</strong>
			</font></td>
		</tr>
	</table>
	<%
		String action = request.getParameter("Action");
		if (action != null && action.trim().equals("delete")) {
			if (MsgManager.delete("ѧ����ع���")) {
				out.println("ѧ�����ܹرճɹ���");
				return;
			} else {
				out.println("ѧ�����ܹر�δ�ɹ���");
				return;
			}
		}
		if (student != null) {
			out.println("ѧ����ع����Ѿ�������Ҫ�ر�ѧ���������������ɫ���壡<br><br>");
			out.println(
					"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='control_student.jsp?Action=delete' style='color:red; font-size: 24px; text-decoration: underline;'>�ر�ѧ������</a>");
			return;
		}
		if (action != null && action.trim().equals("addnew")) {
			String title = new String(request.getParameter("title").getBytes("ISO8859_1"), "GBK");
			String text = new String(request.getParameter("content").getBytes("ISO8859_1"), "GBK");
			Msg msg = new Msg();
			msg.setText(text);
			msg.setTitle(title);
			if (MsgManager.insert(msg)) {
				out.println(title + "�����ɹ���");
				out.println(msg.getText());
				return;
			} else {
				out.println(title + "����δ�ɹ�");
				return;
			}
		}
	%>
	<br />

	<table width="100%" border="0" cellpadding="3" cellspacing="2"
		bgcolor="#E1E6F6">
		<form name="frm" method="post" action="?Action=addnew">
			<tr>
				<td height="24" nowrap bgcolor="#E1E6F6"><table width="100%"
						border="0" cellpadding="0" cellspacing="0" id=editProduct>
						<tr>
							<td width="120" height="20" align="right">&nbsp;</td>
							<td><div align="center">Ҫ����ѧ����ع��ܵ��������ύ��ť���ɣ��������ݿ����޸ģ����ⲻ���޸ģ�</div>
							</td>
						</tr>
						<tr>
							<td height="20" align="right">���⣺</td>
							<td><div align="left">
									<input name="title" id="title" readonly="readonly"
										value="ѧ����ع���" />
								</div></td>
							<tr>
								<td height="20" align="right" valign="top">�������ݣ�</td>
								<td><div align="left">
										<textarea name="content" cols="60" rows="8" class="textfield"
											id="content" style="WIDTH: 580;">���λѧ����¼ϵͳ�����Լ�ѡ��һ�����⣡</textarea>
									</div></td>
							</tr>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom"><div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
											id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;" />
									</div></td>
							</tr>
							<tr>
								<td height="20" align="right">&nbsp;</td>
								<td valign="bottom"><div align="left"></div></td>
							</tr>
					</table></td>
			</tr>
		</form>
	</table>
</body>
</html>
