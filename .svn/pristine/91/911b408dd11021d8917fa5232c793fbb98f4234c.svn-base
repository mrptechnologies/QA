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

<SCRIPT type="text/javascript">
<!--
function CloseWindow(){
top.opener.location.reload(true);
window.close();
}
//-->
</SCRIPT>

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

<bean:define id="agencyId" type="java.lang.String" name="ExportEmployeeCensus" property="answer(Object::Agency::AgencyId)"/>
<logic:empty name="agencyId">
<%if (request.getParameter("answer(Object::Agency::AgencyId)")!= null) {%>
<%agencyId= request.getParameter("answer(Object::Agency::AgencyId)");%>
<%} else {
	agencyId=request.getAttribute("answer(Object::Agency::AgencyId)").toString();
}%>
</logic:empty>


<%String userName="";%>
<%if (request.getParameter("userName")!= null) {%>
<%userName= request.getParameter("userName");%>
<%} else {
	userName=request.getAttribute("userName").toString();
}%>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
	<tr><td><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>
<tr>
	<td>&nbsp;</td></tr>
				
<tr>
	<td class="MH">&nbsp;EMPLOYEE CENSUS UPLOAD</td>
	<td>&nbsp;</td>
</tr>

<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td class="TextMatter" >Use this page to Upload Census (xls) file</td>
</tr>

<tr>
	<td>&nbsp;</td>
</tr>

<tr>
<td class="Error" COLSPAN="2"></td>

<!-- <%if (request.getParameter("status").equals("failure")) {%>
Failed to Upload!! 
<%}%>
 -->

</tr>

<%
java.util.ArrayList pdfList = new java.util.ArrayList();
%>
<tr><td>
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr><td></td></tr>
		<%
		com.dms.util.Constants qPDF = new com.dms.util.Constants();
			pdfList = qPDF.listFilesInsideADirectory("EmployeeFILE_Path", custid.toString()
					+ "/" + "Files");
		if(pdfList.size()>0){
		%>
		<tr>
			<td class="sectionhead1" COLSPAN="3" height="20px">Uploaded Files</td></tr>
			<%
				for (int i = 0; i < pdfList.size(); i++) {
				String fileName = (String) pdfList.get(i);
			%>
		<tr> 
			<td class="SearchResult"><%=i+1%></td>

			<td class="SearchResult" width="100%"><a href="../doc.do?docName=Benicorp/EmployerGroup/Employees/<%=custid.toString()%>/Files/<%=fileName.toString()%>&amp;docType=excel" target="new">
			<IMG SRC="../Images/excel.jpg" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> </a></td>

			<td class="SearchResult" nowrap="nowrap" align="right"><a href="/ValidateFileForImport.do?answer(excelFileName)=<%=fileName.toString()%>&answer(Census::Excel::FileName)=<%=fileName.toString()%>&CustomerId=<%=custid.toString()%>&answer(Census::Excel::CustomerId)=<%=custid.toString()%>&answer(ImportType)=IMPORT_UPLOADED_FILE"><img src="/Images/import.png" width="91" height="19" border="0" alt="Import File"></a></td></tr>
			<%
				}
			%>

		<%
		}
		%>
	
	</table>
</td></tr>

<tr><td>&nbsp;</td></tr>
<tr>
	<td ><hr size="1" noshade ></td>
</tr>

<tr>
<td class="Error" COLSPAN="2">
<%if(request.getAttribute("Error")!=null){%>
<%=request.getAttribute("Error")%>

<%}%>
</td>
</tr>

<tr><td>&nbsp;</td></tr>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="false">	
<tr><td class="sectionhead">you don't have the privilage to access this page please contact administrator</td></tr>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">	



<tr><td>

<html:form action="/UploadCensusFileForImport" enctype="multipart/form-data">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<!-- <tr><td class="NewSectionHead" colspan ="2" align="center" >Census Import </td></tr> -->
<table WIDTH="100%" >
<tr>
	<td class="FormLabels" align="left">.xls file to import 		
	<html:file property="myFile" styleClass="txtbox"/></td>
</tr>

<tr><td>&nbsp;</td></tr>

<tr>
	<td><hr size="1" noshade >
	</td>
</tr>	

	
	
<tr>
	<td  align="center">
	<html:submit value="Upload"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
	&nbsp;&nbsp;&nbsp;
	</td>
</tr>

<tr><td>&nbsp;</td></tr> 
<tr><td>
<html:hidden property="upLoadFile" value="yes"/></td></tr>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<tr><td>
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId.toString()%>" />
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
<html:hidden property="SendMail" value="yes"/></td></tr>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

</table>
</html:form>
</td></tr>
</dmshtml:dms_static_with_connector>
</table>
