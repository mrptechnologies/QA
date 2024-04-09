<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<% String PrdId = request.getParameter("answer(Object::Product::Document::PrdId)"); %>
<% String PrdVerId = request.getParameter("answer(Object::Product::Document::PrdVerId)"); %>
<% String Active = request.getParameter("answer(Object::Product::Document::Definition::Active)"); %>
<% String DocType = request.getParameter("answer(Object::Product::Document::Definition::DocType)"); %>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr><td height="10"></td></tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">DOCUMENT VERSION LIST</td>
	</tr>
	<tr>
		<td height="15"></td>
	</tr>
	<tr><td>
		<dmshtml:get_Product_Document_List  nameInSession="issuancePrdDocumentList" 
			documentType="ISSUANCE" productId="<%=""+PrdId%>" 
			productVersionId="<%=""+PrdVerId %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"
			 ownerId="<%=""+ownerId%>" />			 
	</td></tr>
	
	<tr>
		<td>
			<table width="880px" ALIGN="center" BORDER="0" style="{border-width:1px; border-style:solid; border-color: #999999;}">
				<tr>
					<td class="sectionheadLink" width="2%" align="center">Sl.No</td>
					<td class="sectionheadLink" width="5%" align="center">Document Number</td>						
					<td class="sectionheadLink" width="50%" align="center">Document Name</td>						
					<td class="sectionheadLink" align="center">Order Index</td>
					<td class="sectionheadLink" align="center">Dynamic Field</td>
					<td class="sectionheadLink" align="center">Repeated Index</td>
					<td class="sectionheadLink" align="center">Rule Name</td>			
					<td class="sectionheadLink" align="center">Associated</td>	
				</tr>
				
				<logic:present name="issuancePrdDocumentList">
					<%int index=0; %>
					<%int count=0; %>
								
				  <logic:iterate id="PrdDocumentList" name="issuancePrdDocumentList" scope="request">
           			 <bean:define id='documentId' name="PrdDocumentList" property="documentId"/>
						<%++index; %>
						<% ++count; %>
						<%String styleClass="" ;
						if(count%2==0){
							styleClass = "altdisply";
						}else {
							styleClass = "SearchResult";	
						}
					%>		
					<dmshtml:getDocumentVersionListByDocumentType nameInSession="issuancePrdDocVersionList" documentId="<%=""+documentId %>" 
						ownerId="<%=""+ownerId %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
						<logic:present name="issuancePrdDocVersionList" scope="request">							
							<logic:iterate id="issuancePrdDocVersionList" name="issuancePrdDocVersionList" scope="request">
								<tr>
									<td class=<%= styleClass %>><%= index %></td>
									<td class=<%= styleClass %>>
										<a href="/product/AddMoreDetailForPrdDocVer.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::Document::PrdId)=<%=PrdId%>&answer(Object::Product::Document::PrdVerId)=<%=PrdVerId%>&answer(Object::Product::Document::DocVerId)=<bean:write name="issuancePrdDocVersionList" property="Object::Product::Document::Definition::VerId"/>&answer(Object::Product::Document::DocId)=<bean:write name="issuancePrdDocVersionList" property="Object::Product::Document::Definition::DocId"/>&answer(Object::Product::Document::Definition::DocType)=<%=DocType%>">
											<bean:write name="issuancePrdDocVersionList" property="Object::Product::Document::Definition::DocNum" />&nbsp;
										</a>
									</td>
									<td class=<%= styleClass %>>
										<bean:write name="issuancePrdDocVersionList" property="Object::Product::Document::Definition::VerName" />&nbsp;
									</td>								
									
								</tr>			
							</logic:iterate>
						</logic:present>
				  </logic:iterate>				  
				</logic:present>  							
			</table>
		</td>
	</tr>
</table>