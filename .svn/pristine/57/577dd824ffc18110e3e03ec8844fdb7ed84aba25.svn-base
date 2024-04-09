<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import = "java.text.*" %>

<link rel="stylesheet" href="../styles/structure.css" type="text/css">
<script type="text/javascript">
<!--


	function SubmitToRecalculate(){
		var formElement=document.forms[0];
		var IntnoOfEmployeesInPlan=formElement.SIDnoOfEmployeesInPlan.value;
		
		if(! validateFormEIL(formElement)){
			return false;
		}
		if(document.getElementById("isUWCalculate") != null && document.getElementById("isUWCalculate") != undefined) {
			document.getElementById("isUWCalculate").value = "true";
		}
		formElement.action="../CalculateUnderwriterWorkSheet.do";
		formElement.submit();
		return true;
	}

	function SubmitToCheckRule(){
	var formElement=document.forms[0];
	if(! validateFormEIL(formElement)){
		return false;
	}
	var paretQuoteStatus=document.getElementById("paretQuoteStatus").value;
	var currentQuoteStatus=document.getElementById("Object$Quote$QuoteStatus").value;
	var isRenewal=document.getElementById("isRenewalEndorsement").value;
	
	if( isRenewal =="YES"){
		if(paretQuoteStatus!=currentQuoteStatus && currentQuoteStatus!="In Progress" && currentQuoteStatus!="Declined"){	
			formElement.action="../SaveRenewalQuoteUnderwriterStatusRules.do";
			formElement.submit();
			return true;
		}else{
			formElement.action="../SaveEndorsementQuoteUnderwriterStatusAction.do";
			formElement.submit();
			return true;
		}
	}else{
			formElement.action="../SaveEndorsementQuoteUnderwriterStatusAction.do";
			formElement.submit();
			return true;
	}
}


//-->
</script>

<script type="text/javascript" src="/Scripts/JScripts/UnderwriterWorksheet.js"></script>
<script type="text/javascript" src="/Scripts/JScripts/UnderwriterWorksheetEIL.js"></script>
<script type="text/javascript" src="/Scripts/JScripts/FactorCalculator.js"></script>		
<script type="text/javascript" src="/Scripts/JScripts/Application.js"></script>		
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<html:form action="/SaveEndorsementQuoteUnderwriterStatusAction.do" styleId="SaveQuoteUnderwriterStatusAction" onsubmit="return validateFormEIL(this);">

<!--##########################VARIBLE DECLARATION #########################################-->
<bean:define id="parentQuoteId" name="UWWorkSheet" property="answer(parentQuoteId)" scope="request" />

<logic:empty name="parentQuoteId">
<% String  parentQuoteIdTemp = "" + request.getAttribute("QuoteId"); %>
<% parentQuoteId = "" + parentQuoteIdTemp; %>
</logic:empty>
<%boolean isRenewal = false; %>
<bean:define id="modQuoteNumber" name="UWWorkSheet" property="answer(modQuoteNumber)" scope="request" />
<bean:define id="ProductId" name="UWWorkSheet" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="prodId" name="UWWorkSheet" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="productVerId" name="UWWorkSheet" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="productStatus" name="UWWorkSheet" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="groupId" name="UWWorkSheet" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="groupVerId" name="UWWorkSheet" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="customerId" name="UWWorkSheet" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="customerNumber" name="UWWorkSheet" property="answer(customerNumber)" scope="request" />
<bean:define id="agencyId" name="UWWorkSheet" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="subQuoteNum" property="answer(Object::Quote::QuoteNumber)" name="UWWorkSheet" scope="request" />
<bean:define id="UWNameCode" property="answer(Object::Quote::QuoteUWNameCode)" name="UWWorkSheet" scope="request" />
<bean:define id="eachOccuranceLimit" property="answer(Object::Plan::EachOccuranceLimit)" name="UWWorkSheet" scope="request" />
<bean:define id="certifiedActsOfTerrorismCoverage" name="UWWorkSheet" property="answer(Object::Plan::CertifiedActsOfTerrorismCoverage)" />

<bean:define id="premisesISOFactor" property="answer(Object::PlanFactor::PremisesLiabilityISOFactor)" name="UWWorkSheet" scope="request" />
<bean:define id="productCoISOFactor" property="answer(Object::PlanFactor::ProductCoLiabilityISOFactor)" name="UWWorkSheet" scope="request" />
<bean:define id="automobileISOFactor" property="answer(Object::PlanFactor::AutomobileLiabilityISOFactor)" name="UWWorkSheet" scope="request" />
<!-- new -->
<bean:define id="CustomerState" name="UWWorkSheet" property="answer(Object::Quote::CustomerState)" />
<bean:define id="areaNetworkFatorsKey" name="UWWorkSheet" property="answer(Object::Quote::AreaNetWorkKey)" />
<bean:define id="PlanNameDisPly" name="UWWorkSheet" property="answer(Object::Plan::PlanNameDisPly)" />
<bean:define id="subQuoteId" name="UWWorkSheet" property="answer(Object::Quote::Id)" />
<bean:define id="subQuoteVerId" name="UWWorkSheet" property="answer(Object::Quote::QuoteVerId)" />

<%if(request.getAttribute("answer(subQuoteVerId)") != null ) {
	subQuoteVerId = "" + request.getAttribute("answer(subQuoteVerId)");
}%>

<bean:define id="quoteStartDate" name="UWWorkSheet" property="answer(Object::Quote::QuoteStartDate)" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="objectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="<%=objectType.toString()%>" />
<bean:define id="objectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/> 
<bean:define id="uwId" name="UWWorkSheet" property="answer(Object::Quote::IssuanceUnderwriterId)" />

															
<bean:define id="MorbidObesityFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::MorbidObesityRiderFactor)"/>
<bean:define id="RequiredPmPmPharmacy" name="UWWorkSheet" property="answer(Object::Plan::RequiredPmPmPharmacy)"/>
<bean:define id="RequiredPmPmMedical" name="UWWorkSheet" property="answer(Object::Plan::RequiredPmPmMedical)"/>
<bean:define id="CombinedPmPmPharmacy" name="UWWorkSheet" property="answer(Object::Plan::CombinedPmPmPharmacy)"/>
<bean:define id="GroupSizeFactorPharmacy" name="UWWorkSheet" property="answer(Object::PlanFactor::GroupSizeFactorPharmacy)"/>
<bean:define id="CompositeRate" name="UWWorkSheet" property="answer(Object::Quote::CompositeRate)"/>
<bean:define id="dentalStatus" name="UWWorkSheet" property="answer(Object::Plan::DentalStatus)"/>
<bean:define id="priorCoverage" name="UWWorkSheet" property="answer(Object::Plan::2YearPriorCoverage)"/>
<bean:define id="noOfMedicalEmployees" name="UWWorkSheet" property="answer(Object::Quote::NoOfMedicalEmployees)"/> 
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />

<bean:define id="parentOwnerCommissionPercent" name="parentQuoteDetail" property="owner_Commission_Percentage" scope="request"/>

<bean:define id="paretQuoteStatus" name="parentQuoteDetail" property="quoteStatus" scope="request"/>
<bean:define id="paretLockStatus" name="parentQuoteDetail" property="lockStatus" />
<bean:define id="quoteStartDate" property="quoteStartDate" name="parentQuoteDetail" scope="request"/>
<bean:define id="fname" property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" scope="session"/>
<bean:define id="lname" property="answer(Object::UserDetail::UserLastName)" name="LoginPage" scope="session"/>
<bean:define id="parentQuoteDetailObject" name="parentQuoteDetail"      type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
<%
	double commissionPercentfromDB = parentQuoteDetailObject.getHealthInsQuoteCommissionDetail().getCommissionPercentage();
%>

<bean:define id="LifeUWFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::LifeUWFactor)" scope="request" />
<bean:define id="WdiUWFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::WdiUWFactor)" scope="request" />
<bean:define id="DentalUWFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::DentalUWFactor)" scope="request" />

<bean:define id="MedicalExpAdjFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::MedicalExpAdjFactor)" scope="request" />
<bean:define id="DrugExpAdjFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::DrugExpAdjFactor)" scope="request" />
<bean:define id="LifeExpAdjFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::LifeExpAdjFactor)" scope="request" />
<bean:define id="WdiExpAdjFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::WdiExpAdjFactor)" scope="request" />
<bean:define id="DentalExpAdjFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::DentalExpAdjFactor)" scope="request" />
<bean:define id="Deductible_CreditOverride_Factor" name="UWWorkSheet" property="answer(Object::PlanFactor::Deductible_CreditOverride_Factor)"/>
<bean:define id="ageSexWdiFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::ageSexWdiFActorFactorVerId)" />
<bean:define id="areaNetFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::AreaNetFactorVerId)" />
<bean:define id="baseRateFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::BaseRateFactorVerId)" />
<bean:define id="childFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::childfactorFactorVerId)" />
<bean:define id="compositeFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::CompositeFactorFactorVerId)" />
<bean:define id="dentalFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::DentalFactorVerId)" />
<bean:define id="expAdjFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::ExpAdjFactorVerId)" />
<bean:define id="groupSizeAdjFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::GroupSizeAdjFactorVerId)" />
<bean:define id="indusFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::IndusFactorVerId)" />
<bean:define id="pharmacyFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::PharmacyFactorVerId)" />
<bean:define id="statesFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::StatesFactorVerId)" />
<bean:define id="targetLossFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::TargetLossFactorVerId)" />
<bean:define id="trendFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::TrendFactorVerId)" />
<bean:define id="underWriterAdjFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::UnderWriterAdjFactorVerId)" />
<bean:define id="inclusionFactorVerId" name="UWWorkSheet" property="answer(Object::Factor::InclusionFactorVerId)" />


<bean:define id="ageSexWdiFactorId" name="UWWorkSheet" property="answer(Object::Factor::ageSexWdiFActorFactorId)" />
<bean:define id="areaNetFactorId" name="UWWorkSheet" property="answer(Object::Factor::AreaNetFactorId)" />
<bean:define id="baseRateFactorId" name="UWWorkSheet" property="answer(Object::Factor::BaseRateFactorId)" />
<bean:define id="childFactorId" name="UWWorkSheet" property="answer(Object::Factor::childfactorFactorId)" />
<bean:define id="compositeFactorId" name="UWWorkSheet" property="answer(Object::Factor::CompositeFactorFactorId)" />
<bean:define id="dentalFactorId" name="UWWorkSheet" property="answer(Object::Factor::DentalFactorId)" />
<bean:define id="expAdjFactorId" name="UWWorkSheet" property="answer(Object::Factor::ExpAdjFactorId)" />
<bean:define id="groupSizeAdjFactorId" name="UWWorkSheet" property="answer(Object::Factor::GroupSizeAdjFactorId)" />
<bean:define id="indusFactorId" name="UWWorkSheet" property="answer(Object::Factor::IndusFactorId)" />
<bean:define id="pharmacyFactorId" name="UWWorkSheet" property="answer(Object::Factor::PharmacyFactorId)" />
<bean:define id="statesFactorId" name="UWWorkSheet" property="answer(Object::Factor::StatesFactorId)" />
<bean:define id="targetLossFactorId" name="UWWorkSheet" property="answer(Object::Factor::TargetLossFactorId)" />
<bean:define id="trendFactorId" name="UWWorkSheet" property="answer(Object::Factor::TrendFactorId)" />
<bean:define id="underWriterAdjFactorId" name="UWWorkSheet" property="answer(Object::Factor::UnderWriterAdjFactorId)" />
<bean:define id="inclusionFactorId" name="UWWorkSheet" property="answer(Object::Factor::InclusionFactorId)" />
<bean:define id="commissionAdjValue" name="UWWorkSheet" property="answer(Object::QuoteCommission::CommissionAdjustmentValue)" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />

<bean:define id="certifiedActsOfTerrorismCoverage" name="UWWorkSheet" property="answer(Object::Plan::CertifiedActsOfTerrorismCoverage)" />
<bean:parameter name="answer(Object::Policy::ParentPolicyId)" id="parentPolicyId" />
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="parentPolicyVerId" />
<bean:parameter name="answer(policyNumber)" id="policyNumber" />
<bean:define id="prevSubQuoteVerId" name="UWWorkSheet" property="answer(prevSubQuoteVerId)" />
<bean:define id="isRegulatorySurchargeApplicable" name="UWWorkSheet" property="answer(Object::Plan::IsRegulatorySurchargeApplicable)"/> 
<%if(isRegulatorySurchargeApplicable.equals("")){isRegulatorySurchargeApplicable="N";} %>
<bean:define id="regulatorySurchargeFactor" name="UWWorkSheet" property="answer(Object::Plan::RegulatorySurchargeFactor)"/> 
<bean:define id="regulatorySurcharge" name="UWWorkSheet" property="answer(Object::Plan::RegulatorySurcharge)"/>
<bean:define id="BranchCode" name="UWWorkSheet" property="answer(Object::Company::Paper::BranchCode)"/>
<html:hidden property="answer(BranchCode)" value="<%=BranchCode.toString()%>" styleId="BrnchCode"/>
<bean:define id="TotalPremium" name="UWWorkSheet" property="answer(Object::Quote::TotalPremium)" scope="request" />
<%double calculatedTotalPremiumWithTria = 0.0; 
boolean isCalculateResultPage = false;%>
<%
	double commissionAdjustValue=Double.parseDouble(""+commissionAdjValue);
	java.text.DecimalFormat money = new java.text.DecimalFormat("0.000");
	commissionAdjustValue = Double.parseDouble(money.format(commissionAdjustValue));
	commissionAdjustValue = Math.abs(commissionAdjustValue);
%>
<bean:define id="noOfEmployeesInPlan" name="UWWorkSheet" property="answer(Object::Quote::NoOfMedicalEmployeesInPlan)" scope="request" />
<% String fullName ="";
boolean SHOW_PRODUCT_FACTORSLIST = false;
double dblCommissionVal = 0.0;
double dblCurrCommissionVal = 0.0;
%>
<%if(fname.toString()=="" && lname.toString()==""){
	fullName = userId.toString();
} else {
	fullName = fname+ " "+ lname;
}%>
<%String EmpGrpNum="";%>
<%long lgNoOfMedicalEmployees = Long.parseLong(""+noOfMedicalEmployees);%>
<%String strParetQuoteVerId="";%>
<dmshtml:dms_static_with_connector ruleName='privilage'
		property='<%=new String[]{"SHOW_PRODUCT_FACTORSLIST"}%>' connector='or'
		negated="true">
		<% SHOW_PRODUCT_FACTORSLIST=true; %>
</dmshtml:dms_static_with_connector>



<!--  -->
<html:hidden property="answer(Object::PlanFactor::Percent)" name="UWWorkSheet" value="Y" />
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="effDate"/>
<html:hidden property="commissionPercentfromDB" name="UWWorkSheet" styleId="oldCommissionPercentfromDB" value="<%=""+commissionPercentfromDB%>"/>
<html:hidden property="answer(Object::Quote::NoOfMedicalEmployees)" name="UWWorkSheet" styleId="noOfEmps"/>
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactorPrefer)" name="UWWorkSheet" styleId="medicalPrefferedRate"/>
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactorMax)" name="UWWorkSheet" styleId="medicalMaxRate"/>
<!-- QuoteType is already present in QuoteHeader.jsp(Included in this page) -->
<html:hidden property="answer(Object::Quote::ProductId)" name="UWWorkSheet" styleId="ProductId"/>
<html:hidden property="answer(Object::PlanFactor::DrugUWFactorPrefer)" name="UWWorkSheet" styleId="drugPrefferedRate"/>
<html:hidden property="answer(Object::PlanFactor::DrugUWFactorMax)" name="UWWorkSheet" styleId="drugMaxRate"/>
<!--  -->
<!--#######################################################################################-->

<bean:define id="localTotalMedicalPremium" name="UWWorkSheet" property="answer(Object::Quote::TotalMedicalPremium)" scope="request" />
<bean:define id="localMedicalUWFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::MedicalUWFactor)" scope="request" />
<bean:define id="localTotalBasePremium" name="UWWorkSheet" property="answer(Object::Plan::TotalBasePremium)" scope="request" />
<bean:define id="localTRIACoverage" name="UWWorkSheet" property="answer(Object::Plan::TRIACoverage)" scope="request" />
<bean:define id="TRIAPremium" name="UWWorkSheet" property="answer(Object::Plan::TRIAPremium)" scope="request" />
<bean:define id="NonTRIAPremium" name="UWWorkSheet" property="answer(Object::Plan::NonCertifiedTRIAPremium)" scope="request" />

<%
if(isRegulatorySurchargeApplicable.equals("Y") && BranchCode.equals("PR")){
	TotalPremium = (new Double(""+localTotalBasePremium)).doubleValue()+(new Double(""+TRIAPremium)).doubleValue()+(new Double(""+NonTRIAPremium)).doubleValue(); 
}%>
<% String isRenewalEndorsement ="";%>
<dmshtml:IsRenewalEndorsement productId='<%=""+ProductId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId)%>" ></dmshtml:IsRenewalEndorsement>
  <% isRenewalEndorsement = (String) request.getAttribute("isRenewalEndorsement"); 
 		if(isRenewalEndorsement.equals("Y")){ 
  %>	
  <html:hidden property="answer(isRenewalEndorsement)"  styleId="isRenewalEndorsement" value="YES" />
  <html:hidden property ="answer(isRenewalWorkSheetSave)" value ="YES" />
  <%}else{ %>
  	<html:hidden property="answer(isRenewalEndorsement)" styleId="isRenewalEndorsement" value="NO" />
  <%} %>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden styleId="paretQuoteStatus" property="paretquoteStatus"  value="<%=""+paretQuoteStatus %>"/>
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

	<jsp:include page="../quote/EndorsementEILUWExtension.jsp"></jsp:include>	
	<tr>
		<td colspan="4">
			<table border="0" cellspacing="0" cellpadding="0" align="left" width="100%">
				<tr>
					<td  class="sectionhead" align="center">
						Underwriter worksheet
					</td>
				</tr>
			</table>
		</td>
	</tr>	

	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4">
		<table border="0" cellspacing="0" cellpadding="0" align="center"
			width="100%">
			<tr>
				<td class="sectionhead" align="center">Final Premium Calculations</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<%
				String width = "54";
				int widthSize = 464;
				boolean showLife = false;
				boolean showWdi = false;
				boolean showDental = false;
			%>			
			
			<table border="0" cellspacing="0" cellpadding="0%" WIDTH="100%">

			<!-- ADDING DYNAMIC HTML -->
			<tr><td>&nbsp;</td></tr>
			<logic:present name="WORK_SHEET_HTML" scope="request">
				<bean:define id="htmlPage" name="WORK_SHEET_HTML"
					type="java.lang.StringBuffer" />
				<tr>
					<td width="60%">
						<table border="0" cellspacing="1" cellpadding="3">
							<tr><td>
							<!-- *** -->
							</td></tr>
							<%out.println((htmlPage.toString()).replace("<tr><td>&nbsp;</td></tr>",""));
								
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//give format in which you are receiving the `String date_updated`
							    java.util.Date startDate = sdf.parse(quoteStartDate.toString());
								if(BranchCode.equals("PR") && startDate.after(sdf.parse("2021-07-31"))){%>		
									<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Bound","Bind Request","Offered","Lapsed","Declined"}%>" value="<%=paretQuoteStatus.toString()%>" negated="false">
									<tr id="$TRID" style="$TRSTYLE">
									<td class='SearchResult' align='left' >+ Apply Assessment Fee</td>
									<td class='SearchResult' align='right' >
										<html:select property="answer(Object::Plan::IsRegulatorySurchargeApplicable)" value="<%=""+isRegulatorySurchargeApplicable%>" name="UWWorkSheet" styleId="IsRegulatorySurchargeApplicable" onchange="diplayCMP(this);" >
											<html:option value ="Y">Yes</html:option>
											<html:option value ="N">No</html:option>
										</html:select>
									</td>
									<td class='SearchResult' align='right' >
										<input type='text' name='answer(Object::Plan::RegulatorySurchargeFactor)'  value='<%=regulatorySurchargeFactor%>' maxlength='100' style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;TEXT-ALIGN: right;}' size='14'  id='RegulatorySurchargeFactor' onkeyup='javascript:onOutOfFocus("RegulatorySurchargeFactor")' onchange="javascript:onOutOfFocus('RegulatorySurchargeFactorZeroValidation')" onblur='return executeRule(this);' >
									</td>
									<td class='SearchResult' align='right' >%</td>
									<td class='SearchResult' align='right' ><dmshtml:CurrencyFormatTag format="<%=""+regulatorySurcharge%>"/></td></tr>							
									</dmshtml:dms_isPresent>
									<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Bound","Bind Request","Offered","Lapsed","Declined"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
									<tr id="$TRID" style="$TRSTYLE">
									<td class='SearchResult' align='left' >+ Apply Assessment Fee</td>
									<td class='SearchResult' align='right' >
									<%if(isRegulatorySurchargeApplicable.equals("Y")){%>Yes<%}else{%>No<%}%>
									<html:hidden name="UWWorksheet" property="answer(Object::Plan::IsRegulatorySurchargeApplicable)"  value="<%=isRegulatorySurchargeApplicable.toString()%>"  styleId="IsRegulatorySurchargeApplicable"/>
									</td>
									<td class='SearchResult' align='right' >
										<input type='text' name='answer(Object::Plan::RegulatorySurchargeFactor)' readonly="readonly" value='<%=regulatorySurchargeFactor%>' maxlength='100' style='{BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;TEXT-ALIGN: right;}' size='14'  id='RegulatorySurchargeFactor' onkeyup='javascript:onOutOfFocus("RegulatorySurchargeFactor")' onchange="javascript:onOutOfFocus('RegulatorySurchargeFactorZeroValidation')"  onblur='return executeRule(this);' >
									</td>
									<td class='SearchResult' align='right' >%</td>
									<td class='SearchResult' align='right' ><dmshtml:CurrencyFormatTag format="<%=""+regulatorySurcharge%>"/></td></tr>							
									</dmshtml:dms_isPresent>
								<%}%>							
						</table>
					</td>
				</tr>				
			</logic:present>
			<% calculatedTotalPremiumWithTria = (new Double(""+TotalPremium)).doubleValue(); %>
			<logic:present name="QUOTE_DETAIL" scope="request">
				<bean:define id="quoteDetailObject" name="QUOTE_DETAIL"/>
				<bean:define id="planDetailObject" property="healthInsPlanDetail" name="quoteDetailObject"/>
				<bean:define id="calculatedTotalPremium" property="totalBasePremium" name="planDetailObject"/>
				<% calculatedTotalPremiumWithTria = Double.parseDouble("" + calculatedTotalPremium); 
				isCalculateResultPage = true; %>
			</logic:present>
			<jsp:include page="../quote/PremiumSummary.jsp"/>
			<tr>
					<td colspan="4">
						<table border="0" cellspacing="0" cellpadding="0" align="center"
							width="100%">
							<tr>
								<td class="sectionhead" align="center">TRIA Premium</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<%if(isRenewalEndorsement.equals("Y")){  %>
				<tr>
					<td width="100%">
						<table border="0" cellspacing="3" cellpadding="0" WIDTH="100%">
							<tr>
								<td class="SearchResult" width="51%" align="left">
									Certified Acts of Terrorism Rate
								</td>
								<td class="SearchResult" align="right" width="10%">		
								<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Bound"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
															
								<%if(localTRIACoverage.toString().equalsIgnoreCase("Y")){%>
									Yes
								<%}else { %>
									No
								<%}%>
								
								&nbsp;
								
								</dmshtml:dms_isPresent>
								</td>
								<td align="left">
									<bean:define id="localTRIACoverageFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::TRIACoverageFactor)" scope="request" type="java.lang.String"/>
									<%
										double triaFactor=0.0;
										triaFactor=(new Double(localTRIACoverageFactor)).doubleValue();
										double triaFactorpercent = triaFactor*100; 
										com.dms.ejb.common.DMSDetail dmsDetail = new com.dms.ejb.common.DMSDetail();%>					
									<html:text name="UWWorkSheet" property="answer(Object::PlanFactor::TRIACoverageFactor)" value='<%=""+dmsDetail.decimalFormat(triaFactorpercent, 2)%>' styleId="TRIACoverageFactor" size="13" maxlength="100" style="TEXT-ALIGN: right"/>
									<html:hidden property="answer(Object::Plan::TRIACoverage)" name="UWWorkSheet" value="<%=localTRIACoverage.toString()%>" />
								</td>
								<td class="SearchResult" align="left" width="1.5%">
									%
								</td>
								<td  class="SearchResult" align="right" width="11%">
								<%if(localTRIACoverage.toString().equalsIgnoreCase("Y")){ %>
									<bean:define id="TRIAPremium" name="UWWorkSheet" property="answer(Object::Plan::TRIAPremium)" scope="request" />
									<%
									if(isCalculateResultPage) {
										calculatedTotalPremiumWithTria = calculatedTotalPremiumWithTria + (new Double(""+TRIAPremium)).doubleValue();
									}
									%>
									<%									
									String TriaPrem= ""+TRIAPremium;
									double dbAbount=0.0;
							        java.text.NumberFormat nf1 = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US);
							        try {
							        dbAbount= Double.parseDouble(TriaPrem);
							        TriaPrem=nf1.format(dbAbount);
							        nf1.setParseIntegerOnly(false);
							       } catch(Exception e) {TriaPrem=""+TRIAPremium;}
							        
									%>
									
									<%=""+TriaPrem %>
								<%}%>
								
								</td>
								<td width="16%">
									&nbsp;
								</td>
							</tr>
							
							
							<tr>
								<td class="SearchResult" width="52%" align="left">
									Non-certified Terrorism Rate
								</td>
								<td class="SearchResult" align="right" width="10%">	
								<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Bound"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
								<%if(localTRIACoverage.toString().equalsIgnoreCase("Y")){%>
									Yes
								<%}else { %>
									No
								<%} %>
								&nbsp;
								</dmshtml:dms_isPresent>
								</td>
								<td align="left">
									<bean:define id="localNonTRIACoverageFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::NonTRIACoverageFactor)" scope="request" type="java.lang.String"/>
									<%double nonTriaFactor=0.0;
									nonTriaFactor=(new Double(localNonTRIACoverageFactor)).doubleValue();
									double nonTriaFactorpercent=nonTriaFactor*100; 
									com.dms.ejb.common.DMSDetail dmsDetail1 = new com.dms.ejb.common.DMSDetail();%>
									<html:text name="UWWorkSheet" property="answer(Object::PlanFactor::NonTRIACoverageFactor)" value='<%=""+dmsDetail1.decimalFormat(nonTriaFactorpercent, 2)%>' styleId="NonTRIACoverageFactor" size="13" maxlength="6" style="TEXT-ALIGN: right"/>
									<html:hidden property="answer(Object::Plan::TRIACoverage)" name="UWWorkSheet" value="<%=localTRIACoverage.toString()%>" />														
								</td>
								<td class="SearchResult" align="left" width="1.5%">
									%
								</td>
								<td class="SearchResult" align="right" width="11%">
								<%if(localTRIACoverage.toString().equalsIgnoreCase("Y")){ %>
									<bean:define id="NonTRIAPremium" name="UWWorkSheet" property="answer(Object::Plan::NonCertifiedTRIAPremium)" scope="request" />
									<%
									if(isCalculateResultPage) {
										calculatedTotalPremiumWithTria = calculatedTotalPremiumWithTria + (new Double(""+NonTRIAPremium)).doubleValue();
									}
									%>
									<%									
									String TriaPrem= ""+NonTRIAPremium;
									double dbAbount=0.0;
							        java.text.NumberFormat nf1 = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US);
							        try {
							        dbAbount= Double.parseDouble(TriaPrem);
							        TriaPrem=nf1.format(dbAbount);
							        nf1.setParseIntegerOnly(false);
							       } catch(Exception e) {TriaPrem=""+NonTRIAPremium;}
							        
									%>
									
									<%=""+TriaPrem %>
								<%}%>
								</td> 
								<td width="13%">
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
				<%} else { %>
				<tr>
					<td width="100%">
						<table border="0" cellspacing="3" cellpadding="0" WIDTH="100%">
							<tr>
								<td class="SearchResult" width="51%" align="left">
									Certified Acts of Terrorism Rate
								</td>
								<td class="SearchResult" width="11.5%">
									<html:radio name="UWWorkSheet" property="answer(Object::Plan::TRIACoverage)" value="Y"  disabled="false">Yes</html:radio>
            						<html:radio name="UWWorkSheet" property="answer(Object::Plan::TRIACoverage)" value="N" disabled="false">No</html:radio>
								</td>
								<td align="left">
									<bean:define id="localTRIACoverageFactor1" name="UWWorkSheet" property="answer(Object::PlanFactor::TRIACoverageFactor)" scope="request" type="java.lang.String"/>
									<%double triaFactor=0.0;
									triaFactor=(new Double(localTRIACoverageFactor1)).doubleValue();
									double triaFactorpercent=triaFactor*100; 
									com.dms.ejb.common.DMSDetail dmsDetail = new com.dms.ejb.common.DMSDetail();
									String triaFactorPercent = Double.toString(triaFactorpercent);%>					
									<html:text name="UWWorkSheet" property="answer(Object::PlanFactor::TRIACoverageFactor)" value='<%=""+dmsDetail.decimalFormat(triaFactorpercent, 2)%>' styleId="TRIACoverageFactor" size="14" maxlength="100" style="TEXT-ALIGN: right"/>
									<html:hidden property="answer(Object::Plan::TRIACoverage)" name="UWWorkSheet" value="<%=localTRIACoverage.toString()%>" />														
								</td>
								<td class="SearchResult" align="left" width="1.5%">
									%
								</td>
								<td class="SearchResult" align="right" width="11%">
								<%if(localTRIACoverage.toString().equalsIgnoreCase("Y")){ %>
									<bean:define id="EndorsTRIAPremium" name="UWWorkSheet" property="answer(Object::Plan::TRIAPremium)" scope="request" />
									<%
									if(isCalculateResultPage) {
										calculatedTotalPremiumWithTria = calculatedTotalPremiumWithTria + (new Double(""+EndorsTRIAPremium)).doubleValue();
									}
									%>
									<%String TriaPrem= ""+EndorsTRIAPremium;
									double dbAbount=0.0;
							        java.text.NumberFormat nf = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US);
							        try {
							        dbAbount= Double.parseDouble(TriaPrem);
							        TriaPrem=nf.format(dbAbount);
							        nf.setParseIntegerOnly(false);
							       } catch(Exception e) {TriaPrem=""+EndorsTRIAPremium;}
							        
									%>
									
									<%=""+TriaPrem %>
								<%}%>
								</td>
								<td width="16%">
									&nbsp;
								</td>
							</tr>
							
							
							<tr>
								<td class="SearchResult" width="51%" align="left">
									Non-certified Terrorism Rate
								</td>
								<td class="SearchResult" width="11.5%">
									
								</td>
								<td align="left">
									<bean:define id="localNonTRIACoverageFactor1" name="UWWorkSheet" property="answer(Object::PlanFactor::NonTRIACoverageFactor)" scope="request" type="java.lang.String"/>
									<%double NontriaFactor1=0.0;
									NontriaFactor1=(new Double(localNonTRIACoverageFactor1)).doubleValue();
									double nonTriaFactorpercent1=NontriaFactor1*100; 
									com.dms.ejb.common.DMSDetail dmsDetail2 = new com.dms.ejb.common.DMSDetail();
									String nonTriaFactorpercent2 = Double.toString(nonTriaFactorpercent1);%>
									<html:text name="UWWorkSheet" property="answer(Object::PlanFactor::NonTRIACoverageFactor)" value='<%=""+dmsDetail2.decimalFormat(nonTriaFactorpercent1, 2)%>' styleId="NonTRIACoverageFactor" size="14" maxlength="100" style="TEXT-ALIGN: right"/>
									<html:hidden property="answer(Object::Plan::TRIACoverage)" name="UWWorkSheet" value="<%=localTRIACoverage.toString()%>" />														
								</td>
								<td class="SearchResult" align="left" width="1.5%">
									%
								</td>
								<td class="SearchResult" align="right" width="11%">
								<%if(localTRIACoverage.toString().equalsIgnoreCase("Y")){ %>
									<bean:define id="EndorsNonTRIAPremium" name="UWWorkSheet" property="answer(Object::Plan::NonCertifiedTRIAPremium)" scope="request" />
									<%
									if(isCalculateResultPage) {
										calculatedTotalPremiumWithTria = calculatedTotalPremiumWithTria + (new Double(""+EndorsNonTRIAPremium)).doubleValue();
									}
									%>
									<%String NonTriaPrem= ""+EndorsNonTRIAPremium;
									double dbAbount=0.0;
							        java.text.NumberFormat nf = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US);
							        try {
							        dbAbount= Double.parseDouble(NonTriaPrem);
							        NonTriaPrem=nf.format(dbAbount);
							        nf.setParseIntegerOnly(false);
							       } catch(Exception e) {NonTriaPrem=""+EndorsNonTRIAPremium;}
							        
									%>
									
									<%=""+NonTriaPrem %>
								<%}%>
								</td>
								<td width="16%">
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
			<%} %>
			
			<tr><td>
			<bean:define id="TotalPremium" name="UWWorkSheet" property="answer(Object::Quote::TotalPremium)" scope="request" />
			<html:hidden property="answer(Object::Quote::TotalPremium)" value="<%=""+TotalPremium %>" />
			</td></tr>
			<%--<tr>
					<td colspan="4">
						<table border="0" cellspacing="0" cellpadding="0" align="center"
							width="100%">
							<tr>
								<td class="sectionhead" align="center">Gross Premium</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="60%">
						<table border="0" cellspacing="3" cellpadding="0" WIDTH="100%">
							<tr>
								<td class="SearchResult" width="50%" align="left">
									= Gross Premium
								</td>
								<td align="left" width="23.5%">
								</td>
								<td class="SearchResult" align="right" width="11%">
									<bean:define id="TotalPremium" name="UWWorkSheet" property="answer(Object::Quote::TotalPremium)" scope="request" />
									<%									
									String usCurrency= ""+TotalPremium;
									double dbAbount=0.0;
							        java.text.NumberFormat nf = java.text.NumberFormat.getCurrencyInstance(java.util.Locale.US);
							        try {
							        dbAbount= Double.parseDouble(usCurrency);
							        usCurrency=nf.format(dbAbount);
							        nf.setParseIntegerOnly(false);
							       } catch(Exception e) {usCurrency=""+TotalPremium;}
							        
									%>
									
									<%=""+usCurrency %>
								</td>
								<td width="21%">
									&nbsp;
								</td>
							</tr>
																			
						</table>
					</td>	
				</tr>	--%>	
			
			
			
			
			<%if(isRenewalEndorsement.equals("Y")){  %>
			<tr>
				<td colspan="4">
					<table border="0" cellspacing="0" cellpadding="0" align="center"
						width="100%">
						<tr>
							<td class="sectionhead" align="center">Minimum Earned Premium</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td width="60%">
					<table border="0" cellspacing="3" cellpadding="0" WIDTH="100%">
						<tr>
							<td class="SearchResult" width="53%">
								Minimum Earned Premium
							</td>
							<td align="left" width="10%">
							</td>
							<td align="left">						
								<html:text name="UWWorkSheet" property="answer(Object::Quote::PolicyMinEarned)" styleId="mepPercentage" size="14" maxlength="6" style="TEXT-ALIGN: right"/>
								<html:hidden property="answer(Object::Quote::UWWorksheet::ISMEPEnabled)" value="Y" />								
							</td>
							<td class="SearchResult" align="left" width="1.5%">
									%
							</td>
							<td align="right" width="28%">
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
			<tr>
				<td colspan="4">
					<table border="0" cellspacing="0" cellpadding="0" align="center"
						width="100%">
						<tr>
							<td class="sectionhead" align="center">Assoicated Underwriter</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td width="60%">
					<table border="0" cellspacing="3" cellpadding="0" WIDTH="100%">
						<tr>
							<td class="SearchResult" width="50%">
								Associated Underwriter
							</td>
							<td align="left" width="10%">
							</td>
							<td>						
								<%
									com.dms.ejb.data.QuestionHashMap qMapALLENTITIES =   new com.dms.ejb.data.QuestionHashMap(10);				
									qMapALLENTITIES.put("ownerId", ""+ownerId);
									qMapALLENTITIES.put("dbname", ""+com.dms.web.util.DbUtils.getReadDS(pageContext));
									qMapALLENTITIES.put("Object::Entity::EntityType", "UNDERWRITER");	
									String uwNameCode ="";
								%>
								<dmshtml:execute_rules nameInSession="GETALLENTITIESBYTYPE"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"  formName="form::GETALLUW"  answerMap="<%=qMapALLENTITIES%>"  processInstance="preprocess" />
								<logic:present name ='GETALLENTITIESBYTYPE' scope ='request'>
										<%
											if(qMapALLENTITIES.containsKey("ALLENTITIES_BYTYPE"))
											{
		                 						 java.util.ArrayList arrList=null;
		                 						 Object objList=qMapALLENTITIES.get("ALLENTITIES_BYTYPE");
		                  						 if((objList!=null) &&(objList instanceof java.util.ArrayList))
											{
										%>
										
										<bean:define id="assignedUWID" property="answer(Object::Quote::IssuanceUnderwriterId)" name="UWWorkSheet"/>												
											<html:select name="UWWorkSheet" property="answer(Object::Quote::IssuanceUnderwriterId)" styleClass="txtbox" styleId="assignedUnderwriter">
											<html:option value ="">Select</html:option>
											<%
		                  					    arrList=(java.util.ArrayList)objList;
							 					 for (int i=0; i<arrList.size(); i++)  
												{ 
												   com.dms.ejb.data.QuestionHashMap arrEntitiesQMap=(com.dms.ejb.data.QuestionHashMap)arrList.get(i);
											%>
											<html:option value ='<%=arrEntitiesQMap.getString("ENTITY_ID")%>'>
												<%=arrEntitiesQMap.getString("ENTITY_FNAME") + " " + arrEntitiesQMap.getString("ENTITY_LNAME")+" - "+arrEntitiesQMap.getString("BRANCH_NAME")+" - "+arrEntitiesQMap.getString("ENTITY_NUM")%>
											</html:option>												
											<%
											if((""+assignedUWID).equals(arrEntitiesQMap.getString("ENTITY_ID"))){
												uwNameCode = arrEntitiesQMap.getString("ENTITY_NUM");
											}
												}
											%>
											</html:select>
										
										<%
													}
											}
										%>
										</logic:present>									
							</td>
						</tr>
						<tr>
							<td class="SearchResult" width="50%">
								Select Branch (for Policy # rule)
							</td>
							<td align="left" width="10%">
							</td>
							<td>
								<dmshtml:get_DropDown_Values dbname='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'  lookupType="Branch" nameInSession="dropDownValues" ownerId='<%=""+ownerId %>' />
									<logic:present name="dropDownValues" scope="request">
										<bean:define id="dropDownValueList" name="dropDownValues" type="java.util.ArrayList"/>			
											<html:select property="answer(Object::Company::Paper::BranchCode)" styleClass='txtbox' styleId="branchCode" titleKey="ToolTip.UnderwriterWorksheet.BranchCode">
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
					</table>
				</td>	
			</tr>
			<%}else{%>			
				<html:hidden property="answer(Object::Company::Paper::BranchCode)" value="<%=""+BranchCode%>"/>
				<html:hidden property="answer(Object::Quote::IssuanceUnderwriterId)" value="<%=""+uwId%>"/>
				<html:hidden property="answer(Object::Quote::QuoteUWNameCode)" value="<%=""+UWNameCode%>"  />
			<%}%>	
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>							
			<tr>
				<td colspan="4">
					<table border="0" cellspacing="0" cellpadding="0" align="center"
						width="100%">
						<tr>
							<td class="sectionhead" align="center">Commission Calculations</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td width="60%">
					<table border="0" cellspacing="3" cellpadding="0" WIDTH="50%">
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_QUOTE_COMMISSION"}%>' connector='or' negated="true">
						<% boolean disableCommissionRateImpacted=true; %>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_QUOTE_RATEIMPCOMMISSION"}%>' connector='or' negated="true">
							<% disableCommissionRateImpacted=false; %>
						</dmshtml:dms_static_with_connector>
						 <tr>
							<!-- 	<td class="SearchResult">
								Commission Adjustment affects Rate?
							</td>
							<td class="SearchResult" align="left">
							<bean:define name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)" id="RateImpacted" />
								<%
								String rateImpactedFlag = "";
									if(request.getAttribute("RateImpactedFlag")!=null){
										rateImpactedFlag = ""+request.getAttribute("RateImpactedFlag"); 
									}
								%>
								<%if(paretLockStatus!=null && paretLockStatus.equals("Locked")){%>
									<html:radio name="UWWorkSheet"  property="answer(Object::QuoteCommission::RateImpacted)" value="Y" styleId="RateImpactedyes" disabled="true" >Yes&nbsp;&nbsp;
									</html:radio>
									<html:radio name="UWWorkSheet"  property="answer(Object::QuoteCommission::RateImpacted)" value="N" styleId="RateImpactedno"  disabled="true" >No
									</html:radio>
									<html:hidden name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)" value='<%=""+RateImpacted.toString()%>' />
								<%}else{%>
									<html:radio name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)" value="Y" styleId="RateImpactedyes" disabled="<%=disableCommissionRateImpacted%>" >Yes&nbsp;&nbsp;
									</html:radio>
									<html:radio name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)" value="N" styleId="RateImpactedno"  disabled="<%=disableCommissionRateImpacted%>" >No
									</html:radio>
								<%}%>

							</td>-->
						</tr><!-- 
							<%if(disableCommissionRateImpacted){%>
								<html:hidden name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)"  />
							<%}%>
							 -->
								<html:hidden name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)" value="Y" />							
							<tr><td><html:hidden name="UWWorkSheet" property="answer(Object::PlanFactor::CommissionFactor)"  styleId="commissionFactor" /></td></tr>
							
							<bean:define id="oldCommissionPercentage" name="UWWorkSheet" property="answer(Object::QuoteCommission::InitialCommissionPercentage)" type="java.lang.String"/>
							<%
								dblCommissionVal = (new Double(oldCommissionPercentage)).doubleValue();
							%>
						<tr>
							<td class="SearchResult" align="left" width="40%">
								Default Agent Commission %
							</td>
							<td class="SearchResult" align="left" >
								<dmshtml:dms_text  name="UWWorkSheet" property ="answer(Object::QuoteCommission::InitialCommissionPercentage)"  size="6" maxlength="6" styleClass="txtbox"  readonly="true"  />
							</td>
						</tr>
						<tr>
							<bean:define id="currCommissionPercentage" name="UWWorkSheet" property="answer(Object::QuoteCommission::CommissionPercentage)" type="java.lang.String"/>
							<bean:define name="UWWorkSheet" property="answer(Object::QuoteCommission::InitialCommissionPercentage)" id="InitialCommissionPercentage" />
							<td class="SearchResult" align="left" width="40%">
								Commission Adjustment %
							</td>
							<td class="SearchResult" align="left" >
								<% int commissionVal = 0;						
									try{
										dblCurrCommissionVal = (new Double(currCommissionPercentage)).doubleValue();
										commissionVal = (new Double(oldCommissionPercentage)).intValue(); 							
										System.out.println("commissionVal-->"+commissionVal);
										System.out.println("dblCurrCommissionVal-->"+dblCurrCommissionVal);
									}catch(Exception ex){}
								%>
								
															
								<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
									<dmshtml:dms_isPresent property='<%=new String[]{"In Progress", "Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true" >
										<html:select property="answer(Object::QuoteCommission::CommissionAdjustmentSign)"  name="UWWorkSheet"  styleId="CommissionAdjustmentSign" onchange="diplayCMP(this);" >
											<html:option value ="+">+</html:option>
											<html:option value ="-">-</html:option>
										</html:select>								
								
										<input type="text" name="answer(Object::QuoteCommission::CommissionAdjustmentValue)" value="<%=""+commissionAdjustValue%>" maxlength="5" class="txtbox" size="5" id="CommissionAdjustmentValue" onchange="diplayCMP(this);"/> 	
									</dmshtml:dms_isPresent>
								</dmshtml:dms_isPresent>	
												
								<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>">
									<dmshtml:dms_isPresent property='<%=new String[]{"In Progress", "Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true" >
										<html:select property="answer(Object::QuoteCommission::CommissionAdjustmentSign)"  name="UWWorkSheet"  styleId="CommissionAdjustmentSign" onchange="diplayCMP(this);" >
											<html:option value ="+">+</html:option>
											<html:option value ="-">-</html:option>
										</html:select>								
								
										<input type="text" name="answer(Object::QuoteCommission::CommissionAdjustmentValue)" value="<%=""+commissionAdjustValue%>" maxlength="5" class="txtbox" size="5" id="CommissionAdjustmentValue" onchange="diplayCMP(this);"/> 	
									</dmshtml:dms_isPresent>
								</dmshtml:dms_isPresent>
								
								<dmshtml:dms_isPresent property="<%=new String[]{"Locked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
									<dmshtml:dms_isPresent property='<%=new String[]{"In Progress", "Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="false" >
										<html:select property="answer(Object::QuoteCommission::CommissionAdjustmentSign)"  name="UWWorkSheet" disabled="true"  styleId="CommissionAdjustmentSign" onchange="diplayCMP(this);" >
											<html:option value ="+">+</html:option>
											<html:option value ="-">-</html:option>
										</html:select>

										<input type="text" name="answer(Object::QuoteCommission::CommissionAdjustmentValue)" value="<%=""+commissionAdjustValue%>" maxlength="5" class="txtbox" size="5" readonly="true" id="CommissionAdjustmentValue" onchange="diplayCMP(this);"/> 
									</dmshtml:dms_isPresent>
								</dmshtml:dms_isPresent>	
								
								<dmshtml:dms_isPresent property="<%=new String[]{"Locked"}%>" value="<%=paretLockStatus.toString()%>">
									<dmshtml:dms_isPresent property='<%=new String[]{"In Progress", "Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="false" >
										<html:select property="answer(Object::QuoteCommission::CommissionAdjustmentSign)"  name="UWWorkSheet" disabled="true"  styleId="CommissionAdjustmentSign" onchange="diplayCMP(this);" >
											<html:option value ="+">+</html:option>
											<html:option value ="-">-</html:option>
										</html:select>

										<input type="text" name="answer(Object::QuoteCommission::CommissionAdjustmentValue)" value="<%=""+commissionAdjustValue%>" maxlength="5" class="txtbox" size="5" readonly="true" id="CommissionAdjustmentValue" onchange="diplayCMP(this);"/> 
									</dmshtml:dms_isPresent>
								</dmshtml:dms_isPresent>
							
							<html:hidden name="UWWorkSheet" property="oldCommissionPercentage" value="<%=""+dblCommissionVal%>" styleId="oldCommissionPercentage" />
							</td>
						</tr>
				
						<tr>								
							<td class="SearchResult" align="left" width="40%">
								Adjusted Agent Commission %
							</td>
							<td class="SearchResult" align="left" >
								<dmshtml:dms_text  name="UWWorkSheet" property ="CurrentCommissionPercentage"  size="6" maxlength="6" styleClass="txtbox" styleId="CurrentCommissionPercentage" readonly="true" value="<%=""+dblCurrCommissionVal%>" /> 
								<html:hidden name="UWWorkSheet" property="answer(Object::QuoteCommission::CommissionPercentage)" value="<%=""+dblCurrCommissionVal%>" styleId="newCommissionPercentage" />
							</td>
						</tr>
						
								<% double subQuoteTotal = 0;
									double allriskCommissionPercent = 0;
									try{
										subQuoteTotal = (new Double(""+calculatedTotalPremiumWithTria)).doubleValue();
									}catch(Exception ex){}
									try{
										allriskCommissionPercent = (new Double(""+parentOwnerCommissionPercent)).doubleValue();
									}catch(Exception ex){}
								%>
						<tr>
							<td></td>
						</tr>	
						<tr>							   
							<td class="SearchResult" align="left" width="40%">
								Broker Commission
							</td>
							<% double brokerCommissionAmount = 0; 
	  						   double dblInitialCommissionPercentage = 0; %>
							<% 
								try {
									brokerCommissionAmount = (subQuoteTotal * dblCurrCommissionVal / 100);
								} catch(Exception ex) {} 
							%>	
							<td class="SearchResult" align="left" >
				
								<dmshtml:CurrencyFormatTag format='<%=""+brokerCommissionAmount%>'/>			
							</td>
						</tr>	
						<tr>
							<td></td>
						</tr>					
						<!-- tr>							   
							<td class="SearchResult" align="left" width="40%">
								MGA Commission %
							</td>
							<td class="SearchResult" align="left" >
								<%=""+parentOwnerCommissionPercent%>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>	
						<tr>							   
							<td class="SearchResult" align="left" width="40%">
								MGA Commission 
							</td>
							<td class="SearchResult" align="left" >
								<dmshtml:CurrencyFormatTag format='<%=""+(subQuoteTotal * allriskCommissionPercent / 100)%>'/>	
							</td>
						</tr --> 
						
						<tr>							   
							<td class="SearchResult" align="left" width="40%">
								Net Premium
							</td>
							<% 
							double totalPremium = 0;
							totalPremium = (new Double(""+calculatedTotalPremiumWithTria)).doubleValue();
							if(isRegulatorySurchargeApplicable.equals("Y") && BranchCode.equals("PR")){
						 		totalPremium = totalPremium + (new Double(""+regulatorySurcharge)).doubleValue(); 
						   	}
							%>
							<td class="SearchResult" align="left" >
							<dmshtml:CurrencyFormatTag format='<%=""+(totalPremium - brokerCommissionAmount) %>'/>									
							</td>
						</tr>
			
						</dmshtml:dms_static_with_connector>
						<tr>
							<td>&nbsp;</td>
						</tr>	
						<tr>
							<td class="SearchResult" align="left" width="20%">
								Quote Status
							</td>
							<%if(isRenewalEndorsement.equals("Y")){  %>
							<td class="SearchResult" align="left">
							<logic:present name="parentQuoteDetail" scope="request">
									<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Submitted","Referred","Declined", "Offered", "Bound", "Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>" >
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"  name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" onchange="return setLockStatusNew(this.form);">											
											<dmshtml:dms_option value ='<%=paretQuoteStatus.toString()%>'><%=paretQuoteStatus.toString()%></dmshtml:dms_option>
											<dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option>
											<dmshtml:dms_option value ='Declined'>Declined</dmshtml:dms_option>
											<dmshtml:dms_option value ='Offered'>Offered</dmshtml:dms_option>
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>
									
									<dmshtml:dms_isPresent property="<%=new String[]{"Referred"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"  name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" onchange="return setLockStatusNew(this.form);">											
											<dmshtml:dms_option value ='<%=paretQuoteStatus.toString()%>'><%=paretQuoteStatus.toString()%></dmshtml:dms_option>
											<dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option>											
											<dmshtml:dms_option value ='Offered'>Offered</dmshtml:dms_option>
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>
									
									<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Submitted","Offered", "Bound", "Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>"  negated= "true">
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"   name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>" styleId="Object$Quote$QuoteStatus" onchange="return setLockStatusNew(this.form);">	
											<dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option>											
											<dmshtml:dms_option value ='Offered'>Offered</dmshtml:dms_option>
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>
									
									<dmshtml:dms_isPresent property="<%=new String[]{"Declined"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"  name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" onchange="return setLockStatusNew(this.form);">											
											<dmshtml:dms_option value ='<%=paretQuoteStatus.toString()%>'><%=paretQuoteStatus.toString()%></dmshtml:dms_option>
											<dmshtml:dms_option value ='In Progress'>Reactivate</dmshtml:dms_option>
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>
									<input type="hidden" name="quoteStatusInitValue" value="<%=paretQuoteStatus.toString()%>" id="quoteStatusInitValue"/>
								</logic:present>
							</td>
							<%}else { %>
							<td class="SearchResult" align="left">													
								<logic:present name="parentQuoteDetail" scope="request">
									<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Submitted","Referred","Declined", "Offered", "Bound", "Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>" >
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"  name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" onchange="return setLockStatusNew(this.form);">											
											<dmshtml:dms_option value ='<%=paretQuoteStatus.toString()%>'><%=paretQuoteStatus.toString()%></dmshtml:dms_option>
											<dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option>
											
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>


									<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Submitted","Referred", "Offered", "Bound", "Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>"  negated= "true">
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"   name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>" styleId="Object$Quote$QuoteStatus" onchange="return setLockStatusNew(this.form);">	
											<dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option>											
											<dmshtml:dms_option value ='Offered'>Offered</dmshtml:dms_option>
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>
									
									<dmshtml:dms_isPresent property="<%=new String[]{"Declined"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"  name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" onchange="return setLockStatusNew(this.form);">											
											<dmshtml:dms_option value ='<%=paretQuoteStatus.toString()%>'><%=paretQuoteStatus.toString()%></dmshtml:dms_option>
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>
									<input type="hidden" name="quoteStatusInitValue" value="<%=paretQuoteStatus.toString()%>" id="quoteStatusInitValue"/>
								</logic:present>				
							</td>
							<%} %>
						</tr>
						<tr>
							<td>
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SELECT_RATE_LEVEL"}%>' connector='or' negated="true">
									<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
									</dmshtml:dms_isPresent>
								</dmshtml:dms_static_with_connector>
							</td>
						</tr>
						
						<!-- To hide the Calculate and Save buttons is the quote status is Sold, Lost,Rejected (+ Bound, Issued)-->
						<dmshtml:dms_isPresent 	property="<%=new String[]{"Sold", "Lost", "Rejected", "Lapsed", "Bound", "Issued"}%>" value="<%=paretQuoteStatus.toString()%>">
							<tr>
								<td  align="left" width="20%" title="<bean:message key='ToolTip.UWWorksheet.Calculate'/>">
									<html:button value="Calculate" property="amswer(button)" styleClass="sbttn" onclick="return SubmitToRecalculate()"/>
								</td> 
	
								<td align="left" title="<bean:message key='ToolTip.UWWorksheet.Save'/>">
									<html:button value="Save" property="amswer(savebutton)" styleClass="sbttn" styleId="UnderwriterSaveSubmit" onclick="return SubmitToCheckRule()"/>
								</td> 
							</tr>
						</dmshtml:dms_isPresent>


<!-- Added valdation 20070309 Start-->
	

						<!-- To show the Calculate and Save buttons is the quote status is Sold, Lost,Rejected (+ Bound, Issued) for particular privelege -->
						<dmshtml:dms_isPresent 	property="<%=new String[]{"Sold", "Lost", "Rejected", "Bound", "Issued"}%>" value="<%=paretQuoteStatus.toString()%>" negated= "true">
						<tr>		
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_UW_IN_LOST_SOLD_REJ_STA"}%>' connector='or'negated="true">

							<td  align="left" width="20%" title="<bean:message key='ToolTip.UWWorksheet.Calculate'/>">
								<html:button value="Calculate" property="amswer(button)" styleClass="sbttn" onclick="return SubmitToRecalculate()"/>
							</td> 


							<td align="left" title="<bean:message key='ToolTip.UWWorksheet.Save'/>">
								<html:button value="Save" property="amswer(savebutton)" styleClass="sbttn" styleId="UnderwriterSaveSubmit"  onclick="return SubmitToCheckRule()"/>
							</td> 


							</dmshtml:dms_static_with_connector>

						    </tr>
						</dmshtml:dms_isPresent>
	
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
		
			<%
			double med_drug_total_premium = 0.0;
			Object obj = request.getAttribute("UWWorkSheet");
			com.dms.web.data.DataForm AddEnt = (com.dms.web.data.DataForm)obj;
			com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap)AddEnt.getAnswerMap();
				
			%>
	
			<logic:equal name="UWWorkSheet" property="answer(Object::Quote::CompositeRate)" value="No">
				<dmshtml:dms_HasFeature_Available_InProduct productId='<%=Long.parseLong(""+ProductId)%>' featureName="Member_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" state="<%=""+CustomerState%>" >	

			<tr>
				<td colspan="15">
					<%
					int count = 0;
					int hippaCount = 0;
					double quotePremium=0.0;
					double empOnlyTotalPremium=0.0;
					double empOnlyDentalPremium=0.0;
					double spouseOnlyTotalPremium=0.0;
					double spouseOnlyDentalPremium=0.0;
					double childrenOnlyTotalPremium=0.0;
					double childOnlyDentalPremium=0.0;
					double empMedicalPremium=0.0;
					double empDentalPremium=0.0;
					double empTotalMedicalPremium=0.0;
					double empTotalDentalPremium=0.0;
					double totalEmpPremium=0.0;
					double totalWDIPremium=0.0;
					double totalLifePremium=0.0;
					%>

					<%
					if(qmap.containsKey("EmpListUnderwritercalculate"))
					{
						java.util.ArrayList arrList=null;
						Object objList=qmap.get("EmpListUnderwritercalculate");
						if((objList!=null) &&(objList instanceof java.util.ArrayList))
						{
							arrList=(java.util.ArrayList)objList;
						%>
		 			<table border="0">
						<tr>
							<td colspan="13">
								&nbsp;
							</td>
						</tr>
							
						<tr>
							<td class="sectionhead" width="2%" rowspan="2">
								No
							</td>
							<td class="sectionhead" width="1%" rowspan="2">
								Cobra
							</td>
							<td class="sectionhead" width="8%" rowspan="2">
								Last Name
							</td>
							<td class="sectionhead" width="8%" rowspan="2">
								First  Name
							</td>
							<td class="sectionhead" width="7%" rowspan="2">
								Gender
							</td>
							<td class="sectionhead" width="5%" rowspan="2">
								Age
							</td>
							<td class="sectionhead" rowspan="2">
								 # child(ren)
							</td>
							<td class="sectionhead" rowspan="2">
								Deductible
							</td>
							<td class="sectionhead" width="10%" rowspan="2">
								Health Plan Coverage Election
							</td>
							<!-- <td class="sectionhead" width="12%">
							# Children</td> -->
									<!-- <td class="sectionhead" width="12%">
								Employee Deductible</td> -->
							<td align="center" class="sectionhead" colspan="4" width="20%">
								Medical Insurance
							</td>
							<td align="center" class="sectionhead" colspan="4" width="20%">
								Dental Insurance
							</td>
									
							<td align="center" class="sectionhead" colspan="2" width="10%">
								Life
							</td>
							
							<td align="center" class="sectionhead" colspan="2" width="10%">
								Weekly Disability
							</td>

							<td class="sectionhead" width="12%" rowspan="2">
								Total Premium
							</td>
						</tr>
						<tr>
							<td align="left" class="sectionhead">
								Employee
							</td>
							<td align="left" class="sectionhead">
								Spouse
							</td>
							<td align="left" class="sectionhead">	
								Child
							</td>
							<td align="left" class="sectionhead">
								Total
							</td>
							<td align="left" class="sectionhead">	
								Employee
							</td>
							<td align="left" class="sectionhead">
								Spouse
							</td>
							<td align="left" class="sectionhead">
								Child
							</td>
							<td align="left" class="sectionhead">
								Total
							</td>
							<td align="left" class="sectionhead">
								Amt
							</td>
							<td align="left" class="sectionhead">
								Premium
							</td>
							<td align="left" class="sectionhead">
								Amt
							</td>
							<td align="left" class="sectionhead">
								Premium
							</td>
						</tr>
						<% for (int i=0; i<arrList.size(); i++)  
							{ 
											
							String employeePremium="";
							String spousePremium ="";
							String childrenPremium ="";
							String employeeDentalPremium="";
							String spouseDentalPremium="";
							String childDentalPremium="";
														
							com.dms.ejb.data.QuestionHashMap arrEmployeeQMapList=(com.dms.ejb.data.QuestionHashMap)arrList.get(i);
							if(!arrEmployeeQMapList.getString("ELECTION").equalsIgnoreCase("none"))
								{
									++hippaCount;
								}
								  String cobraEmployee="";
								  if(arrEmployeeQMapList.getString("COBRAEMPLOYEE").equals("Y")){ 
								      cobraEmployee="@";
								  }%>
						<tr>
							<td class="SearchResult" align="center" width="2%" >
								<%=++count%>
							</td>
							<td class="SearchResult" align="center" width="1%" >
								<%=cobraEmployee%>
							</td>
							<td class="SearchResult" align="left"  >
								<%=arrEmployeeQMapList.getString("LNAME")%>
							</td>
							<td class="SearchResult" align="left" >	
								<%=arrEmployeeQMapList.getString("FNAME")%>
							</td >
							<td class="SearchResult" align="left" >
								<%=arrEmployeeQMapList.getString("GENDER")%>
							</td>
							<td class="SearchResult" align="right">
								<%=arrEmployeeQMapList.getString("AGE")%>
							</td>
							<td class="SearchResult" align="right">
								<%=arrEmployeeQMapList.getString("numOfChild")%>
							</td>
							<td class="SearchResult" align="right">
								<%=arrEmployeeQMapList.getString("DEDUCTIBLE")%>
							</td>
							<td class="SearchResult" align="left" >
								<%=arrEmployeeQMapList.getString("ELECTION")%>
							</td>	
							<td class="SearchResult" align="right" >
								<% try{%>
								<%
									empMedicalPremium=0.0;
									employeePremium = arrEmployeeQMapList.getString("EMPRATE");
									empOnlyTotalPremium+=Double.parseDouble(employeePremium);
									empMedicalPremium+=Double.parseDouble(employeePremium.toString());
								%>
								<dmshtml:CurrencyFormatTag format="<%=employeePremium.toString()%>"/>
									<%}catch(Exception exc){}%>
							</td>
							<td class="SearchResult" align="right" >
								<% try{
								spousePremium = arrEmployeeQMapList.getString("SPSRATE");
								empMedicalPremium+=Double.parseDouble(spousePremium.toString());
								%>
								<%
								spouseOnlyTotalPremium+=Double.parseDouble(spousePremium.toString());
								%>
								<dmshtml:CurrencyFormatTag format="<%=spousePremium.toString()%>"/>
								<%}catch(Exception exc){}%>
							</td>
							<td class="SearchResult" align="right" >
								<% try{%>
											
								<%
								childrenPremium = arrEmployeeQMapList.getString("CHILDRTE");
								empMedicalPremium+=Double.parseDouble(childrenPremium.toString());
								childrenOnlyTotalPremium+=Double.parseDouble(childrenPremium.toString());
								%>
								<dmshtml:CurrencyFormatTag format="<%=childrenPremium.toString()%>"/>
								<%}catch(Exception exc){}%>
							</td>
							<td class="SearchResult" align="right" >
								<% try{
																												
								empTotalMedicalPremium+=empMedicalPremium;
							   %>
								<dmshtml:CurrencyFormatTag format="<%=""+empMedicalPremium%>"/>
																				
								<%
									
								}catch(Exception exc){}%>
							</td>
							<td class="SearchResult" align="right" >
								<% try{
									empDentalPremium=0.0;
									employeeDentalPremium = arrEmployeeQMapList.getString("EMP_DENTAL_RATE");
									empOnlyDentalPremium+=Double.parseDouble(employeeDentalPremium);
									empDentalPremium+=Double.parseDouble(employeeDentalPremium.toString());
								%>
								<dmshtml:CurrencyFormatTag format="<%=employeeDentalPremium.toString()%>"/>
								<% }catch(Exception exc){System.out.println("exception-->"+exc.getMessage());} %>		
							</td>
							<td class="SearchResult" align="right" >
								<% try{
								spouseDentalPremium = arrEmployeeQMapList.getString("SPS_DENTAL_RATE");
								spouseOnlyDentalPremium+=Double.parseDouble(spouseDentalPremium);
								empDentalPremium+=Double.parseDouble(spouseDentalPremium.toString());
								%>
								<dmshtml:CurrencyFormatTag format="<%=spouseDentalPremium.toString()%>"/>
								<% }catch(Exception exc){System.out.println("exception-->"+exc.getMessage());} %>		
							</td>
							<td class="SearchResult" align="right" >
								<% try{
								childDentalPremium = arrEmployeeQMapList.getString("CHILD_DENTAL_RATE");
								childOnlyDentalPremium+=Double.parseDouble(childDentalPremium);
								empDentalPremium+=Double.parseDouble(childDentalPremium.toString());
								%>
								<dmshtml:CurrencyFormatTag format="<%=childDentalPremium.toString()%>"/>
								<% }catch(Exception exc){System.out.println("exception-->"+exc.getMessage());} %>		
							</td>
							<td class="SearchResult" align="right" >
								<% try{
								
								empTotalDentalPremium+=empDentalPremium;
								%>
								<dmshtml:CurrencyFormatTag format="<%=""+empDentalPremium%>"/>
								<%
											
								}catch(Exception exc){}%>
							</td>
							<td class="SearchResult" align="right" >
								<% try{%>
								<dmshtml:CurrencyFormatTag format="<%=arrEmployeeQMapList.getString("LIFE_AMT")%>"/>
								<%}catch(Exception exc){}%>
							</td>								
							<td class="SearchResult" align="right" >
								<% try{%>
								<dmshtml:CurrencyFormatTag format="<%=arrEmployeeQMapList.getString("LIFE_PRM")%>"/>
								<%
									totalLifePremium += Double.parseDouble(arrEmployeeQMapList.getString("LIFE_PRM"));
									%>
									<%}catch(Exception exc){}%>
							</td>
							<td class="SearchResult" align="right" >
								<% try{%>
								<dmshtml:CurrencyFormatTag format="<%=arrEmployeeQMapList.getString("WDI_AMT")%>"/>
								<%}catch(Exception exc){}%>
							</td>
							<td class="SearchResult" align="right" >
								<% try{%>
								<dmshtml:CurrencyFormatTag format="<%=arrEmployeeQMapList.getString("WDI_PRM")%>"/>
								<%
								totalWDIPremium += Double.parseDouble(arrEmployeeQMapList.getString("WDI_PRM"));
								%>
										
								<%}catch(Exception exc){}%>
							</td>
							<td class="SearchResult" align="right" >
								<% try{%>
								<dmshtml:CurrencyFormatTag format="<%=arrEmployeeQMapList.getString("ROW_TOTAL")%>"/>
								<%
									totalEmpPremium += Double.parseDouble(arrEmployeeQMapList.getString("ROW_TOTAL"));
								%>
								<%}catch(Exception exc){}%>
							</td>
						</tr>
					 <%    
					}
					}%>

						<tr>
							<td colspan="9" align="right"  class="FormLabels">
								Total
							</td>
							<td  align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+empOnlyTotalPremium%>"/>
							</td>
							<td  align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+spouseOnlyTotalPremium%>"/>
							</td>
							<td  align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+childrenOnlyTotalPremium%>"/>
							</td>
							<td  align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+empTotalMedicalPremium%>"/>
							</td>
							<td  align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+empOnlyDentalPremium%>"/>
							</td>
							<td  align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+spouseOnlyDentalPremium%>"/>
							</td>
							<td  align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+childOnlyDentalPremium%>"/>
							</td>

							<td align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+empTotalDentalPremium%>"/>
							</td>
									
							<td  align="right" class="TextMatter1" >
								&nbsp;
							</td>
							<td align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+totalLifePremium%>"/>
							</td>
								
							<td  align="right" class="TextMatter1" >
								&nbsp;
							</td>
							<td align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+totalWDIPremium%>"/>
							</td>
							<td  align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+totalEmpPremium%>"/>
							</td>
						</tr>
								<%
										quotePremium=totalEmpPremium;
										quotePremium+=hippaCount*2;
								%>


								

						<tr>
							<td colspan="9" align="right"class="FormLabels">
								HIPAA Fee ($2/insured employee)
							</td>
							<td colspan="10" align="right">
							</td>
							<td colspan="4" align="right" class="TextMatter1" >
								<dmshtml:CurrencyFormatTag format="<%=""+(hippaCount*2)%>"/>
							</td>
						</tr>

						<tr>
							<td colspan="9" align="right" class="FormLabels">
								Monthly Plan Total
							</td>
							<td colspan="12" align="right">
							</td>
							<td colspan="1" align="right" class="FormLabels">
								<dmshtml:CurrencyFormatTag format="<%=""+quotePremium%>"/>
							</td>
						</tr>
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_QUOTE_COMMISSION"}%>' connector='or' negated="true">
						<tr>
							<td colspan="9" align="right" class="FormLabels">
								Commission Amount
							</td>
							<td colspan="12" align="right">
							
							</td>
							<td colspan="1" align="right" class="FormLabels">
								<dmshtml:CurrencyFormatTag format="<%=""+(totalEmpPremium*(dblCurrCommissionVal/100))%>"/>
							</td>
						</tr>
							</dmshtml:dms_static_with_connector>
				
					</table>

						<%
							med_drug_total_premium = empTotalMedicalPremium;
						}%>
				</td>
			</tr>
			</dmshtml:dms_HasFeature_Available_InProduct>
			
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>



			<dmshtml:dms_HasFeature_Available_InProduct productId='<%=Long.parseLong(""+ProductId)%>' featureName="Employee_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" state="<%=""+CustomerState%>" >	
			
			<tr>
				<td colspan="9" ALIGN="left">			

				<%
				if(qmap.containsKey("EmpRatesUWWoksheet"))
				{
					java.util.ArrayList arrList1=null;
						Object objList1=qmap.get("EmpRatesUWWoksheet");
						if((objList1!=null) &&(objList1 instanceof java.util.ArrayList))
					{
						arrList1=(java.util.ArrayList)objList1;
						int serCount = 0;
						double totalEmpRatesPremium=0.0;
						%>
					<table WIDTH="80%" ALIGN="left" cellspacing="4" cellpadding="4" border="0" >
						<tr>
							<td colspan="12">
								&nbsp;
							</td>
						</tr>
						<tr >
							<td class="sectionhead" width="5%">
								No
							</td>
							<td class="sectionhead" width="8%">
								Last Name
							</td>
							<td class="sectionhead" width="8%">
								First  Name
							</td>
							<td class="sectionhead" width="7%">
								Gender
							</td>
							<td class="sectionhead" width="5%">
								Age
							</td>
							<td class="sectionhead" >
								# child(ren)
							</td>
							<td class="sectionhead" width="5%">
								Deductible
							</td>
							<td class="sectionhead" width="10%">
								Health Plan Coverage Election
							</td>
							<td align="center" class="sectionhead" colspan="4" width="20%">
								Premium
							</td>
						</tr>

							<%for (int i=0; i<arrList1.size(); i++)  
							{ 
								com.dms.ejb.data.QuestionHashMap arrEmpRatesQMap=(com.dms.ejb.data.QuestionHashMap)arrList1.get(i);
								%>
						<tr>
							<td class="SearchResult" align="center"  width="2%" >
								<%=++serCount%>
							</td>
							<td class="SearchResult" align="left" >
								<%=arrEmpRatesQMap.getString("EMPRATES_LNAME")%>
							</td>
							<td class="SearchResult" align="left" >
								<%=arrEmpRatesQMap.getString("EMPRATES_FNAME")%>
							</td>
							<td class="SearchResult" align="left" >
								<%=arrEmpRatesQMap.getString("EMPRATES_GENDER")%>
							</td>
							<td class="SearchResult" align="right" >
								<%=arrEmpRatesQMap.getString("EMPRATES_AGE")%>
							</td>
							<td class="SearchResult" align="right" >
								<%=arrEmpRatesQMap.getString("EMPRATES_NUMCHILD")%>
							</td>
							<td class="SearchResult" align="right" >
								<%=arrEmpRatesQMap.getString("EMPRATES_DEDUCTIBLE")%>
							</td>
							<td class="SearchResult" align="left" >
								<%=arrEmpRatesQMap.getString("EMPRATES_EMPELECTION")%>
							</td>
							<td class="SearchResult" align="right" >
								<dmshtml:CurrencyFormatTag digits="2" format="<%=arrEmpRatesQMap.getString("EMPRATES_EMPTOTALPREMIUM")%>"/>
							</td>
						</tr>
							<%
								totalEmpRatesPremium += Double.parseDouble(arrEmpRatesQMap.getString("EMPRATES_EMPTOTALPREMIUM"));
							}
							%>

						<tr>
							<td colspan="8" class="FormLabels"  align="right" >
								Total
							</td>
							<td class="FormLabels"  align="right" >
								<dmshtml:CurrencyFormatTag digits="2" format="<%=""+totalEmpRatesPremium%>"/>
							</td>
						</tr>
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_QUOTE_COMMISSION"}%>' connector='or' negated="true">
						<tr>
							<td colspan="8" align="right" class="FormLabels">
								Commission Amount
							</td>
							<td colspan="1" align="right" class="FormLabels">
								<dmshtml:CurrencyFormatTag format="<%=""+(totalEmpRatesPremium*(dblCurrCommissionVal/100))%>"/>
							</td>
						</tr>
							</dmshtml:dms_static_with_connector>


						<tr>
							<td>
								&nbsp;
							</td>
						</tr>

					</table>
							
							
					<%
							med_drug_total_premium = totalEmpRatesPremium;
						}
					}
					%>
					
				</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
			</tr>

	

		</dmshtml:dms_HasFeature_Available_InProduct>
	</logic:equal>



	<logic:equal name="UWWorkSheet" property="answer(Object::Quote::CompositeRate)" value="Yes">
			<tr>
				<td>
		
					<TABLE align="left" width="90%">
					
						<tr><td>
							<!-- *** -->
						</td></tr>
						<%
						Object obj1 = request.getAttribute("UWWorkSheet");
						com.dms.web.data.DataForm AddEnt1 = (com.dms.web.data.DataForm)obj1;
						com.dms.ejb.data.QuestionHashMap qmap1 = (com.dms.ejb.data.QuestionHashMap)AddEnt1.getAnswerMap();
							
						if(qmap1.containsKey("qMapcmpcalc"))
						{
							com.dms.ejb.data.QuestionHashMap qMapCount=(com.dms.ejb.data.QuestionHashMap)qmap1.get("qMapcmpcalc"); 
						%>

			
						<TR >
							<TD class="sectionhead"  align="center"  vAlign=top width=80>
								 Employees
							</TD>
							<TD   class="sectionhead"  align="center" vAlign=top width=69>
					 			 <%=qMapCount.getString("MedicalEmpCount")%>
					 		</TD>
							<TD   class="sectionhead"  align="center" vAlign=top width=110 colSpan=2>
					  			<%=qMapCount.getString("Eonlycount")%>
					  		</TD>
							<TD class="sectionhead"  align="center" vAlign=top width=110 colSpan=2>
					  			<%=qMapCount.getString("ESonlycount")%>
					  		</TD>
							<TD class="sectionhead"  align="center" vAlign=top width=110 colSpan=2>
								  <%=qMapCount.getString("EConlycount")%>
							</TD>
							<TD class="sectionhead"  align="center" vAlign=top width=110 colSpan=2>
					 			 <%=qMapCount.getString("Fonlycount")%>
					 		</TD>
						</TR>
			
			
						<TR>
							<TD class="sectionhead"  align="center" vAlign=top width=80>
								Deductible
							</TD>
							<TD class="sectionhead"  align="center" vAlign=top width=69>
								Total 
							</TD>
							<TD class="sectionhead"  align="center"  vAlign=top width=110 colSpan=2>
							  Employee 
							  Only</TD>
							<TD class="sectionhead"  align="center"  vAlign=top width=110 colSpan=2>
							  Employee 
							  &amp; Spouse</TD>
							<TD class="sectionhead"  align="center"    vAlign=top width=110 colSpan=2>
							  Employee 
							  &amp; Child(ren)</TD>
							<TD class="sectionhead"  align="center"       vAlign=top width=110 colSpan=2>
							  Family</TD>
						</TR>
				
				
						<TR >
							<TD class="sectionhead"  align="center"     vAlign=top width=80>
							  </TD>
							<TD class="sectionhead"  align="center"       vAlign=top width=69>
							  Premium</TD>
							<TD class="sectionhead"  align="center"      vAlign=top width=42>
							  Rate</TD>
							<TD class="sectionhead"  align="center"        vAlign=top width=69>
							  Premium</TD>
							<TD class="sectionhead"  align="center"        vAlign=top width=42>
							  Rate</TD>
							<TD class="sectionhead"  align="center"     vAlign=top width=69>
							  Premium</TD>
							<TD class="sectionhead"  align="center"        vAlign=top width=42>
							  Rate</TD>
							<TD class="sectionhead"  align="center"     vAlign=top width=69>
							  Premium</TD>
							<TD class="sectionhead"  align="center"        vAlign=top width=42>
							  Rate</TD>
							<TD class="sectionhead"  align="center"        vAlign=top width=69>
							  Premium</TD>
						</TR>


						<%
						}
		
						if(qmap1.containsKey("arrCompList"))
						{
						
							java.util.ArrayList arrCompositeList=null;
							Object objList=qmap1.get("arrCompList");
							if((objList!=null) &&(objList instanceof java.util.ArrayList))
							{
								arrCompositeList=(java.util.ArrayList)objList;
								com.dms.ejb.data.QuestionHashMap aCompositeMap=null;			
								for(int i=0;i<arrCompositeList.size();i++)
								{
									aCompositeMap=(com.dms.ejb.data.QuestionHashMap)arrCompositeList.get(i);  
									
								%>

						<TR >
							<TD class="SearchResult"  align="right"         width=80>
							  <%=aCompositeMap.getString("deductable")%></TD>
							<TD class="SearchResult"  align="right"         width=69>
								<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("TOTAL_COMPOSITE_PRREMIUM")%>" />
							  </TD>
							<TD class="SearchResult"  align="right"         width=42>
								<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("EEONLY_COMPOSITE_RATE")%>" />
							  </TD>
							<TD class="SearchResult"  align="right"         width=69>
								<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("EEONLY_COMPOSITE_PRREMIUM")%>" />
							  </TD>
							<TD class="SearchResult"  align="right"         width=42>
								<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("ES_COMPOSITE_RATE")%>" />
							  </TD>
							<TD class="SearchResult"  align="right"         width=69>
								<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("ES_COMPOSITE_PRREMIUM")%>" />
							  </TD>
							<TD class="SearchResult"  align="right"         width=42>
								<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("EC_COMPOSITE_RATE")%>" />
							  </TD>
							<TD class="SearchResult"  align="right"        width=69>
								<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("EC_COMPOSITE_PRREMIUM")%>" />
							</TD>
							<TD class="SearchResult"  align="right"         width=42>
							<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("FAMILY_COMPOSITE_RATE")%>" />
							  </TD>
							<TD class="SearchResult"  align="right"         width=69>
								<dmshtml:CurrencyFormatTag digits="0" format="<%=aCompositeMap.getString("FAMILY_COMPOSITE_PRREMIUM")%>" />
							  </TD>
						</TR> 
						   
						<%
						}
					}
			}%>

					</TABLE>
				</td>
			</tr>

	</logic:equal>

<!--/logic:present-->




<logic:present name="SubQuoteDetail" scope="request">	
			<bean:define id="aSubQuoteDetail" name="SubQuoteDetail" type="com.dms.ejb.quote.DMSQuoteDetail" />
	<bean:define id="aSubQuoteDetailVerId" name="aSubQuoteDetail" property="verId" />
	
			<html:hidden name="UWWorkSheet" property="answer(previousQuoteVerId)" value="<%=aSubQuoteDetailVerId.toString()%>"/>
</logic:present>
<!--html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/-->
<tr><td>
<html:hidden property="answer(QuoteId)" value="<%=""+subQuoteId%>" />
<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
<html:hidden property="answer(Quote::Page)" value="isUnderWriterWorkSheet" />
<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden  property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<bean:define id="strParentQuoteType" name="parentQuoteDetail" property="quoteType" scope="request"/>
<html:hidden property="answer(parentQuoteType)" value="<%=strParentQuoteType.toString()%>" />
<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=request.getParameter("answer(subquoteVerId)")%>" />
<html:hidden property="answer(Object::Quote::QuoteNumber)" value="<%=subQuoteNum.toString()%>" />
<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=parentQuoteId.toString()%>" />
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=quoteStartDate.toString()%>" />
<html:hidden property="answer(parentQuoteVerId)" value="<%=strParetQuoteVerId.toString()%>" />
<html:hidden property="answer(customerNumber)" value="<%=customerNumber.toString()%>" />

<html:hidden property="answer(Object::PlanFactor::Deductible_CreditOverride_Factor)" value="<%=Deductible_CreditOverride_Factor.toString()%>" /> 


<html:hidden property="answer(subquoteVerId)" value="<%=subQuoteVerId.toString()%>" />
<html:hidden property="answer(subQuoteId)" value="<%=subQuoteId.toString()%>" />
<html:hidden property="answer(SubQuoteId)" value="<%=subQuoteId.toString()%>" />
<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=CompositeRate.toString()%>" />
<html:hidden property="answer(Object::Plan::DentalStatus)" value="<%=dentalStatus.toString()%>" />
<html:hidden property="answer(Object::Plan::2YearPriorCoverage)" value="<%=priorCoverage.toString()%>" />

<%long lngAgencyId=0; %>
<logic:present name="quoteInsuredDetail" scope="request">
	<bean:define id="customerDetailMap" name="quoteInsuredDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />								
			<%try{
					lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
				}catch(Exception nfe) {   }
			%>
</logic:present>
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=lngAgencyId+""%>" />
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
<html:hidden property="answer(productId)" value="<%=ProductId.toString()%>" />
<html:hidden property="answer(productVerId)" value="<%=productVerId.toString()%>" />
<html:hidden property="noOfEmployeesInPlan" name="UWWorkSheet" styleId="SIDnoOfEmployeesInPlan" value="<%=""+noOfEmployeesInPlan%>"/>
<html:hidden styleId="LockStatus" property="answer(Object::Quote::LockStatus)" value="<%=""+paretLockStatus%>" />
<html:hidden property="answer(modQuoteNumber)" value="<%=""+modQuoteNumber%>" />
<html:hidden property="answer(UnderWriterWorkSheet)" value="Yes" />
<html:hidden property="answer(Object::Quote::ProductId)" value="<%=ProductId.toString()%>" /> 
<html:hidden property= "answer(Object::Quote::ProductVerId)" value="<%=productVerId.toString()%>" />

<html:hidden property="answer(Object::Plan::TerrorismZone)" value="1" />
<html:hidden property="answer(Object::Plan::EachOccuranceLimit)" value="<%=eachOccuranceLimit.toString()%>" />
<html:hidden property="answer(Object::PlanFactor::PremisesLiabilityISOFactor)" value="<%=premisesISOFactor.toString()%>" />
<html:hidden property="answer(Object::PlanFactor::ProductCoLiabilityISOFactor)" value="<%=productCoISOFactor.toString()%>" />
<html:hidden property="answer(Object::PlanFactor::AutomobileLiabilityISOFactor)" value="<%=automobileISOFactor.toString()%>" />

<% if(request.getParameter("answer(prevSubQuoteVerId)")!=null){%>
<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+request.getParameter("answer(prevSubQuoteVerId)")%>'/>
<%} else {%>
<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" name="UWWorkSheet"/>
<%}%>
<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
<html:hidden property="answer(policyNumber)" value="<%=policyNumber.toString()%>" />
<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=parentPolicyVerId.toString()%>" />
<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
<html:hidden styleId="isUWCalculate" property="answer(Object::Plan::IsUWCalculate)" value=""/>
<html:hidden property="answer(isUpdated)" value="<%="Y"%>"/>
<html:hidden property="answer(pagename)" value="<%="Endorsement UW worksheet"%>"/>


</td></tr>
</table>
</td></tr>
</table>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 11px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>	
</html:form>


<script type="text/javascript">
	var a = document.getElementById('priorpolicyheadernav');
	if((a != null) && (a != undefined))
		a.id = 'policyheadernav';
</script>
