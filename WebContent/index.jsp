<%@page pageEncoding="GBK"%>
<%@page import="dao.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
body {
	background-image: url(images1/02.jpg);
	background-repeat: repeat;
}
</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ҵ���ѡ��ϵͳ-�û���¼</title>
<link href="js/css.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
	function CheckForm() {
		if (document.login.user_no.value.length == 0) {
			alert("�������û����");
			document.login.user_no.focus();
			return false;
		}
		return true;
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
</br>
<tr>
	<td><center>
			<font size=10 color=black>�� ҵ �� �� ѡ �� �� �� ϵ ͳ
		</center></td>
</tr>
<form id="login" name="login" method="post" action="login"
	onSubmit="return CheckForm();">
	</br>
	<tr>

		<center>
			<font size=6 color=black>�� �ţ�</font><input name="user_no" type="text"
				id="user_no" size="30" style="height: 30px;" title="�û������ţ�ѧ��Ϊѧ�ţ�" />
		</center>

	</tr>
	</br>
	<tr>


		<center>
			<font size=6 color=black>�� �룺</font><input name="user_pass"
				type="password" id="user_pass" size="30" style="height: 30px;"
				title="Ĭ��������admin����¼���������޸ģ�" />
		</center>



	</tr>
	</br>
	<tr>

		<center>
			<font size=6 color=black>�û����ͣ�</font> <select name="u_type"
				id="u_type" style="height: 30px;">
				<option value="1"><font size=6>ѧ ��</font></option>
				<option value="2"><font size=6>��ʦ</font></option>
				<option value="3"><font size=6>����Ա</font></option>
			</select>
		</center> 

	</tr>
	</br>
	<tr>

		<center>
			<input type="submit" name="Submit" style="height: 30px;"
				value=" �� ¼ " /> <input type="reset" name="Submit2"
				style="height: 30px;" value=" �� �� ">
		</center>

	</tr>
</form>
</html>

