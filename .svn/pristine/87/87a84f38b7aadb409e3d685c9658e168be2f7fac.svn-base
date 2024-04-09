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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<head>
<title><%=session.getAttribute("PageTitle")%></title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<SCRIPT type="text/javascript">
<!--
function CloseWindow(){
top.opener.location.reload(true);
window.close();
}
//-->
</SCRIPT>
</head>

<body>
<%String custid="";%>
<%if (request.getParameter("CustomerId")!= null) {%>
<%custid= request.getParameter("CustomerId");%>
<%} else {
	custid=request.getAttribute("CustomerId").toString();
}%>

<%String CustomerName="";%>
<%if (request.getParameter("CustomerName")!= null) {%>
<%CustomerName= request.getParameter("CustomerName");%>
<%} else {
	CustomerName=request.getAttribute("CustomerName").toString();
}%>

<%String CustomerNumber="";%>
<%if (request.getParameter("CustomerNumber")!= null) {%>
<%CustomerNumber= request.getParameter("CustomerNumber");%>
<%} else {
	CustomerNumber=request.getAttribute("CustomerNumber").toString();
}%>

<%String userName="";%>
<%if (request.getParameter("userName")!= null) {%>
<%userName= request.getParameter("userName");%>
<%} else {
	userName=request.getAttribute("userName").toString();
}%>

<html:form action="/UploadCensusFile" enctype="multipart/form-data" >
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<table>
<tr>
<td class="Error" COLSPAN="2">
<%if(request.getAttribute("Error")!=null){%>
<%=request.getAttribute("Error")%>

<%}%>
<%if (request.getParameter("status")!= null) {%>
<%if (request.getParameter("status").equals("success")) {%>

Selected File <%=request.getAttribute("FileName")%> UpLoaded Successfully!!! 
<%}%>
<%if (request.getParameter("status").equals("failure")) {%>
Failed to Update!!  
<%} }%>
<td>
</tr>
<tr><td colspan="6" >&nbsp;</td></tr>
<tr><td colspan="6" >&nbsp;</td></tr>

<tr><td><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/></td></tr>

<tr><td class="sectionheadblack" align="Left">Please select the .xls file</td>		
		<td><html:file property="myFile"/> </td>
		<td  align="center">
		<td><html:submit value="UPLOAD"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
		&nbsp;&nbsp;&nbsp;
	</td></tr>
<tr><td><html:hidden property="upLoadFile" value="yes"/></td></tr>
<tr><td>

<div align="right" style="width:100%; padding:14px 0px; background: url(images/footer_bottom_tile.gif) bottom repeat-x"><a href="javascript:CloseWindow();"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="0" /></a></div>
</td></tr>

<logic:present name="ExcelValidationErrorList"  scope="request" >
<tr>
<td colspan="3">
<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="sectionheadblackbig" align="center"><u><b><%="Census Import status"%></b></u></td></tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td class="Error" WIDTH="100%">
<ol>
	<bean:define id="arrList" name="ExcelValidationErrorList" type="java.util.ArrayList"/>
	<logic:iterate id="errMsg" name="arrList" type="java.lang.String">
	<li>
	<%=errMsg%>
	</li>
	</logic:iterate>
	</ol>
	</td>
	</tr>
</table>	
</td>
</tr>
</logic:present >
<tr><td>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:hidden property="answer(Object::AttachmentObjectLink::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::AttachmentObjectLink::ObjectType)" value="CUSTOMER" />
<html:hidden property="answer(Object::AttachmentObjectLink::ObjectId)" value="<%=custid.toString()%>" />
<html:hidden property="answer(Object::AttachmentObjectLink::CreatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::AttachmentObjectLink::UpdatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::AttachmentObjectLink::Status)" value="uploaded" />
<html:hidden property="answer(Object::AttachmentObjectLink::Active)" value="Y" />

<html:hidden property="answer(Object::Attachment::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Attachment::AttachmentLocType)" value="HTTP" />
<html:hidden property="answer(Object::Attachment::AttachmentObjType)" value="XLS DOCUMENT" />
<html:hidden property="answer(Object::Attachment::AttachmentState)" value="Uploaded" />
<!--html:hidden property="answer(Object::Attachment::AttachmentStatus)" value="Uploaded" /-->
<html:hidden property="answer(Object::Attachment::AttachmentType)" value="Census" />
<html:hidden property="answer(Object::Attachment::AttachmentDesc)" value="CencesDetails" />
<html:hidden property="answer(Object::Attachment::Active)" value="Y" />
<html:hidden property="answer(Object::Attachment::CreatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Attachment::UpdatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="answer(ImportType)" value="UPLOAD_CENSUS_FILE" />




<html:hidden property="CustomerName" value="<%=CustomerName.toString()%>" />
<html:hidden property="CustomerNumber" value="<%=CustomerNumber.toString()%>" />
<html:hidden property="userName" value="<%=userName.toString()%>" />
<html:hidden property="CustomerId" value="<%=custid.toString()%>" />
<html:hidden property="upLoadFile" value="yes"/>
<html:hidden property="SendMail" value="yes"/>
</td></tr>

</table>
</html:form>
</body>
</html:html>
