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


<SCRIPT type="text/JavaScript">

function sendXML(){
 
var xml="<?xml version=\"1.0\" encoding=\"utf-8\"?>"+
"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"+
  "<soap:Body>"+
    "<GetDataFeed xmlns=\"http://vendor.com.xx/webservices/\">"+
      "<username>"+document.getElementById('UserName').value+"</username>"+
      "<password>"+document.getElementById('Password').value+"</password>"+
      "<productCode>STEIL001</productCode>"+
   "<transactionType>"+document.getElementById('TransactionType').value+"</transactionType>"+
    "</GetDataFeed>"+
  "</soap:Body>"+
"</soap:Envelope>";


document.getElementById('xml').value=xml;

 }
 
</script>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<form action="/RegSubmissionXML.ws" method="post" target="_blank" onsubmit="sendXML()">

<div class="formpage01">
<div class="formhead"><h2 class="left">Invoke GetDataFeed</h2></div>

 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">	
<tr><td>&nbsp;</td></tr>
<tr id="company_legal_name1" >
					<td width="40%" class="field" align="right"	id="legalName1">WebService User Name&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<input type="text" name="answer(UserName)" size="50" maxlength="50" class="txtbox" id="UserName" /></td>				
					
			</tr>
			<tr id="company_legal_name2">
					<td width="40%" class="field" align="right"	id="legalName2">WebService Password&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<input type="password"	name="answer(Password)" size="50"	maxlength="50" class="txtbox" id="Password" autocomplete="off"/></td>
					
			</tr>
			<tr>
			<td width="40%" class="field" align="right"	id="legalName2">Select Transaction Type&nbsp;&nbsp;</td>
			<td class="links" width="60%">
						<select name="answer(transactionType)" class="txtbox" id="TransactionType">
								<option value="Submission">Submission</option>
								<option value="QuoteUpdate">QuoteUpdate</option>
								<option value="TakeUp">Takeup</option>
								<option value="PolicyCancel">PolicyCancel</option>	
								<option value="PolicyReinstate">PolicyReinstate</option>
								<option value="PolicyUpdate">PolicyUpdate</option>
								<option value="Endorsement">Endorsement</option>		
								<option value="Renewal">PolicyRenewal</option>																													
			             </select>
		  </td>
			</tr>
			<tr>
		<td>&nbsp;</td>
				<td>&nbsp;
				<input type="hidden" name="answer(productCode)" value="STEIL001"/>
				</td>
		</tr>		
</table>
<table border="0" align="left" width="75%">
<tr>
		<td align="left"><div class="field">
			<input type=submit class="covbutton" value="Invoke GetDataFeed"  style="width:200px;">		
			</div>	</td>	
											
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr><td>
<p><font color="#004080">*This page will allow user to manually invoke GetDataFeed Web Service</font></p>
</td></tr>
</table>
<input type="hidden" name="answer(SolartisTest)" id="SolartisTest" value="Y" /></td>			
  
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
<%String xml="<?xml version=\"1.0\" encoding=\"utf-8\"?>"+
"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"+
  "<soap:Body>"+
    "<GetDataFeed xmlns=\"http://vendor.com.xx/webservices/\">"+
      "<username>underwriter1</username>"+
      "<password>liuwelcome1</password>"+
      "<productCode>STEIL001</productCode>"+
      "<transactionType>SUBMISSION</transactionType>"+
    "</GetDataFeed>"+
  "</soap:Body>"+
"</soap:Envelope>";
 %>

<html:hidden property="answer(xml)" value="<%=xml %>" styleId="xml"/>
</div>
</form>
