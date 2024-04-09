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




<script type="text/javascript" src="../Scripts/prototype.js"></script>

<div class="formpage01">
<div class="content">
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="dbname" property="answer(dbname)" name="LoginPage" scope="session"/>
<bean:define property="answer(Object::Transaction::TransactionStatus)" name="FindOutBoundTransactions" id="transactionStatusCheck" />
<bean:define  property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions" id="transactionType" />
	
  
  <div class="formheadnew"><h2 class="left"> Policy Cancel Summary</h2></div>
  
  <table width= "100%">
		<tr><td colspan="3"><h3>Internal Reference Information</h3></td></tr>
		<tr>
			<td class="field" width="30%" align = "right">Transaction Datetimestamp :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="answer(Object::Transaction::CreatedDate)" name="FindOutBoundTransactions" />
			</td>
		</tr>
		<tr>
			<td class="field" width="30%" align = "right">Policy Number :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Policy::PolicyNumber)" name="FindOutBoundTransactions"/>  
			</td>
		 </tr>	
		 <tr>
			<td class="field" width="30%" align = "right">Policy Sub Number :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Policy::PolicySubNumber)" name="FindOutBoundTransactions"/>  
			</td>
		 </tr>	
  </table>
  
<html:form action="/UpdatePolicyCancelDetails.do">
													
 <table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">		
 
    <tr><td colspan="3"><h3>Policy Updateable</h3></td></tr>
	<tr>
		<td class="field" width="30%" align = "right">Policy Updateable Action :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="answer(Object::Transaction::PolicyUpdateableAction)" name="FindOutBoundTransactions" />
		</td>
	</tr>
	<tr>
		<td class="field" width="30%" align = "right">Transaction Type :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PolicyCancel
	
		</td>
	 </tr>	
	<tr>
		<td class="field" width="30%" align = "right">Transaction Number :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name = "FindOutBoundTransactions" property="answer(Object::Transaction::TransactionNumber)"/>
		  <html:hidden property="answer(Object::Transaction::TransactionNumber)" name="FindOutBoundTransactions" />
		  <html:hidden property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions" />
		</td>
	</tr>	
	<tr>
		<td class="field" width="30%" align = "right">Policy Option :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="FindOutBoundTransactions" property="answer(Object::Transaction::PolicyOption)" />
		</td>
	</tr>
	<tr><td colspan="3"><h3>Policy Master</h3></td></tr>
	<tr>
		<td class="field" width="30%" align = "right">Master Reference :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  <html:text property="answer(Object::Transaction::MasterReference)" name="FindOutBoundTransactions" />
		</td>
	</tr>
	<tr><td colspan="3"><h3>Cancellation</h3></td></tr>
	<tr>
		<td class="field" width="30%" align = "right">Cancellation Date :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name = "FindOutBoundTransactions" property="answer(Object::PolicyCancel::CancellationDate)"/>
		</td>
	</tr>
	<tr>
		<td class="field" width="30%" align = "right">Master Status :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  <html:text name = "FindOutBoundTransactions" property="answer(Object::PolicyCancel::infMasterStatus)"/>
		</td>
	</tr>
	<tr>
		<td class="field" width="30%" align = "right">Premium :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  <html:text name = "FindOutBoundTransactions" property="answer(Object::PolicyCancel::infCancellationPremium)"/>
		</td>
	</tr>
	<tr>
		<td class="field" width="30%" align = "right">Transaction Status :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  <html:select name = "FindOutBoundTransactions" property="answer(Object::Transaction::TransactionStatus)" styleId="transactionStatus"> 
				   		<html:option value ="SEND_TO_GENIUS">Send To Genius</html:option>	
						<html:option value ="DO_NOT_SEND_TO_GENIUS">Do Not Send To Genius</html:option>						
						<%if((""+transactionStatusCheck).equalsIgnoreCase("TREATY_HOLD")){ %><html:option value ="TREATY_HOLD">Treaty Hold</html:option><%}else{%>
						<html:option value ="Already Sent to Genius">Already Sent To Genius</html:option><% } %>
		  </html:select>			   
		</td>
	</tr>
    <tr><td colspan="3">&nbsp;</td></tr>
    <tr>      
        <td colspan="2">&nbsp;</td>
        <td align="left"><html:submit value="Save" styleClass="covbutton" /></td>	
    </tr>             
    <tr> 
     <td colspan="3">&nbsp;</td></tr>
    </table>
     <html:hidden name = "FindOutBoundTransactions" property="answer(Object::PolicyCancel::CancellationDate)"/>
	<html:hidden name ="FindOutBoundTransactions" property="answer(Object::Transaction::TransactionMasterId)"/>
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::Transaction::TransactionDetailId)" />
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::Transaction::TransactionType)" value="Cancel"/>
	<html:hidden name="FindOutBoundTransactions" property="answer(BatchLogDetailId)" />
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::Transaction::TransactionNumber)" />
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::PolicyCancel::infCancellationType)" />
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::PolicyCancel::infCancelAction)" />		
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::Transaction::PolicyUpdateableAction)" />
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::Transaction::InceptionDate)" />	
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::Transaction::PolicyMasterAction)" />		
	<html:hidden  name="FindOutBoundTransactions" property="answer(Object::Transaction::Reference)" />		
	<html:hidden  name="FindOutBoundTransactions" property="answer(Object::Transaction::PolicyWrittenDate)" />	
    <html:hidden  name="FindOutBoundTransactions" property="answer(Object::Transaction::MasterStatusCode)" />
    <html:hidden  name="FindOutBoundTransactions" property="answer(Object::Transaction::ExpiryDate)" />	
    <html:hidden name ="FindOutBoundTransactions" property="answer(Object::PolicyCancel::infCancelDetailId)"/>
</html:form>
</div>
</div>


