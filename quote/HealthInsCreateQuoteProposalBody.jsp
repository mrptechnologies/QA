<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/QuoteSummary.js"> </SCRIPT>
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
			String strSubQuoteId="";
			if(request.getParameter("answer(subQuoteId)")!=null)
			{
				strSubQuoteId=request.getParameter("answer(subQuoteId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}

			
		String RuleStatusDetail="";


		
		%>
		<bean:parameter id="ruleStatus" name="status" value="nothing"/>
<script type="text/javascript">
	function checkActionSubmit(frm) {
	
	    return newchecksubmitcount();
		if(frm.proposalYES.checked) {
			return true;
		}
		window.history.back();
		return false;
	}
</script>		
<html:form action="/ValidateHealthInsQuoteProposalAction.do" onsubmit="return checkActionSubmit(this);">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>



<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>

<%
if(request.getParameter("quoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
<%
			}			
%>
<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="760px" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
							<tr>
								<td>
									<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		
										<tr>
											<td >
												<table width="60%" align="Left" border="0">
													<jsp:include page="../common/QuoteHeader.jsp">
														<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
														<jsp:param name="heading" value="<%="CREATE QUOTE PROPOSAL"%>" />
													</jsp:include>
												</table>
											</td>
										</tr>
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
															<html:hidden property="answer(OwnerId)" value="<%=ownerId.toString()%>" />
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
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Quote Summary</a>
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
																					
																			</td></tr>
																		</dmshtml:dms_static_with_connector>

															
															<!-- Rule Status & Messages :END -->
<tr>	
	<dmshtml:dms_isPresent property='<%=new String[]{"In Progress"}%>' value="<%=strParetQuoteStatus.toString()%>" negated="true">	
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


	<dmshtml:dms_isPresent property='<%=new String[]{"HEALTHINS_ELIGIBILITY_RULES_SUCCESS"}%>' value="<%=ruleStatus.toString()%>" negated="true">
		<td class="TextMatter" align="right">
			

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
														<%--<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=strParetQuoteStatus %>" /> --%>
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
											<%if(!ruleStatus.toString().equals("ruleFailure")){%>

												<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lost", "Rejected"}%>" value="<%=strParetQuoteStatus.toString()%>" >

													<dmshtml:dms_isPresent property='<%=new String[]{"MANDATORY_RULES_FAILED","HEALTHINS_ELIGIBILITY_RULES_SUCCESS","SUBMISSION_RULES_SUCCESS","failure"}%>' value="<%=ruleStatus.toString()%>" negated="false">
														<INPUT TYPE="Submit" value="Create Quote Proposal" class="sbttn1" disabled="disabled" id="QuoteProposalSubmit">
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

			<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
			 <html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			 <html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<html:hidden property="page" value="7" />
			
			
			<!-- New hidder variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(subQuoteId)" value="<%=""+strSubQuoteId%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Quote::Page)" value="" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			
			<bean:parameter id="productId" name="answer(ProductId)"/>
			<input type="hidden" name="answer(ProductId)" value="<%=""+productId %>"/>
			<input type="hidden" name="answer(ProductVerId)" value="<%=""+ProductVerId %>"/>
			<bean:parameter id="parentQuoteVerId" name="answer(ParentQuoteVerId)"/>
			<input type="hidden" name="answer(ParentQuoteVerId)" value="<%=""+parentQuoteVerId %>"/>
			<bean:parameter id="ProductFamilyId" name="answer(ProductFamilyId)"/>
			<input type="hidden" name="answer(ProductFamilyId)" value="<%=""+ProductFamilyId %>"/>		
			
			<!-- Rules Related Variables: START -->
			<input type="hidden" name="answer(RULE_OBJECT_ID)" value="<%=""+productId %>"/>
			<input type="hidden" name="answer(RULE_OBJECT_VER_ID)" value="<%=""+ProductVerId %>" />
			<input type="hidden" name="answer(RULE_OBJECT_TYPE)" value="PRODUCT"/>
			<input type="hidden" name="answer(RULE_OBJECT_NAME)" value="ELIGIBILITY_RULES"/>
			<input type="hidden" name="answer(MERGE_BEFORE)" value="YES"/>
			<input type="hidden" name="answer(MERGE_AFTER)" value="NO"/>
			<input type="hidden" name="answer(ASSERT_MAP_ENTRIES)" value="YES" />
			<input type="hidden" name="answer(MODIFIED_FACT_MAP)" value="YES" />
			<input type="hidden" name="answer(DocumentType)" value="PROPOSAL" />
			<input type="hidden" name="answer(OwnerId)" value="<%=ownerId.toString()%>" />
						<input type="hidden" name="answer(Object::Quote::QuoteStatus)" value="Offered" />
			
			<!-- Rules Related Variables: END -->
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			<input type="hidden" name="answer(Object::Quote::ProductVerId)" value="<%=ProductVerId %>" />
		</td>
	</tr>

</table>    



</html:form>


