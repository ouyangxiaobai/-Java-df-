<%@page pageEncoding="GBK"%>
<HTML>
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js">
</script>
<head>
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
<%@ include file="check.jsp"%>

<BODY bgcolor="#E1E6F6" background=""
	onmouseover="self.status='��ҵ����ѡ��ϵͳ!';return true">
	<table bgcolor="#E1E6F6" width="167" height="26" border="0"
		cellpadding="0" cellspacing="0">
		<tr style="cursor: hand;">
			<td><a href="SysCome.jsp" target="mainFrame"><font size=4
					color=black>ϵͳ������</font> </a></td>
		</tr>
		</br>
	</table>
	<div id="main3" onclick=expandIt(3)>
		<table bgcolor="#E1E6F6" width="167" height="26" border="0"
			cellpadding="0" cellspacing="0" style="height: 52px;">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 35px;"><font size=3
					color=black>ѧ������ </td>
			</tr>
		</table>
	</div>
	<div id="sub3" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="student_list.jsp"
					target="mainFrame" onClick='changeAdminFlag("ѧ���б�")'><font
						size=2 color=black>�鿴����</a></td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="student_add.jsp?Result=Add"
					target="mainFrame" onClick='changeAdminFlag("���ѧ��")'><font
						size=2 color=black>���ѧ��</a></td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="student_Padd.jsp"
					target="mainFrame" onClick='changeAdminFlag("��������ѧ����Ϣ")'><font
						size=2 color=black>��������ѧ����Ϣ</a></td>
			</tr>
		</table>
	</div>

	<div id="main2" onclick=expandIt(2)>
		<table bgcolor="#E1E6F6" width="167" height="26" border="0"
			cellpadding="0" cellspacing="0" style="height: 54px;">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft"><font size=3 color=black>��ʦ���� </td>
			</tr>
		</table>
	</div>
	<div id="sub2" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="teacher_list.jsp"
					target="mainFrame" onClick='changeAdminFlag("��ʦ�б�")'><font
						size=2 color=black>�鿴����</a></td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="teacher_add.jsp?Result=Add"
					target="mainFrame" onClick='changeAdminFlag("��ӽ�ʦ")'><font
						size=2 color=black>��ӽ�ʦ</a></td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="teacher_Padd.jsp"
					target="mainFrame" onClick='changeAdminFlag("���������ʦ��Ϣ")'><font
						size=2 color=black>���������ʦ��Ϣ</a></td>
			</tr>
		</table>
	</div>

	<div id="main4" onclick=expandIt(4)>
		<table bgcolor="#E1E6F6" width="167" height="26" border="0"
			cellpadding="0" cellspacing="0" style="height: 56px;">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 34px;"><font size=3
					color=black>������� </td>
			</tr>
		</table>
	</div>
	<div id="sub4" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="/work/admin?type=3"
					target="mainFrame" onClick='changeAdminFlag("�����б�")'><font
						size=2 color=black>�����ѯ</a></td>
			</tr>


		</table>
	</div>

	<div id="main12" onclick=expandIt(12)>
		<table bgcolor="#E1E6F6" width="167" height="24" border="0"
			cellpadding="0" cellspacing="0">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 40px;"><font size=3
					color=black>ϵͳά�� </td>
			</tr>
		</table>
	</div>
	<div id="sub12" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">


			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="control_teacher.jsp"
					target="mainFrame"><font size=2 color=black>��ʦ���ܿ�/��</a>
				</td>
			</tr>
			<tr> 
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="control_student.jsp"
					target="mainFrame"><font size=2 color=black>ѧ�����ܿ�/��</a>
				</td> 
			</tr>
		</table>
	</div>
	<table bgcolor="#E1E6F6" width="167" height="26" border="0"
		cellpadding="0" cellspacing="0">
		<tr style="cursor: hand;">
			<td width="26"></td>
			<td class="SystemLeft" style="height: 51px;"><a
				href="SysCome.jsp" target="mainFrame"
				onClick='changeAdminFlag("��̨��ҳ")'><font size=3 color=black>��̨��ҳ</a>
			</td>
		</tr>
	</table>
	<table bgcolor="#E1E6F6" width="167" height="26" border="0"
		cellpadding="0" cellspacing="0" style="height: 67px;">
		<tr style="cursor: hand;">
			<td width="26"></td>
			<td class="SystemLeft" style="height: 38px;"><a
				href="../index.jsp" target="_parent"><font size=3 color=black>�˳���¼</a>
			</td>
		</tr>
	</table>
	<table bgcolor="#E1E6F6" width="167" border="0" cellpadding="1"
		cellspacing="2">
		<tr align="center">
			<td height=25 colspan=2 class="topbg" style="height: 72px;"><span
				class="Glow"><font color="ffffff"><font size=3
						color=black></br>��ҵ���ѡ��ϵͳ������Ա��</font></span>
		<tr>
			<td colspan="2" class="tdbg" style="height: 62px;">
				<div align="center" style="height: 30px;"></div>
			</td>
		</tr>

		<tr>
			<td height=15 colspan="2" class="tdbg" style="height: 30px;">
				<div align="center">
					<font color=black><font size=3 color=black>��ǰ�û���<strong><%=teacher.getName()%></strong>
					</font>
				</div>
			</td>
		</tr>
	</table>
</BODY>
</HTML>