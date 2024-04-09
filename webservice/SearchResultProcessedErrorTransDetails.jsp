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

<logic:present name='searchResultBatchLogStatus'>
	<% String startIndex = ""+request.getParameter("startIndex");%>
	<%ArrayList subList = (ArrayList)request.getAttribute("searchResultBatchLogStatus");
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
	<logic:iterate id="batchLogMap" name="searchResultBatchLogStatus">
	<bean:define id="createdDate" name="batchLogMap" property="Object::BatchLog::CreatedDate" />
		<%
			sNo=sNo+1;
		%>		
		<%if(createdDate==""){ %>
			{"SNo":<%=sNo%>,"BatchId":"<bean:write name="batchLogMap" property="Object::BatchLog::BatchId"/>","TransactionType":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionType" />","TransactionStatus":"<bean:write name="batchLogMap" property="Object::BatchLog::Status"/>","SubmissionNo":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionNo" />","PolicyNo":"<bean:write name="batchLogMap" property="Object::BatchLog::PolicyNo" />","CreatedDate"
			:"<%=(createdDate+"") %>","MasterStatusCode":"<bean:write name="batchLogMap" property="Object::BatchLog::MasterStatusCode" />","TransactionNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionNumber" />","SubmissionId":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionId"/>","SubmissionVerId":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionVerId"/>","PolicyId":"<bean:write name="batchLogMap" property="Object::BatchLog::PolicyId"/>","PolicyVerId":"<bean:write name="batchLogMap" property="Object::BatchLog::PolicyVerId"/>","ParentQuoteId":"<bean:write name="batchLogMap" property="Object::BatchLog::ParentQuoteId"/>","ParentQuoteVerId":"<bean:write name="batchLogMap" property="Object::BatchLog::ParentQuoteVerId"/>","QuoteNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::QuoteNumber"/>","QuoteSubNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::QuoteSubNumber"/>","CustomerId":"<bean:write name="batchLogMap" property="Object::BatchLog::CustomerId"/>","TotalRecords":"<%=totalRecords %>"
			}
			<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
		<%}else{ %>
			{"SNo":<%=sNo%>,"BatchId":"<bean:write name="batchLogMap" property="Object::BatchLog::BatchId"/>","TransactionType":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionType" />","TransactionStatus":"<bean:write name="batchLogMap" property="Object::BatchLog::Status"/>","SubmissionNo":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionNo" />","PolicyNo":"<bean:write name="batchLogMap" property="Object::BatchLog::PolicyNo" />","CreatedDate"
			:"<%=(createdDate+"").substring(0, 10) %>","MasterStatusCode":"<bean:write name="batchLogMap" property="Object::BatchLog::MasterStatusCode" />","TransactionNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::TransactionNumber" />","SubmissionId":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionId"/>","SubmissionVerId":"<bean:write name="batchLogMap" property="Object::BatchLog::SubmissionVerId"/>","PolicyId":"<bean:write name="batchLogMap" property="Object::BatchLog::PolicyId"/>","PolicyVerId":"<bean:write name="batchLogMap" property="Object::BatchLog::PolicyVerId"/>","ParentQuoteId":"<bean:write name="batchLogMap" property="Object::BatchLog::ParentQuoteId"/>","ParentQuoteVerId":"<bean:write name="batchLogMap" property="Object::BatchLog::ParentQuoteVerId"/>","QuoteNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::QuoteNumber"/>","QuoteSubNumber":"<bean:write name="batchLogMap" property="Object::BatchLog::QuoteSubNumber"/>","CustomerId":"<bean:write name="batchLogMap" property="Object::BatchLog::CustomerId"/>","TotalRecords":"<%=totalRecords %>"
			}
			<%if(listSize!=(Long.parseLong(sNo+"")-Long.parseLong(startIndex+""))){ %>,<%} %>
		<%} %>
   </logic:iterate>
	]}
</logic:present>
<logic:notPresent name='searchResultBatchLogStatus'>
	{"recordsReturned":0,"totalRecords":0,"startIndex":0,"sort":"id","dir":"asc","pageSize":25,
	"records"
	:[]}
</logic:notPresent>



