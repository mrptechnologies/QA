<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=session.getAttribute("PageTitle")%></title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="../Scripts/JScripts/ListOfEmployees.js">

</SCRIPT>
</head>

<body>


<table>
<td class="Error" COLSPAN="2">
<%if (request.getParameter("status")!= null) {%>
<%if (request.getParameter("status").equals("success")) {%>

Selected File <%=request.getAttribute("FileName")%> UpLoaded Successfully!!! 
<%}%>
<%if (request.getParameter("status").equals("failure")) {%>
Failed to Update!!  
<%} }%>
<td>
<tr><td colspan="6" >&nbsp;</td></tr>
<tr><td colspan="6" >&nbsp;</td></tr>
<html:form action="/ExportCensusFile" enctype="multipart/form-data" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<td class="sectionheadblack" align="Left">Please select the file<td>		
		<html:file property="myFile"/> </td>
		<td  align="center">
		<html:submit value="UPLOAD"  styleClass="sbttn"/> 
		&nbsp;&nbsp;&nbsp;
	</td></tr>
<html:hidden property="upLoadFile" value="yes"/>
<tr><td>
<div align="right" style="width:100%; padding:14px 0px; background: url(images/footer_bottom_tile.gif) bottom repeat-x"><a href="javascript:window.close()"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="0" /></a></div>
</td></tr>
</html:form>
</table>
</body>
</html>
