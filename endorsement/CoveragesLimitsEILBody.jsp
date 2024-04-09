<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.insurance.quote.common.plan.PlanDetail" %>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>


<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="subQuoteId" name="EndorsementDetail" property="answer(subQuoteId)" scope="request"/>
<bean:define id="parentQuoteVerId" name="EndorsementDetail" property="answer(Object::Quote::QuoteVerId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="CustomerState" name="EndorsementDetail" property="answer(State)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(policyNumber)" />
<bean:define id="isGASurchargeApplicable" name="EndorsementDetail" property="answer(Object::Plan::IsGASurchargeApplicable)" />

<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />

	<%
	
	ArrayList historyFeeDetailsList=new ArrayList();
	ArrayList feeDetailsList=new ArrayList();
	ArrayList historySurchargeDetailsList=new ArrayList();
	ArrayList surchargeDetailsList=new ArrayList();

	ArrayList historyTaxDetailsList=new ArrayList();
	ArrayList taxDetailsList=new ArrayList();
	
 	historyFeeDetailsList=(ArrayList)request.getAttribute("QUOTE_POLICY_FEE_HISTORY");
 	feeDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_FEE");
 	historySurchargeDetailsList=(ArrayList)request.getAttribute("QUOTE_POLICY_SURCHARGE_HISTORY");
 	surchargeDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_SURCHARGE");

 	historyTaxDetailsList=(ArrayList)request.getAttribute("QUOTE_POLICY_TAX_HISTORY");
 	taxDetailsList=(ArrayList)request.getAttribute("QUOTE_PLAN_TAX");%>
 	
<table width="98%">
	
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
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
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan=2>
			<table width="100%" align="left" border="0" >
				<tr>
					<td class="NewSectionHead" align="center">ENDORSEMENT DETAIL</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr height="5">
		<td></td>
	</tr>

	<tr>
		<td colspan="2">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				</td>
			</tr>		
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<%-- <tr>
				<td>
				<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="productVerId" value="<%=""+productVerId%>" />
						<jsp:param name="heading" value="<%="ENDORSEMENT DETAIL"%>" />
					</jsp:include>
				</table>
				</td>
			</tr>--%>
		<tr>
			<td align="left">
				<jsp:include page="../common/EndorsementQuoteHeader.jsp">
					<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
				</jsp:include>
			</td>
		</tr>
			
		</table>
		</td>
	</tr>
	<tr>
		<td class="links">
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=policyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>">Quote Summary</a>			
		</td>
		<%--<td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td>--%>
	</tr>

	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div id="dolphincontainer">
		<div id="dolphinnav">
			<ul>
				<li>
					<a class="" rel="Coverage Changes">
					<span>Coverage Changes</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Coverage Changes" class="innercontent">&nbsp;&nbsp;
			<html:form action="/SaveEndorsementDetailAction.go" >
			<logic:present name="QUOTE_POLICY_HISTORY" scope="request">
			<bean:define id="quotePolicyHistoryDetail" name="QUOTE_POLICY_HISTORY" type="com.dms.ejb.insurance.quote.common.quotepolicyhistory.QuotePolicyHistoryDetail" scope="request"/>
				<!-- Table for Covarage Details -->
				<table class="FormLabelsApplication" align="center" cellpadding="2" cellspacing="1" width="95%" class="boxed" style="{border-width:1px; border-style:solid;  border-color: #999999; border-collapse:saparate;}">
				<tr>
					<td class="sectionhead" width="30%">Coverages</td>
					<td class="sectionhead" align="right" width="15%">New Limit</td>
					<td class="sectionhead" align="right" width="15%">New Premium</td>
					<td class="sectionhead" align="right" width="15%">Prior Limit</td>
					<td class="sectionhead" align="right" width="15%">Prior Premium</td>
				</tr>
<dmshtml:GetEndorsementCoverageLimitDetail nameInSession="EndorseCALDetail" quoteId='<%=""+subQuoteId%>' quoteVerId='<%=""+parentQuoteVerId%>' productId='<%=""+productId%>' productVerId='<%=""+productVerId%>' queryString="COVERAGE_LIMIT_DETAIL_LIST" ownerId='<%=""+ownerId%>' dBName="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
				<logic:present name="EndorseCALDetail" scope="request">
				<tr>
					<td width="30%"></td>
					<td align="right" width="15%">&nbsp;</td>					
					<td align="right" width="15%">&nbsp;</td>
					<td align="right" width="15%">&nbsp;</td>
					<td align="right" width="15%">&nbsp;</td>
				</tr>
			 	<bean:define id="htmlPage" name="EndorseCALDetail"	type="java.lang.StringBuffer" />
			 	<%out.println(htmlPage.toString());%>
			 	</logic:present>
				<%-- <tr>
					<td class="SectionHead1" colspan="5">PROPERTY</td>
				</tr>
				<tr>
					<td class="FormLabels">Dwelling - Coverage A</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::Dwellingcoverage)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::CoverageAPremium)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="dwellingcoverage"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="coverageAPremium"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Loss Settlement - Dwelling</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::PolicyformOption)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="policyformOption"/></td>
					<td class="Numeric">&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels">Other Structures - Coverage B</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::OtherStructureCovadjAmt)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::OtherStructureAdditionalAmt)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="otherStructureCovadjAmt"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="otherStructureAdditionalAmt"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Contents - Coverage C</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::PersonalPropCovadjamt)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::PersonalPropAdditionalAmt)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="personalPropCovadjamt"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="otherStructureAdditionalAmt"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Loss Settlement - Contents</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::RConContents)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="RConContents"/></td>
					<td class="Numeric">&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels">Loss of Use - Coverage D</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::LossOfUseCovadjAmt)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::LossOfUseAdditionalAmt)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="lossOfUseCovadjAmt"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="lossOfUseAdditionalAmt"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Coverage A + B + C + D</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::CoverageABCD)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::CoverageABCDPremium)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="coverageABCD"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="coverageABCDPremium"/></td>
				</tr>
				
				<tr>
					<td class="SectionHead1" colspan="5" height="35px" valign="bottom">DEDUCTIBLES</td>
				</tr>
				<tr>
					<td class="FormLabels">Exclude Wind and Hail Coverage</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::RemoveWindhailCoverage)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::WindhailCoveragecreditAmt)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="removeWindhailCoverage"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="windhailCoveragecreditAmt"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Wind and Hail</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::WindhailDeductibleAmt)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="windhailDeductibleAmt"/></td>
					<td class="Numeric">&nbsp;</td>
				</tr>				
				<tr>
					<td class="FormLabels">All Other Perils</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::Deductible)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="deductible"/></td>
					<td class="Numeric">&nbsp;</td>
				</tr>

				<tr>
					<td class="SectionHead1" colspan="5" height="35px" valign="bottom">OPTIONAL COVERAGES</td>
				</tr>
				<tr>
					<td class="FormLabels">Dwelling - Extended Replacement Cost</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::ExtendedReplacementCost)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::ExtendedReplacementCostAmount)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="extendedReplacementCost"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="extendedReplacementCostAmount"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Water BackUp</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::WaterbackupDeductible)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::Waterbackup_Amt)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="waterbackupDeductible"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="waterbackup_Amt"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Identity Fraud - $25 additional premium</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::IdentityTheft)"/></td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::IdentityTheftAmount)"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="identityTheft"/></td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="identityTheftAmount"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Credits / Surcharges</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::CreditsSurchargesTotal)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="creditsSurchargesTotal"/></td>
				</tr>
				<tr>
					<td class="FormLabels">PROPERTY TOTAL PREMIUM</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::PropertyTotal)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="propertyTotal"/></td>
				</tr>

				<tr>
					<td class="SectionHead1" colspan="5" height="35px" valign="bottom">LIABILITY</td>
				</tr>
				<tr>
					<td class="FormLabels">Personal Liability</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::Liability)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="liability"/></td>
					<td class="Numeric">&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels">Medical Payments to Others (Each Person)</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::MedicalPaymentDeductible)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="medicalPaymentDeductible"/></td>
					<td class="Numeric">&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels">LIABILITY TOTAL PREMIUM</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::Liability_total_amt)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="liability_total_amt"/></td>
				</tr>

				<tr>
					<td class="SectionHead1" colspan="5" height="35px" valign="bottom">BASE PREMIUM</td>
				</tr>
				<tr>
					<td class="FormLabels">TOTAL BASE PREMIUM</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::TotalBasePremium)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="totalBasePremium"/></td>
				</tr>

				<tr>
					<td class="SectionHead1" colspan="5" height="35px" valign="bottom">TAXES & FEES</td>
				</tr>
				<tr>
					<td class="FormLabels">Policy Fee</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::DefaultPolicyFee)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="defaultPolicyFee"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Inspection Fee</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::InspectionFee)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="inspectionFee"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Stamp Fee</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::StampFee)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="stampFee"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Filing Fee</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::FilingFee)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="filingFee"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Surplus Lines Tax</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Plan::SurplusLinesTax)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="surplusLinesTax"/></td>
				</tr>

				<tr>
					<td class="FormLabels" height="40px">TOTAL</td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="EndorsementDetail" property="answer(Object::Quote::TotalPremium)"/></td>
					<td class="Numeric">&nbsp;</td>
					<td class="Numeric"><bean:write name="quotePolicyHistoryDetail" property="totalPremium"/></td>
				</tr>--%>
				</table>
				&nbsp;&nbsp;
				<!-- Table for Premium Details -->
			    <table class="FormLabelsApplication" align="center" cellpadding="2" cellspacing="1" width="95%" class="boxed" style="{border-width:1px; border-style:solid;  border-color: #999999; border-collapse:saparate;}">
				<logic:present name="QUOTE_POLICY_HISTORY" scope="request">
				<bean:define id="quotePolicyHistoryDetail" name="QUOTE_POLICY_HISTORY" type="com.dms.ejb.insurance.quote.common.quotepolicyhistory.QuotePolicyHistoryDetail" scope="request"/>
				
				<tr>
					<td class="sectionhead" width="25%">Premium & Taxes</td>
					<td class="sectionhead" width="19%" align="right">Prior</td>
					<td class="sectionhead" width="19%" align="right">New</td>
					<td class="sectionhead" width="19%" align="right">Difference</td>
					<td class="sectionhead" width="19%" align="right">Prorata Difference</td>
				</tr>
				<tr>
					<td class="FormLabels">Prorata Factor</td>
					<td colspan="4" class="Numeric">
					<bean:write name="EndorsementDetail" property="answer(Object::PlanFactor::ProrataFactor)"/></td>
				</tr>
				<tr>
					<td class="FormLabels">Policy Premium</td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumPrior" name="quotePolicyHistoryDetail" property="totalBasePremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumPrior%>"/>					
					 </td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumNew" name="EndorsementDetail" property="answer(Object::Plan::TotalBasePremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumNew%>"/>					
					</td>
					<td class="Numeric">
						<bean:define id="totalBasePremiumDiff" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalBasePremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalBasePremiumDiff%>"/>	
					</td>
					<td class="Numeric">
						<bean:define id="ProrataTotalBasePremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalBasePremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalBasePremiumDiference%>"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels">TRIA Premium</td>
					<td class="Numeric">
						<bean:define id="triaPremium" name="quotePolicyHistoryDetail" property="triaPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+triaPremium%>"/>
					 </td>
					<td class="Numeric">
						<bean:define id="TRIAPremium" name="EndorsementDetail" property="answer(Object::Plan::TRIAPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TRIAPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="TriaPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::TriaPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TriaPremiumDiference%>"/>					
					</td>
					<td class="Numeric">
						<bean:define id="ProrataTriaPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTriaPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTriaPremiumDiference%>"/>		
					</td>
				</tr>
				<tr>
					<td class="FormLabels">Non Certified TRIA Premium</td>
					<td class="Numeric">
						<bean:define id="nonTriaPremium" name="quotePolicyHistoryDetail" property="nonCertifiedTriaPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+nonTriaPremium%>"/>
					 </td>
					<td class="Numeric">
						<bean:define id="nonTRIAPremium" name="EndorsementDetail" property="answer(Object::Plan::NonCertifiedTRIAPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+nonTRIAPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="NonTriaPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::NonTriaPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+NonTriaPremiumDiference%>"/>					
					</td>
					<td class="Numeric">
						<bean:define id="ProrataNonTriaPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataNonTriaPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataNonTriaPremiumDiference%>"/>		
					</td>
				</tr>
				<bean:define id="prorataFactor" name="EndorsementDetail" property="answer(Object::PlanFactor::ProrataFactor)"/>									
				<tr>
					<td class="FormLabels">Total Premium</td>
					<td class="Numeric">
						<bean:define id="totalPremium" name="quotePolicyHistoryDetail" property="totalPremium" />
						<dmshtml:CurrencyFormatTag format="<%=""+totalPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="TotalPremium" name="EndorsementDetail" property="answer(Object::Quote::TotalPremium)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremium%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="TotalPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::TotalPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+TotalPremiumDiference%>"/>
					</td>
					<td class="Numeric">
						<bean:define id="ProrataTotalPremiumDiference" name="EndorsementDetail" property="answer(Object::QuoteProrata::ProrataTotalPremiumDiference)" />
						<dmshtml:CurrencyFormatTag format="<%=""+ProrataTotalPremiumDiference%>"/>
					</td>
				</tr>
				<%
					if(historySurchargeDetailsList.size()!=0 && surchargeDetailsList.size()!=0) {
					     for(int historySurchargeCount=0;historySurchargeCount<historySurchargeDetailsList.size();historySurchargeCount++)
				         {
				          for(int surchargeCount=historySurchargeCount;surchargeCount<historySurchargeCount+1;surchargeCount++)
								{		
								PlanDetail historySurchargeDetail=(PlanDetail)historySurchargeDetailsList.get(historySurchargeCount); 
								PlanDetail surchargeDetail=(PlanDetail)surchargeDetailsList.get(surchargeCount);
								if(historySurchargeDetail.getIncludedInCalculation().equals("No")){
									historySurchargeDetail.setSurcharge(0.00);
								}	
								if(surchargeDetail.getIncludedInCalculation().equals("No")){
									surchargeDetail.setSurcharge(0.00);
								}
								double surchargeDifference = surchargeDetail.getSurcharge() - historySurchargeDetail.getSurcharge();
								double prorataSurchargeDifference = surchargeDifference * new Double(prorataFactor.toString());
								%>
							  <tr>
									<td class="FormLabels">				
									<%=surchargeDetail.getSurchargeName() %>
									</td>
								    <td class="Numeric">
										<dmshtml:CurrencyFormatTag format="<%=""+historySurchargeDetail.getSurcharge()%>"/>
									</td>
									
									<td class="Numeric">
										<dmshtml:CurrencyFormatTag format="<%=""+surchargeDetail.getSurcharge()%>"/>
									</td>									
									<td class="Numeric">
										<dmshtml:CurrencyFormatTag format="<%=""+surchargeDifference%>"/>
									</td>
									<td class="Numeric">
										<dmshtml:CurrencyFormatTag format="<%=""+prorataSurchargeDifference%>"/>
									</td>	
								</tr>
							<%}
	                     }

				}%>	
				</logic:present>
				</table>
			    </logic:present>

				<input name="answer(Page::Action)" value="SELECT" type="hidden"/>
				<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Endorsement Management"%>"/>

				
				<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(subQuoteId)" value="<%=subQuoteId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteVerId)" value="<%=parentQuoteVerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(subQuoteId)" />
				<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
				<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				
			</html:form>	
		</div>
	</div>
	<%-- Endorsement Detail END --%>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">dolphintabs.init('dolphinnav', 0)</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
