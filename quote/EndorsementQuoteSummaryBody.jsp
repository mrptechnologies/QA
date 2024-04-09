<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<style type="text/css">
body {background:none !important;}
</style>
<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js"></script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CreateEndorsementQuote.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/EndorsementQuoteSummaryUI3.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/EndorsementClassHazards.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/EndorsementClassBenefits.js"></script>
<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request"/>
<logic:empty name="parentQuoteId">
	<% parentQuoteId = (String)request.getAttribute("QuoteId"); %>
</logic:empty>
<bean:define id="ProductVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="tabid" name="QuoteDetail" property="answer(openTabAPolicyInfo)"></bean:define>
<html:hidden property="answer(openTabAPolicyInfoCov)" value="<%=""+tabid%>" styleId="TabFocus"/>
<%String docSubQuoteId=""; 
String CustomerName="";%> 
<%boolean renewalEndorsement = false; %>
<%boolean isRenewal = false;
String objectType = "ENDORSEMENT";
String isProposalDocumentCreatedStr = "";%>
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="RejectReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::RejectedNotes)" scope="request" />
<bean:define id="LostReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LostNotes)" scope="request" />
<bean:define id="QuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" scope="request" />
<bean:define id="QuoteNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteNumber)" scope="request" />
<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
<bean:define id="EmpGrpNum" name="QuoteDetail" property="answer(Object:Customer:CustomerNumber)" scope="request" />
<bean:define id="customerId" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="QuoteDetail" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="prodId" name="QuoteDetail" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="parentQuoteVerId" name="QuoteDetail" property="answer(Object::Quote::QuoteVerId)" scope="request" />
<bean:define id="QuoteType" name="QuoteDetail" property="answer(Object::Quote::QuoteType)" />
<bean:define id="FirstSubQuoteId" name="QuoteDetail" property="answer(Object::Quote::FirstSubQuoteId)" />
<bean:define id="QuoteId" name="QuoteDetail" property="answer(Object::Quote::Id)" />
<bean:define id="policyId" name="QuoteDetail" property="answer(Object::Quote::ParentPolicyId)" />
<bean:define id="policyVerId" name="QuoteDetail" property="answer(Object::Quote::ParentPolicyVerId)" />
<bean:define id="State" name="QuoteDetail" property="answer(Object::Quote::CustomerState)" />
<bean:define id="GroupVerId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="polProductId" name="QuoteDetail" property="answer(Object::Product::ProductId)"/>
<bean:define id="parentQuoteVerId" name="QuoteDetail" property="answer(Object::Quote::QuoteVerId)" scope="request" />
<bean:define id="ProductFamilyId" name="QuoteDetail" property="answer(Object::Quote::ProductFamilyId)"/>
<bean:define id="ownerId" name="QuoteDetail" property="answer(Object::Quote::OwnerId)" scope="request" />
<bean:define id="GroupId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="productStatus" name="QuoteDetail" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="quoteStartDate" name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" scope="request" />
<bean:define id="policyNumber" name="QuoteDetail" property="answer(policyNumber)" />
<bean:define id="endorsementPolicyNumber" name="QuoteDetail" property="answer(Object::Quote::PolicyNumber)" />
<% 
	if((""+policyNumber).equals("")){
		policyNumber = endorsementPolicyNumber;
	}
%>
<bean:define id="parentPolicyId" name="QuoteDetail" property="answer(Object::Policy::ParentPolicyId)" />
<bean:define id="parentPolicyVerId" name="QuoteDetail" property="answer(Object::Policy::ParentPolicyVerId)" />
<%
	if(request.getParameter("answer(Object::Policy::ParentPolicyVerId)") != null ) {
			parentPolicyVerId = request.getParameter("answer(Object::Policy::ParentPolicyVerId)");
	}
	if((""+parentPolicyId).equals("")){
		parentPolicyId = "" + policyId;
	}
	if((""+parentPolicyVerId).equals("")){
		parentPolicyVerId = "" + policyVerId;
	}	
%>
<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<bean:define id="quoteName" name="QuoteDetail" property="answer(Object::Quote::QuoteName)" />
<bean:define id="quoteDesc" name="QuoteDetail" property="answer(Object::Quote::QuoteDesc)" />
<bean:define id="policyEffDate" name="QuoteDetail" property="answer(policyEffDate)" />
<bean:define id="policyExpDate" name="QuoteDetail" property="answer(policyExpDate)" />
<bean:define id="parentPolicyStatus" name="QuoteDetail" property="answer(parentPolicyStatus)" />
<bean:define id="paretLockStatus" name="QuoteDetail" property="answer(Object::Quote::LockStatus)" />
<%if(request.getParameter("parentPolicyStatus")!=null) {%>
	<bean:parameter name="answer(parentPolicyStatus)" id="parentPolicyStatus"/>
<%} %>
<%
	boolean isSold = false;
	if(paretQuoteStatus.toString().equalsIgnoreCase("Sold")) {
		isSold = true;
	}
%>
<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">	
	<bean:define id="tempCustomerName" name="customerDetail1" property="customerName" scope="request" />
	<% CustomerName = ""+tempCustomerName; %>
</logic:present>
<%String IsApplicationDisabled="Y";%>
<%String IsOptionDisabled="Y";%>
<% long subQuoteIdforChk = 0; %>
<%String pName = ""; %>
<html:form action="/SaveQuoteSummuryAction" styleId="frm" onsubmit="return validateDate1()">
	<table WIDTH="99%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">		
		<tr>
			<td WIDTH="90%">
				<table width="100%" bgcolor="#C6DEEA">
				<tr><td>
				<div id="QuoteInsuerdAgencyAgentHeader">
					<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
					<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
					<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
					</jsp:include>
					</div>
				</td></tr>
				</table>
			</td>
		</tr>
		<tr height="5"><td></td></tr>		
		<tr>
			<td align="left" colspan=2>
				<table width="100%" align="left" border="0" >
					<tr>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Bound","Lapsed","Referred","Issued","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal=true;
						objectType = "RENEWAL";%>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<%if(isRenewal) { %>
		   				<td class="NewSectionHead" align="center">RENEWAL QUOTE SUMMARY</td>			   			
		   			<%} else {%>											   				
						<td class="NewSectionHead" align="center">ENDORSEMENT QUOTE SUMMARY</td>			   			
					<%} %>		   			
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table WIDTH="100%" BORDER="0" align="left" CELLSPACING="0" CELLPADDING="0">
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
				</table>
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
		<dmshtml:dms_isPresent
			property='<%=new String[]{"Lost", "Rejected"}%>'
			value="<%=paretQuoteStatus.toString()%>" negated="true">
		<tr>
			<td class="Error">Reason : <%=RejectReason.toString()+" "+LostReason.toString()%>
			</td>
		</tr>
		<tr height="15px">
			<td>&nbsp;
			</td>
		</tr>
		</dmshtml:dms_isPresent>
		<dmshtml:Get_All_Plan_HeaderDetails 
			nameInSession="subQuotes" 
			parentQuoteId='<%=""+parentQuoteId%>'
			dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  
			/>		
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
		subQuoteIdforChk = Long.parseLong(""+subQuoteId);
		String riskZone = planDetails.getZone();
		%>
				<html:hidden property="answer(subQuoteId)" styleId="subQuoteId" value="<%=""+subQuoteId%>" />
						<html:hidden property="answer(subQuoteVerId)" styleId="subQuoteVerId" value="<%=""+subQuoteVerId%>" />
		<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+subQuoteVerId%>'/>
		<bean:define id="referralNotes" name="QuoteDetail" property="answer(Object::QuoteAdditional::ReferralNotes)"/>
		<logic:present name="QuoteTransactionStatus" scope="request">
			<tr>
				<td class="Error"><%= request.getAttribute("QuoteTransactionStatus") %>
				</td>
			</tr>
		</logic:present>
		<tr>
			<td>
			<table width="98%">
				<tr>
					<dmshtml:dms_isPresent property='<%=new String[]{"In Progress","Referred","Bind Request","Bound","Issued","Offered","Lapsed","Declined"}%>'value="<%=paretQuoteStatus.toString()%>" negated="true">	
						<td class="links" width="18%">
							<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.PolicySummary'/>">Policy Summary</a>
						</td>
					</dmshtml:dms_isPresent>
					<%if(isRenewal) { %>
						<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="false">
							<dmshtml:dms_isPresent property="<%=new String[]{"Bound","Issued","Referred"}%>" value="<%=paretQuoteStatus.toString()%>" negated="false">
								    <td class="links" align="left" width="17%">
								    	<a href="../ModifyQuoteConfirmAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(modQuoteId)=<%=""+parentQuoteId%>&answer(modQuoteNumber)=<%=""+QuoteNumber%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(policyNumber)=<%=policyNumber.toString()%>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId.toString()%>&answer(Object::Quote::ParentPolicyVerId)=<%=parentPolicyVerId.toString()%>" title="<bean:message key='ToolTip.QuoteSummary.ModifyQuote'/>"  style="width:100px"  onclick="submit_form()" id="Modify_Quote"><html:button styleClass="linkButton" property="answer(modifyQuote)" value="Modify Quote" onclick="window.location=document.getElementById('Modify_Quote')"/></a>
							        </td>
							</dmshtml:dms_isPresent>
						</dmshtml:dms_isPresent>
					<%} %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Referred","Bind Request","Bind"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					<% boolean isAvailableToDisplay = true; %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="links" width="25%">
							<a href="../RenewalMandatoryRules.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ProductId)=<%=""+prodId%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId%>&answer(parentPolicyId)=<%=""+parentPolicyId%>&answer(Object::Quote::ProductId)=<%=""+prodId %>&subQuoteId=<%=subQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(isRenewalEndorsement)=YES&answer(Object::Quote::QuoteType)=ENDORSEMENT&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(Object::QuoteAdditional::ReferralNotes)=<%=""+referralNotes %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.CreateRenewalQuote'/>">Create Renewal Quote</a>
						</td><% isAvailableToDisplay = false; %>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
				<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
				<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="REFERRAL_AVAILABLE" 
					property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					<td class="links" align="left" width="100px">
							<a href="../SubmitQuoteEIL.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ProductId)=<%=""+prodId%>&answer(ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(RULE_OBJECT_ID)=<%=""+prodId%>&answer(RULE_OBJECT_VER_ID)=<%=""+ProductVerId%>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+subQuoteVerId%>&answer(RULE_OBJECT_TYPE)=PRODUCT&answer(RULE_OBJECT_NAME)=APPLICATION&answer(MERGE_BEFORE)=YES&answer(MERGE_AFTER)=NO&answer(ASSERT_MAP_ENTRIES)=YES&answer(MODIFIED_FACT_MAP)=YES&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(isRenewalEndorsement)=YES&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteType)=ENDORSEMENT&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Refer'/>" id="Refer_Quote" style="width:100px">Refer</a>
					</td>
				</dmshtml:isFeatureAvailableForProductRoleStatus>
			</dmshtml:dms_isPresent>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="LAPSE_AVAILABLE" 
			                property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
							<td class="links" align="left" width="25%">
								<a href="../LostQuote.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteType)=ENDORSEMENT&isRenewal=<%=""+isRenewal %>"  title="<bean:message key='ToolTip.EndorsementQuoteSummary.Lapse'/>">Lapse this Quote</a>
							</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:Is_Proposal_Document_Generated nameInSession="isProposalDocumentCreated" documentType='PROPOSAL' parentQuoteId='<%=Long.parseLong(""+parentQuoteId)%>' subQuoteId='<%=Long.parseLong(""+subQuoteId)%>' ownerId="<%=Long.parseLong(ownerId.toString())%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />						
						<logic:present name="isProposalDocumentCreated" scope="request">
							<bean:define id="isProposalDocumentCreated" name="isProposalDocumentCreated" type="java.lang.String" />
							<% isProposalDocumentCreatedStr = "" + isProposalDocumentCreated; %>
						</logic:present>
					<%if(!isProposalDocumentCreatedStr.equalsIgnoreCase("false")) { %>
						<%if(isAvailableToDisplay){ %>
						<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_REQUEST_AVAILABLE" 
							property='<%=new String[]{"Offered"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
							<td class="links" width="25%">
								<a href="../quote/BindRequest.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType %>&answer(DocumentType)=BINDER&answer(Object::Quote::QuoteStartDate)=<%=""+quoteStartDate %>&answer(parentPolicyId)=<%=""+parentPolicyId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteName)=<%=""+quoteName%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Quote::QuoteStatus)=Offered&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=""+riskId%>&subQuoteId=<%=subQuoteId.toString()%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.BindRequest'/>" id="Bind_Request"><html:button styleClass="linkButton" property="answer(bindRequest)" value="Bind Request" onclick="window.location=document.getElementById('Bind_Request')"/></a>  
							</td>						
						</dmshtml:isFeatureAvailableForProductRoleStatus>
						<%}%>
					<%}%>
					<%if(isAvailableToDisplay){ %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">						
							<a href="../endorsement/IssueBinder.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&SubQuoteId=<%=subQuoteId.toString()%>&answer(state)=<%=""+State%>&subQuoteId=<%=subQuoteId.toString()%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(parentPolicyStatus)=<%=""+parentPolicyStatus %>&isRenewal=<%=""+isRenewal %>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(subQuoteId)=<%=subQuoteId.toString()%>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Bind'/>" id="Bind_Quote"><html:button styleClass="linkButton" property="answer(bindQuote)" value="Bind" onclick="window.location=document.getElementById('Bind_Quote')"/></a>
						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
						<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_BIND_AVAILABLE" 
							property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
							<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
							<td class="links" width="25%">
							<a href="../AddRemoveTankIssueEndorsementEligibilityRuleAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteStatus1)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&policyEffDate=<bean:write name="policyHeaderInfo" property="policyEffDate"/>&policyExpDate=<bean:write name="policyHeaderInfo" property="policyExpDate"/>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+subQuoteVerId%>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Bind'/>" id="Bind_Quote"><html:button styleClass="linkButton" property="answer(bindQuote)" value="Bind Renewal" onclick="window.location=document.getElementById('Bind_Quote')"/></a>
							</td>
							</dmshtml:dms_isPresent>						
						</dmshtml:isFeatureAvailableForProductRoleStatus>
					<%}%>
					<%renewalEndorsement = true; %>	
					</dmshtml:isFeatureAvailableForProductRoleStatus>					
					<%if(!renewalEndorsement){ %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_REQUEST_AVAILABLE" 
						property='<%=new String[]{ "In Progress","Offered"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="links" width="25%">
							<a href="../quote/BindRequest.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType %>&answer(DocumentType)=BINDER&answer(Object::Quote::QuoteStartDate)=<%=""+quoteStartDate %>&answer(parentPolicyId)=<%=""+parentPolicyId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteName)=<%=""+quoteName%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Quote::QuoteStatus)=Offered&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=""+riskId%>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.BindRequest'/>" id="Bind_Request"><html:button styleClass="linkButton" property="answer(bindRequest)" value="Bind Request" onclick="window.location=document.getElementById('Bind_Request')"/></a>  						
					</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>					
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">
							<a href="../endorsement/IssueBinder.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(parentPolicyStatus)=<%=""+parentPolicyStatus %>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(subQuoteId)=<%=subQuoteId.toString()%>" id="Bind_Quote" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Bind'/>"><html:button styleClass="linkButton" property="answer(bindQuote)" value="Bind" onclick="window.location=document.getElementById('Bind_Quote')"/></a>
						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>					
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_BIND_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">
						<a href="../AddRemoveTankLocationIssueEndorsementEligibilityRuleAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteStatus1)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+subQuoteVerId%>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Bind'/>" id="Bind_Quote"><html:button styleClass="linkButton" property="answer(bindQuote)" value="Bind" onclick="window.location=document.getElementById('Bind_Quote')"/></a>
						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>					
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="COV_LIM_ENDORSEMENT_BIND_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<dmshtml:dms_isPresent property='<%=new String[]{"ENDORSEMENT"}%>' value="<%=QuoteType.toString()%>" negated="true">
						<td class="links" width="25%">						
								<a href="../IssueEndorsementEligibilityRuleAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+subQuoteId%>&answer(Object::Quote::QuoteDesc)=<%=""+quoteDesc%>&answer(Object::Quote::QuoteName)=<%=""+quoteName %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+subQuoteVerId%>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Bind'/>" id="Bind"><html:button styleClass="linkButton" property="answer(bindQuote)" value="Bind" onclick="window.location=document.getElementById('Bind')"/></a>
						</td>
						</dmshtml:dms_isPresent>						
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<%} %>
					<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true">
						<td class="links"align="left" width="100px">
	<a href="../SearchActivityManagerAction9.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Activity::ObjectId)=<%=""+parentQuoteId%>&answer(Object::Activity::ObjectType)=<%="Quote"%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::Activity::OwnerId)=<%=ownerId.toString()%>&answer(Object::Activity::PageNum)=0&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentPolicyStatus)=<%=""+parentPolicyStatus %>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.ActivityLog'/>">Activity Log </a>
			</td>			
	</dmshtml:dms_static_with_connector>		
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBMIT_AVAILABLE" 
						property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="links" align="left" width="100px">
								<a href="../SubmitQuote.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ProductId)=<%=""+prodId%>&answer(ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(RULE_OBJECT_ID)=<%=""+prodId%>&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(RULE_OBJECT_VER_ID)=<%=""+ProductVerId%>&answer(RULE_OBJECT_TYPE)=PRODUCT&answer(RULE_OBJECT_NAME)=APPLICATION&answer(MERGE_BEFORE)=YES&answer(MERGE_AFTER)=NO&answer(ASSERT_MAP_ENTRIES)=YES&answer(MODIFIED_FACT_MAP)=YES&answer(policyNumber)=<%=""+policyNumber%>&isRenewal=<%=""+isRenewal %>">Submit</a>
							</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="LOST_AVAILABLE" 
			                property='<%=new String[]{"In Progress","Offered","Bind Request","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
							<td class="links" align="left" width="100px">
								<a href="../LostQuote.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(policyNumber)=<%=""+policyNumber%>&isRenewal=<%=""+isRenewal %>">Lost</a>
							</td>
						</dmshtml:isFeatureAvailableForProductRoleStatus>				
				</tr>
			</table>
			</td>
		</tr>
		</logic:present>
		<tr height="10px">
			<td>&nbsp;
			</td>
		</tr>
		<logic:present name="ErrorMsg">
		<tr height="15px">
			<td class="Error">
				<%= ""+request.getAttribute("ErrorMsg") %>
			</td>
		</tr>
		<tr height="10px">
			<td>&nbsp;
			</td>
		</tr>		
		</logic:present>
		<tr>
			<td class="Error">		
				<logic:present name="MESSAGE_LISTS" scope="request">
				<ol><font color="red">
					<logic:iterate id="message" name="MESSAGE_LISTS">
					<li><bean:write name="message"/></li>
					
					</logic:iterate>
				</ol>			
				</logic:present>		
		</td></tr>
		<logic:present name="MESSAGE_LIST" scope="request">
			<tr>
				<td class="Error">						
					<ol><font color="red">
							<logic:iterate id="message" name="MESSAGE_LIST">
								<li><bean:write name="message"/></li>
							</logic:iterate>
					</ol>						
				</td>
			</tr>
		</logic:present>
		<%if(isProposalDocumentCreatedStr.equalsIgnoreCase("false") && ("" + paretQuoteStatus).equalsIgnoreCase("Offered")) { %>
			<tr>
				<td class="Error" colspan="5" align="left">BINDER CANNOT BE ISSUED UNTIL QUOTE PROPOSAL HAS BEEN ISSUED AND PRE BIND SUBJECTIVITIES HAVE BEEN ADDRESSED.</td>
			</tr>
		<% } %>
		<tr>
			<td>
			<table>
				<tr>
					<dmshtml:GetEndorsementQuoteHeaderInfo dBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="endorse" ownerId='<%=""+ownerId%>' quoteId='<%=""+parentQuoteId%>' />
					<logic:present name="endorse">
						<td class="FormLabels" width="40%">
							<B>Endorsement Name</B>
						</td>
						<td class="TextMatter" width="60%">
							<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::ProductName" />
							<input type="hidden"  value ="<bean:write name="EndorseQuoteHeader" property="Object::Endorse::Quote::ProductName" />" id="productName" />
						<bean:define id="productName" name="EndorseQuoteHeader" property="Object::Endorse::Quote::ProductName" />
					<% pName = ""+productName; %></td>
					</logic:present>
				</tr>
					<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+parentPolicyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='BINDER' />
				<bean:define id="policyEffDate" name="policyHeaderInfo" property="policyEffDate" />	
				<bean:define id="policyExpDate" name="policyHeaderInfo" property="policyExpDate" />	
				<tr>
					<td class="FormLabels" width="40%">					
						<B>Requested Effective Date:</B></td>
						<html:hidden property="answer(parentPolicyStatus)" value="<%=parentPolicyStatus.toString()%>"/>
					<%if((""+parentPolicyStatus).equalsIgnoreCase("canceled")){ %>
						<td class="TextMatter" width="60%">										
							<html:text name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" style="font-family:Verdana;font-size:12px;" styleClass="txtbox" styleId="txtDate" size="10" maxlength="30" disabled="true" />
						</td>	
					<%} if(!(""+parentPolicyStatus).equalsIgnoreCase("canceled")){ %>
						<td class="TextMatter" width="60%">										
							<html:text name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" style="font-family:Verdana;font-size:12px;" styleClass="txtbox" styleId="txtDate"  size="10" maxlength="30" onchange="return validateDate1('submit')" />
							<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" style="font-family:Verdana;font-size:12px;" styleClass="txtbox" styleId="referenceStartDate"   />
						</td>	
					<%}%>
				</tr>
				<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Bound","Lapsed","Referred","Issued","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal=true; %>
				</dmshtml:isFeatureAvailableForProductRoleStatus>
				<% if (!isRenewal) {%>
				<dmshtml:dms_isPresent property='<%=new String[]{"Sold", "Lost", "Rejected"}%>' value="<%=paretQuoteStatus.toString()%>" negated="false">
				<tr>
					<td class="FormLabels"><B>Quote Type</B></td>
					<td class="links"> 
					<html:select property="answer(Object::Quote::QuoteType)" name="QuoteDetail" disabled="<%=isSold %>">
						<html:option value="ENDORSEMENT">Endorsement</html:option>
					</html:select>
					<%
						if(isSold) { %>
							<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteType)" />
						<%}
					%>
					</td>
				</tr>
				</dmshtml:dms_isPresent>
				<%} else {%>
				<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteType)" value="ENDORSEMENT"  />
				<%}%>
				<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_QUOTESUMMARY_UI3" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bound","Issued"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					<tr>
					<td>
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
						<html:submit value="Save" styleClass="sbttn"  />
					</dmshtml:dms_isPresent>	
					</td></tr>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
			</table>
			</td>
		</tr>
		<tr height="15px">
			<td>&nbsp;
			</td>
		</tr>
		</table>
		<tr>
			<td>
			<table WIDTH="95%" ALIGN="left" cellspacing="0" cellpadding="0" border="0">
				<dmshtml:Get_All_Plan_HeaderDetails 
				nameInSession="subQuotes" 
				parentQuoteId='<%=""+parentQuoteId%>'
				dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  
				/>
				<logic:present name="subQuotes" scope="request">
				<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
				<tr>
					<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="RISK_AVAILABLE" />
			   		<logic:present name="paramValue">
			   		<logic:equal value="TRUE" name="paramValue">
						<td class="sectionhead" align="left">Risk Number</td>
						<td class="sectionhead" align="left">Risk Name</td>
					</logic:equal>
					</logic:present>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CANCEL_OPTION" 
						property='<%=new String[]{"In Progress","Bind Request","Bound","Issued"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="sectionhead" align="left">Cancel Option</td>	
					</dmshtml:isFeatureAvailableForProductRoleStatus>	
					    <%String endorsementDetail = "Y";  %>
						<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Issued","Submitted","Lost"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<% endorsementDetail = "N"; %>
					   </dmshtml:isFeatureAvailableForProductRoleStatus>
					<% if (endorsementDetail.equals("Y") && !isRenewal) {%>
					<td class="sectionhead" align="left">Endorsement Details</td>
					<%} %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_TANKS_AVAILABLE" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					<td class="sectionhead" align="left">
						Schedule of Tanks
					</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_RATING_DETAIL" 
					property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_RATING_DETAIL"}%>' connector='or' negated="true">
					<td class="sectionhead" align="left">
							Rating Detail
					</td>					
					</dmshtml:dms_static_with_connector>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_GENERAL_QUESTIONS" 
					property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					<td class="sectionhead" align="left">
							General Questions
					</td>					
					</dmshtml:isFeatureAvailableForProductRoleStatus>									
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="COVERAGES_AVAILABLE" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="sectionhead" align="left">
							Coverages and Limits
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<logic:present name="paramValue">
					<logic:equal value="TRUE" name="paramValue">
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="APPLICATION_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bound","Submitted","Issued","Lost"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="sectionhead" align="left">
							Application
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="APPLICATION_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bound","Submitted","Issued","Lost"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="sectionhead" align="left">
							Application Pdf
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					</logic:equal>
					</logic:present>
					<dmshtml:GetParameterByOwnerId nameInSession="paramPDF" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="EIL_APPLICATION_PDF" />
					<logic:present name="paramPDF">
					<logic:equal value="TRUE" name="paramPDF">
					<%if(isRenewal){ %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="APPLICATION_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bound","Submitted","Issued","Lost","Referred","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="sectionhead" align="left">
							Application Pdf
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<%} %>
					</logic:equal>
					</logic:present>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="sectionhead" align="left">Schedule Of Forms</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>					
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="sectionhead" align="left">
							Subjectivity
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:CheckCancelType nameInSession="IS_PRORATA" parentQuoteId='<%= Long.parseLong(""+parentQuoteId) %>' subQuoteId='<%= subQuoteIdforChk %>' cancelType="PRORATA" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId='<%= ""+ownerId %>' negated="true" />
						<logic:present name="IS_PRORATA">
							<% String isProrata = "" + request.getAttribute("IS_PRORATA"); %>		
								<% if(isProrata.equalsIgnoreCase("YES")) { %>
									<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="WORKSHEET_AVAILABLE" 
										property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted","Bound","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
										<td class="sectionhead" align="left">
											UW Worksheet
										</td>
									</dmshtml:isFeatureAvailableForProductRoleStatus>
								<%}%>
						</logic:present>
				</tr>
				<logic:iterate id="quoteDetail" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
				<tr>
					<bean:define id="subQuoteId" name="quoteDetail" 	property="quoteId" />
					<bean:define id="subQuoteVerId" name="quoteDetail" 	property="quoteVerId" />
					<bean:define id="subQuoteProductId" name="quoteDetail" 	property="productId" />
					<bean:define id="subQuoteProductVerId" name="quoteDetail" 	property="productVerId" />
					<bean:define id="planNum" name="quoteDetail" 	property="quoteNumber" />
					<bean:define id="planDetails" name="quoteDetail" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
					<%long riskId =planDetails.getPLResRiskPropertyId() ;
					String riskName =planDetails.getPLResRiskPropertyName() ;
					String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
					long riskTerritory =planDetails.getTerritory() ;
					String planState = planDetails.getStateCode();
					String riskZone = planDetails.getZone();  
					long planCount = 0;
					%>
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
					<logic:present name="paramValue">
			   		<logic:equal value="TRUE" name="paramValue">
						<td class="SearchResult" align="left"><%=riskNumber%></td>
						<td class="SearchResult" align="left"><%=riskName %></td>
					</logic:equal>
					</logic:present>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CANCEL_OPTION" 
						property='<%=new String[]{"In Progress","Bind Request","Bound","Issued"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult" align="left">
							<a href="/EndorsementPlanChangeV2.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(IsOptionDisabled)=<%=""+IsOptionDisabled%>&changePlan=yes&answer(Object::Risk::Teritory)=<%=""+riskTerritory%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(userId)=<%=userId.toString()%>&answer(Plan::PlanNumber)=<%=""+subQuoteId%>&answer(Object::Quote::ProductId)=<%=subQuoteProductId%>&answer(Option::DefaultValue)=No&answer(ProductId)=<%=""+prodId%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(customerId)=<%=""+customerId%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(productId)=<%=prodId %>&answer(customerId)=<%=customerId %>&answer(State)=<%=planState %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(productVerId)=<%=""+ProductVerId%>&heading=CANCEL OPTIONS">Cancel Option</a>
							</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<% if (endorsementDetail.equals("Y") && !isRenewal) {%>
					<td class="SearchResult" align="left">
						<a href='/GetEndorsementDetailAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(productId)=<%=prodId %>&answer(productVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(subQuoteId)=<%=subQuoteId %>&answer(FamilyId)=<%=ProductFamilyId.toString()%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(Object::Quote::ProductId)=<%=prodId %>&answer(customerId)=<%=customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId %>&answer(State)=<%=planState %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(EndorsementDetail_Forward)=Yes&answer(parentPolicyStatus)=<%=""+parentPolicyStatus %>'>Endorsement Details</a>
					</td>
					<%} %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_TANKS_AVAILABLE" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					<td class="SearchResult" align="left">
						<a href='/GetEndorsementScheduleOfTanks.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(FamilyId)=<%=ProductFamilyId.toString()%>&answer(subQuoteId)=<%=subQuoteId %>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(productId)=<%=prodId %>&answer(customerId)=<%=customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId %>&answer(State)=<%=planState %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(productVerId)=<%=""+ProductVerId%>&answer(subQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&isRenewal=<%=""+isRenewal %>' title="<bean:message key='ToolTip.EndorsementQuoteSummary.ScheduleofTanks'/>">Schedule of Tanks</a>
					</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_RATING_DETAIL" 
					property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_RATING_DETAIL"}%>' connector='or' negated="true">
					<td class="SearchResult" align="left">
					<a href='../getEndorsementRatingDetailV2.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(productId)=<%=prodId%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(customerId)=<%=""+customerId%>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+subQuoteVerId%>&parentQuoteId=<%=parentQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(agencyId)=<%=""+agencyId%>&subQuotePlanName=<%=subQuoteProductId%>&requestType=EmployeeElection&answer(productVerId)=<%=""+ProductVerId%>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(productVerId)=<%=""+ProductVerId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&isRenewal=<%=""+isRenewal %>' title="<bean:message key='ToolTip.EndorsementQuoteSummary.RatingDetail'/>">Rating Detail</a>
					</td>	
					</dmshtml:dms_static_with_connector>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ENDORSEMENT_GENERAL_QUESTIONS" 
					property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			    	<td class="SearchResult" align="left">
				 	<a href='../DisplayGeneralQuestionApplication.do?answer(TabPanelName)=Quote_Panel&answer(recalculateneeded)=recalculate&answer(objectType)=QuoteAdditionalInsured&TabPanelName=Quote_Panel&answer(Object::Activity::CreatedBy)=<%=""+userId %>&answer(showOneTabAtTime)=N&answer(IsSubApplicationCoveredByForm)=Yes&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled%>&answer(objectId)=<%="0"%>&answer(objectVerId)=0&answer(objectName)=GENERAL QUESTION&answer(applicationType)=QUOTE&answer(productVerId)=<%=""+ProductVerId %>&answer(productId)=<%=""+prodId %>&answer(applicationSubType)=&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Risk::ResProperty::ResPropertyId)=<%=""+riskId %>&answer(RiskId)=<%=""+riskId %>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&answer(FamilyId)=<%=ProductFamilyId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&OwnerId=<%=ownerId.toString()%>&answer(State)=<%=""+planState%>&answer(Object::Customer::State1)=<%=""+State%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(APP_TAB_TYPE)=YUI&answer(isApplicationEnabled)=<%=""+IsApplicationDisabled %>&answer(teritory)=<%="0"%>&answer(zone)=<%=""%>&answer(isUpdated)=<%="Y" %>&answer(pagename)=<%=""+" Application"%>&answer(Object::Activity::ActivityType)=<%="Quote Management"%>&answer(Object::Activity::ObjectType)=<%="Quote"%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Activity::OwnerId)=<%=ownerId.toString()%>&answer(Object::Policy::ParentPolicyVerId)=<%=parentPolicyVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(policyNumber)=<%=""+policyNumber %>&isRenewal=<%=""+isRenewal %>' title="<bean:message key='ToolTip.EndorsementQuoteSummary.GeneralQuestions'/>">General Questions</a>			
					</td>					
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="COVERAGES_AVAILABLE" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult" align="left">
							<a href="../EndorsementPlanChangeV2.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(IsOptionDisabled)=<%=""+IsOptionDisabled%>&changePlan=yes&answer(Object::Risk::Teritory)=<%=""+riskTerritory%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(userId)=<%=userId.toString()%>&answer(Plan::PlanNumber)=<%=""+subQuoteId%>&answer(Object::Quote::ProductId)=<%=subQuoteProductId%>&answer(Option::DefaultValue)=No&answer(ProductId)=<%=""+prodId%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(customerId)=<%=""+customerId%>&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=<%=riskId %>&answer(productId)=<%=prodId %>&answer(customerId)=<%=customerId %>&answer(State)=<%=planState %>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(productVerId)=<%=""+ProductVerId%>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+subQuoteVerId%>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.CoveragesLimits'/>">Coverages and Limits</a>
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<logic:present name="paramValue">
					<logic:equal value="TRUE" name="paramValue">
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="APPLICATION_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bound","Issued","Submitted","Lost"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult" align="left">
							<a href='../DisplyApplication.do?answer(TabPanelName)=Quote_Panel&TabPanelName=Quote_Panel&answer(showOneTabAtTime)=N&answer(IsSubApplicationCoveredByForm)=Yes&answer(IsApplicationDisabled)=<%=""+IsApplicationDisabled%>&answer(objectId)=<%=""+prodId%>&answer(objectVerId)=<%=""+ProductVerId%>&answer(objectName)=PRODUCT&answer(applicationType)=RISK&answer(applicationSubType)=&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Risk::ResProperty::ResPropertyId)=<%=""+riskId %>&answer(RiskId)=<%=""+riskId %>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&RiskId=<%=""+riskId %>&answer(FamilyId)=<%=ProductFamilyId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&OwnerId=<%=ownerId.toString()%>&answer(State)=<%=""+planState%>&answer(Object::Customer::State1)=<%=""+State%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(riskTerritory)=<%=""+riskTerritory%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber%>&answer(riskTerritory)=<%=""+riskTerritory%>&answer(zone)=<%=""+riskZone%>'>Application</a>
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="APPLICATION_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bound","Issued","Submitted","Lost"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult" align="left">
							<a href='../ApplicationPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=""+subQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteStatus)=<%=paretQuoteStatus.toString()%>' title="<bean:message key='ToolTip.EndorsementQuoteSummary.ApplicationPDF'/>" target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					</logic:equal>
					</logic:present>
					<%if(isRenewal){ %>
					<dmshtml:GetParameterByOwnerId nameInSession="paramPDF" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="EIL_APPLICATION_PDF" />
					<logic:present name="paramPDF">
					<logic:equal value="TRUE" name="paramPDF">
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="APPLICATION_AVAILABLE" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bound","Issued","Submitted","Lost","Referred","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult" align="left">
							<a target="_new" href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=""+subQuoteId.toString()%>&answer(isRenewalEndorsement)=YES&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteStatus)=<%=paretQuoteStatus.toString()%>' title="<bean:message key='ToolTip.EndorsementQuoteSummary.ApplicationPDF'/>"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>					
					</logic:equal>
					</logic:present>
					<%} %>
					<logic:present name="paramValue">
			   		<logic:equal value="TRUE" name="paramValue">
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult">			
							<a id="gotch" href="../GetDocumentList.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=ISSUANCE&answer(parentQuoteId)=<%= ""+parentQuoteId%>&answer(subQuoteId)=<%= ""+subQuoteId%>&answer(subQuoteVerId)=<%= ""+subQuoteVerId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(ProductId)=<%=""+prodId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId%>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.ScheduleofForms'/>">Schedule of Forms</a>
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					</logic:equal>
					</logic:present>
					<logic:present name="paramValue">
			   		<logic:equal value="FALSE" name="paramValue">
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult">	       
							<a id="gotch" href="../GetDocumentListCL_RoleBased.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=ISSUANCE&answer(parentQuoteId)=<%= ""+parentQuoteId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(subQuoteId)=<%= ""+subQuoteId%>&answer(subQuoteVerId)=<%= ""+subQuoteVerId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(ProductId)=<%=""+prodId%>&answer(prdGroupId)=<%=""+GroupId%>&answer(prdGroupVerId)=<%=""+GroupVerId%>&answer(productStatus)=<%=""+productStatus%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&isRenewal=<%=""+isRenewal %>&answer(stateCode)=<%=""+State%>&answer(State)=<%=""+State%>&answer(Object::UserDetail::roleName)=<%=roleName%>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.ScheduleofForms'/>">Schedule of Forms</a>
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					</logic:equal>
					</logic:present>
					<%if(isRenewal){ %>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Submitted","Issued","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult" align="left">
						<a href="/getRenewalEndorsementSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(policyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Subjectivity'/>">Subjectivity</a>	
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<%} else {%>
					<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
						property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Submitted","Issued","Lapsed"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<td class="SearchResult" align="left">
						<a href="/getEndorsementSubjectivity.go?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::SubQuoteId)=<%=subQuoteId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentPolicyId)=<%=""+parentPolicyId %>&answer(policyVerId)=<%=""+parentPolicyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&isRenewal=<%=""+isRenewal %>" title="<bean:message key='ToolTip.EndorsementQuoteSummary.Subjectivity'/>">Subjectivity</a>	
						</td>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
					<%} %>
					<logic:present name="IS_PRORATA">
							<% String isProrata = "" + request.getAttribute("IS_PRORATA"); %>
								<% if(isProrata.equalsIgnoreCase("YES")) { %>
									<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="WORKSHEET_AVAILABLE" 
										property='<%=new String[]{"In Progress","Referred","Offered","Bind Request","Bound","Issued","Submitted","Lost","Lapsed","Declined"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
										<td class="SearchResult" align="left">
											<a href='../GetEndorsementUWWorkSheetAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(productId)=<%=""+subQuoteProductId %>&answer(productVerId)=<%=""+subQuoteProductVerId %>&answer(QuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(customerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(customerNumber)=<%=EmpGrpNum.toString()%>&answer(modQuoteNumber)=<%=""+QuoteNumber%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+parentPolicyVerId%>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(prevSubQuoteVerId)=<%=""+subQuoteVerId%>&isRenewal=<%=""+isRenewal %>' title="<bean:message key='ToolTip.EndorsementQuoteSummary.Worksheet'/>">Worksheet</a>
										</td>
									</dmshtml:isFeatureAvailableForProductRoleStatus>
								<%}%>
						</logic:present>
				</tr>
				</logic:iterate>
				</logic:present>
				<input type="hidden" name="answer(QuoteId)" value="<%=parentQuoteId.toString()%>"/>
				<input type="hidden" name="answer(Quote::Page)" value="QUOTE SUMMURY"/>
				<input type="hidden" name="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>"/>
				<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />
				<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId %>"/>
				<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>" />
				<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
				<html:hidden property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
				<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
				<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>" />
				<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="effDate"/>
				<html:hidden property="answer(Object::Quote::PolicyEffDate)" value="<%=""+policyEffDate%>" styleId="policyEffDate"/>
				<html:hidden property="answer(Object::Quote::PolicyExpDate)" value="<%=""+policyExpDate%>" styleId="policyExpDate"/>
					<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="true" styleId="isEndorsementQuote" />
				<html:hidden property="answer(q)" value="<%=""+QuoteStatus %>" styleId="Qs2"/>
				<html:hidden property="answer(Object::Quote::QuoteType)" value="<%= ""+QuoteType %>" styleId="Qt1"/>
				<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
				<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyVerId)" value="<%=parentPolicyVerId.toString()%>" />
				<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
				<html:hidden property="answer(isUpdated)" value="Y" />
				<html:hidden property="answer(Object::Activity::ActivityType)" value="<%=""+pName%>"/>
				<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
				<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
					<html:hidden property="answer(pagename)" value="Endorsement summary" styleId="PageName"/>
					<html:hidden property="answer(DEFAULT_POLICY_TAB)" value="EndorsementTab" />
		<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
				<tr>
					<td>
					<!-- TODO: Surround the save button with  dmshtml:isFeatureAvailableForProductRoleStatus tag -->
					<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
						<span title="<bean:message key='ToolTip.EndorsementQuoteSummary.Save'/>"><html:submit value="Save" styleClass="sbttn" /></span>
					</dmshtml:dms_isPresent>	
					</td></tr>
			</table>
			</td>
		</tr>
		</table>
		<table>
			 <tr>
				<td align="left" valign="top">
	<div id="DocumentDiv" style="display:none" >
			<div align="left" >&nbsp; Core Documents</div>
				<div class="frlabel3 left">
					&nbsp;
				</div>
				<div class="frinfo3 left" style="width:450px">	
					<tr>
				<td align="left" valign="top">
				</td>
		</tr>
		<tr>
				<td align="left" valign="top">
					<div id="CoveragesDiv"  style="display:none;">
					</div>
				</td>
		</tr>
		<tr>
				<td align="left" valign="top">
					<div id="QuoteDiv"  style="display:none;" class="todotab_yellowbox">
					</div>
				</td>
		</tr>
		</table>
		</html:form>
		<br>
		<br>
		<br>
		<jsp:include page="../quote/EndorsementQuoteSummaryBodyExtension.jsp"/>
		<table>
		<tr>
			<td>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SENT_EMAIL"}%>' connector='or' negated="true">
					<jsp:include page="../email/DisplayEmailList.jsp">
						<jsp:param name="answer(Object::Notification::Email::ObjectId)" value="<%=""+parentQuoteId %>" />
						<jsp:param name="answer(Object::Notification::Email::ObjectVerId)" value="<%=""+parentQuoteVerId%>" />
						<jsp:param name="answer(Object::Notification::Email::UserName)" value="<%=""+userId%>" />
						<jsp:param name="answer(Object::Notification::Email::SubQuoteVerId)" value="<%=""+parentQuoteVerId%>" />
						<jsp:param name="answer(Object::Notification::Email::QuoteStatus)" value="<%=QuoteStatus %>" />
						<jsp:param name="answer(Object::Notification::Email::EndorsementStatusFlag)" value="YES" />
						<jsp:param name="answer(Object::Notification::UserDetail::Email)" value="<%=""+email%>" />
		  				<jsp:param name="answer(Object::Notification::UserDetail::RoleName)" value="<%=""+roleName%>" />
		  				<jsp:param name="answer(Object::Notification::Email::QuoteNumber)" value="<%=QuoteNumber%>" />
						<jsp:param name="answer(Object::Notification::Email::QuoteSubNumber)" value="<%=QuoteSubNumber%>" />
		  				<jsp:param name="answer(Object::Notification::Email::PolicyNumber)" value="<%=""+policyNumber%>" />
		  				<jsp:param name="answer(Object::Notification::Email::ObjectType)" value="<%=""+objectType %>" />
		  				<jsp:param name="answer(Object::Notification::Email::InsuredName)" value="<%=""+CustomerName %>" />
						
				    </jsp:include>
				</dmshtml:dms_static_with_connector>
			</td>
		</tr>
		<br>
		<tr>		
			 <td>		 
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTACHMENT"}%>' connector='or' negated="true">
				  <%String attachmentType="";%>
					<%if(isRenewal) {
						attachmentType = "QUOTE";
					} else {
						attachmentType = "ENDORSEMENT";
					}%>
				  <jsp:include page="../attachment/Attachment.jsp">
					  <jsp:param name="answer(Object::Attachment::ObjectId)" value="<%=""+parentQuoteId%>" />
					  <jsp:param name="answer(Object::Attachment::ObjectVerId)" value="<%=""+parentQuoteVerId%>" />
					  <jsp:param name="answer(Object::AttachmentObjectLink::ObjectType)" value="<%=attachmentType%>" />
				  </jsp:include>
			  </dmshtml:dms_static_with_connector>
		  </td>
		</tr>
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
	</table>
<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<dmshtml:GetQuoteDetailByQuoteId nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" ownerId="<%=ownerId.toString()%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> 
<%String parentQuoteNumber = ""; %>
<logic:present name="parentQuoteDetail" scope="request">
	<bean:define id="parentQuoteNumTemp" name="parentQuoteDetail" property="quoteNumber" />
	<% parentQuoteNumber = "" + parentQuoteNumTemp; %>
</logic:present>
<dmshtml:getPDFRelativePath nameInSession="pdfDestinationPath" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	<logic:present name="pdfDestinationPath" scope="request">
		<bean:define id="PDFDestinationFilePath" name="pdfDestinationPath" scope="request" />
		<% String strQuoteSubNumber = QuoteSubNumber.toString(); %>
		<% String EmpGrpNum1 ="";  %>
		<%java.util.ArrayList pdfList = new java.util.ArrayList();%>
			<%
				java.util.ArrayList empBasedPdfList = new java.util.ArrayList();
				//String pdfPath = "/AllRisks/Insured/QuotePDFs/"; //com.dms.util.Constants.getVersionedValueOf("QuotePDF_Path_Client");
				//String xmlPath = "/AllRisks/Insured/QuotePDFs/";
				String strQuoteNum = parentQuoteNumber;
				//String strQuoteNum = QuoteNumber.toString();
				if(strQuoteSubNumber.length()>0) {
					strQuoteNum=strQuoteNum+"-"+strQuoteSubNumber;
				}
				String quotestatusnew=paretQuoteStatus.toString();
				if((isRenewal) && (quotestatusnew.equalsIgnoreCase("Bound") || quotestatusnew.equalsIgnoreCase("Issued"))){ 
				%>
					<dmshtml:GetDocumentName nameInSession="PolDocLoc1"
						quoteId="<%=""+parentQuoteId%>" documentType="BINDER"
						ownerId='<%=""+ownerId %>'
						dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					<logic:present name="PolDocLoc1">
					<%
				 	java.util.ArrayList arrPolDoc= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
					%>
					<tr>
					<td class="Error" COLSPAN="2">
					<ol>
					<%
					for(int docIndex=0;docIndex<arrPolDoc.size();docIndex++){		
						com.dms.ejb.notification.email.EmailAttachmentDetail polDocDetail=(com.dms.ejb.notification.email.EmailAttachmentDetail)arrPolDoc.get(docIndex);
					%>
						<li>
						<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 					<%=""+polDocDetail.getAttachementName()%>
						</a>
						</li>
				<%}//end for
			%>
				</ol>
				</td>
				</tr>
			</logic:present>
<%}//end if
else if(isRenewal){%>
					<dmshtml:GetQuoteDocumentName nameInSession="QuoteDocLoc"
						quoteId="<%=""+parentQuoteId%>" documentType="PROPOSAL"
						ownerId='<%=""+ownerId %>'
						dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					<logic:present name="QuoteDocLoc">
					<%
				 	java.util.ArrayList arrQuoteDoc= (java.util.ArrayList)request.getAttribute("QuoteDocLoc");
					%>
					<tr>
					<td class="Error" COLSPAN="2">
					<ol>
					<%
					for(int docIndex=0;docIndex<arrQuoteDoc.size();docIndex++){		
						com.dms.ejb.documentlocation.QuoteDocumentLocationDetail quoteDocDetail=(com.dms.ejb.documentlocation.QuoteDocumentLocationDetail)arrQuoteDoc.get(docIndex);
					%>
						<li>
						<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 					<%=""+quoteDocDetail.getQuoteDocumentName()%>
						</a>
						</li>
				<%}//end for
			%>
				</ol>
				</td>
				</tr>
			</logic:present>
<%}
else{
				{				
					pdfList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+strQuoteNum);
					if (EmpGrpNum1!=null && EmpGrpNum1.length() !=0)
					{
						empBasedPdfList = com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+EmpGrpNum.toString()+"/"+strQuoteNum);
					}
				}
				java.util.ArrayList xmlList = new java.util.ArrayList();
				xmlList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",strQuoteNum+"/SoldQuotes");
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
						onClick="javascript:window.open('<%="../"+PDFDestinationFilePath%><%=strQuoteNum%>/<%=fileName.toString()%>')">
							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%> 
						</a>
					</li>
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
						onClick="javascript:window.open('<%="../"+PDFDestinationFilePath%><%=EmpGrpNum.toString()%>/<%=strQuoteNum%>/<%=fileName2.toString()%>')">
					<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
						BORDER="0" ALT=""><%=fileName2.toString()%> </a></li>
						<%} //end of for loop
					} //end of if((empBasedPdfList !=null && empBasedPdfList.size()>0))
					%>
					</ol>
				<%}%>
				</td>
			</tr>
			<%}%>
		</logic:present>
</table>
<script type="text/javascript">
<!--
	var formElements = document.forms[0];	
	var Status = formElements.Qs2.value;	
	if(Status=="In Progress" || Status=="Referred") {	 
	 formElements.txtDate.readOnly=false;	 
 } else {
 	formElements.txtDate.readOnly=true;
 	formElements.txtDate.style.border = "0px solid #000000";
 }//-->
</script>
<script type="text/javascript">
	var a = document.getElementById('priorpolicyheadernav');
	if((a != null) && (a != undefined))
		a.id = 'policyheadernav';
</script>