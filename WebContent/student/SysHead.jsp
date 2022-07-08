<%@page pageEncoding="GBK"%>
<%@include file="check.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<table name="Trans" id="Trans" width="98%" height="24" border="0"
	cellpadding="0" cellspacing="0"
	style="BORDER-Top: #6298E1 1px solid; font-family: 宋体; font-size: 12px; color: #000000;">
	<tr>
		<td width="240" nowrap>学号：<%=student.getNumber()%></td>
		<td width="200" nowrap>姓名：[<%=student.getName()%>]
		</td>
		<td width="36" nowrap>位置：</td>
		<td width="120" nowrap>学生选题</td>
		<td align="right" nowrap id="DateTime"><script>
			setInterval( 
					"DateTime.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
					1000);
		</script></td>
	</tr>
</table>