<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%@ page import="java.net.*" %>



<html:html locale="true">
<body onload="anylinkcssmenu.init('anchorclass')">

<div class="container1">
	<div class=" yui-skin-sam">
	<!-- div class="formpage" -->
		<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<script>
var CovLimitsform="";
var CovLimitsformSubjToAuditVal = "";
function setAuditPeriod(frm,val)
{
CovLimitsform = frm;
CovLimitsformSubjToAuditVal = val;
setTimeout("setAuditPeriod1();",200);

}


function setAuditPeriod1(){

if(CovLimitsformSubjToAuditVal=='N'){

     CovLimitsform.AuditPeriod.value='';
    
}
}
</script>
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
	
//-->
</script>

		<link rel="stylesheet" href="../styles/structure.css" type="text/css">
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/Application.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CoveragesLimits.js"></script>
<html:form action="/RateBTA2.do" onsubmit="return validateCoverages(this);">
<span id="messageHolder" style="z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:500px; visibility: hidden">fgdsfgdfgdfg</span>

<bean:define id="stateFormRequest" name="AddParentQuote" property="answer(Object::Risk::ResProperty::State)" />
<bean:define id="isUpdated" name="AddParentQuote" property="answer(isUpdated)"/>
<bean:define id="stateCode" name="AddParentQuote" property="answer(Object::Plan::StateCode)" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />

<logic:present name="SelectRisksList" scope="request">
<% java.util.ArrayList riskList = (java.util.ArrayList)request.getAttribute("SelectRisksList");%>
<% for(int index =0; index < riskList.size(); index++){%>	
	<html:hidden property="answer(Object::Quote::SelectedRiskList)" value="<%=riskList.get(index)+""%>" styleId="risk"/>
<%}%>
</logic:present>
<html:hidden property="answer(Object::Plan::LocationId)" styleId="locationID" /> 						


<!--  html:hidden property="answer(SelectRisksList)" name="AddParentQuote"/> -->

<bean:define id="qmap" name="AddParentQuote" property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
	
	<%	
		boolean changePlan=false;
		boolean IsChangePlan = false;
		
		String changePlanParentQuoteId="";
		String changePlanSubQuoteId="0";
		String addPlanSubQuoteId ="0";
		if(request.getParameter("changePlan")!=null) {
			changePlan = true;

		}
		
		if(request.getParameter("IsChangePlan")!=null) {
			IsChangePlan = true;
		}

		if(changePlan){
			
			changePlanParentQuoteId = request.getParameter("answer(parentQuoteId)");
			changePlanSubQuoteId = request.getParameter("answer(subQuoteId)");
			%>
			<html:hidden  property="answer(subQuoteId)" value="<%=changePlanSubQuoteId%>" />	
			<input type="hidden" name="changePlan" value="YES" />
			<%
		}%>
		<% %>
		<bean:define id="AddPlan" name="AddParentQuote" property="answer(Plan::AddPlan)" scope="request"/>
		<html:hidden property="answer(Plan::AddPlan)" value="<%=""+AddPlan%>" />
<%
		if (AddPlan=="YES"){
			addPlanSubQuoteId = request.getParameter("answer(subQuoteId)");
			%>
			<html:hidden  property="answer(Object::Quote::SubQuoteId)" value="<%=addPlanSubQuoteId%>" />	
			
			<%
		}
		boolean displayHRA=true;
		boolean displayComposite=true;
	%>
	
	
	<%if(request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)") != null){%>	
		<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+request.getParameter("answer(Object::Quote::PrevSubQuoteVerId)")%>'/>
	<%}%>
	<bean:define id="primaryEntityId" property="answer(Object::Quote::primaryEntityId)" name="AddParentQuote" />
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
	<bean:define id="PlanNumber" property="answer(Plan::PlanNumber)" name="AddParentQuote" scope="request" />
	<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
	
	
	<bean:define id="CoverageModified" name="AddParentQuote" property="answer(Object::Coverages::Modified)" scope="request" /> 
	<bean:define id="submissionId" name="AddParentQuote" property="answer(Object::Quote::SubmissionId)" scope="request" /> 
	<bean:define id="submissionVerId" name="AddParentQuote" property="answer(Object::Quote::SubmissionVerId)" scope="request" /> 
	<bean:define id="submissionNumber" name="AddParentQuote" property="answer(Object::Quote::SubmissionNumber)" scope="request" /> 
	<bean:define id="submissionStatus" name="AddParentQuote" property="answer(Object::Quote::SubmissionStatus)" scope="request" />
	<bean:define id="clearanceStatus" name="AddParentQuote" property="answer(Object::Quote::ClearanceStatus)" scope="request" />
	
	<bean:define id="parentQuoteId" name="AddParentQuote" property="answer(Object::Quote::Id)" scope="request" /> 
	<bean:define id="parentQuoteVerId" name="AddParentQuote" property="answer(Object::Quote::QuoteVerId)" scope="request" /> 
	<bean:define id="policyTerm" name="AddParentQuote" property="answer(Object::Plan::TermInMonths)" />	

	<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)" />
	<bean:define id="CustomerState" name="AddParentQuote" property="answer(State)" />
	<bean:define id="CustomerCounty" name="AddParentQuote" property="answer(Object::Quote::County)" />
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
	
<bean:define id="SubQuoteId1" name="AddParentQuote" property="answer(subQuoteId)" scope="request" />
<bean:define id="customerId1" name="AddParentQuote" property="answer(customerId)" scope="request" />
<bean:define id="prdGroupId1" name="AddParentQuote" property="answer(Object::Quote::ProductGroupId)" scope="request" />
<bean:define id="prdGroupVerId1" name="AddParentQuote" property="answer(Object::Quote::ProductGroupVerId)" scope="request" />
<bean:define id="productStatus1" name="AddParentQuote" property="answer(productStatus)" scope="request" />
<bean:define id="ProductId1" name="AddParentQuote" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="productVerId1" name="AddParentQuote" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="memberAssociation" name="AddParentQuote" property="answer(Object::Quote::MemberAssociation)" scope="request" />
<bean:define id="CoveragesLimitsModified1" name="AddParentQuote" property="answer(CoveragesLimitsModified)" scope="request" />

<html:hidden name="AddParentQuote" property="answer(Object::Quote::MemberAssociation)" value='<%=""+memberAssociation%>' />


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


<html:hidden name="AddParentQuote" property="answer(Object::Quote::ProductId)" value='<%=ProductId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(Object::Quote::productVerId)" value='<%=productVerId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(SubQuoteId)" value='<%=""+SubQuoteId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(customerId)" value='<%=""+customerId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(Object::Quote::prdGroupId)" value='<%=""+prdGroupId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(Object::Quote::prdGroupVerId)" value='<%=""+prdGroupVerId1.toString()%>' />
<html:hidden name="AddParentQuote" property="answer(productStatus)" value='<%=""+productStatus1%>' />
<html:hidden name="AddParentQuote" property="answer(Object::Coverages::Modified)" value='<%=""+CoverageModified %>'  styleId="CoveragesLimitsModified"/>
<bean:define id="quoteName" property="answer(Object::Quote::QuoteName)" name="AddParentQuote" />
<bean:define id="quoteDesc" property="answer(Object::Quote::QuoteDesc)" name="AddParentQuote" />
<bean:define id="requestFrom" name="AddParentQuote" property="answer(requestFrom)" />
		<%
		String compositeRate="";
		if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
			compositeRate=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
		}
		%>


<bean:define id="RenewalPolicyNo" name="AddParentQuote" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" />
<bean:define id="RenewalPolicyCompany" name="AddParentQuote" property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" />
<bean:define id="RenewalSubmissionNumber" name="AddParentQuote" property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" />
<bean:define id="QuoteType" name="AddParentQuote" property="answer(Object::Quote::QuoteType)" />

	
	<%System.out.println("Created Parent Quote Id/Parent Quote VerId is--> "+ parentQuoteId+"/"+parentQuoteVerId);
		String isHealthIns = ""+session.getAttribute("InsType");
	
	%>
	<table>
<tr>
						<td >
							<table width="100%" align="left" border="0">
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
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
						<td colspan="4">
							<table WIDTH="85%" ALIGN="center" cellspacing="6" cellpadding="0" border="0">
								<bean:define id="ProductGroupName" name="PRODUCT_GROUP_NAME" type="java.lang.String" />											
				
								<bean:define id="ProductGroupVerId" name="AddParentQuote" property="answer(Object::Quote::ProductGroupVerId)" />
								<bean:define id="prodId" name="AddParentQuote" property="answer(Object::Quote::ProductId)" />
								
								<%
									long productId = 0;
									try{
										productId = Long.parseLong(""+prodId);
									}catch(Exception ex){}
								%>

			
								
							    <!--<html:hidden property="answer(Object::Quote::CompositeRate)" value="No" />-->
							    <%--<html:hidden property="answer(Object::Quote::HelthHra)" value="No" />--%>																												

														
							</table>
						</td>
					</tr>	
					<tr><td class="Error"><html:text style="display:none;border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;#ff0000;COLOR:ff0000" styleId="ErrorContainer" disabled="disabled" property="answer(Object::Risk::ResProperty::RuleQuestion)" styleClass="txtbox" size="35" maxlength="35" readonly="true"/>	</td></tr>
					
		</table>

	<bean:parameter id="IsOptionDisabled" name="answer(IsOptionDisabled)" value="N"/>
	<html:hidden property="dirty" styleId="dirty" value="N" />
	<TABLE>
<TR>
		<TD>

			<!--/logic:present--> 
			<!--html:hidden name="AddParentQuote" property="answer(Object::Product::ProductState)" value="RELEASED" /-->

<%String pquoteId="";%>
<%if (request.getAttribute("Object::Quote::ParentQuoteId")!= null) {%>
<%pquoteId= request.getAttribute("Object::Quote::ParentQuoteId").toString();%>
<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=pquoteId%>" />
	<html:hidden  property="answer(parentQuoteId)" value="<%=pquoteId%>" />
	<html:hidden property="answer(QuoteId)" value="<%=pquoteId%>" />

<%}%>


<html:hidden property="TabPanelName" value="Quote_Panel"/>
<html:hidden property ="answer(pagename)" value="Coverages and limits" />
			<html:hidden property="answer(IsOptionDisabled)"  value="<%=IsOptionDisabled.toString()%>" /> 
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
			<%}%>
			<html:hidden  property="answer(Object::Quote::QuoteVerId)" value="<%=parentQuoteVerId.toString()%>" />
			<html:hidden  property="quoteId" value="<%=parentQuoteId.toString()%>" />
			
			<html:hidden  property="answer(Object::Quote::SubmissionId)" value='<%=""+submissionId%>' />
			<html:hidden  property="answer(Object::Quote::SubmissionVerId)" value='<%=""+submissionVerId%>' />			
			<html:hidden  property="answer(Object::Quote::SubmissionNumber)" value='<%=""+submissionNumber%>' />
			<html:hidden  property="answer(Object::Quote::SubmissionStatus)" value='<%=""+submissionStatus%>' />
			<html:hidden  property="answer(Object::Quote::ClearanceStatus)" value='<%=""+clearanceStatus%>' />
			
			<html:hidden property="answer(dbname)"				value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
							
			<html:hidden  property="answer(SearchAvailableplans::PageNum)" value="0" />

			<bean:define id="AreaNetWorkKey" name="AddParentQuote" property="answer(Object::Quote::AreaNetWorkKey)" scope="request"/>
			
			<html:hidden property="answer(Object::Quote::AreaNetWorkKey)" value="<%=AreaNetWorkKey.toString()%>" />
			
			<html:hidden  property="answer(Object::Quote::QuoteNumber)" value="<%=""+PlanNumber%>" />
			
			<html:hidden  property="answer(Object::Plan::UserModifiedAggLimit)" styleId="UserModifiedAggLimit" />
		<%String strSubQuoteId=""; %>
			<dmshtml:Get_All_Plan_HeaderDetails 
			nameInSession="subQuotes" 
			parentQuoteId='<%=""+pquoteId%>'
			dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  
			/>
			<logic:present name="subQuotes" scope="request">
			<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
			<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
					<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
					<%strSubQuoteId=""+subQuoteId; %>
			</logic:iterate>											
			</logic:present>
		
		


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
			<bean:define id="quoteEndDate" name="AddParentQuote" property="answer(Object::Quote::QuoteEndDate)" scope="request" />
			<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />
			<bean:define id="CompositeRate" name="AddParentQuote" property="answer(Object::Quote::CompositeRate)" />
			<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=CompositeRate.toString()%>" />
			<bean:define id="HelthHra" name="AddParentQuote" property="answer(Object::Quote::HelthHra)" />
			<html:hidden property="answer(Object::Quote::HelthHra)" value="<%=HelthHra.toString()%>" />
			<html:hidden property="answer(Object::Quote::Id)" value="<%=strSubQuoteId.toString()%>" />


			<bean:define id="NoOfMedicalEmployees" name="AddParentQuote" property="answer(Object::Quote::NoOfMedicalEmployees)" scope="request"/>
			<html:hidden property="answer(Object::Quote::NoOfMedicalEmployees)" value="<%=NoOfMedicalEmployees.toString()%>" />
			<html:hidden property="org.apache.struts.taglib.html.TOKEN" styleId="requiredMultiSubmissionCheck" value='<%=""+session.getAttribute("org.apache.struts.action.TOKEN")%>' />											
			<html:hidden property="answer(Object::QuoteCommission::CommissionPercentage)" value="<%=""+oldCommissionPercentage%>" />
			<html:hidden property="answer(Object::QuoteCommission::InitialCommissionPercentage)" value="<%=""+initCommissionPercentage%>" />
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>" />
			<html:hidden property="answer(Object::Quote::ProductGroupVerId)" value="<%=ProductGroupVerId.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductGroupName)" value="<%=ProductGroupName.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductStatus)" name="AddParentQuote" style="Id: prodStatus" />
			
			<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>" />


			<html:hidden property="answer(PlanNameDisPly)" value="<%=""+ProductGroupName%>" />
			<html:hidden  property="answer(Object::Plan::PlanNameDisply)" value="<%=""+ProductGroupName%>" />
			
			
			<html:hidden property="answer(Object::QuoteCommission::CommissionPercentage)" value="<%=""+oldCommissionPercentage%>" />
			<html:hidden property="answer(Object::QuoteCommission::InitialCommissionPercentage)" value="<%=""+initCommissionPercentage%>" />
			
<bean:define id="CompanyId" name="AddParentQuote" property="answer(Object::InsuranceType::CompanyId)" />
<bean:define id="InsuranceTypeId" name="AddParentQuote" property="answer(Object::Risk::InsuranceTypeId)" />
<html:hidden property="answer(Object::InsuranceType::CompanyId)" value="<%=""+CompanyId%>" />
<html:hidden property="answer(Object::Risk::InsuranceTypeId)" value="<%=""+InsuranceTypeId%>" />


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
			
	
	
	<bean:define id="PLResRiskPropertyId" name="AddParentQuote" property="answer(Object::Plan::PLResRiskPropertyId)" />
	<html:hidden property="answer(Object::Plan::PLResRiskPropertyId)" value="<%=""+PLResRiskPropertyId%>" />
	
	
	<bean:define id="DiscrLossSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::DiscretionaryLossSurcharge_Factor)" />
	<bean:define id="DiscMiscSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::DiscretionaryMiscSurcharge_Factor)" />
	
	
	<bean:define id="LossSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::LossSurcharge_Factor)" />
	<bean:define id="MiscSurchargeFactor" name="AddParentQuote" property="answer(Object::PlanFactor::MiscSurcharge_Factor)" />
	<bean:define id="QuoteState" name="AddParentQuote" property="answer(Object::Quote::CustomerState)" />
	
	<html:hidden property="answer(Object::PlanFactor::LossSurcharge_Factor)" value="<%=""+LossSurchargeFactor %>" />	
	<html:hidden property="answer(Object::PlanFactor::MiscSurcharge_Factor)" value="<%=""+MiscSurchargeFactor %>" />
	
	
	<bean:define id="DefaultPolicyFee" name="AddParentQuote" property="answer(Object::Plan::DefaultPolicyFee)" />
	<bean:define id="StampFee" name="AddParentQuote" property="answer(Object::Plan::StampFee)" />
	<bean:define id="SurplusLinesTax" name="AddParentQuote" property="answer(Object::Plan::SurplusLinesTax)" />
	<bean:define id="FilingFee" name="AddParentQuote" property="answer(Object::Plan::FilingFee)" />
	<bean:define id="InspectionFee" name="AddParentQuote" property="answer(Object::Plan::InspectionFee)" />
	<bean:define id="Deductible_CreditOverride_Factor" name="AddParentQuote" property="answer(Object::PlanFactor::Deductible_CreditOverride_Factor)" />
	
	<bean:define id="UnderwriterAdjustmentModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::UnderwriterAdjustmentModifiedFlag)" />
	<bean:define id="underwriterAdjustmentFactor" name="AddParentQuote" property="answer(Object::PlanFactor::underwriterAdjustmentFactor)" />
	
	<bean:define id="LosssurchargeUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::LosssurchargeUWModifiedFlag)" />
	<bean:define id="Deductible_CreditOverrideUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::Deductible_CreditOverrideUWModifiedFlag)" />
	
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryLossSurcharge_Factor)" value="<%=""+DiscrLossSurchargeFactor %>" />	
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryMiscSurcharge_Factor)" value="<%=""+DiscMiscSurchargeFactor %>" />
	<html:hidden property="answer(Object::PlanFactor::Deductible_CreditOverride_Factor)" value="<%=""+Deductible_CreditOverride_Factor %>" />
	
	<html:hidden property="answer(Object::PlanFactor::UnderwriterAdjustmentModifiedFlag)" value="<%=""+UnderwriterAdjustmentModifiedFlag %>" />
	<html:hidden property="answer(Object::PlanFactor::underwriterAdjustmentFactor)" value="<%=""+underwriterAdjustmentFactor %>" />
		
	<html:hidden property="answer(Object::PlanFactor::LosssurchargeUWModifiedFlag)" value="<%=""+LosssurchargeUWModifiedFlag %>" />
	<html:hidden property="answer(Object::PlanFactor::Deductible_CreditOverrideUWModifiedFlag)" value="<%=""+Deductible_CreditOverrideUWModifiedFlag %>" />
	
	
	
	<html:hidden  property="answer(Object::Plan::DefaultPolicyFee)" value="<%=""+DefaultPolicyFee %>" />
	<html:hidden  property="answer(Object::Plan::StampFee)" value="<%=""+StampFee %>" />
	<html:hidden  property="answer(Object::Plan::SurplusLinesTax)" value="<%=""+SurplusLinesTax %>" />
	<html:hidden  property="answer(Object::Plan::FilingFee)" value="<%=""+FilingFee %>" />
	<html:hidden  property="answer(Object::Plan::InspectionFee)" value="<%=""+InspectionFee %>" />				
	<html:hidden  property="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId %>" />	
	<html:hidden  property="answer(PageFrom)" styleId="pagefrom" value="CovLimit" />

<html:hidden  property="answer(Object::Plan::BaseRateId)" value="1" />	

 
 <bean:define id="FamilyId" name="AddParentQuote" property="answer(Object::Quote::ProductFamilyId)" />
 <html:hidden property="answer(Object::Quote::ProductFamilyId)" value="<%=""+FamilyId%>"/> 
  <html:hidden property="answer(Option::DefaultValue)" value="No" styleId="DefaultValue"/> 
  <html:hidden property="answer(Object::Quote::PolicyPeriod)"/>
  <html:hidden property="answer(Object::Quote::PolicyPeriodType)" value="months"/>
  <html:hidden property="answer(Object::Quote::PolicyMinEarned)"/>
  <html:hidden property="answer(Object::Quote::PolicyMinEarnedType)"/>
  <html:hidden property="answer(Plan::PlanNumber)"/>
  <html:hidden property="answer(Object::Quote::ProductGroupId)"/>
  <html:hidden property="answer(ruleName)" styleId="ruleName" />
  <html:hidden property="answer(ruleGroupId)" styleId="ruleGroupId" />
<html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="no" />
<html:hidden property="answer(Object::Quote::QuoteName)" value="<%=""+quoteName %>" />
<html:hidden property="answer(Object::Quote::QuoteDesc)" value="<%=""+quoteDesc %>" />
<html:hidden property="answer(Object::Quote::Zip)" />
<html:hidden property="answer(Object::Quote::NetWorkCode)" />
<html:hidden property="answer(Object::Quote::CustomerZip)" />
<html:hidden property="answer(Object::Plan::CompositeRateFlag)" />
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" name="AddParentQuote"/>
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" value="<%=""+RenewalPolicyCompany%>" />
<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" value="<%=""+RenewalSubmissionNumber%>" />
<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactorPrefer)" value="1.0"/>


<bean:define id="UWFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::UWFactorUWModifiedFlag)" />
<bean:define id="DiscretionaryFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::DiscretionaryFactorUWModifiedFlag)" />

<bean:define id="LifeCommissionUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::LifeCommissionUWModifiedFlag)" />
<bean:define id="DiscountUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::DiscountUWModifiedFlag)" />
<bean:define id="YearLoadFactorUWModifiedFlag" name="AddParentQuote" property="answer(Object::PlanFactor::YearLoadFactorUWModifiedFlag)" />

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


<html:hidden property="answer(Object::PlanFactor::UWFactorUWModifiedFlag)"  value='<%=""+UWFactorUWModifiedFlag %>'/>
<html:hidden property="answer(Object::PlanFactor::DiscretionaryFactorUWModifiedFlag)" value='<%=""+DiscretionaryFactorUWModifiedFlag %>' />


<html:hidden property="answer(Object::PlanFactor::LifeCommissionUWModifiedFlag)" value='<%=""+LifeCommissionUWModifiedFlag %>' />
<html:hidden property="answer(Object::PlanFactor::DiscountUWModifiedFlag)" value='<%=""+DiscountUWModifiedFlag %>' />
<html:hidden property="answer(Object::PlanFactor::YearLoadFactorUWModifiedFlag)" value='<%=""+YearLoadFactorUWModifiedFlag %>' />

<html:hidden property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" />
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" />
<html:hidden property="answer(Object::PlanFactor::CompositeEmployeeFactor)" />
<html:hidden property="answer(Object::PlanFactor::CompositeEmpSpouseFactor)" />
<html:hidden property="answer(Object::PlanFactor::CompositeEmpChildFactor)" />
<html:hidden property="answer(Object::PlanFactor::CompositeFamilyFactor)" />

<html:hidden property="answer(Object::PlanFactor::CommissionLifeFactor)" />
<html:hidden property="answer(Object::PlanFactor::Discount)" />
<html:hidden property="answer(Object::PlanFactor::YearLoad)" />
<html:hidden property="answer(Object::Risk::ResProperty::State)" value="<%=stateFormRequest.toString()%>" />

<html:hidden property="answer(Object::Plan::StateCode)" value="<%=stateCode.toString()%>" />


<html:hidden property="answer(Object::Quote::QuoteEndDate)" value='<%=quoteEndDate.toString()%>' />
<html:hidden property="answer(Object::Quote::County)" value='<%=CustomerCounty.toString()%>' styleId="county"/>
	
<html:hidden property="answer(Object::PlanFactor::AdministrativeFee)" />
<html:hidden property="answer(Object::Risk::RiskId)" value="1"/>
<html:hidden property="answer(Object::Quote::SupplementalAccidentCoverage)" />
<html:hidden property="answer(Object::Quote::CompositeRate)" value="N"/>
<html:hidden property="answer(Object::Quote::SicMin)" />
<html:hidden property="answer(Object::Quote::Sic)" />
<html:hidden property="answer(Object::Plan::TerrorismZone)" value="1" />
<html:hidden property="answer(Object::Quote::NewQuote)" name="AddParentQuote" value="NO"/>
<html:hidden property="answer(Object::Quote::PaymentPlan)" name="AddParentQuote"/>
<html:hidden property="answer(isUpdated)" value="<%= ""+isUpdated%>" />
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
	
<bean:define id="territoryFromRequest" name="AddParentQuote" property="answer(Object::Risk::ResProperty::RatingTerritory)" />
<bean:define id="zoneFromRequest" name="AddParentQuote" property="answer(Object::Risk::ResProperty::Zone)" />
<bean:define id="territoryNameFromRequest" name="AddParentQuote" property="answer(Object::Risk::ResProperty::RatingTerritoryName)" />

<html:hidden property="answer(Object::Risk::Teritory)" value='0' />
<html:hidden property="answer(Object::Quote::primaryEntityId)" value="<%=""+primaryEntityId%>"/>
<%if(!CustomerState.equals("") ){ %>
<html:hidden property="answer(Object::Quote::CustomerState)" value='<%=CustomerState.toString()%>' styleId="state"/>
<%}else{ %>
<html:hidden property="answer(Object::Quote::CustomerState)" value="<%=stateFormRequest.toString()%>" styleId="state"/>
<%} %>
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value='<%=quoteStartDate.toString()%>' />
<html:hidden property="answer(Object::Quote::LockStatus)" value="Unlocked"/>
<bean:define id="CoverageB" name="AddParentQuote" property="answer(Object::Plan::CoverageBCorrectiveAction)"/>
<bean:define id="CoverageC" name="AddParentQuote" property="answer(Object::Plan::CoverageCCleanupOfPollutants)"/>
<html:hidden property="answer(Object::Plan::CoverageBCorrectiveAction)" value="<%=""+CoverageB %>"/>
<html:hidden property="answer(Object::Plan::CoverageCCleanupOfPollutants)" value="<%=""+CoverageC %>"/>
<html:hidden  property="answer(Object::Plan::OnLoadFlag)" value='<%="N"%>'/>
<html:hidden  property="activeTabName" value='<%=""%>'/>
<html:hidden  property="answer(activeTabName)" value='<%=""%>'/>
<html:hidden  property="answer(AJAX_Rating)" value="N" styleId="AJAX_Rating"/>
<div class="formpage1">	
<div class="content">
<div class="formhead"><h2 class="left">Coverages and Limits</h2></div>  

	<logic:notEqual name="IsOptionDisabled" value="Y">
	
	<div id='content' >
	<html:hidden property="answer(form::ForwordControl)" styleId="fc"/>
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="RATE_AVAILABLE" property='<%=new String[]{""}%>' value="" negated="true">
			<div class='navValue'><INPUT TYPE='submit'  value='Rate' class="covbutton left" id="RateTop" onclick="document.getElementById('fc').value = 'Rate';submitToRateCovLimits();" name='answer(form::ForwordControl1)'></div>
		</dmshtml:isFeatureAvailableForProductRoleStatus>	
			</div>
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'><div class='navValue' style="border:0px solid #fff;background:none;"><INPUT TYPE='submit' value='Save' class="covbutton left" id="SaveTop" onclick="document.getElementById('fc').value = 'Save';" name='answer(form::ForwordControl1)'></div></div>
	</div>
	
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

<html:hidden  property="answer(CovA_AOP)" value="N" styleId="CovA_AOP"/>
<html:hidden property="answer(Object::Plan::TermInMonths)" />
<html:hidden property="answer(Object::Quote::PersonHospitalised)" name="AddParentQuote" />
<html:hidden property="answer(Object::Quote::HowLong)"  name="AddParentQuote" />
<html:hidden property="answer(Object::Quote::IsDefferedDateApplies)" name="AddParentQuote" />
<html:hidden property="answer(Object::Quote::IsInsuredUnderMultipleClasses)" name="AddParentQuote" />
<html:hidden property="answer(Object::Quote::IsInsuredDependentAtSameTime)" name="AddParentQuote"  />
</logic:present>
	<logic:notEqual name="IsOptionDisabled" value="Y">
	<div id='content' >
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="RATE_AVAILABLE" property='<%=new String[]{""}%>' value="" negated="true">
			<div class='navValue'><INPUT TYPE='submit'  value='Rate' class="covbutton left" id="RateBottom" onclick="document.getElementById('fc').value = 'Rate';submitToRateCovLimits();" name='answer(form::ForwordControl1)'></div>
		</dmshtml:isFeatureAvailableForProductRoleStatus>	
			</div>
	<div style='margin-right: 5pt; display: block; float:left; margin:0 5px 0 0 ;padding-top:0'><div class='navValue' style="border:0px solid #fff;background:none;"><INPUT TYPE='submit' value='Save' class="covbutton left" id="SaveBottom" onclick="document.getElementById('fc').value = 'Save';" name='answer(form::ForwordControl1)'></div></div>
	</div>
	<div id='loadercontent2' style="display:none">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
	Loading....
	</div>
	</logic:notEqual>
					
		</div>
	<!-- /div -->
</div>	
</TD>
</TR>
</TABLE>
</html:form>

<script type="text/javascript">


</script>
		
	
<html:hidden  property="answer(activateTabId)" value='<%=""%>'/>
													
</div>
</div>


</body>
</html:html>
