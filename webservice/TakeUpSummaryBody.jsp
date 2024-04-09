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

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="dbname" property="answer(dbname)" name="LoginPage" scope="session"/>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container.css" />
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/TakeUpSummary.js"></script>
<bean:define name = "FindOutBoundTransactions" property="answer(Object::TakeUp::TransactionDetailId)" id="transactionDetailId1" />
	<bean:define  property="answer(Object::TakeUp::TransactionNumber)" name="FindOutBoundTransactions" id="transactionNumber1" />
	<bean:define property="answer(Object::TakeUp::TransactionMasterId)" name="FindOutBoundTransactions" id="transactionMasterId1" />
	<bean:define property="answer(Object::TakeUp::BatchLogDetailId)" name="FindOutBoundTransactions" id="batchLogDetailId1" />
	<bean:define property="answer(Object::TakeUp::TransactionStatus)" name="FindOutBoundTransactions" id="transactionStatusCheck" />
	<bean:define  property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions" id="transactionType" />
   


<%long transactionDetailId=0; 
long transactionMasterId=0;
long batchLogDetailId=0;
long transactionNumber=0;%>
 <div class="formpage01">
  <div class="content">

    

	<%
		transactionDetailId=Long.parseLong(""+transactionDetailId1);
		transactionMasterId=Long.parseLong(""+transactionMasterId1);
		if(!(""+batchLogDetailId1).equalsIgnoreCase("") && ""+batchLogDetailId1!=null){
		 batchLogDetailId=Long.parseLong(""+batchLogDetailId1);
		}
		if(!(""+transactionNumber1).equalsIgnoreCase("") && ""+transactionNumber1!=null){
		 transactionNumber=Long.parseLong(""+transactionNumber1);
		}
	%>
	
	<div class="formheadnew"><h2 class="left"> TakeUp Summary</h2></div>
	
	<table width= "100%">
		<tr><td colspan="3"><h3>Internal Reference Information</h3></td></tr>
		<tr>
			<td class="field"  width="40%">Transaction Datetimestamp :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="answer(Object::TakeUp::CreatedDate)" name="FindOutBoundTransactions" />
			</td>
		</tr>
		<tr>
			<td class="field"  width="40%">Insured Name :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::TakeUp::InsuredName)" name="FindOutBoundTransactions"/>  
			</td>
		 </tr>	
		 <tr>
			<td class="field"  width="40%">Policy Number :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Policy::PolicyNumber)" name="FindOutBoundTransactions"/>  
			</td>
		 </tr>	
		 <tr>
			<td class="field"  width="40%">Policy Sub Number :</td>
			<td width="1%">&nbsp;</td>
			<td width="69%' align="left">
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write  property="answer(Object::Policy::PolicySubNumber)" name="FindOutBoundTransactions"/>  
			</td>
		 </tr>	
	  </table>
	  
 <html:form action="/UpdateTakeUpDetails.do">
 <table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">					
	
	<tr><td colspan="3"><h3>Policy Updateable</h3></td></tr>
	<tr>
		<td class="field" width="30%" align = "right">Policy Updateable Action :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name = "FindOutBoundTransactions" property="answer(Object::TakeUp::PolicyUpdatetableAction)"/>
		</td>
	</tr>
	<tr>
		<td class="field" width="30%" align = "right">Transaction Type :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="FindOutBoundTransactions" property="answer(Object::Transaction::TransactionType)"/>
		</td>
	 </tr>
	<tr>
		<td class="field" width="30%" align = "right">Transaction Number :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name = "FindOutBoundTransactions" property="answer(Object::TakeUp::TransactionNumber)"/>
		  
		</td>
	</tr>
	<tr>
		<td class="field" width="30%" align = "right">Policy Option :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="FindOutBoundTransactions" property="answer(Object::TakeUp::PolicyOption)" />
		</td>
	</tr>		
	<tr>							
		<td class="field" width="30%" align = "right">Effective Date :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::TakeUpEffectiveDate)"/>
		</td>														
    </tr>		
    <tr><td colspan="3"><h3>Policy Master</h3></td></tr>
	<tr>
		<td class="field" width="30%" align = "right">Master Reference :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::MasterReference)"/>
		</td>														
    </tr>		
    <tr>
		<td class="field" width="30%" align = "right">Title :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::Title)"/>
		</td>														
    </tr>		
    <tr>							
		<td class="field" width="30%" align = "right">Reference :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::Reference)"/>
		</td>														
    </tr>		
    <tr>
		<td class="field" width="30%" align = "right">Broker Name Code :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::BrokerCode)"/>
		</td>
	</tr>
	<tr>
		<td class="field" width="30%" align = "right">Master Name Code :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
		     <html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::MasterNameCode2)" />
		</td>
	</tr>	
	<tr>
		<td class="field" width="30%" align = "right">ExpiryDate :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::ExpiryDate)"/>
		</td>														
    </tr>
	<tr>
		<td class="field" width="30%" align = "right">Policy Written Date :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::PolicyWrittenDate)"/>
		</td>														
    </tr>	
    <tr><td colspan="3"><h3>Deductions</h3></td></tr>	
    <tr>							
		<td class="field" width="30%" align = "right">Deductions Code :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::DeducCode)"/>
		</td>														
    </tr>	
    <tr>							
		<td class="field" width="30%" align = "right">Deductions Percentage :</td>
		<td width="1%">&nbsp;</td>
		<td width="69%' align="left">
			<html:text name = "FindOutBoundTransactions" property="answer(Object::TakeUp::DeducPercentage)"/>
		</td>														
    </tr>		
	<tr>
		 <td class="field" width="30%" align = "right">Transaction Status :</td>
		 <td width="1%">&nbsp;</td>
		 <td width="69%' align="left">
			<html:select name="FindOutBoundTransactions" property="answer(Object::TakeUp::TransactionStatus)" styleId="transactionStatus"> 
				   		<html:option value ="SEND_TO_GENIUS">Send To Genius</html:option>	
						<html:option value ="DO_NOT_SEND_TO_GENIUS">Do Not Send To Genius</html:option>						
						<%if((""+transactionStatusCheck).equalsIgnoreCase("TREATY_HOLD")){ %><html:option value ="TREATY_HOLD">Treaty Hold</html:option><%}else{%>
						<html:option value ="Already Sent to Genius">Already Sent To Genius</html:option><% } %>
			</html:select>
	 	  </td>
	</tr>                                                      	
    </table>
	<table width="100%">
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr>
         <td width="25%">
          <td width="75%" align="left">
            <html:submit value="Save" styleClass="covbutton"/>
          </td>
         </tr>
    </table>
    <html:hidden name = "FindOutBoundTransactions" property="answer(Object::TakeUp::PolicyClassCode1)"/>
    <html:hidden name = "FindOutBoundTransactions" property="answer(Object::TakeUp::CompanyNameCode)"/>
    <html:hidden name = "FindOutBoundTransactions" property="answer(Object::TakeUp::BranchNameCode)"/>
    <html:hidden name = "FindOutBoundTransactions" property="answer(Object::TakeUp::InceptionDate)"/>
    <html:hidden name = "FindOutBoundTransactions" property="answer(Object::TakeUp::PolicyOption)"/>
    <html:hidden name = "FindOutBoundTransactions" property="answer(Object::TakeUp::PolicyUpdatetableAction)"/>
	<html:hidden name ="FindOutBoundTransactions" property="answer(Object::TakeUp::TransactionMasterId)"/>
	<html:hidden name="FindOutBoundTransactions" property="answer(Object::TakeUp::TransactionDetailId)" value="<%=transactionDetailId+"" %>"/>
	<html:hidden property="answer(Object::Transaction::TransactionType)" value="TakeUp"/>
	<html:hidden property="answer(BatchLogDetailId)" value="<%=batchLogDetailId+"" %>"/>
	<html:hidden property="answer(Object::TakeUp::batchLogDetailId)" value="<%=batchLogDetailId+"" %>"/>
	<html:hidden property="answer(Object::TakeUp::TransactionNumber)" value="<%=transactionNumber+"" %>"/>
	<html:hidden property="answer(Object::Transaction::TransactionNumber)" value="<%=transactionNumber+"" %>"/>
	
 </html:form>

<div id="nameInvolvementInfoDiv">
<dmshtml:get_name_involvement_detail nameInSession="nameInvolvementMapList" transactionDetailId="<%=Long.parseLong(""+transactionDetailId)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%= dbname.toString() %>"/>
		<logic:present name='nameInvolvementMapList' scope="request">
		 <table width="100%" align="center">
		 <tr><td>&nbsp;&nbsp;</td></tr>
			<tr><td colspan="7"><h3>Name Involvement</h3></td></tr>
			<tr>
			     <td>S.No</td>
				 <td>Name Involvement Action</td>
				 <td>Vendor Name Reference</td>
				 <td>Name Type</td>
				 <td>Legal Name</td>
				 <td>Name Usage Type Code</td>
				 <td>Name Involvement Type</td>
			</tr>
			<%long iterator = 1; 
			%>
		
			<logic:iterate name="nameInvolvementMapList" id="nameInvolvementMapList">
			<bean:define id="additionalInsuredId1" name="nameInvolvementMapList" property="additionalInsuredId" />
			<%String additionalInsuredId = ""+additionalInsuredId1;
			 %>
				<tr>
	  			  <td><a href="javascript:void(0);"  onClick="return editAjaxNameInvolvementDetails(<%=""+additionalInsuredId %>);" ><%= iterator%></a></td>
				  <td><bean:write name = "nameInvolvementMapList" property="nameInvolvementAction" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="vendorRef" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="nameType" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="legalName" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="nameUsageTypeCode" /></td>
				  <td><bean:write name = "nameInvolvementMapList" property="nameInvolvementType" /></td>
				 </tr>
				 <%iterator=iterator+1; %>
			</logic:iterate>	
		  </table>	
	    </logic:present>
</div>  
 <div>&nbsp;</div>
<div id="coverageListDiv">
<dmshtml:get_INFCoverages_List nameInSession="arrCoverageDetails"  transactionDetailId="<%=transactionDetailId%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%= dbname.toString() %>"/>

<logic:present name="arrCoverageDetails">
   <table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">
   <tr><td colspan="7"><h3>Section Coverage Details</h3></td></tr>
   <tr>
     <td>S.No</td>
     <td>Type Code</td>
	 <td>Limit Amount</td>
     <td>Deductible1</td>
     <td>Deductible2</td>
     <td>Premium</td>   
     <td>Annualised Premium</td>    
   </tr>
   <%long iterator = 1; 
   %>
   <bean:define id="arrCoveragesList" name="arrCoverageDetails" type="java.util.ArrayList"/> 
 <logic:iterate name="arrCoveragesList" id="sectionCoverageDetail" type="com.dms.ejb.webservice.liu.dataloader.SectionCoverageDetail">
    <bean:define id="coverageDetailId" name="sectionCoverageDetail" property="sectionCoverageDetailId" />
   <tr>  
      <td><a href="javascript:void(0);" onClick="return editCoverageDetails(<%=""+coverageDetailId %>,<%=transactionDetailId+"" %>);" ><%= iterator%></a></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coverageTypeCode" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coverageLimitAmount" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coveargeDeductible01" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coveargeDeductible02" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coveragePremium" /></td>
      <td align="left"><bean:write name ="sectionCoverageDetail" property="coverageAnnualisedPremium" /></td> 
    </tr>
    <%iterator=iterator+1; %>     
  </logic:iterate> 
  </table> 
</logic:present>
</div>
<div id="coverageDivParent" style="display:block">
		<div id="coverageDiv">

		</div>
		<a class="container-close" href="javascript:void(0);" id="closeIcon3"></a>
</div>		
<div id="nameInvolvementDiv" style="display:block">
		<div id="editNameInvolvementDiv">

		</div>
		<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
</div>
<div>&nbsp;</div>

<script type="text/javascript">
YAHOO.namespace("example.container");

  
  
 function submitSectionCoverageDetails() {
 var panel="coverageListDiv";
  var url='../UpdateSectionCoverageDetailAction.do';                                 
   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
       synchronous:true, parameters:$(document.getElementById('sectionCoverageForm')).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);},onException:function(){}
      }
     );
   }catch(err) { 
    txt="There was an error on this page.\n\n";
    txt+="Error description: " + err.description + "\n\n";
    txt+="Click OK to continue.\n\n";
    alert(txt);
   }  
YAHOO.example.container.coverageDiv.cancel(); 
document.getElementById("coverageDiv").style.display = "none"; 

  return false;   
 }  
 
function closeContainer(){
YAHOO.example.container.coverageDiv.cancel();
document.getElementById("coverageDiv").style.display = "none";  
} 




  
 function submitNameInvolvementDetails() {
 var panel="nameInvolvementInfoDiv";
 
  var url='../UpdateNameInvolvementDetails.do';                              			
   try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.getElementById('nameInvolvementForm')).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);alert(transport.responseText);},onException:function(){}
	     }
	    );
	  }catch(err) { 
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }	 
YAHOO.example.container.nameInvolvementDiv.cancel();	
// document.getElementById("infLocationDiv").style.display = "none"; 

  return false;   
 }
 

</script>




</div>
</div>


