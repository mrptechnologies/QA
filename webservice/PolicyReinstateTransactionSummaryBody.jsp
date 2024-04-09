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
<SCRIPT SRC="../Scripts/JScripts/WebService.js" type="text/javascript"> </SCRIPT>

 	<div class="formpage01">
	 <div class="content">
	 
	 <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>	
	 <bean:define name = "FindOutBoundTransactions" property="answer(Object::Transaction::TransactionDetailId)" id="transactionDetailId1" />
	 <bean:define  property="answer(Object::Transaction::TransactionNumber)" name="FindOutBoundTransactions" id="transactionNumber" />
	 <bean:define  property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions" id="transactionType" />
	 <bean:define property="answer(Object::Transaction::TransactionMasterId)" name="FindOutBoundTransactions" id="transactionMasterId" />
	 <bean:define property="answer(Object::Transaction::TransactionStatus)" name="FindOutBoundTransactions" id="transactionStatusCheck" />
	
	 <div class="formheadnew"><h2 class="left"> Policy Reinstate Transaction Summary</h2></div>
	   
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
	  
	  <html:form action = "/UpdatePolicyReinstateTransactionDetails">
	    <table width= "100%">
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
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions"/>  
			</td>
		 </tr>	
		<tr>
			<td class="field" width="30%" align = "right">Transaction Number :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="FindOutBoundTransactions" property="answer(Object::Transaction::TransactionNumber)"/>
			  <html:hidden property="answer(Object::Transaction::TransactionNumber)" value = "<%=""+transactionNumber %>" />
			  <html:hidden property="answer(Object::Transaction::TransactionType)" value = "<%=""+transactionType %>" />
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
			  <html:text  property="answer(Object::Transaction::MasterReference)" name="FindOutBoundTransactions" />
			</td>
		</tr>
		<tr><td colspan="3"><h3>Reinstate</h3></td></tr>
		<tr>
			<td class="field" width="30%" align = "right">Master Status :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			   <html:text property="answer(Object::Transaction::MasterStatusCode)" name="FindOutBoundTransactions"/>
			</td>
		</tr>
		<tr>
			<td class="field" width="30%" align = "right">Transaction Status :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			   <html:select name="FindOutBoundTransactions" property="answer(Object::Transaction::TransactionStatus)" styleId="transactionStatus"> 
				   		<html:option value ="SEND_TO_GENIUS">Send To Genius</html:option>	
						<html:option value ="DO_NOT_SEND_TO_GENIUS">Do Not Send To Genius</html:option>						
						<%if((""+transactionStatusCheck).equalsIgnoreCase("TREATY_HOLD")){ %><html:option value ="TREATY_HOLD">Treaty Hold</html:option><%}else{%>
						<html:option value ="Already Sent to Genius">Already Sent To Genius</html:option><% } %>
			   </html:select>
			</td>
		</tr>
		<html:hidden property="answer(Object::Transaction::PolicyUpdateableAction)" name="FindOutBoundTransactions" />
		<html:hidden property="answer(Object::Transaction::PolicyMasterAction)" name="FindOutBoundTransactions" />
		<html:hidden property="answer(Object::Transaction::PolicyWrittenDate)" name="FindOutBoundTransactions" />
		<html:hidden  property="answer(Object::Transaction::Reference)" name="FindOutBoundTransactions" />
		<html:hidden property="answer(Object::Transaction::InceptionDate)" name="FindOutBoundTransactions" />
		<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		<html:hidden property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions" />
		<html:hidden property="answer(Object::Transaction::TransactionMasterId)" name="FindOutBoundTransactions" />
 		<html:hidden property="answer(Object::Transaction::TransactionStatus)" name="FindOutBoundTransactions" styleId="transactionStatus1" />
 		<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
		</table>
		<table width="100%">
        <tr><td colspan="2">&nbsp;</td></tr>
         <tr>
         <td width="25%">
          <td width="75%" align="left">
            <html:submit value="Save" styleClass="covbutton" onclick="ValidateFields();"/>
          </td>
         </tr>
        </table>
	  </html:form>
   </div>
</div>




