
<%@ page language="java" import="java.util.*,java.io.*, util.*, dao.*"
	pageEncoding="GB18030"%>

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
		try{
			FileUpLoad upload = new FileUpLoad();
			ServletInputStream in = request.getInputStream();
			upload.setInputStream(in);
			// upload.getParameter();
			long time = upload.getFileUpload();
			in.close();
			String filePath = upload.getFileur();
			if (filePath == null) {
				out.println("文件上传未成功！");
			} else {
				List<String> tnumber = TeacherManager.adds(filePath);
				for (String str : tnumber) {
					out.println(str + "教师已存在，可以手动修改，或删除后重新导入！<br>");
				}
				out.println("导入数据库成功！");
			}
		}catch(Exception e){
			out.println("文件上传出现异常！请重新选择文件<a href='teacher_Padd.jsp'>返回</a>");
		}
			
		
		
	%> 
	<br>
	<div align="right">
		<a href="teacher_list.jsp">查看所有教师</a>
	</div>
</body>
</html>
