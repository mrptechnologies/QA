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

<%java.util.ArrayList FactordetailMap=null;

%>

<html:form action="/ImportFactorFile" enctype="multipart/form-data"
			onsubmit="return validateFields()">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="0">
	<tr><td>&nbsp;</td></tr>
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
	<tr>
	<td>
		<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">				
			<tr>
				<td>
					<table width="30%" align="left" border="0">
					<tr>
					<td>
						<dmshtml:get_FactorHeaderDetail_ByFactorId nameInSession="factorDetail" factorId="<%=Long.parseLong(request.getParameter("answer(factorId)").toString())%>" factorVerId="<%=Long.parseLong(request.getParameter("answer(factorVerId)").toString())%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId)%>"  />
						<logic:present name="factorDetail" scope="request">
							<bean:define id="factorName" name="factorDetail" property="factorName" scope="request"/>
							<table width="95%" align="center" border="0">
							<tr>
								<td  class="FormLabels" align="right"  colspan="1" width="160px">
									Factor Name :
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="220px"><b>
									<bean:write name="factorDetail" scope="request" property="factorName"/>				
									</b>
								</td>
							</tr>
							
							<tr>
								<td  class="FormLabels" align="right"  colspan="1" width="160px">
									Factor Version Number :
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="220px"><b>
									<bean:write name="factorDetail" scope="request" property="versionNumber"/>				
									</b>
								</td>
							</tr>
							
							<tr>
								<td  class="FormLabels" align="right"  colspan="1" width="160px">
									Created By :
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="220px"><b>
									<bean:write name="factorDetail" scope="request" property="createdBy"/>				
									</b>
								</td>
							</tr>
							
							<tr>
								<td  class="FormLabels" align="right"  colspan="1" width="160px">
									Created Date :
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="220px"><b>
									<bean:write name="factorDetail" scope="request" property="createdDate"/>				
									</b>
								</td>
							</tr>
							</table>
						</logic:present>
						
					</td>
					</tr>
				</table>
				</td>
			</tr>
	
			<tr>
				<td class="NewSectionHead" colspan="10" align="center" width="750">
				FACTOR VALUES</td>
			</tr>	
	
			<dmshtml:dms_static_with_connector ruleName='privilage'
				property='<%=new String[]{"SHOW_PRODUCT_FACTORSLIST"}%>' connector='or'
				negated="false">
		
				<tr>
					<td class="sectionhead">you don't have the privilage to access
					this page please contact administrator</td>
				</tr>
		
			</dmshtml:dms_static_with_connector>
		
			<dmshtml:dms_static_with_connector ruleName='privilage'
				property='<%=new String[]{"SHOW_PRODUCT_FACTORSLIST"}%>' connector='or'
				negated="true">		
		
				<bean:define id="arrFactorValues" name="arrFactorValues"
					type="java.util.ArrayList" />
		
				<%String[] dbColName = (String[]) arrFactorValues.get(0);
				
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
								<td class="sectionhead" width="2%" align="left">No.</td>
								<% for (int colCounter=0;colCounter<dbColName.length;colCounter++) {%>
								<td class="sectionhead" width="10%" align="left"><%=""+dbColName[colCounter]%></td>
								<%} %>
							</tr>
		
							<% int siNo=1;
							for (int i=1;i<((arrFactorValues.size()>500)?500:arrFactorValues.size());i++) 
							{
						    com.dms.ejb.data.QuestionHashMap factorqMap=(com.dms.ejb.data.QuestionHashMap)arrFactorValues.get(i); %>
							<tr>
								<td class="SearchResult" width="20%" align="left"><%=siNo++%>
								</td>
		
								<% for (int colCounter=0;colCounter<dbColName.length;colCounter++) {%>
								<td class="smallSearchResult" width="20%" align="left">
								<%String colName =dbColName[colCounter];%> <%=""+factorqMap.getString(colName)%>
		
								</td>
								<%} %>
		
							</tr>
							<%} %>
		
		
		
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
		
		
				<tr><td>	<html:hidden property="answer(Census::Excel::dbname)"
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
					<bean:define id="StartingRow" property="answer(Excel::StartingRow)"
						name="UploadFactors" scope="request" />
		
				<tr><td>	<html:hidden property="answer(Object::ProductFactors::FactorId)"
						value="<%=""+FactorId%>" />
					<html:hidden property="answer(Object::ProductFactors::FactorVerId)"
						value="<%=""+FactorVerId%>" />
		
					<html:hidden property="answer(Excel::SheetNumber)"
						value="<%=""+SheetNumber%>" />
					<html:hidden property="answer(Excel::StartingRow)"
						value="<%=""+StartingRow%>" />
		
					<html:hidden property="answer(Object::ProductFactors::dbName)"
						value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' /></td></tr>	
			
			</dmshtml:dms_static_with_connector>
	</table>
</td>
</tr>
</table>


</html:form>
