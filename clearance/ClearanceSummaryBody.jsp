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
<bean:define id="Customerid" name="Clearance" property="answer(Object::Customer::CustomerId)" /> 
<bean:define id="CustomerId" name="Clearance" property="answer(Object::Customer::CustomerId)" /> 
<bean:define id="cId" name="Clearance" property="answer(Object::Customer::CustomerId)" />
<bean:define id="customerId" property="answer(Object::Clearance::CustomerId)" name="Clearance" />
<bean:define id="lobId" property="answer(Object::Clearance::LineOfBusinessId)" name="Clearance" />
<bean:define id="agencyId" property="answer(Object::Clearance::AgencyId)" name="Clearance" />
<bean:define id="agencyName" property="answer(Object::Submission::AgencyName)" name="Clearance" />
<bean:define id="searchSourcePageName" property="answer(sourcePageName)" name="Clearance" />

<% String sourcePageName = "";
if(request.getParameter("answer(pagename)") != null) {
	sourcePageName = request.getParameter("answer(pagename)");
}
if(sourcePageName.equalsIgnoreCase("")) {
	sourcePageName = "" + searchSourcePageName;
}

String legalName1 = "";
String firstName = "";
String nameType = "";
String zipCode = "";
String country = "";
String effectiveMonth = "";
String effectiveDate = "";
String effectiveYear = "";
String agentId = "";
String agencyId1 = "";
String cityName = "";
String customerState = "";
String customerCounty = "";

if(request.getParameter("answer(Object::Clearance::LegalName1)") != null) {
	legalName1 = request.getParameter("answer(Object::Clearance::LegalName1)");
}
if(request.getParameter("answer(Object::Clearance::FirstName)") != null) {
	firstName= request.getParameter("answer(Object::Clearance::FirstName)");
}
if(request.getParameter("answer(Object::Clearance::NameType)") != null) {
	nameType = request.getParameter("answer(Object::Clearance::NameType)");
}
if(request.getParameter("answer(Object::Clearance::Zipcode)") != null) {
	zipCode = request.getParameter("answer(Object::Clearance::Zipcode)");
}
if(request.getParameter("answer(Object::Customer::Address::Country)") != null) {
	country = request.getParameter("answer(Object::Customer::Address::Country)");
}
if(request.getParameter("answer(Month)") != null) {
	effectiveMonth = request.getParameter("answer(Month)");
}
if(request.getParameter("answer(Date)") != null) {
	effectiveDate = request.getParameter("answer(Date)");
}
if(request.getParameter("answer(Year)") != null) {
	effectiveYear = request.getParameter("answer(Year)");
}
if(request.getParameter("answer(Object::Customer::City)") != null) {
	cityName = request.getParameter("answer(Object::Customer::City)");
}
if(request.getParameter("answer(Object::Customer::State)") != null) {
	customerState = request.getParameter("answer(Object::Customer::State)");
}
if(request.getParameter("answer(Object::Customer::County)") != null) {
	customerCounty = request.getParameter("answer(Object::Customer::County)");
}
if(request.getParameter("answer(AgentId)") != null) {
	agentId = request.getParameter("answer(AgentId)");
}
if(request.getParameter("answer(Agency::AgencyId)") != null) {
	agencyId1 = request.getParameter("answer(Agency::AgencyId)");
}
%>

<bean:define id="submissionId" property="answer(Object::Submission::SubmissionId)" name="Clearance" />
<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionId)" name="Clearance" />
<bean:define id="clSubmissionId" property="answer(Object::Clearance::SubmissionId)" name="Clearance" />
<bean:define id="clSsubmissionVerId" property="answer(Object::Clearance::SubmissionId)" name="Clearance" />
<bean:define id="submissionNum" property="answer(Object::Submission::SubmissionNum)" name="Clearance" />
<bean:define id="quoteId" property="answer(Object::Quote::ParentQuoteId)" name="Clearance" />
<bean:define id="quoteVerId" property="answer(Object::Quote::ParentQuoteVerId)" name="Clearance" />
<bean:define id="quoteNum" property="answer(Object::Quote::QuoteNum)" name="Clearance" />


<bean:define id="clpolicyId" property="answer(Object::Clearance::PolicyId)" name="Clearance" />
<bean:define id="policyId" property="answer(Object::Policy::PolicyId)" name="Clearance" />
<bean:define id="policyNumber" property="answer(Object::Policy::PolicyNumber)" name="Clearance" />


<bean:define id="clearanceStatus" property="answer(Object::Clearance::Status)" name="Clearance" />
<bean:define id="clearanceSource" property="answer(Object::Clearance::ClearanceSource)" name="Clearance" />
<bean:define id="parentQuoteId" property="answer(Object::Clearance::ParentQuoteId)" name="Clearance" />
<bean:define id="ProductVerId" property="answer(Object::Quote::ProductVerId)" name="Clearance" />
<bean:define id="parentQuoteStatus" property="answer(Object::Quote::QuoteStatus)" name="Clearance" />
	
<bean:define id="insuredType" property="answer(Object::Submission::InsuredType)" name="Clearance" />
<bean:define id="insuredName1" property="answer(Object::Submission::InsuredName)" name="Clearance" />
<bean:define id="insuredName2" property="answer(Object::Submission::InsuredName2)" name="Clearance" />
<bean:define id="dba" property="answer(Object::Submission::DBA)" name="Clearance" />
<bean:define id="state" property="answer(Object::Submission::InsuredState)" name="Clearance" />
<bean:define id="zip" property="answer(Object::Submission::InsuredZipCode)" name="Clearance" />
<bean:define id="agencyName" property="answer(Object::Submission::AgencyName)" name="Clearance" />

<bean:define id="currentQuoteId" property="answer(Object::QuoteLink::QuoteId)" name="Clearance" />
<bean:define id="currentQuoteVerId" property="answer(Object::QuoteLink::QuoteVerId)" name="Clearance" />
<bean:define id="currentProductVerId" property="answer(Object::QuoteLink::ProductVerId)" name="Clearance" />
<bean:define id="currentparetQuoteStatus" property="answer(Object::QuoteLink::paretQuoteStatus)" name="Clearance" />

<bean:define id="currentsubmissionid" property="answer(Object::SubmissionLink::submissionId)" name="Clearance" />
<bean:define id="currentsubmissionVerid" property="answer(Object::SubmissionLink::submissionVerId)" name="Clearance" />
<bean:define id="currentCustomerId" property="answer(Object::SubmissionLink::customerId)" name="Clearance" />

<bean:define id="submissionMasterStatus" property="answer(Object::Submission::MasterStatus)" name="Clearance" />
<bean:define id="quoteMasterStatus" property="answer(Object::Quote::MasterStatus)" name="Clearance" />
<bean:define id="policyMasterStatus" property="answer(Object::Policy::MasterStatus)" name="Clearance" />

<%if(submissionId.equals("")){
	submissionId = clSubmissionId;
}
if(submissionVerId.equals("")){
	submissionVerId = clSsubmissionVerId;	
}
if(Customerid.equals("")){
	Customerid = customerId	;
}

%>


							
 
<bean:define id="linked" property="answer(Object::Customer::ClearanceLinked)" name="Clearance" />
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="AgencyID" property="answer(Object::UserDetail::AgencyId)" name="LoginPage" scope="session" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<html:form styleId="clearanceSummaryForm" action="/UpdateClearance.do">
<div class="formpage01">


<!-- Submission Header Ends-->					
<!-- Quote Header Starts here-->		
					
						
<!-- Quote Header Ends-->		
					
													
 <table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">				
  <%if(!quoteId.equals("")){ %>	
	 <tr>
	 	<td colspan="2">
	 	   <table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">		
	 	    <tr>
	 	      <td>
	 	      
			  </td>
			</tr>
  		  </table>
	     </td>
      </tr>
 <%}%>
 <tr>
	<td class="links" align="left" colspan="2">		
		<%if(!currentCustomerId.equals("")){ %>
			<logic:greaterThan name="currentsubmissionid" value="0">
			<logic:greaterThan name="currentsubmissionVerid" value="0">
				<logic:greaterThan name="Customerid" value="0">		
								
							<a id="submissionSummaryPageLink" href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=Long.parseLong(currentsubmissionVerid.toString())%>&answer(Object::Submission::SubmissionId)=<%=Long.parseLong(currentsubmissionid.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=Long.parseLong(currentCustomerId.toString())%>&customerId=<%=Long.parseLong(""+currentCustomerId)%>&answer(Object::Customer::CustomerId)=<%=Long.parseLong(""+currentCustomerId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=Long.parseLong(""+currentCustomerId)%>" >
								Submission Summary
							</a>			
					
				</logic:greaterThan>
			</logic:greaterThan>
			</logic:greaterThan>
		<%}%>	
        
                              <%if(!currentQuoteId.equals("")&&!currentQuoteVerId.equals("")&&!CustomerId.equals("")){ %>
			<a id="quoteSummaryPageLink" href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=currentCustomerId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+currentQuoteVerId%>&answer(QuoteId)=<%=currentQuoteId.toString()%>&answer(parentQuoteId)=<%=currentQuoteId.toString()%>">
						Quote Summary
			</a>
		 <%}%>							
    
       <%if(!policyNumber.equals("")&&(clearanceSource.equals("SOLARTIS"))){ %>
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(TabPanelName)=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>">						
						Policy Summary
			</a>
	  <%}%>							
    </td>
   </tr>
	<tr> 
	  <td  colspan="2"><div class="formhead"><h2 class="left">CLEAR/UPDATE CLEARANCE RECORD</h2></div></td>
	</tr>
							
	 <tr>
		<td class="Links" align="left" colspan="2">
			<logic:equal property="answer(Object::Customer::ClearanceLinked)" value="Y" name="Clearance">
		
			This is blocking Clearance Record for other Brokers.Changing this value to <b> NO </b> will make Clearance check success for other Brokers.
			
			</logic:equal>
			
			<logic:equal property="answer(Object::Customer::ClearanceLinked)" value="N" name="Clearance">
			
			This is not a blocking Clearance Record for other Brokers.
			
			</logic:equal>
		</td>																				
	 </tr>		
 	<tr>
	    <td colspan="2">&nbsp;</td>																				
	</tr>								
	<tr>
      <td class="field"  width="40%">Agency Name</td>
	  <td>
     	&nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="answer(Object::Submission::AgencyName)" name="Clearance" />	
      <td>														
	</tr>
	<tr>
  	 <td colspan="2">&nbsp;</td>																				
    </tr>
	<tr>
		<td class="field"  width="40%">Insured Type</td>
		<td>
 		  &nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="answer(Object::Submission::InsuredType)" name="Clearance" />	
		<td>														
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<tr>
		<td class="field"  width="40%">Insured Name1</td>
		<td>
   		 &nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Submission::InsuredName)" name="Clearance" />	
		<td>														
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>	
    <tr>					
		<td class="field"  width="40%">Insured Name2</td>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="answer(Object::Submission::InsuredName2)" name="Clearance" />		
		</td>														
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<tr>							
		<td class="field"  width="40%">DBA</td>
		<td>
 		 &nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Submission::DBA)" name="Clearance" />		
		<td>														
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<tr>							
	<td class="field"  width="40%">State</td>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;<%=""+state%>		
		</td>														
    </tr>
	<tr>
    	<td colspan="2">&nbsp;</td>																				
    </tr>							
	<tr>							
	  <td class="field"  width="40%">Zip</td>
	  <td>
	   &nbsp;&nbsp;&nbsp;&nbsp; <%=""+zip%>		
	  </td>														
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<tr>							
		<td class="field"  width="40%">Submission Number</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;	
			<%if(clearanceSource.equals("SOLARTIS")){ %>
			<logic:greaterThan name="submissionId" value="0">
				<logic:greaterThan name="submissionVerId" value="0">
					<logic:greaterThan name="Customerid" value="0">						
						<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=Long.parseLong(submissionVerId.toString())%>&answer(Object::Submission::SubmissionId)=<%=Long.parseLong(submissionId.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=Long.parseLong(CustomerId.toString())%>&customerId=<%=Long.parseLong(""+customerId)%>&answer(Object::Customer::CustomerId)=<%=Long.parseLong(""+customerId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=Long.parseLong(""+CustomerId)%>" >
						<%=""+submissionNum%>
						</a>			
					</logic:greaterThan>
				</logic:greaterThan>
			</logic:greaterThan>
			<%}else{%>
		<%=""+submissionNum%>
		<%}%>		
		</td>																							
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<%if(clearanceSource.equals("GENIUS")){ %> 
		<tr>								
							
			<td class="field"  width="40%" >Submission Master Status</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=""+submissionMasterStatus%></td>
	    </tr>
	<%}%>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<tr>							
		<td class="field"  width="40%">Quote Number</td>
		<td>			
			<%if(clearanceSource.equals("SOLARTIS")){ %>			
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=CustomerId.toString()%>&answer(Object::Quote::QuoteVerId)=<%=""+quoteVerId%>&answer(QuoteId)=<%=quoteId.toString()%>&answer(parentQuoteId)=<%=quoteId.toString()%>">
				&nbsp;&nbsp;&nbsp;&nbsp;<%=""+quoteId%>	
			</a>			
			<%}else{%>
			<%=""+quoteNum%>
			<%}%>					
		</td>														
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<%if(clearanceSource.equals("GENIUS")){ %>
		<tr>								
			<td class="field"  width="40%">Quote Master Status</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=""+quoteMasterStatus%></td>
		</tr>
	<%}%>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<tr>							
		<td class="field"  width="40%">Policy Number</td>
		<td>		
		<%if(clearanceSource.equals("SOLARTIS")){ %>
		<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(TabPanelName)=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>">						
				&nbsp;&nbsp;&nbsp;&nbsp;<%=""+policyNumber%>
		</a>
		<%}else{%>
		<%=""+policyNumber%>
		<%}%>			
		</td>														
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<%if(clearanceSource.equals("GENIUS")){ %>
	<tr>						
		<td class="field"  width="40%">Policy Master Status</td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=""+policyMasterStatus%></td>
	</tr>
	<%}%>	
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>			
	<tr>
		<td class="field"  width="40%">Clearance Source</td>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Clearance::ClearanceSource)" name="Clearance" />	
		<td>														
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>	
<!--												
 							<tr>
								<td class="field"  width="40%">Clearance Status</td>
								<td>
									<html:select property="answer(Object::Clearance::Status)" name="Clearance" styleClass="txtbox">
										<html:option value="BLOCKED" >Blocked</html:option>
										<html:option value="CLEARED" >Cleared</html:option>					
									</html:select>	
								<td>														
							</tr>
-->						
	
	<tr>
		<td colspan="2">&nbsp;</td>																				
	</tr>
	<tr>
		<td class="field"  width="40%">Use in Clearance Check</td>
        <td>
			<html:select property="answer(Object::Customer::ClearanceLinked)" name="Clearance" styleClass="txtbox">
				<html:option value="Y" >Yes</html:option>
				<html:option value="N" >No</html:option>					
			</html:select>	
		</td>														
	</tr>
<!--							
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 	connector='or' negated="true">
 							<tr>
								<td class="field"  width="40%">Active</td>
								<td>&nbsp;</td>		
								<td>
									<html:select property="answer(Object::Clearance::Active)" name="Clearance" styleClass="txtbox">
										<html:option value="Y" >Active</html:option>
										<html:option value="D" >In Active</html:option>					
									</html:select>	
								<td>														
							</tr>
								</dmshtml:dms_static_with_connector>
-->	
		<tr>
			<td colspan="2">&nbsp;</td>																				
		</tr>
		<tr>
			<td class="field"  width="40%">Last Saved by</td>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::UserDetail::userName)" name="LoginPage" />
			</td>														
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>																				
		</tr>
		<tr>
			<td width="40%" align="right">
				<html:submit value="Save" property="answer(button)" styleClass="covbutton" />											
			</td>
			<td>
			<%if(("" + sourcePageName).equalsIgnoreCase("Create New Submission")) { %>
				<html:button value="Back" property="answer(button)" styleClass="covbutton"  onclick="gotoCreateNewSubmissionPage();" />
			<%} else if(("" + sourcePageName).equalsIgnoreCase("Search in Clearance Database")) { %>
				<html:button value="Back" property="answer(button)" styleClass="covbutton"  onclick="gotoUI3SearchClearancePage();" />
			<%} else if(("" + sourcePageName).equalsIgnoreCase("Search in Clearance Database Old UI")) { %>
				<html:button value="Back" property="answer(button)" styleClass="covbutton"  onclick="gotoSearchClearancePage();" />
			<%} else if(("" + sourcePageName).equalsIgnoreCase("Register Submission Page") || ("" + sourcePageName).equalsIgnoreCase("Add/Edit Location/Tank Page")) { %>
				<html:button value="Go To Submission Summary Page" style="width:275px" property="answer(button)" styleClass="covbutton"  onclick="gotoClearanceResultPage();" />
			<%} else { %>
				<html:button value="Go To Quote Summary Page" style="width:225px" property="answer(button)" styleClass="covbutton"  onclick="gotoClearanceResultPage();" />
			<%} %>
			</td>
		</tr>							
						
				
</table>

<html:hidden styleId="sourcePageName" property="answer(sourcePageName)" value='<%="" + sourcePageName %>'/>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(Object::Clearance::LineOfBusinessId)" value='<%=""+lobId.toString()%>'/>
<html:hidden property="answer(Object::Clearance::AgencyId)" value='<%=""+agencyId.toString()%>'/>
<html:hidden property="answer(Object::Clearance::CustomerId)" value='<%=""+customerId.toString()%>'/>
<html:hidden property="answer(Object::Clearance::ClearanceSource)" value='<%=""+clearanceSource.toString()%>'/>
<html:hidden property="answer(Object::Clearance::Status)" value='<%="CLEARED"%>'/>
<html:hidden property="answer(Object::Clearance::Active)" value='<%="Y"%>'/>

<html:hidden property="answer(Object::QuoteLink::QuoteId)" value='<%=""+currentQuoteId.toString()%>'/>
<html:hidden property="answer(Object::QuoteLink::QuoteVerId)" value='<%=""+currentQuoteVerId.toString()%>'/>
<html:hidden property="answer(Object::QuoteLink::ProductVerId)" value='<%=""+currentProductVerId.toString()%>'/>
<html:hidden property="answer(Object::QuoteLink::paretQuoteStatus)" value='<%=""+currentparetQuoteStatus.toString()%>'/>

<html:hidden property="answer(Object::SubmissionLink::submissionId)" value='<%=""+currentsubmissionid%>'/>
<html:hidden property="answer(Object::SubmissionLink::submissionVerId)" value='<%=""+currentsubmissionVerid%>'/>
<html:hidden property="answer(Object::SubmissionLink::customerId)" value='<%=""+currentCustomerId%>'/>
</div>
</html:form>

<html:form styleId="CheckClearanceForQuoteForm" action="/CheckClearanceForQuoteAction.do">
	<html:hidden styleId="customerId" property="answer(Object::Customer::CustomerId)" value = '<%=""+currentCustomerId%>'/>
	<html:hidden styleId="submissionId" property="answer(Object::Submission::SubmissionId)" value = '<%=""+currentsubmissionid%>'/>
	<html:hidden styleId="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" value = '<%=""+currentsubmissionVerid%>'/>
	<html:hidden styleId="quoteType" property="answer(Object::Quote::QuoteType)"/>
	<html:hidden styleId="parentQuoteId" property="answer(parentQuoteId)" value = '<%=""+currentQuoteId.toString()%>'/>
	<html:hidden styleId="parentQuoteVerId" property="answer(Object::Quote::QuoteVerId)" value = '<%=""+currentQuoteVerId.toString()%>'/>
	<html:hidden styleId="productVerId" property="answer(Object::Quote::ProductVerId)" value = '<%=""+currentProductVerId%>'/>
	<html:hidden styleId="productId" property="answer(Object::Quote::ProductId)"/>
	<html:hidden styleId="quoteStatus" property="answer(Object::Quote::QuoteStatus)" value = '<%=""+currentparetQuoteStatus%>'/>
	<html:hidden styleId="" property="answer(Object::Clearance::ObjectId)"/>
	<html:hidden styleId="" property="answer(Object::Clearance::ObjectVerId)"/>
	<html:hidden styleId="" property="answer(Object::Clearance::OwnerId)" value='<%=""+ownerId%>'/>
	<html:hidden styleId="" property="answer(Object::Clearance::CurrentUser)"/>
	<html:hidden styleId="" property="answer(Object::Clearance::ObjectStatus)"/>
	<html:hidden styleId="agencyId" property="answer(Agency::AgencyId)" value='<%="" +agencyId1 %>'/>
	<html:hidden styleId="sourcePageName1" property="answer(sourcePageName)" value='<%="" + sourcePageName %>'/>
</html:form>

<html:form styleId="createNewSubmissionForm" action="/LinkAgencytoInsuredSubEILAction3.0.do">
	<html:hidden property="answer(Object::Clearance::LegalName1)" value='<%="" + legalName1 %>'/>
	<html:hidden property="answer(Object::Clearance::FirstName)" value='<%="" + firstName %>'/>
	<html:hidden property="answer(Object::Clearance::NameType)" value='<%="" + nameType %>'/>
	<html:hidden property="answer(Object::Clearance::Zipcode)" value='<%="" + zipCode %>'/>
	<html:hidden property="answer(Object::Customer::Address::Country)" value='<%="" + country %>'/>
	<html:hidden property="answer(Month)" value='<%="" + effectiveMonth %>'/>
	<html:hidden property="answer(Date)" value='<%="" + effectiveDate %>'/>
	<html:hidden property="answer(Year)" value='<%="" + effectiveYear %>'/>
	<html:hidden property="answer(AgentId)" value='<%="" + agentId %>'/>
	<html:hidden property="answer(Object::Customer::City)" value='<%="" + cityName %>'/>
	<html:hidden property="answer(Object::Customer::State)" value='<%="" + customerState %>'/>
	<html:hidden property="answer(Object::Customer::County)" value='<%="" + customerCounty %>'/>
	<html:hidden styleId="sourcePageName2" property="answer(sourcePageName)" value='<%="" + sourcePageName %>'/>
</html:form>

<script type="text/javascript">
function gotoClearanceResultPage() {
	if(document.getElementById("sourcePageName") != null && document.getElementById("sourcePageName") != undefined) {
		if(document.getElementById("sourcePageName").value == "Register Submission Page" || document.getElementById("sourcePageName").value == "Add/Edit Location/Tank Page" ) {
			if(document.getElementById("submissionSummaryPageLink") != null && document.getElementById("submissionSummaryPageLink") != undefined) {
				document.location = document.getElementById("submissionSummaryPageLink").href;
			}			
		} else {
			if(document.getElementById("quoteSummaryPageLink") != null && document.getElementById("quoteSummaryPageLink") != undefined) {
				document.location = document.getElementById("quoteSummaryPageLink").href;
			}
		}
	}
}
function gotoCreateNewSubmissionPage() {
	var url = "../LinkAgencytoInsuredSubEILAction3.0.do";
	if(document.getElementById("createNewSubmissionForm") != null && document.getElementById("createNewSubmissionForm") != undefined) {
		document.getElementById("createNewSubmissionForm").action = url;
		document.getElementById("createNewSubmissionForm").submit();
	}
}
function gotoUI3SearchClearancePage() {
	var url = "../FindClearanceUI3.do?TabPanelName=Submission_Panel&clear=yes";
	document.location = url;
}
function gotoSearchClearancePage() {
	var url = "../FindClearance.do?TabPanelName=Submission_Panel&clear=yes";
	document.location = url;
}
</script>