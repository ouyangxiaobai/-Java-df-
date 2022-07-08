<%@page pageEncoding="GBK" import="vo.*, dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
	<title>相关功能的开与闭</title>
</head>
<%
	String teacher = MsgManager.getTexts("教师相关功能");
	String student = MsgManager.getTexts("学生相关功能");
	/* if (teacher != null) {
		out.println("教师相关功能已开启！请先关闭教师功能！");
		return;
	} */
%>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		bgcolor="#E1E6F6">
		<tr>
			<td height="24" nowrap><font color=black><strong>系统维护：相关功能的开和闭</strong>
			</font></td>
		</tr>
	</table>
	<%
		String action = request.getParameter("Action");
		if (action != null && action.trim().equals("delete")) {
			if (MsgManager.delete("学生相关功能")) {
				out.println("学生功能关闭成功！");
				return;
			} else {
				out.println("学生功能关闭未成功！");
				return;
			}
		}
		if (student != null) {
			out.println("学生相关功能已经开启！要关闭学生功能请点击下面红色字体！<br><br>");
			out.println(
					"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='control_student.jsp?Action=delete' style='color:red; font-size: 24px; text-decoration: underline;'>关闭学生功能</a>");
			return;
		}
		if (action != null && action.trim().equals("addnew")) {
			String title = new String(request.getParameter("title").getBytes("ISO8859_1"), "GBK");
			String text = new String(request.getParameter("content").getBytes("ISO8859_1"), "GBK");
			Msg msg = new Msg();
			msg.setText(text);
			msg.setTitle(title);
			if (MsgManager.insert(msg)) {
				out.println(title + "开启成功！");
				out.println(msg.getText());
				return;
			} else {
				out.println(title + "开启未成功");
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
							<td><div align="center">要开启学生相关功能点击下面的提交按钮即可！公告内容可以修改，标题不可修改！</div>
							</td>
						</tr>
						<tr>
							<td height="20" align="right">标题：</td>
							<td><div align="left">
									<input name="title" id="title" readonly="readonly"
										value="学生相关功能" />
								</div></td>
							<tr>
								<td height="20" align="right" valign="top">公告内容：</td>
								<td><div align="left">
										<textarea name="content" cols="60" rows="8" class="textfield"
											id="content" style="WIDTH: 580;">请各位学生登录系统，给自己选择一个课题！</textarea>
									</div></td>
							</tr>
							<tr>
								<td height="30" align="right">&nbsp;</td>
								<td valign="bottom"><div align="left">
										<input name="submitSaveEdit" type="submit" class="button"
											id="submitSaveEdit3" value=" 提 交 " style="WIDTH: 60;" />
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
