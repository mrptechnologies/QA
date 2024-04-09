<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title><%=session.getAttribute("PageTitle")%></title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
</head>
<body leftmargin="0" rightmargin="0" topmargin="0">




<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td ><img src="../Images/OAA.gif"></td>
	</tr>
	<tr><td ><hr size=1 noshade width="95%"/> </td></tr>

	<tr><td valign="top">
	<table WIDTH="550px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

		<tr><td class="TextMatter" colspan="3">This Appointment Request is  <bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Status)" /><br><br>
		
		The Agent will be notified regarding this status through E-Mail.

</td></tr>

		<tr>
		<td >&nbsp;</td>
		
	</tr>
	
		<tr>
		<td >&nbsp;</td>
		
	</tr>
		<tr>
		<td >&nbsp;</td>
		
	</tr>
		<tr>
		<td >&nbsp;</td>
		
	</tr>
		<tr>
		<td >&nbsp;</td>
		
	</tr>
		<tr>
		<td >&nbsp;</td>
		
	</tr>
		<tr>
		<td >&nbsp;</td>
		
	</tr>
		<tr>
		<td >&nbsp;</td>
		
	</tr>
</table>

		</td>
	</tr>

</table>

</body>
</html:html>
