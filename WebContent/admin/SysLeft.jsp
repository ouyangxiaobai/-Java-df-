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

var count = 0;//做计数器
var limit = new Array();//用于记录当前显示的哪几个菜单
var countlimit = 1;//同时打开菜单数目，可自定义

function expandIt(el) {
	obj = eval("sub" + el);
	if (obj.style.display == "none") {
		obj.style.display = "block";//显示子菜单
		if (count < countlimit) {//限制2个
			limit[count] = el;//录入数组
			count++;
		} else {
			eval("sub" + limit[0]).style.display = "none";
			for (i = 0; i < limit.length - 1; i++) {
				limit[i] = limit[i + 1];
			}//数组去掉头一位，后面的往前挪一位
			limit[limit.length - 1] = el;
		}
	} else {
		obj.style.display = "none";
		var j;
		for (i = 0; i < limit.length; i++) {
			if (limit[i] == el)
				j = i;
		}//获取当前点击的菜单在limit数组中的位置
		for (i = j; i < limit.length - 1; i++) {
			limit[i] = limit[i + 1];
		}//j以后的数组全部往前挪一位
		limit[limit.length - 1] = null;//删除数组最后一位
		count--;
	}
}
</script>
</head>
<%@ include file="check.jsp"%>

<BODY bgcolor="#E1E6F6" background=""
	onmouseover="self.status='毕业论文选题系统!';return true">
	<table bgcolor="#E1E6F6" width="167" height="26" border="0"
		cellpadding="0" cellspacing="0">
		<tr style="cursor: hand;">
			<td><a href="SysCome.jsp" target="mainFrame"><font size=4
					color=black>系统管理导航</font> </a></td>
		</tr>
		</br>
	</table>
	<div id="main3" onclick=expandIt(3)>
		<table bgcolor="#E1E6F6" width="167" height="26" border="0"
			cellpadding="0" cellspacing="0" style="height: 52px;">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 35px;"><font size=3
					color=black>学生管理 </td>
			</tr>
		</table>
	</div>
	<div id="sub3" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="student_list.jsp"
					target="mainFrame" onClick='changeAdminFlag("学生列表")'><font
						size=2 color=black>查看所有</a></td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="student_add.jsp?Result=Add"
					target="mainFrame" onClick='changeAdminFlag("添加学生")'><font
						size=2 color=black>添加学生</a></td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="student_Padd.jsp"
					target="mainFrame" onClick='changeAdminFlag("批量导入学生信息")'><font
						size=2 color=black>批量导入学生信息</a></td>
			</tr>
		</table>
	</div>

	<div id="main2" onclick=expandIt(2)>
		<table bgcolor="#E1E6F6" width="167" height="26" border="0"
			cellpadding="0" cellspacing="0" style="height: 54px;">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft"><font size=3 color=black>教师管理 </td>
			</tr>
		</table>
	</div>
	<div id="sub2" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="teacher_list.jsp"
					target="mainFrame" onClick='changeAdminFlag("教师列表")'><font
						size=2 color=black>查看所有</a></td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="teacher_add.jsp?Result=Add"
					target="mainFrame" onClick='changeAdminFlag("添加教师")'><font
						size=2 color=black>添加教师</a></td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="teacher_Padd.jsp"
					target="mainFrame" onClick='changeAdminFlag("批量导入教师信息")'><font
						size=2 color=black>批量导入教师信息</a></td>
			</tr>
		</table>
	</div>

	<div id="main4" onclick=expandIt(4)>
		<table bgcolor="#E1E6F6" width="167" height="26" border="0"
			cellpadding="0" cellspacing="0" style="height: 56px;">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 34px;"><font size=3
					color=black>课题管理 </td>
			</tr>
		</table>
	</div>
	<div id="sub4" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="/work/admin?type=3"
					target="mainFrame" onClick='changeAdminFlag("课题列表")'><font
						size=2 color=black>课题查询</a></td>
			</tr>


		</table>
	</div>

	<div id="main12" onclick=expandIt(12)>
		<table bgcolor="#E1E6F6" width="167" height="24" border="0"
			cellpadding="0" cellspacing="0">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 40px;"><font size=3
					color=black>系统维护 </td>
			</tr>
		</table>
	</div>
	<div id="sub12" style="display: none">
		<table bgcolor="#E1E6F6" width="160" border="0" cellspacing="0"
			cellpadding="0">


			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="control_teacher.jsp"
					target="mainFrame"><font size=2 color=black>教师功能开/闭</a>
				</td>
			</tr>
			<tr> 
				<td width="36" height="22"></td>
				<td class="SystemLeft"><a href="control_student.jsp"
					target="mainFrame"><font size=2 color=black>学生功能开/闭</a>
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
				onClick='changeAdminFlag("后台主页")'><font size=3 color=black>后台主页</a>
			</td>
		</tr>
	</table>
	<table bgcolor="#E1E6F6" width="167" height="26" border="0"
		cellpadding="0" cellspacing="0" style="height: 67px;">
		<tr style="cursor: hand;">
			<td width="26"></td>
			<td class="SystemLeft" style="height: 38px;"><a
				href="../index.jsp" target="_parent"><font size=3 color=black>退出登录</a>
			</td>
		</tr>
	</table>
	<table bgcolor="#E1E6F6" width="167" border="0" cellpadding="1"
		cellspacing="2">
		<tr align="center">
			<td height=25 colspan=2 class="topbg" style="height: 72px;"><span
				class="Glow"><font color="ffffff"><font size=3
						color=black></br>毕业设计选题系统（管理员）</font></span>
		<tr>
			<td colspan="2" class="tdbg" style="height: 62px;">
				<div align="center" style="height: 30px;"></div>
			</td>
		</tr>

		<tr>
			<td height=15 colspan="2" class="tdbg" style="height: 30px;">
				<div align="center">
					<font color=black><font size=3 color=black>当前用户：<strong><%=teacher.getName()%></strong>
					</font>
				</div>
			</td>
		</tr>
	</table>
</BODY>
</HTML>