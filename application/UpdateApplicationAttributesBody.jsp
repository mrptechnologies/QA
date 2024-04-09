<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<% String subAppVerId = "0"; %>
	<html:form action="/UpdateAppAttributes">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="0">

		<tr>
			<td>
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2"
				CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<logic:present name="staleDataSubmissionMsg" scope="request">
					<tr>
						<td class="Error"><bean:message
							key="error.staleDataSubmissionMsg" /></td>
					</tr>
				</logic:present>

				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
				<!--  bean:define id="subAppVerId"
					property="answer(Object::Application::SubApplicationVerId)" name="AddApplication"
					scope="request" /-->
				<!-- bean:define id="attributeId"
					property="answer(Object::ApplicationAttr::AttributeId)" name="AddApplication"
					scope="request" /-->


					<%if(request.getParameter("answer(Object::ApplicationAttr::AttributeId)")!= null) {
														%>
	<tr><TD>
	<html:hidden property="answer(Object::ApplicationAttr::AttributeId)"
		value="<%=request.getParameter("answer(Object::ApplicationAttr::AttributeId)").toString()%>" />
		<html:hidden property="answer(AttributeId)"
		value="<%=request.getParameter("answer(Object::ApplicationAttr::AttributeId)").toString()%>" />
		
		</TD></tr>

	<%
}
%>
<%if(request.getParameter("answer(Object::Application::SubApplicationVerId)")!= null) {
	subAppVerId=request.getParameter("answer(Object::Application::SubApplicationVerId)").toString();
	%>
	<tr><td><html:hidden property="answer(Object::Application::SubApplicationVerId)"
		value="<%=request.getParameter("answer(Object::Application::SubApplicationVerId)").toString()%>" /></td></tr>
	<%
}
%>
<%if(request.getParameter("answer(attrName)")!= null) {%>
	<tr><td><html:hidden property="answer(attrName)"
		value="<%=request.getParameter("answer(attrName)").toString()%>" /></td></tr>

	<%
}
%>


				<tr>
					<td height="5"></td>
			</tr>
	
				<tr>
					<td class="NewSectionHead" align="center">UPDATE APPLICATION ATTRIBUTES</td>
				</tr>


				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>
					<hr size="1" noshade>
					</td>
				</tr>
	
				<tr>
					<td align="center">

				<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="2">
						<tr>
							<td align="center" class="sectionhead" colspan="2">&nbsp;
							ATTRIBUTE DETAILS </td>

						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr><td class="links" colspan="2">
						<%if (!request.getParameter("answer(Object::ApplicationAttr::AttributeId)").toString().equals(""))
						{
						%>
	<a href="/GetAttributeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(AttributeId)=<%=request.getParameter("answer(Object::ApplicationAttr::AttributeId)").toString()%>"><%=request.getParameter("answer(attrName)").toString()%></a>
<%} %>

	</td></tr>
	<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td class="FormLabels" align="left">Display Type</td>
							<td class="TextMatter" align="left">
							<html:select property="answer(Object::ApplicationAttr::DisplayType)" 
							 styleClass="TextField">
							<html:option value=' '>Select</html:option>
							<html:option value='TEXTBOX'>Textbox</html:option>
							<html:option value='TEXTBOXWITHFIND'>TextboxWithFind</html:option>
							<html:option value='TextArea'>TextArea</html:option>
							<html:option value='Select'>Dropdown</html:option>
							<html:option value='CHECKBOX'>Checkbox</html:option>
							<html:option value='Radio'>Radio Button</html:option>
							<html:option value='LISTBOX'>List Box</html:option>
							<html:option value='Label'>Label</html:option>
							<html:option value='Hidden'>Hidden</html:option>
							<html:option value='Button'>Button</html:option>
						</html:select>
	</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">Default Value</td>
							<td class="TextMatter" align="left">
								<html:text property="answer(Object::ApplicationAttr::DefaultValue)" size="15"
								maxlength="30" styleClass="txtbox" /></td>

						</tr>

						<tr>
				<td class="FormLabels" align="left">is Mandatory</td>

	<td class="TextMatter">
			<dmshtml:dms_radio property = "answer(Object::ApplicationAttr::Mandatory)" value="Y" >
			Yes
			</dmshtml:dms_radio>
			&nbsp;&nbsp;&nbsp;
			<dmshtml:dms_radio property = "answer(Object::ApplicationAttr::Mandatory)" value="N" >
			No
			</dmshtml:dms_radio>
		</td>
		</tr>

		<tr>
				<td class="FormLabels" align="left">is Enabled</td>

	<td class="TextMatter">
			<dmshtml:dms_radio property = "answer(Object::ApplicationAttr::Enabled)" value="Y" >
			Yes
			</dmshtml:dms_radio>
			&nbsp;&nbsp;&nbsp;
			<dmshtml:dms_radio property = "answer(Object::ApplicationAttr::Enabled)" value="N" >
			No
			</dmshtml:dms_radio>
		</td>
		</tr>

								<tr>
							<td class="FormLabels" align="left">Table Index</td>
							<td class="TextMatter" align="left">
								<html:text property="answer(Object::ApplicationAttr::TableIndex)" size="5"
								maxlength="30" styleClass="txtbox" /></td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">Row Index</td>
							<td class="TextMatter" align="left">
								<html:text property="answer(Object::ApplicationAttr::RowIndex)" size="5"
								maxlength="30" styleClass="txtbox" /></td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">Column Index</td>
							<td class="TextMatter" align="left">
								<html:text property="answer(Object::ApplicationAttr::ColumnIndex)" size="5"
								maxlength="30" styleClass="txtbox" /></td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">Table Heading</td>
							<td class="TextMatter" align="left">
							<dmshtml:dms_textarea property="answer(Object::ApplicationAttr::TableHeading)" rows="4" cols="30"/>
							</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">Row Heading</td>
							<td class="TextMatter" align="left">
							<dmshtml:dms_textarea property="answer(Object::ApplicationAttr::RowHeading)" rows="4" cols="30"/>
							</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">Column Heading</td>
							<td class="TextMatter" align="left">
							<html:text property="answer(Object::ApplicationAttr::ColumnHeading)" size="60"
								styleClass="txtbox" /></td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">OnKeyUpJavascript</td>
							<td class="TextMatter" align="left">
							<dmshtml:dms_textarea property ="answer(Object::ApplicationAttr::OnKeyUpJavascript)"   rows="2" cols="30"/>
							</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">OnBlurJavaScript</td>
							<td class="TextMatter" align="left">
							<dmshtml:dms_textarea property ="answer(Object::ApplicationAttr::OnBlurJavaScript)"   rows="2" cols="30"/>
							</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">OnChangeJavaScript</td>
							<td class="TextMatter" align="left">
							<dmshtml:dms_textarea property ="answer(Object::ApplicationAttr::OnChangeJavaScript)"   rows="2" cols="30"/>
							</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">OnClickJavaScript</td>
							<td class="TextMatter" align="left">
							<dmshtml:dms_textarea property ="answer(Object::ApplicationAttr::OnClickJavaScript)"   rows="2" cols="30"/>
							</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">AltJavaScript</td>
							<td class="TextMatter" align="left">
							<dmshtml:dms_textarea property ="answer(Object::ApplicationAttr::AltJavaScript)"   rows="2" cols="30"/>
							</td>

						</tr>

						<tr>
							<td class="FormLabels" align="left">Style Class</td>
							<td class="TextMatter" align="left">
								<html:text property="answer(Object::ApplicationAttr::StyleClass)" size="15"
								maxlength="30" styleClass="txtbox" /></td>

						</tr>


						<tr>
							<td class="FormLabels" width="25%" nowrap>
								Table Name
							</td>
							<td class="TextMatter">
								<html:text 
								property="answer(Object::Application::ApplicationTableName)"
								 styleClass="txtbox" size="60" maxlength="120" />
							</td>

						</tr>

						<tr>
							<td class="FormLabels" width="25%" nowrap>
								Column Name
							</td>
							<td class="TextMatter">
								<html:text 
								property="answer(Object::ApplicationAttr::AttrColName)"
								 styleClass="txtbox" size="60" maxlength="120"/>
							</td>

						</tr>
						<logic:present name="ATTRIBUTE_VALUE_LIST" scope="request">
						<bean:define id="attributeValueList" name="ATTRIBUTE_VALUE_LIST" type="java.util.ArrayList" scope="request" />
						<tr>
							<td class="FormLabels" width="25%" nowrap>
								Attribute Values
							</td>
							<td class="TextMatter">
								<table border="0">
									<td class="sectionhead">#</td>
									<td class="sectionhead">Display Value</td>
									<td class="sectionhead">Value</td>
									<td class="sectionhead">Description</td>
									<td class="sectionhead">Sequence</td>
									<% int sNo = 0; %>
									<logic:iterate id="attributeValueDetail" name="attributeValueList" type="com.dms.ejb.application.disply.PRDAttributeValueDetail">
									<tr>
										<td class="SearchResult"><%=""+(++sNo) %></td>
										<td class="SearchResult"><bean:write name="attributeValueDetail" property="displyValue"/></td>
										<td class="SearchResult"><bean:write name="attributeValueDetail" property="value"/></td>
										<td class="SearchResult"><bean:write name="attributeValueDetail" property="description"/></td>
										<td class="SearchResult"><bean:write name="attributeValueDetail" property="sequence"/></td>
									</tr>
									</logic:iterate>
								</table>
							</td>

						</tr>
						</logic:present>
						
						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td align="center" colspan="2"><html:submit value="Save"
								property="answer(button)" styleClass="sbttn"
								onmouseover="this.style.color='#FF0D25';"
								onmouseout="this.style.color='#0042B0';" /> &nbsp;&nbsp;&nbsp;
							</td>
						</tr>

					</table>
					</td></tr>
					</table>
					</td>
					</tr>
		<bean:define id="userName"
			property="answer(Object::UserDetail::userName)" name="LoginPage"
			scope="session" />
		<tr><td><html:hidden property="answer(Object::ApplicationAttr::UpdatedBy)"
			value="<%=""+userName%>" /></td></tr>

					</table>
					<html:hidden property="answer(level)" value="appVerLevel"/>
					<html:hidden property="answer(Object::Application::SubApplicationId)"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
											</html:form>
					
<br/>
<br/>
<br/>
<!-- ####################################################################### -->

<logic:present name="PRDAttributeDetail" scope="request">
<table cellspacing="0" border="0">
	<tr>
		<td align="center">
			<bean:define id="userName"
				property="answer(Object::UserDetail::userName)" name="LoginPage"
				scope="session" />
		<html:form action="/UploadAttributes" enctype="multipart/form-data">
			<table border="0" width="10%" cellspacing="2" cellpadding="2"
				style="{border-width:1px; border-style:solid; border-color: #999999;}">
				<tr>
					<td><html:hidden property="answer(Object::ApplicationAttr::AttributeId)"/>
						<html:hidden property="answer(Object::Application::SubApplicationVerId)" value="<%=subAppVerId.toString() %>"/>
						<html:hidden property="answer(Object::ApplicationAttr::ApplicationVerId)"/>
						<html:hidden property="answer(Object::ApplicationAttr::AttributeName)" value="<%=request.getParameter("answer(attrName)").toString()%>"/>
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
						<html:hidden property="answer(Object::ApplicationAttr::OnKeyUpJavascript)"/>
						<html:hidden property="answer(Object::ApplicationAttr::OnBlurJavaScript)"/>
						<html:hidden property="answer(Object::ApplicationAttr::OnChangeJavaScript)"/>
						<html:hidden property="answer(Object::ApplicationAttr::OnClickJavaScript)"/>
						<html:hidden property="answer(Object::ApplicationAttr::AltJavaScript)"/>
						<html:hidden property="answer(Object::ApplicationAttr::StyleClass)"/>
						<html:hidden property="answer(Object::ApplicationAttr::CreatedBy)" value="<%=""+userName%>"/>
						<html:hidden property="answer(Object::ApplicationAttr::UpdatedBy)" value="<%=""+userName%>"/>
						<html:hidden property="answer(Object::ApplicationAttr::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
						<html:hidden property="answer(Object::ApplicationAttr::Values)"/>
						
						<html:hidden property="answer(userName)" value="<%=userName.toString()%>" />
						<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
						<html:hidden property="answer(Census::Excel::dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/></td>
				</tr>
				<tr>
					<td class="sectionhead" colspan="2" align="center">IMPORT ATTRIBUTE VALUES SPREADSHEET</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels" nowrap align="left">
						Select Options file (.xls) to import :</td>
					<td><html:file property="myFile" styleClass="txtbox" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<html:submit value="Upload"	styleClass="sbttn" /></td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td>
						<bean:define id="attributeId" name="UploadAttributeValues" property="answer(Object::ApplicationAttr::AttributeId)"/>
						<bean:define id="subApplicationVerId" name="UploadAttributeValues" property="answer(Object::Application::SubApplicationVerId)"/>

						<html:hidden property="answer(ImportType)" value="UPLOAD_FILE" />
						<html:hidden property="answer(propertyFileName)" value="/application/AttributeValueImport"/></td>
						<html:hidden property="answer(objectId)" value="<%=attributeId.toString()%>"/>
						<html:hidden property="answer(objectVerId)" value="<%=subApplicationVerId.toString()%>"/>
						<html:hidden property="answer(Object::Application::SubApplicationId)"/>
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				</tr>
			</table>
		</html:form></td>
	</tr>
	<tr>
	<td>
		&nbsp;
	</td>
</tr>
</table>
</logic:present>