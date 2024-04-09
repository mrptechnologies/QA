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
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container.css" />
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>

 	<div class="formpage01">
	 <div class="content">
	  
	     <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>	
		 <bean:define name = "FindOutBoundTransactions" property="answer(Object::Transaction::TransactionDetailId)" id="transactionDetailId1" />
		 <bean:define  property="answer(Object::Transaction::TransactionNumber)" name="FindOutBoundTransactions" id="transactionNumber" />
		 <bean:define  property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions" id="transactionType" />
		 <bean:define property="answer(Object::Transaction::TransactionMasterId)" name="FindOutBoundTransactions" id="transactionMasterId" />
		 <bean:define property="answer(Object::Transaction::TransactionStatus)" name="FindOutBoundTransactions" id="transactionStatusCheck" />
		 
	   <div class="formheadnew"><h2 class="left"> Endorsement Transaction Summary</h2></div>
	   
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
			<td class="field" width="30%" align = "right">Insured Name :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Transaction::InsuredName)" name="FindOutBoundTransactions"/>  
			</td>
		 </tr>	
		 <tr>
			<td class="field" width="30%" align = "right">Endorsement Number :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Endorsement::EndorsementNumber)" name="FindOutBoundTransactions"/>  
			</td>
		 </tr>	
		 
	  </table>
	  
	   <html:form action = "/UpdateEndorsementTransactionDetails">
		
		
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
		
		<tr><td colspan="3"><h3>Policy Data Exists</h3></td></tr>
		<tr>
			<td class="field" width="30%" align = "right">Endorsement Type :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="FindOutBoundTransactions" property="answer(Object::Endorsement::EndorsementType)" />
			</td> 
		</tr>
		<tr>
			<td class="field" width="30%" align = "right">Endorsement Effective Date :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			   <html:text property="answer(Object::Endorsement::EffectiveDate)"  name="FindOutBoundTransactions" />
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
		 <html:hidden property="answer(Object::Transaction::PolicyMasterAction)" name="FindOutBoundTransactions" />
		 <html:hidden property="answer(Object::Transaction::MasterStatusCode)" name="FindOutBoundTransactions"/>
		 <html:hidden property="answer(Object::Transaction::PolicyUpdateableAction)" name="FindOutBoundTransactions" />
		 <html:hidden property="answer(Object::Transaction::PolicyWrittenDate)" name="FindOutBoundTransactions" />
		 <html:hidden property="answer(Object::Transaction::ExpiryDate)" name="FindOutBoundTransactions" />
		 <html:hidden  property="answer(Object::Transaction::Reference)" name="FindOutBoundTransactions" />
		 <html:hidden property="answer(Object::Transaction::InceptionDate)" name="FindOutBoundTransactions" />
		 <bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		 <html:hidden property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions"/>
		 <html:hidden property="answer(Object::Transaction::TransactionMasterId)" name="FindOutBoundTransactions" />
 		 <html:hidden property="answer(Object::Transaction::TransactionStatus)" name="FindOutBoundTransactions" styleId="transactionStatus1" />
 		 <html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
 		 <html:hidden property="answer(Object::Endorsement::EndorsementType)"  name="FindOutBoundTransactions"/>
 		 <html:hidden property="answer(Object::Endorsement::EndorsementDetailId)"  name="FindOutBoundTransactions"/>
 		 <html:hidden property="answer(Object::Endorsement::SectionUpdateableAction)"  name="FindOutBoundTransactions"/>
 		 <html:hidden property="answer(Object::Endorsement::PolicyMasterAction)"  name="FindOutBoundTransactions"/>
 		 <html:hidden property="answer(Object::Transaction::TransactionNumber)" name="FindOutBoundTransactions" />
		 <html:hidden property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions" />
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
	
	 <div>&nbsp;</div>
    
    <%/*
        Coverage Detail */%>
    
    <div id="coverageListDiv">
	<dmshtml:get_INFCoverages_List nameInSession="arrCoverageDetails"  transactionDetailId="<%=Long.parseLong(""+transactionDetailId1)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	 <logic:present name="arrCoverageDetails">
   		<table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">
   			<tr><td colspan="9"><h3>Section Coverage Details</h3></td></tr>
 			  <tr>
			     <td>S.No</td>
			     <td>Cov Data Updateable Action</td>
			     <td>Section Type Code</td>
			     <td>TypeCode</td>
			     <td>LimitAmount</td>
			     <td>Deductible1</td>
			     <td>Deductible2</td>
			     <td>Premium</td>
			     <td>Annualised Premium</td>
			  </tr>
   			<tr><td>&nbsp;</td></tr>
		   <%long iterator = 1; 
		   %>
			<bean:define id="arrCoveragesList" name="arrCoverageDetails" type="java.util.ArrayList"/> 
 			<logic:iterate name="arrCoveragesList" id="sectionCoverageDetail" type="com.dms.ejb.webservice.liu.dataloader.SectionCoverageDetail">
				<bean:define id="coverageDetailId" name="sectionCoverageDetail" property="sectionCoverageDetailId" />
				 <tr>  
			      <td><a href="javascript:void(0);" onClick="return editEndorsementCoverageDetails(<%=""+coverageDetailId %>,<%=transactionDetailId1+"" %>);" ><%= iterator%></a></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="coverageDataUpdatableAction" /></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="sectionTypeCode" /></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="coverageTypeCode" /></td>
	    		  <td align="center"><bean:write name ="sectionCoverageDetail" property="coverageLimitAmount" /></td>
	    		  <td align="center"><bean:write name ="sectionCoverageDetail" property="coveargeDeductible01" /></td>
	  			  <td align="center"><bean:write name ="sectionCoverageDetail" property="coveargeDeductible02" /></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="coveragePremium" /></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="coverageAnnualisedPremium" /></td>
			     </tr>
	     		<%iterator=iterator+1; %>     
		   </logic:iterate> 
  		 </table> 
	</logic:present>
	</div>
	<div>&nbsp;</div>
	<div id="coverageDiv" style="display:block">
		<div id="editCoverageDetailDiv">
				
		</div>
		<a class="container-close" href="javascript:void(0);" id="closeIcon5"></a>
	</div>
 </div>
</div>


<script>

YAHOO.namespace("example.container");
function editAjaxINFLocationDetails(locationDetailId) {
document.getElementById("editINFLocationDetailsDiv").innerHTML="";
 loadINFLocationDetail(locationDetailId);
	document.getElementById("editINFLocationDetailsDiv").style.display = "block"; 
	document.getElementById("infLocationDiv").style.display = "block";  
	YAHOO.example.container.infLocationDiv.show();
}

function editAjaxEndorsementSectionCoverageDetails(coverageDetailId,transactionDetailId) {
document.getElementById("editCoverageDetailDiv").innerHTML="";
loadQuoteCoverageDetails(coverageDetailId,transactionDetailId);
	document.getElementById("editCoverageDetailDiv").style.display = "block";
	document.getElementById("coverageDiv").style.display = "block";  
	YAHOO.example.container.coverageDiv.show();
}
</script>

