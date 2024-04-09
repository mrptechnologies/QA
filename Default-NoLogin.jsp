<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<link href="styles/Styles.css" rel="stylesheet" type="text/css">
<title>Welcome to <%=session.getAttribute("PageTitle")%> Quoting System - Site Under Maintenance</title>
<!-- <html:base/> -->
</head>
<body>
<table WIDTH="100%" style="height:100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td width="60%" align="center" valign="middle"><IMG SRC="Images/BeniCorp-Logo.GIF" WIDTH="282" HEIGHT="108" BORDER="0" ALT=""></td>
		<td bgcolor="#336699" align="center" >

			<TABLE WIDTH="75%" ALIGN=center BORDER=0 CELLSPACING=0 CELLPADDING=4 >
			<TR>
				<TD align="center" class="WhiteMsg" height="35%"> 
				&nbsp;<br><br><br><br><br><br><br><br><br><br><br><br><br>
				</TD>
			</TR>
			
			
			<TR bgcolor="#DDDDDD">
				<TD align="center"> 
				<H4 style="COLOR: #FF0000;">Benicorp Quote System is Currently under maintenance.</H4>
				<H4 style="COLOR: #FF0000;">Please visit after sometime.</H4>
				</TD>
			</TR>

			<TR>
				<TD align="center" valign="middle">
				</TD>
			</TR>
			<tr>
				<td align="center" >&nbsp;<br><br><br><br><br><br><br><br><br>
				</td>
			</tr>

			<tr>
				<td align="center" class="WhiteMsg">
				<bean:message key="prompt.CopyRight"/>
				</td>
			</tr>
		</TABLE>
	</td>
</tr>
</table>
</body>
</html:html>