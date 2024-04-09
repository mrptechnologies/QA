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

<html:form action="/ImportAttributesFileUserConfirmation"
	enctype="multipart/form-data">


	<table width="100%" align="center" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td height="20"></td>
		</tr>
		<tr>
			<td class="NewSectionHead" align="center">IMPORT ATTRIBUTE VALUES</td>
		</tr>
		<tr>
			<td height="8px"></td>
		</tr>

		<dmshtml:dms_static_with_connector ruleName='privilage'
			property='<%=new String[]{"SYS_ADMIN"}%>' connector='or'
			negated="false">
			<tr>
				<td class="sectionhead">You Don't Have the Privilage to Access This Page. Please Contact Administrator.</td>
			</tr>
		</dmshtml:dms_static_with_connector>

		<dmshtml:dms_static_with_connector ruleName='privilage'
			property='<%=new String[]{"SYS_ADMIN"}%>' connector='or'
			negated="true">


			<tr>
				<td align="center">
				<table width="70%" align="center" border="0" cellspacing="3"
					cellpadding="0"
					style="{border-width:1px; border-style:solid; border-color: #999999;}">
					<tr>
						<td colspan="2" align="right">
							<html:submit value="Validate Excel" styleClass="sbttn" /></td>
					</tr>
					<tr>
						<td align="left" class="FormLabels" height="25">Select Excel Tab/Sheet To Import</td>
						<td class="links" align="left">
							<bean:define id="sheetNamesMap" name="SheetNamesInExcel"
								type="com.dms.ejb.data.QuestionHashMap" />
							<html:select property="answer(Excel::SheetNumber)">
							<%	int i=0;
								boolean MoreSheets=true; 
								String SheetName="";
								while (MoreSheets) {
									SheetName=sheetNamesMap.getString("sheet"+i);%>
									<%if(!SheetName.equals("")) {%>
									<html:option value='<%=""+i%>'>
										<%=SheetName%>
									</html:option>
									<%} else {
										MoreSheets=false;
									}%>
								<%
								i++;	
								}%>
							</html:select></td>
					</tr>
					<tr>
						<td align="left" class="FormLabels" height="25">
							Enter Starting Row # of the data in the Excel</td>
						<td class="links">
							<dmshtml:dms_text property="answer(Excel::StartingRow)" name="UploadAttributeValues"
							size="3" maxlength="3" styleClass="txtbox" value="2" /></td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<html:submit value="Validate Excel" styleClass="sbttn" /></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td colspan="6">&nbsp;</td>
			</tr>

			<tr>
				<td><html:hidden property="answer(Object::ApplicationAttr::AttributeId)"/>
					<html:hidden property="answer(Object::Application::SubApplicationVerId)"/>
					<html:hidden property="answer(Object::ApplicationAttr::ApplicationVerId)"/>
					<html:hidden property="answer(Object::ApplicationAttr::AttributeName)"/>
					<html:hidden property="answer(Object::ApplicationAttr::AttributeDesc)"/>
					<html:hidden property="answer(Object::ApplicationAttr::DataLength)"/>
					<html:hidden property="answer(Object::ApplicationAttr::DataType)"/>
					<html:hidden property="answer(Object::ApplicationAttr::MinValue)"/>
					<html:hidden property="answer(Object::ApplicationAttr::MaxValue)"/>
					<html:hidden property="answer(Object::ApplicationAttr::NullOrEmpty)"/>
					<html:hidden property="answer(Object::ApplicationAttr::ValidationScript)"/>
					<html:hidden property="answer(Object::ApplicationAttr::RuleName)"/>
					<html:hidden property="answer(Object::ApplicationAttr::RuleType)"/>
					<html:hidden property="answer(Object::ApplicationAttr::EventFired)"/>
					<html:hidden property="answer(Object::ApplicationAttr::AttrColName)"/>
					<html:hidden property="answer(Object::ApplicationAttr::DisplayType)"/>
					<html:hidden property="answer(Object::ApplicationAttr::DefaultValue)"/>
					<html:hidden property="answer(Object::ApplicationAttr::Enabled)"/>
					<html:hidden property="answer(Object::ApplicationAttr::Mandatory)"/>
					<html:hidden property="answer(Object::ApplicationAttr::TableIndex)"/>
					<html:hidden property="answer(Object::ApplicationAttr::RowIndex)"/>
					<html:hidden property="answer(Object::ApplicationAttr::ColumnIndex)"/>
					<html:hidden property="answer(Object::ApplicationAttr::TableHeading)"/>
					<html:hidden property="answer(Object::ApplicationAttr::RowHeading)"/>
					<html:hidden property="answer(Object::ApplicationAttr::ColumnHeading)"/>
					<html:hidden property="answer(Object::ApplicationAttr::Javascript)"/>
					<html:hidden property="answer(Object::ApplicationAttr::StyleClass)"/>
					<html:hidden property="answer(Object::ApplicationAttr::CreatedBy)"/>
					<html:hidden property="answer(Object::ApplicationAttr::UpdatedBy)"/>
					<html:hidden property="answer(Object::ApplicationAttr::dbName)"/>
					<html:hidden property="answer(Object::ApplicationAttr::Values)"/>
							
					<html:hidden property="answer(userName)"/>
					<html:hidden property="answer(dbname)"/>
					<html:hidden property="answer(Census::Excel::dbname)"/>
					
					<bean:define id="excelFileName" name="UploadedFileName" />
								
					<html:hidden property="answer(objectId)" />
					<html:hidden property="answer(objectVerId)" />
					<html:hidden property="answer(ImportType)" value="IMPORT_ATTRIBUTE_VALUES_FILE" />
					<html:hidden property="answer(excelFileName)" value="<%=""+excelFileName%>"/>
					<html:hidden property="answer(propertyFileName)"/>

					<html:hidden property="answer(AttributeValues::Excel::ConfirmImport)" value="No"/>
					
					<html:hidden property="answer(Object::Application::SubApplicationId)"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" /></td>
			</tr>
		</dmshtml:dms_static_with_connector>
	</table>

</html:form>
