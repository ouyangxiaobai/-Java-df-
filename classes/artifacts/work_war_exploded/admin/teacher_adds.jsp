
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
				out.println("�ļ��ϴ�δ�ɹ���");
			} else {
				List<String> tnumber = TeacherManager.adds(filePath);
				for (String str : tnumber) {
					out.println(str + "��ʦ�Ѵ��ڣ������ֶ��޸ģ���ɾ�������µ��룡<br>");
				}
				out.println("�������ݿ�ɹ���");
			}
		}catch(Exception e){
			out.println("�ļ��ϴ������쳣��������ѡ���ļ�<a href='teacher_Padd.jsp'>����</a>");
		}
			
		
		
	%> 
	<br>
	<div align="right">
		<a href="teacher_list.jsp">�鿴���н�ʦ</a>
	</div>
</body>
</html>