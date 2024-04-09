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

<SCRIPT type="text/javascript" src="../Scripts/JScripts/FindOutBoundTransactions.js"></SCRIPT>
<SCRIPT type="text/javascript" src="../Scripts/JScripts/CommonYUIUtil.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>

<html:form action="/FindOutBoundTransactionDetails.do" onsubmit="return false;">
<div class="formpage01">
<div class="content">
<div class="formheadnew"><h2 class="left">Find OutBound Transactions</h2></div>
<div>&nbsp;</div>
<!-- 
<div class="field" style="width:425px">Batch # :
<input type="text" name="answer(Object::BatchLog::Equals::BatchLogId)" maxlength="10" style="width:100px" id="batchLogId"/> 
</div>
 -->
<div class="field" style="width:555px">Web Service Requested Start Date :
<input type="text" name="answer(startDateMonth)" size="2" maxlength="2" style="width:25px" id="startMonth" onkeyup="if(this.value.length==2) {document.forms[0].startDay.focus()}" /> /
<input type="text" name="answer(startDateDay)" size="2" maxlength="2" style="width:25px" id="startDay" onkeyup="if(this.value.length==2) {document.forms[0].startYear.focus()}" /> /
<input type="text" name="answer(startDateYear)" size="4" maxlength="4"  id="startYear"/>(MM/DD/YYYY)
</div>
<div class="field" style="width:555px">Web Service Requested End Date :
<input type="text" name="answer(endDateMonth)" size="2" maxlength="2" style="width:25px" id="endMonth" onkeyup="if(this.value.length==2) {document.forms[0].endDay.focus()}" /> /
<input type="text" name="answer(endDateDay)" size="2" maxlength="2" style="width:25px" id="endDay" onkeyup="if(this.value.length==2) {document.forms[0].endYear.focus()}" /> /
<input type="text" name="answer(endDateYear)" size="4" maxlength="4"  id="endYear"/>(MM/DD/YYYY)
</div>
<div class="field" style="width:440px">Transaction Type :
<html:select property="answer(Object::Transaction::TransactionType)" styleClass="txtbox">
	<html:option value ="">All</html:option>							
	<html:option value ="Submission">Submission</html:option>	
	<html:option value ="QuoteUpdate">QuoteUpdate</html:option>						
	<html:option value ="TakeUp">TakeUp</html:option>
	<html:option value ="PolicyCancel">PolicyCancel</html:option>
	<html:option value="PolicyReinstate">PolicyReinstate</html:option>
	<html:option value="Policy Update">PolicyUpdate</html:option>
	<html:option value="Endorsement">Endorsement</html:option>
	<html:option value="Renewal">PolicyRenewal</html:option>
</html:select>
</div>
<div class="field" style="width:425px">Submission # :
 <input type="text" name="answer(Object::Transaction::Equals::SubmissionNo)" maxlength="15" style="width:100px" id="SubmissionNo"/> 
</div>
<div class="field" style="width:425px">Policy # :
 <input type="text" name="answer(Object::Transaction::Equals::PolicyNo)" maxlength="15" style="width:100px" id="PolicyNo"/> 
</div>
<div class="field" style="width:425px">Insured Name Code :
 <input type="text" name="answer(Object::Transaction::Equals::InsuredNameCode)" maxlength="10" style="width:100px" id="InsuredNameCode"/> 
</div>
<div>&nbsp;</div>

<div class="formcontent" style="width:50%;" align="center"><center>
<input type="submit" value="Find >" class="covbutton" onclick="FindOutBoundTransaction('../FindOutBoundTransactionDetails.do')" style="width:90px;">	</center>
</div>

<table>
		<tr>
		<td>&nbsp;</td>
		<td colspan=5><div id="DivTotalRecords"></div></td>
		<tr>
		<td>&nbsp;</td>
		<td align="left">
<div id="dynamicSearchResultData"></div> 
</td>
</tr>
</table>
</div>

</div>

<html:hidden styleId="inpPageNum" property="answer(Object::Transaction::PageNum)" value="0"/>
<html:hidden property="answer(Object::Transaction::Equals::RequestedStartDate)" value="" styleId="requestedStartDate"/>
<html:hidden property="answer(Object::Transaction::Equals::RequestedEndDate)" value="" styleId="requestedEndDate"/>	
</html:form>


