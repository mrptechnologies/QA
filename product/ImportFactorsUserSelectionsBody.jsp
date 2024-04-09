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

<html:form action="/ImportFactorsUserConfirmation" enctype="multipart/form-data" >
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr>
				<td>&nbsp;</td></tr>
				
				<tr>
					<td class="MH">&nbsp;OPTIONS IMPORT
					</td>
				</tr>		

				<tr>
					<td colspan="4"><hr size="1" noshade >
					</td>
				</tr>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="false">	

<tr><td class="sectionhead">you don't have the privilage to access this page please contact administrator</td></tr>

</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">	


<tr><td>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/></td></tr>

<!-- <tr><td class="NewSectionHead" colspan ="2" align="center" >Census Import </td></tr> -->

<tr><td>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="3" CELLPADDING="0">	


			

				<tr><td>&nbsp;</td></tr>

<tr>

		<td  align="Left">
		<html:submit value="View Data"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
		&nbsp;&nbsp;&nbsp;
	</td>
	</tr>


	

	<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Select Excel Tab/Sheet To Import</td>
		
		<td class="links" align="left">
		<bean:define id="sheetNamesMap" name="SheetNamesInExcel" type="com.dms.ejb.data.QuestionHashMap"/>
			<html:select property="answer(Excel::SheetNumber)" >
				<%int i=0;
				boolean MoreSheets=true; 
				String SheetName="";
				while (MoreSheets) {
				SheetName=sheetNamesMap.getString("sheet"+i);%>
				<%if(!SheetName.equals("")) {%>
					<html:option value ='<%=""+i%>'><%=SheetName%></html:option>
				<%} else {
					MoreSheets=false;
				}%>
				
				<%
				i++;	
				}%>
				
			</html:select>
			
	
		</td>
								
</tr>

<tr>
		<td align="left" class="FormLabels" height="25" width="50%">Enter Starting Row # of the data in the Excel</td>
		
		<td class="links"><dmshtml:dms_text   property ="answer(Excel::StartingRow)"  name="UploadFactors" size="3" maxlength="3" styleClass="txtbox" value="2"/></td>
	
								
</tr>

<tr>
									<td class="FormLabels" align="left" height="25">Import All Sheets</td>
									<td class="TextMatter"><dmshtml:dms_checkbox name="UploadFactors"
										property="answer(Excel::ImportAllSheets)" value="Yes" />
									</td>
								</tr>					

<tr>

		<td  align="Left">
		<html:submit value="View Data"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
		&nbsp;&nbsp;&nbsp;
	</td>
	</tr>
</table>
</td></tr>
<tr><td colspan="6" >&nbsp;</td></tr>

	
<tr><td><html:hidden property="upLoadFile" value="yes"/></td></tr>



<tr><td colspan="6" >&nbsp;</td></tr>



<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="excelFileName" property="answer(Options::Excel::FileName)" name="UploadFactors" scope="request"/>
<bean:define id="propertyFileName" property="answer(propertyFileName)" name="UploadFactors"/>

<tr><td>
<html:hidden property="answer(Census::Excel::dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />


<html:hidden property="answer(Census::Excel::ConfirmImport)" value="No" />
<html:hidden property="answer(ImportType)" value="IMPORT_FACTOR_FILE" />
<html:hidden property="userName" value="<%=userName.toString()%>" />
<html:hidden property="answer(excelFileName)" value="<%=""+excelFileName%>"/>
<html:hidden property="answer(propertyFileName)" value="<%=""+propertyFileName%>"/>

<bean:define id="FactorId" property="answer(Object::ProductFactors::FactorId)" name="UploadFactors" scope="request" /> 
<bean:define id="FactorVerId" property="answer(Object::ProductFactors::FactorVerId)" name="UploadFactors" scope="request" /> 
	
<html:hidden property="answer(Object::ProductFactors::FactorId)" value="<%=""+FactorId%>"/>
<html:hidden property="answer(Object::ProductFactors::FactorVerId)" value="<%=""+FactorVerId%>"/>
<html:hidden property="answer(objectId)" value="<%=""+FactorId%>"/>
<html:hidden property="answer(objectVerId)" value="<%=""+FactorVerId%>"/></td></tr>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

</dmshtml:dms_static_with_connector>
</table>

</html:form>
