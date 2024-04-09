<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/QuoteSummary.js">
</SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/Common.js">
</SCRIPT>


<html:form action="/SaveQuoteSummuryAction" styleId="frm"  onsubmit="return validateFields()">
<!--##########################VARIBLE DECLARATION #########################################-->

				<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request" />
<bean:define id="parentQuoteVerId" name="QuoteDetail" property="answer(Object::Quote::QuoteVerId)" scope="request" />

<bean:define id="prodId" name="QuoteDetail" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="ProductVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />

<bean:define id="customerId" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="QuoteDetail" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="quoteStartDate" name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" 
scope="request" />
<bean:define id="noOfMedicalEmployees" name="QuoteDetail" property="answer(Object::Quote::NoOfMedicalEmployees)"/> 
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="QuoteNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteNumber)" />
<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
<bean:define id="MedicalUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactor)" />
<bean:define id="DrugUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactor)" />

<bean:define id="MedicalUWFactorPrefer" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorPrefer)" />
<bean:define id="MedicalUWFactorStand" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorStand)" />
<bean:define id="MedicalUWFactorMax" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorMax)" />

<bean:define id="DrugUWFactorPrefer" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorPrefer)" />
<bean:define id="DrugUWFactorStand" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorStand)" />
<bean:define id="DrugUWFactorMax" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorMax)" />
<bean:define id="HelthHra" name="QuoteDetail" property="answer(Object::Quote::HelthHra)" />
<bean:define id="CustomerZip" name="QuoteDetail" property="answer(Object::Quote::CustomerZip)" />
<bean:define id="AreaNetWorkKey" name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKey)" />
<bean:define id="AreaNetWorkKeyDesc" name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKeyDesc)" />
<bean:define id="State" name="QuoteDetail" property="answer(Object::Quote::CustomerState)" />

<bean:define id="CustomerCounty" name="QuoteDetail" property="answer(Object::Quote::County)" />
<bean:define id="TotalParentQuotePremium" name="QuoteDetail" property="answer(Object::Quote::TotalPremium)" />
<bean:define id="parentQuoteFee1" name="QuoteDetail" property="answer(Object::Quote::Fee1)" />
<bean:define id="parentQuoteFee2" name="QuoteDetail" property="answer(Object::Quote::Fee2)" />
<% String fullName =""; %>
<bean:define id="fname" property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" scope="session"/>
<bean:define id="lname" property="answer(Object::UserDetail::UserLastName)" name="LoginPage" scope="session"/>

<bean:define id="GroupId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="GroupVerId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="productStatus" name="QuoteDetail" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="QuoteType" name="QuoteDetail" property="answer(Object::Quote::QuoteType)" />
<bean:define id="compositeRate" name="QuoteDetail" property="answer(Object::Plan::CompositeRateFlag)" />

<bean:define id="MedicalUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactor)" />
<bean:define id="CompositeRate" name="QuoteDetail" property="answer(Object::Plan::CompositeRateFlag)" />
<bean:define id="uwTierFactor" name="QuoteDetail" property="answer(Object::PlanFactor::UWRatingTierFactor)" />
<bean:define id="mentalIllnessFactor" name="QuoteDetail" property="answer(Object::PlanFactor::MentalIllness)" />
<bean:define id="sppechPhyOccFactor" name="QuoteDetail" property="answer(Object::PlanFactor::SpeechPhyOcc)" />
<bean:define id="substanceAbuseFactor" name="QuoteDetail" property="answer(Object::PlanFactor::SubstanceAbuse)" />
<bean:define id="discretionaryAdjDefaultFactor" name="QuoteDetail" property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" />
<bean:define id="memberAssociation" name="QuoteDetail" property="answer(Object::Quote::MemberAssociation)"/>
<bean:define id="AreaNetworkCode" name="QuoteDetail" property="answer(Object::Quote::NetWorkCode)"/>
<bean:define id="requiredFactor" name="QuoteDetail" property="answer(Object::PlanFactor::RequiredFactor)" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="ProductFamilyId" name="QuoteDetail" property="answer(Object::Quote::ProductFamilyId)" />
<bean:define id="suppAccidentalCvg" name="QuoteDetail" property="answer(Object::Quote::SupplementalAccidentCoverage)" />

<html:hidden property="answer(Object::PlanFactor::RequiredFactor)" value="<%=""+requiredFactor%>" />
<html:hidden property="answer(Object::Quote::NetWorkCode)" value="<%=""+AreaNetworkCode%>" />
		<%
		String compositeRate1="";
		if(request.getParameter("answer(Object::Plan::CompositeRateFlag)")!=null){
			compositeRate1=request.getParameter("answer(Object::Plan::CompositeRateFlag)");
		}
		%>

<%!		
static final int beniRater = 0;
static final int MicaRater = 1;
static final int MicaIowa = 3;
%>
<%
int productGroup = beniRater;

if(State.toString().length()>0 ){
	if(State.toString().equals("IL")){
		productGroup = MicaRater;
	}else 	if(State.toString().equals("IA")){
		productGroup = MicaIowa;
	}
}	

			%>
<!-- / Lost/Reject Reason -->
<%String strReason="";%>
<bean:define id="RejectReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::RejectedNotes)" scope="request" />
<bean:define id="LostReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LostNotes)" scope="request" />

<!-- Lost/Reject Reason / -->

<%if(fname.toString()=="" && lname.toString()==""){
	fullName = userId.toString();
} else {
	fullName = fname+ " "+ lname;
}%>
<%
if(!TotalParentQuotePremium.toString().equals("")){
double lgTotalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString()); 
}
%>

<%long numberOfSubQuotes=0;%>
<%String EmpGrpNum="";%>
<%
if(!noOfMedicalEmployees.toString().equals("")){
long lgNoOfMedicalEmployees = Long.parseLong(""+noOfMedicalEmployees);
}
%>





<!--#######################################################################################-->

<!-- GET ALL PLAN DETAILS BY PARENT QUOTE ID -->
<dmshtml:Get_All_Plan_HeaderDetails 
nameInSession="subQuotes" 
parentQuoteId='<%=""+parentQuoteId%>'
dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  
/>
<%String subQuoteId1="";%>
<logic:present name="subQuotes" scope="request">

<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">		
<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
<%subQuoteId1=""+subQuoteId; %>
<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
<%numberOfSubQuotes=subQuoteArr.size();%>	
</logic:iterate>											
</logic:present>


<!-- GET CUSTOMER DETAIL BY CUSTOMER ID -->
<dmshtml:Get_Customer_HeaderDetail_ByCustomerId 
nameInSession="customerMap" 
customerId='<%=""+customerId%>' 
dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' 
/>
<bean:define id="customerDetailMap" name="customerMap" scope="request"
												type="com.dms.ejb.data.QuestionHashMap" />
<%EmpGrpNum=customerDetailMap.getString("Object::Customer::Number");%>


<%java.util.ArrayList pdfList = new java.util.ArrayList();%>
	<%
			boolean editableQuoteHeader =false;
			boolean uwFactorDropDown =false;
			boolean modifyQuoteType = false;
	
	%>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
</table>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
	<td>
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		
					
		<tr><td>
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
		</td></tr>
	
    	</table>
    	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			
				<tr>
				<td>
					<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp" >
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />					
						<jsp:param name="heading" value="<%="QUOTE SUMMARY"%>" />
					</jsp:include>
					</table>
				</td>
			</tr>
		
		


			<!-- /Lost/Reject Reason -->
			
			<dmshtml:dms_isPresent property='<%=new String[]{"Lost", "Rejected"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true" >
				<tr>
				<td class="Error">

					Reason : <%=RejectReason.toString()+" "+LostReason.toString()%>

				</td>
				</tr>

			</dmshtml:dms_isPresent>
			<!-- Lost/Reject Reason / -->



			<tr>
			<td>&nbsp;</td>
			</tr>

<tr>
	<td align="left">
		<table WIDTH="100%"  ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
<!--########################## CREATE QUOTE PROPOSAL #########################################-->
	
			<dmshtml:dms_isPresent property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<td class="links" align="left" width="24%">
					<a href="../quote/HealthInsCreateQuoteProposal.jsp?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId1.toString()%>&answer(ProductId)=<%=""+prodId%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>">Create Quote Proposal</a>
				</td>
			</dmshtml:dms_isPresent>			
		

<!--##########################Select Employee Plan#########################################-->
			<td class="links" align="left" width="24%">	

				<dmshtml:dms_isPresent property='<%=new String[]{"Sold", "Lost", "Rejected", "Offered"}%>' value="<%=paretQuoteStatus.toString()%>">

					<a href="../selectEmployeetoPlan.do?TabPanelName=Quote_Panel&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&parentQuoteId=<%=parentQuoteId.toString()%>&answer(QuoteId)=<%=request.getParameter("answer(QuoteId)")%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&subQuotePlanName=<%=prodId%>&requestType=SelectEmpToPlan">Select Employee Plan</a> 

				</dmshtml:dms_isPresent>	

			</td>

<!--##########################eND Select Employee Plan###################################-->

<%double administrativeFee=0; %>
<logic:present name="subQuotes" scope="request">
	<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">		
		<bean:define id="fee1" name="aSubQuote" 	property="fee1" />
			<% administrativeFee =Double.parseDouble(""+fee1); %>
	</logic:iterate>
</logic:present>



<!--##########################ADD Plan#########################################-->



	<dmshtml:dms_isPresent 
	property="<%=new String[]{"Sold", "Lost", "Rejected", "Offered"}%>" 
	value="<%=paretQuoteStatus.toString()%>">
	<td class="links" align="left" width="14%">
	<a href="../AddNewPlan.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(subQuoteId)=<%=subQuoteId1.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Quote::HelthHra)=<%=HelthHra.toString()%>&answer(Object::Quote::County)=<%=""+CustomerCounty %>&answer(Object::Plan::CompositeRateFlag)=<%=CompositeRate.toString()%>&answer(Plan::PlanNumber)=<%=""+(numberOfSubQuotes+1)%>&answer(Object::Quote::ProductId)=<%=prodId%>&answer(quoteStartDate)=<%=""+quoteStartDate%>&answer(noOfMedicalEmployees)=<%=""+noOfMedicalEmployees%>&answer(State)=<%=""+State%>&answer(Object::Quote::CustomerZip)=<%=""+CustomerZip%>&answer(Object::Quote::AreaNetWorkKeyDesc)=<%=""+AreaNetWorkKeyDesc%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(Object::Quote::QuoteStartDate)=<%=""+quoteStartDate%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&answer(Object::PlanFactor::AdministrativeFee)=<%=administrativeFee%>&answer(Object::Risk::RiskId)=5&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Quote::NetWorkCode)=<%=AreaNetworkCode.toString()%>">Add Plan</a>
	</td>
	</dmshtml:dms_isPresent>
<!--##########################END ADD Plan#########################################-->



<!--##########################SUBMIT LOST REJECT#########################################-->


	<logic:present name="subQuotes" scope="request">


		<td class="links" align="left" width="14%">
		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >
		
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBMIT_AVAILABLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">			
			<a href="../quote/HealthInsSubmittedQuoteStatus.jsp?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::MemberAssociation)=<%=memberAssociation.toString()%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>">Submit</a>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		
		</dmshtml:dms_isPresent>
		</td>
						

		<td class="links" align="left" width="14%">
		
			<dmshtml:dms_isPresent property='<%=new String[]{"Sold", "Lost", "Rejected"}%>' value="<%=paretQuoteStatus.toString()%>">

				<a href="../LostQuote.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&answer(Object::Quote::MemberAssociation)=<%=memberAssociation.toString()%>&answer(GetadditionalInfo)=yes">Lost</a>
			
			</dmshtml:dms_isPresent>	
		
		</td>

		<td class="links" align="left" width="10%">

			<dmshtml:dms_isPresent property='<%=new String[]{"Sold", "Lost", "Rejected"}%>' value="<%=paretQuoteStatus.toString()%>">

				<a href="../RejectQuote.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&answer(Object::Quote::MemberAssociation)=<%=memberAssociation.toString()%>&answer(GetadditionalInfo)=yes">Reject</a>

			</dmshtml:dms_isPresent>	

		</td>
		<td class="links" align="right">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="true">
			<dmshtml:dms_isPresent property='<%=new String[]{"Sold"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<a href="../XMLGeneratorForCustomer.do?TabPanelName=Quote_Panel&customerId=<%=customerId.toString()%>&xmlFileName=<%=QuoteNumber.toString()%>&quoteId=<%=parentQuoteId%>" target="_new">Export XML</a>
			</dmshtml:dms_isPresent>
		</dmshtml:dms_static_with_connector>
		</td>


	</logic:present>
		</tr>
<!--##########################SUBMIT LOST REJECT#########################################-->


	<tr>
		<td>&nbsp;</td>
	</tr>
		</table>
		</td>
	</tr>

<!--##########################EDIT QUOTE HEADER#########################################-->
	<%
		boolean isSold = false;
		if(paretQuoteStatus.toString().equalsIgnoreCase("Sold")) {
			isSold = true;
		}
	%>
	<tr>
	<td align="left">
		<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td>
		<table width="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	
		<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"UPDATE_QUOTE_HEADER"}%>' 			
		connector='or' negated="true">
		<%
		 editableQuoteHeader = true;
		%>
		<tr>
		 <td class="FormLabels" width="40%"><B>Requested Effective Date:</B></td>
		 <td class="links"  width="60%"><html:text name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" size="10" 
						maxlength="10" styleClass="txtbox" styleId="effDate" readonly="<%=isSold %>"/>
		</td>
		</tr>
		<!-- ^^^^^^^^^ -->
			
		<!-- ^^^^^^^^^ -->
		<%
if(productGroup==MicaRater){
			%>
				<html:hidden name="AddParentQuote" property="answer(Object::Quote::AreaNetWorkKey)" value=""/>
			<%
				}else{
			
			com.dms.ejb.data.QuestionHashMap qmapAreaNet =   new com.dms.ejb.data.QuestionHashMap(10);				
			qmapAreaNet.put("ownerId", ""+ownerId);
			qmapAreaNet.put("dbname", ""+com.dms.web.util.DbUtils.getWriteDS(pageContext));
			qmapAreaNet.put("Object::Customer::CustomerId", ""+customerId);
			qmapAreaNet.put("Object::Quote::ProductStatus", ""+productStatus);
			qmapAreaNet.put("Object::Quote::QuoteStartDate",""+quoteStartDate);
			qmapAreaNet.put("Object::Quote::ProductId",""+prodId);
			qmapAreaNet.put("Object::Quote::AgencyId",""+agencyId);
			qmapAreaNet.put("Object::Quote::ProductGroupId",""+GroupId);
			qmapAreaNet.put("Object::Quote::ProductGroupVerId",""+GroupVerId);
			
					

		%>
		<dmshtml:execute_rules 
		nameInSession="GETAREANETWORKFATORSKEYQUOTESUMMARY" 					dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"
		formName="form::GETAREANETWORKFATORSKEY"
		answerMap="<%=qmapAreaNet%>" 
		processInstance="preprocess" />

		<!-- ^^^^^^^^^ -->
		<logic:present name='GETAREANETWORKFATORSKEYQUOTESUMMARY' scope='request'>
		
		<%if(qmapAreaNet.containsKey("AreaNetWorkKeys")) {
			try {
				java.util.ArrayList arrAreaKeys = (java.util.ArrayList)qmapAreaNet.get("AreaNetWorkKeys");	
				if(arrAreaKeys.size()>0){ 	%>
				<tr>
				<td class="FormLabels"><B>Area NetWorkKey</B></td>
				<td class="links"> 
				<html:select property="answer(Object::Quote::AreaNetWorkKey)" styleId="selPPO" disabled="<%=isSold %>">
				<%
				for(int i=0; i<arrAreaKeys.size();i++ ) {
					com.dms.ejb.data.QuestionHashMap qmap_Temp = (com.dms.ejb.data.QuestionHashMap)arrAreaKeys.get(i);
				%>
					<html:option value='<%=qmap_Temp.getString("AreaNetWorkKey")%>'>
						<%=qmap_Temp.getString("AreaNetWorkDesc")%>
					</html:option>
				<%}%>
				</html:select>
				<%
					if(isSold) { %>
						<html:hidden name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKey)"/>
					<%}
				%>
				</td>
				</tr>
				<%}
				} catch(Exception ex){}	
				}%>
		
		</logic:present>
		<!-- ^^^^^^^^^ -->
		<%}%>


	 </dmshtml:dms_static_with_connector>
	<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"UPDATE_QUOTE_HEADER"}%>' 			
		connector='or' negated="false">
		<tr>
			<td class="FormLabels" width="40%"><B>Requested Effective Date:</B>
			</td>
			<td class="TextMatter" width="60%"><bean:write name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" /></td>
		</tr>
	</dmshtml:dms_static_with_connector>
	 <dmshtml:dms_static_with_connector ruleName='privilage'  property='<%=new String[]{"MODIFY_QUOTE_TYPE"}%>' connector='or' negated="true">
		 <dmshtml:dms_isPresent property='<%=new String[]{"Sold", "Lost", "Rejected"}%>' value="<%=paretQuoteStatus.toString()%>" negated="false">
		 <%
			modifyQuoteType = true;
		 %>
			<tr>
				<td class="FormLabels"><B>Quote Type</B></td>
				<td class="links"> 
					<html:select property="answer(Object::Quote::QuoteType)" name="QuoteDetail" disabled="<%=isSold %>">
						<html:option value="NEW_BUSINESS">New Business</html:option>
						<!-- <html:option value="RENEWAL_QUOTE">Renewal</html:option>  -->
						</html:select>
					<%
						if(isSold) { %>
							<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteType)"/>
						<%}
					%>
				</td>
			</tr>
		</dmshtml:dms_isPresent>
	</dmshtml:dms_static_with_connector>

	<tr>
		<td class="FormLabels"><B>Name your Quote:</B></td>
		<td>
			<html:text property="answer(Object::Quote::QuoteName)" name="QuoteDetail" styleClass="txtbox" styleId="NamedQuote" maxlength="30" size="32"/>
		</td>
	</tr>

	<tr>
		<td class="FormLabels"><B>Description for this Quote:</B></td>
		<td>
			<html:textarea property="answer(Object::Quote::QuoteDesc)" name="QuoteDetail" styleId="QuoteDiscription" rows="4" cols="50" />
		</td>
	</tr>				

	</table>
	</td>
	</tr>

<!--##########################END EDIT QUOTE HEADER#########################################-->






</table>
	</td>
	</tr>
	<tr>
	<td align="left">
		<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_WORKSHEET_EDIT"}%>' connector='or' negated="true">
			<dmshtml:dms_isPresent property='<%=new String[]{"Sold"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<tr>
				 <td class="FormLabels" width="40%"><B>Rating Card:</B></td>
				<td class="TextMatter"  width="60%">
					<html:text property="answer(Object::Quote::ratingCard)" styleId="ratingCard" styleClass="txtbox" maxlength="5"/>
				</td>
				</tr>
				<tr>
				 <td class="FormLabels" width="40%"><B>Inception Date:</B></td>
				<td class="TextMatter"  width="60%">
					<bean:define id="incepDate" name="QuoteDetail" property="answer(Object::Quote::inceptionDate)" />
					<%
						String incepstrDate=incepDate.toString();
						String incepyyyy="";
						String incepdd="";
						String incepmm="";
						if(!incepstrDate.equals(""))
						{
						incepmm= incepstrDate.substring(0,2);
						incepdd= incepstrDate.substring(3,5);
						incepyyyy= incepstrDate.substring(6,10);
						}
					%>
					<html:text property="answer(inceptionDateMM)" value="<%=incepmm %>" styleId="inceptionDateMM" styleClass="txtbox" maxlength="2" size="2" onkeyup="if(this.value.length==2) {this.form.inceptionDateDD.focus()}"/>&nbsp;/mm
					<html:text property="answer(inceptionDateDD)" value="<%=incepdd %>" styleId="inceptionDateDD" styleClass="txtbox" maxlength="2" size="2" onkeyup="if(this.value.length==2) {this.form.inceptionDateYY.focus()}"/>&nbsp;/dd
					<html:text property="answer(inceptionDateYY)" value="<%=incepyyyy %>" styleId="inceptionDateYY" styleClass="txtbox" maxlength="4" size="4"/>&nbsp;/yyyy					
					<html:hidden property="answer(Object::Quote::inceptionDate)" styleId="inceptionDate"/>
				</td>
				</tr>
				<tr>
				 <td class="FormLabels" width="40%"><B>Underwriting Date:</B></td>
				<td class="TextMatter"  width="60%">
					<bean:define id="uwDate" name="QuoteDetail" property="answer(Object::Quote::uwDate)" />
					<%
						String uwstrDate=uwDate.toString();
						String uwyyyy="";
						String uwdd="";
						String uwmm="";
						if(!uwstrDate.equals(""))
						{
						uwmm= uwstrDate.substring(0,2);
						uwdd= uwstrDate.substring(3,5);
						uwyyyy= uwstrDate.substring(6,10);
						}
					%>
					<html:text property="answer(uwDateMM)" value="<%=uwmm %>" styleId="uwDateMM" styleClass="txtbox" maxlength="2" size="2" onkeyup="if(this.value.length==2) {this.form.uwDateDD.focus()}"/>&nbsp;/mm
					<html:text property="answer(uwDateDD)" value="<%=uwdd %>" styleId="uwDateDD" styleClass="txtbox" maxlength="2" size="2" onkeyup="if(this.value.length==2) {this.form.uwDateYY.focus()}"/>&nbsp;/dd
					<html:text property="answer(uwDateYY)" value="<%=uwyyyy %>" styleId="uwDateYY" styleClass="txtbox" maxlength="4" size="4"/>&nbsp;/yyyy					
					<html:hidden property="answer(Object::Quote::uwDate)" styleId="uwDate"/>
				</td>
				</tr>
				<tr>
				 <td class="FormLabels" width="40%"><B>PPO Effective Date:</B></td>
				<td class="TextMatter"  width="60%">
					<bean:define id="ppoEffDate" name="QuoteDetail" property="answer(Object::Quote::ppoEffDate)" />
					<%
						String ppoEffstrDate=ppoEffDate.toString();
						String ppoEffyyyy="";
						String ppoEffdd="";
						String ppoEffmm="";
						if(!ppoEffstrDate.equals(""))
						{
						ppoEffmm= ppoEffstrDate.substring(0,2);
						ppoEffdd= ppoEffstrDate.substring(3,5);
						ppoEffyyyy= ppoEffstrDate.substring(6,10);
						}
					%>
					<html:text property="answer(ppoEffDateMM)" value="<%=ppoEffmm %>" styleId="ppoEffDateMM" styleClass="txtbox" maxlength="2" size="2" onkeyup="if(this.value.length==2) {this.form.ppoEffDateDD.focus()}"/>&nbsp;/mm
					<html:text property="answer(ppoEffDateDD)" value="<%=ppoEffdd %>" styleId="ppoEffDateDD" styleClass="txtbox" maxlength="2" size="2" onkeyup="if(this.value.length==2) {this.form.ppoEffDateYY.focus()}"/>&nbsp;/dd
					<html:text property="answer(ppoEffDateYY)" value="<%=ppoEffyyyy %>" styleId="ppoEffDateYY" styleClass="txtbox" maxlength="4" size="4"/>&nbsp;/yyyy					
					<html:hidden property="answer(Object::Quote::ppoEffDate)" styleId="ppoEffDate"/>
				</td>
				</tr>
			</dmshtml:dms_isPresent>
		</dmshtml:dms_static_with_connector>
		</table>
		</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>








<tr>
<td colspan="6">
<table WIDTH="100%" ALIGN="left" cellspacing=0 cellpadding="0"
border="0">
<tr>
<td align="center" class="sectionhead">QUOTE PRODUCTS


</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>


<tr>
<td>
<table WIDTH="98%" ALIGN="left" cellspacing="0"
	cellpadding="0" border="0">
	
	<tr>
		<td class="sectionhead" align="center">Plan #</td>
		<td class="sectionhead" align="center">
		<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lost", "Rejected", "Offered"}%>" value="<%=paretQuoteStatus.toString()%>">
			Plan Change
		</dmshtml:dms_isPresent>
		</td>
		<td class="sectionhead" align="center">Rate Detail</td>
		<td class="sectionhead" align="center">Rate Detail PDF</td>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_WORKSHEET_EDIT"}%>' connector='or' negated="true">
			<td class="sectionhead" align="center">Work Sheet</td>
		</dmshtml:dms_static_with_connector>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="EMPLOYEE_ELECTION_AVAILABLE" 
			     property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
		<td class="sectionhead" align="center">Employee Elections</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		<td class="sectionhead" colspan="3" align="center">Monthly Premium</td>
	</tr>
 
	<%
		double totalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString());
		double lgparentQuoteFee1 = Double.parseDouble(parentQuoteFee1.toString());
		double lgparentQuoteFee2 = Double.parseDouble(parentQuoteFee2.toString());
		double adminFee =0;
	%>
	
 	<logic:present name="subQuotes" scope="request">
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">		
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<bean:define id="subQuoteProductId" name="aSubQuote" 	property="productId" />
		<bean:define id="subQuoteProductVerId" name="aSubQuote" 	property="productVerId" />
		<bean:define id="planNum" name="aSubQuote" 	property="quoteNumber" />
		<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
		
		<bean:define id="totalPremium" name="aSubQuote" 	property="totalPremium" />
		<bean:define id="fee1" name="aSubQuote" 	property="fee1" />
		<bean:define id="fee2" name="aSubQuote" 	property="fee2" />
		
		<%long riskId =planDetails.getPLResRiskPropertyId() ;
		String riskName =planDetails.getPLResRiskPropertyName() ;
		String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
		long riskTerritory =planDetails.getTerritory() ;
		String planState = planDetails.getStateCode();
		%>
		<tr>
			<td class="SearchResult">
				Plan &nbsp;<%=""+ planNum%>
			</td>

			<!-- #################################CHANGE PLAN############################### -->
			<td class="SearchResult">
			
			<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lost", "Rejected", "Offered"}%>" value="<%=paretQuoteStatus.toString()%>"> 
			<a href="../PlanChange.do?TabPanelName=Quote_Panel&answer(subQuoteId)=<%=""+subQuoteId%>&changePlan=yes&answer(Option::DefaultValue)=No&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(ownerId)=2&answer(userId)=<%=userId.toString()%>&answer(Plan::PlanNumber)=<%=""+subQuoteId%>&answer(State)=<%=""+planState %>&answer(Object::Risk::Teritory)=<%=""+riskTerritory%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&answer(Object::Quote::ProductId)=<%=subQuoteProductId%>&answer(Plan::ChangePlan)=YES&answer(RULE_OBJECT_ID)=<%=subQuoteProductId%>&answer(RULE_OBJECT_VER_ID)=<%=subQuoteProductVerId%>&answer(RULE_OBJECT_TYPE)=PRODUCT&answer(RULE_OBJECT_TYPE)=ELIGIBILITY_RULES&answer(ProductVerId)=<%=subQuoteProductVerId%>">Plan Change</a>

			</dmshtml:dms_isPresent>
			</td>
			<!-- #################################END CHANGE PLAN############################### -->
			
			<!-- #################################Rating Detail############################### -->
			<td class="SearchResult">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_WORKSHEET_EDIT"}%>' connector='or' negated="true">


						<a href="../GetRateIndicationAction.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&parentQuoteId=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=subQuoteProductId%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&answer(sortKey)=EMP_ID">Rating Detail</a>


				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_WORKSHEET_EDIT"}%>' connector='or' negated="false">


						<a href="../GetRateIndicationAction.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&parentQuoteId=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=subQuoteProductId%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&answer(sortKey)=EMP_ID">Rating Detail</a>

				</dmshtml:dms_static_with_connector>
			</td>

			<!-- #################################END Rating Detail############################### -->

			<td class="SearchResult">
			
				<dmshtml:dms_isPresent property="<%=new String[]{"Sold", "Lost", "Rejected"}%>" value="<%=paretQuoteStatus.toString()%>"> 

					<%if(subQuoteProductId.toString().equals("45")) {%>	
					<a href="../getPdf.do?TabPanelName=Quote_Panel&answer(FoFileName)=BasicCarePlan.fo&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&subQuoteId=<%=subQuoteId.toString()%>&answer(ownerId)=<%=""+ownerId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(agencyId)=<%=agencyId.toString()%>" target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Rate Detail PDF</a>
					<%} else {%>   
					<a href="../InMemoryPDF.go?TabPanelName=Quote_Panel&answer(DocumentType)=RATEINDICATION&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&subQuoteId=<%=subQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&Object::Customer::CustomerId=<%=customerId.toString()%>&answer(userName)=<%=fullName%>&answer(sortKey)=EMP_ID&answer(ownerId)=<%=""+ownerId%>" target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Rate Detail PDF</a>
										<%} %>	
			
				</dmshtml:dms_isPresent>
			</td>

				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_WORKSHEET_EDIT"}%>' connector='or' negated="true">
					<td class="SearchResult">
					
						<a	href="../GetUWWorkSheetAction.do?TabPanelName=Quote_Panel&answer(productId)=<%=""+subQuoteProductId %>&answer(productVerId)=<%=""+subQuoteProductVerId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Plan::CompositeRateFlag)=<%=compositeRate.toString()%>&answer(Object::PlanFactor::AdministrativeFee)=<%=Double.parseDouble(fee1.toString())%>&answer(modQuoteNumber)=<%=""+QuoteNumber%>&isCalculateAction=No&answer(customerNumber)=<%=EmpGrpNum.toString()%>">	Worksheet </a>
					</td>
				</dmshtml:dms_static_with_connector>			
			
				<dmshtml:dms_isPresent property='<%=new String[]{"Sold", "Lost", "Rejected"}%>' value="<%=paretQuoteStatus.toString()%>">
				
				
				<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="EMPLOYEE_ELECTION_AVAILABLE" 
			     property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			     <td class="SearchResult">	
					<a	href="../getEmployeeElections.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&parentQuoteId=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&subQuotePlanName=<%=subQuoteProductId%>&requestType=EmployeeElection">Employee Elections</a>
				 </td>	
				</dmshtml:isFeatureAvailableForProductRoleStatus>
				
				</dmshtml:dms_isPresent>

		<!--/logic:present--> 

		

	


	<td class="SearchResult" colspan="3" align="right">
		
		<%
		double lgtotalPremium=0.0;
		double lgfee1=0.0;
		double lgfee2=0.0;
		
		try  {lgtotalPremium=  Double.parseDouble(totalPremium.toString()) ;} catch (Exception ex) {}
		try  {lgfee1=  Double.parseDouble(fee1.toString()) ;} catch (Exception ex) {}
		try  {lgfee2=  Double.parseDouble(fee2.toString()) ;} catch (Exception ex) {}
	
		adminFee = Double.parseDouble(""+lgfee1);
		%>
		<dmshtml:CurrencyFormatTag format="<%=""+(lgtotalPremium)%>" />		
<!--/logic:present-->
</td>
</tr>
</logic:iterate>
</logic:present>
<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(""+prodId)%>" 
			featureName="Administrative_Fee" negated="true" 
			dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' 
			ownerId="<%=""+ownerId%>"  state="<%=""+State%>"  >	
	<tr>
		<td class="SearchResult" colspan="3"></td>
		<td class="SearchResult" colspan="3" align="left">Administrative Fee</td>
		<td class="SearchResult" align="right">
		<dmshtml:CurrencyFormatTag format="<%=""+adminFee%>" /> 
		</td>
	</tr>
</dmshtml:dms_HasFeature_Available_InProduct>	
<tr>
	<td class="SearchResult" colspan="3"></td>
	<td class="SearchResult" colspan="3" align="left"><strong>Total</strong></td>
	<td class="SearchResult" align="right">
	<dmshtml:CurrencyFormatTag format="<%=""+(totalParentQuotePremium+lgparentQuoteFee1+lgparentQuoteFee2)%>" />
	
	</td>
	</tr>
</table>
</td>
</tr>


		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
		<td><!--  --></td>
		</tr>
	</table>
	</td>
</tr>
								
		<tr>
			<td>
				<dmshtml:dms_isPresent property="<%=new String[]{"Submitted"}%>" value="<%=paretQuoteStatus.toString()%>"  negated="true">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SAVE_AFTER_SUBMIT_QUOTE"}%>' connector='or' negated="true">
						<html:submit value="Save" styleClass="sbttn" styleId="QuoteSummarySubmit"/>
					</dmshtml:dms_static_with_connector>
				</dmshtml:dms_isPresent>
				
				<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
					<html:submit value="Save" styleClass="sbttn" styleId="QuoteSummarySubmit" />
				</dmshtml:dms_isPresent>
			</td>
		</tr>
								<%--// /dmshtml:dms_static_with_connector--%>
	</table>
	
	

<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2"
	CELLPADDING="0">

	
	
	<%
		java.util.ArrayList empBasedPdfList = new java.util.ArrayList();
		String pdfPath = "/TotalPlan/QuotePDFs/"; //com.dms.util.Constants.getVersionedValueOf("QuotePDF_Path_Client");
		String xmlPath = "/TotalPlan/QuotePDFs/";
		
		String strQuoteNum = QuoteNumber.toString();
		String strQuoteSubNumber=QuoteSubNumber.toString();
		if(strQuoteSubNumber.length()>0) {
			strQuoteNum=strQuoteNum+"-"+strQuoteSubNumber;
		}
		
		{
			pdfList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path","TotalPlan\\QuotePDFs\\"+strQuoteNum);
			if (EmpGrpNum!=null && EmpGrpNum.length() !=0)
			{
				empBasedPdfList = com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path","TotalPlan\\QuotePDFs\\"+EmpGrpNum.toString()+"/"+strQuoteNum);
			}
		}
		
		java.util.ArrayList xmlList = new java.util.ArrayList();
		xmlList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path","TotalPlan\\QuotePDFs\\"+strQuoteNum+"/SoldQuotes");
		
	%>

	<tr>
		<td class="Error" COLSPAN="2">
		<% if((pdfList !=null && pdfList.size()>0) || (empBasedPdfList !=null && empBasedPdfList.size()>0)){ %>
		<ol>
			<% if((pdfList !=null && pdfList.size()>0)){ 
				for (int i=0; i<pdfList.size(); i++)  {
					String fileName=(String) pdfList.get(i);
					System.out.println(fileName);
					if(fileName.equalsIgnoreCase("SoldQuotes")){
						continue;
					}
					//to avoid listing of Rate_Indication Folder
					if(!(fileName.equalsIgnoreCase("RATE_INDICATION"))){
			 %>
			<li><a href="javascript:void(0);"
				onClick="javascript:window.open('<%=pdfPath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
			<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
				BORDER="0" ALT=""><%=fileName.toString()%> </a></li>
				<%} //end of if loop
				} //end of for loop
				} //end of if((pdfList !=null && pdfList.size()>0))
			if((empBasedPdfList !=null && empBasedPdfList.size()>0)){ 
				for (int j=0; j<empBasedPdfList.size(); j++)  {
					String fileName2=(String) empBasedPdfList.get(j);
					if(fileName2.equalsIgnoreCase("SoldQuotes")){
						continue;
					}				
			%>
			<li><a href="javascript:void(0);"
				onClick="javascript:window.open('<%=pdfPath%><%=EmpGrpNum.toString()%>/<%=strQuoteNum%>/<%=fileName2.toString()%>')">
			<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
				BORDER="0" ALT=""><%=fileName2.toString()%> </a></li>
				<%} //end of for loop
			} //end of if((empBasedPdfList !=null && empBasedPdfList.size()>0))
			%>
			</ol>
		<%}%>
		
		</td>
	</tr>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="true">
	<tr>
		<td class="MH" COLSPAN="2"> XML Files</td> </tr>
	<tr>
	
		<td class="Error" COLSPAN="2">
		<% if(!(xmlList.isEmpty())) { %>
		<ol>
			<% 
				String fileSaparator = "%5c";//java.io.File.separator;
				for (int e=0; e<xmlList.size(); e++)  {
				String xmlFile=(String) xmlList.get(e);
				String validateFileName=QuoteNumber.toString()+fileSaparator+"SoldQuotes"+fileSaparator+(String) xmlList.get(e);
			%>
			<li><a href="javascript:void(0);"
				onClick="javascript:window.open('<%=xmlPath%>/<%=QuoteNumber.toString()+"/SoldQuotes/"+xmlFile.toString()%>')">
			<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
				BORDER="0" ALT=""><%=xmlFile.toString()%> </a>&nbsp;
				<em style="{background-color: #336699;padding: 1 10;}"><a style="{color: #FFFFFF;}" href="/ValidateXMLFile.do?TabPanelName=Quote_Panel&fileName=<%=validateFileName.toString()%>" target="_new">Validate</a></em>
				&nbsp;
				<em style="{background-color: #336699;padding: 1 10;}"><a style="{color: #FFFFFF;}" href="javascript:void(0);" onClick="confirmFTP('/FTPUploadAction.do?fileName=<%=validateFileName.toString()%>')">Upload to FTP</a></em>
				</li>
			<%}%>
		</ol>
		<%} %>
		</td>
	</tr>
	</dmshtml:dms_static_with_connector>

</table>
	<html:hidden property="page" value="7" />
	<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
	<html:hidden property="answer(QuoteId)" value='<%=""+parentQuoteId%>' />
	<html:hidden property="answer(parentQuoteId)" value='<%=""+parentQuoteId%>' />
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />
	<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=""+agencyId%>' />
	<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>" />
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" /><html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value="<%=""+CompositeRate%>" />
	<html:hidden property="answer(Object::PlanFactor::UWRatingTierFactor)" value="<%=""+uwTierFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::MentalIllness)" value="<%=""+mentalIllnessFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SpeechPhyOcc)" value="<%=""+sppechPhyOccFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SubstanceAbuse)" value="<%=""+substanceAbuseFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" value="<%=""+discretionaryAdjDefaultFactor%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus%>" />
	<html:hidden property="answer(Object::Quote::MemberAssociation)" value="<%=""+memberAssociation%>" />
	<html:hidden property="answer(Object::PlanFactor::AdministrativeFee)" value="<%=""+administrativeFee%>" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

	<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" >
	<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value="<%=""+CompositeRate%>" />
	<html:hidden property="answer(Object::PlanFactor::UWRatingTierFactor)" value="<%=""+uwTierFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::MentalIllness)" value="<%=""+mentalIllnessFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SpeechPhyOcc)" value="<%=""+sppechPhyOccFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SubstanceAbuse)" value="<%=""+substanceAbuseFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" value="<%=""+discretionaryAdjDefaultFactor%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus%>" />
	
	</dmshtml:dms_isPresent> 

	<%if(!editableQuoteHeader) {%>
		<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="effDate"/>
		<html:hidden property="answer(Object::Quote::HelthHra)" value="<%=""+HelthHra%>" />		
		<html:hidden property="answer(Object::Quote::AreaNetWorkKey)" value="<%=""+AreaNetWorkKey%>" />
		<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DrugUWFactor)" value="<%=""+DrugUWFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value="<%=""+CompositeRate%>" />
	<html:hidden property="answer(Object::PlanFactor::UWRatingTierFactor)" value="<%=""+uwTierFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::MentalIllness)" value="<%=""+mentalIllnessFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SpeechPhyOcc)" value="<%=""+sppechPhyOccFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SubstanceAbuse)" value="<%=""+substanceAbuseFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" value="<%=""+discretionaryAdjDefaultFactor%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus%>" />
	
	<%}%>

	<%if(!modifyQuoteType) {%>		
	<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::Plan::CompositeRateFlag)" value="<%=""+CompositeRate%>" />
	<html:hidden property="answer(Object::PlanFactor::UWRatingTierFactor)" value="<%=""+uwTierFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::MentalIllness)" value="<%=""+mentalIllnessFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SpeechPhyOcc)" value="<%=""+sppechPhyOccFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::SubstanceAbuse)" value="<%=""+substanceAbuseFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DiscretionaryAdjDefaultFactor)" value="<%=""+discretionaryAdjDefaultFactor%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus%>" />
		<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
	<%}%>

	</td></tr></table>

</html:form>
