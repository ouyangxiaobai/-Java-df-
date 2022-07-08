<%@page language="java" pageEncoding="GBK"%>
<HTML>

<link rel="stylesheet" href="../js/CssAdmin.css">
<style type="text/css">
<!--
.style2 {
	color: #FFFFFF
}

.STYLE3 {
	color: #000000;
	font-weight: bold;
}
-->
</style>

<%@ include file="check.jsp"%>
</head>

<BODY bgcolor="#E1E6F6">
	<div align="center" bgcolor="#E1E6F6">
		<table bgcolor="#E1E6F6" width="100%" border="1" align=center
			cellpadding="2" cellspacing="1" class="border">
			<tr align="center">
				<td height=25 class="style2">
					<div align="left">
						<span class="STYLE3 style2"><font size=3 color=black><%=teacher.getName()%></span><font
							size=3 color=black>您好,欢迎使用毕业论文选题系统！ 管理员操作流程如下： 
					</div>
			</tr>
		</table>
		<table bgcolor="#E1E6F6" width="100%" border="1" cellpadding="3"
			cellspacing="1">
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>操作
					</div>
				</td>
				<td>
					<div align="center">
						<font size=3 color=black>内容
					</div>
				</td>
				<td>
					<div align="center">
						<font size=3 color=black>备注
					</div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>系院、专业设置
					</div>
				</td>
				<td style="height: 48px;"><font size=3 color=black>添加系别、专业相关信息，一旦添加请不要轻易改动！</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>↓
					</div>
				</td>
				<td>&nbsp;</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>添加用户
					</div>
				</td>
				<td style="height: 49px;"><font size=3 color=black>添加教师、学生、管理员信息。</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>↓
					</div>
				</td>
				<td>&nbsp;</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>

			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>选题审核
					</div>
				</td>
				<td style="height: 48px;"><font size=3 color=black>管理员登录后台审核选题。</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>↓
					</div>
				</td>
				<td>&nbsp;</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>学生选题
					</div>
				</td>
				<td style="height: 49px;"><font size=3 color=black>通知学生登录系统进行选题……</td>
				<td>
					<div align="center">
						<font size=3 color=black>限时完成
					</div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>↓
					</div>
				</td>
				<td>&nbsp;</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>开始制作
					</div>
				</td>
				<td style="height: 50px;"><font size=3 color=black>学生确定选题后跟指导老师联系，并在老师的指导下开展课题制作工作……</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>↓
					</div>
				</td>
				<td>&nbsp;</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<!-- <tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#635836'">
				<td><div align="center" style="height: 56px;"></div></td>
				<td style="height: 190px;"><div align="center"></div></td>
				<td><div align="center"></div></td>
			</tr> -->
		</table>
		<table width="100%" border="0" align=center cellpadding="2"
			cellspacing="1" class="border" bgcolor="#E1E6F6">
			<tr align="center">
				<td height=5 class="topbg">
			</tr>
		</table>
	</div>
</BODY>
</HTML>