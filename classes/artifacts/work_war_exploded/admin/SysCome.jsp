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
							size=3 color=black>����,��ӭʹ�ñ�ҵ����ѡ��ϵͳ�� ����Ա�����������£� 
					</div>
			</tr>
		</table>
		<table bgcolor="#E1E6F6" width="100%" border="1" cellpadding="3"
			cellspacing="1">
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>����
					</div>
				</td>
				<td>
					<div align="center">
						<font size=3 color=black>����
					</div>
				</td>
				<td>
					<div align="center">
						<font size=3 color=black>��ע
					</div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>ϵԺ��רҵ����
					</div>
				</td>
				<td style="height: 48px;"><font size=3 color=black>���ϵ��רҵ�����Ϣ��һ������벻Ҫ���׸Ķ���</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>��
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
						<font size=3 color=black>����û�
					</div>
				</td>
				<td style="height: 49px;"><font size=3 color=black>��ӽ�ʦ��ѧ��������Ա��Ϣ��</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>��
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
						<font size=3 color=black>ѡ�����
					</div>
				</td>
				<td style="height: 48px;"><font size=3 color=black>����Ա��¼��̨���ѡ�⡣</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>��
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
						<font size=3 color=black>ѧ��ѡ��
					</div>
				</td>
				<td style="height: 49px;"><font size=3 color=black>֪ͨѧ����¼ϵͳ����ѡ�⡭��</td>
				<td>
					<div align="center">
						<font size=3 color=black>��ʱ���
					</div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>��
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
						<font size=3 color=black>��ʼ����
					</div>
				</td>
				<td style="height: 50px;"><font size=3 color=black>ѧ��ȷ��ѡ����ָ����ʦ��ϵ��������ʦ��ָ���¿�չ����������������</td>
				<td>
					<div align="center"></div>
				</td>
			</tr>
			<tr onMouseOver="this.bgColor='#E1E6F6'"
				onMouseOut="this.bgColor='#E1E6F6'">
				<td>
					<div align="center">
						<font size=3 color=black>��
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