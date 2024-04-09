<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/QuoteSummary.js"> </SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
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
			
			String strParentQuoteVerId="";
			if(request.getParameter("answer(ParentQuoteVerId)")!=null)
			{
				strParentQuoteVerId=request.getParameter("answer(ParentQuoteVerId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}
			
			String RenewalPolicyNo="";
			if(request.getParameter("answer(Object::QuoteAdditional::RenewalPolicyNumber)")!=null)
			{
				RenewalPolicyNo=request.getParameter("answer(Object::QuoteAdditional::RenewalPolicyNumber)");
				
			}
			String RenewalPolicyCompany="";
			if(request.getParameter("answer(Object::QuoteAdditional::RenewalPolicyCompany)")!=null)
			{
				RenewalPolicyCompany=request.getParameter("answer(Object::QuoteAdditional::RenewalPolicyCompany)");
				
			}
			String RenewalSubmissionNumber="";
			if(request.getParameter("answer(Object::QuoteAdditional::RenewalPolicySubmission)")!=null)
			{
				RenewalSubmissionNumber=request.getParameter("answer(Object::QuoteAdditional::RenewalPolicySubmission)");
			}
			
			String QuoteType="";
			if(request.getParameter("answer(Object::Quote::QuoteType)")!=null)
			{
				QuoteType=request.getParameter("answer(Object::Quote::QuoteType)");
			}
			String quoteStartDate="";
			if(request.getParameter("answer(Object::Quote::QuoteStartDate)")!=null)
			{
				quoteStartDate=request.getParameter("answer(Object::Quote::QuoteStartDate)");
			}
			String prevSubQuoteVerId="";
			if(request.getParameter("answer(suQuoteVerId)")!=null)
			{
				prevSubQuoteVerId=request.getParameter("answer(suQuoteVerId)");
			}
			
			String referralRuleStatus="";
			if(request.getParameter("answer(Object::Rules::ActionForward")!=null)
			{
				referralRuleStatus=request.getParameter("answer(Object::Rules::ActionForward)");
			}

			String strSubQuoteId="";
			if(request.getParameter("subQuoteId")!=null)
			{
				strSubQuoteId=request.getParameter("subQuoteId");
			}
			String strSubQuoteVerId="";
			if(request.getParameter("answer(suQuoteVerId)")!=null)
			{
				strSubQuoteVerId=request.getParameter("answer(suQuoteVerId)");
			}
			String isRenewalEndorsement="";
			if(request.getParameter("answer(isRenewalEndorsement)")!=null)
			{
				isRenewalEndorsement=request.getParameter("answer(isRenewalEndorsement)");
			}
			String policyNumber = "";
			if(request.getParameter("answer(policyNumber)")!=null && request.getParameter("answer(policyNumber)") !=""){
				
				policyNumber = ""+request.getParameter("answer(policyNumber)");
				
			}
		String RuleStatusDetail="";
		
		String parentPolicyId="";
		if(request.getParameter("answer(parentPolicyId)")!=null)
		{
			parentPolicyId=request.getParameter("answer(parentPolicyId)");
			
		}
		
		String ParentPolicyVerId="";
		if(request.getParameter("answer(Object::Policy::ParentPolicyVerId)")!=null)
		{
			ParentPolicyVerId=request.getParameter("answer(Object::Policy::ParentPolicyVerId)");
			
		}		
		String referralNotes="";
		if(request.getParameter("answer(Object::QuoteAdditional::ReferralNotes)")!=null)
		{
			referralNotes=request.getParameter("answer(Object::QuoteAdditional::ReferralNotes)");
			referralNotes=referralNotes.replaceAll("&lt;","<").replaceAll("&gt;",">");			
		}

		boolean isRenewal = false;
		if((""+isRenewalEndorsement).equalsIgnoreCase("YES")){
			isRenewal = true;
		}else{
			isRenewal = false;
		}
		%>			
		
		<bean:parameter id="ruleStatus" name="status" value="nothing"/>
<script type="text/javascript">
	function checkActionSubmit(frm) {
	
		document.getElementById("QuoteProposalSubmit").disabled = true;	
	    return newchecksubmitcount();
		if(frm.proposalYES.checked) {
			return true;
		}
		window.history.back();
		return false;
	}
</script>		
<!-- action changed by mariraj.m for check clearance -->
<html:form action="/executeQuoteMandatoryRulesEIL.do" onsubmit="return checkActionSubmit(this);" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>		
<html:hidden name="policyNumber" property="answer(policyNumber)" value="<%=""+policyNumber%>" />

<html:hidden name="ParentPolicyVerId" property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+ParentPolicyVerId%>" />
<html:hidden name="parentPolicyId" property="answer(Object::Policy::ParentPolicyId)" value="<%=""+parentPolicyId%>" />


<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>

<%
if(request.getParameter("quoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
<%
			}			
%>

<%
if(request.getParameter("subQuoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="answer(subQuoteId)" value="<%=request.getParameter("subQuoteId")%>"/>
<%
			}			
%>

<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<logic:notEqual parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request"  >
	<tr>
		<td>
			<jsp:include page="/common/QuoteHeaderCreateQuoteCoverMin.jsp">

				<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+strParentQuoteId%>" />
				<jsp:param name="answer(policyNumber)" value="<%=""+policyNumber%>" />
				
			</jsp:include>

		</td>
	</tr>
	</logic:notEqual>
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="760px" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
						<logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >
							<tr>
								<td>						
					<table width="100%" bgcolor="#C6DEEA">
					<tr><td>
					<div id="QuoteInsuerdAgencyAgentHeader">
						<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
						<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
						</jsp:include>
						</div>
					</td></tr>
					</td>
								</tr>
					</table>							
						 </logic:equal>
	                <logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >
						<tr>
							<td align="left" colspan=2>
								<table width="950px" align="left" border="0" >
									<tr>
									<td class="NewSectionHead" align="center">CREATE QUOTE PROPOSAL</td>
									</tr>
								</table>
							</td>
						</tr>				
					</logic:equal>	 
                            <logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >
						 	<tr>
								<td align="left">			
								<%if(isRenewal) { %>
									<jsp:include page="../common/DynamicPolicyHeader.jsp">
										<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
										<jsp:param name="policyVerId" value="<%=""+ParentPolicyVerId.toString()%>" />
										<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
										<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
										<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
									</jsp:include>	
								<%} else { %>
									<jsp:include page="../common/DynamicPolicyHeader.jsp">
										<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
										<jsp:param name="policyVerId" value="<%=""+ParentPolicyVerId.toString()%>" />
										<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
										<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
									</jsp:include>	
								<%} %>
								 </td>
						  	</tr>										
						 	<tr>
								<td align="left">	
									<jsp:include page="../common/EndorsementQuoteHeader.jsp">
										<jsp:param name="quoteId" value="<%=""+strParentQuoteId%>" />
										<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
									</jsp:include>	
								</td>
							</tr>										
						 </logic:equal>
						 <tr>
								<td>
									<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">						 
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>

										<tr>
											<td align="left">
	
												<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
													<tr>
														<td>

															<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
															<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
															<bean:define id="objectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/> 
														
															<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="<%=objectType.toString()%>" />
															<bean:define id="objectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/> 
															
															<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="<%=objectId.toString()%>" />
															<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
															<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
															<html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
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
														<td colspan="2" class="links">
															<table>
															<tr>
														<td colspan="2" class="links" width="150px">
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+ParentPolicyVerId%>" title="<bean:message key='ToolTip.QuoteSummary.QuoteSummary'/>">Quote Summary</a>
														</td>

							<!--							<dmshtml:dms_isPresent property='<%=new String[]{"MANDATORY_RULES_FAILED","ELIGIBILITY_RULES_FAILED","SUBMISSION_RULES_SUCCESS"}%>' value="<%=ruleStatus.toString()%>" negated="true">

															<td colspan="2" class="links" width="100px">
																<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Application</a>
															</td>

															<td colspan="2" class="links"  width="150px">
																<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Coverages & Limits</a>
															</td>

														</dmshtml:dms_isPresent>-->
														</tr>
														</table>
														</td>
													</tr>

													<tr>
														<td  colspan="8" align="center" class="sectionhead"></td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td>
															<table width="100%" border="0" align="center">
															<!-- Rule Status & Messages :START -->

															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DISPLAY_RULES_MSG"}%>' connector='or' negated="true">
																<tr>
																	<td class="Error">																			
																		<logic:present name="MESSAGE_LIST" scope="request">
																			<ol>
																				<logic:iterate id="message" name="MESSAGE_LIST">
																				<li><bean:write name="message"/></li>
																				</logic:iterate>
																			</ol>			
																		</logic:present>																					
																	</td>
																</tr>
															</dmshtml:dms_static_with_connector>												
																												
															<!-- Rule Status & Messages :END -->
<tr>

	<dmshtml:dms_isPresent property='<%=new String[]{"In Progress","Referred"}%>' value="<%=strParetQuoteStatus.toString()%>"  negated="true">
		<td class="TextMatter" align="right">
			Are you sure you want to create a quote proposal?
		
			<input type="radio" name="answer(Object::QuoteAdditional::Praposal)" value="Yes" id="proposalYES" onclick="QuoteProposalEnable(this.form,this.document)">&nbsp;Yes 
			<input type="radio" name="answer(Object::QuoteAdditional::Praposal)" value="No" checked="checked" id="proposalNO" onclick="QuoteProposalDisable(this.form,this.document)">&nbsp;No 
		</td>
	</dmshtml:dms_isPresent>



<!-- @ -->


	<dmshtml:dms_isPresent property='<%=new String[]{"failure"}%>' value="<%=ruleStatus.toString()%>" negated="true">
		<td class="TextMatter" align="right">
		Failure has occured in the rules execution!!!
		
		</td>
	</dmshtml:dms_isPresent>	



<!-- @ -->


	<dmshtml:dms_isPresent property='<%=new String[]{"MANDATORY_RULES_FAILED"}%>' value="<%=ruleStatus.toString()%>" negated="true">
		<td class="TextMatter" align="right">
			You have provided insufficient information to rate the quote. Please answer every question with an asterisk before creating a quote proposal.
		
		</td>
	</dmshtml:dms_isPresent>


<!-- @ -->




	<dmshtml:dms_isPresent property='<%=new String[]{"SUBMISSION_RULES_SUCCESS"}%>' value="<%=ruleStatus.toString()%>" negated="true">
		<td class="TextMatter" align="right">
			Based on one or more of your answers to application questions we are unable to provide you with a quote proposal until your completed application is reviewed by an underwriter. If you would like to submit the application to Underwriting, please click on Submit, print out and complete the generated pdf application, and send it to us. 
		
		</td>
	</dmshtml:dms_isPresent>


<!-- @ -->


	<dmshtml:dms_isPresent property='<%=new String[]{"ELIGIBILITY_RULES_FAILED"}%>' value="<%=ruleStatus.toString()%>" negated="true">
		<td class="TextMatter" align="right">
			Based on one or more of your answers to application question we are unable to offer you the selected insurance coverage. Please review your responses and contact us if you have questions or are interested in receiving a quote for another product. 

		</td>
	</dmshtml:dms_isPresent>


<!-- @ -->




	<dmshtml:dms_isPresent property='<%=new String[]{"Rejected","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
		<td class="Link" align="right">
			<A HREF="">Application</A>
		</td>
	</dmshtml:dms_isPresent>


	<dmshtml:dms_isPresent property='<%=new String[]{"Request To Bind"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
		<td class="TextMatter" align="right" negated="true">
			Completed, signed, accurate application received
		
			<html:radio property = "answer(Object::QuoteAdditional::ApplicationReceived)" value="Yes" />&nbsp;Yes
			&nbsp;<html:radio property = "answer(Object::QuoteAdditional::ApplicationReceived)" value="No" />&nbsp;No
		</td>

		<td class="TextMatter" align="right" negated="true">
			All required supporting information due at binding have been received
		
			<html:radio property = "answer(Object::QuoteAdditional::BindingReceived)" value="Yes" />&nbsp;Yes
			&nbsp;<html:radio property = "answer(Object::QuoteAdditional::BindingReceived)" value="No" />&nbsp;No
		</td>

	</dmshtml:dms_isPresent>








</tr>
															</table>
														</td>
													</tr>
													<tr><td>
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=strParetQuoteStatus %>" />
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
										<tr>
											<td align="center" class="links">
											
											<%boolean GeniusAddressValidation=false; %>
                                            <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIBERTY_GENIUSADDRESS"}%>' connector='or' negated="false">

                                            <% GeniusAddressValidation=true; %>
                                            </dmshtml:dms_static_with_connector>
											<%if(!ruleStatus.toString().equals("ruleFailure")){%>
												<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lost", "Rejected"}%>" value="<%=strParetQuoteStatus.toString()%>" >
													<dmshtml:dms_isPresent property='<%=new String[]{"MANDATORY_RULES_FAILED","ELIGIBILITY_RULES_FAILED","SUBMISSION_RULES_SUCCESS","failure"}%>' value="<%=ruleStatus.toString()%>" negated="false">
														
														<INPUT TYPE="Submit" value="Create Quote Proposal" class="covbigbutton1" style="font-size:13px;" disabled="disabled" id="QuoteProposalSubmit" title="<bean:message key='ToolTip.CreateQuote.CreateQuote'/>">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREVIEW_PROPOSAL_DOCUMENT"}%>' connector='or' negated="true">		
															<INPUT TYPE="BUTTON" VALUE="Preview Proposal Document" class="covbigbutton1" style="width:220px;font-size:13px;" ONCLICK="previewDoc()" title="Click here to preview the Proposal document">
														</dmshtml:dms_static_with_connector>																										
													</dmshtml:dms_isPresent>																 				
												</dmshtml:dms_isPresent>
												<%}%>
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
		<%String ClearanceStatus1 = ""; %>
		<dmshtml:GetSubmissionDetailByQuoteId nameInSession="submissionDetailByQuoteId" quoteId="<%=Long.parseLong(strParentQuoteId.toString())%>" ownerId='<%=Long.parseLong(ownerId.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="submissionDetailByQuoteId" scope="request">
		<bean:define id="subDetailMap" name="submissionDetailByQuoteId" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		<bean:define id="subId" name="subDetailMap" property="Object::Submission::SubmissionId" />
		<bean:define id="subVerId" name="subDetailMap" property="Object::Submission::SubmissionVerId" />
		<bean:define id="custId" name="subDetailMap" property="Object::Submission::CustomerId" />
		<bean:define id="ClearanceStatus" name="subDetailMap" property="Object::Submission::ClearanceStatus" />	
			<% ClearanceStatus1 = ""+ClearanceStatus;%>
			
			
			<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=custId.toString()%>" submissionId='<%=""+subId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
							<logic:present name="customerDetail1" scope="request">

							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
								<%try{
									ClearanceStatus1 = customerDetailMap.getString("ClearanceStatus");
								}
										catch(Exception nfe) {  }%>
									
							</logic:present>
							
	</logic:present>	
		
			<html:hidden  property="answer(object:Alert::ClearanceStatus)" value='<%=""+ClearanceStatus1 %>'/>
			<html:hidden property="answer(Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
			<html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<html:hidden property="page" value="7" />
			
			
			<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=QuoteType.toString()%>" styleId="QuoteTypeId" />
			
			
			<!-- New hidder variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<input type="hidden" name="Object::Quote::ParentQuoteId" value="<%=""+strParentQuoteId %>" id="strParentQuoteIdHid" />
			<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" value="<%=""+strParentQuoteVerId%>" />
			<html:hidden property="answer(Quote::Page)" value="" />			
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			<html:hidden property="answer(Object::QuoteAdditional::ReferralNotes)" value="<%=""+referralNotes %>"/>
			
			
			<bean:parameter id="productId" name="answer(ProductId)"/>
			
			<input type="hidden" name="Object::Quote::ProductId" value="<%=""+productId %>" id="productIdHid" />
			<input type="hidden" name="answer(ProductId)" value="<%=""+productId %>"/>
			<input type="hidden" name="answer(Object::Quote::ProductId)" value="<%=""+productId %>"/>
			
			<input type="hidden" name="answer(Object::Quote::ProductVerId)" value="<%=""+ProductVerId %>" id="ProductVerIdHid" />
			<input type="hidden" name="answer(ProductVerId)" value="<%=""+ProductVerId %>"/>
			<bean:parameter id="parentQuoteVerId" name="answer(ParentQuoteVerId)"/>
			<input type="hidden" name="answer(ParentQuoteVerId)" value="<%=""+parentQuoteVerId %>"/>
			<bean:parameter id="ProductFamilyId" name="answer(ProductFamilyId)"/>
			<input type="hidden" name="answer(ProductFamilyId)" value="<%=""+ProductFamilyId %>"/>
			
			<!-- Rules Related Variables: START -->
			<input type="hidden" name="answer(RULE_OBJECT_ID)" value="<%=""+productId %>"/>
			<input type="hidden" name="answer(RULE_OBJECT_VER_ID)" value="<%=""+ProductVerId %>" />
			<input type="hidden" name="answer(RULE_OBJECT_TYPE)" value="PRODUCT"/>
			<input type="hidden" name="answer(RULE_OBJECT_NAME)" value="APPLICATION"/>
			<input type="hidden" name="answer(MERGE_BEFORE)" value="YES"/>
			<input type="hidden" name="answer(MERGE_AFTER)" value="NO"/>
			<input type="hidden" name="answer(ASSERT_MAP_ENTRIES)" value="YES" />
			<input type="hidden" name="answer(MODIFIED_FACT_MAP)" value="YES" />
			<input type="hidden" name="answer(DocumentType)" value="PROPOSAL" />
			<input type="hidden" name="answer(OwnerId)" value="<%=ownerId.toString()%>" />
			<input type="hidden" name="answer(ownerId)" value="<%=ownerId.toString()%>" id="ownerIdHid" />
			<input type="hidden" name="answer(Object::Quote::OwnerId)" value="<%=ownerId.toString()%>" />
			<input type="hidden" name="answer(Object::Validation::GeniusAddress)" value="<%=""+GeniusAddressValidation%>"/>
			<html:hidden property="answer(isUpdated)" value="Y" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
	<html:hidden property="answer(pagename)" value="<%=" Created Quote Proposal"%>" />
			<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" value="<%=RenewalPolicyNo.toString()%>" />
			<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" value="<%=RenewalPolicyCompany.toString()%>" />
			<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" value="<%=RenewalSubmissionNumber.toString()%>" />
			<!-- Rules Related Variables: END -->
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			<input type="hidden" name="answer(Object::Quote::ProductVerId)" value="<%=ProductVerId %>" />
			<input type="hidden" name="answer(Object::Quote::PrevSubQuoteVerId)" value="<%=prevSubQuoteVerId%>" />
			<html:hidden property="answer(Object::Rules::ActionForward)" value="<%="Y"%>" />
			<!--  added by mariraj for checkclearancefor Create Quote -->
			<html:hidden property="answer(Object::PageType)" value="CREATE_QUOTE_PRAPOSAL"/>
			<html:hidden property="answer(Object::UserDetail::roleName)" name="LoginPage"/>
			<html:hidden property="answer(parentQuoteId)" value="<%=strParentQuoteId%>" />
			<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=strParentQuoteVerId%>" />
			<input type="hidden" name="Object::Quote::QuoteVerId" value="<%=""+strParentQuoteVerId %>" id="strParentQuoteVerIdHid" />
			<html:hidden property="answer(SubQuoteId)" value="<%=strSubQuoteId%>" />
			<html:hidden property="answer(subQuoteVerId)" value="<%=strSubQuoteVerId%>" />
			<input type="hidden" name="subQuoteVerId" value="<%=""+strSubQuoteVerId %>" id="strSubQuoteVerIdHid" />
			<html:hidden property="answer(ParentQuoteVerId)" value="<%=strParentQuoteVerId%>" />
			<html:hidden property="answer(Object::Quote::SubQuoteId)" value="<%=strSubQuoteId%>" />		
			<input type="hidden" name="Object::Quote::SubQuoteId" value="<%=""+strSubQuoteId %>" id="strSubQuoteIdHid" />
			<html:hidden property="answer(isRenewalEndorsement)" value="<%=isRenewalEndorsement%>" />
			<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=quoteStartDate.toString()%>" />
		</td>
	</tr>

</table>    
</html:form>


<script type="text/javascript">
	function previewDoc(){
	var productId = document.getElementById('productIdHid').value;
	var ProductVerId = document.getElementById('ProductVerIdHid').value;
	var strParentQuoteId = document.getElementById('strParentQuoteIdHid').value;
	var strParentQuoteVerId = document.getElementById('strParentQuoteVerIdHid').value;
	var strSubQuoteId = document.getElementById('strSubQuoteIdHid').value;
	var strSubQuoteVerId = document.getElementById('strSubQuoteVerIdHid').value;
	var quoteTypeId = document.getElementById('QuoteTypeId').value;
	
	var ownerIdVal = document.getElementById('ownerIdHid').value;

	var pars =  '&answer(Object::Quote::ProductId)='+productId+'&answer(Object::Quote::ProductVerId)='+ProductVerId+'&answer(Object::Quote::ParentQuoteId)='+strParentQuoteId+
				'&answer(parentQuoteId)='+strParentQuoteId+'&answer(ParentQuoteVerId)='+strParentQuoteVerId+'&answer(Object::Quote::QuoteVerId)='+strParentQuoteVerId+
				'&answer(Object::Quote::SubQuoteId)='+strSubQuoteId+'&answer(subQuoteId)='+strSubQuoteId+'&answer(subQuoteVerId)='+strSubQuoteVerId+'&answer(isPreview)=true';

	
	var url = '../ExecuteMandatoryRules.do?'+pars;
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){
		var respText = transport.responseText.replace(/^\s+|\s+$/, '');
		if(respText == "success"){
			window.open('/PreviewProposalPdf.go?answer(DocumentType)=PROPOSAL&answer(Object::Quote::QuoteType)='+quoteTypeId+'&answer(DocumentListSource)=Quote&answer(QuoteId)='+strParentQuoteId+'&answer(subQuoteVerId)='+strSubQuoteVerId+'&answer(ownerId)='+ownerIdVal+'&answer(subQuoteId)='+strSubQuoteId+'&answer(isPreview)=<%=true%>');
		}else{
			document.forms[0].submit();	
		}
	}});
	}
</script>
<script type="text/javascript">
if(document.getElementById("quoteHeaderLink") != null && document.getElementById("quoteHeaderLink") != undefined){
	document.getElementById("quoteHeaderLink").onclick = function(){
	
		showHideHeader();
		var a = document.getElementById('Quote:TxtChange');
		var b = a.innerHTML;
		if(b == "Click here to hide detail") {
			document.getElementById('quoteheader_inner').style.height = "10em";
		}
		else {
			document.getElementById('quoteheader_inner').style.height = "1em";
		}
	}
}
</script>