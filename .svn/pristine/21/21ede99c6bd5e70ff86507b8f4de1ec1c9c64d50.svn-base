<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<bean:define id="ClearanceForwardPage" name="CheckClearance" property="answer(Object::Submission::ClearanceForwardPage)" scope="request"/>
<logic:equal name="CheckClearance" property="answer(Object::Submission::ClearanceForwardPage)" value="failure_show_list">UNDERWRITER_SHOW_LIST$HTMLSPLITTER$
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="CheckClearance" property="answer(Object::Customer::CustomerId)" scope="request"/> 
<bean:define id="cId" name="CheckClearance" property="answer(Object::Customer::CustomerId)"scope="request"/>
<bean:define id="submissionId" property="answer(Object::Submission::SubmissionId)" name="CheckClearance" scope="request"/>
<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="CheckClearance" scope="request"/>
<bean:define id="legalName1" property="answer(Object::Clearance::LegalName1)" name="CheckClearance"/>
<bean:define id="firstName" property="answer(Object::Clearance::FirstName)" name="CheckClearance"/>
<bean:define id="nameType" property="answer(Object::Clearance::NameType)" name="CheckClearance"/>
<bean:define id="zipCode" property="answer(Object::Clearance::Zipcode)" name="CheckClearance"/>
<bean:define id="customerCity" property="answer(Object::Customer::City)" name="CheckClearance"/>
<bean:define id="customerState" property="answer(Object::Customer::State)" name="CheckClearance"/>
<bean:define id="customerCounty" property="answer(Object::Customer::County)" name="CheckClearance"/>
<bean:define id="country" property="answer(Object::Customer::Address::Country)" name="CheckClearance"/>
<bean:define id="effectiveMonth" property="answer(Month)" name="CheckClearance"/>
<bean:define id="effectiveDate" property="answer(Date)" name="CheckClearance"/>
<bean:define id="effectiveYear" property="answer(Year)" name="CheckClearance"/>
<bean:define id="agentId" property="answer(AgentId)" name="CheckClearance"/>
<bean:define id="agencyId" property="answer(Agency::AgencyId)" name="CheckClearance"/>
<bean:define id="sourcePageName" property="answer(pagename)" name="CheckClearance"/>

<html:hidden property="answer(Object::Submission::ClearanceForwardPage)" name="CheckClearance"  value="failure_show_list" />
<%String qsubmissionId=""; %>
<%String qsubmissionVerId=""; %>
<%String currentCustomerId="";%>
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

<div class="locformbox1"><br />
	<div class="formhead"><h2 class="left">CHECK CLEARANCE RESULT</h2></div>
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
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
						<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::ClearanceSource")%>&answer(Object::Clearance::LineOfBusinessId)=<%=qmap.getString("Object::Clearance::LineOfBusinessId")%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(Object::Clearance::SubmissionId)=<%=qmap.getString("Object::Clearance::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Clearance::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Customer::ClearanceLinked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(Object::QuoteLink::QuoteId)=<%=quoteId%>&answer(Object::QuoteLink::QuoteVerId)=<%=quoteVerId%>&answer(Object::QuoteLink::ProductVerId)=<%=ProductVerId%>&answer(Object::QuoteLink::paretQuoteStatus)=<%=paretQuoteStatus%>&answer(Object::SubmissionLink::submissionId)=<%=submissionId%>&answer(Object::SubmissionLink::submissionVerId)=<%=submissionVerId%>&answer(Object::SubmissionLink::customerId)=<%=currentCustomerId%>&answer(pagename)=<%="" + sourcePageName %>&answer(Object::Clearance::LegalName1)=<%="" + legalName1 %>&answer(Object::Clearance::FirstName)=<%="" + firstName %>&answer(Object::Clearance::NameType)=<%="" + nameType %>&answer(Object::Clearance::Zipcode)=<%="" + zipCode %>&answer(Object::Customer::Address::Country)=<%="" + country %>&answer(Month)=<%="" + effectiveMonth %>&answer(Date)=<%="" + effectiveDate %>&answer(Year)=<%="" + effectiveYear %>&answer(Object::Customer::City)=<%="" + customerCity %>&answer(Object::Customer::State)=<%="" + customerState %>&answer(Object::Customer::County)=<%=""+ customerCounty %>&answer(AgentId)=<%="" + agentId %>&answer(Agency::AgencyId)=<%="" + agencyId %>'>
						<IMG SRC="../Images/Edit.gif"  BORDER="0" align="top">
						</a>							
					</td>
					<td>
						<%if(qmap.getString("Object::Customer::ClearanceLinked").equals("Y")){ %>
												<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::ClearanceSource")%>&answer(Object::Clearance::LineOfBusinessId)=<%=qmap.getString("Object::Clearance::LineOfBusinessId")%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Customer::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(Object::Clearance::SubmissionId)=<%=qmap.getString("Object::Clearance::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Clearance::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Customer::ClearanceLinked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(Object::QuoteLink::QuoteId)=<%=quoteId%>&answer(Object::QuoteLink::QuoteVerId)=<%=quoteVerId%>&answer(Object::QuoteLink::ProductVerId)=<%=ProductVerId%>&answer(Object::QuoteLink::paretQuoteStatus)=<%=paretQuoteStatus%>&answer(Object::SubmissionLink::submissionId)=<%=submissionId%>&answer(Object::SubmissionLink::submissionVerId)=<%=submissionVerId%>&answer(Object::SubmissionLink::customerId)=<%=currentCustomerId%>&answer(Object::Submission::SubmissionId)=<%=qmap.getString("Object::Clearance::SubmissionId")%>&answer(Object::Submission::SubmissionVerId)=<%=submissionVerId%>&answer(pagename)=<%="" + sourcePageName %>&answer(Object::Clearance::LegalName1)=<%="" + legalName1 %>&answer(Object::Clearance::FirstName)=<%="" + firstName %>&answer(Object::Clearance::NameType)=<%="" + nameType %>&answer(Object::Clearance::Zipcode)=<%="" + zipCode %>&answer(Object::Customer::Address::Country)=<%="" + country %>&answer(Month)=<%="" + effectiveMonth %>&answer(Date)=<%="" + effectiveDate %>&answer(Year)=<%="" + effectiveYear %>&answer(Object::Customer::City)=<%="" + customerCity %>&answer(Object::Customer::State)=<%="" + customerState %>&answer(Object::Customer::County)=<%=""+ customerCounty %>&answer(AgentId)=<%="" + agentId %>&answer(Agency::AgencyId)=<%="" + agencyId %>'><%="Yes - Blocking"%></a>
						<%} %>
						<%if(qmap.getString("Object::Customer::ClearanceLinked").equals("N")){ %>
												<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::ClearanceSource")%>&answer(Object::Clearance::LineOfBusinessId)=<%=qmap.getString("Object::Clearance::LineOfBusinessId")%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(Object::Clearance::SubmissionId)=<%=qmap.getString("Object::Clearance::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Clearance::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Customer::ClearanceLinked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(Object::QuoteLink::QuoteId)=<%=quoteId%>&answer(Object::QuoteLink::QuoteVerId)=<%=quoteVerId%>&answer(Object::QuoteLink::ProductVerId)=<%=ProductVerId%>&answer(Object::QuoteLink::paretQuoteStatus)=<%=paretQuoteStatus%>&answer(Object::SubmissionLink::submissionId)=<%=submissionId%>&answer(Object::SubmissionLink::submissionVerId)=<%=submissionVerId%>&answer(Object::SubmissionLink::customerId)=<%=currentCustomerId%>&answer(pagename)=<%="" + sourcePageName %>&answer(Object::Clearance::LegalName1)=<%="" + legalName1 %>&answer(Object::Clearance::FirstName)=<%="" + firstName %>&answer(Object::Clearance::NameType)=<%="" + nameType %>&answer(Object::Clearance::Zipcode)=<%="" + zipCode %>&answer(Object::Customer::Address::Country)=<%="" + country %>&answer(Month)=<%="" + effectiveMonth %>&answer(Date)=<%="" + effectiveDate %>&answer(Year)=<%="" + effectiveYear %>&answer(Object::Customer::City)=<%="" + customerCity %>&answer(Object::Customer::State)=<%="" + customerState %>&answer(Object::Customer::County)=<%=""+ customerCounty %>&answer(AgentId)=<%="" + agentId %>&answer(Agency::AgencyId)=<%="" + agencyId %>'><%="No - Not Blocking"%></a>
						<%} %>						
					</td>
					<td>
						<%=qmap.getEncodedString("Object::Clearance::AgencyName") %>
					</td>
					<td>
						<%=qmap.getEncodedString("Object::Clearance::NameType") %>
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
						<%=qmap.getEncodedString("Object::Customer::State") %>
					</td>
					<td>
						<%=qmap.getEncodedString("Object::Customer::Address::Country") %>
					</td>
					<td>
						<%=qmap.getEncodedString("Object::Clearance::Zipcode") %>
					</td>
					<td>
						<%=qmap.getEncodedString("Object::Clearance::LineOfBusiness") %>
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
						<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=qmap.getString("Object::Clearance::CustomerId")%>&answer(Object::Agency::AgencyId)=<%=qmap.getString("Object::Clearance::AgencyId")%>&answer(QuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(parentQuoteId)=<%=qmap.getString("Object::Clearance::QuoteId")%>&answer(policyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Policy::ParentPolicyId)=<%=qmap.getString("Object::Clearance::PolicyId")%>&answer(Object::Policy::ParentPolicyVerId)=<%=qmap.getString("Object::Clearance::PolicyVerId")%>">
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
						<%=""+qmap.getString("Object::Clearance::PolPolicyVerPolicyNumber") %> 
					</a>
					<%}else{ %>
						<%=""+qmap.getString("Object::Clearance::PolPolicyVerPolicyNumber") %>
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
				<tr>
					<td colspan="16" align="left">

							
			<div class="" style="float: none;width:90%;height:26px;font-size:12px;" align="center">
			<input type="submit" class="covbutton" value="Continue" onclick="{this.form.Main_Clearance_Status.value=this.form.Updated_Clearance_Status.value;this.form.customerName1.value=this.form.Updated_customer_name.value}" style="width:100px;">	
			</div>
							
						
					</td>
				</tr>
			</table>								
			</logic:present>						
			</dmshtml:dms_static_with_connector>			
	</td>
	</tr>
				
</table>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<html:hidden property="answer(Object::Clearance::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(AgentId)" name="CheckClearance" />
	<html:hidden property="answer(Object::Customer::City)"  name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::County)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::State)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::CustomerName)" styleId="Updated_customer_name" name="CheckClearance"/>
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
   	<html:hidden property="answer(Object::Submission::ClearanceStatus)" styleId="Updated_Clearance_Status" name="CheckClearance"/>
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
	
	</div>
</logic:equal>
<logic:equal name="CheckClearance" property="answer(Object::Submission::ClearanceForwardPage)" value="failure_hide_list">
BROKER_HIDE_LIST$HTMLSPLITTER$
<div class="locformbox1"><br />
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="CheckClearance" property="answer(Object::Customer::CustomerId)" scope="request"/> 
<bean:define id="cId" name="CheckClearance" property="answer(Object::Customer::CustomerId)"scope="request"/>
<bean:define id="isClearance" name="CheckClearance" property="answer(Object::isClearance)" />
<html:hidden property="answer(Object::Submission::ClearanceForwardPage)" name="CheckClearance"  value="failure_hide_list" />
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

<div class="formhead"><h2 class="left">CLEARANCE FAILURE</h2></div>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<div class="FormLabels" align="center">
<br>
<br>
<b>There is a potential clearance issue. Would you like an underwriter to research the issue and get back to you?</b>
</div>

<br>
<br>

			
<table>
	<tr><td>
		<div class="field">	
			<input type="submit" class="covbutton" value="Yes" onclick="{this.form.Main_Clearance_Status.value=this.form.Updated_Clearance_Status.value;this.form.customerName1.value=this.form.Updated_customer_name.value}" style="width:100px;">	
	   </div>
		</td>
		<td>
			<input type="submit" class="covbutton" value="No" style="width:100px;" onclick="document.forms[0].action='../UserLogAction.do';">
		</td>	
	</tr>
</table>			

<br>
<br>

					
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<html:hidden property="answer(Object::Clearance::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(AgentId)" name="CheckClearance" />
	<html:hidden property="answer(Object::Customer::City)"  name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::County)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::State)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::CustomerName)" styleId="Updated_customer_name" name="CheckClearance"/>
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
   	<html:hidden property="answer(Object::Submission::ClearanceStatus)" styleId="Updated_Clearance_Status" name="CheckClearance"/>
	<html:hidden property="answer(Object::Submission::Status)" name="CheckClearance"/>	
	<html:hidden property="answer(Object::Customer::Status)" name="CheckClearance"/>
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+Customerid%>' />
	<html:hidden property="answer(Object::PageType)" name="CheckClearance" />
	<html:hidden property="answer(Object::Clearance::ErrorMessage)" value="dsafasd" />
	<html:hidden property="answer(Object::Clearance::BrokerBlocked)" value="BrokerBlocked" />
	
	
	<bean:define id="agencyId12" name="CheckClearance" property="answer(Object::Agency::AgencyId)" />
	<bean:define id="submissionId1" property="answer(Object::Submission::SubmissionId)" name="CheckClearance" />
	<bean:define id="submissionVerId1" property="answer(Object::Submission::SubmissionVerId)" name="CheckClearance" />	
	
	<html:hidden property="answer(createQuoteEffectiveDate)" value="yes"/>	
	<html:hidden property="answer(Object::Quote::SubmissionId)" value="<%=""+submissionId1%>"/>
	<html:hidden property="answer(Object::Quote::SubmissionVerId)" value="<%=""+submissionVerId1%>"/>	
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
	<html:hidden property="answer(Object::Submission::SubmissionVerId)" value="<%=""+submissionVerId%>"/>
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+Customerid%>"/>
	<html:hidden property="answer(cId)" value="<%=""+cId%>"/>
</div>

</logic:equal>
<logic:equal name="CheckClearance" property="answer(Object::Submission::ClearanceForwardPage)" value="success">
CLEARANCE_SUCCESS$HTMLSPLITTER$
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="city" name="CheckClearance" property="answer(Object::Customer::City)"scope="request"/>
<bean:define id="county" name="CheckClearance" property="answer(Object::Customer::County)"scope="request"/>
<bean:define id="state" name="CheckClearance" property="answer(Object::Customer::State)"scope="request"/>
<bean:define id="customerName" name="CheckClearance" property="answer(Object::Customer::CustomerName)"scope="request"/>
<bean:define id="customerName2" name="CheckClearance" property="answer(Object::Customer::CustomerName2)"scope="request"/>
<bean:define id="nameType" name="CheckClearance" property="answer(Object::Customer::NameType)"scope="request"/>
<bean:define id="DBA" name="CheckClearance" property="answer(Object::Customer::DBA)"scope="request"/>
<bean:define id="zip" name="CheckClearance" property="answer(Object::Customer::Zip)"scope="request"/>
<bean:define id="customerId" name="CheckClearance" property="answer(Object::Customer::CustomerId)"scope="request"/>
<bean:define id="ProposedEffectiveDate" name="CheckClearance" property="answer(Object::Clearance::ProposedEffectiveDate)"scope="request"/>
<bean:define id="ProposedEffectiveDate1" name="CheckClearance" property="answer(Object::Clearance::ProposedEffectiveDate1)"scope="request"/>
<bean:define id="createdBy" name="CheckClearance" property="answer(Object::Submission::CreatedBy)"scope="request"/>
<html:hidden property="answer(Object::Submission::ClearanceForwardPage)" name="CheckClearance"  value="success" />

<div class="formhead"><h2 class="left">CLEARANCE SUCCESS</h2></div>
<div class="FormLabels" align="center">
<br>
<br>
<b>You are cleared. Please note, submission is not registered until complete application is submitted. Do you want to continue?</b>
</div>
<br>
<br>
<table width="100%">
	<tr><td align="right">			
			<input type="submit" class="covbutton" value="Yes" style="width:100px;">	   
		</td>
		<td align="left">
			<input type="submit" class="covbutton" value="No" style="width:100px;" onclick="document.forms[0].action='../UserLogAction.do';">
		</td>	
	</tr>
</table>
<br>
<br>

</logic:equal>

