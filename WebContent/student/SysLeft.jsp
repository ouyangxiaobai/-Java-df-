<%@page pageEncoding="GBK"%>
<%@include file="check.jsp"%>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<TITLE>毕业设计选题系统</TITLE>
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

<BODY>
	<table width="167" height="26" border="0" cellpadding="0"
		cellspacing="0" bgcolor="#E1E6F6">
		<tr style="cursor: hand;">
			<td style="height: 41px;"><a href="SysCome.jsp"
				target="mainFrame" onClick='changeAdminFlag("返回后台主页")'><font
					size=4 color=black>系统管理导航 </a></td>
		</tr>
		</br>
	</table>
	<div id="main9" onclick=expandIt(9)>
		<table width="167" height="26" border="0" cellpadding="0"
			cellspacing="0" bgcolor="#E1E6F6">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 52px;"><font size=3
					color=black>个人中心</td>
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
					onClick='changeAdminFlag("修改资料")'><font size=2 color=black>修改资料</a>
				</td>
			</tr>
			<tr>
				<td width="36" height="22"></td>
				<td class="SystemLeft" style="height: 36px;"><a
					href="task_mysel.jsp" target="mainFrame"
					onClick='changeAdminFlag("我的选题")'><font size=2 color=black>我的选题</a>
				</td>
		</table>
	</div>
	<div id="main8" onclick=expandIt(8)>
		<table bgcolor="#E1E6F6" width="167" height="26" border="0"
			cellpadding="0" cellspacing="0">
			<tr style="cursor: hand;">
				<td width="26"></td>
				<td class="SystemLeft" style="height: 58px;"><font size=3
					color=black>开始选题</td>
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
					onClick='changeAdminFlag("课题列表")'><font size=2 color=black>所有选题列表</a>
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
				onClick='changeAdminFlag("后台主页")'><font size=3 color=black>返回主页</a>
			</td>
		</tr>
	</table>
	<table bgcolor="#E1E6F6" width="167" height="26" border="0"
		cellpadding="0" cellspacing="0">
		<tr style="cursor: hand;">
			<td width="26"></td>
			<td class="SystemLeft" style="height: 55px;"><a
				href="../index.jsp" target="_parent"><font size=3 color=black>退出登录</a>
			</td>
		</tr>
	</table>
	<table bgcolor="#E1E6F6" width="167" border="0" cellpadding="1"
		cellspacing="2" bgcolor="#E1E6F6">
		<tr align="center" bgcolor="#E1E6F6">
			<td height=25 colspan=2 class="topbg" style="height: 45px;"><font
				color="ffffff"><font size=3 color=black></br>
					</br>
					</br>毕业设计选题系统（学生）</font>
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
									</br>当前用户：<strong><%=student.getName()%></strong> </font>
							</div></td>
					</tr>
	</table>
</BODY>
</HTML>