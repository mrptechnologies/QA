<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CoseEmployee</title>
</head>
<body bgcolor="#ffffff">
<script type="text/javascript">
function scrollUp() {
   window.scroll(0,0);  
}

function scrolltoPosition(x,y) {
   window.scroll(x,y);  
}
function showLegand(){
	document.getElementById("legandContainer").style.display="inline";
}

</script>
<%
String employeeId="";
if(request.getParameter("answer(Object::Employee::EmployeeId)")!=null){ %>
	<bean:parameter id="EmployeeId" name="answer(Object::Employee::EmployeeId)" />
<%
employeeId=""+EmployeeId;
}else if((""+session.getAttribute("PRIMARY_OBJECT_TYPE")).equalsIgnoreCase("EMPLOYEE")) { 
    if(session.getAttribute("PRIMARY_OBJECT_ID")!=null) { 
    	employeeId=""+session.getAttribute("PRIMARY_OBJECT_ID");
    }
   }
%>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			<jsp:include page="../common/EmployerHeader.jsp"/>
		</td>
	</tr>
	<tr>
			<td valign="top" align="left">
				
					<jsp:include page="../common/EmployeeHeader.jsp">
						<jsp:param name="employeeId" value="<%=""+employeeId %>" />
						<jsp:param name="heading" value="<%="EMPLOYEE DETAILS "%>" />
					</jsp:include>
				
		    </td>
	</tr>
	
	<tr><td></td></tr>
</table> 
</td></tr>
<tr id="legandContainer" style="display:none">
			<td width="10%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="../Images/wrong.jpg" width="15" height="15"  border="0" alt="" /> Information is incomplete/missing, requires to enter further information
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="../Images/right.jpg" width="15" height="15"  border="0" alt="" /> All mandatory information is entered.
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <b><i> Bold / Italics </i></b>data entry fields are mandatory; requires user to enter information
			</td>
</tr>
<tr><td>&nbsp;</td></tr>
<bean:parameter id="sHeight" name="answer(applHeight)" />
<bean:parameter id="sWidth" name="answer(applWidth)" />

<tr>
	<td align="left" width="100%">
		<table WIDTH="100%" HEIGHT="1150px" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td width="100%" align="left">
					<!--url's used in the movie-->
					<!--text used in the movie-->
					<!-- saved from url=(0013)about:internet -->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<param name="allowScriptAccess" value="always" />
					<param name="movie" value="../EmployeeCensus/CoseEmployee.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" /><embed src="../EmployeeCensus/CoseEmployee.swf" quality="high" bgcolor="#ffffff" width="<%=""+sWidth%>" height="<%=""+sHeight%>" name="CoseEmployee" align="left" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>
				</td>
			</tr>
		</table>			
	</td>
</tr>
</table>
</body>
</html>