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



<html:form action="/SearchAlertDefinitionAction.do">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr><td height="10"></td></tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">FIND ALERT DEFINITION</td>
		</tr>
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="sectionhead" colspan ="2" align="center" >ALERT DEFINITION SEARCH CRITERIA</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="FormLabels">
							Alert Name
						</td> 
						<td align="left" >
							<html:text  property="answer(Object::Alert::Definition::AlertName)" styleClass="txtbox" styleId="AlertName"/>
						</td>
					</tr>
					<dmshtml:get_Document_Type nameInSession="documentTypeList" ownerId="<%= ""+ownerId %>"
													dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<logic:present name="documentTypeList">
						<tr>
							<td width="35%" class="FormLabels" align="right">Alert Type *</td>
							<td class="links">
								<html:select property="answer(Object::Alert::Definition::AlertType)" styleId="AlertType"  styleClass="txtbox" >
								<html:option value ="">Select</html:option>
										<%
											java.util.ArrayList documentType = (java.util.ArrayList)request.getAttribute("documentTypeList");
											for(int documentIndex = 0 ; documentIndex < documentType.size() ; documentIndex++) {
												com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) documentType.get(documentIndex);
										%>
										
										<html:option value="<%=qMap.getString("Object::Product::Document::Type::DocType")%>">
											<%=qMap.getString("Object::Product::Document::Type::DocType")%>
										</html:option>
										<% } %>
								</html:select>
							</td>
						</tr>
					</logic:present>				
					<tr>
						<td width="30%" class="FormLabels" align="right">Document Number</td>
						<td class="links"><html:text  property ="answer(Object::Product::Document::Definition::DocNum)"  size="8" maxlength="8" styleClass="txtbox" styleId="DocNum"/></td>
					</tr>
																											
					<tr>
						<td width="35%" class="FormLabels" align="right">Release Status</td>
						<td class="links">
							<html:select property="answer(Object::Product::Document::Definition::ReleaseStatus)" styleId="ReleaseStatus" styleClass="txtbox">
									<html:option value ="">Select</html:option>
									<html:option value ="Development">Development</html:option>
								<html:option value ="Released">Released</html:option>
								<html:option value ="QA">QA</html:option>
							</html:select>
						</td>
					</tr>					
										
					<tr>
						<td width="40%" align="right" class="FormLabels">Active</td> 
						<td align="left" >
							<html:select  property="answer(Object::Product::Document::Definition::Active)"  styleId="Active" styleClass="txtbox">
								<html:option value="Y">Active</html:option>
								<html:option value="D">Inactive</html:option>
							</html:select></td>
					</tr>
									
					<tr><td>&nbsp;</td></tr>
					<tr>
							<td colspan="2" align="center" >
							<html:submit value="Find" property="Search" styleClass="sbttn"/>
							&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
					</tr>
					
					<tr>
						<td>							
							<html:hidden property="answer(dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext) %>' />
							<html:hidden property="answer(Object::Product::Document::OwnerId)" value="<%= ""+ownerId %>" />
							<html:hidden styleId="intPageNum" property="answer(Object::Product::Document::Definition::PageNum)" value="0"/>
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						</td>
					</tr>					
				</table>			
			</td>
		</tr>
	</table>
</html:form>
