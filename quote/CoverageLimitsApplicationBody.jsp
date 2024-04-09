<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="com.dms.common.ObjectDescriptor"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ClassHazards.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ClassBenefits.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/AddOrEditAircraft.js"></script>
<script type="text/javascript">
var flag = 0;
var isSpecificValidationNeeded = false;
var url1 = "" ;
</Script>
		
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CoveragesLimits.js"></script>
<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request" />

<bean:define id="prodId" name="QuoteDetail" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="ProductVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />

<bean:define id="customerId" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="QuoteDetail" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(ownerIdfrmjsp)" value='<%=ownerId+"" %>' styleId="ownerIdfrmjsp" />

<bean:define id="quoteStartDate" name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" 
scope="request" />
<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<bean:define id="noOfMedicalEmployees" name="QuoteDetail" property="answer(Object::Quote::NoOfMedicalEmployees)"/> 
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
<html:hidden styleId="paretQuoteStatus" property="answer(Object::Quote::QuoteStatus)" value='<%=""+paretQuoteStatus%>' />
<bean:define id="paretLockStatus" name="QuoteDetail" property="answer(Object::Quote::LockStatus)" />
<bean:define id="QuoteNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteNumber)" />
<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
<bean:define id="MedicalUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactor)" />
<bean:define id="agentId" name="QuoteDetail" property="answer(Object::QuoteCommission::AgentId)" scope="request" />
<bean:define id="paymentPlan" property="answer(Object::Quote::PaymentPlan)" name="QuoteDetail"  />


<bean:define id="stateCode" property="answer(Object::Quote::PaymentPlan)" name="QuoteDetail"  />
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
<html:hidden styleId="QuoteId" property="answer(Object::Quote::Id)" value='<%=""+QuoteId%>' />
<bean:define id="policyNumber" name="QuoteDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="ObjectId" name="QuoteDetail" property="answer(Object::Quote::Id)" />

<bean:define id="quoteName" name="QuoteDetail" property="answer(Object::Quote::QuoteName)" />
<bean:define id="quoteDesc" name="QuoteDetail" property="answer(Object::Quote::QuoteDesc)" />

<bean:define id="submissionId" name="QuoteDetail" property="answer(Object::Quote::SubmissionId)"  /> 
<bean:define id="submissionVerId" name="QuoteDetail" property="answer(Object::Quote::SubmissionVerId)" /> 

<bean:define id="RenewalPolicyNo" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" />
<bean:define id="RenewalPolicyCompany" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" />
<bean:define id="RenewalSubmissionNumber" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" />
<bean:define id="companyPaperCode"  name="QuoteDetail" property="answer(Object::Company::Paper::CompanyPaperCode)" />
<%String parentQuoteVerId = ""; 
String quoteNum1 = "";
System.out.println("parentQuoteId :: :: "+parentQuoteId);%>
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />
	<logic:present name="parentQuoteDetail" scope="request">
			<bean:define id="paretQuoteVerId" name="parentQuoteDetail" property="quoteVerId"/>
			<bean:define id="quoteNumber1" name="parentQuoteDetail" property="quoteNumber"/>
			<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
			<%parentQuoteVerId = ""+paretQuoteVerId; 
			quoteNum1 =""+quoteNumber1; %>
	</logic:present>
<%String docSubQuoteVerId=""; 
String CustomerState = ""; 
String CustomerName = "";
String subQuoteProductId1 = "";
String pilotIncluded = "N";
%>


<%!		
String strSubQuoteId1 = ""; 
String strSubQuoteVerId1="";
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


<%String strReason="";%>
<bean:define id="RejectReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::RejectedNotes)" scope="request" />
<bean:define id="LostReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LostNotes)" scope="request" />
<bean:define id="LapseReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LapseReason)" scope="request" />
<bean:define id="LapseNotes" name="QuoteDetail" property="answer(Object::QuoteAdditional::LapseNotes)" scope="request" />



<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>

<%if(fname.toString()=="" && lname.toString()==""){
	fullName = userId.toString();
} else {
	fullName = fname+ " "+ lname;
}%>
<%double lgTotalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString()); %>

<%long numberOfSubQuotes=0;%>
<%String EmpGrpNum="";%>
<%long lgNoOfMedicalEmployees = Long.parseLong(""+noOfMedicalEmployees);%>
<logic:present name="customerDetail1" scope="request">
	<bean:define id="tempCustomerState" name="customerDetail1" property="customerState" scope="request" />	
	<bean:define id="tempCustomerName" name="customerDetail1" property="customerName" scope="request" />
	<%CustomerState = ""+tempCustomerState;
	CustomerName = ""+tempCustomerName;
	%>
</logic:present>
<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>	
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
	<html:hidden property="answer(CustomerName)" value='<%=CustomerName+""%>' styleId="CustomerName" />
<html:hidden property="answer(custState)" value='<%=detail.getCustomerState()%>' styleId="custState" />
<html:hidden property="answer(custCity)" value='<%=detail.getMCity()%>' styleId="custCity" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMCounty()%>' styleId="custCounty" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMZip()%>' styleId="custZip" />
<html:hidden property="answer(custStName)" value='<%=detail.getStreetName()%>' styleId="custStName" />
<html:hidden property="answer(custStNo)" value='<%=detail.getStreetNumber()%>' styleId="custStNo" />
<html:hidden property="answer(custAdd2)" value='<%=detail.getMAddress2()%>' styleId="custAdd2" />
<html:hidden property="answer(custAdd1)" value='<%=detail.getMAddress1()%>' styleId="custAdd1" />
	
</logic:present>


<%String docSubQuoteId=""; %>
<%String subQuoteId1 = ""; %>
<dmshtml:GetSubmissionDetailByQuoteId nameInSession="submissionDetailByQuoteId" quoteId="<%=Long.parseLong(parentQuoteId.toString())%>" ownerId='<%=Long.parseLong(ownerId.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="submissionDetailByQuoteId" scope="request">
		<bean:define id="subDetailMap" name="submissionDetailByQuoteId" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		<bean:define id="subId" name="subDetailMap" property="Object::Submission::SubmissionId" />
		<bean:define id="subVerId" name="subDetailMap" property="Object::Submission::SubmissionVerId" />
		<bean:define id="custId" name="subDetailMap" property="Object::Submission::CustomerId" />
			<logic:greaterThan name="subId" value="0">
				<logic:greaterThan name="subVerId" value="0">
					<logic:greaterThan name="custId" value="0">		
						
					</logic:greaterThan>
				</logic:greaterThan>
			</logic:greaterThan>
	</logic:present>	
<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+parentQuoteId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
<logic:present name="subQuotes" scope="request">
<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<%docSubQuoteId=""+subQuoteId;%>
<%numberOfSubQuotes=subQuoteArr.size();%>	

<%subQuoteId1 = ""+subQuoteId;%>
</logic:iterate>											
</logic:present>
<html:hidden property="answer(Object::Quote::subQuoteId1)" value='<%=""+subQuoteId1 %>' styleId="subQuoteId11"/>
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
<bean:define id="custId" name="subDetailMap" property="Object::Submission::CustomerId" />
<!--  <td class="links" align="left" width="16%"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>" title="Click to go to Master Insured Record" class="button2" style="width:190px" />Go to Insured Master Record</a> </td>-->

	<logic:present name="subQuotes" scope="request">
		
		<!-- <td  align="left" width="10%">
			 	<a  href="../CopyQuoteCL.do?TabPanelName=Quote_Panel&forwardKey=COPY_QUOTE3.0&PageType=COPY_QUOTE_SUMMARY&quoteId=<%=""+parentQuoteId%>&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&parentQuoteVerId=<%=""+parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Customer::State)=<%=""+State %>"  class="button2" style="width:100px"/> Copy Quote</a>
			</td>-->
		
			
	</logic:present>

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
		<%strSubQuoteId1 = ""+subQuoteId;
		strSubQuoteVerId1 = ""+subQuoteVerId;
		long riskId =planDetails.getPLResRiskPropertyId() ;
		String riskName =planDetails.getPLResRiskPropertyName() ;
		String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
		long riskTerritory =planDetails.getTerritory() ;
		String planState = planDetails.getStateCode();
		String riskZone = planDetails.getZone();		
		%>
	
		
		<tr>		
		<% if(paretQuoteStatus.equals("Bound") || paretQuoteStatus.equals("BOUND") || paretQuoteStatus.equals("Issued") || paretQuoteStatus.equals("ISSUED")){ %>	
		
		<dmshtml:GetPolicyNumber  nameInSession="PolicyNumber" ownerId='<%=""+ownerId %>' parentQuoteId='<%=Long.parseLong(""+parentQuoteId) %>' subQuoteId ='<%=Long.parseLong(""+subQuoteId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="PolicyNumber" scope="request">
			
					<% com.dms.ejb.data.QuestionHashMap policyNum = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("PolicyNumber"); 
					     String policyNo = policyNum.getString("policyNumber");
					     String PolicyStatus = policyNum.getString("PolicyStatus");
					%>
			        <%if(!policyNum.equals("")) {%>							
					<%} %>	
		
        </logic:present>
		<% } %>


		<%String IsApplicationDisabled="Y";%>
			<%String IsOptionDisabled="Y";%>
		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
					<%IsOptionDisabled="N";%>
					<%IsApplicationDisabled="N";%>
		</dmshtml:dms_isPresent>
		<dmshtml:dms_isPresent property="<%=new String[]{"Referred","Submitted"}%>" value="<%=paretQuoteStatus.toString()%>"  negated="true">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SAVE_AFTER_SUBMIT_QUOTE"}%>' connector='or' negated="true">
					<%IsOptionDisabled="N";%>
					<%IsApplicationDisabled="N";%>
				</dmshtml:dms_static_with_connector>
		</dmshtml:dms_isPresent>
		<html:hidden styleId="IsOptionDisabled" property="answer(IsOptionDisabled)" value="<%=""+IsOptionDisabled %>"/>
		<html:hidden property="Object::Application::ISApplicationDisabled" value='<%=""+IsApplicationDisabled %>' styleId="IsApplicationDisabled"/>
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
		</logic:iterate>
</logic:present>
<html:hidden property="answer(Object::UserDetail::email)" value='<%=""+email%>' styleId="email"/>
	<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
	<html:hidden property="answer(Object::Notification::Email::ObjectType)" value="QUOTE" styleId="EmailType"/>
	<html:hidden property="answer(Object::Quote::QuoteSubNumber)" value='<%=""+QuoteSubNumber%>' styleId="QuoteSubNumber"/>
	<html:hidden property="page1" value='<%"7" %>' />
	<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
	<html:hidden property="answer(QuoteId)" value='<%=""+parentQuoteId%>' />
	<html:hidden property="answer(parentQuoteId)" value='<%=""+parentQuoteId%>' />	
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />
	<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId_hidden" value='<%=""+agencyId%>' />
	<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>" />
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
	<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>" styleId="quoteStatustemp" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus%>" />
	<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
	<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%= ""+ProductVerId%>" />
	<html:hidden property="answer(isUpdated)" value="Y" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>" styleId="Quote"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>" styleId="QuoteManagement"/>
	<html:hidden property="answer(pagename)" value="Quote summary" />
	<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId %>" />
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
	
	
	<html:hidden property="answer(Object::Quote::PolicyNumber)" value="<%=""+policyNumber%>" styleId="policyNumber"/>
	<html:hidden property="answer(SubjectivityParentObjectType)" value="QUOTE" styleId="SubjectivityParentObjectType" />
	<html:hidden property="answer(AgentId)" value="<%=""+policyNumber%>" />
	<html:hidden property="answer(Object::Quote::CustomerId1)" value='<%=""+customerId%>' styleId="customerId" />
	<html:hidden property="answer(Object::Quote::agencyId1)" value='<%=""+agencyId%>' styleId="agencyId" />
	<html:hidden property="answer(Object::Quote::prodId1)" value='<%=""+prodId%>' styleId="prodId" />
	<html:hidden property="answer(Object::Quote::ProductVerId1)" value='<%=""+ProductVerId%>' styleId="ProductVerId" />
	<html:hidden property="answer(Object::Quote::GroupId1)" value='<%=""+GroupId%>' styleId="GroupId" />
	<html:hidden property="answer(Object::Quote::ownerId1)" value='<%=""+ownerId%>' styleId="ownerId" />
	<html:hidden property="answer(Object::Quote::GroupVerId1)" value='<%=""+GroupVerId%>' styleId="GroupVerId" />
	<html:hidden property="answer(Object::Quote::parentQuoteId1)" value='<%=""+parentQuoteId%>' styleId="parentQuoteId" />
	<html:hidden property="answer(Object::Quote::productStatus1)" value='<%=""+productStatus%>' styleId="productStatus" />
	<html:hidden property="answer(Object::Quote::CustomerState1)" value='<%=""+CustomerState%>' styleId="CustomerState" />
	<html:hidden property="answer(Object::Quote::ProductFamilyId1)" value='<%=""+ProductFamilyId%>' styleId="ProductFamilyId" />
	<html:hidden property="answer(Object::Quote::parentQuoteVerId1)" value='<%=""+parentQuoteVerId%>' styleId="parentQuoteVerId" />
	<html:hidden property="answer(Object::Quote::UserId1)" value='<%=""+userId%>' styleId="userId" />
	<html:hidden property="answer(Object::Quote::subQuoteProductId1)" value='<%=""+subQuoteProductId1%>' styleId="subQuoteProductId1" />
	<html:hidden property="answer(Object::Quote::QuoteType)" value='<%=""+QuoteType%>' styleId="QuoteType1" />
	<html:hidden property="answer(Object::Quote::QuoteNumber)" value='<%=""+QuoteNumber%>' styleId="QuoteNumber1" />
	<html:hidden property="answer(Object::Quote::State)" value='<%=""+State%>' styleId="State1" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value='<%=""+paretQuoteStatus%>' styleId="paretQuoteStatus" />
	<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
	<html:hidden property="answer(PageName)" value="CoveragesAndLimits" styleId="PageName" />
	
		<html:hidden styleId="subQuoteVerId" property="answer(subQuoteVerId)" value="<%=strSubQuoteVerId1 %>"/>
	<%if(request.getAttribute("Object::Clearance::NoRecords") != null){
		String clearnceStatus = ""+request.getAttribute("Object::Clearance::NoRecords");%>
		<html:hidden property="answer(Object::Clearance::NoRecords)" value='<%=""+clearnceStatus%>' styleId="clearnceStatus1" />
	<%} %>
<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							
		<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>

<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">

  <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>	
   <tr>
    
    	<td colspan="2" class="links">
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>" class="button2" style="width:130px">Quote Summary</a>
		</td>
    
   </tr>
   <tr>
    
    	<td colspan="2" class="links">
			<table width="900px">
				<tr>
							<td class="Error">
												
								<logic:present name="MESSAGE_LIST" scope="request">			
													
								<ol>
									<logic:iterate id="message" name="MESSAGE_LIST">
									<li><bean:write name="message"/></li>
									</logic:iterate>
								</ol>			
								</logic:present>											
							</td>
						</tr>
			<logic:present name="MESSAGE_LISTS" scope="request">			
			
			</logic:present>	
						<tr>
							<td class="Error">
								<logic:present name="MESSAGE_LISTS" scope="request">
								<tr>
									<td class="Error">				
									<ol>
							        	<logic:iterate id="InnerMessageList" name="MESSAGE_LISTS">
								        	<%int flag=0; %>
									        	<logic:iterate id="message" name="InnerMessageList">
									                <%
									                	if(flag==0){%>
			         										<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write  name="message"/></li>
			        											<%flag=1;}else{ %>
			         												<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
			        								<%} %>
			        							</logic:iterate>
			      						</logic:iterate>
			     					</ol>   
									</td>
								
								</tr>
			    	 				
			     				</logic:present>
							</td>
						</tr>
</table>
		</td>
    
   </tr>
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>	
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>	
    <tr>
     <td width="100%" valign="bottom" align="left" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
            <td align="center" valign=bottom>
    		 <table border="0" width="155" cellspacing="0" cellpadding="0" id="CoverageandLimits_Row" class="todotab_active" height=35>
    		 	<tr><td align="center" onClick="LoadNewQuoteCoverageandLimits('CoverageandLimits_Row');"  Style="Cursor:hand">Policy Coverage and Limits</td></tr>				
		 </table>
         </td>

         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="150" cellspacing="0" cellpadding="0" id="PolicyInformation_Row" class="todotab_inactive" height=35 >
    		 	<tr><td align="center" onClick="LoadNewQuotePolicyInformationTab('PolicyInformation_Row');"  Style="Cursor:hand">Policy Information</td></tr>				
		 </table>
         </td>
         
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="150" cellspacing="0" cellpadding="0" id="PolicyExclusions_Row" class="todotab_inactive" height=35 >
    		 	<tr><td align="center" onClick="LoadNewQuotePolicyExclusions('PolicyExclusions_Row');"  Style="Cursor:hand">Policy Exclusions</td></tr>				
		 </table>
         </td>

      <!--     <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="90" cellspacing="0" cellpadding="0" id="ClassHazards_Row" class="todotab_inactive" height=35>
    		 	<tr><td align="center" onClick="LoadClassList('ClassHazards_Row');"  Style="Cursor:hand" >Class Hazards</td></tr>				
		 </table>
         </td>


		  <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="2" height="4"></td>         
         <td align="center" valign=bottom>
    		 <table border="0" width="150" cellspacing="0" cellpadding="0" id="ClassBenefits_Row" class="todotab_inactive" height=35>
			<tr><td align="center" onClick="LoadClassBenefitsList('ClassBenefits_Row');"  Style="Cursor:hand">Class Benefits Selections</td></tr>
		 </table>
         </td>
         -->
         
         <logic:present name="subQuotes" scope="request">
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		</logic:iterate>
		<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
		<%pilotIncluded =planDetails.getPilotIncluded() ;%>
		</logic:present>
		
		<%if(pilotIncluded.equals("Y")){ %>
          <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="2" height="4"></td>         
          <td align="center" valign=bottom>
	     	<table border="0" width="100" cellspacing="0" cellpadding="0" id="AircraftSchedule" class="todotab_inactive" height=35>
	 		<tr><td align="center"  onClick="LoadNewQuoteAircraftSchedule('AircraftSchedule');"  Style="Cursor:hand">Aircraft Schedule</td></tr>
	 	</table>
         </td>
         <%}%>
         
       </tr>
     </table>
     </td>

    
   </tr>
   <tr>
    <td class="todotab_yellowbox">
     
     <div id="CovLimitsDiv" class="todotab_yellowbox2">
     
     </div>
     
     </td>
   </tr>
 </table>
 
 <Script type="text/javascript">
 
 	function enableTabs(){
 		  if(document.getElementById("CoverageandLimits_Row") != undefined){
    	document.getElementById("CoverageandLimits_Row").disabled = false;
    }
    if(document.getElementById("PolicyInformation_Row") != undefined ){
    	document.getElementById("PolicyInformation_Row").disabled = false;
    }
  	if(document.getElementById("PolicyExclusions_Row") != undefined){
 		document.getElementById("PolicyExclusions_Row").disabled = false;
 	}
 	if(document.getElementById("ClassHazards_Row") != undefined){
 		document.getElementById("ClassHazards_Row").disabled = false;
 	}
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 		document.getElementById("ClassBenefits_Row").disabled = false;
 	}
 		document.body.style.cursor = "default";
 	}
 	
 	function LoadNewQuoteCoverageandLimits(TabId){
 		activateTabs(TabId);
 		var parentQuoteId = document.getElementById("parentQuoteId").value;
	 	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	 	var subQuoteId = document.getElementById("subQuoteId11").value;
	 	var customerId = document.getElementById("customerId").value;
	 	var agencyId = document.getElementById("agencyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
	 	var userId = document.getElementById("userId").value;
	 	var subQuoteProductId = document.getElementById("subQuoteProductId1").value;
	 	var prodId = document.getElementById("prodId").value;
	 	var ProductVerId = document.getElementById("ProductVerId").value;
	 	var GroupId = document.getElementById("GroupId").value;
	 	var GroupVerId = document.getElementById("GroupVerId").value;
	 	var productStatus = document.getElementById("productStatus").value;
	 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
	 	var isOptionsDisabled = document.getElementById("IsOptionDisabled").value;
	 	
	 	var pars = 'changePlan=yes&answer(Object::Risk::Teritory)=0&answer(parentQuoteId)='+parentQuoteId+'&answer(Object::Quote::ProductId)='+prodId+'&answer(Object::Quote::ProductVerId)='+ProductVerId+
	 	'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(Object::Agency::AgencyId)='+agencyId+
	 	'&answer(IsOptionDisabled)='+isOptionsDisabled+'&answer(QuoteId)='+subQuoteId+'&answer(subQuoteId)='+subQuoteId+
	 	'&answer(Object::Customer::CustomerId)='+customerId+'&answer(Object::Agency::AgencyId)='+agencyId+
	 	'&answer(ownerId)='+ownerId+'&answer(userId)='+userId+'&answer(Plan::PlanNumber)='+subQuoteId+
	 	'&answer(Object::Quote::ProductId)='+subQuoteProductId+'&answer(Option::DefaultValue)=No&answer(ProductId)='+prodId+
	 	'&answer(ProductVerId)='+ProductVerId+'&answer(prdGroupId)='+GroupId+'&answer(prdGroupVerId)='+GroupVerId+
	 	'&answer(productStatus)='+productStatus+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(customerId)='+customerId+
	 	'&answer(Object::Plan::StateCode)=CO&answer(isUpdated)=Y&answer(Object::Quote::PrevSubQuoteVerId)='+subQuoteVerId;
	 	
	 	var url = '../PlanChangeV2.do?'+pars;
	 	autologout();
	 	new Ajax.Request(url, 
		 	{method: 'post',
				asynchronous:true,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
				 enableTabs();
			 	},onSuccess: function(transport){	
			 	document.getElementById("CovLimitsDiv").style.display = "block";
			 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
			 	}
			}
		);
 	
 		 	
 	}
 
 	function LoadNewQuotePolicyInformationTab(TabId){
 	activateTabs(TabId);
 	var locationListArraySize = 0;	 	
 	
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId11").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	
 	var pars = 'answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=POLICYINFORMATION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=0&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_BTA_POLICY_INFORMATION~APPLICATION_ID)=202&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_BTA_POLICY_INFORMATION~APPLICATION_VER_ID)=228&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=Quote_POLICY_INFORMATION&answer(objectType)=QuoteAdditionalInsured&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabPolicyExclusionY';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";
		 	
		 	
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}
	 function activateTabs(TabId){
	    if(document.getElementById("CoverageandLimits_Row") != undefined){
    	document.getElementById("CoverageandLimits_Row").disabled = true;
    }
    if(document.getElementById("PolicyInformation_Row") != undefined ){
    	document.getElementById("PolicyInformation_Row").disabled = true;
    }
  	if(document.getElementById("PolicyExclusions_Row") != undefined){
 		document.getElementById("PolicyExclusions_Row").disabled = true;
 	}
 	if(document.getElementById("ClassHazards_Row") != undefined){
 		document.getElementById("ClassHazards_Row").disabled = true;
 	}
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 		document.getElementById("ClassBenefits_Row").disabled = true;
 	}
	 document.getElementById("CoverageandLimits_Row").className = "todotab_inactive";
	 document.getElementById("PolicyInformation_Row").className = "todotab_inactive";
	 document.getElementById("PolicyExclusions_Row").className = "todotab_inactive";
	// document.getElementById("ClassHazards_Row").className = "todotab_inactive";
	// document.getElementById("ClassBenefits_Row").className = "todotab_inactive";
	  document.getElementById(TabId).className = "todotab_active";
	 
	 
	 }
	 
	/* To get a List of Classes For the Corresponding Quote ID and Quote Ver Id*/
	function LoadClassList(TabId){
		activateTabs(TabId);
 		var locationListArraySize = 0;	 	 	
 		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId11").value;
		var productVerId  = document.getElementById("ProductVerId").value;
		var groupVerId = document.getElementById("GroupVerId").value;
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
		var appEnabled = "";
		if(IsApplicationDisabled == 'N'){
			appEnabled = 'Y';
		}else{
			appEnabled = "N";	
		}
		var agencyId = document.getElementById("agencyId").value;

		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
 		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
		
 		var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;
 				
 		var url = '../GetQuoteClassList.do?'+pars;	
    
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    	 autologout();
		 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";		 	
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
		);
		
	}
	
	
	
	
	function LoadNewQuoteClassHazards(TabId){
	activateTabs(TabId);
 	var locationListArraySize = 0;	 	 	
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	var subQuoteId    = document.getElementById("subQuoteId11").value;
	var productVerId  = document.getElementById("ProductVerId").value;
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";
		 	
		 	
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}
	
	
	function LoadNewQuotePolicyExclusions(TabId){
	activateTabs(TabId);
 	var locationListArraySize = 0;	 	
 	
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId11").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	
 	var pars = 'answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=POLICYEXCLUSION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::ApplicationId__DMS_PROP_QUOTE_VER_ADD_POLICY_EXCLUSION~APPLICATION_ID)=212&answer(Object::Quote::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_POLICY_EXCLUSION~APPLICATION_VER_ID)=238&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=PolicyExclusion&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=Policy Exclusion&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
 			
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";
		 	
		 	
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}
	function LoadNewQuoteAircraftSchedule(TabId)
	{
	var pageName = document.getElementById("PageName").value;
	 	var actName = "";	 	
	 	if(pageName=="CoveragesAndLimits"){
	 		actName = "/saveApplication3.0.go?";
	 	}else{
	 		actName = "/saveApplicationQuoteSummary3.0.go?";
	 	}
	activateTabs(TabId);
	var locationListArraySize = 0;	 	

 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId11").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;

	var FamilyId = document.getElementById("ProductFamilyId").value;
	var paretQuoteStatus=document.getElementById("paretQuoteStatus").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	var quoteVerId = document.getElementById("parentQuoteVerId").value;
 	
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=AIRCRAFT&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(Object::Quote::QuoteStatus)='+paretQuoteStatus+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(quoteVerId)='+quoteVerId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
 	
 				var url = '../CVGetAircraftList2.do?'+pars;	
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";
		 	
		 	
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
	);
 	
	}
	function LoadNewQuoteAddEditAircraft(){
 	var locationListArraySize = 0;	 	
 	
 	var parentQuoteId    	= document.getElementById("parentQuoteId").value;

	var parentQuoteVerId 	= document.getElementById("parentQuoteVerId").value;

	var subQuoteId    		= document.getElementById("subQuoteId11").value;

	var productVerId  		= document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=AIRCRAFT&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(Object::Quote::AircraftRiskId)=-1';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";
		 	
		 	
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}
	/* To get a List of Classes For the Corresponding Quote ID and Quote Ver Id*/
	function LoadClassBenefitsList(TabId){
		activateTabs(TabId);
 		var locationListArraySize = 0;	 	 	
 		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId11").value;
		var productVerId  = document.getElementById("ProductVerId").value;
		var groupVerId = document.getElementById("GroupVerId").value;
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
		var appEnabled = "";
		if(IsApplicationDisabled == 'N'){
			appEnabled = 'Y';
		}else{
			appEnabled = "N";	
		}
		var agencyId = document.getElementById("agencyId").value;

		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
 		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
		
 		var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;
 				
 		var url = '../GetQuoteClassBenefitsList.do?'+pars;	
    
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    	 autologout();
		 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";		 	
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
		);
		
	}
	
	function LoadNewQuoteClassBenefits(TabId){
	activateTabs(TabId);
 	var locationListArraySize = 0;	 	
 	
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId11").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	
 	var pars = 'answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSBENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";
		 	
		 	
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}
	
 </Script>
 
<%  String openTab = "";

if(request.getParameter("answer(openTabAPolicyInfo)")!=null){
 openTab = ""+request.getParameter("answer(openTabAPolicyInfo)");
 }
if(openTab.equals("Policy_COV_LIMITS")){ %>
<script>
	LoadNewQuoteCoverageandLimits('CoverageandLimits_Row');
</script>
<% }
if(openTab.equals("openTabPolicyInfoY")){%>
	<script type="text/javascript">
		LoadNewQuotePolicyInformationTab('PolicyInformation_Row');
	</script>
<%}else if(openTab.equals("openTabPolicyExclusionY")){%>
<script type="text/javascript">
		LoadNewQuotePolicyExclusions('PolicyExclusions_Row');
		document.getElementById('caseInformation').className = "stage2 left";
		document.getElementById('caseExclusion').className = "stage3 left";
		document.getElementById('classHazards').className = "stage4 left";
	</script>
<%}else if(openTab.equals("openTabClassHazardY")){%>
<script type="text/javascript">
		//LoadClassList('ClassHazards_Row');
		//document.getElementById('caseInformation').className = "stage2 left";
		//document.getElementById('caseExclusion').className = "stage2 left";
		//document.getElementById('classHazards').className = "stage3 left";
		//document.getElementById('classBenefits').className = "stage4 left";
	</script>
<%}else if(openTab.equals("openTabClassBenefitsY")){%>
<script type="text/javascript">
		//LoadClassBenefitsList('ClassBenefits_Row');
		//document.getElementById('caseInformation').className = "stage2 left";
		//document.getElementById('caseExclusion').className = "stage2 left";
		//document.getElementById('classHazards').className = "stage7 left";
		//document.getElementById('classBenefits').className = "stage9 left";
	</script>
<%}%>