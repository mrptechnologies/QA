<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript">
<!--


	function SubmitToRecalculate(){
		var formElement=document.forms[0];
		var IntnoOfEmployeesInPlan=formElement.SIDnoOfEmployeesInPlan.value;
		
		if(! validateForm(formElement)){
			return false;
		}
		formElement.action="../CalculateUnderwriterWorkSheet.do";
		formElement.submit(); 
		return true;
	}


//-->
</script>
<script type="text/javascript" src="/Scripts/JScripts/UnderwriterWorksheet.js"></script>
<script type="text/javascript" src="/Scripts/JScripts/FactorCalculator.js"></script>		
<script type="text/javascript" src="/Scripts/JScripts/Application.js"></script>		
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>		
<html:form action="/SaveQuoteUnderwriterStatusAction.do" styleId="SaveQuoteUnderwriterStatusAction" onsubmit="return validateForm(this);">

<!--##########################VARIBLE DECLARATION #########################################-->
<bean:define id="parentQuoteId" name="UWWorkSheet" property="answer(parentQuoteId)" scope="request" />
<bean:define id="modQuoteNumber" name="UWWorkSheet" property="answer(modQuoteNumber)" scope="request" />
<bean:define id="ProductId" name="UWWorkSheet" property="answer(Object::Quote::ProductId)" scope="request" />
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

<bean:define id="QuoteType" name="UWWorkSheet" property="answer(Object::Quote::QuoteType)" />
<bean:define id="MedicalUWFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::MedicalUWFactor)" />
<bean:define id="CompositeRate" name="UWWorkSheet" property="answer(Object::Plan::CompositeRateFlag)" />
<bean:define id="uwTierFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::UWRatingTierFactor)" />
<bean:define id="mentalIllnessFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::MentalIllness)" />
<bean:define id="sppechPhyOccFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::SpeechPhyOcc)" />
<bean:define id="substanceAbuseFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::SubstanceAbuse)" />
<bean:define id="discretionaryAdjDefaultFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" />

<bean:define id="utilAdjMedicalFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::UtilAdjMedicalFactor)" />
<bean:define id="proFormaLoadFactorFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::ProFormaMedicalFactor)" />
<bean:define id="cobraFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::CobraFactor)" />
<bean:define id="targetLossRatioFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::TargetLossRatioMedical)" />
<bean:define id="targetLossRatioPharmacyFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::TargetLossRatioPharmacy)" />
<bean:define id="uwPharmacyFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::PharmacyUWFactorDefault)" />
<bean:define id="discretionaryPharmacyFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::PharmacyDiscretionaryAdjDefaultFactor)" />
<bean:define id="additionalCostsMedical" name="UWWorkSheet" property="answer(Object::PlanFactor::AdditionalCostsMedicalFactor)" />
<bean:define id="additionalCostsPharmacy" name="UWWorkSheet" property="answer(Object::PlanFactor::AdditionalCostsPharmacyFactor)" />
<!-- new -->
<bean:define id="CustomerState" name="UWWorkSheet" property="answer(Object::Quote::CustomerState)" />
<bean:define id="areaNetworkFatorsKey" name="UWWorkSheet" property="answer(Object::Quote::AreaNetWorkKey)" />
<bean:define id="PlanNameDisPly" name="UWWorkSheet" property="answer(Object::Plan::PlanNameDisPly)" />
<bean:define id="subQuoteId" name="UWWorkSheet" property="answer(Object::Quote::Id)" />
<bean:define id="subQuoteVerId" name="UWWorkSheet" property="answer(Object::Quote::QuoteVerId)" />
<bean:define id="isLifeSelected" name="UWWorkSheet" property="answer(Object::Plan::IsLife)" />

<bean:define id="MorbidObesityFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::MorbidObesityRiderFactor)"/>
<bean:define id="RequiredPmPmPharmacy" name="UWWorkSheet" property="answer(Object::Plan::RequiredPmPmPharmacy)"/>
<bean:define id="RequiredPmPmMedical" name="UWWorkSheet" property="answer(Object::Plan::RequiredPmPmMedical)"/>
<bean:define id="CombinedPmPmPharmacy" name="UWWorkSheet" property="answer(Object::Plan::CombinedPmPmPharmacy)"/>
<bean:define id="GroupSizeFactorPharmacy" name="UWWorkSheet" property="answer(Object::PlanFactor::GroupSizeFactorPharmacy)"/>
<bean:define id="dentalStatus" name="UWWorkSheet" property="answer(Object::Plan::DentalStatus)"/>
<bean:define id="priorCoverage" name="UWWorkSheet" property="answer(Object::Plan::2YearPriorCoverage)"/>
<bean:define id="noOfMedicalEmployees" name="UWWorkSheet" property="answer(Object::Quote::NoOfMedicalEmployees)"/> 
<bean:define id="DependentInsAmt" name="UWWorkSheet" property="answer(Object::Plan::DependentInsAmt)"/> 
<bean:define id="AdministrativeFee" name="UWWorkSheet" property="answer(Object::PlanFactor::AdministrativeFee)"/> 

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
<bean:define id="TotalPremium" name="UWWorkSheet" property="answer(Object::Quote::TotalPremium)" scope="request" />

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
<bean:define id="suppAccidentalCvg" name="UWWorkSheet" property="answer(Object::Quote::SupplementalAccidentCoverage)" />
<bean:define id="requiredFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::RequiredFactor)" />

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
<html:hidden property="commissionPercentfromDB" name="UWWorkSheet" styleId="oldCommissionPercentfromDB" value="<%=""+commissionPercentfromDB%>"/>
<html:hidden property="answer(Object::Quote::NoOfMedicalEmployees)" name="UWWorkSheet" styleId="noOfEmps"/>
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactorPrefer)" name="UWWorkSheet" styleId="medicalPrefferedRate"/>
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactorMax)" name="UWWorkSheet" styleId="medicalMaxRate"/>
<!-- QuoteType is allready present in QuoteHeader.jsp(Included in this page) -->
<html:hidden property="answer(Object::Quote::ProductId)" name="UWWorkSheet" styleId="ProductId"/>
<html:hidden property="answer(Object::PlanFactor::DrugUWFactorPrefer)" name="UWWorkSheet" styleId="drugPrefferedRate"/>
<html:hidden property="answer(Object::PlanFactor::DrugUWFactorMax)" name="UWWorkSheet" styleId="drugMaxRate"/>
<!--  -->
<!--#######################################################################################-->

<bean:define id="localTotalMedicalPremium" name="UWWorkSheet" property="answer(Object::Quote::TotalMedicalPremium)" scope="request" />
<bean:define id="localMedicalUWFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::MedicalUWFactor)" scope="request" />
<bean:define id="localTotalBasePremium" name="UWWorkSheet" property="answer(Object::Plan::TotalBasePremium)" scope="request" />

<bean:define id="DiscretionaryAdjDefaultFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" scope="request" />
<bean:define id="UWRatingTierFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::UWRatingTierFactor)" scope="request" />

<bean:define id="CompositeEmployeeFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::CompositeEmployeeFactor)" scope="request" />
<bean:define id="CompositeEmpSpouseFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::CompositeEmpSpouseFactor)" scope="request" />
<bean:define id="CompositeEmpChildFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::CompositeEmpChildFactor)" scope="request" />
<bean:define id="CompositeFamilyFactor" name="UWWorkSheet" property="answer(Object::PlanFactor::CompositeFamilyFactor)" scope="request" />       
  
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
		</td>
	</tr>


<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<tr>
				<td>
					<table width="60%" align="Left" border="0">
						<jsp:include page="../common/QuoteHeader.jsp" >
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="productVerId" value="<%=""+productVerId%>" />
							<jsp:param name="heading" value="<%="UNDERWRITER WORKSHEET"%>" />	
						</jsp:include>
					</table>
				</td>
			</tr>
			</table>
		</td>
	</tr>


	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">		
				<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
					<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
					<jsp:param name="customerId" value="<%=""+customerId%>" />	
					<jsp:param name="productId" value="<%=""+ProductId%>" />	
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="prdGroupId" value="<%=""+groupId%>" />	
					<jsp:param name="prdGroupVerId" value="<%=""+groupVerId%>" />
					<jsp:param name="productStatus" value="<%=""+productStatus%>" />
				</jsp:include>


			</table>
		</td>
	</tr>
		



	<dmshtml:dms_isPresent property="<%=new String[]{"locked"}%>" value="<%=paretLockStatus.toString()%>">

		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Submitted", "Sold", "Lost", "Rejected"}%>" value="<%=paretQuoteStatus.toString()%>">
			<tr><td>
			<table WIDTH="99%">
			<tr>
				<td class="TableColorStyle3" align=left>
					&nbsp;This Quote Is Locked  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp
					<a href="../ModifyQuoteConfirmAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(modQuoteId)=<%=""+parentQuoteId%>&answer(modQuoteNumber)=<%=""+modQuoteNumber%>&answer(Object::Plan::IsLife)=<%=""+isLifeSelected %>" title="Modify Quote"/> 
					<IMG SRC="../Images/modify.jpg" WIDTH="63" HEIGHT="16" BORDER="0" ALT=""></a>
				</td>
			</tr>
			</table>
			</td></tr>
		</dmshtml:dms_isPresent>
	</dmshtml:dms_isPresent>

	<tr>
		<td colspan="2">
			<table width="764px" align="Left" border="0" >
				<tr>
					<td width="20%" align="Left" class="links">
						<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
					</td>
						<logic:present name="parentQuoteDetail" scope="request">
							<bean:define id="paretQuoteVerId" name="parentQuoteDetail" property="quoteVerId"/>
							<%strParetQuoteVerId=paretQuoteVerId.toString();%>
								


							<html:hidden name="UWWorkSheet" property="answer(parentQuoteVerId)" value="<%=""+paretQuoteVerId%>"/>
						</logic:present>



					<logic:present name="parentQuoteDetail" scope="request">
					<dmshtml:dms_isPresent property="<%=new String[]{"Sold","Offered","Accepted"}%>" value="<%=paretQuoteStatus.toString()%>" negated= "true">
					<td width="60%" class="links" align="left">
											
						<a href="../InFilePDF.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=PROPOSAL&answer(QuoteId)=<%= ""+parentQuoteId%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">
							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Create Quote Proposal</a>
					
					</td>
					</dmshtml:dms_isPresent >
					</logic:present>
					
					<td width="20%" class="links" align="left">
						<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(ProductId.toString())%>" featureName="Member_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>" >			
							<a href="../GetRateCalc.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentQuoteId)=<%=request.getParameter("answer(parentQuoteId)")%>&parentQuoteId=<%=request.getParameter("answer(parentQuoteId)")%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=""+ProductId%>&rateType=member_rates" >&nbsp;Member</a> 
						</dmshtml:dms_HasFeature_Available_InProduct>

						<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(ProductId.toString())%>" featureName="Employee_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>" >	
							<a href="../GetRateCalc.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(parentQuoteId)=<%=request.getParameter("answer(parentQuoteId)")%>&parentQuoteId=<%=request.getParameter("answer(parentQuoteId)")%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=""+ProductId%>&rateType=employee_rates" >Employee</a>
						</dmshtml:dms_HasFeature_Available_InProduct>
					</td>
					<td width="20%" >
						&nbsp;
					</td>
					<td width="20%" >
						&nbsp;
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td width="764px">
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
	<tr><td>&nbsp;</td></tr>

	<tr>
		<td colspan="5">
			<%
				String width = "54";
				int widthSize = 464;
				boolean showLife = false;
				boolean showWdi = false;
				boolean showDental = false;
			%>
			<dmshtml:dms_IsOption_Available_InProduct prdGroupVerId="<%=""+groupVerId%>" optionName="Object::Plan::LifeCovAmount" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>" >
				<% showLife=true; widthSize=(widthSize+100); %>
			</dmshtml:dms_IsOption_Available_InProduct>

			<dmshtml:dms_IsOption_Available_InProduct prdGroupVerId="<%=""+groupVerId%>" optionName="Object::Plan::WdiCovAmount" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>" >
				<% showWdi=true; widthSize=(widthSize+100); %>
			</dmshtml:dms_IsOption_Available_InProduct>

			<dmshtml:dms_IsOption_Available_InProduct prdGroupVerId="<%=""+groupVerId%>" optionName="Object::Plan::DentalStatus" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>" >
				<% showDental=true; widthSize=(widthSize+100); %>				
			</dmshtml:dms_IsOption_Available_InProduct>
			
			<table border="0" cellspacing="0" cellpadding="0" WIDTH="100%">

<!-- ADDING DYNAMIC HTML -->
			<logic:present name="WORK_SHEET_HTML" scope="request">
				<bean:define id="htmlPage" name="WORK_SHEET_HTML"
					type="java.lang.StringBuffer" />
				<tr>
					<td width="60%">
						<table border="0" cellspacing="7" cellpadding="50%">
							<tr><td>
							<!-- *** -->
							</td></tr>
							<%out.println(htmlPage.toString());%>
							
						</table>
					</td>
				</tr>
			</logic:present>
			
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<table border="0" cellspacing="0" cellpadding="0" WIDTH='<%=widthSize+"px%"%>'>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_QUOTE_COMMISSION"}%>' connector='or' negated="true">
						<% boolean disableCommissionRateImpacted=true; %>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_QUOTE_RATEIMPCOMMISSION"}%>' connector='or' negated="true">
							<% disableCommissionRateImpacted=false; %>
						</dmshtml:dms_static_with_connector>
						<tr>
							<td class="SearchResult">
								Commission Adjustment affects Rate?
							</td>
							<td class="SearchResult" align="left">
								<%if(paretLockStatus!=null && paretLockStatus.equals("Locked")){%>
									<html:radio name="UWWorkSheet"  property="answer(Object::QuoteCommission::RateImpacted)" value="Y" styleId="RateImpactedyes" disabled="<%=disableCommissionRateImpacted%>"disabled="true"  >Yes&nbsp;&nbsp;
									</html:radio>
									<html:radio name="UWWorkSheet"  property="answer(Object::QuoteCommission::RateImpacted)" value="N" styleId="RateImpactedno"  disabled="<%=disableCommissionRateImpacted%>" disabled="true" >No
									</html:radio>
								<%}else{%>
									<html:radio name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)" value="Y" styleId="RateImpactedyes" disabled="<%=disableCommissionRateImpacted%>" >Yes&nbsp;&nbsp;
									</html:radio>
									<html:radio name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)" value="N" styleId="RateImpactedno"  disabled="<%=disableCommissionRateImpacted%>" >No
									</html:radio>
								<%}%>

							</td>
						</tr>
							<%if(disableCommissionRateImpacted){%>
								<html:hidden name="UWWorkSheet" property="answer(Object::QuoteCommission::RateImpacted)"  />
							<%}%>
							
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
							<td class="SearchResult" align="left" width="40%">
								Commission Adjustment %
							</td>
							<td class="SearchResult" align="left" >
								<% int commissionVal = 0;						
									try{
										dblCurrCommissionVal = (new Double(currCommissionPercentage)).doubleValue();
										commissionVal = (new Double(oldCommissionPercentage)).intValue(); 							
										System.out.println("commissionVal-->"+commissionVal);
									}catch(Exception ex){}
								%>
								
															
								<%if(paretLockStatus!=null && paretLockStatus.equals("Locked")){%>
									<html:select disabled="true" property="answer(Object::QuoteCommission::CommissionAdjustmentSign)"  name="UWWorkSheet"  styleId="CommissionAdjustmentSign" onchange="diplayCMP(this);" >
										<html:option value ="+">+</html:option>
										<html:option value ="-">-</html:option>
									</html:select>								
								
									<input type="text" name="answer(Object::QuoteCommission::CommissionAdjustmentValue)" value="<%=""+commissionAdjustValue%>" maxlength="5" class="txtbox" size="5" readonly="true" id="CommissionAdjustmentValue" onchange="diplayCMP(this);"/> 
								<%}
								else{%>
									<html:select property="answer(Object::QuoteCommission::CommissionAdjustmentSign)"  name="UWWorkSheet"  styleId="CommissionAdjustmentSign" onchange="diplayCMP(this);" >
										<html:option value ="+">+</html:option>
										<html:option value ="-">-</html:option>
									</html:select>

									<input type="text" name="answer(Object::QuoteCommission::CommissionAdjustmentValue)" value="<%=""+commissionAdjustValue%>" maxlength="5" class="txtbox" size="5"  id="CommissionAdjustmentValue" onchange="diplayCMP(this);"/> 
								<%}%>
							
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
										subQuoteTotal = (new Double(""+TotalPremium)).doubleValue();
									}catch(Exception ex){}
									try{
										allriskCommissionPercent = (new Double(""+parentOwnerCommissionPercent)).doubleValue();
									}catch(Exception ex){}
								%>
						<tr>							   
							<td class="SearchResult" align="left" width="40%">
								Agent Commission 
							</td>
							<td class="SearchResult" align="left" >
								<dmshtml:CurrencyFormatTag format='<%=""+(subQuoteTotal * dblCurrCommissionVal / 100)%>'/>								
							</td>
						</tr>
						<tr>							   
							<td class="SearchResult" align="left" width="40%">
								Total Premium
							</td>
							<td class="SearchResult" align="left" >
							<dmshtml:CurrencyFormatTag format='<%=""+TotalPremium%>'/>									
							</td>
						</tr>
						<%-- <tr>							   
							<td class="SearchResult" align="left" width="40%">
								AllRisk Commission %
							</td>
							<td class="SearchResult" align="left" >
								<%=""+parentOwnerCommissionPercent%>
							</td>
						</tr>--%>
						
						<%-- <tr>							   
							<td class="SearchResult" align="left" width="40%">
								AllRisk Commission 
							</td>
							<td class="SearchResult" align="left" >
								<dmshtml:CurrencyFormatTag format='<%=""+(subQuoteTotal * allriskCommissionPercent / 100)%>'/>	
							</td>
						</tr>--%>
			
						</dmshtml:dms_static_with_connector>

						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td class="SearchResult" align="left" width="20%">
								Quote Status
							</td>
							<td class="SearchResult" align="left">	
													
								<logic:present name="parentQuoteDetail" scope="request">
									<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Submitted", "Offered", "Bound", "Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>" >
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"  name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>"  styleId="Object$Quote$QuoteStatus" onchange="return setLockStatus(this);">											<dmshtml:dms_option value ='<%=paretQuoteStatus.toString()%>'><%=paretQuoteStatus.toString()%></dmshtml:dms_option>
											<!-- <dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option> -->
											<dmshtml:dms_option value ='Offered'>Offered</dmshtml:dms_option>
											<dmshtml:dms_option value ='Submitted'>Submitted</dmshtml:dms_option>	
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>


									<dmshtml:dms_isPresent property="<%=new String[]{"Issued", "Submitted", "Offered", "Bound", "Bind Request"}%>" value="<%=paretQuoteStatus.toString()%>"  negated= "true">
										<dmshtml:dms_select property="answer(Object::Quote::QuoteStatus)"   name="UWWorkSheet" value="<%=paretQuoteStatus.toString()%>" styleId="Object$Quote$QuoteStatus" onchange="return setLockStatus(this);">	
											<!-- <dmshtml:dms_option value ='Bind Request'>Bind Request</dmshtml:dms_option> -->				
											<dmshtml:dms_option value ='Offered'>Offered</dmshtml:dms_option>
											<dmshtml:dms_option value ='Submitted'>Submitted</dmshtml:dms_option>	
										</dmshtml:dms_select>		
									</dmshtml:dms_isPresent>	
									<input type="hidden" name="quoteStatusInitValue" value="<%=paretQuoteStatus.toString()%>" id="quoteStatusInitValue"/>
								</logic:present>				
							</td>
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
							<dmshtml:dms_isPresent 	property="<%=new String[]{"Sold", "Lost", "Rejected", "Bound", "Issued"}%>" value="<%=paretQuoteStatus.toString()%>">
							<tr>
							<td  align="left" width="20%">
								<html:button value="Calculate" property="answer(button)" styleClass="sbttn" onclick="return SubmitToRecalculate()"/>
							</td> 


							<td align="left">
								<html:submit value="Save"  styleClass="sbttn"  styleId="UnderwriterSaveSubmit" />
							</td> 
							</tr>
							</dmshtml:dms_isPresent>


<!-- Added valdation 20070309 Start-->
	

						<!-- To show the Calculate and Save buttons is the quote status is Sold, Lost,Rejected (+ Bound, Issued) for particular privelege -->
						<dmshtml:dms_isPresent 	property="<%=new String[]{"Sold", "Lost", "Rejected", "Bound", "Issued"}%>" value="<%=paretQuoteStatus.toString()%>" negated= "true">
						<tr>		
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_UW_IN_LOST_SOLD_REJ_STA"}%>' connector='or'negated="true">

							<td  align="left" width="20%">
								<html:button value="Calculate" property="answer(button)" styleClass="sbttn" onclick="return SubmitToRecalculate()"/>
							</td> 


							<td align="left">
								<html:submit value="Save"  styleClass="sbttn"  styleId="UnderwriterSaveSubmit"  />
							</td> 


							</dmshtml:dms_static_with_connector>

						    </tr>
						</dmshtml:dms_isPresent>


<!-- Added valdation 20070309 End-->
		
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
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
<html:hidden property="answer(parentQuoteType)" value="<%=strParentQuoteType.toString()%>" styleId="QuoteType"/>
<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=request.getParameter("answer(subquoteVerId)")%>" />
<html:hidden property="answer(Object::Quote::QuoteNumber)" value="<%=subQuoteNum.toString()%>" />
<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=parentQuoteId.toString()%>" />
<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=quoteStartDate.toString()%>" />
<html:hidden property="answer(parentQuoteVerId)" value="<%=strParetQuoteVerId.toString()%>" />
<html:hidden property="answer(customerNumber)" value="<%=customerNumber.toString()%>" />

<html:hidden property="answer(subquoteVerId)" value="<%=subQuoteVerId.toString()%>" />
<html:hidden property="answer(subQuoteId)" value="<%=subQuoteId.toString()%>" />
<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value="<%=CompositeRate.toString()%>" />
<html:hidden property="answer(Object::Plan::DentalStatus)" value="<%=dentalStatus.toString()%>" />
<html:hidden property="answer(Object::Plan::2YearPriorCoverage)" value="<%=priorCoverage.toString()%>" />
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId.toString()%>" />

<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId%>" />
<html:hidden property="answer(productId)" value="<%=ProductId.toString()%>" />
<html:hidden property="answer(productVerId)" value="<%=productVerId.toString()%>" />
<html:hidden property="noOfEmployeesInPlan" name="UWWorkSheet" styleId="SIDnoOfEmployeesInPlan" value="<%=""+noOfEmployeesInPlan%>"/>
<html:hidden styleId="LockStatus" property="answer(Object::Quote::LockStatus)" value="<%=""+paretLockStatus%>" />
<html:hidden property="answer(modQuoteNumber)" value="<%=""+modQuoteNumber%>" />
<html:hidden property="answer(UnderWriterWorkSheet)" value="Yes" />

<html:hidden property="answer(Object::PlanFactor::UtilAdjMedicalFactor)" value="<%=""+utilAdjMedicalFactor%>" />
<html:hidden property="answer(Object::PlanFactor::ProFormaMedicalFactor)" value="<%=""+proFormaLoadFactorFactor%>" />
<html:hidden property="answer(Object::PlanFactor::CobraFactor)" value="<%=""+cobraFactor%>" />
<html:hidden property="answer(Object::PlanFactor::TargetLossRatioMedical)" value="<%=""+targetLossRatioFactor%>" />
<html:hidden property="answer(Object::PlanFactor::TargetLossRatioPharmacy)" value="<%=""+targetLossRatioPharmacyFactor%>" />
<html:hidden property="answer(Object::PlanFactor::PharmacyUWFactorDefault)" value="<%=""+uwPharmacyFactor%>" />
<html:hidden property="answer(Object::PlanFactor::PharmacyDiscretionaryAdjDefaultFactor)" value="<%=""+discretionaryPharmacyFactor%>" />
<html:hidden property="answer(Object::PlanFactor::AdditionalCostsMedicalFactor)" value="<%=""+additionalCostsMedical%>" />
<html:hidden property="answer(Object::PlanFactor::AdditionalCostsPharmacyFactor)" value="<%=""+additionalCostsPharmacy%>" />

<html:hidden property="answer(Object::PlanFactor::AdministrativeFee)"  />		
<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value="<%=""+CompositeRate%>" />
	<html:hidden property="answer(Object::PlanFactor::UWRatingTierFactor)" value="<%=""+uwTierFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::MentalIllness)" value="<%=""+mentalIllnessFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SpeechPhyOcc)" value="<%=""+sppechPhyOccFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SubstanceAbuse)" value="<%=""+substanceAbuseFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" value="<%=""+discretionaryAdjDefaultFactor%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus%>" />
		<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
		<html:hidden property="isCalculateAction" value="No" />
		<html:hidden property="answer(Object::Plan::IsUWCalculate)" value="true" />
		<html:hidden property="answer(Object::PlanFactor::RequiredFactor)" value="<%=""+requiredFactor%>" />
		<html:hidden property="answer(Object::Plan::DependentInsAmt)" value="<%=""+DependentInsAmt%>" />		
		<html:hidden property="answer(Object::Plan::IsLife)" value="<%=""+isLifeSelected%>" />				
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</td></tr>
</table>
</td></tr>
<%String isCompositeRatedValue= ""+CompositeRate; %>
			<% if(request.getParameter("isCalculateAction").toString().equals("Yes")){%>
			<dmshtml:GetRateDetail quoteId='<%=Long.parseLong(""+subQuoteId) %>' ownerId='<%=Long.parseLong(""+ownerId) %>' nameInSession="rateDetailMap" dBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
				<tr><td>				
 					<logic:present name="rateDetailMap" scope="request">
 					<%
						if(isCompositeRatedValue.equalsIgnoreCase("N")){
						%>
	 					<table width="99%" border="0" >	
		 					<tr height="30">
		 						<td class="sectionhead" width="3%" align="center">			 						
		 							No.
		 						</td>
		 						<td class="sectionhead" width="12%" align="center">
		 							Last Name
		 						</td>
		 						<td class="sectionhead" width="18%" align="center">
		 							First Name
		 						</td>
		 						<td class="sectionhead" width="10%" align="center">
		 							Gender
		 						</td>
		 						<td class="sectionhead" width="10%" align="center">
		 							Age 
		 						</td>
		 						<td class="sectionhead" width="15%" align="center">
		 							# Of Children
		 						</td>
		 						<td class="sectionhead" width="15%" align="center">
		 							Deductible
		 						</td>
		 						<td class="sectionhead" width="15%" align="center">
		 							Health Plan
		 						</td>
		 						<td class="sectionhead" width="14%" align="center">
		 							Premium
		 						</td>			 						
		 					</tr>
							<%int indx=1; %>
							<logic:iterate id="employeeInfo" name="rateDetailMap">
								<tr height="20">
									<td class="TextMatter1">
										<%=indx++ %>
									</td>									
									<td class="TextMatter1">
										<bean:write name="employeeInfo" property="lName" />
									</td>
									<td class="TextMatter1">
										<bean:write name="employeeInfo" property="fName" />
									</td>
									<td class="TextMatter1">
										<bean:write name="employeeInfo" property="gender" />
									</td>
									<td class="TextMatter1" align="right">
										<bean:write name="employeeInfo" property="age" />
									</td>
									<td class="TextMatter1" align="right">
										<bean:write name="employeeInfo" property="noOfChildren" />
									</td>
									<td class="TextMatter1" align="right">
										<bean:write name="employeeInfo" property="deductible" />
									</td>
									<td class="TextMatter1">
										<bean:write name="employeeInfo" property="healthPlan" />
									</td>
									<td class="TextMatter1" align="right">
										<bean:define id="employeePremium" name="employeeInfo" property="premium" />
										<dmshtml:CurrencyFormatTag format="<%=""+employeePremium%>"/>
									</td>					
								</tr>								
							</logic:iterate>
							<tr>
								<td  colspan="7">
								</td>
								<td class="FormLabels">
									Total Premium
								</td>
								<td class="TextMatter1">
									
									<dmshtml:CurrencyFormatTag format="<%=""+TotalPremium%>"/>
								</td>
							</tr>	
						</table>
						<%} %>
						<%if(isCompositeRatedValue.equalsIgnoreCase("Y")){%>
						<logic:iterate id="employeeCompositeRateInfo" name="rateDetailMap">						
					    	<table width="99%" border="0">
								<tr width="100%">
									<td class="sectionhead" align="center" width="15%">
										Employees
									</td>
									<td class="sectionhead" align="center" width="20%">
										<bean:write name="employeeCompositeRateInfo" property="EEEnroll" />
									</td>
									<td class="sectionhead" align="center" width="20%">
										<bean:write name="employeeCompositeRateInfo" property="ESEnroll" />
									</td>
									<td class="sectionhead" align="center" width="20%">
										<bean:write name="employeeCompositeRateInfo" property="ECEnroll" />
									</td>
									<td class="sectionhead" align="center" width="20%">
										<bean:write name="employeeCompositeRateInfo" property="FamilyEnroll" />
									</td>
									<td class="sectionhead" align="center" width="15%">
										<bean:write name="employeeCompositeRateInfo" property="TotalEnroll" />
									</td>	
								</tr>
								<tr width="100%">
									<td class="sectionhead" align="center" width="15%">
										Deductible
									</td>
									<td class="sectionhead" align="center" width="20%">
										EEOnly 
									</td>
									<td class="sectionhead" align="center" width="20%">
										EmployeeAndSpouse  
									</td>
									<td class="sectionhead" align="center" width="20%">
										EmployeeAndChildren  
									</td>
									<td class="sectionhead" align="center" width="20%">
										Family 
									</td>
									<td class="sectionhead" align="center" width="15%">
										Total 
									</td>
									
								</tr>
								</table>
								<table width="99%" border="0">
								<tr width="100%">
									<td class="sectionhead" align="center" width="15%">
										
									</td>
									<td class="sectionhead" align="center" width="10%">
										Rate
									</td>
									<td class="sectionhead" align="center" width="10%">
										Premium
									</td>
									<td class="sectionhead" align="center" width="10%">
										Rate
									</td>
									<td class="sectionhead" align="center" width="10%">
										Premium
									</td>
									<td class="sectionhead" align="center" width="10%">
										Rate
									</td>
									<td class="sectionhead" align="center" width="10%"> 
										Premium
									</td>
									<td class="sectionhead" align="center" width="10%">
										Rate
									</td>
									<td class="sectionhead" align="center" width="10%">
										Premium
									</td>
									<td class="sectionhead" align="center" width="25%">
										 Premium
									</td>
								</tr>
								<tr width="100%">
									<td class="TextMatter"  align="right" width="15%">
										<bean:write name="employeeCompositeRateInfo" property="Deductible" />
									</td>
									<td class="TextMatter" align="right" width="10%">
										<bean:define id="EECompositeRate" name="employeeCompositeRateInfo" property="EERate" />
										<dmshtml:CurrencyFormatTag format="<%=""+EECompositeRate%>"/>
									</td>
									<td class="TextMatter" align="right" width="10%">									
										<bean:define id="EECompositePremium" name="employeeCompositeRateInfo" property="EEPremium" />
										<dmshtml:CurrencyFormatTag format="<%=""+EECompositePremium%>"/>
									</td>
									<td class="TextMatter" align="right" width="10%">
										<bean:define id="ESCompositeRate" name="employeeCompositeRateInfo" property="ESRate" />
										<dmshtml:CurrencyFormatTag format="<%=""+ESCompositeRate%>"/>
									</td>
									<td class="TextMatter" align="right" width="10%">
										<bean:define id="ESCompositePremium" name="employeeCompositeRateInfo" property="ESPremium" />
										<dmshtml:CurrencyFormatTag format="<%=""+ESCompositePremium %>"/>
									</td>
									<td class="TextMatter" align="right" width="10%">
										<bean:define id="ECCompositeRate" name="employeeCompositeRateInfo" property="ECRate" />
										<dmshtml:CurrencyFormatTag format="<%=""+ECCompositeRate%>"/>
									</td>
									<td class="TextMatter" align="right" width="10%">
										<bean:define id="ECCompositePremium" name="employeeCompositeRateInfo" property="ECPremium" />									
										<dmshtml:CurrencyFormatTag format="<%=""+ECCompositePremium%>"/>
									</td>
									<td class="TextMatter" align="right" width="10%">
										<bean:define id="FamilyCompositeRate" name="employeeCompositeRateInfo" property="FamilyRate" />
										<dmshtml:CurrencyFormatTag format="<%=""+FamilyCompositeRate%>"/>
									</td>
									<td class="TextMatter" align="right" width="10%">
										<bean:define id="FamilyCompositePremium" name="employeeCompositeRateInfo" property="FamilyPremium" />										
										<dmshtml:CurrencyFormatTag format="<%=""+FamilyCompositePremium%>"/>
									</td>
									<td class="TextMatter" align="right" width="25%">
										<bean:define id="totalCompositePremium" name="employeeCompositeRateInfo" property="TotalPremium" />
										<dmshtml:CurrencyFormatTag format="<%=""+totalCompositePremium%>"/>
									</td>							
								</tr>													
							</table>
						</logic:iterate>									
						<%} %>		
					</logic:present>
											
			<%} %>								
		</td></tr>
</table>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 11px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>	
</html:form>
