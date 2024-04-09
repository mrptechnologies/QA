<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%@ page import="java.util.ArrayList"%>
<%response.setHeader("Cache-Control", "no-store");%>

<logic:present name='searchResultBatchLogDetailDisplay'>
<% String startIndex = ""+request.getParameter("startIndex");%>
<%ArrayList subList = (ArrayList)request.getAttribute("searchResultBatchLogDetailDisplay");
long listSize =subList.size();
String results = ""+request.getParameter("results");%>
<%String strRecCount= request.getAttribute("answer(strRecCount)")+""; %>
<%String totalRecords=""; %>
<logic:present name="batchLogListSize" scope="request">
<bean:define id="batchLogListSize1" name="batchLogListSize" scope="request"/>	
<%totalRecords=batchLogListSize1+""; %>
</logic:present>

{"recordsReturned":<%=listSize %>,"totalRecords":<%=totalRecords %>,"startIndex":<%=startIndex %>,"sort":"id","dir":"asc","pageSize":<%=""+results %>,
"records"
:[

<%long sNo=Integer.parseInt(startIndex);%>

<logic:iterate id="batchLogMap" name="searchResultBatchLogDetailDisplay">
<bean:define id = "transactionStatus" name="batchLogMap" property="Object::BatchLog::TransactionStatus" />
<bean:define id = "policyId" name="batchLogMap" property="Object::BatchLog::PolicyId" />
<bean:define id = "policyVerId" name="batchLogMap" property="Object::BatchLog::PolicyVerId" />
<%
sNo=sNo+1;
String status = ""+transactionStatus;
status = status.replaceAll("_"," ");
%>

{"SNo":<%=sNo%>,"BatchLogId":"<bean:write name="batchLogMap" property="Object::BatchLog::BatchId"/>","TransactionType":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionType" />","ProductCode":"<bean:write name="batchLogMap" property="Object::BatchLog::ProductCode"/>","Status":"<%=""+status %>","InsuredNameCode":"<bean:write name="batchLogMap" property="Object::BatchLog::InsuredNameCode" />","InsuredName":"<bean:write name="batchLogMap" property="Object::BatchLog::InsuredName" />","SubmissionNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionNumber" />","PolicyNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::PolicyNumber" />","TransMasterId":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionMasterId" />","SubmissionId":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionId" />","SubmissionVerId":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionVerId" />","CustomerId":"<bean:write name="batchLogMap" property="Object::BatchLog::CustomerId" />","BatchLogDetailId":"<bean:write name="batchLogMap" property="Object::BatchLog::BatchLogDetailId" />","TransactionNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionNumber" />",
"TransactionDetailId":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionDetailId" />","TransactionMasterId":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionMasterId" />","PolicyId":"<%=""+policyId %>","PolicyVerId":"<%=""+policyVerId %>","TotalRecords":"<%=""+totalRecords %>"}
	
<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>


</logic:iterate>
]}
</logic:present>

<logic:notPresent name='searchResultBatchLogDetailDisplay'>
{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
"records"
:[]}
</logic:notPresent>



