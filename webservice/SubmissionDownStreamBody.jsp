<% 
/**
* Copyright 2002-2010 of Solartis Inc, USA .
* All Rights Reserved.
* This software is confidential and proprietary information of Solartis,Inc, USA.
* This should not be used without proper agreement signed with Solartis Inc,USA.
**/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript">
	function createSubmission(frm){
		frm.submit();
	}
	function updateSubmission(frm){
		frm.action="../UpdateSFAgency.do";
		frm.submit();
	}
</script>
<html:form action="/AddSFAgency.do">
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>"/>
<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
<html:hidden property="answer(Object::Submission::CreatedBy)" value="<%=userId.toString()%>" />
<html:hidden property="answer(Object::Submission::UpdatedBy)" value="<%=userId.toString()%>" />

	<logic:present name='downStreamArr'>
	<logic:iterate id="downStreamArr" name="downStreamArr" >
	<br>
		<table cellpadding="0" cellspacing="2" border="0" align="center" width="960px">
		<tr>
			<td class="NewSectionHead" colspan="5" align="center">SUBMISSION DOWN STREAM</td>
		</tr>
		<tr>
			<td height="px">
				<div style = "font-style:bolditalic;font-size:14pt;width:500px;"><bean:write name="downStreamArr" property="Object::Submission::SubmissionName" /></div>
			</td>
		</tr>
	</table>
	<br>
	<div class="todotab_yellowbox2" style="width:960px">
	<br />
	
<table cellpadding="0" cellspacing="2" border="0" align="center" width="98%">
		<tr>
			<td width="30%" class="FormLabels">Insured ID :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SFInsuredId" name="downStreamArr" property="Object::Customer::SFInsuredId" /> <%=""+SFInsuredId%>
				<html:hidden styleId="SFInsuredId" property="answer(Object::Customer::SFInsuredId)" value="<%=""+SFInsuredId%>" /> 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured Name :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="CustomerName" name="downStreamArr" property="Object::Customer::CustomerName" /> <%=""+CustomerName%>
				<html:hidden styleId="CustomerName" property="answer(Object::Customer::CustomerName)" value="<%=""+CustomerName%>" /> 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured Street :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="StreetName" name="downStreamArr" property="Object::Customer::StreetName" /> <%=""+StreetName%>
				<html:hidden styleId="StreetName" property="answer(Object::Customer::StreetName)" value="<%=""+StreetName%>" /> 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured City :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="BillingCity" name="downStreamArr" property="Object::Customer::BillingCity" /><%=""+BillingCity%>
				<html:hidden styleId="BillingCity" property="answer(Object::Customer::BillingCity)" value="<%=""+BillingCity%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured State :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="BillingState" name="downStreamArr" property="Object::Customer::BillingState" /> <%=""+BillingState%>
				<html:hidden styleId="BillingState" property="answer(Object::Customer::BillingState)" value="<%=""+BillingState%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured Zip :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="BillingZip" name="downStreamArr" property="Object::Customer::BillingZip" /> <%=""+BillingZip%>
				<html:hidden styleId="BillingZip" property="answer(Object::Customer::BillingZip)" value="<%=""+BillingZip%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured Country :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="BillingCounty" name="downStreamArr" property="Object::Customer::BillingCounty" /> <%=""+BillingCounty%>
				<html:hidden styleId="BillingCounty" property="answer(Object::Customer::BillingCounty)" value="<%=""+BillingCounty%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured Website :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="Url" name="downStreamArr" property="Object::Customer::Contact::Url" /> <%=""+Url%>
				<html:hidden styleId="Url" property="answer(Object::Customer::Contact::Url)" value="<%=""+Url%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured Fax :</td>
			<td width="65%" class="FormLabelsApplication"><bean:write name="downStreamArr" property="Object::Submission::DownStream::InsuredFax" /> </td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured Phone :</td>
			<td width="65%" class="FormLabelsApplication"><bean:write name="downStreamArr" property="Object::Submission::DownStream::InsuredPhone" /> </td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Insured SIC Code :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SFInsuredSICCode" name="downStreamArr" property="Object::Customer::SFInsuredSICCode" /> <%=""+SFInsuredSICCode%>
				<html:hidden styleId="SFInsuredSICCode" property="answer(Object::Customer::SFInsuredSICCode)" value="<%=""+SFInsuredSICCode%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Number of Employees :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SFNumberOfEmployees" name="downStreamArr" property="Object::Customer::SFNumberOfEmployees" /> <%=""+SFNumberOfEmployees%>
				<html:hidden styleId="SFNumberOfEmployees" property="answer(Object::Customer::SFNumberOfEmployees)" value="<%=""+SFNumberOfEmployees%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Number of Employees One Source :</td>
			<td width="65%" class="FormLabelsApplication"><bean:write name="downStreamArr" property="Object::Submission::DownStream::NumberOfEmployeesOneSource" /> </td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Broker Id :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SFAgencyId" name="downStreamArr" property="Object::Agency::SFAgencyId" /> <%=""+SFAgencyId%>
				<html:hidden styleId="SFAgencyId" property="answer(Object::Agency::SFAgencyId)" value="<%=""+SFAgencyId%>" /> 	
			</td>			
		</tr>		
		<tr>
			<td width="30%" class="FormLabels">Broker Name :</td>
			<td width="65%" class="FormLabelsApplication">
			<bean:define id="BusinessName" name="downStreamArr" property="Object::Agency::BusinessName" /> <%=""+BusinessName%>
			<html:hidden styleId="BusinessName" property="answer(Object::Agency::BusinessName)" value="<%=""+BusinessName%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Broker Street :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="Address1" name="downStreamArr" property="Object::Agency::Addresses::BUSINESS::Object::Address::Address1" /> <%=""+Address1%>
				<html:hidden styleId="Address1" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)" value="<%=""+Address1%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Broker City :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="BrokerCity" name="downStreamArr" property="Object::Agency::Addresses::BUSINESS::Object::Address::City" /> <%=""+BrokerCity%>
				<html:hidden styleId="BrokerCity" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" value="<%=""+BrokerCity%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Broker State :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="BrokerState" name="downStreamArr" property="Object::Agency::Addresses::BUSINESS::Object::Address::State" /> <%=""+BrokerState%>
				<html:hidden styleId="BrokerState" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)" value="<%=""+BrokerState%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Broker Zip :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="BrokerZip" name="downStreamArr" property="Object::Agency::Addresses::BUSINESS::Object::Address::Zip" /> <%=""+BrokerZip%>
				<html:hidden styleId="BrokerZip" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" value="<%=""+BrokerZip%>" /> 	
				
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Broker Country :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="BrokerCountry" name="downStreamArr" property="Object::Agency::Addresses::BUSINESS::Object::Address::Country" /> <%=""+BrokerCountry%>
				<html:hidden styleId="BrokerCountry" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="<%=""+BrokerCountry%>" /> 	
				
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Broker Contact :</td>
			<td width="65%" class="FormLabelsApplication"><bean:write name="downStreamArr" property="Object::Agency::Addresses::BUSINESS::Object::Address::BrokerContact" /> </td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Line of Business :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="LineOfBusiness" name="downStreamArr" property="Object::Submission::LineOfBusiness" /> <%=""+LineOfBusiness%>
				<html:hidden styleId="LineOfBusiness" property="answer(Object::Submission::LineOfBusiness)" value="<%=""+LineOfBusiness%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission ID :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SFSubmissionId" name="downStreamArr" property="Object::Submission::SFSubmissionId" /> <%=""+SFSubmissionId%>
				<html:hidden styleId="SFSubmissionId" property="answer(Object::Submission::SFSubmissionId)" value="<%=""+SFSubmissionId%>" /> 	
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Name :</td>
			<td width="65%" class="FormLabelsApplication">
			<bean:define id="SubmissionName" name="downStreamArr" property="Object::Submission::SubmissionName" /> <%=""+SubmissionName%>
			<html:hidden styleId="SubmissionName" property="answer(Object::Submission::SubmissionName)" value="<%=""+SubmissionName%>" /> 				
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Owner :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SubmissionOwner" name="downStreamArr" property="Object::Submission::SubmissionOwner" /> <%=""+SubmissionOwner%>
				<html:hidden styleId="SubmissionOwner" property="answer(Object::Submission::SubmissionOwner)" value="<%=""+SubmissionOwner%>" /> 				
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Type :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SubmissionType" name="downStreamArr" property="Object::Submission::SubmissionType" /> <%=""+SubmissionType%>
				<html:hidden styleId="SubmissionType" property="answer(Object::Submission::SubmissionType)" value="<%=""+SubmissionType%>" /> 				
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Insurance Type :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="InsuranceType" name="downStreamArr" property="Object::Submission::InsuranceType" /><%=""+InsuranceType%>
				<html:hidden styleId="InsuranceType" property="answer(Object::Submission::InsuranceType)" value="<%=""+InsuranceType%>" /> 				
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Stage :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SubmissionStage" name="downStreamArr" property="Object::Submission::SubmissionStage" /> <%=""+SubmissionStage%>
				<html:hidden styleId="SubmissionStage" property="answer(Object::Submission::SubmissionStage)" value="<%=""+SubmissionStage%>" /> 				
			</td>			
		</tr>
		
		<tr>
			<td width="30%" class="FormLabels">Submission Record Type :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SubmissionRecordType" name="downStreamArr" property="Object::Submission::SubmissionRecordType" /><%=""+SubmissionRecordType%>
				<html:hidden styleId="SubmissionRecordType" property="answer(Object::Submission::SubmissionRecordType)" value="<%=""+SubmissionRecordType%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Effective Date :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SubmissionEffectiveDate" name="downStreamArr" property="Object::Submission::SubmissionEffectiveDate" /> <%=""+SubmissionEffectiveDate%>
				<html:hidden styleId="SubmissionEffectiveDate" property="answer(Object::Submission::SubmissionEffectiveDate)" value="<%=""+SubmissionEffectiveDate%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Expiration Date :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SubmissionExpirationDate" name="downStreamArr" property="Object::Submission::SubmissionExpirationDate" /> <%=""+SubmissionExpirationDate%>
				<html:hidden styleId="SubmissionExpirationDate" property="answer(Object::Submission::SubmissionExpirationDate)" value="<%=""+SubmissionExpirationDate%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Estimated Premium Income :</td>
			<td width="65%" class="FormLabelsApplication">
			<bean:define id="EstimatedPremiumIncome" name="downStreamArr" property="Object::Submission::EstimatedPremiumIncome" /> <%=""+EstimatedPremiumIncome%>
			<html:hidden styleId="EstimatedPremiumIncome" property="answer(Object::Submission::EstimatedPremiumIncome)" value="<%=""+EstimatedPremiumIncome%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Issuing Office :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="IssuingOffice" name="downStreamArr" property="Object::Submission::IssuingOffice" /> <%=""+IssuingOffice%>
				<html:hidden styleId="IssuingOffice" property="answer(Object::Submission::IssuingOffice)" value="<%=""+IssuingOffice%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Underwriter Name :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="UnderwriterName" name="downStreamArr" property="Object::Submission::DownStream::UnderwriterName" /> <%=""+UnderwriterName%>
				<html:hidden styleId="UnderwriterName" property="answer(Object::Submission::DownStream::UnderwriterName)" value="<%=""+UnderwriterName%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Production Office :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="ProductionOffice" name="downStreamArr" property="Object::Submission::ProductionOffice" /> <%=""+ProductionOffice%>				
				<html:hidden styleId="ProductionOffice" property="answer(Object::Submission::ProductionOffice)" value="<%=""+ProductionOffice%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Expiring Policy Number :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="ExpiringPolicyNumber" name="downStreamArr" property="Object::Submission::ExpiringPolicyNumber" /> <%=""+ExpiringPolicyNumber%>
				<html:hidden styleId="ExpiringPolicyNumber" property="answer(Object::Submission::ExpiringPolicyNumber)" value="<%=""+ExpiringPolicyNumber%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Non Renewable :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="NonRenewable" name="downStreamArr" property="Object::Submission::NonRenewable" /><%=""+NonRenewable%>
				<html:hidden styleId="NonRenewable" property="answer(Object::Submission::NonRenewable)" value="<%=""+NonRenewable%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Renewal Alerts in Days :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="RenewalAlertDays" name="downStreamArr" property="Object::Submission::RenewalAlertDays" /> <%=""+RenewalAlertDays%>
				<html:hidden styleId="RenewalAlertDays" property="answer(Object::Submission::RenewalAlertDays)" value="<%=""+RenewalAlertDays%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Expiring Premium :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="ExpiringPremium" name="downStreamArr" property="Object::Submission::ExpiringPremium" /> <%=""+ExpiringPremium%>
				<html:hidden styleId="ExpiringPremium" property="answer(Object::Submission::ExpiringPremium)" value="<%=""+ExpiringPremium%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Due Date :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="DueDate" name="downStreamArr" property="Object::Submission::DueDate" /> <%=""+DueDate%>
				<html:hidden styleId="DueDate" property="answer(Object::Submission::DueDate)" value="<%=""+DueDate%>" /> 				 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Comments :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SubmissionComments" name="downStreamArr" property="Object::Submission::SubmissionComments" />
				<html:hidden styleId="SubmissionComments" property="answer(Object::Submission::SubmissionComments)" value="<%=""+SubmissionComments%>" /> 				 		
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Issuing Company :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="IssuingCompany" name="downStreamArr" property="Object::Submission::IssuingCompany" /> <%=""+IssuingCompany%>
				<html:hidden styleId="IssuingCompany" property="answer(Object::Submission::IssuingCompany)" value="<%=""+IssuingCompany%>" />
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Region :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="Region" name="downStreamArr" property="Object::Submission::Region" /> <%=""+Region%>
				<html:hidden styleId="Region" property="answer(Object::Submission::Region)" value="<%=""+Region%>" />
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Producer Commission Precentage :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="ProducerCommissionPercentage" name="downStreamArr" property="Object::Submission::ProducerCommissionPercentage" /> <%=""+ProducerCommissionPercentage%>
				<html:hidden styleId="ProducerCommissionPercentage" property="answer(Object::Submission::ProducerCommissionPercentage)" value="<%=""+ProducerCommissionPercentage%>" /> 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission Number of Employees :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="NumberOfEmployees" name="downStreamArr" property="Object::Submission::NumberOfEmployees" /> <%=""+NumberOfEmployees%>
				<html:hidden styleId="NumberOfEmployees" property="answer(Object::Submission::NumberOfEmployees)" value="<%=""+NumberOfEmployees%>" /> 
			</td>			
		</tr>
		<tr>
			<td width="30%" class="FormLabels">Submission SIC Code :</td>
			<td width="65%" class="FormLabelsApplication">
				<bean:define id="SubmissionSICCode" name="downStreamArr" property="Object::Submission::SubmissionSICCode" /> <%=""+SubmissionSICCode%>
				<html:hidden styleId="SubmissionSICCode" property="answer(Object::Submission::SubmissionSICCode)" value="<%=""+SubmissionSICCode%>" /> 				
				<html:hidden styleId="user" property="answer(Object::Agency::Addresses::BUSINESS::Object::Entity::User)" value="<%=userId.toString()%>" />
			</td>			
		</tr>	
		</table>
		<table cellpadding="0" cellspacing="2" border="0" align="center" width="98%">
		<tr>
		<bean:define name="AddCustomer" property="answer(Object::Submission::DownStream::Id)" id="SFSubmissionId"/>
		<dmshtml:If_Submission_Exists nameInSession="isSubmissionExists" SFSubmissionId="<%=""+SFSubmissionId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />
		<logic:present name="isSubmissionExists">
			<td class="FormLabels"><html:button value="Update" property="answer(button)" onclick="updateSubmission(this.form);" styleClass="covbutton"/></td>
		</logic:present>
		<logic:notPresent name="isSubmissionExists">
			<td width="5%" class="FormLabels"><html:button value="Create" property="answer(button)" onclick="createSubmission(this.form);" styleClass="covbutton"/></td>
		</logic:notPresent>			
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>		
		</table>
</div>
</logic:iterate>
</logic:present>

</html:form>