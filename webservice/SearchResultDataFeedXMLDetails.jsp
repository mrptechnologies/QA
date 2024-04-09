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

<logic:present name='searchResultBatchLogDisplay'>
	<% String startIndex = ""+request.getParameter("startIndex");%>
	<%	ArrayList subList = (ArrayList)request.getAttribute("searchResultBatchLogDisplay");
		long listSize =subList.size();
		String results = ""+request.getParameter("results");
	%>
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
	<logic:iterate id="batchLogMap" name="searchResultBatchLogDisplay">
		<%
			sNo=sNo+1;
		%>
		{"SNo":<%=sNo%>,"BatchLogId":"<bean:write name="batchLogMap" property="Object::BatchLog::BatchId"/>",
		"TransactionType":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionType" />",
		"ProductCode":"<bean:write name="batchLogMap" property="Object::BatchLog::ProductCode"/>",
		"TotalRecordsinBatch":"<bean:write name="batchLogMap" property="Object::BatchLog::TotalRecords" />",
		"TotalPremiumForBatch":"$<bean:write name="batchLogMap" property="Object::BatchLog::TotalPremium" />",
		"SendURL":"<bean:write name="batchLogMap" property="Object::BatchLog::SendURL" />",
		"ResponseXML":"<bean:write name="batchLogMap" property="Object::BatchLog::ResponseXMLFilePath" />",
		"TotalRecords":"<%=totalRecords %>"}
		<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
	</logic:iterate>
]}
</logic:present>
<logic:notPresent name='searchResultBatchLogDisplay'>
{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
"records"
:[]}
</logic:notPresent>



