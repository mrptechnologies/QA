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
	 
	 
	 <div class="formheadnew"><h2 class="left"> Submission Transaction Summary</h2></div>
	
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
	  </table>
	 
	  <html:form action = "/UpdateSubmissionTransactionDetails">
	    
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
			<tr>
				<td class="field" width="30%" align = "right">Inception Date :</td>
				<td width="1%">&nbsp;</td>
				<td width="69%' align="left">
				  <html:text property="answer(Object::Transaction::InceptionDate)" name="FindOutBoundTransactions" />
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
			<tr>
				<td class="field" width="30%" align = "right">Reference :</td>
				<td width="1%">&nbsp;</td>
				<td width="69%' align="left">
				  <html:text  property="answer(Object::Transaction::Reference)" name="FindOutBoundTransactions" />
				</td>
			</tr>
			<tr>
				<td class="field" width="30%" align = "right">ExpiryDate :</td>
				<td width="1%">&nbsp;</td>
				<td width="69%' align="left">
				  <html:text property="answer(Object::Transaction::ExpiryDate)" name="FindOutBoundTransactions" />
				</td>
			</tr>
			<tr>
				<td class="field" width="30%" align = "right">Policy Written Date :</td>
				<td width="1%">&nbsp;</td>
				<td width="69%' align="left">
				  <html:text property="answer(Object::Transaction::PolicyWrittenDate)" name="FindOutBoundTransactions" />
				</td>
			</tr>
			
			<tr><td colspan="3"><h3>Policy Data Exists</h3></td></tr>
			<tr>
				<td class="field" width="30%" align = "right">Master Status Code :</td>
				<td width="1%">&nbsp;</td>
				<td width="69%' align="left">
				  <html:text property="answer(Object::Transaction::MasterStatusCode)" name="FindOutBoundTransactions" />
				</td>
			</tr>
			<tr>
				<td class="field" width="30%" align = "right">Transaction Status :</td>
				<td width="1%">&nbsp;</td>
				<td width="69%' align="left">
				   <html:select name="FindOutBoundTransactions" property="answer(Object::Transaction::TransactionStatus)" styleId="transactionStatus"> 
				   		<html:option value ="SEND_TO_GENIUS">Send To Genius</html:option>	
						<html:option value ="DO_NOT_SEND_TO_GENIUS">Do Not Send To Genius</html:option>						
						<html:option value ="ALREADY_SENT_TO_GENIUS">Already Sent To Genius</html:option>
				   </html:select>
				   
				</td>
			</tr>
			
			 <html:hidden property="answer(Object::Transaction::PolicyUpdateableAction)" name="FindOutBoundTransactions" />
			 <html:hidden property="answer(Object::Transaction::PolicyMasterAction)" name="FindOutBoundTransactions" />
			 <html:hidden  property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions"/>  
			 <html:hidden property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions" />
			 <html:hidden property="answer(Object::Transaction::TransactionMasterId)" name="FindOutBoundTransactions" />
	 		 <html:hidden property="answer(Object::Transaction::TransactionStatus)"  name="FindOutBoundTransactions" />
	 		 <bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
	 		 <html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
		</table>
		<table width="100%">
	        <tr><td colspan="2">&nbsp;</td></tr>
	        <tr>
	         <td width="25%"></td>
	          <td width="75%" align="left">
	            <html:submit value="Save" styleClass="covbutton" onclick="ValidateFields();"/>
	          </td>
	         </tr>
        </table>
	  </html:form>
      
      
	   <%/*
	   Insured Information*/ %>
	   <html:form action="/UpdateSubmissionINFInsuredAction.do">	
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
				<bean:define id="externalInsuredDetailId" name="infInsuredMap" property="Object::INFInsured::ExternalInsuredDetailId"/>
			  		<table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">				
	  				  <tr><td colspan="3"><h3>Assured</h3></td></tr>
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
						    &nbsp;&nbsp;&nbsp;&nbsp;<bean:write  name="infInsuredMap" property="Object::INFInsured::AssuredAction"/>
						</td>
					  </tr>	
					  <tr>
						<td class="field" width="30%" align = "right">Assured Type :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						    &nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="infInsuredMap" property="Object::INFInsured::AssuredInsuredType"/>
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
						   &nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="infInsuredMap" property="Object::INFInsured::AddressTypeFlag"/>
						   <html:hidden property="answer(Object::INFInsured::AddressTypeFlag)"  value="<%=""+addressTypeFlag %>"/> 
						</td>
					  </tr>	
					  <html:hidden property="answer(Object::INFInsured::AssuredInsuredType)"  value="<%=""+assuredInsuredType %>"/> 
					  <html:hidden property="answer(Object::INFInsured::AssuredAction)"  value="<%=""+assuredAction %>"/> 
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
					  <html:hidden property="answer(Object::Transaction::TransactionMasterId)" name="FindOutBoundTransactions" />
  					  <html:hidden property="answer(Object::INFInsured::transactionMasterId)" value="<%=""+transactionMasterId %>"/> 
					  <html:hidden name = "FindOutBoundTransactions" property="answer(Object::Transaction::TransactionDetailId)" />
					   <html:hidden property="answer(Object::INFInsured::ExternalInsuredDetailId)" value="<%=""+externalInsuredDetailId %>"/> 
					  
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

         	 	 <%/*
					Submisison Details*/ %>
		 	 <html:form action = "/UpdateINFSubmissionDetail">
		  	 <dmshtml:get_INF_Submission_Detail nameInSession="submissionMap" transactionDetailId="<%=Long.parseLong(""+transactionDetailId1)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		       <logic:present name="submissionMap">
		         	<bean:define id="title1" name="submissionMap" property="Object::Submission::title"/>
	           		<bean:define id="companyNameCode1" name="submissionMap" property="Object::Submission::companyNameCode"/>
	           		<bean:define id="branchNameCode1" name="submissionMap" property="Object::Submission::branchNameCode"/>
	           		<bean:define id="assuredNameCode1" name="submissionMap" property="Object::Submission::assuredNameCode"/>
	           		<bean:define id="brokerNameCode1" name="submissionMap" property="Object::Submission::brokerNameCode"/>
	           		<bean:define id="brokerReferance1" name="submissionMap" property="Object::Submission::brokerReferance"/>
	           		<bean:define id="masterNameCode1Id" name="submissionMap" property="Object::Submission::masterNameCode1"/>
	           		<bean:define id="masterNameCode2Id" name="submissionMap" property="Object::Submission::masterNameCode2"/>
	           		<bean:define id="externalBrokerKey1" name="submissionMap" property="Object::Submission::externalBrokerKey"/>
	           		<bean:define id="majorTypeCode1" name="submissionMap" property="Object::Submission::majorTypeCode"/>
	           		<bean:define id="minorTypeCode1" name="submissionMap" property="Object::Submission::minorTypeCode"/>
	           		<bean:define id="departmentCode1" name="submissionMap" property="Object::Submission::departmentCode"/>
	           		<bean:define id="polFlag1Id" name="submissionMap" property="Object::Submission::polFlag1"/>
	           		<bean:define id="polFlag2Id" name="submissionMap" property="Object::Submission::polFlag2"/>
	           		<bean:define id="polFlag3Id" name="submissionMap" property="Object::Submission::polFlag3"/>
	           		<bean:define id="polTradeCode1Id" name="submissionMap" property="Object::Submission::polTradeCode1"/>
	           		<bean:define id="polUnderwritingYear1" name="submissionMap" property="Object::Submission::polUnderwritingYear"/>
	           		<bean:define id="polArea1" name="submissionMap" property="Object::Submission::polArea"/>
	           		<bean:define id="termDataUpdateableAction1" name="submissionMap" property="Object::Submission::termDataUpdateableAction"/>
	           		<bean:define id="termTermsSequence1" name="submissionMap" property="Object::Submission::termTermsSequence"/>
	           		<bean:define id="termMainAcCurrencyCode1" name="submissionMap" property="Object::Submission::termMainAcCurrencyCode"/>
	           		<bean:define id="termCurrencyOfAmounts1" name="submissionMap" property="Object::Submission::termCurrencyOfAmounts"/>
	           		<bean:define id="termCancellationTypeCode1" name="submissionMap" property="Object::Submission::termCancellationTypeCode"/>
	           		
	           		<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		      	   <table width= "100%">
			 		<tr><td colspan="3"><h3>Submission Detail :</h3></td></tr>
		           	<tr>
						<td class="field" width="30%" align = "right">Title :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						  <html:text property="answer(Object::Submission::title)" value = "<%=""+title1 %>" />
						</td>
					</tr>	
					<tr>
						<td class="field" width="30%" align = "right">Broker Name Code :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						  <html:text property="answer(Object::Submission::brokerNameCode)" value = "<%=""+brokerNameCode1 %>" />
						</td>
					</tr>	
					<tr>
						<td class="field" width="30%" align = "right">Master Name Code 02:</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						     <html:text property="answer(Object::Submission::masterNameCode2)" value = "<%=""+masterNameCode2Id %>" />
						     <!-- bean:write name="submissionMap" property="Object::Submission::masterNameCode2"/ -->
						</td> 
					</tr>	
					<tr>
						<td class="field" width="30%" align = "right">Term Main Account Currency Code :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
 							 <html:text property="answer(Object::Submission::termMainAcCurrencyCode)" value = "<%=""+termMainAcCurrencyCode1 %>" />
					    </td>
					</tr>
					<tr>
						<td class="field" width="30%" align = "right">Term Currency Of Amounts :</td>
						<td width="1%">&nbsp;</td>
						<td width="69%' align="left">
						     <html:text property="answer(Object::Submission::termCurrencyOfAmounts)" value = "<%=""+termCurrencyOfAmounts1 %>" />
						</td>
					</tr>
					<html:hidden property="answer(Object::Submission::termDataUpdateableAction)" value = "<%=""+termDataUpdateableAction1 %>" />					
					<html:hidden property="answer(Object::Submission::branchNameCode)" value = "<%=""+branchNameCode1 %>" />
					<html:hidden property="answer(Object::Submission::companyNameCode)" value = "<%=""+companyNameCode1 %>" />
					<html:hidden property="answer(Object::Transaction::TransactionDetailId)" name="FindOutBoundTransactions" />
		            <html:hidden property="answer(Object::Submission::assuredNameCode)" value = "<%=""+assuredNameCode1 %>" />
	           	    <html:hidden property="answer(Object::Submission::brokerReferance)" value = "<%=""+brokerReferance1 %>" />
	           	    <html:hidden property="answer(Object::Submission::masterNameCode1)" value = "<%=""+masterNameCode1Id %>" />
	           	    <html:hidden property="answer(Object::Submission::externalBrokerKey)" value = "<%=""+externalBrokerKey1 %>" />
	           	    <html:hidden property="answer(Object::Submission::majorTypeCode)" value = "<%=""+majorTypeCode1 %>" />
	           	    <html:hidden property="answer(Object::Submission::minorTypeCode)" value = "<%=""+minorTypeCode1 %>" />
	           	    <html:hidden property="answer(Object::Submission::departmentCode)" value = "<%=""+departmentCode1 %>" />
	           	    <html:hidden property="answer(Object::Submission::polFlag1)" value = "<%=""+polFlag1Id %>" />
	           	    <html:hidden property="answer(Object::Submission::polFlag2)" value = "<%=""+polFlag2Id %>" />
	           	    <html:hidden property="answer(Object::Submission::polFlag3)" value = "<%=""+polFlag3Id %>" />
	           	    <html:hidden property="answer(Object::Submission::polTradeCode1)" value = "<%=""+polTradeCode1Id %>" />
	           	    <html:hidden property="answer(Object::Submission::polUnderwritingYear)" value = "<%=""+polUnderwritingYear1 %>" />
	           	    <html:hidden property="answer(Object::Submission::polArea)" value = "<%=""+polArea1 %>" />
	           	    <html:hidden property="answer(Object::Submission::termTermsSequence)" value = "<%=""+termTermsSequence1 %>" />
	           	    <html:hidden property="answer(Object::Submission::termCancellationTypeCode)" value = "<%=""+termCancellationTypeCode1 %>" />
	           	    <html:hidden property="answer(Object::Submission::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
	           	    <html:hidden property="answer(Object::Transaction::TransactionNumber)" name="FindOutBoundTransactions" />
					<html:hidden property="answer(Object::Transaction::TransactionType)" name="FindOutBoundTransactions" />
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
    
    <%/*
        Coverage Detail */%>
    
    <div id="coverageListDiv">
	<dmshtml:get_INFCoverages_List nameInSession="arrCoverageDetails"  transactionDetailId="<%=Long.parseLong(""+transactionDetailId1)%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	 <logic:present name="arrCoverageDetails">
   		<table WIDTH="100%"  border="0" CELLSPACING="2" CELLPADDING="0">
   			<tr><td colspan="3"><h3>Section Coverage Details</h3></td></tr>
 			  <tr>
			     <td>S.No</td>
			 <!--<td>Section Type Code</td>
			     <td>Sub Section Type Code</td>
			     <td>Section Data Updateable Action</td>-->
			     <td>Class Code 01</td>
			     <td>Class Code 04</td>
			 </tr>
   			<tr><td>&nbsp;</td></tr>
		   <%long iterator = 1; 
		   %>
			<bean:define id="arrCoveragesList" name="arrCoverageDetails" type="java.util.ArrayList"/> 
 			<logic:iterate name="arrCoveragesList" id="sectionCoverageDetail" type="com.dms.ejb.webservice.liu.dataloader.SectionCoverageDetail">
				<bean:define id="coverageDetailId" name="sectionCoverageDetail" property="sectionCoverageDetailId" />
				 <tr>  
			      <td><a href="javascript:void(0);" onClick="return editSubmissionCoverageDetails(<%=""+coverageDetailId %>,<%=transactionDetailId1+"" %>);" ><%= iterator%></a></td>
 		      <!--<td align="center"><bean:write name ="sectionCoverageDetail" property="sectionTypeCode" /></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="subSectionTypeCode" /></td>
			      <td align="center"><bean:write name ="sectionCoverageDetail" property="sectionDataUpdatableAction" /></td>-->
			      <td align="left"><bean:write name ="sectionCoverageDetail" property="sectionDTLClassCode01" /></td>
			      <td align="left"><bean:write name ="sectionCoverageDetail" property="sectionDTLClassCode04" /></td>
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
		<a class="container-close" href="javascript:void(0);" id="closeIcon4"></a>
	</div>
		
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
 

function editAjaxINFLocationDetails(locationDetailId) {
document.getElementById("editINFLocationDetailsDiv").innerHTML="";
 loadINFLocationDetail(locationDetailId);
	document.getElementById("editINFLocationDetailsDiv").style.display = "block"; 
	document.getElementById("infLocationDiv").style.display = "block";  
	YAHOO.example.container.infLocationDiv.show();
}

function editAjaxSubmissionSectionCoverageDetails(coverageDetailId,transactionDetailId) {
document.getElementById("editCoverageDetailDiv").innerHTML="";
loadSubmissionCoverageDetails(coverageDetailId,transactionDetailId);
	document.getElementById("editCoverageDetailDiv").style.display = "block";
	document.getElementById("coverageDiv").style.display = "block";  
	YAHOO.example.container.coverageDiv.show();
}
</script>

