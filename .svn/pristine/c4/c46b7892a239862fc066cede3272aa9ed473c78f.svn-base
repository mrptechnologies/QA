<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>


<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="CheckClearance" property="answer(Object::Customer::CustomerId)" scope="request"/> 
<bean:define id="cId" name="CheckClearance" property="answer(Object::Customer::CustomerId)"scope="request"/>
<bean:define id="submissionId" property="answer(Object::Submission::SubmissionId)" name="CheckClearance" scope="request"/>
<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="CheckClearance" scope="request"/>
<bean:define id="sourcePageName" property="answer(pagename)" name="CheckClearance"/>
<bean:define id="searchResultSourcePageName" property="answer(sourcePageName)" name="CheckClearance"/>

<%String qsubmissionId=""; %>
<%String qsubmissionVerId=""; %>

<%String currentCustomerId="";%>

<%
String pageName = "";
if(request.getParameter("answer(pagename)") != null) {
	pageName = request.getParameter("answer(pagename)");
}
if(pageName.equalsIgnoreCase("")) {
	pageName = "" + sourcePageName;
}
if(pageName.equalsIgnoreCase("")) {
	pageName = "" + searchResultSourcePageName;
}
%>


<%if(request.getAttribute("Object::Submission::SubmissionId")!= null ) {%>
<%qsubmissionId=""+request.getAttribute("Object::Submission::SubmissionId");%>
<%}%>
<%if(request.getAttribute("Object::Submission::SubmissionVerId")!= null ) {%>
<%qsubmissionVerId=""+request.getAttribute("Object::Submission::SubmissionVerId");%>
<%}%>

<%if(!cId.equals("")){ 
	currentCustomerId = ""+cId;
}%>
<%if(submissionId.equals("")){ 
	submissionId = ""+qsubmissionId;
}%>
<%if(submissionVerId.equals("")){ 
	submissionVerId = ""+qsubmissionVerId;
}%>

<%String quoteId=""; %>
<%String quoteVerId=""; %>
<%String ProductVerId=""; %>
<%String ProductId=""; %>
<%String paretQuoteStatus=""; %>
<%if(request.getAttribute("parentQuoteId")!= null ) {%>
<%quoteId=""+request.getAttribute("parentQuoteId");%>
<%}%>

<%if(request.getAttribute("Object::Quote::QuoteVerId")!= null ) {%>
<%quoteVerId=""+request.getAttribute("Object::Quote::QuoteVerId");%>
<%}%>

<%if(request.getAttribute("Object::Quote::ProductVerId")!= null ) {%>
<%ProductVerId=""+request.getAttribute("Object::Quote::ProductVerId");%>
<%}%>

<%if(request.getAttribute("Object::Quote::ProductId")!= null ) {%>
<%ProductId=""+request.getAttribute("Object::Quote::ProductId");%>
<%}%>

<%if(request.getAttribute("Object::Quote::QuoteStatus")!= null ) {%>
<%paretQuoteStatus=""+request.getAttribute("Object::Quote::QuoteStatus");%>
<%}%>



<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<bean:define id="ProposedEffDate" name="CheckClearance" property="answer(Object::Clearance::ProposedEffectiveDate)"/>
<bean:define id="ProposedEffDate1" name="CheckClearance" property="answer(Object::Clearance::ProposedEffectiveDate1)"/>
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

<html:form action="/SearchClearanceFailureAction.do">
	<div class="locformbox2">
<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>						
								<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
							</tr>
							<tr>
							<%if(!submissionId.equals("")){%>
							<td>
								<a id="submissionSummaryPageLink" href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerId%>&answer(Object::Submission::SubmissionId)=<%=""+submissionId%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(customerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" >
										Submission Summary
								</a>
							<%}%>
							</td> 
							<td>&nbsp;</td>
								<td>
									<%if(!quoteId.equals("")&&!quoteVerId.equals("")&&!cId.equals("")){ %>
									<a id="quoteSummaryPageLink" href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+quoteVerId%>&answer(QuoteId)=<%=quoteId.toString()%>&answer(parentQuoteId)=<%=quoteId.toString()%>">
												Quote Summary
									</a>
									<%}%>
								</td>
								
							</tr>
							<tr>						
								<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
							</tr>

							
						</table>
						</div>
	<div class="locformbox2">
	<div class="formhead"><h2 class="left">CHECK CLEARANCE RESULT</h2></div>
	<table WIDTH="96%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td height="5">
		</td>
	</tr>
	<tr>
		<td valign="top" align="left">
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">										
					<tr> 
					 <td>						
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">																					
							<tr>
								<td  class="Error" align="left" colspan="4">Clearance Failed: Matching Insured found </td>
							</tr>
							
						</table>
					  </td>
					 </tr>							
		</table>
		</td>				
	</tr>
	<tr><td>&nbsp;</td></tr>		
	<tr><td></td></tr><tr><td>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="true">	
		<logic:present name='ClearanceRecords' scope="request" >
<table class="loctable" cellpadding="0" cellspacing="0">	
<tr><th valign="center" align="center">S.No</th><th valign="center" align="center">Used in Clearance Check</th><th valign="center" align="center">
Broker Name</th><th>Insured Name Type</th><th>Insured Name1</th><th>Insured Name2</th><th>
DBA</th><th>State</th><th>Country</th><th>Insured Zip code</th><th>Line of Business</th><th>Submission# </th>
<th>Quote#</th><th>Policy# </th><th>Clearance Reservation Expiration Date</th></tr>							
               
				<%
					java.util.ArrayList arrlistdocs = (java.util.ArrayList)request.getAttribute("ClearanceRecords");
					int index=0;
					for(int docIndex=0;docIndex<arrlistdocs.size();docIndex++){
						com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistdocs.get(docIndex);										
				%>														
               <tr bordercolor="#000000">
					<td>
						<% index++;%>
						<%=index%>
						<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::ClearanceSource")%>&answer(Object::Clearance::LineOfBusinessId)=<%=qmap.getString("Object::Clearance::LineOfBusinessId")%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(Object::Clearance::SubmissionId)=<%=qmap.getString("Object::Clearance::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Clearance::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Customer::ClearanceLinked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(Object::QuoteLink::QuoteId)=<%=quoteId%>&answer(Object::QuoteLink::QuoteVerId)=<%=quoteVerId%>&answer(Object::QuoteLink::ProductVerId)=<%=ProductVerId%>&answer(Object::QuoteLink::paretQuoteStatus)=<%=paretQuoteStatus%>&answer(Object::SubmissionLink::submissionId)=<%=submissionId%>&answer(Object::SubmissionLink::submissionVerId)=<%=submissionVerId%>&answer(Object::SubmissionLink::customerId)=<%=currentCustomerId%>&answer(pagename)=<%="" + pageName %>'>
						<IMG SRC="../Images/Edit.gif"  BORDER="0" align="top">
						</a>							
					</td>
					<td>
						<%if(qmap.getString("Object::Customer::ClearanceLinked").equals("Y")){ %>
												<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::ClearanceSource")%>&answer(Object::Clearance::LineOfBusinessId)=<%=qmap.getString("Object::Clearance::LineOfBusinessId")%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(Object::Clearance::SubmissionId)=<%=qmap.getString("Object::Clearance::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Clearance::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Customer::ClearanceLinked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(Object::QuoteLink::QuoteId)=<%=quoteId%>&answer(Object::QuoteLink::QuoteVerId)=<%=quoteVerId%>&answer(Object::QuoteLink::ProductVerId)=<%=ProductVerId%>&answer(Object::QuoteLink::paretQuoteStatus)=<%=paretQuoteStatus%>&answer(Object::SubmissionLink::submissionId)=<%=submissionId%>&answer(Object::SubmissionLink::submissionVerId)=<%=submissionVerId%>&answer(Object::SubmissionLink::customerId)=<%=currentCustomerId%>&answer(pagename)=<%="" + pageName %>'><%="Yes - Blocking"%></a>
						<%} %>
						<%if(qmap.getString("Object::Customer::ClearanceLinked").equals("N")){ %>
												<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::ClearanceSource")%>&answer(Object::Clearance::LineOfBusinessId)=<%=qmap.getString("Object::Clearance::LineOfBusinessId")%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(Object::Clearance::SubmissionId)=<%=qmap.getString("Object::Clearance::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Clearance::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Customer::ClearanceLinked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(Object::QuoteLink::QuoteId)=<%=quoteId%>&answer(Object::QuoteLink::QuoteVerId)=<%=quoteVerId%>&answer(Object::QuoteLink::ProductVerId)=<%=ProductVerId%>&answer(Object::QuoteLink::paretQuoteStatus)=<%=paretQuoteStatus%>&answer(Object::SubmissionLink::submissionId)=<%=submissionId%>&answer(Object::SubmissionLink::submissionVerId)=<%=submissionVerId%>&answer(Object::SubmissionLink::customerId)=<%=currentCustomerId%>&answer(pagename)=<%="" + pageName %>'><%="No - Not Blocking"%></a>
						<%} %>						
					</td>
					<td>
						<%=qmap.getEncodedString("Object::Clearance::AgencyName") %>
					</td>
					<td>
						<%=qmap.getString("Object::Clearance::NameType") %>
					</td>										
					<td>
						<%=qmap.getEncodedString("Object::Clearance::LegalName1") %>									
					</td>									
					<td>
						<%=qmap.getEncodedString("Object::Clearance::LegalName2") %>									
					</td>
					<td>
						<%=qmap.getEncodedString("Object::Clearance::DBA") %>
					</td>
					<td>
						<%=qmap.getString("Object::Customer::State") %>
					</td>
					<td>
						<%=qmap.getString("Object::Customer::Address::Country") %>
					</td>
					<td>
						<%=qmap.getString("Object::Clearance::Zipcode") %>
					</td>
					<td>
						<%=qmap.getString("Object::Clearance::LineOfBusiness") %>
					</td>																				
					<td>
					<%if(qmap.getString("Object::Clearance::ClearanceSource").equals("SOLARTIS")){ %> 
					<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+qmap.getString("Object::Clearance::SubmissionVerId")%>&answer(Object::Submission::SubmissionId)=<%=""+qmap.getString("Object::Clearance::SubmissionId")%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=""+qmap.getString("Object::Clearance::CustomerId")%>&customerId=<%=""+qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Customer::CustomerId)=<%=""+qmap.getString("Object::Clearance::CustomerId")%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+qmap.getString("Object::Clearance::CustomerId")%>" >
						<%=qmap.getString("Object::Clearance::SubmissionNumber") %>
					</a>
					<%}else{ %>
						<%=qmap.getString("Object::Clearance::SubmissionNumber") %>
					<%}%>
					</td>
<!--					<td class="SearchResult" align="center" >	
					<%if(!(qmap.getString("Object::Clearance::SubmissionReservationExpiryDate").equals("null"))) { %>					  				
						<%=qmap.getString("Object::Clearance::SubmissionReservationExpiryDate") %>	
					<% } %>					
					</td>
 					
					<td class="FormLabels" align="center" >
					<%if(qmap.getString("Object::Clearance::ClearanceSource").equals("GENIUS")){ %> 
							<%=qmap.getString("Object::Submission::MasterStatus") %>
					<%}%>
					</td>
 -->	
					<td>
					<%if(qmap.getString("Object::Clearance::ClearanceSource").equals("SOLARTIS")){ %>
						<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Agency::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(parentQuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>">
						<%=qmap.getString("Object::Clearance::QuoteNumber")%>
						</a>
						<%}else{ %>
						<%=qmap.getString("Object::Clearance::QuoteNumber")%>
					<%}%>
					</td>					
<!--					<td class="SearchResult" align="center" >
					<%if(!(qmap.getString("Object::Clearance::QuoteExpiryDate").equals("null"))) { %>
						<%=qmap.getString("Object::Clearance::QuoteExpiryDate") %>
					<% } %>
					</td>
  					<td class="FormLabels" align="center" >
					<%if(qmap.getString("Object::Clearance::ClearanceSource").equals("GENIUS")){ %> 
							<%=qmap.getString("Object::Quote::MasterStatus") %>
					<%}%>
					</td>
-->					
					<td>
					<%if(qmap.getString("Object::Clearance::ClearanceSource").equals("SOLARTIS")){ %> 
					<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(TabPanelName)=Policy_Panel&answer(policyNumber)=<%=""+qmap.getString("Object::Clearance::PolicyNumber")%>">						
						<%=""+qmap.getString("Object::Clearance::PolicyNumber") %> 
					</a>
					<%}else{ %>
						<%=""+qmap.getString("Object::Clearance::PolicyNumber") %>
					<%}%>
					</td>
<!--					<td class="SearchResult" align="center" >
					<%if(!(qmap.getString("Object::Clearance::PolicyExpiryDate").equals("null"))) { %>
						<%=qmap.getString("Object::Clearance::PolicyExpiryDate") %>
					<% } %>
					</td>
-->					
					<td>							  				
						<%=qmap.getString("Object::Clearance::MaxClearanceReservationDate") %>	
					</td>
<!-- 					
					<td class="FormLabels" align="center" >
						<%if(qmap.getString("Object::Clearance::ClearanceSource").equals("GENIUS")){ %> 
							<%=qmap.getString("Object::Policy::MasterStatus") %>
					<%}%>
					</td>
 -->					
					<!-- 
					<td class="SearchResult" align="left" >
			   	  		<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::ClearanceSource")%>&answer(Object::Clearance::LineOfBusinessId)=<%=qmap.getString("Object::Clearance::LineOfBusinessId")%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(Object::Clearance::SubmissionId)=<%=qmap.getString("Object::Clearance::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Clearance::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Customer::ClearanceLinked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(Object::QuoteLink::QuoteId)=<%=quoteId%>&answer(Object::QuoteLink::QuoteVerId)=<%=quoteVerId%>&answer(Object::QuoteLink::ProductVerId)=<%=ProductVerId%>&answer(Object::QuoteLink::paretQuoteStatus)=<%=paretQuoteStatus%>&answer(Object::SubmissionLink::submissionId)=<%=submissionId%>&answer(Object::SubmissionLink::submissionVerId)=<%=submissionVerId%>&answer(Object::SubmissionLink::customerId)=<%=currentCustomerId%>'><%=qmap.getString("Object::Clearance::Status")%></a>
					</td>	
					-->
					
																				
				</tr>							
				<%}%>							
				<tr><td>&nbsp;</td>
				</tr>		
				<tr   align="center">
					<td colspan="5">	
					<div class="field">
					<% if(("" + sourcePageName).equalsIgnoreCase("Created Quote Proposal") || ("" + sourcePageName).equalsIgnoreCase("Created Bind Request") || ("" + sourcePageName).equalsIgnoreCase("Issue Binder page")) { %>
						<html:button value="Go To Quote Summary Page" style="width:225px" property="answer(button)" styleClass="covbutton"  onclick="gotoQuoteSummaryPage();" />
					<%} else if(("" + sourcePageName).equalsIgnoreCase("Underwriter worksheet page")) { %>
						<html:button value="Go To Quote Summary Page" style="width:225px" property="answer(button)" styleClass="covbutton"  onclick="gotoQuoteSummaryWorksheetTab();" />
					<%} else if(("" + searchResultSourcePageName).equalsIgnoreCase("Created Quote Proposal") || ("" + searchResultSourcePageName).equalsIgnoreCase("Created Bind Request") || ("" + searchResultSourcePageName).equalsIgnoreCase("Issue Binder page")) { %>
						<html:button value="Go To Quote Summary Page" style="width:225px" property="answer(button)" styleClass="covbutton"  onclick="gotoQuoteSummaryPage();" />
					<%} else if(("" + searchResultSourcePageName).equalsIgnoreCase("Underwriter worksheet page")) { %>
						<html:button value="Go To Quote Summary Page" style="width:225px" property="answer(button)" styleClass="covbutton"  onclick="gotoQuoteSummaryWorksheetTab();" />
					<%} else if(("" + pageName).equalsIgnoreCase("Register Submission Page") || ("" + pageName).equalsIgnoreCase("Add/Edit Location/Tank Page")) { %>
						<html:button value="Go To Submission Summary Page" style="width:275px" property="answer(button)" styleClass="covbutton"  onclick="gotoSubmissionSummaryPage();" />
					<%}%>
					
						</div>			
					</td>
					<td colspan="2">
					<div class="field">
					<html:submit value="Continue" property="answer(button)" styleClass="covbutton" />
					</div>
					</td>
				</tr>
			</table>								
		
			</logic:present>						
			</dmshtml:dms_static_with_connector>			
	</td>
	</tr>
				

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
	<html:hidden property="answer(Object::Customer::ContactFName)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::ContactLName)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate1)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Submission::CreatedBy)" name="CheckClearance" />   
   	<html:hidden property="answer(Object::Submission::UpdatedBy)" name="CheckClearance" />
   	<html:hidden property="answer(Object::Submission::UpdatedBy)" name="CheckClearance" />
   	<html:hidden property="answer(Agency::AgencyId)" name="CheckClearance" />
   	<html:hidden property="answer(AgentId)" name="CheckClearance" />
   	<html:hidden property="answer(Object::Submission::ClearanceStatus)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Submission::Status)" name="CheckClearance"/>	
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+Customerid%>' />
	<html:hidden property="answer(Object::PageType)" name="CheckClearance" />	
	
	
	<bean:define id="agencyId12" name="CheckClearance" property="answer(Object::Agency::AgencyId)" />
	<bean:define id="submissionId1" property="answer(Object::Submission::SubmissionId)" name="CheckClearance" />
	<bean:define id="submissionVerId1" property="answer(Object::Submission::SubmissionVerId)" name="CheckClearance" />	
	
	<html:hidden property="answer(createQuoteEffectiveDate)" value="yes"/>	
	<html:hidden property="answer(Object::Quote::SubmissionId)" value="<%=""+submissionId1%>"/>
	<html:hidden property="answer(Object::Quote::SubmissionVerId)" value="<%=""+submissionVerId1%>"/>
		<html:hidden property="answer(Object::Submission::SubmissionId)" value="<%=""+submissionId%>"/>
	<html:hidden property="answer(Object::Submission::SubmissionVerId)" value="<%=""+submissionVerId%>"/>
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+Customerid%>"/>
	<html:hidden property="answer(cId)" value="<%=""+cId%>"/>
	
	<bean:define id="Customerid" name="CheckClearance" property="answer(Object::Customer::CustomerId)" scope="request"/> 
<bean:define id="cId" name="CheckClearance" property="answer(Object::Customer::CustomerId)"scope="request"/>
<bean:define id="submissionId" property="answer(Object::Submission::SubmissionId)" name="CheckClearance" scope="request"/>
<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="CheckClearance" scope="request"/>
	
	<html:hidden property="formName" value="form::GETCLQUOTEDETAILS" />
	<html:hidden property="answer(Object::Quote::primaryEntityId)" value="1" /> 
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
	
	
</table>
</div>

</html:form>

<SCRIPT type="text/JavaScript">
function GoToUseOrNotClearance()
{
	document.forms[0].action="../UseClearance.do";	
	document.forms[0].submit();	
}

function gotoQuoteSummaryPage() {
	if(document.getElementById("quoteSummaryPageLink") != null && document.getElementById("quoteSummaryPageLink") != undefined) {
		document.location = document.getElementById("quoteSummaryPageLink").href;
	}
}
function gotoQuoteSummaryWorksheetTab() {
	if(document.getElementById("quoteSummaryPageLink") != null && document.getElementById("quoteSummaryPageLink") != undefined) {
		document.location = document.getElementById("quoteSummaryPageLink").href + "&answer(activeTabName)=UW_WORKSHEET_Tab";
	}
}
function gotoSubmissionSummaryPage() {
	if(document.getElementById("submissionSummaryPageLink") != null && document.getElementById("submissionSummaryPageLink") != undefined) {
		document.location = document.getElementById("submissionSummaryPageLink").href;
	}
}
</SCRIPT>
