<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/QuoteSummary.js">
</SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/Common.js">
</SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>

<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request" />

<!-- ##########################VARIBLE DECLARATION ######################################### -->

<bean:define id="parentQuoteVerId" name="QuoteDetail" property="answer(Object::Quote::QuoteVerId)" scope="request" />
<bean:define id="prodId" name="QuoteDetail" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="ProductVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />

<bean:define id="customerId" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="QuoteDetail" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="quoteStartDate" name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" 
scope="request" />
<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<bean:define id="noOfMedicalEmployees" name="QuoteDetail" property="answer(Object::Quote::NoOfMedicalEmployees)"/> 
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="paretLockStatus" name="QuoteDetail" property="answer(Object::Quote::LockStatus)" />
<bean:define id="QuoteNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteNumber)" />
<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
<bean:define id="MedicalUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactor)" />
<bean:define id="agentId" name="QuoteDetail" property="answer(Object::QuoteCommission::AgentId)" scope="request" />

<bean:define id="MedicalUWFactorPrefer" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorPrefer)" />
<bean:define id="MedicalUWFactorStand" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorStand)" />
<bean:define id="MedicalUWFactorMax" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorMax)" />
<bean:define id="DrugUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactor)" />

<bean:define id="DrugUWFactorPrefer" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorPrefer)" />
<bean:define id="DrugUWFactorStand" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorStand)" />
<bean:define id="DrugUWFactorMax" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorMax)" />
<bean:define id="HelthHra" name="QuoteDetail" property="answer(Object::Quote::HelthHra)" />
<bean:define id="CompositeRate" name="QuoteDetail" property="answer(Object::Quote::CompositeRate)" />
<bean:define id="AreaNetWorkKey" name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKey)" />
<bean:define id="AreaNetWorkKeyDesc" name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKeyDesc)" />
<bean:define id="State" name="QuoteDetail" property="answer(Object::Quote::CustomerState)" />

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
<bean:define id="ProductFamilyId" name="QuoteDetail" property="answer(Object::Quote::ProductFamilyId)" />

<bean:define id="FirstSubQuoteId" name="QuoteDetail" property="answer(Object::Quote::FirstSubQuoteId)" />
<bean:define id="QuoteId" name="QuoteDetail" property="answer(Object::Quote::Id)" />
<bean:define id="policyNumber" name="QuoteDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />

<bean:define id="quoteName" name="QuoteDetail" property="answer(Object::Quote::QuoteName)" />
<bean:define id="quoteDesc" name="QuoteDetail" property="answer(Object::Quote::QuoteDesc)" />

<bean:define id="RenewalPolicyNo" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" />
<bean:define id="RenewalPolicyCompany" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" />
<bean:define id="RenewalSubmissionNumber" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" />
<%
String docSubQuoteVerId=""; 
String CustomerState = ""; 
String CustomerName = "";

%>
<html:form action="/SaveQuoteSummuryAction" styleId="frm" onsubmit="return validateFields()">
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
<%double lgTotalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString()); %>

<%long numberOfSubQuotes=0;%>
<%String EmpGrpNum="";%>
<%long lgNoOfMedicalEmployees = Long.parseLong(""+noOfMedicalEmployees);%>





<!--#######################################################################################-->

<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	<bean:define id="tempCustomerState" name="customerDetail1" property="customerState" scope="request" />	
	<bean:define id="tempCustomerName" name="customerDetail1" property="customerName" scope="request" />
	<%CustomerState = ""+tempCustomerState; 
	  CustomerName = ""+tempCustomerName; %>
</logic:present>

<!-- GET ALL PLAN DETAILS BY PARENT QUOTE ID -->
<%String docSubQuoteId=""; %>
	

<dmshtml:Get_All_Plan_HeaderDetails 
nameInSession="subQuotes" 
parentQuoteId='<%=""+parentQuoteId%>'
dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  
/>
<logic:present name="subQuotes" scope="request">
<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<%docSubQuoteId=""+subQuoteId;%>
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
<table>
<tr><td>
<div id="dialog1" style='display: none;'>

<div class="hd">Enter Your Notes Here</div>
<div class="bd">
<table cellpadding="1" cellspacing="0">
  	 <tr>
  	   <td> 
  	     <h6>Notes Description:</h6>
  	   </td>
       <td> 
         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
     </tr>
  	 <tr>
  	 <td>
  	   <h6>Notes:</h6>
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> 
  	</div> 
  	</td>
  	<tr>
  	<td width=50>&nbsp;</td>
  	<td align="right">
  		<html:button property="Save" value=" Save " styleClass="uibutton"  styleId="save" onmouseover="" />
  		<html:button property="Cancel" value="Cancel" styleClass="uibutton" styleId="cancel" />
  	</td>
  	</tr>
  </tr>
   
</table>
</div>
</div>

</td>
</tr>


</table>
<table WIDTH="99%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
	<td>
	<table WIDTH="99%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		
					
		<tr><td>
			<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
		</td></tr>
			
    	</table>
    	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			
			<tr>
				<td>
					<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp">
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
				
				<logic:present name="staleDataSubmissionMsgFormPolicyCreation" scope="request">
					<tr>
						<td class="Error">Please avoid using the Back/Refresh button.</td>
					</tr>
				</logic:present>
				
				<logic:present name="staleDataSubmissionMsgFormQuoteProposal" scope="request">
					<tr>
						<td class="Error">Please avoid using the Back/Refresh button.</td>
					</tr>
				</logic:present>
				<td>&nbsp;</td>			
			</tr>
			
	

<!--########################## MODIFY QUOTE START #########################################-->
	<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>">

		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress", "Submitted", "Sold", "Lost", "Rejected"}%>" value="<%=paretQuoteStatus.toString()%>">
			<tr><td>
			<table WIDTH="99%">
			<tr>
				<td class="TableColorStyle3" align=left>
					&nbsp;This Quote Is Locked  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="../ModifyQuoteConfirmAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(modQuoteId)=<%=""+parentQuoteId%>&answer(modQuoteNumber)=<%=""+QuoteNumber%>" title="Modify Quote"/> 
					<IMG SRC="../Images/modify.jpg" WIDTH="63" HEIGHT="16" BORDER="0" ALT="" onclick="submit_form ( )"></a>
				</td>
			</tr>
			</table>
			</td></tr>
		</dmshtml:dms_isPresent>
	</dmshtml:dms_isPresent>
<!--########################## MODIFY QUOTE END #########################################-->
<% if(numberOfSubQuotes < 1){ %>
	<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
    <tr>
    	<td class="Error" COLSPAN="2">
    		There is no plan associated to the Quote. Please add a plan to the Quote.
    	</td>
    </tr>
    <tr>
    	<td>&nbsp;
    	</td>
    </tr>
    <tr>	
		<td class="links" align="left" width="14%">
		
		<a href="../AddNewPlan1.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Plan::PlanNumber)=<%=""+(numberOfSubQuotes+1)%>&answer(Object::Quote::ProductId)=<%=prodId%>&answer(State)=<%=""+State%>&answer(Object::Quote::AreaNetWorkKeyDesc)=<%=""+AreaNetWorkKeyDesc%>&answer(Object::Quote::QuoteStartDate)=<%=""+quoteStartDate%>&answer(Object::Quote::primaryEntityId)=0&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(Object::Risk::RiskId)=1">Add Plan</a>
		</td>
	</tr>
	</dmshtml:dms_isPresent>
	
<%} if(numberOfSubQuotes > 0){ %>
<logic:present name="subQuotes" scope="request">
	
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		</logic:iterate>
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<bean:define id="subQuoteVerId" name="aSubQuote" 	property="quoteVerId" />
		<bean:define id="subQuoteProductId" name="aSubQuote" 	property="productId" />
		<bean:define id="subQuoteProductVerId" name="aSubQuote" 	property="productVerId" />
		<bean:define id="planNum" name="aSubQuote" 	property="quoteNumber" />
		<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
		<%long riskId =planDetails.getPLResRiskPropertyId() ;
		String riskName =planDetails.getPLResRiskPropertyName() ;
		String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
		long riskTerritory =planDetails.getTerritory() ;
		String planState = planDetails.getStateCode();
		String riskZone = planDetails.getZone();
		%>
			<%docSubQuoteVerId=""+subQuoteVerId;%>	
<tr>
	<td align="left">
		<table WIDTH="100%"  ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			
	<!-- ##################3 ADD PLAN ############################## -->		
		<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ADD_PLAN_AVAILABLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
	<td class="links" align="left" width="14%">
	<a
	href="../AddNewPlan1.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Plan::PlanNumber)=<%=""+(numberOfSubQuotes+1)%>&answer(Object::Quote::ProductId)=<%=prodId%>&answer(State)=<%=""+State%>&answer(Object::Quote::AreaNetWorkKeyDesc)=<%=""+AreaNetWorkKeyDesc%>&answer(Object::Quote::QuoteStartDate)=<%=""+quoteStartDate%>&answer(Object::Quote::primaryEntityId)=0&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(productStatus)=<%=""+productStatus%>&answer(Object::Risk::RiskId)=1">Add Plan</a>
	</td>
	</dmshtml:isFeatureAvailableForProductRoleStatus>
	</dmshtml:dms_isPresent>
	
		<!-- ##################3 ADD PLAN ############################## -->	
	
<!--########################## POLICY #########################################-->
      
		<%if((!policyNumber.toString().equals("")) && numberOfSubQuotes==1) {%>
			
				<td class="links" align="left" width="100px">
					<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>"> Policy</a>			
				</td>
				
		<%} %>	
		
		
<!--########################## POLICY #########################################-->


<!--########################## CREATE QUOTE PRAPOSAL #########################################-->
	
	<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">

		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="PROPOSAL_AVAILBLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td class="links" align="left" width="150px">
			<a href="../quote/CreateQuotePraposal.jsp?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ProductId)=<%=""+prodId%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=RenewalPolicyNo.toString()%>&answer(Object::QuoteAdditional::RenewalPolicyCompany)=<%=RenewalPolicyCompany.toString()%>&answer(Object::QuoteAdditional::RenewalPolicySubmission)=<%=RenewalSubmissionNumber.toString()%>">Create Quote Proposal</a>
		</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>

	</dmshtml:dms_isPresent>
	
<!--########################## CREATE QUOTE PRAPOSAL #########################################-->


<!--##########################SUBMIT LOST REJECT#########################################-->


	<logic:present name="subQuotes" scope="request">
		<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBMIT_AVAILABLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
		
			<td class="links" align="left" width="100px">
					<a href="../SubmitQuote.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ProductId)=<%=""+prodId%>&answer(ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(RULE_OBJECT_ID)=<%=""+prodId%>&answer(RULE_OBJECT_VER_ID)=<%=""+ProductVerId%>&answer(RULE_OBJECT_TYPE)=PRODUCT&answer(RULE_OBJECT_NAME)=APPLICATION&answer(MERGE_BEFORE)=YES&answer(MERGE_AFTER)=NO&answer(ASSERT_MAP_ENTRIES)=YES&answer(MODIFIED_FACT_MAP)=YES">Submit</a>
			</td>
		
			</dmshtml:isFeatureAvailableForProductRoleStatus>

	</dmshtml:dms_isPresent>				

		
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="LOST_AVAILABLE" 
			property='<%=new String[]{"In Progress","Offered","Bind Request","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
		<td class="links" align="left" width="100px">
			<a href="../LostQuote.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=RenewalPolicyNo.toString()%>&answer(Object::QuoteAdditional::RenewalPolicyCompany)=<%=RenewalPolicyCompany.toString()%>&answer(Object::QuoteAdditional::RenewalPolicySubmission)=<%=RenewalSubmissionNumber.toString()%>">Lost</a>
		</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		
	<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+QuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	<logic:present name="GetQuoteDetailByQuoteId" scope="request">
		<bean:define id="quoteName" name="GetQuoteDetailByQuoteId" property="quoteName" />
		<bean:define id="quoteDesc" name="GetQuoteDetailByQuoteId" property="quoteDesc" />
	</logic:present>
		
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ISSUE_AVAILABLE" 
			property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td class="links" align="left" width="100px">
				<a href="../quote/IssueBinder.jsp?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+docSubQuoteId%>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(state)=<%=""+planState%>&answer(subQuoteId)=<%= subQuoteId.toString()%>&answer(numberOfSubQuotes)=<%=""+numberOfSubQuotes %>&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&subQuoteVerId=<%=subQuoteVerId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>">Issue Binder</a>
			</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
				
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_REQUEST_AVAILABLE" 
			property='<%=new String[]{"Offered"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td class="links" align="left" width="100px">
				<a href="/quote/BindRequest.jsp?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(policyNumber)=<%=""%>&answer(parentPolicyId)=<%=""%>&answer(Object::Policy::ParentPolicyVerId)=<%=""%>">Bind Request</a>
				
				
			</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="true">
			<dmshtml:dms_isPresent property='<%=new String[]{"Sold"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<td class="links" align="left" width="100px">
					<a href="../XMLGeneratorForCustomer.do?TabPanelName=Quote_Panel&customerId=<%=customerId.toString()%>&xmlFileName=<%=QuoteNumber.toString()%>&quoteId=<%=parentQuoteId%>" target="_new">Export XML</a>
				</td>
			</dmshtml:dms_isPresent>
		</dmshtml:dms_static_with_connector>
		


	</logic:present>
		</tr>
<!--##########################SUBMIT LOST REJECT#########################################-->
		</table>
		</td>
	</tr>
</logic:present>
<tr><td>
	&nbsp;
</td></tr>

	

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
		 <td class="links"  width="60%"><html:text name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" size="10" style="font-family:Verdana;font-size:12px;"
						maxlength="10" styleClass="txtbox" styleId="reqeffdate1" onchange="return validateDate()"   />
						<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" styleId="referenceEffectiveDate" />
		</td>
		</tr> 
		<!-- ^^^^^^^^^ -->

				<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(""+prodId)%>" 
			featureName="No_HRA" negated="true" 
			dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' 
			ownerId="<%=""+ownerId%>"  state="<%=""+State%>"  >	

				<html:hidden property="answer(Object::Quote::HelthHra)" value="No" />

			</dmshtml:dms_HasFeature_Available_InProduct>

	<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(""+prodId)%>" 
			featureName="No_Composite" negated="true" 
			dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' 
			ownerId="<%=""+ownerId%>"  state="<%=""+State%>"  >	
		    <html:hidden property="answer(Object::Quote::CompositeRate)" value="No" />
		    
			</dmshtml:dms_HasFeature_Available_InProduct>
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
			<td class="TextMatter" width="60%"><html:text name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" size="10" style="font-family:Verdana;font-size:12px;"
						maxlength="10" styleClass="txtbox" styleId="reqeffdate"/></td>
		</tr>
	</dmshtml:dms_static_with_connector>
	 <dmshtml:dms_static_with_connector ruleName='privilage'  property='<%=new String[]{"MODIFY_QUOTE_TYPE"}%>' connector='or' negated="true">
		 
	 <dmshtml:dms_isPresent property='<%=new String[]{""}%>' value="<%=paretQuoteStatus.toString()%>" negated="false">
		 <%
			modifyQuoteType = true;
		 %>
			<tr>
				<td class="FormLabels"><B></B></td>
				<td class="links"> 					
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
				<td class="FormLabels"><B>Quote Notes:</B></td>
				<td>
					<html:textarea property="answer(Object::Quote::QuoteDesc)" name="QuoteDetail" rows="4" cols="50" styleId="QuoteDiscription" onkeyup="maxLengthTextArea()" />
				</td>
			</tr>
			
		<dmshtml:dms_isPresent property='<%=new String[]{"RENEWAL"}%>' value="<%=QuoteType.toString()%>" negated="true" >
			<tr id="RenewalPolicyNo" >
				<td class="FormLabels" width="40%"><B>Renewing Policy Number:</B></td>
				<td class="links"  width="60%">
				<html:text   name="QuoteDetail"  property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" size="30" style="font-family:Verdana;font-size:12px;border:0" styleClass="txtbox" styleId="renewalPolicy" readonly="true"  />
				</td>
			</tr>
			<tr id="RenewalPolicyCom" >
				<td class="FormLabels" width="40%"><B>Renewing Policy Company:</B></td>
				<td class="links"  width="60%">
				<html:text property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" name="QuoteDetail" size="30" style="font-family:Verdana;font-size:12px;border:0" styleClass="txtbox" styleId="renewalCompany" readonly="true" />
				</td>
			</tr>			
			<tr id="RenewalPolicySubm" >
				<td class="FormLabels" width="40%"><B>Renewal Policy Submission:</B></td>
				<td class="links"  width="60%">
				<html:text property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" name="QuoteDetail" size="30" style="font-family:Verdana;font-size:12px;border:0" styleClass="txtbox" styleId="renewalSubmission" readonly="true" />
				</td>
			</tr>	
		</dmshtml:dms_isPresent>	

	
	</table>
	</td>
	</tr>				

	</table>
	</td>
	</tr>

<!--##########################END EDIT QUOTE HEADER#########################################-->







	</td>
	</tr>
	<tr>
	<td align="left">
		<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr><td>
			<!-- *** -->
		</td></tr>
		
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
<td colspan="9">
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
	<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="PROPOSAL_AVAILBLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td class="sectionhead" align="left">Plan</td>
			</dmshtml:isFeatureAvailableForProductRoleStatus>
	</dmshtml:dms_isPresent>	
		<% if(paretQuoteStatus.equals("Bound") || paretQuoteStatus.equals("BOUND") || paretQuoteStatus.equals("Issued") || paretQuoteStatus.equals("ISSUED")){ %>	
		<td class="sectionhead" align="left">Policy</td>
		<td class="sectionhead" align="left">Policy Status</td>
	   <% } %>
		<td class="sectionhead" align="left">Risk Number</td>
		<td class="sectionhead" align="left">Risk Name</td>
		<td class="sectionhead" align="left">Change Coverages / Limits</td>
		<td class="sectionhead" align="left">Application</td>
		<td class="sectionhead" align="left">Application PDF</td>
		<% if(numberOfSubQuotes >1 && paretQuoteStatus.equals("Bind Request")){%>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ISSUE_AVAILABLE" 
			property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<td class="sectionhead" align="left">Preview Binder PDF</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>		
		<% } %>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS" 
			property='<%=new String[]{"In Progress","Offered","Bind Request","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<td class="sectionhead" align="left">Schedule Of Forms</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		<td class="sectionhead" align="left">UW Work Sheet</td>
		
	</tr>

	<%
		double totalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString());
		double lgparentQuoteFee1 = Double.parseDouble(parentQuoteFee1.toString());
		double lgparentQuoteFee2 = Double.parseDouble(parentQuoteFee2.toString());
	%>
	<logic:present name="subQuotes" scope="request">
	
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<bean:define id="subQuoteVerId" name="aSubQuote" 	property="quoteVerId" />
		<bean:define id="subQuoteProductId" name="aSubQuote" 	property="productId" />
		<bean:define id="subQuoteProductVerId" name="aSubQuote" 	property="productVerId" />
		<bean:define id="planNum" name="aSubQuote" 	property="quoteNumber" />
		<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
		<bean:define id="subQuoteStatus" name="aSubQuote" 	property="quoteStatus" />
				
		<%long riskId =planDetails.getPLResRiskPropertyId() ;
		String riskName =planDetails.getPLResRiskPropertyName() ;
		String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
		long riskTerritory =planDetails.getTerritory() ;
		String planState = planDetails.getStateCode();
		String riskZone = planDetails.getZone();		
		%>
		<tr>
			
			
			<!-- #################################CHANGE PLAN START ############################### -->
<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">			
			<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="PROPOSAL_AVAILBLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
	
			<td class="SearchResult" width="80px">
			
				<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
					<a href="../PlanChangeQuoteAction.do?TabPanelName=Quote_Panel&changePlan=yes&answer(State)=<%=""+planState %>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=""+RenewalPolicyNo %>&answer(Object::QuoteAdditional::RenewalPolicyCompany)=<%= ""+RenewalPolicyCompany %>&answer(Object::QuoteAdditional::RenewalPolicySubmission)=<%=""+RenewalSubmissionNumber %>&answer(Object::Risk::Teritory)=<%=""+riskTerritory%>&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=0&formName=form::ADDQUOTEDETAILSALLRISK_<%=ownerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=parentQuoteId.toString() %>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=parentQuoteVerId.toString() %>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(Object::Quote::OwnerId)=<%=""+ownerId%>&answer(userId)=<%=userId.toString()%>&answer(Plan::PlanNumber)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteName)=<%=""+quoteName%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::ProductId)=<%=subQuoteProductId%>&answer(Object::Risk::RiskId)=1">Plan Change</a> 
				</dmshtml:dms_isPresent>
			
			</td>
			</dmshtml:isFeatureAvailableForProductRoleStatus>
			</dmshtml:dms_isPresent>
			<!-- #################################CHANGE PLAN END ############################### -->			
		<!-- -------------------------------Policy --------------------------------- -->
		<% if(paretQuoteStatus.equals("Bound") || paretQuoteStatus.equals("BOUND") || paretQuoteStatus.equals("Issued") || paretQuoteStatus.equals("ISSUED")){ %>	
		
		<dmshtml:GetPolicyNumber  nameInSession="PolicyNumber" ownerId='<%=""+ownerId %>' parentQuoteId='<%=Long.parseLong(""+parentQuoteId) %>' subQuoteId ='<%=Long.parseLong(""+subQuoteId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="PolicyNumber" scope="request">
			
					<% com.dms.ejb.data.QuestionHashMap policyNum = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("PolicyNumber"); 
					     String policyNo = policyNum.getString("policyNumber");
					     String PolicyStatus = policyNum.getString("PolicyStatus");
					%>
			        <%if(!policyNum.equals("")) {%>
						
							<td class="links" align="left" width="100px">
								<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=policyNo%>"> <%=policyNo%></a>			
							</td>
							<td class="SearchResult" ALIGN="center" style='color: BLUE'><%= PolicyStatus%>
							</td>
							
					<%} %>	
		
        </logic:present>
		<% } %>
	<!-- -------------------------------Policy --------------------------------- -->

			<!-- ################################# RISK NUMBER START ############################### -->
			<td class="SearchResult" ALIGN="center" >
				<a href="../EditRisk1.do?answer(TabPanelName)=Insured_Panel&TabPanelName=Insured_Panel&answer(Object::Customer::State1)=<%=""+CustomerState%>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ResProperty::ResPropertyId)=<%=""+riskId%>&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=<%=""+riskTerritory %>&answer(showOnetTab)=Y&answer(state)=<%=""+planState%>&answer(zone)=<%=""+riskZone%>"><%=""+riskNumber%></a>							
			</td>
			<!-- ################################# RISK NUMBER END ############################### -->



			<!-- ################################# RISK NAME START ############################### -->
			<td class="SearchResult">
				<a href="../EditRisk1.do?answer(TabPanelName)=Insured_Panel&TabPanelName=Insured_Panel&answer(Object::Customer::State1)=<%=""+CustomerState%>&answer(Object::Risk::ResProperty::ResPropertyId)=<%=""+riskId%>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ResProperty::CustomerId)=<%= customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=<%=""+riskTerritory %>&answer(showOnetTab)=Y&answer(state)=<%=""+planState%>&answer(zone)=<%=""+riskZone%>"><%=""+riskName%></a>
			</td>
			<!-- ################################# RISK NAME END ############################### -->
			<%String IsApplicationDisabled="Y";%>
			<%String IsOptionDisabled="Y";%>
			
			<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%IsOptionDisabled="N";%>
						<%IsApplicationDisabled="N";%>
			</dmshtml:dms_isPresent>
			<dmshtml:dms_isPresent property="<%=new String[]{"Submitted"}%>" value="<%=paretQuoteStatus.toString()%>"  negated="true">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SAVE_AFTER_SUBMIT_QUOTE"}%>' connector='or' negated="true">
						<%IsOptionDisabled="N";%>
						<%IsApplicationDisabled="N";%>
					</dmshtml:dms_static_with_connector>
			</dmshtml:dms_isPresent>
			<td class="SearchResult">
			
<a href="../PlanChangeV2.do?TabPanelName=Quote_Panel&answer(IsOptionDisabled)=<%=""+IsOptionDisabled%>&changePlan=yes&answer(Object::Risk::Teritory)=<%=""+riskTerritory%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(userId)=<%=userId.toString()%>&answer(Plan::PlanNumber)=<%=""+subQuoteId%>&answer(Object::Quote::ProductId)=<%=subQuoteProductId%>&answer(Option::DefaultValue)=No&answer(ProductId)=<%=""+prodId%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(customerId)=<%=""+customerId%>">Coverages and Limits</a>

			</td>
			
			<td class="SearchResult">
			
				<a href='../DisplyApplication.do?answer(TabPanelName)=Quote_Panel&TabPanelName=Quote_Panel&answer(showOneTabAtTime)=N&answer(IsSubApplicationCoveredByForm)=Yes&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled%>&answer(objectId)=<%=""+prodId%>&answer(objectVerId)=<%=""+ProductVerId%>&answer(objectName)=PRODUCT&answer(applicationType)=RISK&answer(applicationSubType)=&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Risk::ResProperty::ResPropertyId)=<%=""+riskId %>&answer(RiskId)=<%=""+riskId %>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&RiskId=<%=""+riskId %>&answer(FamilyId)=<%=ProductFamilyId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&OwnerId=<%=ownerId.toString()%>&answer(State)=<%=""+planState%>&answer(Object::Customer::State1)=<%=""+CustomerState%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(riskTerritory)=<%=""+riskTerritory%>&answer(zone)=<%=""+riskZone%>'>Application</a>				

			</td>
			
			<!-- ################################# Application PDF Start ############################### -->
						
			<td class="SearchResult">			
					<a href='../ApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteStatus)=<%=paretQuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
			</td>
			
			
			<!-- ################################# Application PDF End ############################### -->

<!-- ################################# Preview Binder PDF Start ############################### -->
			<% if(numberOfSubQuotes >1 && paretQuoteStatus.equals("Bind Request")) {%>		
			<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ISSUE_AVAILABLE" 
			property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			
			<td class="SearchResult">			
					<a id="gotch" href='../PreviewBinderPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+parentQuoteId%>&answer(subQuoteId)=<%= ""+subQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%> &answer(isPreview)=<%=true%>'" target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Binder PDF</a>	
			</td>
			</dmshtml:isFeatureAvailableForProductRoleStatus>
			<% } %>
			
			<!-- ################################# Preview Binder PDF End ############################### -->

			<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS" 
			property='<%=new String[]{"In Progress","Offered","Bind Request","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				
				<td class="SearchResult">			
					<a href="../GetDocumentList.do?TabPanelName=Quote_Panel&answer(DocumentType)=ISSUANCE&answer(parentQuoteId)=<%= ""+parentQuoteId%>&answer(subQuoteId)=<%= ""+subQuoteId%>&answer(subQuoteVerId)=<%= ""+subQuoteVerId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(ProductId)=<%=""+prodId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(State)=<%=""+planState%>">Schedule of Forms</a>
				</td>
			
			</dmshtml:isFeatureAvailableForProductRoleStatus>


			<td class="SearchResult">

				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_WORKSHEET_EDIT"}%>' connector='or' negated="true">
				
						<a	href="../GetUWWorkSheetAction.do?TabPanelName=Quote_Panel&answer(productId)=<%=""+subQuoteProductId %>&answer(productVerId)=<%=""+subQuoteProductVerId %>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(customerNumber)=<%=EmpGrpNum.toString()%>&answer(modQuoteNumber)=<%=""+QuoteNumber%>&answer(state)=<%=""+planState%>">Worksheet </a>

				</dmshtml:dms_static_with_connector>	

			
			</td>

        
		

			
	


	
		<bean:define id="totalPremium" name="aSubQuote" 	property="totalPremium" />
		<bean:define id="fee1" name="aSubQuote" 	property="fee1" />
		<bean:define id="fee2" name="aSubQuote" 	property="fee2" />
		<%
		double lgtotalPremium=0.0;
		double lgfee1=0.0;
		double lgfee2=0.0;
		
		try  {lgtotalPremium=  Double.parseDouble(totalPremium.toString()) ;} catch (Exception ex) {}
		try  {lgfee1=  Double.parseDouble(fee1.toString()) ;} catch (Exception ex) {}
		try  {lgfee2=  Double.parseDouble(fee2.toString()) ;} catch (Exception ex) {}
		%>
		
		
<!--/logic:present-->

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
		<dmshtml:CurrencyFormatTag format="<%=""+(lgparentQuoteFee1)%>" /> 
		</td>
	</tr>
</dmshtml:dms_HasFeature_Available_InProduct>	

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
	
	

<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

<dmshtml:getPDFRelativePath nameInSession="pdfDestinationPath" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	<logic:present name="pdfDestinationPath" scope="request">
		<bean:define id="PDFDestinationFilePath" name="pdfDestinationPath" scope="request" />
	
		<% String strQuoteSubNumber=QuoteSubNumber.toString(); %>
			 
			<%
				java.util.ArrayList empBasedPdfList = new java.util.ArrayList();		
				String xmlPath = "";		
				String strQuoteNum = QuoteNumber.toString();
				//String pdfDestinationFilePath = "";
				//pdfDestinationFilePath = com.dms.util.Constants.getVersionedValueOf("PDFDestinationFilePath_"+ownerId);
		   
				if(strQuoteSubNumber.length()>0) {
					strQuoteNum=strQuoteNum+"-"+strQuoteSubNumber;
				}
				{			
					pdfList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+strQuoteNum);
					if (EmpGrpNum!=null && EmpGrpNum.length() !=0)
					{
						empBasedPdfList = com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+EmpGrpNum.toString()+"/"+strQuoteNum);
						
					}
				}
				
				java.util.ArrayList xmlList = new java.util.ArrayList();
				xmlList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+strQuoteNum+"/SoldQuotes");
				
				
			%>
		
			<tr>
				<td class="Error" COLSPAN="2">
				<% if((pdfList !=null && pdfList.size()>0) || (empBasedPdfList !=null && empBasedPdfList.size()>0)){ %>
				<ol>
					<% if((pdfList !=null && pdfList.size()>0)){ 
						for (int i=0; i<pdfList.size(); i++)  {
							String fileName=(String) pdfList.get(i);
							if(fileName.equalsIgnoreCase("SoldQuotes")){
								continue;
							}
					 %>
					<li><a href="javascript:void(0);"
						onClick="javascript:window.open('<%=PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
					<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
						BORDER="0" ALT=""><%=fileName.toString()%> </a></li>
						<%} //end of for loop
						} //end of if((pdfList !=null && pdfList.size()>0))
					if((empBasedPdfList !=null && empBasedPdfList.size()>0)){ 
						for (int j=0; j<empBasedPdfList.size(); j++)  {
							String fileName2=(String) empBasedPdfList.get(j);
							if(fileName2.equalsIgnoreCase("SoldQuotes")){
								continue;
							}				
					%>
					<li><a href="javascript:void(0);"
						onClick="javascript:window.open('<%=PDFDestinationFilePath%><%=EmpGrpNum.toString()%>/<%=strQuoteNum%>/<%=fileName2.toString()%>')">
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
				<em style="{background-color: #336699;padding: 1 10;}"><a style="{color: #FFFFFF;}" href="/ValidateXMLFile.do?fileName=<%=validateFileName.toString()%>" target="_new">Validate</a></em>
				&nbsp;
				<em style="{background-color: #336699;padding: 1 10;}"><a style="{color: #FFFFFF;}" href="javascript:void(0);" onClick="confirmFTP('/FTPUploadAction.do?fileName=<%=validateFileName.toString()%>')">Upload to FTP</a></em>
				</li>
			<%}%>
		</ol>
		<%} %>
		</td>
	</tr>
	</dmshtml:dms_static_with_connector>
	</logic:present>
<%} %>
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
	<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>" styleId="quoteStatustemp" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
	
	<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" >
	<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DrugUWFactor)" value="<%=""+DrugUWFactor%>" />
	</dmshtml:dms_isPresent>

	<%if(!editableQuoteHeader) {%>
		<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="effDate"/>
		<html:hidden property="answer(Object::Quote::HelthHra)" value="<%=""+HelthHra%>" />
		<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=""+CompositeRate%>" />
		<html:hidden property="answer(Object::Quote::AreaNetWorkKey)" value="<%=""+AreaNetWorkKey%>" />
		<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DrugUWFactor)" value="<%=""+DrugUWFactor%>" />
	<%}%>

	<%if(!modifyQuoteType) {%>		
		<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
	<%}%>
	<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
	</td></tr></table>
	<html:hidden property="answer(Object::Quote::PolicyNumber)" value="<%=""+policyNumber%>" />
	
	<html:hidden property="answer(AgentId)" value="<%=""+policyNumber%>" />
	
</html:form>
  <table width="60%">
  	<tr><td>&nbsp;</td></tr>
	<tr>
	<td width="40%" rowspan="1">
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SENT_EMAIL"}%>' connector='or' negated="true">

			<jsp:include page="../email/DisplayEmailList.jsp">
				<jsp:param name="answer(Object::Notification::Email::ObjectId)" value="<%=""+parentQuoteId%>" />
				<jsp:param name="answer(Object::Notification::Email::ObjectVerId)" value="<%=""+parentQuoteVerId%>" />
				<jsp:param name="answer(Object::Notification::Email::UserName)" value="<%=""+userId%>" />
				<jsp:param name="answer(Object::Notification::Email::SubQuoteVerId)" value="<%=""+docSubQuoteVerId%>" />
				<jsp:param name="answer(Object::Notification::Email::QuoteStatus)" value="<%=paretQuoteStatus %>" />
				<jsp:param name="answer(Object::Notification::Email::EndorsementStatusFlag)" value="NO" />
				<jsp:param name="answer(Object::Notification::UserDetail::Email)" value="<%=""+email%>" />
  				<jsp:param name="answer(Object::Notification::UserDetail::RoleName)" value="<%=""+roleName%>" />
  				<jsp:param name="answer(Object::Notification::Email::QuoteNumber)" value="<%=QuoteNumber%>" />
				<jsp:param name="answer(Object::Notification::Email::QuoteSubNumber)" value="<%=QuoteSubNumber%>" />
  				<jsp:param name="answer(Object::Notification::Email::PolicyNumber)" value="<%=""+policyNumber%>" />
  				<jsp:param name="answer(Object::Notification::Email::ObjectType)" value="QUOTE" />
  				<jsp:param name="answer(Object::Notification::Email::InsuredName)" value="<%=""+CustomerName %>" />
		    </jsp:include>
		</dmshtml:dms_static_with_connector>
		</td>
		 
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_NOTES"}%>' connector='or' negated="true">

			<jsp:include page="../notes/DairyNotes.jsp">
				<jsp:param name="answer(Object::Notes::ObjectId)" value="<%=""+parentQuoteId%>" />
				<jsp:param name="answer(Object::Notes::ObjectVerId)" value="<%=""+parentQuoteVerId%>" />
				<jsp:param name="answer(Object::Notes::ObjectType)" value="QUOTE" />
				<jsp:param name="answer(Object::Notes::UserName)" value="<%=""+userId%>" />
				<jsp:param name="answer(Object::Notes::UserRole)" value="<%=""+customerId%>" />
			</jsp:include>
			</dmshtml:dms_static_with_connector>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
    	<tr>
	    <td>
	    	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTACHMENT"}%>' connector='or' negated="true">

			  <jsp:include page="../attachment/Attachment.jsp">
			  <jsp:param name="answer(Object::Attachment::ObjectId)" value="<%=""+parentQuoteId%>" />
			  <jsp:param name="answer(Object::Attachment::ObjectVerId)" value="<%=""+parentQuoteVerId%>" />
			  <jsp:param name="answer(Object::AttachmentObjectLink::ObjectType)" value="QUOTE" />
			  </jsp:include>
		  </dmshtml:dms_static_with_connector>
	  </td>
  </tr>
</table>

<Script type="text/javascript">
	
 var formElement = document.forms[0];	
 var status = formElement.quoteStatustemp.value;
 
 if(status=="In Progress") {
	 formElement.reqeffdate.readOnly=false;
	 
 } else {
 	formElement.reqeffdate.readOnly=true;
 	formElement.reqeffdate.style.border = "0px solid #000000";
 	
 }		

</script>



