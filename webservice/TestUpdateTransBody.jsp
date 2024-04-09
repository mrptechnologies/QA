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
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>




<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<form action="/UpdateProcessTransXML.do" method="post"  onsubmit="sendXML()">

<div class="formpage01">
<div class="formhead"><h2 class="left">Invoke UpdateProcessTrans</h2></div>
<logic:present name="MESSAGE_LIST" scope="request">
	<logic:iterate id="message" name="MESSAGE_LIST">
		<div align="center" style="font-weight:bold;font-size:15px;color:red;"></br><bean:write name="message"/></div>
	</logic:iterate>
</logic:present>

 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">	

	<tr>
		<td>&nbsp;</td>				
	</tr>
	<tr><td>
	 <B>Input the UpdateProcessTrans XML data in this textbox (sample test data is provided in the texbox):</B>
	 </td></tr>	
	<tr>
		<td>&nbsp;</td>				
	</tr>
	<tr>
			 <td>			
			 
			 <textarea name="feedback" id="updateTransXML" rows="20" cols="100" > </textarea>
			 <input type="hidden" name="answer(productCode)" value="STEIL001"/>

			 </td>
		 </tr>
		 <tr>
			<td>&nbsp;</td>				
		</tr>
		<tr>
		<td>	
			<div class="field">
			<input type=submit class="covbutton" value="Invoke UpdateProcessTrans"  onclick="" style="width:210px;">		
			</div>			

			</td>
		</tr>
</table>
<table>
<tr><td>
<p><font color="#004080">*This page will allow user to manually invoke UpdateProcessTran Web Service with data provided in the textbox</font></p>
</td></tr></table>

<input type="hidden" name="answer(SolartisTest)" id="SolartisTest" value="Y" /></td>
			
  
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
<%String xml=""; %>

<html:hidden property="answer(xml)" value="<%=xml %>" styleId="xml"/>
</div>

<SCRIPT type="text/JavaScript">


 
function sendXML(){	
	document.getElementById('xml').value=document.getElementById('updateTransXML').value;	
 }
 
 		var	updateTransxmlSample="<ns0:UpdateProcessedTran xmlns:ns0=\"http://LIU.B2B.BizTalk.Schemas.UpdateProcessedTran\">\n"+
 		
		"<Batch>\n"+
		"	<Vendor>VendorName_PRD</Vendor>\n"+
		"	<DataFeed>27</DataFeed>\n "+
		"	<BatchID>4761</BatchID> \n"+
		"	<BatchStartDateTime>2008-02-22T21:00:09.550</BatchStartDateTime>\n "+
		"	<TotalTransCount>1</TotalTransCount>\n "+
		"	<SuccessTransCount>1</SuccessTransCount>\n "+
		"	<FailedTransCount>0</FailedTransCount>\n "+
		"	<TotalPremium>0</TotalPremium>\n "+
		"	<SuccessPremium>0</SuccessPremium>\n "+
		"	<FailedPremium>0</FailedPremium>\n "+
			"	<Transactions>\n"+
				"		<Transaction>\n"+
				"			<TranLogKey>4511</TranLogKey> \n"+
				"			<TranType>Create</TranType>\n "+
				"			<TranProcessDateTime>2008-02-22T21:00:46</TranProcessDateTime>\n "+
				"			<TranSubmissionReference>XX000nnnnn</TranSubmissionReference>\n "+
				"			<TranPolicyReference> </TranPolicyReference>\n "+
				"			<TranStatus>pass</TranStatus>\n "+
				"		</Transaction>\n"+			
			"	</Transactions>\n"+
		"</Batch>\n"+
		"</ns0:UpdateProcessedTran>\n";
 document.getElementById('updateTransXML').value=updateTransxmlSample;
</script>
</form>
