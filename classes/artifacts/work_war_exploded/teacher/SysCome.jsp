 <%@page pageEncoding="GBK"%>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<TITLE>毕业设计选题系统</TITLE>
<link rel="stylesheet" href="../js/CssAdmin.css">

<style type="text/css">
<!--
.style2 {
	color: #FFFFFF
}

.STYLE3 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<%@ include file="check.jsp"%>

<BODY>
	<div align="center">
		<table width="100%" border="1" align=center cellpadding="2"
			cellspacing="1" bgcolor="#E1E6F6" class="border">
			<tr align="center">
				<td height=25 class="style2"><div align="left">
						<span class="STYLE3 style2"><font size=3 color=black><%=teacher.getName()%></span><font
							size=3 color=black>您好,欢迎使用毕业设计选题系统！ 教师操作流程如下：
					</div>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding="3" cellspacing="1"
			bgcolor="#E1E6F6">
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>操作
					</div></td>
				<td style="height: 34px;"><div align="center">
						<font size=3 color=black>说明
					</div></td>
				<td><div align="center">
						<font size=3 color=black>备注
					</div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>修改资料
					</div></td>
				<td style="height: 36px;"><font size=3 color=black>进入个人中心，修改个人资料（<span
						class="STYLE3"><font size=3 color=black>请认真填写</span>）。</td>
				<td><div align="center"></div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>↓
					</div></td>
				<td style="height: 34px;">&nbsp;</td>
				<td><div align="center"></div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>选题维护
					</div></td>
				<td style="height: 35px;"><font size=3 color=black>添加、修改自己的选题。</td>
				<td><div align="center">
						<font size=3 color=black>限时完成
					</div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>↓
					</div></td>
				<td style="height: 37px;">&nbsp;</td>
				<td><div align="center"></div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>学生选题情况
					</div></td>
				<td style="height: 34px;"><font size=3 color=black>查看选择自己课题的学生，与学生取得联系，确定选题学生及选题。</td>
				<td><div align="center">
						<font size=3 color=black>限时完成
					</div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>↓
					</div></td>
				<td style="height: 37px;">&nbsp;</td>
				<td><div align="center"></div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>课题设计
					</div></td>
				<td style="height: 38px;"><font size=3 color=black>指导学生完成毕业设计的制作工作……</td>
				<td><div align="center"></div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center">
						<font size=3 color=black>↓
					</div></td>
				<td style="height: 36px;">&nbsp;</td>
				<td><div align="center"></div></td>
			</tr>
			<tr bgcolor="#E1E6F6" onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td><div align="center"></div></td>
				<td style="height: 144px;"><div align="center" class="STYLE4"></div>
					<div align="center"></div>
					<div align="center"></div>
					<div align="center" style="height: 24px;"></div></td>
				<td><div align="center"></div></td>
			</tr>

		</table>
		<table width="100%" border="1" align=center cellpadding="2"
			cellspacing="1" bgcolor="#E1E6F6" class="border">
			<tr align="center">
				<td height=15 class="topbg">
			</tr>
		</table>
	</div>
</BODY>
</HTML>