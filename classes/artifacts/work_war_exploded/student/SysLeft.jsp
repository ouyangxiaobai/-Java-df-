<%@page pageEncoding="GBK"%>
<%@include file="check.jsp"%>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<TITLE>��ҵ���ѡ��ϵͳ</TITLE>
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>
<script>
	function closewin() {
		if (opener != null && !opener.closed) {
			opener.window.newwin = null;
			opener.openbutton.disabled = false;
			opener.closebutton.disabled = true;
		}
	}

	var count = 0;//�������� 
	var limit = new Array();//���ڼ�¼��ǰ��ʾ���ļ����˵�
	var countlimit = 1;//ͬʱ�򿪲˵���Ŀ�����Զ���

	function expandIt(el) {
		obj = eval("sub" + el);
		if (obj.style.display == "none") {
			obj.style.display = "block";//��ʾ�Ӳ˵�
			if (count < countlimit) {//����2��
				limit[count] = el;//¼������
				count++;
			} else {
				eval("sub" + limit[0]).style.display = "none";
				for (i = 0; i < limit.length - 1; i++) {
					limit[i] = limit[i + 1];
				}//����ȥ��ͷһλ���������ǰŲһλ
				limit[limit.length - 1] = el;
			}
		} else {
			obj.style.display = "none";
			var j;
			for (i = 0; i < limit.length; i++) {
				if (limit[i] == el)
					j = i;
			}//��ȡ��ǰ����Ĳ˵���limit�����е�λ��
			for (i = j; i < limit.length - 1; i++) {
				limit[i] = limit[i + 1];
			}//j�Ժ������ȫ����ǰŲһλ
			limit[limit.length - 1] = null;//ɾ���������һλ
			count--;
		}
	}
</script>
</head>

<BODY>
	<table width="167" height="26" border="0" cellpadding="0"
		cellspacing="0" bgcolor="#E1E6F6">
		<tr style="cursor: hand;">
			<td style="height: 41px;"><a href="SysCome.jsp"
				target="mainFrame" onClick='changeAdminFlag("���غ�̨��ҳ")'><font
					size=4 color=black>ϵͳ������ </a></td>
		</tr>
		</br>
	</table>
	<div id="main9" onclick=expandIt(9)>
		<table width="167" height="26" border="0" cellpadding="0"
			cellspacing="0" bgcolor="#E1E6F6">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 52px;"><font size=3
					color=black>��������</td>
			</tr>
		</table>
	</div>
	<div id="sub9" style="display: none">
		<table width="160" border="0" cellspacing="0" cellpadding="0"
			bgcolor="#E1E6F6">
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft" style="height: 39px;"><a
					href="student_add.jsp" target="mainFrame"
					onClick='changeAdminFlag("�޸�����")'><font size=2 color=black>�޸�����</a>
				</td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft" style="height: 36px;"><a
					href="task_mysel.jsp" target="mainFrame"
					onClick='changeAdminFlag("�ҵ�ѡ��")'><font size=2 color=black>�ҵ�ѡ��</a>
				</td>
		</table>
	</div>
	<div id="main8" onclick=expandIt(8)>
		<table bgcolor="#E1E6F6" width="167" height="26" border="0"
			cellpadding="0" cellspacing="0">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 58px;"><font size=3
					color=black>��ʼѡ��</td>
			</tr>
		</table>
	</div>
	<div id="sub8" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft" style="height: 43px;"><a
					href="/work/student?type=3" target="mainFrame"
					onClick='changeAdminFlag("�����б�")'><font size=2 color=black>����ѡ���б�</a>
				</td>
			</tr>
		</table>
	</div>

	<table bgcolor="#E1E6F6" width="167" height="26" border="0"
		cellpadding="0" cellspacing="0" style="height: 80px;">
		<tr style="cursor: hand;">
			<td width="26"></td>
			<td class="SystemLeft" style="height: 38px;"><a
				href="SysCome.jsp" target="mainFrame"
				onClick='changeAdminFlag("��̨��ҳ")'><font size=3 color=black>������ҳ</a>
			</td>
		</tr>
	</table>
	<table bgcolor="#E1E6F6" width="167" height="26" border="0"
		cellpadding="0" cellspacing="0">
		<tr style="cursor: hand;">
			<td width="26"></td>
			<td class="SystemLeft" style="height: 55px;"><a
				href="../index.jsp" target="_parent"><font size=3 color=black>�˳���¼</a>
			</td>
		</tr>
	</table>
	<table bgcolor="#E1E6F6" width="167" border="0" cellpadding="1"
		cellspacing="2" bgcolor="#E1E6F6">
		<tr align="center" bgcolor="#E1E6F6">
			<td height=25 colspan=2 class="topbg" style="height: 45px;"><font
				color="ffffff"><font size=3 color=black></br>
					</br>
					</br>��ҵ���ѡ��ϵͳ��ѧ����</font>
					<tr bgcolor="#E1E6F6">
						<td colspan="2" class="tdbg"><div align="center"
								style="height: 30px;"></div></td>
					</tr>

					<tr bgcolor="#E1E6F6">
						<td height=25 colspan="2" class="tdbg"><div align="center">
								<font color="ffffff"><font size=3 color=black></br>
									</br>
									</br>
									</br>
									</br>
									</br>��ǰ�û���<strong><%=student.getName()%></strong> </font>
							</div></td>
					</tr>
	</table>
</BODY>
</HTML>