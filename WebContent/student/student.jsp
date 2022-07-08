<%@page pageEncoding="GBK"%>
<%@include file="check.jsp"%>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
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
<BODY scroll="no" topmargin="0" bottom="0" leftmargin="0"
	rightmargin="0">
	<TABLE bgcolor="#E1E6F6" height="100%" cellSpacing="0" cellPadding="0"
		border="0" width="100%">
		<TR>
			<TD colSpan="3"><IFRAME bgcolor="#E1E6F6"
					style="Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 64"
					name="topFrame" id="topFrame" marginWidth="0" marginHeight="0"
					src="SysTop.jsp" frameBorder="0" noResize scrolling="no">
				</IFRAME></TD>
		</TR>
		<TR>
			<TD width="170" height="100%" rowspan="2" align="middle"
				bgcolor="#E1E6F6" id="frameTitle"><IFRAME
					style="Z-INDEX: 2; VISIBILITY: inherit; WIDTH: 170; HEIGHT: 100%"
					name="leftFrame" id="leftFrame" marginWidth="0" marginHeight="0"
					src="SysLeft.jsp" frameBorder="0" noResize scrolling="no"
					bgcolor="#E1E6F6"> </IFRAME></TD>
			<TD width="10" height="100%" rowspan="2" align="center"
				bgcolor="#E1E6F6" onClick="switchSysBar()"><FONT
				style="FONT-SIZE: 10px; CURSOR: hand; COLOR: #ffffff; FONT-FAMILY: Webdings">
					<SPAN id="switchPoint">3</SPAN>
			</FONT></TD>

			<TD bgcolor="#E1E6F6" height="100%"><iframe
					style="Z-INDEX: 4; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 100%"
					name="mainFrame" id="mainFrame" marginwidth="16" marginheight="16"
					src="SysCome.jsp" frameborder="0" noresize scrolling="yes">
				</iframe></TD>
		</TR>
		<TR>
			<TD bgcolor="#E1E6F6" height="30"><iframe
					style="Z-INDEX: 3; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 30"
					name="headFrame" id="mainFrame" marginwidth="16" marginheight="3"
					src="SysHead.jsp" frameborder="0" scrolling="no"> </iframe></TD>
		</TR>
	</TABLE>
</BODY>
</HTML>