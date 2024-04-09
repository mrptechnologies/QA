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
	
	 <div class="formheadnew"><h2 class="left"> Policy Update Transaction Summary</h2></div>
	 
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
	
	 <html:form action = "/UpdatePolicyUpdateTransactionDetails">
		
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
			  <html:text  property="answer(Object::Transaction::MasterReference)" name="FindOutBoundTransactions"/>
			</td>
		</tr>
		<tr><td colspan="3"><h3>Policy Data Exists</h3></td></tr>
		<tr>
			<td class="field" width="30%" align = "right">Master Status Code :</td>
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
		<html:hidden property="answer(Object::Transaction::PolicyMasterAction)" name="FindOutBoundTransactions" />
		<html:hidden property="answer(Object::Transaction::PolicyUpdateableAction)" name="FindOutBoundTransactions" />
		<html:hidden property="answer(Object::Transaction::InceptionDate)" name="FindOutBoundTransactions" />
		<html:hidden property="answer(Object::Transaction::PolicyWrittenDate)" name="FindOutBoundTransactions" />
		<html:hidden property="answer(Object::Transaction::ExpiryDate)" name="FindOutBoundTransactions" />
		<html:hidden  property="answer(Object::Transaction::Reference)" name="FindOutBoundTransactions"/>
		<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		<html:hidden property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions"/>
		<html:hidden property="answer(Object::Transaction::TransactionMasterId)" name="FindOutBoundTransactions" />
 		<html:hidden property="answer(Object::Transaction::TransactionStatus)" name="FindOutBoundTransactions" styleId="transactionStatus1" />
 		<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
 		<html:hidden property="answer(Object::Transaction::TransactionNumber)" name="FindOutBoundTransactions"/>
        <html:hidden property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions"/>
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
	   
	   <%/*
	   Insured Information*/ %>
	   <html:form action="/UpdatePolicyUpdateINFInsuredAction.do">	
	  	 <dmshtml:get_INFInsured_Detail nameInSession="infInsuredMap"  transactionMasterId="<%=Long.parseLong(""+transactionMasterId)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			<logic:present name="infInsuredMap">
			    <bean:define id="vendorNameRef" name="infInsuredMap" property="Object::INFInsured::VendorNameRef"/>	
				<bean:define id="assuredNameCode" name="infInsuredMap" property="Object::INFInsured::AssuredNameCode"/>
				<bean:define id="assuredInsuredType" name="infInsuredMap" property="Object::INFInsured::AssuredInsuredType"/>
				<bean:define id="assuredAction" name="infInsuredMap" property="Object::INFInsured::AssuredAction"/>
				<bean:define id="aBN" name="infInsuredMap" property="Object::INFInsured::ABN"/>
				<bean:define id="aNZSIC" name="infInsuredMap" property="Object::INFInsured::ANZSIC"/>
				<bean:define id="occupationCode" name="infInsuredMap" property="Object::INFInsured::OccupationCode"/>
				<bean:define id="municipalAreaCode" name="infInsuredMap" property="Object::INFInsured::MunicipalAreaCode"/>
				<bean:define id="stateProvinceCode" name="infInsuredMap" property="Object::INFInsured::StateProvinceCode"/>
				<bean:define id="countryCode" name="infInsuredMap" property="Object::INFInsured::CountryCode"/>
				<bean:define id="externalInsuredTelNumber" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredTelNumber"/>
				<bean:define id="activeFlag" name="infInsuredMap" property="Object::INFInsured::ActiveFlag"/>
				<bean:define id="externalInsuredLegalName1" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredLegalName1"/>
				<bean:define id="externalInsuredLegalName2" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredLegalName2"/>	
				<bean:define id="addressTypeFlag" name="infInsuredMap" property="Object::INFInsured::AddressTypeFlag"/>
				<bean:define id="externalInsuredType" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredType"/>
				<bean:define id="externalInsuredLine1" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredLine1"/>
				<bean:define id="externalInsuredLine2" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredLine2"/>
				<bean:define id="externalInsuredLine3" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredLine3"/>
				<bean:define id="externalInsuredPostCode" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredPostCode"/>
				<bean:define id="externalInsuredCity" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredCity"/>
				<bean:define id="externalInsuredState" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredState"/>
				<bean:define id="externalInsuredCountry" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredCountry"/>
				
			  		<table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">				
	  				  <tr><td colspan="3"><h3>Insured Master :</h3></td></tr>
		              <tr>
						<td class="field" width="30%" align = "right">Assured Name Code :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						  <html:text property="answer(Object::INFInsured::AssuredNameCode)"  value="<%=""+assuredNameCode %>"/> 		  
						</td>
					  </tr>	
 					  <tr>
						<td class="field" width="30%" align = "right">Vendor Name Reference :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="infInsuredMap" property="Object::INFInsured::VendorNameRef"/>
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Assured Action :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						   &nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="Object::INFInsured::AssuredAction"  name="infInsuredMap"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Assured Type :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						   &nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="Object::INFInsured::AssuredInsuredType"  name="infInsuredMap"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Legal Name :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						   <html:text property="answer(Object::INFInsured::ExternalInsuredLegalName1)"  value="<%=""+externalInsuredLegalName1 %>"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Legal Name 2:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						   <html:text property="answer(Object::INFInsured::ExternalInsuredLegalName2)"  value="<%=""+externalInsuredLegalName2 %>"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Address Line 1:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						   <html:text property="answer(Object::INFInsured::ExternalInsuredLine1)"  value="<%=""+externalInsuredLine1 %>"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Address Line 2:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
							  <html:text property="answer(Object::INFInsured::ExternalInsuredLine2)"  value="<%=""+externalInsuredLine2 %>"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Address Line 3:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
							<html:text property="answer(Object::INFInsured::ExternalInsuredLine3)"  value="<%=""+externalInsuredLine3 %>"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Postal Code:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
							<html:text property="answer(Object::INFInsured::ExternalInsuredPostCode)"  value="<%=""+externalInsuredPostCode %>"/> 
						</td>
					  </tr>	
					   <tr>
						<td class="field" width="30%" align = "right">City:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
							 <html:text property="answer(Object::INFInsured::ExternalInsuredCity)"  value="<%=""+externalInsuredCity %>"/> 
						</td>
					  </tr>	
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">State:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
							<html:text property="answer(Object::INFInsured::ExternalInsuredState)"  value="<%=""+externalInsuredState %>"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Country:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
							<html:text property="answer(Object::INFInsured::ExternalInsuredCountry)"  value="<%=""+externalInsuredCountry %>"/> 
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Address Type Flag:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						 <bean:write property="Object::INFInsured::AddressTypeFlag"  name="infInsuredMap"/> 
						</td>
					  </tr>	
					  <html:hidden property="answer(Object::INFInsured::AssuredInsuredType)"  value="<%=""+assuredInsuredType %>"/> 
					  <html:hidden property="answer(Object::INFInsured::AssuredAction)"  value="<%=""+assuredAction %>"/> 
					  <html:hidden property="answer(Object::INFInsured::AssuredInsuredType)"  value="<%=""+assuredInsuredType %>"/> 
					  <html:hidden property="answer(Object::INFInsured::AddressTypeFlag)"  value="<%=""+addressTypeFlag %>"/> 
					  <html:hidden property="answer(Object::INFInsured::VendorNameRef)"  value="<%=""+vendorNameRef %>"/> 
					  <html:hidden property="answer(Object::INFInsured::ABN)"  value="<%=""+aBN %>"/> 
					  <html:hidden property="answer(Object::INFInsured::ANZSIC)"  value="<%=""+aNZSIC %>"/> 
					  <html:hidden property="answer(Object::INFInsured::OccupationCode)"  value="<%=""+occupationCode %>"/> 
					  <html:hidden property="answer(Object::INFInsured::MunicipalAreaCode)"  value="<%=""+municipalAreaCode %>"/> 
					  <html:hidden property="answer(Object::INFInsured::StateProvinceCode)"  value="<%=""+stateProvinceCode %>"/> 
					  <html:hidden property="answer(Object::INFInsured::CountryCode)"  value="<%=""+countryCode %>"/> 
					  <html:hidden property="answer(Object::INFInsured::ExternalInsuredTelNumber)"  value="<%=""+externalInsuredTelNumber %>"/> 
					  <html:hidden property="answer(Object::INFInsured::ActiveFlag)"  value="<%=""+activeFlag %>"/> 
					  <html:hidden property="answer(Object::INFInsured::ExternalInsuredType)"  value="<%=""+externalInsuredType %>"/> 
					  <html:hidden property="answer(Object::Transaction::TransactionNumber)" name="FindOutBoundTransactions" />
					  <html:hidden property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions" />
					  <html:hidden property="answer(Object::INFInsured::transactionMasterId)" value = "<%=""+transactionMasterId%>" />
					  <html:hidden property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions"/>
					  <html:hidden property="answer(Object::Transaction::TransactionMasterId)" name="FindOutBoundTransactions" />
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
	            </logic:present>
			  </html:form>

    <div id="nameInvolvementInfoDiv">
	  <dmshtml:get_name_involvement_detail nameInSession="nameInvolvementMapList" transactionDetailId="<%=Long.parseLong(""+transactionDetailId1)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name='nameInvolvementMapList' scope="request">
		 <table width="100%" align="center">
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
	  			  <td><a href="javascript:void(0);"  onClick="return editNameInvolvementDetails(<%=""+additionalInsuredId %>);" ><%= iterator%></a></td>
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
	<div id="nameInvolvementDiv" style="display:block">
			<div id="editNameInvolvementDiv">
			
			</div>
			<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
	</div>
    <div>&nbsp;</div>
  </div>
</div>


<script>
YAHOO.namespace("example.container");
function editAjaxNameInvolvementDetails(additionalInsuredId) {
document.getElementById("editNameInvolvementDiv").innerHTML="";
 loadNameInvolvementDetail(additionalInsuredId);
	document.getElementById("editNameInvolvementDiv").style.display = "block";
	document.getElementById("nameInvolvementDiv").style.display = "block";  
	YAHOO.example.container.nameInvolvementDiv.show();
}

</script>

