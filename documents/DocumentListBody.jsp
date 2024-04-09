<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT SRC="../Scripts/JScripts/Common.js" type="text/javascript"></SCRIPT>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<!-- bean:define id="mandatoryCheck" name="DocumentList" property="" scope="session"/ -->

		<%
			
			String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
			}
		
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(parentQuoteId)");
			}

			String subQuoteId="";
			if(request.getParameter("answer(subQuoteId)")!=null)
			{
				subQuoteId=request.getParameter("answer(subQuoteId)");
			}
			
			String productStatus="";
			if(request.getParameter("answer(productStatus)")!=null)
			{
				productStatus=request.getParameter("answer(productStatus)");
			}
			
			String strPolicyNumber="";
			if(request.getParameter("answer(policyNumber)")!=null)
			{
				strPolicyNumber=request.getParameter("answer(policyNumber)");
			}
			
			String strParentPolicyId="";
			if(request.getParameter("answer(Object::Policy::ParentPolicyId)")!=null)
			{
				strParentPolicyId=request.getParameter("answer(Object::Policy::ParentPolicyId)");
			}
			
			String strParentPolicyVerId="";
			if(request.getParameter("answer(Object::Policy::ParentPolicyVerId)")!=null)
			{
				strParentPolicyVerId=request.getParameter("answer(Object::Policy::ParentPolicyVerId)");
			}			
			String stateCode="";
			if(request.getParameter("answer(State)")!=null)
			{
				stateCode=request.getParameter("answer(State)");
			}
					
		%>
		<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+strParentQuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="GetQuoteDetailByQuoteId" scope="request"/>
			<bean:define id="productId" name="GetQuoteDetailByQuoteId" property="productId" />
			<bean:define id="productVerId" name="GetQuoteDetailByQuoteId" property="productVerId" />
			<bean:define id="productGroupId" name="GetQuoteDetailByQuoteId" property="productGroupId" />
			<bean:define id="productGroupVerId" name="GetQuoteDetailByQuoteId" property="productGroupVerId" />
		<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>
						<!-- *********** Table for General ************ -->
						<table width="100%" align="Left" border="0" bgcolor="#C6DEEA">
							<tr>								
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" align="left" border="0">
												
						<tr>
							<td colspan="2">
								<table width="100%" align="center" border="0">
									<jsp:include page="../common/QuoteHeader.jsp" >
										<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="productVerId" value="<%=""+productVerId%>" />
										<jsp:param name="heading" value="<%="SCHEDULE OF FORMS"%>" />	
									</jsp:include>
								</table>
							</td>
						</tr>
					
						<tr>
							<td colspan="2">
								<table width="100%" align="center" border="0">		
									<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
										<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
										<jsp:param name="customerId" value="<%=""+customerId%>" />	
										<jsp:param name="productId" value="<%=""+productId%>" />	
										<jsp:param name="productVerId" value="<%=""+productVerId%>" />
										<jsp:param name="prdGroupId" value="<%=""+productGroupId%>" />	
										<jsp:param name="prdGroupVerId" value="<%=""+productGroupVerId%>" />
										<jsp:param name="productStatus" value="<%=""+productStatus%>" />
										<jsp:param name="stateCode" value="<%=""+stateCode%>"/>
									</jsp:include>
								</table>
							</td>
						</tr>
						</table>
					</td>
				</tr>
				
				
				<tr><td>&nbsp;</td></tr>
				
				<tr>	
					<td>
						<table width="100%" align="left" border="0">
							<tr>	
								<!-- ********** href to be entered *********** -->					
								<td class="links" width="20%">
									<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(policyNumber)=<%=""+strPolicyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+strParentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+strParentPolicyVerId%>">Quote Summary</a>
								</td>							
							</tr>
									
							<tr><td>&nbsp;</td></tr>
						</table>
					</td>
				</tr>
				
				<tr>	
					<td>
						<table width="80%" align="left" border="0">
							<tr>	
								<!-- ********** href to be entered *********** -->					
								<td class="FormLabels" width="20%">Associated Quote Documents</td>							
							</tr>
									
							<tr><td>&nbsp;</td></tr>
						</table>
					</td>
				</tr>
				
				<tr><td>
					<table width="100%" align="left" border="0">		
					<!-- html:form action="/GetMandatoryDocs.do" scope="request" -->
						<tr>
							<td class="sectionhead" align="left" height="25" width="5%">Sl.No.</td>		
							<td class="sectionhead" align="left" height="25" width="12%">Document Identifier</td>								
							<td class="sectionhead" align="left" height="25" width="35%">Document Title</td>
							<!-- td class="sectionhead" align="left" height="25" width="5%">Select</td -->
						</tr>
						<%int count =0; %>
						
						<logic:present name="quoteDocument" scope="request">
						
						<logic:iterate id="quoteDocument" name="quoteDocument">	
						
						<bean:define id="templateURL" name="quoteDocument" property="documentTemplUrl"/>
						<bean:define id="documentId" name="quoteDocument" property="documentId"/>
						<bean:define id="documentVerId" name="quoteDocument" property="versionId"/>
						<bean:define id="templateType" name="quoteDocument" property="documentType"/>
							
						<%count++; %>
						<% 		
							String styleClass="";
							if(count%2==0){
								styleClass = "altdisply";
							}
							else{
								styleClass = "SearchResult";	
							}
						%>										
						<tr>
							<td height="25" class=<%= styleClass%>><%=count%>&nbsp;</td>
					  		<td height="25" class=<%= styleClass %>>
					   			<bean:write name="quoteDocument" property="documentNum"/>&nbsp;
					  		</td>
					  		<td height="25" class=<%= styleClass %>>
					  		
					  		<a href="javascript:void(0)" onclick="window.open('../PreviewIssuanceDoc.go?answer(DOWNLOAD)=No&answer(DOCUMENT_TEMPLATE_PREIVEW_MODE)=Yes&answer(NON_PREVIEW)=No&answer(FILE_OPEN)=No&answer(Object::Product::Document::Definition::DocId)=<%=documentId.toString()%>&answer(Object::Product::Document::Definition::VerId)=<%=documentVerId.toString()%>&answer(Object::Product::Document::Definition::DocTemplUrl)=<%=templateURL%>&answer(Object::Product::Document::Definition::DocTemplType)=<%=templateType %>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>' )","New","height=500"><bean:write name="quoteDocument" property="documentName"/>&nbsp;</a>
								
					  		</td>
					  		<!-- td class=<%= styleClass %>>			  			
							 	<bean:define id="docId" name="quoteDocument" property="documentNum" />
							 	<bean:define id="mandatory" name="quoteDocument" property="mandatory"/>
							 	<% String isMandatory = ""+mandatory; 
								    if(isMandatory.equals("Y")){%>
								
								<input type="checkbox" name="answer(Object::Product::Document::Definition::DocNum)" value='<bean:write name="quoteDocument" property="documentNum"/>'disabled="disabled" />
								 <%}else{ %>
								<input type="checkbox" name="answer(Object::Product::Document::Definition::DocNum)" value='<bean:write name="quoteDocument" property="documentNum"/>' />
								 <%} %>
		     				</td -->		     					     				
					 	</tr>		
						
						</logic:iterate>
						</logic:present>		
						<!-- 
						<tr>
							<td colspan="9" align="right">
								<table border="0" cellpadding="3" align="right">
								
									<tr>
										<td align="right">
											<html:submit value="Remove selected" styleClass="sbttn"/>&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>
						 -->
					</table>
				</td></tr>
				
				<tr><td>&nbsp;</td></tr>
				
				<!-- tr>
					<td>
						<table width="100%" align="left" border="0">
							<tr>											
								<td class="FormLabels" width="20%">Non-Associated Quote Documents</td>							
							</tr>
									
							<tr><td>&nbsp;</td></tr>
						</table>
					</td>
				</tr>
				
				<tr><td>
					<table width="100%" align="right" border="0">
					<!-- html:form action="/RemoveOptDocuments.do" scope="request" -->
						<!-- tr>
							<td class="sectionhead" align="left" height="25" width="5%">Sl.No.</td>		
							<td class="sectionhead" align="left" height="25" width="12%">Document Identifier</td>								
							<td class="sectionhead" align="left" height="25" width="35%">Document Title</td>
							<td class="sectionhead" align="left" height="25" width="5%">Select</td>
						</tr>
						
						<%int count1 =0; %>
						<logic:present name="quoteDocumentNonListed" scope="request">
						
						<logic:iterate id="quoteDocumentNonListed" name="quoteDocumentNonListed">		
						<%count1++; %>	
						<% 		
							String styleClass="";
							if(count1%2==0){
								styleClass = "altdisply";
							}
							else{
								styleClass = "SearchResult";	
							}
						%>		
						<tr>
							<td class=<%= styleClass %>><%=count1%>&nbsp;</td>
					  		<td class=<%= styleClass %>>
					   			<bean:write name="quoteDocumentNonListed" property="documentNum"/>&nbsp;
					  		</td>
					  		<td class=<%= styleClass %>>
					   			<bean:write name="quoteDocumentNonListed" property="documentName"/>&nbsp;
					  		</td>
					  		<td class=<%= styleClass %>>			  			
							 	<bean:define id="docId" name="quoteDocumentNonListed" property="documentNum" />
		     					<bean:define id="mandatory" name="quoteDocumentNonListed" property="mandatory"/>
							 	<% String isMandatory = ""+mandatory; 
								    if(isMandatory.equals("Y")){%>
								
								<input type="checkbox" name="answer(Object::Product::Document::Definition::DocNum)" value='<bean:write name="quoteDocumentNonListed" property="documentNum"/>'disabled="disabled" />
								 <%}else{ %>
								<input type="checkbox" name="answer(Object::Product::Document::Definition::DocNum)" value='<bean:write name="quoteDocumentNonListed" property="documentNum"/>' />
								 <%} %>
		     				</td>
					 	</tr>		
						
						</logic:iterate>
						</logic:present>
						<!-- 
					 	<tr>
							<td colspan="9" align="right">
								<table border="0" cellpadding="3" align="right">
									<tr>
										<td align="right">
											<html:submit value="Add selected" styleClass="sbttn"/>&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>		
						-->	
					 <!-- /html:form -->
					<!-- /table>
				</td></tr -->
				
				<tr><td>&nbsp;</td></tr>				
				
			</table>
				