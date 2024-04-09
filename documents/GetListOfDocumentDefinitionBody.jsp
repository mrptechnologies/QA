<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td>
			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td class="NewSectionHead" colspan="9" align="center">SEARCH DOCUMENT VERSION RESULT</td>
				</tr>

				<tr><td>&nbsp;</td></tr>

				<tr><td>&nbsp;</td></tr>
				
				<tr>		 
	   				<td class="sectionhead" width="5%">Sl.No</td>
					<td class="sectionhead" width="8%">Document Name</td>				    
	   				<td class="sectionhead" width="8%">Document Type</td>
				    <td class="sectionhead" width="15%">Document Number</td>
				    <td class="sectionhead" width="15%">Release Status</td>				    
   				    <td class="sectionhead"  width="5%">Active</td>
   				    <td class="sectionhead"  width="10%">Dynamic Fields</td>
				</tr>
				
				<logic:present name='getAllVersionOfDocumentDefinition' scope="request">		
					<% int i=0; %>
					<% int count=0; %>
					
					<logic:iterate id="getAllVersionOfDocumentDefinition" name="getAllVersionOfDocumentDefinition" scope="request">
						<% count++; %>
						<tr>
							<td class="SearchResult" align="left" width="8%">
								<%=++i%>
							</td>
							
							<td class="links" align="left" width="35%">
								<a href="/GetDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Product::Document::Definition::OwnerId)=<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::OwnerId"/>&answer(Object::Product::Document::Definition::DocId)=<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::DocId"/>&answer(Object::Product::Document::Definition::VerId)=<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::VerId"/>">
									<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::DocName" />&nbsp;
								</a>
							</td>
							
							<td class="SearchResult" align="left" width="17%">
								<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::DocType" />&nbsp;
							</td>
							
							<td class="SearchResult" align="left" width="20%">
								<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::DocNum" />&nbsp;
							</td>
							
							<td class="SearchResult" align="left" width="15%">
								<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::VerReleaseStatus" />&nbsp;
							</td>							
							
							<td class="SearchResult" align="left" width="8%">
								<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::Active" />&nbsp;
							</td>							
							
							<td class="SearchResult" align="left" width="10%">
								<bean:write name="getAllVersionOfDocumentDefinition" property="Object::Product::Document::Definition::DynamicFields" />&nbsp;
							</td>
						</tr>
					</logic:iterate>
				</logic:present>
			</table>
		</td>
	</tr>
</table>