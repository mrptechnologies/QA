<% 
/*
 * Copyright 2002-2010 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%@ page import="java.util.ArrayList"%>
<%response.setHeader("Cache-Control", "no-store");%>

<logic:present name='searchResultTransactionsDisplay'>
	<% String startIndex = ""+request.getParameter("startIndex");%>
	<%	ArrayList subList = (ArrayList)request.getAttribute("searchResultTransactionsDisplay");
		long listSize =subList.size();
		String results = ""+request.getParameter("results");
	%>
	<%String strRecCount= request.getAttribute("answer(strRecCount)")+""; %>
	<%String totalRecords=""; %>
	<logic:present name="outBoundTransactionsListSize" scope="request">
		<bean:define id="outBoundTransactionsListSize1" name="outBoundTransactionsListSize" scope="request"/>	
		<%totalRecords=outBoundTransactionsListSize1+""; %>
	</logic:present>

	{"recordsReturned":<%=listSize %>,"totalRecords":<%=totalRecords %>,"startIndex":<%=startIndex %>,"sort":"id","dir":"asc","pageSize":<%=""+results %>,
	"records"
	:[
	<%long sNo=Integer.parseInt(startIndex);%>
	<logic:iterate id="transactionsMap" name="searchResultTransactionsDisplay">
	<bean:define id = "transactionStatus" name="transactionsMap" property="Object::Transaction::Status" />
	<bean:define id = "policyId" name="transactionsMap" property="Object::Transaction::PolicyId" />
	<bean:define id = "policyVerId" name="transactionsMap" property="Object::Transaction::PolicyVerId" />
		<%
			sNo=sNo+1;
		    String status = ""+transactionStatus;
		    status = status.replaceAll("_"," ");
		%>
		{"SNo":<%=sNo%>,"TransactionNo":"<bean:write name="transactionsMap" property="Object::Transaction::TransactionNumber"/>","TransactionType":"<bean:write name="transactionsMap" property="Object::Transaction::TransactionType" />","ProductCode":"<bean:write name="transactionsMap" property="Object::Transaction::ProductCode"/>","Status": "<%=""+status %>","ExpiryDate":"<bean:write name="transactionsMap" property="Object::Transaction::ExpiryDate" />","InsuredNameCode"
		:"<bean:write name="transactionsMap" property="Object::Transaction::InsuredNameCode" />","InsuredName":"<bean:write name="transactionsMap" property="Object::Transaction::InsuredName" />","SubmissionNo":"<bean:write name="transactionsMap" property="Object::Transaction::SubmissionNo" />",
		"PolicyNo":"<bean:write name="transactionsMap" property="Object::Transaction::PolicyNo" />",
		"SubmissionId":"<bean:write name="transactionsMap" property="Object::Transaction::SubmissionId" />","SubmissionVerId":"<bean:write name="transactionsMap" property="Object::Transaction::SubmissionVerId" />","CustomerId":"<bean:write name="transactionsMap" property="Object::Transaction::CustomerId" />","BatchLogDetailId":"<bean:write name="transactionsMap" property="Object::Transaction::BatchLogDetailId" />",
		"TransactionDetailId":"<bean:write name="transactionsMap" property="Object::Transaction::TransactionDetailId" />","TransactionMasterId":"<bean:write name="transactionsMap" property="Object::Transaction::TransactionMasterId" />",
		"TotalRecords":"<%=totalRecords %>","PolicyId":"<%=""+policyId %>","PolicyVerId":"<%=""+policyVerId %>"}
		<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
	</logic:iterate>
]}
</logic:present>
<logic:notPresent name='searchResultTransactionsDisplay'>
{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
"records"
:[]}
</logic:notPresent>



