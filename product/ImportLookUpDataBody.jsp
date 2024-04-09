<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:html>

<head>
<title><%=session.getAttribute("PageTitle")%> - Rating Engine</title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<body leftmargin="0" rightmargin="0" topmargin="0">



<html:form action="/ImportLookUpData" enctype="multipart/form-data">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="false">	
<tr><td class="sectionhead">you don't have the privilage to access this page please contact administrator</td></tr>
</dmshtml:dms_static_with_connector>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">	
<tr><td class="Error">please donot refresh this page</td></tr>
<tr><td >&nbsp;</td></tr>

<tr>
<td class="sectionheadblack" align="Left">Please select the Excel file you want to import<td>		
		
		<td class="TextMatter" align="Left" >
		<html:file property="myFile"/></td>
		</tr>
		

	
<%java.util.ArrayList pdfList = new java.util.ArrayList();%>
<tr><td>
<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td colspan="8"><hr size="1" noshade ></td></tr>
<tr>
								<td class="FormLabels" align="left" height="25" width="30%">Agency/Agent</td>
								</td>
								<td class="links" align="left"><html:select property="answer(userInteraction::CreateAgenyAgent)" styleClass="txtbox">
								<html:option value ="No">Don't Create</html:option>
								<html:option value ='Yes'>Create</html:option>
								<html:option value ='UseExcelAgencyAgentIds'>Use Ids in the Excel</html:option>
								</html:select>
								
							</tr>

							<tr>
								<td class="FormLabels" align="left" height="25" width="60%">RENEWAL MONTH</td>
								<td class="links" align="left"><html:select property="answer(Object::QuoteAdditional::RenewalMonth)" styleClass="txtbox">
								<html:option value ="">SELECT</html:option>
								<html:option value ='AUG2006'>AUG 2006</html:option>
								<html:option value ='SEP2006'>SEP 2006</html:option>
								<html:option value ='OCT2006'>OCT 2006</html:option>
								<html:option value ='NOV2006'>NOV 2006</html:option>
								<html:option value ='DEC2006'>DEC 2006</html:option>
								<html:option value ='JAN2007'>JAN 2007</html:option>
								<html:option value ='FEB2007'>FEB 2007</html:option>
								<html:option value ='MAR2007'>MAR 2007</html:option>
								<html:option value ='APR2007'>APR 2007</html:option>
								<html:option value ='MAY2007'>MAY 2007</html:option>
								<html:option value ='JUN2007'>JUN 2007</html:option>
								<html:option value ='JUL2007'>JUL 2007</html:option>
								<html:option value ='AUG2007'>AUG 2007</html:option>
								<html:option value ='SEP2007'>SEP 2007</html:option>


					
								</html:select>
								</td>
							</tr>

<tr><td colspan="8"><hr size="1" noshade ></td></tr>
<tr><td >&nbsp;</td></tr>

<tr><td colspan="3" class="sectionhead1" >

</td></tr>

<tr align="right">
		<td  align="right">
		<html:submit value="UPLOAD"  styleClass="sbttn"/> 
		&nbsp;&nbsp;&nbsp;
	</td></tr>
<tr><td >&nbsp;</td></tr>

<%

{
    com.dms.util.Constants qPDF = new com.dms.util.Constants();
	pdfList=qPDF.listFilesInsideADirectory("RenewalLogFILE_Path","ImportRenewalData/LOGS");

}

%>

<tr>
<td class="sectionhead1" COLSPAN="2">
Log Files(Click the file to download)
<ol>
	<% for (int i=0; i<pdfList.size(); i++)  {
         String fileName=(String) pdfList.get(i);
		 %>
	<li>
	<a href="../doc.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&docName=Benicorp/ImportRenewalData/LOGS/<%=fileName.toString()%>&docType=excel" target="new">
	<IMG SRC="../Images/excel.jpg" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%>
	</a>
	</li>
	<%}%>
	</ol>
	</td>
	</tr>


</table>


	<logic:present name="errLog"  scope="request" >
<tr>
<td colspan="3">
<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="sectionheadblackbig" align="center"><u><b><%="Import Data"%></b></u></td></tr>

<tr>
<td class="sectionheadblack" WIDTH="100%">
<ol>
	<bean:define id="arrList" name="errLog" type="java.util.ArrayList"/>
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
</td></tr>
</dmshtml:dms_static_with_connector>
</table>	
<html:hidden property="answer(ImportType)" value="EMPGROUP"/>
<html:hidden property="answer(PropertyFileName)" value="RENEWAL_QUOTE_IMPORT"/>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(UserName)" value="<%=userName.toString()%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
</body>
</html:html>

