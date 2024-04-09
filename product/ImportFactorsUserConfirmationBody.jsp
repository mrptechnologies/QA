<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript">
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
</SCRIPT>


<html:form action="/ImportFactorFile" enctype="multipart/form-data" onsubmit="return validateFields()">
<%com.dms.ejb.data.QuestionHashMap FactordetailMap=null;

%>


<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td class="NewSectionHead" colspan="10" align="center" width="750">
		Interpreted Data View</td>
	</tr>




	<dmshtml:dms_static_with_connector ruleName='privilage'
		property='<%=new String[]{"SYS_ADMIN"}%>' connector='or'
		negated="false">

		<tr>
			<td class="sectionhead">you don't have the privilage to access
			this page please contact administrator</td>
		</tr>

	</dmshtml:dms_static_with_connector>
	<dmshtml:dms_static_with_connector ruleName='privilage'
		property='<%=new String[]{"SYS_ADMIN"}%>' connector='or'
		negated="true">



		<logic:present name="ARRAY_FACTOR_DETAILS" scope="request">
			<bean:define id="Factordetail" name="ARRAY_FACTOR_DETAILS"
				type="com.dms.ejb.data.QuestionHashMap" />
			<%FactordetailMap=Factordetail;%>
		</logic:present>

		<%String[] dbColName = (String[]) FactordetailMap.get("EXCELTABLE_ATTRIBUTES");
		java.util.ArrayList arrFactorTable = (java.util.ArrayList)FactordetailMap.get("EXCELTABLE");
		
		%>

		
			<tr><td><html:hidden property="answer(dbname)"
				value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' /></td></tr>

			<tr>
				<td colspan="6">&nbsp;</td>
			</tr>
			<tr>
				<td valign="top">
				<table width="100%" align="center" border="0" CELLSPACING="0"
					CELLPADDING="0">

					<tr>
						<td colspan="8">&nbsp;</td>
					</tr>
					<tr>
						<td align="left"><html:submit value="Import"
							styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
							onmouseout="this.style.color='#0042B0';" /> &nbsp;&nbsp;&nbsp;</td>
					</tr>


					<tr>
						<td class="NewSectionHead" colspan="8" align="center"></td>
					</tr>

					<tr>
						<td class="sectionhead" width="2%" align="left">No.</td>
						<% for (int colCounter=0;colCounter<dbColName.length;colCounter++) {%>
						<td class="sectionhead" width="20%" align="left"><%=""+dbColName[colCounter]%></td>
						<%} %>
					</tr>
					<% int siNo=1;
					for (int i=0;i<((arrFactorTable.size()>500)?500:arrFactorTable.size());i++) 
					{
				    com.dms.ejb.data.QuestionHashMap factorqMap=(com.dms.ejb.data.QuestionHashMap)arrFactorTable.get(i); %>
					<tr>
						<td class="SearchResult" width="20%" align="left"><%=siNo++%>
						</td>

						<% for (int colCounter=0;colCounter<dbColName.length;colCounter++) {%>
						<td class="SearchResult" width="20%" align="left">
						<%String colName =dbColName[colCounter];%> <%=""+factorqMap.getString(colName)%>

						</td>
						<%} %>

					</tr>
					<%} %>

					<tr>
						<td align="left"><html:submit value="Import"
							styleClass="sbttn" onmouseover="this.style.color='#FF0D25';"
							onmouseout="this.style.color='#0042B0';" /> &nbsp;&nbsp;&nbsp;</td>
					</tr>

				</table>

				</td>
			</tr>











			<bean:define id="userName"
				property="answer(Object::UserDetail::userName)" name="LoginPage"
				scope="session" />
			<bean:define id="ownerId"
				property="answer(Object::UserDetail::ownerId)" name="LoginPage"
				scope="session" />
			<bean:define id="excelFileName" property="answer(excelFileName)"
				name="UploadFactors" />
			<bean:define id="propertyFileName"
				property="answer(propertyFileName)" name="UploadFactors" />

<tr><td>
			<html:hidden property="answer(Census::Excel::dbname)"
				value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

			<html:hidden property="upLoadFile" value="yes" />
			<html:hidden property="answer(Factors::Excel::ConfirmImport)"
				value="Yes" />
			<html:hidden property="answer(ImportType)" value="IMPORT_FACTOR_FILE" />
			<html:hidden property="userName" value="<%=userName.toString()%>" />
			<html:hidden property="answer(excelFileName)"
				value="<%=""+excelFileName%>" />
			<html:hidden property="answer(propertyFileName)"
				value="<%=""+propertyFileName%>" /></td></tr>


			<bean:define id="FactorId"
				property="answer(Object::ProductFactors::FactorId)"
				name="UploadFactors" scope="request" />
			<bean:define id="FactorVerId"
				property="answer(Object::ProductFactors::FactorVerId)"
				name="UploadFactors" scope="request" />

			<bean:define id="SheetNumber" property="answer(Excel::SheetNumber)"
				name="UploadFactors" scope="request" />
			<bean:define id="ImportAllSheets" property="answer(Excel::ImportAllSheets)"
				name="UploadFactors" scope="request" />
			<bean:define id="StartingRow" property="answer(Excel::StartingRow)"
				name="UploadFactors" scope="request" />

			<tr><td><html:hidden property="answer(Object::ProductFactors::FactorId)"
				value="<%=""+FactorId%>" />
			<html:hidden property="answer(Object::ProductFactors::FactorVerId)"
				value="<%=""+FactorVerId%>" />
				
				<html:hidden property="answer(objectId)"
				value="<%=""+FactorId%>" />
			<html:hidden property="answer(objectVerId)"
				value="<%=""+FactorVerId%>" />

			<html:hidden property="answer(Excel::SheetNumber)"
				value="<%=""+SheetNumber%>" />
			<html:hidden property="answer(Excel::StartingRow)"
				value="<%=""+StartingRow%>" />

			<html:hidden property="answer(Object::ProductFactors::CreatedBy)"
				value="<%=""+userName%>" />
			<html:hidden property="answer(Object::ProductFactors::UpdatedBy)"
				value="<%=""+userName%>" />
			<html:hidden property="answer(Excel::ImportAllSheets)"
				value="<%=""+ImportAllSheets%>" />



			<html:hidden property="answer(Object::ProductFactors::dbName)"
				value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' /></td></tr>
	</dmshtml:dms_static_with_connector>
	
</table>
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

</html:form>
