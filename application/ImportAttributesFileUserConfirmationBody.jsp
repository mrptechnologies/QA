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

<script type="text/javascript">
<!--
function validateFields(){
	var answer = window.confirm("Do you really want continue?");
	var frm = document.forms[0];
	var action = frm.action;
	var subAppId = frm.SubApplicationId.value;
	var subAppVerId = frm.SubApplicationVerId.value;
	action = ""+action+"?answer(SubApplicationId)="+subAppId+"&answer(SubApplicationVerId)="+subAppVerId;
	if (answer) {
		frm.action=action;
		frm.submit();
	}
}
//-->
</script>
<html:form action="/ImportAttributeValuesFile" enctype="multipart/form-data">

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
				<%}
			}%>
			</td>
		</tr>

		<dmshtml:dms_static_with_connector ruleName='privilage'
			property='<%=new String[]{"SYS_ADMIN"}%>' connector='or'
			negated="false">
			<tr>
				<td class="sectionhead">
				You Don't Have the Privilage to Access This Page. Please Contact Administrator.</td>
			</tr>
		</dmshtml:dms_static_with_connector>


		<dmshtml:dms_static_with_connector ruleName='privilage'
			property='<%=new String[]{"SYS_ADMIN"}%>' connector='or'
			negated="true">
			<tr>
				<td><html:hidden property="upLoadFile" value="yes" /></td>
			</tr>
			<tr>
				<td align="center">
				<table border="0" width="100%" cellspacing="2" cellpadding="2"
					style="{border-width:1px; border-style:solid; border-color: #999999;}">

					<logic:present name="ARRAY_ATTRIBUTE_VALUE_DETAILS" scope="request">
						<bean:define id="arrAttributeValuesTable" name="ARRAY_ATTRIBUTE_VALUE_DETAILS" type="java.util.ArrayList" />
						<tr>
							<td class="sectionhead" width="15%" nowrap>
								Please Specify the Default Option Value</td>
							<td class="SearchResult">
								<html:select property="answer(Object::ApplicationAttr::DefaultValue)">
								<%for(int i=0;i<arrAttributeValuesTable.size();i++) {
								com.dms.ejb.data.QuestionHashMap attributeValueMap=(com.dms.ejb.data.QuestionHashMap)arrAttributeValuesTable.get(i);	
								%>
								<html:option value='<%=attributeValueMap.getString("Object::Application::Attribute::Value")%>'>
									<%=attributeValueMap.getString("Object::Application::Attribute::DisplyValue")%>
								</html:option>
								<%}%>
							</html:select>
						</tr>
					</logic:present>
				</table>

				<table border="0" width="100%" cellspacing="2" cellpadding="2"
					style="{border-width:1px; border-style:solid; border-color: #999999;}">
					<logic:present name="arrAttributeValuesTable">

						<bean:size id="arraySize" name="ARRAY_ATTRIBUTE_VALUE_DETAILS" />

						<logic:greaterThan name="arraySize" value="0">
							<tr>
								<td class="sectionhead" colspan="11" align="center">
									Interpreted	Data View</td>
							</tr>
							<tr>
								<td align="right" colspan="11"><html:button value="Import"  property="answer(submit)" 
									styleClass="sbttn" onclick="javascript:validateFields();"/></td>
							</tr>
							<tr>
								<td class="sectionhead" width="2%" align="Left">No.</td>
								<td class="sectionhead" width="20%" align="Left">Attribute Id</td>
								<td class="sectionhead" width="15%" align="Left">Sub-Application Ver Id</td>
								<td class="sectionhead" width="15%" align="Left">Attribute Name</td>
								<td class="sectionhead" width="10%" align="Left">Display Value</td>
								<td class="sectionhead" width="10%" align="Left">Value</td>
								<td class="sectionhead" width="5%" align="Left">Sequence</td>
								<td class="sectionhead" width="30%" align="Left">Description</td>
							</tr>
							<%	int siNo=0; %>
							<logic:iterate id="excelSheetDetails" type="com.dms.ejb.data.QuestionHashMap" name="arrAttributeValuesTable">
								<tr>
									<td class="SearchResult"><%=++siNo%></td>
									<td class="SearchResult">
										<bean:write name="UploadAttributeValues" property="answer(Object::ApplicationAttr::AttributeId)" /></td>
									<td class="SearchResult">
										<bean:write name="UploadAttributeValues" property="answer(Object::Application::SubApplicationVerId)" /></td>
									<td class="SearchResult">
										<bean:write name="UploadAttributeValues" property="answer(Object::ApplicationAttr::AttributeName)" /></td>
									<td class="SearchResult">
										<%=excelSheetDetails.getString("Object::Application::Attribute::DisplyValue")%></td>
									<td class="SearchResult">
										<%=excelSheetDetails.getString("Object::Application::Attribute::Value")%></td>
									<td class="SearchResult">
										<%=excelSheetDetails.getString("Object::Application::Attribute::Sequence")%></td>
									<td class="SearchResult">
										<%=excelSheetDetails.getString("Object::Application::Attribute::Description")%></td>
								</tr>
							</logic:iterate>

							<tr>
								<td align="right" colspan="11"><html:button property="answer(submit)" value="Import"
									styleClass="sbttn" onclick="javascript:validateFields();"/></td>
							</tr>
						</logic:greaterThan>
					</logic:present>
				</table>
				</td>
			</tr>

			<tr>
				<td>
					<html:hidden property="answer(Object::ApplicationAttr::AttributeId)"/>
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
								
					<html:hidden property="answer(objectId)" />
					<html:hidden property="answer(objectVerId)" />
					<html:hidden property="answer(ImportType)"/>
					<html:hidden property="answer(excelFileName)"/>
					<html:hidden property="answer(propertyFileName)"/>
					<html:hidden property="answer(AttributeValues::Excel::ConfirmImport)" value="Yes"/>


					<html:hidden property="answer(Excel::SheetNumber)"/>
					<html:hidden property="answer(Excel::StartingRow)"/>
					
					<bean:define id="subAppVerId" name="UploadAttributeValues" property="answer(Object::Application::SubApplicationVerId)"/>
					<html:hidden styleId="SubApplicationVerId" property="answer(SubApplicationVerId)" value="<%=""+subAppVerId %>"/>
					<bean:define id="subAppId" name="UploadAttributeValues" property="answer(Object::Application::SubApplicationId)"/>
					<html:hidden styleId="SubApplicationId" property="answer(SubApplicationId)" value="<%=""+subAppId %>"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" /></td>
			</tr>

		</dmshtml:dms_static_with_connector>
	</table>

</html:form>
