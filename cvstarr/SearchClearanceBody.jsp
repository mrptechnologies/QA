<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="CheckClearance" property="answer(Object::Customer::CustomerId)" scope="request"/> 
<bean:define id="cId" name="CheckClearance" property="answer(Object::Customer::CustomerId)"scope="request"/>
<bean:define id="isClearance" name="CheckClearance" property="answer(Object::isClearance)" />

<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<bean:define id="ProposedEffDate" name="CheckClearance" property="answer(Object::Clearance::ProposedEffectiveDate)"/>
<%String agencyIdTemp="";%> 
<%String agencyIdtoLink="";%>
<%String strAgentFName="";%>
<%String strAgentLName="";%>
<%long lngAgentId1=0;%>
<%long lngAgencyTemp=0;%>
<%long agencyId2=0;%>
<%String agencyName2="";%>
<%long generalagencyid2=0;%>
<%String generalagencyname2="";
String agencyAgentId="";%>

<%if (request.getParameter("agencyIdtoLink")!= null) {
agencyIdtoLink=request.getParameter("agencyIdtoLink");
agencyId2=Long.parseLong(agencyIdtoLink.toString());
}%>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />
<input type="hidden" name="frmtmpid" value="CLERANCERESULT">
<html:hidden property="formName" value="form::CLERANCERESULT" />
<bean:define id="AgencyID" property="answer(Object::UserDetail::AgencyId)" name="LoginPage" scope="session" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
	
<bean:define id="Customerid" name="CheckClearance" property="answer(Object::Customer::CustomerId)" scope="request"/> 
<bean:define id="cId" name="CheckClearance" property="answer(Object::Customer::CustomerId)"scope="request"/>
<bean:define id="submissionId" property="answer(Object::Submission::SubmissionId)" name="CheckClearance" scope="request"/>
<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="CheckClearance" scope="request"/>
<%String submissionVerId3 = ""+submissionVerId;
	if(submissionVerId3.equals("")){%>
		<bean:define id="submissionVerId4" property="answer(Object::Submission::SubmissionVerId)" name="AddParentQuote" />	
		
	<%submissionVerId3 = ""+submissionVerId4;
	}%>

<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td height="5">
		</td>
	</tr>	
	<tr><td>&nbsp;</td></tr>		
	<tr><td></td></tr><tr><td>
	<html:form action="/SearchClearanceFailureAction">
	<div class="SubjectivityPage">
	<div class="content">		
			<div class="formhead"><h2 class="left">CLEARANCE FAILURE</h2></div>			
					<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
					<div class="FormLabels" align="center">
					<br>
					<br>								
							<b>There is a potential clearance issue. Would you like an underwriter to research the issue and get back to you?</b>
					</div>
					<br>													
					<br>	
				<table align="center">
				<tr>
		                <td width="50%" >
						<html:submit value="Yes" property="answer(button)" styleClass="covbutton"  />
						</td>
					
						<td width="50%" >								
						<html:button value="No" property="answer(button)" styleClass="covbutton"  onclick="javascript:history.go(-1);" />																
			            </td>
	          </tr>
	       </table>				
                    <br>
					<br>					
		</div>
		</div>		
	</td></tr>			
</table>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<html:hidden property="answer(Object::Clearance::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(AgentId)" name="CheckClearance" />
	<html:hidden property="answer(Object::Customer::City)"  name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::County)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::State)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::CustomerName)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::CustomerName2)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::NameType)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::DBA)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Clearance::Zipcode)" name="CheckClearance"/>
	<bean:define id="Zip" property="answer(Object::Clearance::Zipcode)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::Zip)" value='<%=""+Zip%>'/>
	<html:hidden property="answer(Object::isClearance)"  styleId="isClearance" value='<%=""+isClearance%>'/>
	<html:hidden property="answer(Object::Customer::ContactFName)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::ContactLName)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Submission::CreatedBy)" name="CheckClearance" />  
   	<html:hidden property="answer(Object::Submission::UpdatedBy)" name="CheckClearance" />
   	<html:hidden property="answer(Agency::AgencyId)" name="CheckClearance" />
   	<html:hidden property="answer(AgentId)" name="CheckClearance" />
   	<html:hidden property="answer(Object::Submission::ClearanceStatus)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Submission::Status)" name="CheckClearance"/>	
	<html:hidden property="answer(Object::Customer::Status)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+Customerid%>' />
	<html:hidden property="answer(Object::PageType)" name="CheckClearance" />
	<html:hidden property="answer(Object::Clearance::ErrorMessage)" value="dsafasd" />
		
	<bean:define id="agencyId12" name="CheckClearance" property="answer(Object::Agency::AgencyId)" />
	<bean:define id="submissionId1" property="answer(Object::Submission::SubmissionId)" name="CheckClearance" />
	<bean:define id="submissionVerId1" property="answer(Object::Submission::SubmissionVerId)" name="CheckClearance" />	
	<%String submissionVerId2 = ""+submissionVerId1;
	if(submissionVerId2.equals("")){%>
		<bean:define id="submissionVerId5" property="answer(Object::Submission::SubmissionVerId)" name="AddParentQuote" />	
		
	<%submissionVerId2 = ""+submissionVerId5;
	}%>
	<html:hidden property="answer(createQuoteEffectiveDate)" value="yes"/>	
	<html:hidden property="answer(Object::Quote::SubmissionId)" value="<%=""+submissionId1%>"/>
	<html:hidden property="answer(Object::Quote::SubmissionVerId)" value="<%=""+submissionVerId2%>"/>	
	<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />
	<html:hidden property="formName" value="form::GETCLQUOTEDETAILS" />
	<html:hidden property="answer(Object::Quote::primaryEntityId)" name="AddCustomer" value="1" /> 
	<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=""+agencyId12%>' />
	<html:hidden property="answer(Object::PageType)" name="CheckClearance" />
	
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />	
	<html:hidden property="answer(Object::Quote::ProductStatus)" value="RELEASED" />
	
	<html:hidden property="answer(Object::Risk::RiskId)" value="11" />
	<html:hidden property="answer(Object::Quote::NewQuote)" value="YES" />
	
	<!-- Added for quote side -->
	<html:hidden property="formName" name="CheckClearance"/>
	<html:hidden property="answer(Object::Product::ProductState)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Agency::AgencyId)" name="CheckClearance"/>
	<html:hidden property="page" name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::QuoteType)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Product::ProductState)" name="CheckClearance"/>
	<html:hidden property="answer(QuoteId)" name="CheckClearance"/>
	<html:hidden property="answer(parentQuoteId)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::ParentQuoteId)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::ParentQuoteVerId)" name="CheckClearance"/>
	<html:hidden property="answer(Quote::Page)" name="CheckClearance"/>			
	<html:hidden property="answer(Object::Plan::CreatedBy)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Plan::UpdatedBy)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::CreatedBy)"  name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::UpdatedBy)"  name="CheckClearance"/>
	<html:hidden property="answer(Object::Plan::dbName)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::dbName)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::LockStatus)" name="CheckClearance"/>	
	
	<html:hidden property="answer(ProductId)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::ProductId)" name="CheckClearance"/>

	<html:hidden property="answer(ProductVerId)" name="CheckClearance"/>		
	<html:hidden property="answer(ParentQuoteVerId)" name="CheckClearance"/>
	<html:hidden property="answer(ProductFamilyId)" name="CheckClearance"/>
	
	<!-- Rules Related Variables: START -->
	<html:hidden property="answer(RULE_OBJECT_ID)" name="CheckClearance"/>
	<html:hidden property="answer(RULE_OBJECT_VER_ID)" name="CheckClearance"/>
	<html:hidden property="answer(RULE_OBJECT_TYPE)" name="CheckClearance"/>
	<html:hidden property="answer(RULE_OBJECT_NAME)" name="CheckClearance"/>
	<html:hidden property="answer(MERGE_BEFORE)" name="CheckClearance"/>
	<html:hidden property="answer(MERGE_AFTER)" name="CheckClearance"/>
	<html:hidden property="answer(ASSERT_MAP_ENTRIES)" name="CheckClearance"/>
	<html:hidden property="answer(MODIFIED_FACT_MAP)" name="CheckClearance"/>
	<html:hidden property="answer(DocumentType)" name="CheckClearance" />
	<html:hidden property="answer(OwnerId)" name="CheckClearance" />
	<html:hidden property="answer(isUpdated)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Activity::OwnerId)" name="CheckClearance"/> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" name="CheckClearance"/> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" name="CheckClearance"/> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" name="CheckClearance"/> 
	<html:hidden property="answer(Object::Activity::ObjectType)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" name="CheckClearance"/>
	<html:hidden property="answer(pagename)" name="CheckClearance"/>
	<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" name="CheckClearance"/>
	<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" name="CheckClearance"/>
	<html:hidden property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" name="CheckClearance"/>
	<!-- Rules Related Variables: END -->
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<html:hidden property="answer(Object::Quote::ProductVerId)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Rules::ActionForward)" name="CheckClearance"/>
	<html:hidden property="answer(Object::PageType)" name="CheckClearance"/>
	
	<html:hidden property="answer(Object::Submission::SubmissionId)" value="<%=""+submissionId%>"/>
	<html:hidden property="answer(Object::Submission::SubmissionVerId)" value="<%=""+submissionVerId3%>"/>
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+Customerid%>"/>
	<html:hidden property="answer(customerId)" value="<%=""+Customerid%>"/>
	
	<html:hidden property="answer(cId)" value="<%=""+cId%>"/>
	<html:hidden property="answer(Object::Submission::ClearanceCheck::SubmissionVerId)" value="<%=""+submissionVerId3%>"/>
		
	<html:hidden property="answer(Object::Submission::SubmissionVerId)" value="<%=""+submissionVerId3%>"/>
	<html:hidden property="answer(Object::Submission::SubmissionId)" value="<%=""+submissionId%>"/>
	<html:hidden property="answer(requestForm)" value="<%="Submission"%>"/>
	<html:hidden property="answer(Object::Application::ApplicationType)" value="<%="SUBMISSION_APPLICATION"%>"/>
	<html:hidden property="answer(Object::Submission::InsuredId)" value="<%=""+Customerid%>"/>
	
</html:form>
