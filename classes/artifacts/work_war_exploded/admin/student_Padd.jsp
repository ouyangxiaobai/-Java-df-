<%@page pageEncoding="GBK"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>


<link rel="stylesheet" href="../js/CssAdmin.css">



<table width="100%" border="0" cellpadding="3" cellspacing="1"
	bgcolor="#E1E6F6">
	<tr>
		<td height="24" nowrap="nowrap"><font color=black>&nbsp;<strong>ѧ��������������ѧ����Ϣ</strong>
		</font></td>
	</tr>
	<tr>
		<td height="24" align="center" nowrap="nowrap" bgcolor="#E1E6F6">
			<a href="student_list.jsp"
			onclick='changeAdminFlag(&quot;ϵͳѧ��&quot;)'>�鿴����ѧ��</a> | <a
			href="student_add.jsp?Result=Add"
			onclick='changeAdminFlag(&quot;���ѧ��&quot;)'>�������ѧ��</a> |&nbsp;</font>
		</td>
	</tr>
</table>
<form action="student_adds.jsp" method="post" name="daoruf" id="daoruf"
	enctype="MULTIPART/FORM-DATA" onSubmit="return check();">
	<div align="left">
		<table width="100%" height="126" border="1" align="center"
			cellpadding="2" cellspacing="0" bordercolor=black
			bgcolor="#E1E6F6">
			<tr>
				<td align="right">&nbsp; �ļ�</td>
				<td align="left">&nbsp; <input type="file" name="file">
				</td>
			</tr>
			<tr align="center">
				<td height="23" colspan="2"><input type="submit" name="Submit"
					value="����Excel������Ϣ�����ݿ�"></td>
			</tr>
		</table>
	</div>
</form>

<p>
	ע�⣺ <br /> һ�� ׼����ȷ��Excel���ݱ���<a target="_blank"
		href="download/student.xls"><font color="#FF0000">��׼ѧ����Ϣ������</font>
	</a>��<br>���������е�˳�����ͱ�׼��һ���������޸ģ�<br>������Ҫ����ÿһ�е�Ҫ�󣬲�����Ҫ�󽫵��µ���ʧ�ܣ������ܶ����ݿ����Ӱ�죻<br>
	�ġ����������admin���棬������Ϊ�գ�
</p>
