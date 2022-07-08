<%@page pageEncoding="GBK"%>

<%@include file="check.jsp"%>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<TITLE>毕业设计选题系统</TITLE>
<link rel="stylesheet" href="../js/CssAdmin.css">
<head>
<style type="text/css">
body {
	background-image: url(images1/02.jpg);
	background-repeat: repeat;
}
</style>
<SCRIPT language=JavaScript>
	function switchSysBar() {
		if (switchPoint.innerText == 3) {
			switchPoint.innerText = 4
			document.all("frameTitle").style.display = "none"
		} else {
			switchPoint.innerText = 3
			document.all("frameTitle").style.display = ""
		}
	}
</SCRIPT>
</head>
<BODY>
	<table bgcolor="#E1E6F6">
		<TABLE height="100%" cellSpacing="0" cellPadding="0" border="0"
			width="100%" background="images1/21.jpg">
			<TR>
				<TD colSpan="3" bgcolor="#E1E6F6"><IFRAME
						allowTransparency="true"
						style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 64"
						name="topFrame" id="topFrame" marginWidth="0" marginHeight="0"
						src="SysTop.jsp" frameBorder="1" noResize scrolling="no"
						bgcolor="#E1E6F6"> </IFRAME></TD>
			</TR>
			<TR>
				<TD width="170" height="100%" rowspan="2" align="middle"
					bgcolor="#E1E6F6" id="frameTitle"><IFRAME
						allowTransparency="true"
						style="Z-INDEX: 2; VISIBILITY: inherit; WIDTH: 170; HEIGHT: 100%"
						name="leftFrame" id="leftFrame" marginWidth="0" marginHeight="0"
						src="SysLeft.jsp" frameBorder="1" noResize scrolling="no">
					</IFRAME></TD>
				<TD width="10" height="100%" rowspan="2" align="center"
					bgcolor="#E1E6F6" onClick="switchSysBar()">收回 <FONT
					style="FONT-SIZE: 10px; CURSOR: hand; FONT-FAMILY: Webdings">
						<SPAN id="switchPoint">3</SPAN>
				</FONT>
				</TD>

				<TD height="100%" bgcolor="#E1E6F6"><iframe
						allowTransparency="true"
						style="Z-INDEX: 4; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%"
						name="mainFrame" id="mainFrame" marginwidth="16" marginheight="16"
						src="SysCome.jsp" frameborder="1" noresize scrolling="yes">
					</iframe></TD>
			</TR>
			<TR>
				<TD height="30" bgcolor="#E1E6F6"><iframe
						allowTransparency="true"
						style="Z-INDEX: 3; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 30"
						name="headFrame" id="mainFrame" marginwidth="16" marginheight="3"
						src="SysHead.jsp" frameborder="1" scrolling="no"> </iframe></TD>
			</TR>
		</TABLE>
	</table>
</BODY>
</HTML>