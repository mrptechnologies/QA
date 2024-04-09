<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>

<script type="text/javascript">
var flag = 0;
<!--
function alertStmt(frm)
{	
	var formElement=document.forms[0];		
	var prodStatus = formElement.prodStatus.value;
	alert("prodStatus-->"+prodStatus);
	return true;
}

function setAggregateClaimsLimit(){
  	document.getElementById("UserModifiedAggLimit").value = document.getElementById("AggregateLimit").value;
}
	
//-->
</script>
<link rel="stylesheet" href="../styles/structure.css" type="text/css">
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/Application.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/CoveragesLimits.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<html:form action="/EndorsementRateV2.do" onsubmit="return validateCoverages(this);">

<bean:define id="stateCode" name="AddParentQuote" property="answer(Object::Plan::StateCode)" />
<bean:define id="qmap" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />

	<%	
		boolean changePlan=false;
		String changePlanParentQuoteId="";
		String changePlanSubQuoteId="0";
		if(request.getParameter("changePlan")!=null) {
			changePlan = true;

		}

		if(changePlan){
			
			changePlanParentQuoteId = request.getParameter("answer(parentQuoteId)");
			if(changePlanParentQuoteId == null){
				changePlanParentQuoteId = ""+request.getAttribute("Object::Quote::ParentQuoteId");
				if(changePlanParentQuoteId.equals("")){
					changePlanParentQuoteId = ""+ request.getAttribute("QuoteId");
				}
			}
			changePlanSubQuoteId = request.getParameter("answer(subQuoteId)");
			if(changePlanSubQuoteId == null){
				changePlanSubQuoteId = ""+request.getAttribute("subQuoteId");
			}
			%>
			<html:hidden  property="answer(subQuoteId)" value="<%=changePlanSubQuoteId%>" />	
			<input type="hidden" name="changePlan" value="YES" />
			<%
		}
		boolean displayHRA=true;
		boolean displayComposite=true;
	%>
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
	<bean:define id="PlanNumber" property="answer(Plan::PlanNumber)" name="AddParentQuote" scope="request" />

	<%if(PlanNumber.toString().equals("")){%>
		<% PlanNumber = ""+request.getAttribute("subQuoteId");%>
	<%}%>
	<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
	<%if(request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)") != null){%>	
		<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)")%>'/>
	<%}%>
	<bean:define id="parentQuoteId" name="AddParentQuote" property="answer(Object::Quote::Id)" scope="request" /> 
	<bean:define id="parentQuoteVerId" name="AddParentQuote" property="answer(Object::Quote::QuoteVerId)" scope="request" /> 

	<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)" />
	<bean:define id="CustomerState" name="AddParentQuote" property="answer(Object::Quote::CustomerState)" />
	<bean:define id="oldCommissionPercentage" name="AddParentQuote" property="answer(Object::QuoteCommission::CommissionPercentage)" type="java.lang.String"/>
	<bean:define id="initCommissionPercentage" name="AddParentQuote" property="answer(Object::QuoteCommission::InitialCommissionPercentage)" type="java.lang.String"/>

	<bean:define id="oldCommissionFactor" name="AddParentQuote" property="answer(Object::PlanFactor::CommissionFactor)" type="java.lang.String"/>

	<bean:define id="AdjForNonStandardBenefitMedical" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitMedical)" type="java.lang.String"/>
	<bean:define id="AdjForNonStandardBenefitDrug" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitDrug)" type="java.lang.String"/>
	<bean:define id="AdjForNonStandardBenefitLife" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitLife)" type="java.lang.String"/>
	<bean:define id="AdjForNonStandardBenefitWdi" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitWdi)" type="java.lang.String"/>
	<bean:define id="AdjForNonStandardBenefitDentel" name="AddParentQuote" property="answer(Object::PlanFactor::AdjForNonStandardBenefitDentel)" type="java.lang.String"/>

	<bean:define id="RateImpacted" name="AddParentQuote" property="answer(Object::QuoteCommission::RateImpacted)" type="java.lang.String"/>
	<bean:define id="productVerId" name="AddParentQuote" property="answer(Object::Quote::ProductVerId)" scope="request" />
	<bean:define id="paretLockStatus" name="AddParentQuote" property="answer(Object::Quote::LockStatus)" />
	<bean:define id="paretQuoteStatus" name="AddParentQuote" property="answer(Object::Quote::QuoteStatus)" />
	
	<bean:parameter name="answer(policyNumber)" id="policyNumber"/>
	<bean:parameter name="answer(Object::Policy::ParentPolicyId)" id="parentPolicyId"/>
	<bean:parameter name = "answer(Object::Policy::ParentPolicyVerId)" id="parentPolicyVerId" />

	
<bean:define id="SubQuoteId1" name="AddParentQuote" property="answer(subQuoteId)" scope="request" />
<bean:define id="customerId1" name="AddParentQuote" property="answer(customerId)" scope="request" />
<bean:define id="prdGroupId1" name="AddParentQuote" property="answer(prdGroupId)" scope="request" />
<bean:define id="prdGroupVerId1" name="AddParentQuote" property="answer(prdGroupVerId)" scope="request" />
<bean:define id="productStatus1" name="AddParentQuote" property="answer(productStatus)" scope="request" />
<bean:define id="ProductId1" name="AddParentQuote" property="answer(ProductId)" scope="request" />
<bean:define id="productVerId1" name="AddParentQuote" property="answer(ProductVerId)" scope="request" />
<bean:define id="BasisFactor2MModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::BasisFactor2MModifiedFlag)" scope="request" />
<bean:define id="BasisFactor3MModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::BasisFactor3MModifiedFlag)" scope="request" />
<bean:define id="BasisFactor4MModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::BasisFactor4MModifiedFlag)" scope="request" />
<bean:define id="BasisFactor5MModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::BasisFactor5MModifiedFlag)" scope="request" />
<bean:define id="TerrorismFactorModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::TerrorismFactorModifiedFlag)" scope="request" />
<bean:define id="JudgementFactorModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::JudgementFactorModifiedFlag)" scope="request" />
<bean:define id="RateModifiationFactorModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::RateModificationFactorModifiedFlag)" scope="request" />
<bean:define id="TerrorismFactor" name="AddParentQuote" property="answer(Object::PlanFactor::TerrorismFactor)" scope="request" />
<bean:define id="JudgementFactor" name="AddParentQuote" property="answer(Object::PlanFactor::JudgementFactor)" scope="request" />
<bean:define id="RateModificationFactor" name="AddParentQuote" property="answer(Object::PlanFactor::RateModificationFactor)" scope="request" />


<html:hidden name="AddParentQuote" property="answer(ProductId)" value='<%=""+ProductId1%>' />
<html:hidden name="AddParentQuote" property="answer(productVerId)" value='<%=""+productVerId1%>' />
<html:hidden name="AddParentQuote" property="answer(SubQuoteId)" value='<%=""+SubQuoteId1%>' />
<html:hidden name="AddParentQuote" property="answer(customerId)" value='<%=""+customerId1%>' />
<html:hidden name="AddParentQuote" property="answer(prdGroupId)" value='<%=""+prdGroupId1%>' />
<html:hidden name="AddParentQuote" property="answer(prdGroupVerId)" value='<%=""+prdGroupVerId1%>' />
<html:hidden name="AddParentQuote" property="answer(productStatus)" value='<%=""+productStatus1%>' />


<bean:define id="isRetroActivedateVaries" name="AddParentQuote" property="answer(Object::Plan::IsRetroActiveDateVaries)" scope="request" />
<bean:define id="isDeductibleVaries" name="AddParentQuote" property="answer(Object::Plan::IsDeductibleVaries)" scope="request" />
<bean:define id="ExpiringCarrrier" name="AddParentQuote" property="answer(Object::Plan::ExpiringCarrier)" scope="request" />
<bean:define id="Effdate" name="AddParentQuote" property="answer(Object::Plan::EffectiveDate)" scope="request" />
<bean:define id="Expdate" name="AddParentQuote" property="answer(Object::Plan::ExpirationDate)" scope="request" />
<bean:define id="RequestedCoveragesExpiring" name="AddParentQuote" property="answer(Object::Plan::RequestingCoverageAsExpired)" scope="request" />
<bean:define id="usCurrency" name="AddParentQuote" property="answer(Object::Plan::ExpiringPremium)" scope="request" />
<bean:define id="Retrodate" name="AddParentQuote" property="answer(Object::Plan::RequestedRetroDate)" scope="request" />


<html:hidden  property="answer(Object::Submission::ExpDate)" value='<%=""+Expdate %>' styleId="CoveragesExpDate"/>
<html:hidden  property="answer(Object::Submission::EffDate)" value='<%=""+Effdate %>' styleId="CoveragesEffDate"/>
<html:hidden  property="answer(Object::Submission::ExpiringCarrier)" value='<%=""+ExpiringCarrrier %>' styleId="CoveragesExpiringCarrier"/>
<html:hidden  property="answer(Object::Submission::RetroDate)" value='<%=""+Retrodate %>' styleId="RetroDate"/>
<html:hidden  property="answer(Object::Submission::ExpiringPremium)" value='<%=""+usCurrency %>' styleId="ExpPremium"/>
<html:hidden  property="answer(Object::Submission::RequestedCoveragesExpiring)" value='<%=""+RequestedCoveragesExpiring %>' styleId="ReqCoveragesExpiring"/>
<html:hidden  property="answer(Object::Submission::RetroActivedateVaries)" value='<%=""+isRetroActivedateVaries %>' styleId="RetroActivedateVaries"/>
<html:hidden  property="answer(Object::Submission::DeductibleVaries)" value='<%=""+isDeductibleVaries %>' styleId="DeductibleVaries"/>

<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::TerrorismFactor)" value='<%=""+TerrorismFactor%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::JudgementFactor)" value='<%=""+JudgementFactor%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::RateModificationFactor)" value='<%=""+RateModificationFactor%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::BasisFactor2MModifiedFlag)" value='<%=""+BasisFactor2MModifiedFlag%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::BasisFactor3MModifiedFlag)" value='<%=""+BasisFactor3MModifiedFlag%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::BasisFactor4MModifiedFlag)" value='<%=""+BasisFactor4MModifiedFlag%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::BasisFactor5MModifiedFlag)" value='<%=""+BasisFactor5MModifiedFlag%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::TerrorismFactorModifiedFlag)" value='<%=""+TerrorismFactorModifiedFlag%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::JudgementFactorModifiedFlag)" value='<%=""+JudgementFactorModifiedFlag%>' />
<html:hidden name="AddParentQuote" property="answer(Object::PlanFactor::RateModificationFactorModifiedFlag)" value='<%=""+RateModifiationFactorModifiedFlag%>' />
<%--
<html:hidden  property="answer(Object::Submission::EffDate)" value='<%=""+Effdate %>' styleId="CoveragesEffDate"/>
						<html:hidden  property="answer(Object::Submission::ExpDate)" value='<%=""+Expdate %>' styleId="CoveragesExpDate"/>
						<html:hidden  property="answer(Object::Submission::ExpiringCarrier)" value='<%=""+ExpiringCarrrier %>' styleId="CoveragesExpiringCarrier"/>
						<html:hidden  property="answer(Object::Submission::RetroDate)" value='<%=""+Retrodate %>' styleId="RetroDate"/>
						<html:hidden  property="answer(Object::Submission::ExpiringPremium)" value='<%=""+usCurrency %>' styleId="ExpPremium"/>
						<html:hidden  property="answer(Object::Submission::IncidentLimit)" value='<%=""+incidentLimit %>' styleId="CoveragesIncidentLimit"/>
						<html:hidden  property="answer(Object::Submission::AggregateLimit)" value='<%=""+aggregateLimit %>' styleId="CoveragesAggregateLimit"/>
						<html:hidden  property="answer(Object::Submission::Deductible)" value='<%=""+deductible %>' styleId="CoveragesDeductible"/>
						<html:hidden  property="answer(Object::Submission::RequestedCoveragesExpiring)" value='<%=""+RequestedCoveragesExpiring %>' styleId="ReqCoveragesExpiring"/>
						<html:hidden  property="answer(Object::Submission::RetroActivedateVaries)" value='<%=""+isRetroActivedateVaries %>' styleId="RetroActivedateVaries"/>
					      <html:hidden  property="answer(Object::Submission::DeductibleVaries)" value='<%=""+isDeductibleVaries %>' styleId="DeductibleVaries"/>
								

 --%>


<bean:define id="teritory" name="AddParentQuote" property="answer(Object::Plan::Territory)" />


	<%System.out.println("Created Parent Quote Id/Parent Quote VerId is--> "+ parentQuoteId+"/"+parentQuoteVerId);%>
	<bean:parameter id="HEADING" name="heading" value="COVERAGES & LIMIT"/>

	<table WIDTH="95%" ALIGN="center" border="0" cellspacing="1" cellpadding="1">
		<tr>
			<td colspan="2">
				<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="false">										
					<tr>
						<td>
							<div id="QuoteInsuerdAgencyAgentHeader">
								<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
								<jsp:param name="parentQuoteId" value="<%=""+changePlanParentQuoteId%>" />
								<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
								</jsp:include>
							</div>
						</td>
					</tr>					
					<tr>
						<td align="left" colspan=2>
							<table width="950px" align="left" border="0" >
								<tr>
								<td class="NewSectionHead" align="center"><%=HEADING.toString()%></td>
								</tr>
							</table>
						</td>
					</tr>														
					<%if(changePlan==true){ parentQuoteId=changePlanParentQuoteId;%>

					<% boolean isRenewal = false; %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId1) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Bound","Lapsed","Referred","Issued","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal=true;
						//objectType = "RENEWAL";%>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					 	<tr>
							<td align="left">			
							<%if(isRenewal) { %>
								<jsp:include page="../common/DynamicPolicyHeader.jsp">
									<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
									<jsp:param name="policyVerId" value="<%=""+parentPolicyVerId.toString()%>" />
									<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
									<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
									<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
									<jsp:param name="title" value="<%="EXPIRING POLICY SUMMARY"%>" />
								</jsp:include>	
							<%} else { %>
								<jsp:include page="../common/DynamicPolicyHeader.jsp">
									<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
									<jsp:param name="policyVerId" value="<%=""+parentPolicyVerId.toString()%>" />
									<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
									<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
									<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
								</jsp:include>	
							<%} %>
							 </td>
					  	</tr>										
					
						<tr>
							<td>
								<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
								 	<tr>
										<td align="left">	
											<jsp:include page="../common/EndorsementQuoteHeader.jsp">
												<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
												<jsp:param name="isRenewal" value="<%=""+isRenewal%>" />
											</jsp:include>	
										</td>
									</tr>		
								</table>	
							</td>
						</tr>	

					<% } else{ %>
					<tr>
						<td>
							<table width="60%" align="Left" border="0">
								<jsp:include page="../common/QuoteHeader.jsp">
									<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
									<jsp:param name="productVerId" value="<%=""+productVerId%>" />
									<jsp:param name="heading" value="<%=HEADING.toString()%>" />
								</jsp:include>
							</table>
						</td>
					</tr>
					<%}%>
								
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true">
				<tr>
					<td>
						<bean:define id="prodId" name="AddParentQuote" property="answer(Object::Quote::ProductId)" />
							<%
								long productId = 0;
								try{
									productId = Long.parseLong(""+prodId);
								}catch(Exception ex){}
							%>
						<jsp:include page="/common/PolicyQuoteHeaderCoverMin.jsp">											
							<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+parentQuoteId%>" />
							<jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="productVerId" value="<%=""+productVerId%>" />
							<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />	
							<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />	
							<jsp:param name="customerId" value="<%=""+customerId1%>" />											
						</jsp:include>		 										
					</td>											
				</tr>	
				<tr>
					<td>
						<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
						 	<tr>
								<td align="left">				
									<jsp:include page="../common/DynamicPolicyHeaderUI3.jsp">
										<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
										<jsp:param name="policyVerId" value="<%=""+parentPolicyVerId%>" />
										<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
										<jsp:param name="prodId" value="<%=""+productId%>" />
										<jsp:param name="ProductVerId" value="<%=""+productVerId%>" />								
										<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
									</jsp:include>
								 </td>
						  	</tr>
						</table>
					</td>
				</tr>						
			</dmshtml:dms_static_with_connector>
			<%long subquoteid=0; 
			if((""+SubQuoteId1).length()>0 && ""+SubQuoteId1 != null ){
				subquoteid= Long.parseLong(""+SubQuoteId1); 
			}
			if(subquoteid !=0 && subquoteid!=-1){ %>
					<tr>
						<td colspan="2">
							<table width="100%" align="center" border="0">		
								<!-- jsp:include page="../common/QuotePlanInfoHeader.jsp" -->
									<!--jsp:param name="subQuoteId" value="<%=""+SubQuoteId1%>" /-->	
									<!--jsp:param name="customerId" value="<%=""+customerId1%>" /-->	
									<!--jsp:param name="productId" value="<%=""+ProductId1%>" /-->	
									<!--jsp:param name="productVerId" value="<%=""+productVerId1%>" /-->
									<!--jsp:param name="prdGroupId" value="<%=""+prdGroupId1%>" /-->	
									<!--jsp:param name="prdGroupVerId" value="<%=""+prdGroupVerId1%>" /-->
									<!--jsp:param name="productStatus" value="<%=""+productStatus1%>" /-->
								<!-- /jsp:include-->
							</table>
						</td>
					</tr> 
				<%} %>
					
					
					<tr>
						<td colspan="4">
							<table width="60%" align="left" border="0">
								
								<%
									boolean errorOccured=false;
								%>
								<bean:define id="ansmap" name="AddParentQuote"
								property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
								<logic:iterate id="element" name="ansmap">
								<bean:define id="errorListkey" name="element" property="key" />
								<logic:equal name="errorListkey" value="Object::error::list">
								<bean:define id="errorListvalue" name="element" property="value" />
								<logic:iterate id="errmsg" name="errorListvalue">
								<tr>
									<td class="Error"><bean:write name="errmsg"
										property="errorMessage" /> <%
        								errorOccured	=true;
				
										%>
									</td>
								</tr>
								</logic:iterate>
								</logic:equal>
								</logic:iterate>

								<% if(errorOccured)
								{
									((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
								}
								%>
								<tr>
								 	<td class="Error">
										<logic:present name="MESSAGE_LIST" scope="request">
											<ul>
												<logic:iterate id="message" name="MESSAGE_LIST">
													<li><bean:write name="message"/></li>
													<%errorOccured	=true;%>
												</logic:iterate>
											</ul>			
										</logic:present>
									</td>
								</tr>
						
							</table>
						</td>
					</tr>

					<tr>

						<td colspan="2" class="links">	
							<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>"  title="<bean:message key='ToolTip.CoveragesLimits.QuoteSummary'/>">Quote Summary</a>
						</td>
					</tr>
					<logic:equal value="COVERAGES & LIMIT" name="HEADING">
					<tr>
						<td  colspan="6" align="center" class="sectionhead">
							Select Coverages and Limits 
						</td>
					</tr>
					</logic:equal>
					<logic:equal value="CANCEL OPTIONS" name="HEADING">
					<tr>
						<td  colspan="6" align="center" class="sectionhead">
							SELECT <%=""+HEADING %> 
						</td>
					</tr>
					</logic:equal>
					<tr>
						<td>
							&nbsp;
						</td>
					</tr>
	
					<tr>
						<td colspan="4">
							<table WIDTH="85%" ALIGN="center" cellspacing="6" cellpadding="0" border="0">
								<bean:define id="ProductGroupName" name="PRODUCT_GROUP_NAME" type="java.lang.String" />
								<logic:equal value="COVERAGES & LIMIT" name="HEADING">
								<tr>
									<td class="sectionhead" ALIGN="center">
										Plan Name&nbsp;&nbsp;&nbsp;&nbsp;<%=ProductGroupName%>
										<input type="hidden" name="answer(PRODUCT_GROUP_NAME)" value="<%=ProductGroupName%>"/>
										<html:hidden property="answer(Object::PageType)" styleId="PageType" value="YES"/>
									</td>
									
								</tr>
								</logic:equal>
								<logic:equal value="CANCEL OPTIONS" name="HEADING">
								<tr>
									<td class="sectionhead" ALIGN="center">
										Plan Name&nbsp;&nbsp;&nbsp;&nbsp;<%=ProductGroupName%>
										<input type="hidden" name="answer(PRODUCT_GROUP_NAME)" value="<%=ProductGroupName%>"/>
									</td>
									
								</tr>
								</logic:equal>
								<bean:define id="ProductGroupVerId" name="AddParentQuote" property="answer(Object::Quote::ProductGroupVerId)" />
								<bean:define id="prodId" name="AddParentQuote" property="answer(Object::Quote::ProductId)" />
								<%
									long productId = 0;
									try{
										productId = Long.parseLong(""+prodId);
									}catch(Exception ex){}
								%>

			
								
							    <html:hidden property="answer(Object::Quote::CompositeRate)" value="No" />
							    <html:hidden property="answer(Object::Quote::HelthHra)" value="No" />
					
							
												
								<tr>

									
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</td>
		</tr>
		<tr><td class="Error"><html:text style="display:none;border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;#ff0000;COLOR:ff0000" styleId="ErrorContainer" disabled="disabled" property="answer(Object::Risk::ResProperty::RuleQuestion)" styleClass="txtbox" size="35" maxlength="35" readonly="true"/>	</td></tr>

<tr><td>
<div class="formpage1">	
<div class="content">
<div class="formhead"><h2 class="left"><logic:equal value="COVERAGES & LIMIT" name="HEADING">Coverages and Limits</logic:equal><logic:equal value="CANCEL OPTIONS" name="HEADING">Cancel Endorsement</logic:equal></h2></div>  
	<bean:parameter id="IsOptionDisabled" name="answer(IsOptionDisabled)" value="N"/>
	<logic:notEqual name="IsOptionDisabled" value="Y">
	<div id='content' >
		<html:hidden property="answer(form::ForwordControl)" styleId="fc"/>
		<logic:equal value="COVERAGES & LIMIT" name="HEADING">
		
		<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'>
			<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="RATE_AVAILABLE" property='<%=new String[]{""}%>' value="" negated="true">
				<div class='navValue' title="<bean:message key='ToolTip.CoveragesLimits.Rate'/>"><INPUT TYPE='submit' value='Rate' class="covbutton left" id="RateTop" onclick="return goSubmit(document.AddParentQuote.RateTop,'Rate')" name='answer(form::ForwordControl1)'></div>
			</dmshtml:isFeatureAvailableForProductRoleStatus>
		</div>

		
	
	</logic:equal>
	<logic:equal value="COVERAGES & LIMIT" name="HEADING">
		<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'>
	
	<div class='navValue' title="<bean:message key='ToolTip.CoveragesLimits.Save'/>">
	<INPUT TYPE='submit' value='Save' id="SaveTop"  class='covbutton left' onclick="return goSubmit(document.AddParentQuote.SaveTop,'Save')" name='answer(form::ForwordControl1)'></div></div></logic:equal>
	</div></div>
	<div id='loadercontent1' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Loading....
	</div>
	</logic:notEqual>
<logic:present name="OPTIONS_HTML" scope="request">
<bean:define id="htmlPage" name="OPTIONS_HTML"	type="java.lang.StringBuffer" />
<div id="OPTIONS_DIV">
<%out.println(htmlPage.toString());%>
</div>
<html:hidden  property="answer(AJAX_Rating)" value="N" styleId="AJAX_Rating"/>
</logic:present>
<%String tooltip=""; %>
	<logic:notEqual name="IsOptionDisabled" value="Y">
	<div id='content' >
	<logic:equal value="COVERAGES & LIMIT" name="HEADING">
		<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="RATE_AVAILABLE" property='<%=new String[]{""}%>' value="" negated="true">
			<div class='navValue' title="<bean:message key='ToolTip.CoveragesLimits.Rate'/>"><INPUT TYPE='submit' value='Rate' class="covbutton left" id="RateBottom" onclick="return goSubmit(document.AddParentQuote.RateBottom,'Rate')" name='answer(form::ForwordControl1)'></div>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		<%tooltip="ToolTip.CoveragesLimits.Save";%>		
	</div>
	</logic:equal>
	<logic:equal value="CANCEL OPTIONS" name="HEADING"><%tooltip="ToolTip.Cancel.Save";%></logic:equal>
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'><div class='navValue' title="<bean:message key='<%=tooltip%>'/>"><INPUT TYPE='submit' value='Save' id="SaveBottom" class="covbutton left" onclick="return goSubmit(document.AddParentQuote.SaveBottom,'Save')" name='answer(form::ForwordControl1)'></div></div>
	</div>
	<div id='loadercontent2' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Loading....
	</div>
	</logic:notEqual>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>					
												

				<TABLE>
<TR>
		<TD>

		
			<!--/logic:present--> 
			<!--html:hidden name="AddParentQuote" property="answer(Object::Product::ProductState)" value="RELEASED" /-->
<html:hidden property="dirty" styleId="dirty" value="N" />
			<html:hidden property="answer(IsOptionDisabled)" value="<%=IsOptionDisabled.toString()%>" /> 
			<html:hidden property="IsOptionDisabled" value="<%=IsOptionDisabled.toString()%>" /> 
			<bean:parameter id="userId" name="answer(userId)" /> 
			<html:hidden property="answer(userId)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(user)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" /> 
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<%if(changePlan==true){%> 
				<html:hidden  property="answer(parentQuoteId)" value="<%=changePlanParentQuoteId%>" />				
			<%} else {
			%>
			<html:hidden  property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
			<%}%>
			<html:hidden  property="answer(Object::Quote::QuoteVerId)" value="<%=parentQuoteVerId.toString()%>" />
			<html:hidden  property="quoteId" value="<%=parentQuoteId.toString()%>" />
			
			
			<html:hidden property="answer(dbname)"				value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
							
			<html:hidden  property="answer(SearchAvailableplans::PageNum)" value="0" />

			<bean:define id="AreaNetWorkKey" name="AddParentQuote" property="answer(Object::Quote::AreaNetWorkKey)" scope="request"/>
			
			<html:hidden property="answer(Object::Quote::AreaNetWorkKey)" value="<%=AreaNetWorkKey.toString()%>" />
			
			<html:hidden  property="answer(Object::Quote::QuoteNumber)" value="<%=""+PlanNumber%>" />
	
		
		


			<bean:define id="AddPlan" name="AddParentQuote" property="answer(Plan::AddPlan)" scope="request"/>
			<html:hidden property="answer(Plan::AddPlan)" value="<%=""+AddPlan%>" />

			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(AreaNetWorkKey)" value="<%=AreaNetWorkKey.toString()%>" />
			<html:hidden property="answer(parentQuoteIdtoAssociate)" value="<%=parentQuoteId.toString()%>" />
			<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
			<bean:define id="quoteStartDate" name="AddParentQuote" property="answer(Object::Quote::QuoteStartDate)" scope="request" />
			<html:hidden  property="answer(Object::Quote::QuoteStartDate)" value="<%=quoteStartDate.toString()%>" styleId="referenceEffectiveDate"/>
			<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=parentQuoteId.toString()%>" />
			<bean:define id="CompositeRate" name="AddParentQuote" property="answer(Object::Quote::CompositeRate)" />
			<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=CompositeRate.toString()%>" />
			<bean:define id="HelthHra" name="AddParentQuote" property="answer(Object::Quote::HelthHra)" />
			<html:hidden property="answer(Object::Quote::HelthHra)" value="<%=HelthHra.toString()%>" />
			<html:hidden property="answer(Object::Quote::Id)" value="<%=changePlanSubQuoteId.toString()%>" />
			<html:hidden property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
		

			<bean:define id="NoOfMedicalEmployees" name="AddParentQuote" property="answer(Object::Quote::NoOfMedicalEmployees)" scope="request"/>
			<html:hidden property="answer(Object::Quote::NoOfMedicalEmployees)" value="<%=NoOfMedicalEmployees.toString()%>" />
		
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>" />
			<html:hidden property="answer(Object::Quote::ProductGroupVerId)" value="<%=ProductGroupVerId.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductGroupName)" value="<%=ProductGroupName.toString()%>" />
			
			<% String prodStatus = ""; %>
			<% if(request.getParameter("answer(Object::Quote::ProductStatus)") != null ) {
				
				prodStatus = "" + request.getParameter("answer(Object::Quote::ProductStatus)");%>
			<%}%>
			
			<html:hidden property="answer(Object::Quote::ProductStatus)" value='<%=""+prodStatus%>' styleId="prodStatus" />
			
			<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>" />
			<html:hidden   property="answer(Object::Quote::QuoteType)"  value="ENDORSEMENT" />
			<html:hidden property="answer(PlanNameDisPly)" value="<%=""+ProductGroupName%>" />
			<html:hidden  property="answer(Object::Plan::PlanNameDisply)" value="<%=""+ProductGroupName%>" />
			
			
			<html:hidden property="answer(Object::QuoteCommission::CommissionPercentage)" value="<%=""+oldCommissionPercentage%>" />
			<html:hidden property="answer(Object::QuoteCommission::InitialCommissionPercentage)" value="<%=""+initCommissionPercentage%>" />
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>" />
			<html:hidden property="answer(Object::Quote::ProductGroupVerId)" value="<%=ProductGroupVerId.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductGroupName)" value="<%=ProductGroupName.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductStatus)" value='<%=""+prodStatus%>' style="Id: prodStatus" />
			
			<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>" />
			<html:hidden   property="answer(Object::Quote::QuoteType)"  value="NEW_BUSINESS" />
			<html:hidden property="answer(PlanNameDisPly)" value="<%=""+ProductGroupName%>" />
			<html:hidden  property="answer(Object::Plan::PlanNameDisply)" value="<%=""+ProductGroupName%>" />
			
			
			<html:hidden property="answer(Object::QuoteCommission::CommissionPercentage)" value="<%=""+oldCommissionPercentage%>" />
			<html:hidden property="answer(Object::QuoteCommission::InitialCommissionPercentage)" value="<%=""+initCommissionPercentage%>" />
			


				<html:hidden property="answer(Object::PlanFactor::CommissionFactor)" value="<%=""+oldCommissionFactor%>" />
				<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitMedical)" value="<%=""+AdjForNonStandardBenefitMedical%>" />
			<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitDrug)" value="<%=""+AdjForNonStandardBenefitDrug%>" />
			<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitLife)" value="<%=""+AdjForNonStandardBenefitLife%>" />
			<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitWdi)" value="<%=""+AdjForNonStandardBenefitWdi%>" />
			<html:hidden property="answer(Object::PlanFactor::AdjForNonStandardBenefitDentel)" value="<%=""+AdjForNonStandardBenefitDentel%>" />
	
				<html:hidden property="answer(Object::QuoteCommission::RateImpacted)" value="<%=""+RateImpacted%>" />
				<bean:define id="QuoteStatus" name="AddParentQuote"  property="answer(Object::Quote::QuoteStatus)"/>
				<input type="hidden" name="answer(Object::Quote::QuoteStatus)" value="<%=""+QuoteStatus%>"/>
				<html:hidden property="answer(System::flag::removeArrObjectDetail)" value="yes" />	
			
	
	<html:hidden property="answer(Object::UserDetail::roleName)" name="LoginPage" />
	<bean:define id="PLResRiskPropertyId" name="AddParentQuote" property="answer(Object::Plan::PLResRiskPropertyId)" />
	<html:hidden property="answer(Object::Plan::PLResRiskPropertyId)" value="<%=""+PLResRiskPropertyId%>" />
	
	
	<bean:define id="DiscrLossSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::DiscretionaryLossSurcharge_Factor)" />
	<bean:define id="DiscMiscSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::DiscretionaryMiscSurcharge_Factor)" />
	
	
	<bean:define id="LossSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::LossSurcharge_Factor)" />
	<bean:define id="MiscSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::MiscSurcharge_Factor)" />
	
	<html:hidden property="answer(Object::PlanFactor::LossSurcharge_Factor)" value="<%=""+LossSurchargeFactor %>" />	
	<html:hidden property="answer(Object::PlanFactor::MiscSurcharge_Factor)" value="<%=""+MiscSurchargeFactor %>" />
	
	
	<bean:define id="DefaultPolicyFee" name="AddParentQuote" property="answer(Object::Plan::DefaultPolicyFee)" />
	<bean:define id="StampFee" name="AddParentQuote" property="answer(Object::Plan::StampFee)" />
	<bean:define id="SurplusLinesTax" name="AddParentQuote" property="answer(Object::Plan::SurplusLinesTax)" />
	<bean:define id="FilingFee" name="AddParentQuote" property="answer(Object::Plan::FilingFee)" />
	<bean:define id="InspectionFee" name="AddParentQuote" property="answer(Object::Plan::InspectionFee)" />
	<bean:define id="Deductible_CreditOverride_Factor" name="AddParentQuote" property="answer(Object::PlanFactor::Deductible_CreditOverride_Factor)" />
	<bean:define id="LosssurchargeUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::LosssurchargeUWModifiedFlag)" />
	<bean:define id="Deductible_CreditOverrideUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::Deductible_CreditOverrideUWModifiedFlag)" />
	<bean:define id="submissionId" name="AddParentQuote" property="answer(Object::Quote::SubmissionId)" scope="request" /> 
	<bean:define id="submissionVerId" name="AddParentQuote" property="answer(Object::Quote::SubmissionVerId)" scope="request" /> 
	<bean:define id="IsRegulatorySurchargeApplicable" name="AddParentQuote" property="answer(Object::Plan::IsRegulatorySurchargeApplicable)"/>
	<bean:define id="RegulatorySurchargeFactor" name="AddParentQuote" property="answer(Object::Plan::RegulatorySurchargeFactor)"/>
	<bean:define id="RegulatorySurcharge" name="AddParentQuote" property="answer(Object::Plan::RegulatorySurcharge)"/>
	<bean:define id="submissionVerId" name="AddParentQuote" property="answer(Object::Quote::SubmissionVerId)" scope="request" />
	<html:hidden  property="answer(Object::Quote::SubmissionId)" value='<%=""+submissionId%>' />
    <html:hidden  property="answer(Object::Quote::SubmissionVerId)" value='<%=""+submissionVerId%>' />		
	
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryLossSurcharge_Factor)" value="<%=""+DiscrLossSurchargeFactor %>" />	
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryMiscSurcharge_Factor)" value="<%=""+DiscMiscSurchargeFactor %>" />
	<html:hidden property="answer(Object::PlanFactor::Deductible_CreditOverride_Factor)" value="<%=""+Deductible_CreditOverride_Factor %>" />
	<html:hidden property="answer(Object::PlanFactor::LosssurchargeUWModifiedFlag)" value="<%=""+LosssurchargeUWModifiedFlag %>" />
	<html:hidden property="answer(Object::PlanFactor::Deductible_CreditOverrideUWModifiedFlag)" value="<%=""+Deductible_CreditOverrideUWModifiedFlag %>" />
	
	
	<html:hidden  property="answer(Object::Plan::IsRegulatorySurchargeApplicable)" value="<%=""+IsRegulatorySurchargeApplicable%>" />
	<html:hidden  property="answer(Object::Plan::RegulatorySurcharge)" value="<%=""+RegulatorySurcharge%>" />
	<html:hidden  property="answer(Object::Plan::RegulatorySurchargeFactor)" value="<%=""+RegulatorySurchargeFactor%>" />
	<html:hidden  property="answer(Object::Plan::DefaultPolicyFee)" value="<%=""+DefaultPolicyFee %>" />
	<html:hidden  property="answer(Object::Plan::StampFee)" value="<%=""+StampFee %>" />
	<html:hidden  property="answer(Object::Plan::SurplusLinesTax)" value="<%=""+SurplusLinesTax %>" />
	<html:hidden  property="answer(Object::Plan::FilingFee)" value="<%=""+FilingFee %>" />
	<html:hidden  property="answer(Object::Plan::InspectionFee)" value="<%=""+InspectionFee %>" />				
	<html:hidden  property="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId %>" />	
	<html:hidden  property="answer(PageFrom)" styleId="pagefrom" value="EndorsementCovLimit" />
<html:hidden  property="answer(Object::Plan::BaseRateId)" value="1" />	
<%if(teritory.toString().equalsIgnoreCase("")){
	teritory = 1;
} %>
<html:hidden property="answer(Object::Plan::StateCode)" value="<%=stateCode.toString()%>" />
<html:hidden property="answer(Object::Plan::Territory)" value="<%=""+teritory %>"/>
<html:hidden property="answer(Object::Risk::Teritory)" value="<%=""+teritory %>"/>
 <html:hidden property="answer(Object::Quote::CustomerState)" value='<%=CustomerState.toString()%>' styleId="state"/>
 
 <bean:define id="FamilyId" name="AddParentQuote" property="answer(Object::Quote::ProductFamilyId)" />
 <html:hidden property="answer(Object::Quote::ProductFamilyId)" value="<%=""+FamilyId%>"/> 
  <html:hidden property="answer(Option::DefaultValue)" value="No"/> 
  <html:hidden property="answer(Object::Quote::PolicyPeriod)"/>
  <html:hidden property="answer(Object::Quote::PolicyPeriodType)"/>
  <html:hidden property="answer(Object::Quote::PolicyMinEarned)"/>
  <html:hidden property="answer(Object::Quote::PolicyMinEarnedType)"/>
  <html:hidden property="answer(Plan::PlanNumber)"/>
    <html:hidden property="answer(Object::Plan::TRIACoverage)"/>
  <html:hidden property="answer(Object::Quote::ProductGroupId)"/>
  <html:hidden property="answer(ruleName)" styleId="ruleName" />
  <html:hidden property="answer(ruleGroupId)" styleId="ruleGroupId" />
<html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="no" />

<html:hidden property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=parentPolicyVerId.toString()%>" />
<%String isEndorsementModified = "Y"; %>
<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+ProductId1) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_NON_MODIFIED_ON_CVG_SAVE" 
	property='<%=new String[]{"In Progress","Refered","Offered","Bind Request"}%>' value="<%="" + QuoteStatus%>" negated="true">
	<bean:define id="endorsementModified" name="AddParentQuote" property="answer(Object::Quote::EndorsementModified)"/>	
	<% if((""+endorsementModified).equalsIgnoreCase("N")) { 
		 isEndorsementModified = "N"; 	
	} else if((""+endorsementModified).equalsIgnoreCase("")) { 
		isEndorsementModified = "N"; 	
	}%>
</dmshtml:isFeatureAvailableForProductRoleStatus>
<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="<%="" + isEndorsementModified%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
<%String activityType=""; %>
<%if(HEADING.toString().equalsIgnoreCase("CANCEL OPTIONS")){
	activityType="Limit/Aggregate Limit/Deductible Change";
}else{
	activityType = "Cancel";
}
%>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%=""+activityType%>"/>

	<html:hidden property="answer(isUpdated)" value="Y" />
	<html:hidden property="answer(pagename)" value="<%=""+HEADING.toString()%>" />
<bean:define id="CoverageB" name="AddParentQuote" property="answer(Object::Plan::CoverageBCorrectiveAction)"/>
<bean:define id="CoverageC" name="AddParentQuote" property="answer(Object::Plan::CoverageCCleanupOfPollutants)"/>
<html:hidden property="answer(Object::Plan::CoverageBCorrectiveAction)" value="<%=""+CoverageB %>"/>
<html:hidden property="answer(Object::Plan::CoverageCCleanupOfPollutants)" value="<%=""+CoverageC %>"/>
  <html:hidden property="answer(Object::Plan::TRIACoverage)"/>
<html:hidden  property="answer(Object::Plan::OnLoadFlag)" value='<%="N"%>'/>
<html:hidden  property="answer(Object::Plan::UserModifiedAggLimit)" styleId="UserModifiedAggLimit" />
<bean:define id="CoverageModified" name="AddParentQuote" property="answer(Object::Coverages::Modified)" scope="request" /> 
<html:hidden name="AddParentQuote" property="answer(Object::Coverages::Modified)" value='<%=""+CoverageModified %>'  styleId="CoveragesLimitsModified"/>
</TD>
</TR>
</TABLE>
</div>
</div>
			
			
<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="EXIPIRING_POLICY_EDITABLE" 
					property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
<script type="text/javascript">
if(document.getElementById("RequestedRetroDate") != null && document.getElementById("RequestedRetroDate") != undefined){	
	document.getElementById("RequestedRetroDate").readOnly = true;
}
if(document.getElementById("ExpirationDate") != null && document.getElementById("ExpirationDate") != undefined){	
	document.getElementById("ExpirationDate").readOnly = true;
}
</script>
</dmshtml:isFeatureAvailableForProductRoleStatus>
</html:form>

</td>
</tr>
</table>
<script type="text/javascript">
if (flag==0){
	setCoveragesDetail();
}


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

function disableExpiringPolicy() {
	if(document.getElementById("RequestedRetroDate") != null && document.getElementById("RequestedRetroDate") != undefined){
		document.getElementById("RequestedRetroDate").readOnly = true;
	}
	if(document.getElementById("ExpirationDate") != null && document.getElementById("ExpirationDate") != undefined){
		document.getElementById("ExpirationDate").readOnly = true;
	}	
}
</script>