<% 
/*
 * Copyright 2002-2010 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%	long batchId=0;
	String totalRecords ="";
	long pagenum = 0;
%>
<%if (request.getParameter("answer(Object::BatchLog::Like::BatchLogId)")!= null) {
	   batchId=Long.parseLong(request.getParameter("answer(Object::BatchLog::Like::BatchLogId)"));
		
}%> 
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../FindDataFeedTransactionDetails.do?answer(Object::BatchLog::Like::BatchLogId)=<%=""+batchId%>&answer(Object::Customer::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>
 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td height="15" WIDTH="100%"></td>
	</tr>
	<tr>
		<td class="sectionhead" align="center" WIDTH="100%">Batch Log Detail List</td>
	</tr>
	<tr><td WIDTH="100%">&nbsp;</td></tr>
	<logic:present name="batchLogListSize" scope="request">
		<bean:define id="batchLogListSize1"   name="batchLogListSize" scope="request"/>
		<%totalRecords=batchLogListSize1+""; %>
		<tr><td WIDTH="100%"><html:hidden property="answer(Object::BatchLog::TotalRec)" value="<%=""+totalRecords%>"/></td></tr>	
		<tr><td class="FormLabels" WIDTH="100%">No of Records Found:&nbsp;<%=""+totalRecords%></td></tr>
	 </logic:present>
	<logic:present name ='searchResultBatchLogDetailDisplay' scope ='request'>
	<%String strRecCount= request.getAttribute("answer(strRecCount)")+""; %>
	<%long sNo=0;%>
	<tr>
	 <td WIDTH="100%">
		<table class="loctable" cellpadding="0" cellspacing="0">
		 <logic:present name="searchCriteria" scope="request">
			<bean:define id="searchMap" name="searchCriteria" scope="request" />
		 </logic:present>
		<tr>
			<td align="Left" class="links" colspan="3">
				<logic:present name="prevCustomer"  scope="request" >
					<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)-1)%>)" >
					<bean:message key="Common.Previous"/></a>
				</logic:present>
			</td>
			<td align="right" class="links" colspan="6">
				<logic:present name="moreCustomer"  scope="request" >
					<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)+1)%>)" >Next&gt;&gt;</a>
				</logic:present>
			</td>
		</tr>
		<tr><td colspan="9" >&nbsp;</td></tr>
  		<tr>
			<th>
				SNo
			</th>	
			<th>
				Batch #
			</th>	
			<th>
				Transaction Type
			</th>	
			<th>
				Product Code
			</th>
		    <th>
				Status
			</th>
			<th>
				Insured Name Code
			</th>
			<th>
				Insured Name
			</th>
			<th>
				Submission #
			</th>
			<th>
				Policy #
		    </th>
		</tr>    
	 <logic:iterate id="batchLogMap" name="searchResultBatchLogDetailDisplay">
		<%
			sNo=sNo+1;
		%>
		<tr>
		  <td><%=sNo%></td>
		  <td><bean:write name="batchLogMap" property="Object::BatchLog::BatchId"/></td>
		  <td><bean:write name="batchLogMap" property="Object::BatchLog::TransactionType"/></td>
		  <td><bean:write name="batchLogMap" property="Object::BatchLog::ProductCode"/></td>
		  <td><bean:write name="batchLogMap" property="Object::BatchLog::TransactionStatus"/></td>
		  <td><bean:write name="batchLogMap" property="Object::BatchLog::InsuredNameCode" /></td>
		  <td><bean:write name="batchLogMap" property="Object::BatchLog::InsuredName"/></td>
		  <td><bean:write name="batchLogMap" property="Object::BatchLog::SubmissionNumber" /></td>
		  <td><bean:write name="batchLogMap" property="Object::BatchLog::PolicyNumber"/></td>
	   </tr>
	</logic:iterate>
  </table>
 </td>
 </tr>
 </logic:present>
</table>
				

	