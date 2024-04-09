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

<%long sNo=Integer.parseInt(startIndex);%>
<logic:iterate id="insuredMap" name="searchresultCustomerDisplay">
<bean:define id="customerName" name="insuredMap" property="Object::Customer::CustomerName" />
<% String insuredName = (""+customerName).replace("\\", "\\\\");
insuredName = insuredName.replaceAll("\"","\\\\\\\"");
insuredName = insuredName.replaceAll("<","&lt;").replaceAll(">","&gt;");%>
<%
sNo=sNo+1;
String agencyId = ""; 
%>

		<%// userName=userId+"";%>
		 <bean:define id="userId1" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
		 	


{"SNo":<%=sNo%>,"InsuredNumber":"<a href='../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<bean:write name="insuredMap" property="Object::Customer::CustomerId"/>'><bean:write name="insuredMap" property="Object::Customer::CustomerNumber"/></a> ","InsuredName":"<a href='../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<bean:write name="insuredMap" property="Object::Customer::CustomerId"/>'><%=""+insuredName %></a>","Address":"<bean:write name="insuredMap" property="Object::Customer::Address1"/><bean:write name="insuredMap" property="Object::Customer::Address2" />","City":"<bean:write name="insuredMap" property="Object::Customer::City" />","State"
:"<bean:write name="insuredMap" property="Object::Customer::State" />","Zip":"<bean:write name="insuredMap" property="Object::Customer::Zip" />","CustomerId":"<bean:write name="insuredMap" property="Object::Customer::CustomerId" />","TotalRecords":"<%=totalRecords %>"}

<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>


</logic:iterate>
]}
</logic:present>

<logic:notPresent name='searchresultCustomerDisplay'>
{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
"records"
:[]}
</logic:notPresent>




