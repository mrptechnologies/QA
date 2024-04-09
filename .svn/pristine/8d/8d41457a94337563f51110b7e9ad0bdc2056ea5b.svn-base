<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="documentId" name='AddDocumentDefinition' property='answer(Object::Product::Document::Definition::DocId)'  scope="request"/>
<bean:define id="documentVerId" name='AddDocumentDefinition' property='answer(Object::Product::Document::Definition::VerId)' scope="request"/>
<bean:define id="currentVerId" name='AddDocumentDefinition' property='answer(Object::Product::Document::Definition::CurrentVerId)' scope="request"/>
<bean:define id="documentStatus" name='AddDocumentDefinition' property='answer(Object::Product::Document::Definition::ReleaseStatus)' scope="request"/>
<bean:define id="VerReleaseStatus" name='AddDocumentDefinition' property='answer(Object::Product::Document::Definition::VerReleaseStatus)' scope="request"/>
<bean:define id="VerCreatedDate" name="AddDocumentDefinition" property="answer(Object::Product::Document::Definition::VerCreatedDate)" scope="request" />

<bean:define id="CreatedDate" name="AddDocumentDefinition" property="answer(Object::Product::Document::Definition::CreatedDate)" scope="request" />
<bean:define id="UpdatedDate" name="AddDocumentDefinition" property="answer(Object::Product::Document::Definition::UpdatedDate)" scope="request" />

<bean:define id="ReleaseDate" property="answer(Object::Product::Document::Definition::ReleaseDate)" name="AddDocumentDefinition" />
<bean:define id="ExpDate" property="answer(Object::Product::Document::Definition::ExpDate)" name="AddDocumentDefinition" />
	<%
		String releaseStatus = ""+ReleaseDate;
		String expStatus = ""+ExpDate;
		String arrReleaseStatus[]=null;
		String arrExpStatus[] =null;
		String releaseMonth = "";
		String releaseDate = "";
		String releaseYear = "";
		
		String expMonth = "";
		String expDate = "";
		String expYear = "";
		
		if(!releaseStatus.equals("")){
			if(!expStatus.equals("")){
				arrReleaseStatus = releaseStatus.split("/");
				arrExpStatus = expStatus.split("/");
				
				releaseMonth = arrReleaseStatus[0];
				releaseDate = arrReleaseStatus[1];
				releaseYear = arrReleaseStatus[2];
				
				expMonth = arrExpStatus[0];
				expDate = arrExpStatus[1];
				expYear = arrExpStatus[2];
			}	
		}
	%>

<% boolean parentDocDetailReadOnly = false; %>

<dmshtml:dms_isPresent property="<%=new String[]{"Released"}%>" value="<%=""+documentStatus%>" negated="true">
	<% parentDocDetailReadOnly = true;%>
</dmshtml:dms_isPresent>

<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="1" CELLPADDING="0">	
	<tr><td>&nbsp;</td></tr>			
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT DOCUMENT</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>					
	<tr>
		<td width="100%" align="center" class="sectionhead">DOCUMENT DETAILS SUMMARY</td>
	</tr>
	<tr><td>&nbsp;</td></tr>	
</table>

<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="1" CELLPADDING="0">			
	<tr>
		
		<dmshtml:dms_isPresent property="<%=new String[]{"Released","QA","Development"}%>" value="<%=""+documentStatus%>" negated="true">
			<td class="links"><a href="/GetAllVersionOfDocumentDefinitionListAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Product::Document::Definition::DocId)=<%= ""+documentId %>&answer(Object::Product::Document::Definition::OwnerId)=<%= ""+ownerId %>&answer(Object::Product::Document::Definition::VerId)=<%= ""+documentVerId %>" >List Document Versions </a></td>
		</dmshtml:dms_isPresent>
		
		<td class="links"><a href="../AddDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes">Add Document</a></td>
		
	</tr>
	
	<tr><td>&nbsp;</td></tr>
	
</table>

<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="1" CELLPADDING="0">
	<tr>
		<td>
			<html:form action="/SaveDocumentDefinitionAction.do">
			
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
			
					<tr>
						<td width="35%" class="FormLabels" align="left">Document Name *</td>
						<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocName)" styleId="DocName" size="30" maxlength="40" styleClass="txtbox" /></td>
					</tr>
			
					<tr>
						<td width="35%" class="FormLabels" align="left">Document Number</td>
						<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocNum)" styleId="DocNum" size="20" maxlength="40" styleClass="txtbox" /></td>
					</tr>
			
					<tr>
						<td width="35%" class="FormLabels" align="left">Document Sub-Number</td>
						<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocSubNum)" styleId="DocSubNum" size="20" maxlength="40" styleClass="txtbox" /></td>
					</tr>
					
					<dmshtml:get_Document_Type nameInSession="documentTypeList" ownerId="<%= ""+ownerId %>"
														dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
			
					<logic:present name="documentTypeList">
						<tr>
							<td width="35%" class="FormLabels" align="left">Document Type *</td>
							<td class="links">
								<html:select property="answer(Object::Product::Document::Definition::DocType)" styleId="DocType"  styleClass="txtbox" >
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
						<td width="35%" class="FormLabels" align="left">Document Description</td>
						<td class="links"><html:textarea property="answer(Object::Product::Document::Definition::DocDesc)" styleId="DocDesc" rows="3" cols="29" styleClass="txtarea" /></td>
					</tr>
					
					<tr>
						<td width="35%" class="FormLabels" align="left">Document Source</td>
						<td class="links"><html:text property="answer(Object::Product::Document::Definition::DocSource)" styleId="DocSource" size="30" maxlength="120" styleClass="txtbox" /></td>
					</tr>

					<tr>
						<td width="35%" class="FormLabels" align="left">Release Status</td>
						<td class="links">
							<html:select property="answer(Object::Product::Document::Definition::ReleaseStatus)" styleId="ReleaseStatus" styleClass="txtbox" disabled="<%=parentDocDetailReadOnly%>">
									<html:option value ="">Select</html:option>
									<html:option value ="Development">Development</html:option>
								<html:option value ="Released">Released</html:option>
								<html:option value ="QA">QA</html:option>
							</html:select>
						</td>
					</tr>

					<tr>
						<td width="35%" class="FormLabels" align="left">Active</td>
						<td class="links">
							<html:select property="answer(Object::Product::Document::Definition::Active)" styleId="Active" styleClass="txtbox">
								<html:option value ="Y">Yes</html:option>
								<html:option value ="N">No</html:option>														
							</html:select>
						</td>
					</tr>
					
					<tr><td height="30"></td></tr>
					
					<dmshtml:dms_isPresent property="<%=new String[]{"Development","QA"}%>" value="<%=""+documentStatus%>" negated="true">
					<%if(!VerReleaseStatus.toString().equalsIgnoreCase("Released")){ %>
						<tr>
							<td></td>
							<td colspan="2" align="left">
								<html:submit value="save" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
							</td>
						</tr>
					<%} %>
					</dmshtml:dms_isPresent>
		
					<tr>
						<td>
						
							<html:hidden property="answer(Object::Product::Document::Definition::UpdatedBy)" styleId="UpdatedBy" value="<%=userName.toString()%>"/>
							<html:hidden property="answer(Object::Product::Document::Definition::CurrentVerId)" styleId="CurrentVerId" />
							
							<html:hidden property="answer(Object::Product::Document::Definition::VerName)" styleId="VerName" />
							<html:hidden property="answer(Object::Product::Document::Definition::VerDesc)" styleId="VerDesc" />
							<html:hidden property="answer(Object::Product::Document::Definition::DocTemplType)" styleId="DocTemplType" />
							<html:hidden property="answer(Object::Product::Document::Definition::DocTemplUrl)" styleId="DocTemplUrl" />
							<html:hidden property="answer(Object::Product::Document::Definition::AppId)" styleId="AppId" />
							<html:hidden property="answer(Object::Product::Document::Definition::AppVerId)" styleId="AppVerId" />
							<html:hidden property="answer(Object::Product::Document::Definition::SubAppId)" styleId="SubAppId" />
							<html:hidden property="answer(Object::Product::Document::Definition::SubAppVerId)" styleId="SubAppVerId" />
							<html:hidden property="answer(Object::Product::Document::Definition::VerReleaseStatus)" styleId="VerReleaseStatus" />

							<html:hidden property="answer(Release::Month)" value='<%=""+releaseMonth%>' styleId="ReleaseMonth" />
							<html:hidden property="answer(Release::Date)"  value='<%=""+releaseDate%>' styleId="ReleaseDate" />
							<html:hidden property="answer(Release::Year)"  value='<%=""+releaseYear%>' styleId="ReleaseYear" />
							
							<html:hidden property="answer(Expiration::Month)"  value='<%=""+expMonth%>' styleId="ExpirationMonth" />
							<html:hidden property="answer(Expiration::Date)"  value='<%=""+expDate%>' styleId="ExpirationDate" />
							<html:hidden property="answer(Expiration::Year)"  value='<%=""+expYear%>' styleId="ExpirationYear" />

							<html:hidden property="answer(Object::Product::Document::Definition::RevisionNumber)" styleId="RevisionNumber" />							
							<html:hidden property="answer(Object::Product::Document::Definition::DynamicFields)" styleId="DynamicFields" />
							<html:hidden property="answer(Object::Product::Document::Definition::VerActive)" styleId="VerActive" />
					
							<html:hidden property="answer(dbName)" value='<%= com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
							<html:hidden property="answer(Object::Product::Document::Definition::OwnerId)" value="<%= ""+ownerId %>" />
							<html:hidden property="answer(Object::Product::Document::Definition::DocId)" styleId="DocumentId" />
							<html:hidden property="answer(Object::Product::Document::Definition::VerId)" styleId="DocumentVerId" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
							<%if(parentDocDetailReadOnly){%>
								<html:hidden property="answer(Object::Product::Document::Definition::ReleaseStatus)" styleId="DocumentVerId" />
							<%}%>
													
						</td>
					</tr>
				</table>			
			</html:form>
		</td>
	</tr>
</table>