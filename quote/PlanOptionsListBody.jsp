<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>


<SCRIPT type="text/JavaScript">
<!--
function submitForm1(nextOrPre){
    var formElement=document.forms[0];
    if(nextOrPre==1) {
		formElement.action="../NavigateAvailablePlanOptions.do?answer(SearchAvailableplans::nextOrPrevious)=1"
	}
	if(nextOrPre==-1) {
		formElement.action="../NavigateAvailablePlanOptions.do?answer(SearchAvailableplans::nextOrPrevious)=-1"
	}
    formElement.submit();
	return true;
  }



//-->
</SCRIPT>

<bean:define id="productId" name="FindAvailablesPlans" 	property="answer(Object::Quote::ProductId)" />
<bean:define id="productVerId" name="FindAvailablesPlans" 	property="answer(Object::Quote::ProductVerId)" />
<bean:define id="prdGroupVerId" name="FindAvailablesPlans" 	property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="productStatus" name="FindAvailablesPlans" 	property="answer(Object::Quote::ProductStatus)" />
<bean:define id="pagenum" name='pagenum' scope='request' />
<bean:define id="currentPageSize" name='currentPageSize' scope='request' />
<bean:define id="currentPageSize" name='currentPageSize' scope='request' />
<bean:define id="NoOfMedicalEmployees" name="FindAvailablesPlans" property="answer(Object::Quote::NoOfMedicalEmployees)" scope="request" />

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="CustomerState" name="FindAvailablesPlans" property="answer(Object::Customer::State)" scope="request" />
<bean:define id="oldCommissionPercentage" name="FindAvailablesPlans" property="answer(Object::QuoteCommission::CommissionPercentage)" type="java.lang.String"/>
<bean:define id="oldCommissionFactor" name="FindAvailablesPlans" property="answer(Object::PlanFactor::CommissionFactor)" type="java.lang.String"/>
<bean:define id="initCommissionPercentage" name="FindAvailablesPlans" property="answer(Object::QuoteCommission::InitialCommissionPercentage)" type="java.lang.String"/>

<bean:define id="RateImpacted" name="FindAvailablesPlans" property="answer(Object::QuoteCommission::RateImpacted)" type="java.lang.String"/>
<%boolean flgSelectFlag=false;%>

<%
long pageNumber=0;

int intCurrentPageSize=0;
try {
    pageNumber=Long.parseLong(""+pagenum);
    intCurrentPageSize=Integer.parseInt(""+currentPageSize);
}
catch (Exception ex){ 
    
   
}
long count	=0;
if(pageNumber>=0){
	count=(pageNumber)*40;
}

%>

<html:form styleId="frmCreatePlan" action="/CreatePlan"  onsubmit="return newchecksubmitcount();">
<table WIDTH="95%" ALIGN="center" border="0" cellspacing=1 cellpadding="1">
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<table width="60%" align="left" border="0">
				<bean:define id="parentQuoteId" name="FindAvailablesPlans" property="answer(parentQuoteId)" />
				<%
					boolean errorOccured=false;
				%>
				<bean:define id="ansmap" name="FindAvailablesPlans"
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
				<%
				if(errorOccured)
				{
					((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
				}
				%>
					<jsp:include page="../common/QuoteHeader.jsp">
					<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="heading" value="<%="AVAILABLE PLANS"%>" />
					</jsp:include>
			
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan="9">
			
			<%
			String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
			}
			%>
			<bean:define id="customerId" name="FindAvailablesPlans" property="answer(Object::Customer::CustomerId)" />
			<html:hidden property="answer(Object::Customer::CustomerId)" 		value="<%=customerId.toString()%>" />
			<html:hidden property="answer(dbname)" 			value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

			<bean:define id="ansmap" name="FindAvailablesPlans"
				property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
			<table WIDTH="100%" ALIGN="center" cellspacing=0 cellpadding="0" border="0">
				
				<tr>
					<td colspan="2" class="links">
						<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>">Quote Summary</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>

   	<tr>
		<td align="center" class="sectionhead">
			AVAILABLE HEALTH PLANS
		</td>
	</tr>

	<tr>
		<td colspan="9">
			&nbsp;
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<bean:define id="PlanName" name="FindAvailablesPlans" property="answer(PRODUCT_GROUP_NAME)"/>
			<table WIDTH="40%" ALIGN="Left" cellspacing="5" cellpadding="0" border="0">
				<tr>
					<td class="sectionheadblack">
					Plan
					</td>
					<td class="sectionheadblack">
						<%=""+PlanName%>
					</td>
				</tr>
				<dmshtml:dms_IsOption_Available_InProduct
					prdGroupVerId="<%=""+prdGroupVerId%>"
					optionName="Object::Plan::OrganTransPlant" negated="true"
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>" >
				<tr>
					<td class="sectionheadblack" align="Left">
						Enhanced Organ Transplant
					</td>
					
					<td class="sectionheadblack" align="Left">
						<bean:define
						id="OrganTransplant" name="FindAvailablesPlans"
						property="answer(Object::Plan::OrganTransPlant)" /> <%=OrganTransplant.toString()%>

					</td>
				</tr>
				</dmshtml:dms_IsOption_Available_InProduct>
				<dmshtml:dms_IsOption_Available_InProduct
				prdGroupVerId="<%=""+prdGroupVerId%>"
				optionName="Object::Plan::Maternity" negated="true"
				dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>"  >
				<tr>
					<td class="sectionheadblack" align="Left">
						Maternity and Well Baby
						Care
					</td>
					<td class="sectionheadblack" align="Left"><bean:define
						id="Maternity1" name="FindAvailablesPlans"
						property="answer(Object::Plan::Maternity)" /> <%=Maternity1.toString()%>

					</td>
				</tr>
				</dmshtml:dms_IsOption_Available_InProduct>
				<dmshtml:dms_IsOption_Available_InProduct
						prdGroupVerId="<%=""+prdGroupVerId%>"
						optionName="Object::Plan::VisionWearRider" negated="true"
						dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>" >
				<tr>
					<td class="sectionheadblack" align="Left">
						Vision Care Materials
						Coverage
					</td>
					<td class="sectionheadblack" align="Left"><bean:define
						id="visionwearrider1" name="FindAvailablesPlans"
						property="answer(Object::Plan::VisionWearRider)" /> <%=visionwearrider1.toString()%>

					</td>
				</tr>
				</dmshtml:dms_IsOption_Available_InProduct>
				<dmshtml:dms_IsOption_Available_InProduct
						prdGroupVerId="<%=""+prdGroupVerId%>"
						optionName="Object::Plan::MorbidObesityRider" negated="true"
						dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>" >
				<tr>
					<td class="sectionheadblack" align="Left">
						Morbid Obesity Rider
					</td>		
					<%if(CustomerState.toString().equals("IN")){%>
					<td class="sectionheadblack" align="Left"><bean:write
						name="FindAvailablesPlans"
						property="answer(Object::Plan::MorbidObesityRider)" />
					</td>
					<%}else{%>
						<td class="sectionheadblack" align="Left">No</td>
					<%}%>
				</tr>
				</dmshtml:dms_IsOption_Available_InProduct>
				<dmshtml:dms_IsOption_Available_InProduct
						prdGroupVerId="<%=""+prdGroupVerId%>"
						optionName="Object::Plan::LifeCovAmount" negated="true"
						dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>" >
				<tr>
					<td class="sectionheadblack" align="Left">
						Life and Accidental Death
						and Dismemberment
					</td>
					<td class="sectionheadblack" align="Left">
						<bean:define
						id="LifeCoverageAmount" name="FindAvailablesPlans"
						property="answer(Object::Plan::LifeCovAmount)" /> <% 
						if(LifeCoverageAmount.toString().equals(""))
						{%> None <%	} else {%> $<%=LifeCoverageAmount.toString()%> <%}%>
					</td>
				</tr>
				</dmshtml:dms_IsOption_Available_InProduct>
				<dmshtml:dms_IsOption_Available_InProduct
						prdGroupVerId="<%=""+prdGroupVerId%>"
						optionName="Object::Plan::WdiCovAmount" negated="true"
						dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+CustomerState%>"  productStatus="<%=""+productStatus%>" >
				<tr>
					<td class="sectionheadblack" align="Left">
						Weekly Disability Income
						Benefits
					</td>
					<td class="sectionheadblack" align="Left"><bean:define
						id="WDICoverageAmount" name="FindAvailablesPlans"
						property="answer(Object::Plan::WdiCovAmount)" /> <% 
				if(WDICoverageAmount.toString().equalsIgnoreCase(""))
					{%> None <%	} else {%> $<%=WDICoverageAmount.toString()%> <%}%></td>
				</tr>
	</dmshtml:dms_IsOption_Available_InProduct>
			</table>
		</td>
	</tr>

	<tr>
		<td colspan="9">&nbsp;</td>
	</tr>
	<tr>
		<td>
		
		</td>
	<%if (pageNumber>0){%>
		<td align="right" colspan="3" >
			<html:button value="<<< Previous" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return submitForm1('-1')"/>
		</td>
	<%}%>
	<%if (intCurrentPageSize==40){%> 
		<td align="right" colspan="3" >
			<html:button value="Next >>>" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return submitForm1('1')"/>
		</td>
	<%}%>
	</tr>
	<tr>
		<td colspan="8">
			<table WIDTH="100%" ALIGN="center" cellspacing="5" cellpadding="0" border="0">
				<%int listSize = 0;%>

				<bean:define id="arrAvailablePlans" name='arrAvailablePlans' scope='request' type="java.util.ArrayList"/>

				<%if(arrAvailablePlans.size()<=1){%>
				<tr>
					<td colspan="3" class="Error">
						No Plans available for the selected criteria.
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" >
						<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/>
					</td>
				</tr>
				<%}%>

<!-- Validation for activating the submit button, start -->
				<%
				String[] dbColName = (String[]) arrAvailablePlans.get(0);
				%>
				<%if(arrAvailablePlans.size()>1){%>
				<tr>
					<td colspan="<%=2+(dbColName.length)%>" align="right">
						<INPUT TYPE="submit" value="Select" class="sbttn">
					</td>
				</tr>
				<tr>
					<td class="sectionhead" width="2%" align="left">
						No.
					</td>
					<% for (int colCounter=0;colCounter<dbColName.length;colCounter++) {%>
					<td class="sectionhead" width="20%" align="left"><%=""+dbColName[colCounter]%></td>
					<%} %>
				</tr>
				<% int siNo=(int)count;
				for (int i=1;i<arrAvailablePlans.size();i++) 
				 {
					com.dms.ejb.data.QuestionHashMap availablePlansMap=(com.dms.ejb.data.QuestionHashMap)arrAvailablePlans.get(i); %>
				<tr>
					<td class="SearchResult" width="20%" align="left">
						<%=++siNo%>
					</td>

				<% for (int colCounter=0;colCounter<dbColName.length;colCounter++) {
  					  if(colCounter==(dbColName.length-1)) {
      					  String colName =dbColName[colCounter];
    			%>
       				 <td class="SearchResult" width="20%" align="left">
      				 	 <input type="radio" name="answer(Object::Plan::BaseRateId)"
								value="<%=availablePlansMap.getString(colName)%>"> 
					</td>

   				 	<%} else { %>
	

					<td class="SearchResult" width="20%" align="left">
						<%String colName =dbColName[colCounter];%> <%=""+availablePlansMap.getString(colName)%>

					</td>
					<%}} %>
				</tr>
				<%}
				%>
<!-- Validation for activating the submit button, end -->

				<%
				
					ansmap.remove("baseRates");
				%>

				<tr>
					<td colspan="<%=2+(dbColName.length)%>" align="right">
						<INPUT TYPE="submit" value="Select" class="sbttn">
					</td>
				</tr>
				<%}%>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<!-- *** -->
		</td>
		<%if (pageNumber>0){%>
		<td align="right" colspan="3" >
			<html:button value="<<< Previous" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return submitForm1('-1')"/>
		</td>
		<%}%>
		<%if (intCurrentPageSize==40){%> 
		<td align="right" colspan="3" >
			<html:button value="Next >>>" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return submitForm1('1')"/>
		</td>
		<%}%>
	</tr>

	<tr>
		<td>&nbsp;</td>
	</tr>

	<bean:define id="userId" name="FindAvailablesPlans" property="answer(Object::Quote::CreatedBy)" scope="request" />
	<bean:define id="baseRateLookUpVerId" name="FindAvailablesPlans" property="answer(Object::Plan::BaseRateLookVerId)" scope="request" />
	<bean:define id="subQuoteId" name="FindAvailablesPlans" property="answer(subQuoteId)" scope="request" />

	<tr>
		<td>
			<html:hidden property="answer(subQuoteId)" value="<%=subQuoteId.toString()%>" />
			<html:hidden property="answer(Object::Quote::NoOfMedicalEmployees)" value="<%=NoOfMedicalEmployees.toString()%>" />
			<html:hidden property="answer(Object::Quote::Id)" value="<%=subQuoteId.toString()%>" />
		
			<html:hidden property="answer(Object::Plan::BaseRateLookVerId)" value="<%=baseRateLookUpVerId.toString()%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
			<html:hidden property="answer(QuoteId)" value="<%=parentQuoteId.toString()%>" />
			<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=parentQuoteId.toString()%>" />
			<html:hidden property="answer(SearchAvailableplans::PageNum)" value="<%=""+pageNumber%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" />
		</td>
	</tr>

	<bean:define id="Deductible" name="FindAvailablesPlans" property="answer(Object::Plan::DeductibeText)" scope="request" />
	<bean:define id="Coinsurance" name="FindAvailablesPlans" property="answer(Object::Plan::Coinsurance)" scope="request" />
	<bean:define id="Oop" name="FindAvailablesPlans" property="answer(Object::Plan::Oop)" scope="request" />
	<bean:define id="OfficevisitType" name="FindAvailablesPlans" property="answer(Object::Plan::OfficeVisitType)" scope="request" />
	<bean:define id="Type" name="FindAvailablesPlans" property="answer(Object::Plan::PharmacyBenefitType)" scope="request" />
	<bean:define id="OrganTransplant" name="FindAvailablesPlans" property="answer(Object::Plan::OrganTransPlant)" scope="request" />
	<bean:define id="Maternity" name="FindAvailablesPlans" property="answer(Object::Plan::Maternity)" scope="request" />
	<bean:define id="visionwearrider" name="FindAvailablesPlans" property="answer(Object::Plan::VisionWearRider)" scope="request" />
	<bean:define id="LifeCoverageAmount" name="FindAvailablesPlans" property="answer(Object::Plan::LifeCovAmount)" scope="request" />
	<bean:define id="WDICoverageAmount" name="FindAvailablesPlans" property="answer(Object::Plan::WdiCovAmount)" scope="request" />
	<bean:define id="DentalStatus" name="FindAvailablesPlans" property="answer(Object::Plan::DentalStatus)" scope="request" />
	<bean:define id="twoyearPriorCoverage" name="FindAvailablesPlans" property="answer(Object::Plan::2YearPriorCoverage)" scope="request" />
	<bean:define id="CompositeRate" name="FindAvailablesPlans" property="answer(Object::Quote::CompositeRate)" scope="request" />
	<bean:define id="QuoteVerId" name="FindAvailablesPlans" property="answer(Object::Quote::QuoteVerId)" scope="request" />
	<bean:define id="HelthHra" name="FindAvailablesPlans" property="answer(Object::Quote::HelthHra)" scope="request" />
	<bean:define id="PlanNameDisPly" name="FindAvailablesPlans" property="answer(PlanNameDisPly)" scope="request" />
	<bean:define id="MorbidObesityRider" name="FindAvailablesPlans" property="answer(Object::Plan::MorbidObesityRider)" scope="request" />
	
	<bean:define id="ADBCovAmount" name="FindAvailablesPlans" property="answer(Object::Plan::ADBCovAmount)" scope="request" />

	<bean:define id="SpouseCovAmount" name="FindAvailablesPlans" property="answer(Object::Plan::SpouseCovAmount)" scope="request" />
	<bean:define id="CoveredLives" name="FindAvailablesPlans" property="answer(Object::Plan::CoveredLives)" scope="request" />

	<tr>
		<td>
			<html:hidden  property="answer(Object::Plan::DeductibeText)" value="<%=Deductible.toString()%>" />
			<html:hidden  property="answer(Object::Plan::Coinsurance)" value="<%=Coinsurance.toString()%>" />
			<html:hidden  property="answer(Object::Plan::Oop)" value="<%=Oop.toString()%>" />
			<html:hidden  property="answer(Object::Plan::OfficeVisitType)" value="<%=OfficevisitType.toString()%>" />
			<html:hidden  property="answer(Object::Plan::PharmacyBenefitType)" value="<%=""+Type%>" />
			<html:hidden  property="answer(Object::Plan::OrganTransPlant)" value="<%=OrganTransplant.toString()%>" />
			<html:hidden  property="answer(Object::Plan::Maternity)" value="<%=Maternity.toString()%>" />
			<html:hidden  property="answer(Object::Plan::VisionWearRider)" value="<%=visionwearrider.toString()%>" />
			<html:hidden  property="answer(Object::Plan::LifeCovAmount)" value="<%=LifeCoverageAmount.toString()%>" />
			<html:hidden  property="answer(Object::Plan::WdiCovAmount)" value="<%=WDICoverageAmount.toString()%>" />
			<html:hidden  property="answer(Object::Plan::DentalStatus)" value="<%=DentalStatus.toString()%>" />
			<html:hidden  property="answer(Object::Plan::2YearPriorCoverage)" value="<%=twoyearPriorCoverage.toString()%>" />
			<html:hidden  property="answer(Object::Quote::CompositeRate)" value="<%=CompositeRate.toString()%>" />
			<html:hidden  property="answer(Object::Quote::HelthHra)" value="<%=HelthHra.toString()%>" />
			<html:hidden  property="answer(Object::Plan::PlanNameDisply)" value="<%=PlanNameDisPly.toString()%>" />
			<html:hidden  property="answer(Object::Plan::MorbidObesityRider)" value="<%=MorbidObesityRider.toString()%>" />
			<html:hidden  property="answer(Object::Plan::DentalStatus)" value="<%=DentalStatus.toString()%>" />
			<html:hidden  property="answer(Object::Plan::2YearPriorCoverage)" value="<%=twoyearPriorCoverage.toString()%>" />
			<html:hidden  property="answer(Object::Plan::Maternity)" value="<%=Maternity.toString()%>" />
			<html:hidden  property="answer(Object::Quote::QuoteVerId)" name="FindAvailablesPlans" />
			<html:hidden  property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
		</td>
	</tr>
	
	

	<bean:define id="quoteStartDate" name="FindAvailablesPlans" property="answer(Object::Quote::QuoteStartDate)" scope="request" />
	<tr>
		<td>
			<html:hidden  property="answer(Object::Quote::QuoteStartDate)" value="<%=quoteStartDate.toString()%>"/>
		</td>
	</tr>

	<bean:define id="AreaNetWorkKey" name="FindAvailablesPlans" property="answer(Object::Quote::AreaNetWorkKey)" scope="request"/>
	
	<tr>
		<td>
			<html:hidden property="answer(Object::Quote::AreaNetWorkKey)" value="<%=AreaNetWorkKey.toString()%>" />
			<html:hidden property="answer(Object::Plan::AreaNWFactorKey)" value="<%=AreaNetWorkKey.toString()%>" />
		
			<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />
			<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=""+ownerId%>" />
			<html:hidden property="answer(Object::Plan::WdiCovAmount)" value="<%=WDICoverageAmount.toString()%>" />
			<html:hidden property="answer(Object::Plan::LifeCovAmount)" value="<%=LifeCoverageAmount.toString()%>" />
		</td>
	</tr>

	<bean:define id="PlanNumber" name="FindAvailablesPlans" property="answer(Object::Quote::QuoteNumber)" scope="request" />
	<tr>
		<td>
			<html:hidden property="answer(Object::Quote::QuoteNumber)" value="<%=PlanNumber.toString()%>" />
		</td>
	</tr>


	<bean:define id="AddPlanProductId" name="FindAvailablesPlans" property="answer(Object::AddPlan::ProductId)" scope="request" />
	<bean:define id="AddPlanProductVerId" name="FindAvailablesPlans" property="answer(Object::AddPlan::ProductVerId)" scope="request" />

	<tr>
		<td>
			<html:hidden property="answer(Object::AddPlan::ProductId)" value="<%=AddPlanProductId.toString()%>"/>
			<html:hidden property="answer(Object::AddPlan::ProductVerId)" value="<%=AddPlanProductVerId.toString()%>"/>
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%=""+productId%>" />
			<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%=""+productVerId%>" />
		</td>
	</tr>
	

	
	<bean:define id="AddPlan" name="FindAvailablesPlans" property="answer(Plan::AddPlan)" scope="request"/>
	<tr><td><html:hidden property="answer(Plan::AddPlan)" value="<%=""+AddPlan%>" /></td></tr>
	
	<bean:define id="ProductGroupVerId" name="FindAvailablesPlans" property="answer(Object::Quote::ProductGroupVerId)" />
	<tr>
		<td>
	
			<html:hidden property="answer(Object::Quote::ProductGroupVerId)" value="<%=ProductGroupVerId.toString()%>" />
			<html:hidden property="answer(Object::Quote::ProductStatus)" value="<%=""+productStatus%>" />
			<html:hidden property="answer(Object::Customer::State)" value="<%=""+CustomerState%>" />
			<html:hidden  property="answer(Object::Plan::ADBCovAmount)" value="<%=""+ADBCovAmount%>" />
			<html:hidden  property="answer(Object::Plan::CoveredLives)" value="<%=""+CoveredLives%>" />
			<html:hidden  property="answer(Object::Plan::SpouseCovAmount)" value="<%=""+SpouseCovAmount%>" />
			<html:hidden property="answer(Object::QuoteCommission::CommissionPercentage)" value="<%=""+oldCommissionPercentage%>" />
			<html:hidden property="answer(Object::QuoteCommission::InitialCommissionPercentage)" value="<%=""+initCommissionPercentage%>" />
		
			<html:hidden property="answer(Object::PlanFactor::CommissionFactor)" value="<%=""+oldCommissionFactor%>" />
			<html:hidden property="answer(Object::QuoteCommission::RateImpacted)" value="<%=""+RateImpacted%>" />
	
			<html:hidden property="answer(Object::Quote::QuoteType)"  value="NEW_BUSINESS" />
			<html:hidden property="answer(PRODUCT_GROUP_NAME)"  value="<%=""+PlanName%>" />
			<bean:define id="QuoteStatus" name="FindAvailablesPlans" scope="request" property="answer(Object::Quote::QuoteStatus)"/>
			<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
			<html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="yes" />
			<html:hidden property="answer(System::flag::removeArrObjectDetail)" value="yes" />
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		</td>
	</tr>
	
</table>
</html:form>
<script type="text/javascript">
<!--
	var frm = document.forms.frmCreatePlan;
	for(var i=0; frm.elements[i]!=null; i++)
	{
		//alert(i+" "+frm.elements[i].value+", Name: "+frm.elements[i].name+", Type: "+frm.elements[i].type);
		//if(i==10)
		//	break;
		if(frm.elements[i].type=="radio") {
			frm.elements[i].checked=true;
			// alert(i+" "+frm.elements[i].value+", Name: "+frm.elements[i].name+", Type: "+frm.elements[i].type);
			break;
		}
	}
//-->
</script>