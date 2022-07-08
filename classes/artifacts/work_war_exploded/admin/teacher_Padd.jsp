<%@page pageEncoding="GBK"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
</head>



<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1"
	bgcolor="#E1E6F6">
	<tr>
		<td height="24" nowrap="nowrap">&nbsp;<strong><font color="black">学生管理：批量导入学生信息</strong>
		</td>
	</tr>
	<tr>
		<td height="24" align="center" nowrap="nowrap" bgcolor="#E1E6F6">
			<a href="student_list.jsp"
			onclick='changeAdminFlag(&quot;系统学生&quot;)'><font color="black">查看所有教师</a> | <a
			href="student_add.jsp?Result=Add"
			onclick='changeAdminFlag(&quot;添加学生&quot;)'><font color="black">单个添加教师</a> |&nbsp;</font>
		</td>
	</tr>
</table>
<form action="teacher_adds.jsp" method="post" name="daoruf" id="daoruf"
	enctype="MULTIPART/FORM-DATA" onSubmit="return check();">
	<div align="left">
		<table width="100%" height="126" border="1" align="center"
			cellpadding="2" cellspacing="0" bordercolor=black
			bgcolor="#E1E6F6">
			<tr>

				<td align="right"><font color="black">&nbsp; 文件</td>
				<td align="left">&nbsp; <input type="file" name="file">
				</td>
			</tr>
			<tr align="center"> 
				<td height="23" colspan="2"><input type="submit" name="Submit"
					value="导入Excel表中信息到数据库"></td>
			</tr>
		</table>
	</div>
</form>

<p>
	注意：
	 <br/> 一、 准备正确的Excel数据表。（<a target="_blank" href="download/teacher.xls"><font color="#FF0000">标准教师信息表下载</font>
	</a>）
	<br/> 二、表中列的顺序必须和标准表一样，不能修改；
	<br/>三、主要表中每一列的要求，不符合要求将导致导入失败，并可能对数据库造成影响；
	<br/>四、密码可以用admin代替，但不能为空；
	<br/> 
	<font color="red">五、教师学历只能是本科、硕士、博士、博士后中的一种，
	<br>职称只能是讲师、教师、副教授、助教中的一种，
	<br>身份只能是0(管理员)、1(教师)
	</font>
</p>
</body>>
