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

<SCRIPT type="text/javascript"></script>
<!--
function validateFields(){
	var answer = window.confirm("Do you really want continue?");
	if (!answer) {
		return false;
	}
	return true;

}

function CloseWindow(){
top.opener.location.reload(true);
window.close();
}
//-->

<html:form action="/ImportOptionsFile" enctype="multipart/form-data" onsubmit="return validateFields()">
<table width="760px" align="center" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="20"></td></tr>
<tr>
	<td class="NewSectionHead" align="center">IMPORT OPTION VALUES</td></tr>
<tr>
	<td height="8px"></td></tr>
<tr>
	<td class="Error" COLSPAN="2">
		<%if(request.getAttribute("Error")!=null){%>
		<%=request.getAttribute("Error")%>

		<%}%>
		<%if (request.getParameter("status")!= null) {%>
		<%if (request.getParameter("status").equals("success")) {%>
		 
		<%}%>
		<%if (request.getParameter("status").equals("failure")) {%>
		Failed To Import. You Cannot Import An Excel File Intrepretation Error!!  
		<%} }%>
	</td></tr>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="false">	
<tr>
	<td class="sectionhead">
		You Don't Have the Privilage to Access This Page. Please Contact Administrator.</td></tr>
</dmshtml:dms_static_with_connector>


<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">


<tr><td>
	<html:hidden property="upLoadFile" value="yes"/> </td></tr>
<tr>
	<td align="center">
	<table border="0" width="100%" cellspacing="2" cellpadding="2" style="{border-width:1px; border-style:solid; border-color: #999999;}">
	
<logic:present name="ARRAY_OPTION_DETAILS" scope="request">
	<bean:define id="arrOptionsTable" name="ARRAY_OPTION_DETAILS" type="java.util.ArrayList" />
	<tr>
		<td class="sectionhead" width="15%" nowrap>Please Specify the Default Option Value</td>
		<td class="SearchResult">
	<html:select property="answer(Object::ProductOptions::DefaultOptionValue)" >
				<%for(int i=0;i<arrOptionsTable.size();i++) {
					com.dms.ejb.data.QuestionHashMap optionMap=(com.dms.ejb.data.QuestionHashMap)arrOptionsTable.get(i);	
					%>
					<html:option value ='<%=optionMap.getString("Object::ProductOptions::Value")%>'>
					<%=optionMap.getString("Object::ProductOptions::DisplyValue")%></html:option>
					<%}%>
				</html:select>
				
		</tr>
</logic:present>
		</table>		
	
			
	
	<table border="0" width="100%" cellspacing="2" cellpadding="2" style="{border-width:1px; border-style:solid; border-color: #999999;}">
	<logic:present name="arrOptionsTable">
	
	<bean:size id="arraySize" name="ARRAY_OPTION_DETAILS"/>
	
	<logic:greaterThan name="arraySize" value="0">
	<tr><td class="sectionhead" colspan ="11" align="center" >Interpreted Data View</td></tr>
	<tr>
		<td  align="right" colspan="11">
			<html:submit value="Import"  styleClass="sbttn"/> </td></tr>
	
			
	<tr>
		<td class="sectionhead"  width="2%" align="Left">No.</td>
		<td class="sectionhead" width="20%" align="Left">Option Name</td>
		<td class="sectionhead" width="15%" align="Left">Option Desc</td>
		<td class="sectionhead" width="15%" align="Left">Option Version No.</td>
		<td class="sectionhead" width="10%" align="Left">Rated</td>
		<td class="sectionhead" width="20%" align="Left">Option Type</td>
		<td class="sectionhead" width="10%" align="Left">Display Value</td>
		<td class="sectionhead" width="10%" align="Left">Value</td>
		<td class="sectionhead" width="30%" align="Left">Description</td>
		<td class="sectionhead" width="5%" align="Left">Sequence</td>
		<td class="sectionhead" width="10%" align="Left">Active</td>
		<!-- <td class="sectionhead" width="8%" align="Left">Option Sequence Number</td>	
		<td class="sectionhead" width="8%" align="Left">Option Group Number</td>	-->
	</tr>
	<%	int siNo=0; %>
	<logic:iterate id="excelSheetDetails" type="com.dms.ejb.data.QuestionHashMap" name="arrOptionsTable">
			
	
		<tr>
			<td class="SearchResult">
			<%=++siNo%>
			</td>

			<td class="SearchResult" >
				<bean:write name="UploadOptions" property="answer(Object::ProductOptions::OptionName)"/>
			</td>

			<td class="SearchResult" >
				<bean:write name="UploadOptions" property="answer(Object::ProductOptions::OptionDesc)"/>
			</td>
			<td class="SearchResult" >
				<bean:write name="UploadOptions" property="answer(Object::ProductOptions::OptionVerNum)"/>
			</td>
			<td class="SearchResult" >
				<bean:write name="UploadOptions" property="answer(Object::ProductOptions::Rated)"/>
			</td>
			<td class="SearchResult" >
				<bean:write name="UploadOptions" property="answer(Object::ProductOptions::OptionType)"/>
			</td>
			<td class="SearchResult" >
				<%=excelSheetDetails.getString("Object::ProductOptions::DisplyValue")%>
			</td>
			<td class="SearchResult" >
				<%=excelSheetDetails.getString("Object::ProductOptions::Value")%>
			</td>
			<td class="SearchResult" >
				<%=excelSheetDetails.getString("Object::ProductOptions::Description")%>
			</td>
			<td class="SearchResult" >
				<%=excelSheetDetails.getString("Object::ProductOptions::Sequence")%>
			</td>
			<td class="SearchResult" >
				<bean:write name="UploadOptions" property="answer(Object::ProductOptions::Active)"/>
			</td>
			<!-- <td class="SearchResult" >
				<bean:write name="UploadOptions" property="answer(Object::ProductOptions::OptionSequenceNumber)"/>
			</td>
			<td class="SearchResult" >
				<bean:write name="UploadOptions" property="answer(Object::ProductOptions::OptionGroupNumber)"/> -->
			
		</tr>	
	</logic:iterate>
	
		<tr>
			<td  align="right" colspan="11">
				<html:submit value="Import"  styleClass="sbttn"/> </td></tr>
	</logic:greaterThan>
	</logic:present>
	</table>
	</td>
</tr>


<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="excelFileName" property="answer(excelFileName)" name="UploadOptions" />
<bean:define id="SheetNumber" property="answer(Excel::SheetNumber)"	name="UploadOptions" scope="request" />
<bean:define id="StartingRow" property="answer(Excel::StartingRow)" name="UploadOptions" scope="request" />
<tr><td>
<html:hidden property="answer(Options::Excel::ConfirmImport)" value="Yes" />
<html:hidden property="answer(ImportType)" value="IMPORT_OPTIONS_FILE" />
<html:hidden property="answer(propertyFileName)" value="/product/OptionImport"/>

<html:hidden property="userName" value="<%=userName.toString()%>" />
<html:hidden property="upLoadFile" value="yes"/>
<html:hidden property="answer(excelFileName)" value="<%=""+excelFileName%>" />

<html:hidden property="answer(Excel::SheetNumber)" value="<%=""+SheetNumber%>" />
<html:hidden property="answer(Excel::StartingRow)" value="<%=""+StartingRow%>" />

<html:hidden property="answer(Object::ProductOptions::CreatedBy)" value="<%=""+userName%>"/>
<html:hidden property="answer(Object::ProductOptions::UpdatedBy)" value="<%=""+userName%>"/>
<html:hidden property="answer(Object::ProductOptions::dbName)"
				value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
<html:hidden property="answer(Object::ProductOptions::OptionId)" />
<html:hidden property="answer(Object::ProductOptions::OptionVerId)" />
<html:hidden property="answer(objectId)" />
<html:hidden property="answer(objectVerId)" />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</td></tr>

</dmshtml:dms_static_with_connector>
</table>

</html:form>
