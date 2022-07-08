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
<title>毕业设计选题系统-用户登录</title>
<link href="js/css.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
	function CheckForm() {
		if (document.login.user_no.value.length == 0) {
			alert("请输入用户编号");
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
			<font size=10 color=black>毕 业 设 计 选 题 管 理 系 统
		</center></td>
</tr>
<form id="login" name="login" method="post" action="login"
	onSubmit="return CheckForm();">
	</br>
	<tr>

		<center>
			<font size=6 color=black>编 号：</font><input name="user_no" type="text"
				id="user_no" size="30" style="height: 30px;" title="用户名或编号，学生为学号！" />
		</center>

	</tr>
	</br>
	<tr>


		<center>
			<font size=6 color=black>密 码：</font><input name="user_pass"
				type="password" id="user_pass" size="30" style="height: 30px;"
				title="默认密码是admin，登录后请自行修改！" />
		</center>



	</tr>
	</br>
	<tr>

		<center>
			<font size=6 color=black>用户类型：</font> <select name="u_type"
				id="u_type" style="height: 30px;">
				<option value="1"><font size=6>学 生</font></option>
				<option value="2"><font size=6>教师</font></option>
				<option value="3"><font size=6>管理员</font></option>
			</select>
		</center> 

	</tr>
	</br>
	<tr>

		<center>
			<input type="submit" name="Submit" style="height: 30px;"
				value=" 登 录 " /> <input type="reset" name="Submit2"
				style="height: 30px;" value=" 重 置 ">
		</center>

	</tr>
</form>
</html>

