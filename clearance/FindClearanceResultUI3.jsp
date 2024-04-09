<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%@ page import="java.util.ArrayList"%>
<%response.setHeader("Cache-Control", "no-store");%>


<logic:present name='ClearanceRecords'>

<% String startIndex = ""+request.getParameter("startIndex");%>
<%int sNo=Integer.parseInt(startIndex); %>
<%ArrayList subList = (ArrayList)request.getAttribute("ClearanceRecords");
long listSize =subList.size();
String results = ""+request.getParameter("results");
String tabPanelName = "" + request.getParameter("TabPanelName");%>
 
	<bean:define id="NoOfRecords" name="ClRecordsSize" scope="request"/>	
{"recordsReturned":<%=listSize %>,"totalRecords":<%=NoOfRecords+"" %>,"startIndex":<%=startIndex %>,"sort":"id","dir":"asc","pageSize":<%=""+results %>,

"records"
:[	
<logic:iterate id="clearanceMap" name="ClearanceRecords"> 

<%
sNo=sNo+1;
%>

	<bean:define id="dataSource" name="clearanceMap" property="Object::Clearance::Source"/>
	<bean:define id="submissionNumber" name="clearanceMap" property="Object::Clearance::SubmissionNumber"/>
	<bean:define id="submissionHasReservation" name="clearanceMap" property="Object::Clearance::SubmissionHasReserved"/>
	<bean:define id="SubmissionName1" name="clearanceMap" property="Object::Clearance::LegalName1"/>
	<bean:define id="SubmissionName2" name="clearanceMap" property="Object::Clearance::LegalName2"/>
	<bean:define id="DBA" name="clearanceMap" property="Object::Clearance::DBA"/>
	<bean:define id="state" name="clearanceMap" property="Object::Clearance::State"/>
	<bean:define id="zipCode" name="clearanceMap" property="Object::Clearance::Zipcode"/>
	<bean:define id="quoteNumber" name="clearanceMap" property="Object::Clearance::QuoteNumber"/>
	<bean:define id="quoteHasReservation" name="clearanceMap" property="Object::Clearance::QuoteHasReserved"/>
	<bean:define id="policyNumber" name="clearanceMap" property="Object::Clearance::PolicyNumber"/>
	<bean:define id="policyHasReservation" name="clearanceMap" property="Object::Clearance::PolicyHasReserved"/>
	<bean:define id="brokerName" name="clearanceMap" property="Object::Clearance::AgencyName"/>
	<bean:define id="linked" name="clearanceMap" property="Object::Clearance::Linked"/>
	<bean:define id="customerId" name="clearanceMap" property="Object::Customer::CustomerId"/>
	<bean:define id="agencyId" name="clearanceMap" property="Object::Agency::AgencyId"/>
	<bean:define id="submissionId" name="clearanceMap" property="Object::Submission::SubmissionId"/>
	<bean:define id="submissionVerId" name="clearanceMap" property="Object::Submission::SubmissionVerId"/>
	<bean:define id="quoteId" name="clearanceMap" property="Object::Quote::QuoteId"/>
	<bean:define id="policyId" name="clearanceMap" property="Object::Policy::PolicyId"/>
	<bean:define id="clearanceStatus" name="clearanceMap" property="Object::Clearance::Status"/>
	<bean:define id="extCustomerId" name="clearanceMap" property="Object::Customer::ExtCustomerId"/>
	<%String submissionName1 = (""+SubmissionName1).replace("\\", "\\\\");
	submissionName1 = submissionName1.replaceAll("\"","\\\\\\\"");
	submissionName1 = submissionName1.replaceAll("<","&lt;");
	submissionName1 = submissionName1.replaceAll(">","&gt;");
	String submissionName2 = (""+SubmissionName2).replace("\\", "\\\\");
	submissionName2 = submissionName2.replaceAll("\"","\\\\\\\"");
	submissionName2 = submissionName2.replaceAll("<","&lt;");
	submissionName2 = submissionName2.replaceAll(">","&gt;");
	String dba = (""+DBA).replace("\\", "\\\\");
	dba = dba.replaceAll("\"","\\\\\\\"");
	dba = dba.replaceAll("<", "&lt;");
	dba = dba.replaceAll(">","&gt;");
	long lineOfBusinessId = 1;%>

		<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
		<bean:define id="clearanceRecord"><bean:message key='ToolTip.ClearanceSearch.ClearanceRecord'/></bean:define>
{"SNo":"<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=tabPanelName%>&answer(Object::Clearance::ClearanceSource)=<%=dataSource %>&answer(Object::Clearance::LineOfBusinessId)=<%=lineOfBusinessId %>&answer(Object::Clearance::CustomerId)=<%=customerId %>&answer(Object::Clearance::AgencyId)=<%=agencyId %>&answer(Object::Submission::SubmissionId)=<%=submissionId %>&answer(Object::Quote::QuoteId)=<%=quoteId %>&answer(Object::Clearance::PolicyId)=<%=policyId %>&answer(Object::Customer::ClearanceLinked)=<%=linked %>&answer(Object::Policy::PolicyNumber)=<%=policyNumber %>&answer(pagename)=Search in Clearance Database&answer(Object::Clearance::Status)=<%=clearanceStatus %>' title='<%=clearanceRecord%>'><%=sNo %></a>",
"DataSource":"<%=""+dataSource %>",
<% if(((String)dataSource).equalsIgnoreCase("SOLARTIS")) {%>
"SubmissionNumber":"<a href='../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=submissionVerId %>&answer(Object::Submission::SubmissionId)=<%=submissionId %>&answer(customerId)=<%=customerId %>&customerId=<%=customerId %>&answer(Object::Customer::CustomerId)=<%=customerId %>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=customerId %>' title='<%=submissionNumber%>'><%=submissionNumber %></a>",
<%}else{%>
"SubmissionNumber":"<%=submissionNumber %>",
<%} %>
"SubmissionHasReservation":"<%=""+submissionHasReservation %>",
<% if(((String)dataSource).equalsIgnoreCase("SOLARTIS")) {%>
"SubmissionName1":"<a href='../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=customerId%>' title='<%=""+submissionName1%>'><%=""+submissionName1 %></a>",
<%}else{%>
"SubmissionName1":"<a href='../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=extCustomerId %>' title='<%=""+submissionName1%>'><%=""+submissionName1 %></a>",
<%} %>
"SubmissionName2":"<%=""+submissionName2 %>",
"DBA":"<%=""+dba %>",
"State":"<%=""+state %>",
"ZipCode":"<%=""+zipCode %>",
<% if(((String)dataSource).equalsIgnoreCase("SOLARTIS")) {%>
"QuoteNumber":"<a href='../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId %>&answer(QuoteId)=<%=quoteId%>&answer(policyNumber)=<%=policyNumber %>&answer(parentQuoteId)=<%=quoteId%>' title='<%=""+quoteNumber%>'><%=""+quoteNumber %></a>",
<%}else{%>
"QuoteNumber":"<%=""+quoteNumber %>",
<%} %>
"QuoteHasReservation":"<%=""+quoteHasReservation %>",
<% if(((String)dataSource).equalsIgnoreCase("SOLARTIS")) {%>
"PolicyNumber":"<a href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(TabPanelName)=Policy_Panel&answer(policyNumber)=<%=policyNumber%>' title='<%=policyNumber%>'><%=policyNumber %></a>",
<%}else{%>
"PolicyNumber":"<%=""+policyNumber %>",
<%} %>
"PolicyHasReservation":"<%=""+policyHasReservation %>",
"BrokerName":"<bean:write  name="clearanceMap" property="Object::Clearance::AgencyName"/>",
"Linked":"<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+tabPanelName %>&answer(Object::Clearance::ClearanceSource)=<%=dataSource %>&answer(Object::Clearance::LineOfBusinessId)=<%=lineOfBusinessId %>&answer(Object::Clearance::CustomerId)=<%=customerId %>&answer(Object::Clearance::AgencyId)=<%=agencyId %>&answer(Object::Submission::SubmissionId)=<%=submissionId %>&answer(Object::Quote::QuoteId)=<%=quoteId %>&answer(Object::Clearance::PolicyId)=<%=policyId %>&answer(Object::Customer::ClearanceLinked)=<%=linked%>&answer(Object::Policy::PolicyNumber)=<%=policyNumber %>&answer(pagename)=Search in Clearance Database&answer(Object::Clearance::Status)=<%=clearanceStatus %>' title='<%=""+clearanceRecord%>'><%if (((String)linked).equalsIgnoreCase("Y")){%>Yes<%}else{%>No<%} %></a>",
"CustomerId":"<%=""+customerId %>",
"AgencyId":"<%=""+agencyId %>",
"SubmissionId":"<%=""+submissionId %>",
"SubmissionVerId":"<%=""+submissionVerId %>",
"QuoteId":"<%=""+quoteId %>",
"PolicyId":"<%=""+policyId %>",
"ClearanceStatus":"<%=""+clearanceStatus %>",
"ExtCustomerId":"<%=""+extCustomerId %>",
"LineOfBusinessId":"<%=""+lineOfBusinessId %>",
"TabPanelName":"<%=""+tabPanelName %>",
"totRecords":"<%=NoOfRecords+"" %>"}
<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>




</logic:iterate>
]}
</logic:present>
<logic:notPresent name='ClearanceRecords'>
{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
"records"
:[]}
</logic:notPresent>







