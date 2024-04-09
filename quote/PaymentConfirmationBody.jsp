<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>

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
			
            String TotalParentQuotePremium = "";
            
            if(request.getParameter("answer(TotalPremium)")!=null)
			{
				TotalParentQuotePremium=request.getParameter("answer(TotalPremium)");
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
			
			String ProductId="";
			if(request.getParameter("answer(Object::Quote::ProductId)")!=null)
			{
				ProductId=request.getParameter("answer(Object::Quote::ProductId)");
			}
			
			com.dms.ejb.data.QuestionHashMap paymentMap = new com.dms.ejb.data.QuestionHashMap();
			if(request.getAttribute("DROOLS_MODIFIED_FACT_MAP") != null) {
				paymentMap = (com.dms.ejb.data.QuestionHashMap)(request.getAttribute("DROOLS_MODIFIED_FACT_MAP"));				
			}
			
			String ParentQuoteVerId="";
			if(request.getParameter("answer(ParentQuoteVerId)")!=null)
			{
				ParentQuoteVerId=request.getParameter("answer(ParentQuoteVerId)");
			}
			
			String SubQuoteId="";
			if(request.getParameter("answer(SubQuoteId)")!=null)
			{
				SubQuoteId=request.getParameter("answer(SubQuoteId)");
			}
			
			String subQuoteVerId="";
			if(request.getParameter("answer(subQuoteVerId)")!=null)
			{
				subQuoteVerId=request.getParameter("answer(subQuoteVerId)");
			}
		
		%>
<script type="text/javascript">
function disableButton( ){
document.getElementById("PaymentSubmit").disabled = true;	
}
</script>		
<html:form action="/PaymentAction.do" onsubmit="return disableButton( )">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="prodId" name="AddQuote" property="answer(ProductId)"/>
<bean:define id="prodVerId" name="AddQuote" property="answer(ProductVerId)"/>
<bean:define id="quoteType" name="AddQuote" property="answer(Object::Quote::QuoteType)"/>
<bean:define id="quoteStartDate" name="AddQuote" property="answer(Object::Quote::QuoteStartDate)"/>
<bean:define id="riskterritory" name="AddQuote" property="answer(riskTerritory)" />
<bean:define id="riskzone" name="AddQuote" property="answer(zone)" />
<bean:define id="productstatus" name="AddQuote" property="answer(productStatus)" />
<bean:define id="prdGroupVerId" name="AddQuote" property="answer(prdGroupVerId)" />
<bean:define id="prdGroupId" name="AddQuote" property="answer(prdGroupId)" />
<bean:define id="state" name="AddQuote" property="answer(State)" />
<bean:define id="custState" name="AddQuote" property="answer(CustomerState)" />
<bean:define id="familyId" name="AddQuote" property="answer(FamilyId)" />
<bean:define id="riskId" name="AddQuote" property="answer(RiskId)" />
<bean:define id="IsApplicationDisabled" name="AddQuote" property="answer(IsApplicationDisabled)" />

<%
if( ProductVerId == "" && ""+prodVerId != ""){
	ProductVerId = ""+prodVerId;
}
%>
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
														<jsp:param name="heading" value="<%="PAYMENT CONFIRMATION"%>" />
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
															<html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
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
															</tr><tr>	
														<td colspan="2" class="links">
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Quote Summary</a>
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
															<table width="100%" border="0" align="left">															
																<tr>
																	<td class="TextMatter" align="right">
																		Please verify Your payment details and confirm your request.
																	</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>
																
																<tr>
																	<td class="sectionhead1" align="left" WIDTH="40%">Payment Method</td>
																	<%String paymentMethod = paymentMap.getString("Object::Quote::Enrollment::Payment");%>
																	<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMethod %></td>
									
																</tr>
																<%
																if (paymentMethod.equals("") || paymentMethod.equals("Check")){
																%>
																The Payment mode you have choosed was through CHECK.
																
																	<tr>
																		<td class="sectionhead1" align="left">Check Number</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::ChkNumber") %></td>										
																	</tr>																
																	<tr>
																		<td class="sectionhead1" align="left">Bank Name</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::BankName") %></td>
																	</tr>
																	<tr>
																		<td class="sectionhead1" align="left">Check Issued Date (mm/dd/yyyy)</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::ChkDate") %></td>
																	</tr>
																<%
																} else if(paymentMethod.equals("ACH")){
																%>
																	<tr>
																		<td class="sectionhead1" align="left">Name of Financial Institution</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::InstitutionName") %></td>										
																	</tr>																
																	<tr>
																		<td class="sectionhead1" align="left">Account #</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::ACHAccountNumber") %></td>
																	</tr>
																	<tr>
																		<td class="sectionhead1" align="left">ABA Number</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::ABANumber") %></td>
																	</tr>
																	<tr>
																		<td class="sectionhead1" align="left">Account Type</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::AccountType") %></td>
																	</tr>
																	<tr>
																		<td class="sectionhead1" align="left">Account Name</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::AccountName") %></td>
																	</tr>
																<%
																} else if(paymentMethod.equals("Credit Card")){
																%>			
																	<tr>
																		<td class="sectionhead1" align="left">Credit Card Type</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::CardName") %></td>										
																	</tr>																
																	<tr>
																		<td class="sectionhead1" align="left">Credit Card #</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::CCAccountNumber") %></td>
																	</tr>
																	<tr>
																		<td class="sectionhead1" align="left">Expiration Date of Credit Card (MM/YY)</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::ExpirationDate") %></td>
																	</tr>
																	<tr>
																		<td class="sectionhead1" align="left">Security Code</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::SecurityCode") %></td>
																	</tr>
																	<tr>
																		<td class="sectionhead1" align="left">Cardholder's Name</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:<%=paymentMap.getString("Object::Quote::Enrollment::CardHolderName") %></td>
																	</tr>
																<% } %>
																<tr>
																		<td class="sectionhead1" align="left">Total Premium to be Paid</td>
																		<td class="TextMatter" align="left" WIDTH="60%">:$<%=""+TotalParentQuotePremium %></td>
																</tr>
															</table>
														</td>
													</tr>
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
												<td align="center" class="links" colspan="4">
													<INPUT TYPE="Submit" value="Confirm Payment" class="sbttn1" id="PaymentSubmit">
												</td>

											<td>
												<dmshtml:dms_button value="Cancel" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
											</td>
											<td>
												&nbsp;
											</td>
										</tr>

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
			
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%=prodId.toString()%>"/>
			<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=prodVerId.toString()%>"/>
			<!-- New hidder variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(ParentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteVerId)" value="<%=""+ParentQuoteVerId%>" />
			<html:hidden property="answer(ParentQuoteVerId)" value="<%=""+ParentQuoteVerId%>" />
            <html:hidden property="answer(SubQuoteId)" value="<%=""+SubQuoteId%>" />
			<html:hidden property="answer(subQuoteVerId1)" value="<%=""+subQuoteVerId%>" />
            <html:hidden property="answer(subQuoteVerId)" value="<%=""+subQuoteVerId%>" />
			<html:hidden property="answer(TotalPremium)" value="<%=""+TotalParentQuotePremium%>" />
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(subQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(Object::UserDetail::userName)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
			
			<html:hidden property="answer(Object::Quote::Enrollment::Payment)" value="<%=paymentMap.getString("Object::Quote::Enrollment::Payment")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::InstitutionName)" value="<%=paymentMap.getString("Object::Quote::Enrollment::InstitutionName")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::ACHAccountNumber)" value="<%=paymentMap.getString("Object::Quote::Enrollment::ACHAccountNumber")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::ABANumber)" value="<%=paymentMap.getString("Object::Quote::Enrollment::ABANumber")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::AccountType)" value="<%=paymentMap.getString("Object::Quote::Enrollment::AccountType")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::AccountName)" value="<%=paymentMap.getString("Object::Quote::Enrollment::AccountName")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::CardName)" value="<%=paymentMap.getString("Object::Quote::Enrollment::CardName")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::CCAccountNumber)" value="<%=paymentMap.getString("Object::Quote::Enrollment::CCAccountNumber")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::ExpirationDate)" value="<%=paymentMap.getString("Object::Quote::Enrollment::ExpirationDate")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::SecurityCode)" value="<%=paymentMap.getString("Object::Quote::Enrollment::SecurityCode")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::CardHolderName)" value="<%=paymentMap.getString("Object::Quote::Enrollment::CardHolderName")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::ChkNumber)" value="<%=paymentMap.getString("Object::Quote::Enrollment::ChkNumber")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::BankName)" value="<%=paymentMap.getString("Object::Quote::Enrollment::BankName")%>" />
			<html:hidden property="answer(Object::Quote::Enrollment::ChkDate)" value="<%=paymentMap.getString("Object::Quote::Enrollment::ChkDate")%>" />
			<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Bound" />
			<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+quoteType %>" />
			<html:hidden property="answer(DocumentType)" value="BINDER" />
			<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate %>" />
			<html:hidden property="answer(riskterritory)" value="<%=""+riskterritory %>" />
			<html:hidden property="answer(riskzone)" value="<%=""+riskzone%>" />
			<html:hidden property="answer(productstatus)" value="<%=""+productstatus%>" />
			<html:hidden property="answer(prdGroupVerId)" value="<%=""+prdGroupVerId%>" />
			<html:hidden property="answer(prdGroupId)" value="<%=""+prdGroupId%>" />
			<html:hidden property="answer(state)" value="<%=""+state%>" />
			<html:hidden property="answer(custState)" value="<%=""+custState%>" />
			<html:hidden property="answer(familyId)" value="<%=""+familyId%>" />
			<html:hidden property="answer(riskId)" value="<%=""+riskId%>" />
			<html:hidden property="answer(IsApplicationDisabled)" value="<%=""+IsApplicationDisabled%>" />
			
		</td>
	</tr>

</table>    



</html:form>


