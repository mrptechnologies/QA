<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%@ page import="java.util.ArrayList"%>
<%response.setHeader("Cache-Control", "no-store");%>

<logic:present name='searchresultCustomerDisplay'>
<% String startIndex = ""+request.getParameter("startIndex");%>
<%
String userName="";%>


<%ArrayList subList = (ArrayList)request.getAttribute("searchresultCustomerDisplay");
long listSize =subList.size();

String results = ""+request.getParameter("results");%>

<%String strRecCount= request.getAttribute("answer(strRecCount)")+""; %>

<%String totalRecords=""; %>
<logic:present name="customersSize" scope="request">
<bean:define id="customersSize1" name="customersSize" scope="request"/>	
<%totalRecords=customersSize1+""; %>
</logic:present>


{"recordsReturned":<%=listSize %>,"totalRecords":<%=totalRecords %>,"startIndex":<%=startIndex %>,"sort":"id","dir":"asc","pageSize":<%=""+results %>,
"records"
:[

<%long sNo=Integer.parseInt(startIndex);
System.out.println("Inside.......");  %>
<logic:iterate id="subinsuredMap" name="searchresultCustomerDisplay">
<%
sNo=sNo+1;
//String agencyName = ""; 

String objType1="";
 String agencyIdtoLink1 ="";
if (request.getParameter("answer(1*Customer::Equals::SearchObjectId)")!= null) {
		agencyIdtoLink1=request.getParameter("answer(1*Customer::Equals::SearchObjectId)");
		objType1="AGENCY";
}%> 

		 <bean:define id="status" property="answer(Object::Customer::Status)" name="FindForm" scope="request"/>
		 <bean:define id="customerName" property="answer(Object::Customer::Like::customerName)" name="FindForm" scope="request"/>
 		 <bean:define id="submissionNumberLike" property="answer(Object::Customer::Like::SubmissionNumber)" name="FindForm" scope="request"/>
		 
		 <bean:define id="userId1" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
		 <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
		 <bean:define id="cId" name="subinsuredMap" property="Object::Customer::CustomerId" />
		 
		 <bean:define id="submissionId" name="subinsuredMap" property="Object::Submission::SubmissionId" />
		 <bean:define id="submissionVerId" name="subinsuredMap" property="Object::Submission::SubmissionVerId" />
		 <bean:define id="submissionNumber" name="subinsuredMap" property="Object::Customer::SubmissionNumber"/>
		 <bean:define id="submissionName" name="subinsuredMap" property="Object::Customer::CustomerName" />
		 <bean:define id="submissionStatus" name="subinsuredMap" property="Object::Customer::Status" />
		 <bean:define id="clearanceStatus" name="subinsuredMap" property="Object::Customer::ClearanceStatus" />
		 <bean:define id="DBA" name="subinsuredMap" property="Object::Customer::DBA" />
		 <bean:define id="createdDate" name="subinsuredMap" property="Object::Submission::CreatedDate" />
		 <bean:define id="agencyId" name="subinsuredMap" property="Object::Submission::AgencyId" />
		 <bean:define id="agentId" name="subinsuredMap" property="Object::Submission::AgentId" />
		 <bean:define id="agencyName" name="subinsuredMap" property="Object::Submission::BrokerName" />
		 <bean:define id="submissionName" name="subinsuredMap" property="Object::Customer::CustomerName" />
		 <bean:define id="dba" name="subinsuredMap" property="Object::Customer::DBA" />
		 <%String subName = (""+submissionName).replace("\\", "\\\\");
		 subName = subName.replaceAll("\"","\\\\\\\"");	
		 subName = subName.replaceAll("<","&lt;");
	     subName = subName.replaceAll(">","&gt;");%>		
		 <%String dbaName = (""+dba).replace("\\", "\\\\"); 
		 dbaName = dbaName.replaceAll("\"","\\\\\\\"");
		 dbaName = dbaName.replaceAll("<","&lt;");
		 dbaName = dbaName.replaceAll(">","&gt;");%>


{"SNo":<%=sNo%>,"BrokerName":"<bean:write name="subinsuredMap" property="Object::Submission::BrokerName" />","SubmissionNumber":"<a href='../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(TabPanelName)=Submission_Panel&customerId=<%=cId%>&answer(Object::Submission::SubmissionVerId)=<%=submissionVerId%>&answer(Object::Submission::SubmissionId)=<%=submissionId%>&answer(customerId)=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(Object::Submission::InsuredId)=<%=cId%>'><%=submissionNumber%></a>","SubmissionName":"<a href='../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(TabPanelName)=Submission_Panel&customerId=<%=cId%>&answer(Object::Submission::SubmissionVerId)=<%=submissionVerId%>&answer(Object::Submission::SubmissionId)=<%=submissionId%>&answer(customerId)<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(Object::Submission::InsuredId)=<%=cId%>'><%=""+subName %></a>","SubmissionStatus":"<%= ""+submissionStatus%>",
"ClearanceStatus":"<%= ""+clearanceStatus%>","DBA":"<%=""+dbaName %>","Address":"<bean:write name="subinsuredMap" property="Object::Customer::Address1"/><bean:write name="subinsuredMap" property="Object::Customer::Address2" />",
"City":"<bean:write name="subinsuredMap" property="Object::Customer::City" />","State":"<bean:write name="subinsuredMap" property="Object::Customer::State" />","Zip":"<bean:write name="subinsuredMap" property="Object::Customer::Zip" />",
"CreatedDate":"<%=createdDate %>","CustomerId":"<%= ""+cId%>","SubmissionVerId":"<%= ""+submissionVerId%>","SubmissionId":"<%= ""+submissionId%>","Status":"<%=""+status%>",
"SubmissionNumberLike":"<%= ""+submissionNumberLike%>","AgencyId":"<%= ""+agencyId%>","AgentId":"<%= ""+agentId%>","AgencyIdToLink":"<%= ""+agencyIdtoLink1%>","ObjectType":"<%= ""+objType1%>","TotalRecords":"<%=totalRecords %>"}

<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>


</logic:iterate>
]}
</logic:present>

<logic:notPresent name='searchresultCustomerDisplay'>
{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
"records"
:[]}
</logic:notPresent>




