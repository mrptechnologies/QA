<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/QuoteSummary.js"> </SCRIPT>

<SCRIPT type="text/javascript">
function disableButton(frm){
if((document.getElementById("QuoteProposalSubmit") != null) && (document.getElementById("QuoteProposalSubmit") != undefined))
	document.getElementById("QuoteProposalSubmit").disabled = true;	
if((document.getElementById("QuoteProposalCancel") != null) && (document.getElementById("QuoteProposalCancel") != undefined))
	document.getElementById("QuoteProposalCancel").disabled = true;
}
</SCRIPT>
<bean:parameter id="QuoteDesc" name="answer(Object::Quote::QuoteDesc)"/>
<bean:parameter id="QuoteName" name="answer(Object::Quote::QuoteName)"/>

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
			
			String tempParentQuoteStatus = "";
			if(request.getParameter("answer(Object::Quote::TempQuoteStatus)")!=null)
			{
				tempParentQuoteStatus = request.getParameter("answer(Object::Quote::TempQuoteStatus)");
			}
			if(tempParentQuoteStatus.equalsIgnoreCase("")) {
				tempParentQuoteStatus = strParetQuoteStatus;
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(parentQuoteId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}
			
			String riskState="";
			if(request.getParameter("answer(state)")!=null){
				riskState=request.getParameter("answer(state)");
			}
			String teritory="";
			if(request.getParameter("answer(teritory)")!=null)
			{
				teritory=request.getParameter("answer(teritory)");
			}
			
			String territoryName="";
			if(request.getParameter("answer(territoryName)")!=null)
			{
				territoryName=request.getParameter("answer(territoryName)");
			}
			
			String zone="";
			if(request.getParameter("answer(zone)")!=null)
			{
				zone=request.getParameter("answer(zone)");
			}
			
			String tabNo="";
			if(request.getParameter("tabNo")!=null)
			{
				tabNo=request.getParameter("tabNo");
			}
			
			String Navigation="";
			if(request.getParameter("Navigation")!=null)
			{
				Navigation=request.getParameter("Navigation");
			}
			String parentPolicyStatus = "";
			if(request.getParameter("answer(parentPolicyStatus)")!=null){
				parentPolicyStatus = request.getParameter("answer(parentPolicyStatus)");
			}
		
		%>		
		

<% long ProductId = Long.parseLong((request.getParameter("answer(Object::Quote::ProductId)")).toString()); %>
<% long QuoteId = Long.parseLong((request.getParameter("answer(parentQuoteId)")).toString()); %>
<% long SubQuoteId = Long.parseLong((request.getParameter("answer(Object::Quote::FirstSubQuoteId)")).toString()); %>
<% long SubQuoteVerId = Long.parseLong((request.getParameter("answer(Object::Quote::QuoteVerId)")).toString()); %>
<% String QuoteType = (request.getParameter("answer(Object::Quote::QuoteType)")).toString(); %>

<% String subQuoteVerIdParam = "";
	if(request.getParameter("answer(subQuoteVerId)") != null) {
		subQuoteVerIdParam = (request.getParameter("answer(subQuoteVerId)")).toString();
	}%>
<% String subQuoteIdParam = "";;
	if(request.getParameter("answer(subQuoteId)") != null) {
		subQuoteIdParam = (request.getParameter("answer(subQuoteId)")).toString(); 
	}%>

	<bean:parameter name="answer(parentPolicyId)" id="policyId" />
	<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />
	<bean:parameter name="answer(policyNumber)" id="policyNumber" />
	<bean:parameter name="answer(DocumentType)" id="DocumentType" />
	
	<%	String isRenewalEndorsement="";
		String isRenewal = "";
	%>
	
	<html:form action="/IssueBinder.do" onsubmit="disableButton(this);">
			<% 
					session.removeAttribute("IsPolicyCreationAction");
			%>		
	
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>

<bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="quoteStartDate" />



<%
if(request.getParameter("quoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
<%
			}
%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<dmshtml:IsRenewalEndorsement productId='<%=""+ProductId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId)%>" ></dmshtml:IsRenewalEndorsement>
<% 
	isRenewalEndorsement = (String) request.getAttribute("isRenewalEndorsement");
	if(isRenewalEndorsement.equals("Y")){ 
		isRenewal = "true";
	}else{ 
		isRenewal = "false";
	} 
%>

<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp; 
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">	
							<tr>
								<td width="100%" bgcolor="#C6DEEA">
									<div id="QuoteInsuerdAgencyAgentHeader">
										<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
										<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="paretQuoteStatus" value="<%=""+tempParentQuoteStatus%>" />
										</jsp:include>
									</div>
								</td>
							</tr>
							</dmshtml:dms_static_with_connector>
							<tr>
								
								<td>
									<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
									  <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">	
										<tr>
											<td >
												<table width="100%" align="Left" border="0">
													<tr>
														<td>
															<jsp:include page="../common/DynamicPolicyHeader.jsp">
																<jsp:param name="policyId" value="<%=policyId.toString()%>" />
																<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
																<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
																<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
																<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
															</jsp:include>
														</td>
													</tr>		
												</table>
											</td>
										</tr>
										
										<tr>
											<td>
												<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
												 	<tr>
														<td align="left">	
															<jsp:include page="../common/EndorsementQuoteHeader.jsp">
																<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
																<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
															</jsp:include>	
														</td>
													</tr>		
												</table>	
											</td>
										</tr>											
										
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">										
											<tr>
												<td>
													<jsp:include page="/common/PolicyQuoteHeaderCoverMin.jsp">											
														<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="ParentQuoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
														<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />	
														<jsp:param name="paretQuoteStatus" value="<%=""+strParetQuoteStatus%>" />	
														<jsp:param name="customerId" value="<%=""+customerId%>" />																																				
													</jsp:include>		 										
												</td>											
											</tr>
											<tr>
												<td>
													<jsp:include page="../common/DynamicPolicyHeaderUI3.jsp">
														<jsp:param name="policyId" value="<%=""+policyId.toString()%>" />
														<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
														<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
														<jsp:param name="prodId" value="<%=""+ProductId%>" />
														<jsp:param name="ProductVerId" value="<%=""+ProductVerId%>" />								
														<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
													</jsp:include>
												</td>
											</tr>
											<tr>
												<td>
													<jsp:include page="/common/EndorsementQuoteInformation.jsp">											
														<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="ParentQuoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
														<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />	
														<jsp:param name="paretQuoteStatus" value="<%=""+strParetQuoteStatus%>" />	
														<jsp:param name="customerId" value="<%=""+customerId%>" />
														<jsp:param name="subQuoteVerId" value="<%=""+subQuoteVerIdParam%>" />
														<jsp:param name="subQuoteId" value="<%=""+subQuoteIdParam%>" />																									
													</jsp:include>		 										
												</td>											
											</tr>
										</dmshtml:dms_static_with_connector>	
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
								<tr>
									<td class="links"><a id="endorsementQuoteSummaryLink"
										href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyIdTemp%>&answer(QuoteId)=<%=""+strParentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+strParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(parentPolicyStatus)=<%=""+parentPolicyStatus %>">Quote
									Summary</a></td>
								</tr>
								<logic:present name="QuoteTransactionStatus" scope="request">
										<tr>
											<td class="Error"><%= request.getAttribute("QuoteTransactionStatus") %>
											</td>
										</tr>
									</logic:present>
										<tr>
											<td class="Error">
												<logic:present name="MESSAGE_LIST"> 
													<ul>
														<logic:iterate id="message" name="MESSAGE_LIST">
															<li><bean:write name="message"/></li>
														</logic:iterate>
												 	</ul>		 		
												</logic:present>
											</td>
										</tr>
										<tr>
											<td align="left">
	
												<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
													<tr>
														<td>

															<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
															
															<html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
															<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
														</td>
													
		
		
		
														<bean:define id="parentQuoteId" name="AddQuote" property="answer(Object::Quote::Id)"/>
														
															<%
															if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
															{
												             
															%>
															<td>
															<html:hidden name="AddQuote" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
															</td>
		

																<%
																	}
																%>
															</tr>
													<tr>
														<td  colspan="8" align="center" class="sectionhead"></td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
													</tr>
													
													<tr><td>
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Bound" />
													</td></tr>
												</table>
											</td>
										</tr>
									</table>
									<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<logic:notPresent name="QuoteTransactionStatus" scope="request">										
										<tr>
										<td class="TextMatter" align="right" colspan="3">
												Are you sure you want to proceed?
											
												<input type="radio" name="issue" value="Yes" id="proposalYES" onclick="QuoteProposalEnable(this.form,this.document)">&nbsp;Yes 
												<input type="radio" name="issue" value="No" checked="checked" id="proposalNO" onclick="QuoteProposalDisable(this.form,this.document)">&nbsp;No 
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										
										<%
											 boolean isPreview = false;
										%>
											<tr>
											
											<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREVIEW_ENDORSEMENT_VIEW"}%>' connector='or' negated="true">
											
											<td align="center" class="links" >
											
										
											<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="PreviewBinder" />
											
											<logic:present name="paramValue">
										   		<logic:equal value="CLBinder" name="paramValue">
													<div class="sbttn1" style=" display:table-cell; vertical-align:middle"><a id="hiddenPreviewEndorsement"  style="color:#000000;text-decoration:none;" href='../CLPreviewBinderPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+strParentQuoteId%>&answer(subQuoteId)=<%= ""+SubQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%> &answer(isPreview)=<%=true%>' target="_new">Preview Endorsement</a></div>
								
										   		</logic:equal>
									   		</logic:present>	
									   		<logic:present name="paramValue">
										   		<logic:equal value="PCBinder" name="paramValue">	   		
													<div class="sbttn1" style=" display:table-cell; vertical-align:middle"><a id="hiddenPreviewEndorsement" style="color:#000000;text-decoration:none;"  href='../PreviewBinderPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+strParentQuoteId%>&answer(subQuoteId)=<%= ""+SubQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%> &answer(isPreview)=<%=true%>' target="_new">Preview Endorsement</a></div>													
												</logic:equal>
											</logic:present>
								
								
											</td>
											</dmshtml:dms_static_with_connector>
											
											
												<td align="center" class="links">
													<INPUT TYPE="Submit" value="Issue Endorsement" class="sbttn1" disabled="disabled"  id="QuoteProposalSubmit">
												</td>
											
											<td align="center" class="links">
											<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_AVAILABLE" 
													property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=tempParentQuoteStatus%>" negated="true">
													<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
														<dmshtml:dms_button value="Cancel" property="answer(back)" styleId="QuoteProposalCancel" styleClass="sbttn" onclick="goToEndorsmentQuoteSummaryPage();"/>
												</dmshtml:dms_isPresent>
																		
											</dmshtml:isFeatureAvailableForProductRoleStatus>	
														<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="COV_LIM_ENDORSEMENT_BIND_AVAILABLE" 
													property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=tempParentQuoteStatus.toString()%>" negated="true">
													<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
													<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(QuoteId)=<%=""+strParentQuoteId%>&answer(parentQuoteId)=<%=""+strParentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=policyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=policyId %>"id="Cancel"><html:button styleClass="sbttn" property="answer(Cancel)" value="Cancel" onclick="window.location=document.getElementById('Cancel')"/></a>
												</dmshtml:dms_isPresent>						
											</dmshtml:isFeatureAvailableForProductRoleStatus>	
											
												
											</td>
											<td>
												&nbsp;											
											</td>
										</tr>	
										</logic:notPresent>

										<tr>
											<td colspan="3">
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>

			<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
			 <html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			 <html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<html:hidden property="page" value="7" />
			
			
			<!-- New hidder variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" styleId="usrIdfrmjsp" />
			<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%= ""+ProductId %>" />
			<html:hidden property="answer(Object::Quote::ProductId1)" value="<%= ""+ProductId %>" />
			<html:hidden property="answer(parentQuoteId)" value="<%= ""+QuoteId %>" />
			<html:hidden property="answer(Object::Quote::FirstSubQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(SubQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(subQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%= ""+SubQuoteVerId %>" />
			<html:hidden property="answer(Object::Quote::QuoteType)" value="<%= QuoteType %>" />
			<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%= ""+ProductVerId %>" />			
			<html:hidden property="answer(DocType)" value="ISSUANCE" />
			<html:hidden property="answer(DocumentType)" value="BINDER" />
			<html:hidden property="answer(OwnerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(isPreview)" value="<%= ""+false%>" />		
			<html:hidden property="answer(OBject::Activity::ObjectId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Object::Quote::QuoteName)" value="<%=""+QuoteName%>" />
			<html:hidden property="answer(Object::Quote::QuoteDesc)" value="<%=""+QuoteDesc%>" />
			<html:hidden property="answer(Object::Quote::TempQuoteStatus)" value="<%=""+tempParentQuoteStatus%>" />
			
			<bean:parameter id="riskId" name="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)"/>
			<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" value="<%= ""+riskId%>" />
			<html:hidden property="answer(Object::Quote::ResProperty::State)" value="<%=""+riskState%>" />
			<html:hidden property="answer(state)" value="<%=""+riskState%>" />
			<html:hidden property="answer(teritory)" value="<%=""+teritory%>" />
			<html:hidden property="answer(territoryName)" value="<%=""+territoryName%>" />
			<html:hidden property="answer(zone)" value="<%=""+zone%>" />
			<html:hidden property="tabNo" value="<%=""+tabNo%>" />
			<html:hidden property="Navigation" value="<%=""+Navigation%>" />			
			
			<html:hidden property="answer(QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
			<html:hidden property="answer(ownerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(createdBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(updatedBy)" value="<%=userId.toString()%>" />
			
			<html:hidden property="answer(displayVal)" value="Y" styleId="check"/>		
			
			<html:hidden property="answer(parentPolicyId)" value="<%=""+policyId%>" />
			<html:hidden property="answer(policyId)" value="<%=""+policyId%>" />
			<html:hidden property="answer(policyVerId)" value="<%=policyVerId.toString()%>" />	
			
			<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+policyId%>" />
			<html:hidden property="answer(PARENT_POLICY_NUMBER)" value="<%=""+policyNumber%>" />
			<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />			
			<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%= ""+quoteStartDate %>" />
			<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />			
			<html:hidden property="answer(IsIssueBinderAction)" value="YES" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			<html:hidden property="answer(isUpdated)" value="Y" />
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(pagename)" value="Endorsement Issue Summary" />
			<html:hidden property="answer(Object::Application::ApplicationType)" value="POLICY_APPLICATION"/>
			<html:hidden property="answer(SUCCESS_F)" value="success" />
			<html:hidden property="answer(FAILURE_F)" value="failure" />
			<html:hidden property="answer(ENDORSEMENT_QUOTE_TRANSACTION_FAILURE_F)" value="QuoteEndorsementTransFailure" />
			<html:hidden property="answer(DEFAULT_POLICY_TAB)" value="EndorsmentTab" />
	

             <% if(isRenewalEndorsement.equals("Y")){ %>	
            		 <html:hidden property="answer(isRenewalEndorsement)" value="YES" />
             <%}else{ %>
  					<html:hidden property="answer(isRenewalEndorsement)" value="NO" />
 			 <%} %>
 			 
 			 <dmshtml:get_ProductDetail_ByProductVerId nameInSession="aProductDetail" productId="<%=""+Long.parseLong(""+ProductId)%>" productVerId="<%=""+Long.parseLong(""+ProductVerId)%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
				<logic:present name="aProductDetail" scope="request">
					<bean:define id="MProductVerName" property="MProductVerName" name="aProductDetail" scope="request" />					
					<html:hidden property="answer(Object::Product::ProductName)" value="<%=MProductVerName+"" %>" />
				</logic:present>
				
			<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId+"" %>" />		
			<html:hidden property="answer(customerId)" value="<%=customerId+"" %>" />			

			
			
		</td>
	</tr>

</table>    



</html:form>

<% if(isRenewalEndorsement.equals("Y")){ %>
<bean:define id="ownerid" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%=ownerid.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName="BINDER" applicationType="BINDER" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveBinderApplicationActionForRenewal.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>

<%} %>

<script type="text/javascript">
function setDefault(frm){

  	/**
     * To set the User ID
     */
    if(document.getElementById("usrIdfrmjsp") !=null && document.getElementById("usrIdfrmjsp") !=undefined) {
 	var usrIdfrmjsp=document.getElementById("usrIdfrmjsp").value;
 	var createdByElements = frm.CreatedBy;
	 	if(createdByElements!=null && createdByElements!= undefined) {
	 		for(index=0;index<(createdByElements.length);index++) {
	 			createdByElements[index].value=usrIdfrmjsp;
	 		}		 	
			 
		}
 	}
 	
 	/**
     * To set the Created Date
     */
     var CreatedDateElement=frm.CreatedDate;
 	 if(CreatedDateElement!=null && CreatedDateElement!= undefined) {
	 	 var currentTime = new Date();
		 var month = currentTime.getMonth() + 1;
		 var day = currentTime.getDate();
		 var year = currentTime.getFullYear();
		 
		 for(index=0;index<(CreatedDateElement.length);index++) {
		 		CreatedDateElement[index].value=year+'/'+month+'/'+day;
		 }
	}
	return true;
 }

function goToEndorsmentQuoteSummaryPage() {

	if(document.getElementById("endorsementQuoteSummaryLink") != null && document.getElementById("endorsementQuoteSummaryLink") != undefined) {
		document.location = document.getElementById("endorsementQuoteSummaryLink").href;
	}
}
</script>