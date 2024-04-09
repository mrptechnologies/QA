<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<%
String renewpolicyNumber="";
String policyId="";
String policyVerId="";
String isRenewalEndorsement = "";
String paretQuoteStatus = "";
boolean isRenewal = false;
	if(request.getParameter("answer(policyNumber)")!=null)
	{
		renewpolicyNumber=request.getParameter("answer(policyNumber)");
	}
	if(request.getParameter("answer(Object::Policy::ParentPolicyId)")!=null)
	{
		policyId=request.getParameter("answer(Object::Policy::ParentPolicyId)");
	}
	if(request.getParameter("answer(Object::Policy::ParentPolicyVerId)")!=null)
	{
		policyVerId=request.getParameter("answer(Object::Policy::ParentPolicyVerId)");
	}
	if(request.getParameter("paretQuoteStatus")!=null)
	{
		paretQuoteStatus=request.getParameter("paretQuoteStatus");
	}
	if(request.getParameter("answer(isRenewalEndorsement)")!=null)
	{
		isRenewalEndorsement=request.getParameter("answer(isRenewalEndorsement)");
		if(isRenewalEndorsement.equalsIgnoreCase("true")) {
			isRenewalEndorsement = "YES";
			isRenewal = true;
		}
	}
%>

<bean:define id="parentQuoteId" name="DeclineQuote" property="answer(parentQuoteId)" scope="request" />
<bean:define id="modQuoteNumber" name="DeclineQuote" property="answer(modQuoteNumber)" scope="request" />
<bean:define id="ProductId" name="DeclineQuote" property="answer(productId)" scope="request" />
<bean:define id="productVerId" name="DeclineQuote" property="answer(productVerId)" scope="request" />
<bean:define id="productStatus" name="DeclineQuote" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="groupId" name="DeclineQuote" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="groupVerId" name="DeclineQuote" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="customerId" name="DeclineQuote" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="DeclineQuote" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:define id="prevSubQuoteVerId" name="DeclineQuote" property="answer(prevSubQuoteVerId)" />

<html:form action="/SaveDeclineQuoteStatus.do" onsubmit="disableButton(this)">

<table WIDTH="95%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
<logic:notEqual parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >		
	<tr>
		<td>
			<jsp:include page="/common/QuoteHeaderCreateQuoteCoverMin.jsp">

				<jsp:param name="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
				<jsp:param name="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId%>" />
				
			</jsp:include>

		</td>
	</tr>
	</logic:notEqual>
	<tr>
		<td>
			<table WIDTH="95%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
			<logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >		
				<tr>
					<td>	
					<div id="QuoteInsuerdAgencyAgentHeader">
						<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
						</jsp:include>
					</div>
					</td>
				</tr>		
			 </logic:equal>

			<logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >		
				<tr>
					<td align="left" colspan=2>
						<table width="950px" align="left" border="0" >
							<tr>
							<td class="NewSectionHead" align="center">DECLINE QUOTE</td>
							</tr>
						</table>
					</td>
				</tr>
			</logic:equal>
	</table>			 
			 </td></tr>
				<tr>
					<td>
						<table WIDTH="95%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
					<logic:equal parameter="answer(Object::Quote::QuoteType)" value="ENDORSEMENT" scope="request" >		
						 	<tr>
								<td align="left">			
								<%if(isRenewal) { %>
									<jsp:include page="../common/DynamicPolicyHeader.jsp">
										<jsp:param name="policyId" value="<%=""+policyId%>" />
										<jsp:param name="policyVerId" value="<%=""+policyVerId.toString()%>" />
										<jsp:param name="policyNumber" value="<%=""+renewpolicyNumber%>" />
										<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
										<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
										<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
									</jsp:include>	
								<%} else { %>
									<jsp:include page="../common/DynamicPolicyHeader.jsp">
										<jsp:param name="policyId" value="<%=""+policyId%>" />
										<jsp:param name="policyVerId" value="<%=""+policyVerId.toString()%>" />
										<jsp:param name="policyNumber" value="<%=""+renewpolicyNumber%>" />
										<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
										<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
									</jsp:include>	
								<%} %>
								 </td>
						  	</tr>										
						 	<tr>
								<td align="left">	
									<jsp:include page="../common/EndorsementQuoteHeader.jsp">
										<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
										<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
									</jsp:include>	
								</td>
							</tr>	
						   </logic:equal>
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
												<table width="100%" border="0">
													<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
													<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
													<tr><td><html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
													</td></tr>
													<tr>
														<td colspan="2" class="links">
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=renewpolicyNumber.toString()%>&answer(Object::Policy::ParentPolicyId)=<%=policyId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=policyVerId.toString()%>" title="<bean:message key='ToolTip.DeclineQuote.QuoteSummary'/>">Quote Summary</a>
														</td>														
													</tr>
													<tr>													
														<td  colspan="6" align="center" class="sectionhead">
														
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
					<td align="left">
					<div class="SubjectivityPage">									
						<div class="content">							
						<div class="Subjectivityformhead"><h2 class="left">DECLINE QUOTE</h2></div>						
						<h3>Decline Details</h3>
						<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">	
							<tr>
								<td>
									<table WIDTH="75%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
										<tr>
											<td class="TextMatter1" align="right">					
												Reason for Declination
											</td>
											<td class="TextMatter1" align="left">
												<dmshtml:get_DropDown_Values dbname='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'  lookupType="Decline_Reason" nameInSession="dropDownValues" ownerId='<%=""+ownerId %>' />							
													<logic:present name="dropDownValues" scope="request">									
														<bean:define id="dropDownValueList" name="dropDownValues" type="java.util.ArrayList"/>			
															<html:select property="answer(Object::QuoteAdditional::DeclinationReason)" styleClass='txtbox' styleId="Decline_Reason" >
																<%for(int i=0;i<dropDownValueList.size();i++) {
																	com.dms.ejb.data.QuestionHashMap dropDownMap=(com.dms.ejb.data.QuestionHashMap)dropDownValueList.get(i);	
																%>											
																<html:option value ='<%=dropDownMap.getString("DropDownValue")%>'>
																	<%=dropDownMap.getString("DropDownDescription")%>
																</html:option>										
																<%}%>
															</html:select>
													</logic:present>
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>													
										<tr>
											<td class="TextMatter1" align="right">		
												Declination Notes
											</td>
											<td class="TextMatter1" align="left">
												<dmshtml:dms_textarea styleClass="txtarea" name="DeclineQuote"  property="answer(Object::QuoteAdditional::DeclinationNotes)" rows="6" cols="80"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table WIDTH="75%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										
										<tr>
											<td align="center" class="links" colspan="4"  title="<bean:message key='ToolTip.DeclineQuote.DeclineQuote'/>">												
													<INPUT TYPE="submit" value="Decline Quote" class="sbttn">												
											</td>
										</tr>
									</table>
								</td>
							</tr>
							</table></div></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<html:hidden property="TabPanelName" value="Quote_Panel" />
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId+"" %>" />
<html:hidden property="answer(Object::Notes::Active)" value="Y" />
<html:hidden property="answer(Object::Notes::Private)" value="Y" />
<html:hidden property="answer(Object::Notes::UserName)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Notes::UserRole)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />
<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Declined" />
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
<html:hidden property="answer(isRenewalEndorsement)" value="<%=""+ isRenewalEndorsement%>"/>
<html:hidden property="answer(pagename)" value="Decline page"/>	
<html:hidden name="DeclineQuote" property="answer(parentQuoteId)" value='<%=""+parentQuoteId %>' />
<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value="<%=""+prevSubQuoteVerId %>" />
<html:hidden property="answer(policyNumber)" value="<%=renewpolicyNumber.toString()%>"/>
<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=policyId.toString()%>"/>
<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>"/>
<html:hidden property="answer(Object::Notes::Description)" value="Declination Notes"/>
<script type="text/javascript">
document.getElementById("Quote:TxtChange").onclick = function(){
	var a = document.getElementById('Quote:TxtChange');
	var b = a.innerHTML;
	if(b == "Click here to show detail") {
		document.getElementById('quoteheader_inner').style.height = "10em";
	}
	else {
		document.getElementById('quoteheader_inner').style.height = "1em";
	}
}
document.getElementsByName("quoteHeaderImg")[0].onclick = function(){
	var a = document.getElementById('Quote:TxtChange');
	var b = a.innerHTML;
	if(b == "Click here to show detail") {
		document.getElementById('quoteheader_inner').style.height = "10em";
	}
	else {
		document.getElementById('quoteheader_inner').style.height = "1em";
	}
}
</script>
</html:form>