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

<html:form action="/ImportOptionsFileUserConfirmation" enctype="multipart/form-data" >
<table width="760px" align="center" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="20"></td></tr>
<tr>
	<td class="NewSectionHead" align="center">IMPORT OPTION VALUES</td></tr>
<tr>
	<td height="8px"></td></tr>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="false">	
<tr>
	<td class="sectionhead">
		You Don't Have the Privilage to Access This Page. Please Contact Administrator.</td></tr>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">


<tr><td align="center">
	<table width="70%" align="center" border="0" cellspacing="3" cellpadding="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">	
	<tr>
		<td  colspan="2" align="right">
		<html:submit value="Validate Excel"  styleClass="sbttn"/></td></tr>
	<tr>
		<td align="left" class="FormLabels" height="25">Select Excel Tab/Sheet To Import</td>
		<td class="links" align="left">
			<bean:define id="sheetNamesMap" name="SheetNamesInExcel" type="com.dms.ejb.data.QuestionHashMap"/>
			<html:select property="answer(Excel::SheetNumber)" >
			<%	int i=0;
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
			</html:select></td></tr>
	<tr>
		<td align="left" class="FormLabels" height="25">
			Enter Starting Row # of the data in the Excel</td>
		<td class="links"><dmshtml:dms_text   property ="answer(Excel::StartingRow)"  name="UploadOptions" size="3" maxlength="3" styleClass="txtbox" value="2"/></td></tr>



	<tr>
		<td  align="right" colspan="2">
			<html:submit value="Validate Excel"  styleClass="sbttn"/></td></tr>
	</table>
	</td></tr>
<tr><td colspan="6" >&nbsp;</td></tr>

<!--html:hidden property="upLoadFile" value="yes"/-->
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="excelFileName" property="answer(Options::Excel::FileName)" name="UploadOptions"/>
<tr><td>
<html:hidden property="answer(ImportType)" value="IMPORT_OPTIONS_FILE" />
<html:hidden property="userName" value="<%=userName.toString()%>" />
<html:hidden property="answer(excelFileName)" value="<%=""+excelFileName%>"/>
<html:hidden property="answer(propertyFileName)"/>
<html:hidden property="answer(Options::Excel::ConfirmImport)" value="No"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="answer(Census::Excel::dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
<html:hidden property="answer(Object::ProductOptions::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />


<html:hidden property="answer(Object::ProductOptions::OptionName)"/>
<html:hidden property="answer(Object::ProductOptions::OptionVerNum)"/>
<html:hidden property="answer(Object::ProductOptions::OptionDesc)"/>
<html:hidden property="answer(Object::ProductOptions::Rated)"/>
<html:hidden property="answer(Object::ProductOptions::OptionType)"/>
<html:hidden property="answer(Object::ProductOptions::DefaultOptionValue)"/>

<html:hidden property="answer(Object::ProductOptions::OptionId)"/>
<html:hidden property="answer(Object::ProductOptions::OptionVerId)"/>
<html:hidden property="answer(Object::ProductOptions::ProductId)"/>
<html:hidden property="answer(Object::ProductOptions::ProductVerId)"/>

<html:hidden property="answer(Object::ProductOptions::OptionState)"/>
<html:hidden property="answer(Object::ProductOptions::DefaultOptionValue)"/>
<html:hidden property="answer(Object::ProductOptions::OptionSequenceNumber)"/>
<html:hidden property="answer(Object::ProductOptions::OptionGroupNumber)"/>
<html:hidden property="answer(Object::ProductOptions::Active)"/>
<html:hidden property="answer(objectId)" />
<html:hidden property="answer(objectVerId)" />


<html:hidden property="answer(Object::ProductOptions::CreatedBy)" value="<%=""+userName%>"/></td></tr>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</dmshtml:dms_static_with_connector>
</table>

</html:form>
