
<%@ page language="java" import="java.util.*,java.io.*, util.*, dao.*"
	pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'AnswerFile.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>

	<%
		/*
		先上传符合规则的学生信息表 ，然后将表中数据添加到数据库中 
		*/
		try{
			FileUpLoad upload = new FileUpLoad();
			//upload.setFpath(basePath);//设置上传文件保存的位置 
			ServletInputStream in = request.getInputStream();
			upload.setInputStream(in);
			// upload.getParameter();
			long time = upload.getFileUpload();
			in.close();
			String filePath = upload.getFileur();//获得上传文件的位置和名字 
			if (filePath == null) {
				out.println("文件上传未成功！");
			} else {
				List<String> snumber = StudentManager.adds(filePath);//调用StudentManager中的方法将表中数据保存到数据库中 
				for (String str : snumber) {
					out.println(str + "学号已存在，可以手动修改，或删除后重新导入！<br>");
				}
				out.println("导入数据库成功！");
			}
		}catch(Exception e){
			out.println("文件上传出现异常！请重新选择文件<a href='teacher_Padd.jsp'>返回</a>");
		}
		
	%>
	<br>
	<div align="right">
		<a href="student_list.jsp">查看所有学生</a>
	</div>
</body>
</html>
