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
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/CheckClearance.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"> </SCRIPT>
<script type="text/javascript">
function setNameValues()
{
    var formElement=document.forms[0];
    //alert(formElement.LegalName1.value);
    if(formElement.NameType.value == 'Company')
    {
    	formElement.customerName1.value = formElement.LegalName1.value;
    	formElement.customerName2.value = formElement.LegalName2.value;
    }
    else if(formElement.NameType.value == 'Person')
    {
    	formElement.customerName1.value = formElement.FirstName.value;
    	formElement.customerName2.value = formElement.LastName.value;
    }    
}
function validateDate()
{
		var formElement=document.forms[0];
		
		var subStartMM=formElement.SESDate1.value;
		var subStartDD=formElement.SESDate2.value;
		var subStartYY=formElement.SESDate3.value;
				                  	
		var subEndMM=formElement.SEEDate1.value;
		var subEndDD=formElement.SEEDate2.value;
		var subEndYY=formElement.SEEDate3.value;
				
		var quoteStartMM=formElement.QESDate1.value;
		var quoteStartDD=formElement.QESDate2.value;
		var quoteStartYY=formElement.QESDate3.value;
				
		var quoteEndMM=formElement.QEEDate1.value;
		var quoteEndDD=formElement.QEEDate2.value;
		var quoteEndYY=formElement.QEEDate3.value;
		
		var polStartMM=formElement.PESDate1.value;
		var polStartDD=formElement.PESDate2.value;
		var polStartYY=formElement.PESDate3.value;
		
		var polEndMM=formElement.PEEDate1.value;
		var polEndDD=formElement.PEEDate2.value;
		var polEndYY=formElement.PEEDate3.value;
		
		if(subStartMM!="" && subStartMM < 1 || subStartMM > 12){
			alert("Month should be 1-12");
			formElement.SESDate1.focus();
			return false;
		}	
		if(subEndMM!="" && subEndMM < 1 || subEndMM > 12) {
			alert("Month should be 1-12");
			formElement.SEEDate1.focus();
			return false;
		}	
		if(quoteStartMM!="" && quoteStartMM < 1 ||quoteStartMM > 12) {
			alert("Month should be 1-12");
			formElement.QESDate1.focus();
			return false;
		}
		if(quoteEndMM!="" && quoteEndMM < 1 || quoteEndMM > 12) {
			alert("Month should be 1-12");
			formElement.QEEDate1.focus();
			return false;
		}	
		if(polStartMM!="" && polStartMM < 1 || polStartMM > 12) {
			alert("Month should be 1-12");
			formElement.PESDate1.focus();
			return false;
		}
		if(polEndMM!="" && polEndMM < 1 || polEndMM > 12) {
			alert("Month should be 1-12");
			formElement.PEEDate1.focus();
			return false;
		}	
				
		if(subStartDD!="" && subStartDD < 1 || subStartDD > 31) {
			alert("Date should be 1-31");
			formElement.SESDate2.focus();
			return false;
		}
		if(subEndDD!="" && subEndDD < 1 || subEndDD > 31) {
			alert("Date should be 1-31");
			formElement.SEEDate2.focus();
			return false;
		}	
		if(quoteStartDD!="" && quoteStartDD < 1 || quoteStartDD > 31) {
			alert("Date should be 1-31");
			formElement.QESDate2.focus();
			return false;
		}
		if(quoteEndDD!="" && quoteEndDD < 1 || quoteEndDD > 31) {
			alert("Date should be 1-31");
			formElement.QEEDate2.focus();
			return false;
		}
		if(polStartDD!="" && polStartDD < 1 || polStartDD > 31) {
			alert("Date should be 1-31");
			formElement.PESDate2.focus();
			return false;
		}
		if(polEndDD!="" && polEndDD < 1 || polEndDD > 31) {
			alert("Date should be 1-31");
			formElement.PEEDate2.focus();
			return false;
		}
		
		if(subStartYY!="" && subStartYY<1000){
			alert("year should be >999");
			formElement.SESDate3.focus();
			return false;
		}
		if(subEndYY!="" && subEndYY<1000){
			alert("year should be >999");
			formElement.SEEDate3.focus();
			return false;
		}
		if(quoteStartYY!="" && quoteStartYY<1000){
			alert("year should be >999");
			formElement.QESDate3.focus();
			return false;
		}
		if(quoteEndYY!="" && quoteEndYY<1000){
			alert("year should be >999");
			formElement.QEEDate3.focus();
			return false;
		}
		if(polStartYY!="" && polStartYY<1000){
			alert("year should be >999");
			formElement.PESDate3.focus();
			return false;
		}
		if(polEndYY!="" && polEndYY<1000){
			alert("year should be >999");
			formElement.PEEDate3.focus();
			return false;
		}		
		
		if((isNaN(subStartMM)) || (isNaN(subStartDD)) || (isNaN(subStartYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(subEndMM)) || (isNaN(subEndDD)) || (isNaN(subEndYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(quoteStartMM)) || (isNaN(quoteStartDD)) || (isNaN(quoteStartYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(quoteEndMM)) || (isNaN(quoteEndDD)) || (isNaN(quoteEndYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(polStartMM)) || (isNaN(polStartDD)) || (isNaN(polStartYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(polEndMM)) || (isNaN(polEndDD)) || (isNaN(polEndYY))){
			alert("Date should be numeric.");
			return false;		
		}		
		
		if((subStartMM==2 && subStartDD>29 && (subStartYY%4==0)) || (subStartMM==2 && subStartDD>28 && (subStartYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((subEndMM==2 && subEndDD>29 && (subEndYY%4==0)) || (subEndMM==2 && subEndDD>28 && (subEndYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((quoteStartMM==2 && quoteStartDD>29 && (quoteStartYY%4==0)) || (quoteStartMM==2 && quoteStartDD>28 && (quoteStartYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((quoteEndMM==2 && quoteEndDD>29 && (quoteEndYY%4==0)) || (quoteEndMM==2 && quoteEndDD>28 && (quoteEndYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((polStartMM==2 && polStartDD>29 && (polStartYY%4==0)) || (polStartMM==2 && polStartDD>28 && (polStartYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((polEndMM==2 && polEndDD>29 && (polEndYY%4==0)) || (polEndMM==2 && polEndDD>28 && (polEndYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
				
			
		if((subStartMM!="")&&(subStartDD!="")&&(subStartYY!="")) {
			formElement.SESDate.value=subStartYY+"-"+subStartMM+"-"+subStartDD;
		}		
		if((subEndMM!="")&&(subEndDD!="")&&(subEndYY!="")) {
			formElement.SEEDate.value=subEndYY+"-"+subEndMM+"-"+subEndDD;
			
		}		
		if((quoteStartMM!="")&&(quoteStartDD!="")&&(quoteStartYY!="")) {
			formElement.QESDate.value=quoteStartYY+"-"+quoteStartMM+"-"+quoteStartDD;
			
		}		
		if((quoteEndMM!="")&&(quoteEndDD!="")&&(quoteEndYY!="")) {
			formElement.QEEDate.value=quoteEndYY+"-"+quoteEndMM+"-"+quoteEndDD;
			
		}
		
		if((polStartMM!="")&&(polStartDD!="")&&(polStartYY!="")) {
			formElement.PESDate.value=polStartYY+"-"+polStartMM+"-"+polStartDD;
			
		}
		if((polEndMM!="")&&(polEndDD!="")&&(polEndYY!="")) {
			formElement.PEEDate.value=polEndYY+"-"+polEndMM+"-"+polEndDD;
			
		}				
		setNameValues();				
}  	
</script>


<html:form name="FindClearance" type="com.dms.web.data.DataForm" action="/FindClearanceAction.do" onsubmit="return validateDate()">
<div class="formpage01">
 <html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">		
	   	<tr>
			<td colspan="4"><div class="formhead"><h2 class="left">Find Clearance</h2></div></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
		<td>
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="2">
			<tr>
				<tr><td colspan ="2"><h3>Clearance Search Criteria</h3></td></tr>
			</tr>
			<tr>
					<td class="field" width="40%" align="right">Insured Name Type&nbsp;&nbsp;</td>
					<td class="links" width="60%" style="Class:txtbox">
					<html:select property="answer(Object::Clearance::NameType)"	styleClass="txtbox" styleId="NameType" onchange="showPersonInformation(this.form)">
						<html:option value="" >All</html:option>
						<html:option value="Company" >Company</html:option>
						<html:option value="Person" >Person</html:option>					
					</html:select></td>				
			</tr>
			<tr id="company_legal_name1" >
					<td width="40%" class="field" align="right"	id="legalName1">Insured Name 1&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text property="answer(Object::Clearance::LegalName1)" size="50" maxlength="50" styleClass="txtbox" styleId="LegalName1" /></td>				
					
			</tr>
			<tr id="company_legal_name2">
					<td width="40%" class="field" align="right"	id="legalName2">Insured Name 2&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text	property="answer(Object::Clearance::LegalName2)" size="50"	maxlength="50" styleClass="txtbox" styleId="LegalName2" /></td>
					
			</tr>
			<tr id="personfirstname">
					<td width="40%" class="field" align="right" id="firstName">First Name&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text property="answer(Object::Clearance::FirstName)" size="30" maxlength="30" styleClass="txtbox" styleId="FirstName" /></td>
					
			</tr>
			<tr id="personlastname">
					<td width="40%" class="field" align="right"	id="lastName">Last Name&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text property="answer(Object::Clearance::LastName)" size="30" maxlength="30" styleClass="txtbox" styleId="LastName" /></td>
					
			</tr>
			<tr id="insureddba">
					<td class="field" width="40%" align="right">DBA&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text	property="answer(Object::Clearance::DBA)" size="50" maxlength="50"	styleClass="txtbox" styleId="DBA" /></td>
			</tr>
			<tr>
					<td class="field" align="right">State/Province&nbsp;&nbsp;</td>			
					<td class="links" style="Class:txtbox"><html:select property="answer(Object::Clearance::State)" styleClass="txtbox" styleId="State">
						<html:option value ="" styleClass="txtbox">All</html:option>
						   		
							<html:option value="AL">Alabama</html:option>		    
						    <html:option value="AK">Alaska</html:option>		    
						    <html:option value="AS">American Samoa</html:option>
						    <html:option value="AZ">Arizona</html:option>	    
						    <html:option value="AR">Arkansas</html:option>		    
						    <html:option value="CA">California</html:option>		    
						    <html:option value="CO">Colorado</html:option>		    
						    <html:option value="CT">Connecticut</html:option>		    
						    <html:option value="DE">Delaware</html:option>		    
						    <html:option value="DC">District of Columbia</html:option>		    
						    <html:option value="FM">Federated States of Micronesia</html:option>		    
						    <html:option value="FL">Florida</html:option>		    
						    <html:option value="GA">Georgia</html:option>		    
						    <html:option value="GU">Guam</html:option>		    
						    <html:option value="HI">Hawaii</html:option>		    
						    <html:option value="ID">Idaho</html:option>		    
						    <html:option value="IL">Illinois</html:option>		    
						    <html:option value="IN">Indiana</html:option>		    
						    <html:option value="IA">Iowa</html:option>		    
						    <html:option value="KS">Kansas</html:option>	    
						    <html:option value="KY">Kentucky</html:option>		    
						    <html:option value="LA">Louisiana</html:option>		    
						    <html:option value="ME">Maine</html:option>		    
						    <html:option value="MH">Marshall Islands</html:option>		    
						    <html:option value="MD">Maryland</html:option>		    
						    <html:option value="MA">Massachusetts</html:option>		    
						    <html:option value="MI">Michigan</html:option>
						    <html:option value="MN">Minnesota</html:option>
						    <html:option value="MS">Mississippi</html:option>
						    <html:option value="MO">Missouri</html:option>
						    <html:option value="MT">Montana</html:option>
						    <html:option value="NE">Nebraska</html:option>
						    <html:option value="NV">Nevada</html:option>
						    <html:option value="NH">New Hampshire</html:option>
						    <html:option value="NJ">New Jersey</html:option>
						    <html:option value="NM">New Mexico</html:option>
						    <html:option value="NY">New York</html:option>
							<html:option value="NC">North Carolina</html:option>
						    <html:option value="ND">North Dakota</html:option>
						    <html:option value="MP">Northern Mariana Islands</html:option>
						    <html:option value="OH">Ohio</html:option>
						    <html:option value="OK">Oklahoma</html:option>
						    <html:option value="OR">Oregon</html:option>
						    <html:option value="PW">Palau</html:option>
						    <html:option value="PA">Pennsylvania</html:option>
						    <html:option value="PR">Puerto Rico</html:option>
						    <html:option value="RI">Rhode Island</html:option>
						    <html:option value="SC">South Carolina</html:option>
						    <html:option value="SD">South Dakota</html:option>
						    <html:option value="TN">Tennessee</html:option>
						    <html:option value="TX">Texas</html:option>
						    <html:option value="UT">Utah</html:option>
						    <html:option value="VT">Vermont</html:option>
						    <html:option value="VI">Virgin Islands</html:option>
						    <html:option value="VA">Virginia</html:option>
						    <html:option value="WA">Washington</html:option>
						    <html:option value="WV">West Virginia</html:option>
						    <html:option value="WI">Wisconsin</html:option>
						    <html:option value="WY">Wyoming</html:option>				
						</html:select>
					</td>
			</tr>
			<tr>
					<td class="field" width="40%" align="right">Zip Code&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text property="answer(Object::Clearance::Zipcode)" size="5" maxlength="5" styleClass="txtbox" styleId="Zip" />				
					<!--Zipcode lookup start 05-06-2006--> <a
						href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=FindClearance&clear=yes&PopupWindowName=Zip Code Search"
						title="Search for zip code, state, county"
						onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
						SRC="../Images/zipcodefind.jpg" BORDER="0" align="top"
						ALT="Search for Zip code, City, State and County."></a></td>
					<!-- 05-06-2006 end-->
					<html:hidden property="answer(Object::Customer::City)"  styleId="City"/>
					<html:hidden property="answer(Object::Customer::County)" styleId="County"/>
			</tr>			
			<tr>
					<td width="40%" class="field" align="right"	id="submissionNumber">Submission #&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text property="answer(Object::Clearance::SubmissionNumber)" size="20" maxlength="20" styleClass="txtbox" styleId="SubmissionNumber" /></td>					
			</tr>
			<tr>
				<td width="30%" class="field" align="right" height="25">Submission Expiry Start Date&nbsp;&nbsp;</td>
				<td class="links">
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="SESDate1" onkeyup="if(this.value.length==2) {document.forms[0].SESDate2.focus()}" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="SESDate2" onkeyup="if(this.value.length==2) {document.forms[0].SESDate3.focus()}" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="SESDate3" onkeyup="if(this.value.length==4) {document.forms[0].SEEDate1.focus()}" />&nbsp;(MM/DD/YYYY)</td>
			</tr>
			<tr>				
				<td width="30%" class="field" align="right" height="25">Submission Expiry End Date&nbsp;&nbsp;</td>
				<td class="links">
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="SEEDate1" onkeyup="if(this.value.length==2) {document.forms[0].SEEDate2.focus()}" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="SEEDate2" onkeyup="if(this.value.length==2) {document.forms[0].SEEDate3.focus()}" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="SEEDate3" />&nbsp;(MM/DD/YYYY)</td>
			</tr>
			<tr>
					<td width="40%" class="field" align="right"	id="quoteNumber">Quote #&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text property="answer(Object::Clearance::QuoteNumber)" size="20" maxlength="20" styleClass="txtbox" styleId="QuoteNumber" /></td>					
			</tr>
			<tr>
				<td width="30%" class="field" align="right" height="25">Quote Expiry Start Date&nbsp;&nbsp;</td>
				<td class="links">
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="QESDate1" onkeyup="if(this.value.length==2) {document.forms[0].QESDate2.focus()}" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="QESDate2" onkeyup="if(this.value.length==2) {document.forms[0].QESDate3.focus()}" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="QESDate3" onkeyup="if(this.value.length==4) {document.forms[0].QEEDate1.focus()}" />&nbsp;(MM/DD/YYYY)</td>
			</tr>
			<tr>
				<td width="30%" class="field" align="right" height="25">Quote Expiry End Date&nbsp;&nbsp;</td>
				<td class="links">
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="QEEDate1" onkeyup="if(this.value.length==2) {document.forms[0].QEEDate2.focus()}" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="QEEDate2" onkeyup="if(this.value.length==2) {document.forms[0].QEEDate3.focus()}" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="QEEDate3" />&nbsp;(MM/DD/YYYY)</td>
			</tr>
			<tr>
					<td width="40%" class="field" align="right"	id="policyNumber">Policy #&nbsp;&nbsp;</td>
					<td class="links" width="60%">
					<html:text property="answer(Object::Clearance::PolicyNumber)" size="20" maxlength="20" styleClass="txtbox" styleId="PolicyNumber" /></td>					
			</tr>
			<tr> 
				<td width="30%" class="field" align="right" height="25">Policy Expiry Start Date&nbsp;&nbsp;</td>
				<td class="links">
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="PESDate1" onkeyup="if(this.value.length==2) {document.forms[0].PESDate2.focus()}" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="PESDate2" onkeyup="if(this.value.length==2) {document.forms[0].PESDate3.focus()}" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="PESDate3" onkeyup="if(this.value.length==4) {document.forms[0].PEEDate1.focus()}" />&nbsp;(MM/DD/YYYY)</td>
			</tr>
			<tr>
				<td width="30%" class="field" align="right" height="25">Policy Expiry End Date&nbsp;&nbsp;</td>
				<td class="links">
				<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="PEEDate1" onkeyup="if(this.value.length==2) {document.forms[0].PEEDate2.focus()}" />&nbsp;
				<html:text  property ="answer(Date)"  size="2" maxlength="2" styleClass="txtbox"  styleId="PEEDate2" onkeyup="if(this.value.length==2) {document.forms[0].PEEDate3.focus()}" />&nbsp;
				<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="PEEDate3" />&nbsp;(MM/DD/YYYY)</td>
			</tr>
			<!-- <tr>
					<td class="field" width="40%" align="right">Clearance Status&nbsp;&nbsp;</td>
					<td class="links" width="60%" style="Class:txtbox">
					<html:select property="answer(Object::Clearance::ClearanceStatus)"	styleClass="txtbox" styleId="ClearanceStatus">
						<html:option value="" styleClass="txtbox">All</html:option>
						<html:option value="Cleared" >Cleared</html:option>
						<html:option value="Blocked" >Blocked</html:option>					
					</html:select></td>				
			</tr> -->
			<tr>
					<td class="field" width="40%" align="right">Clearance Source&nbsp;&nbsp;</td>
					<td class="links" width="60%" style="Class:txtbox">
					<html:select property="answer(Object::Clearance::Source)"	styleClass="txtbox" styleId="ClearanceSource">
						<html:option value="">All</html:option>
						<html:option value="SOLARTIS" >SOLARTIS</html:option>
						<html:option value="GENIUS">GENIUS</html:option>					
					</html:select></td>				
			</tr>
			<tr>
					<td class="field" width="40%" align="right">Linked&nbsp;&nbsp;</td>
					<td class="links" width="60%" style="Class:txtbox">
					<html:select property="answer(Object::Clearance::Linked)"	styleClass="txtbox" styleId="Linked">
						<html:option value="" styleClass="txtbox">All</html:option>
						<html:option value="Y" >Yes</html:option>
						<html:option value="N" >No</html:option>					
					</html:select></td>				
			</tr>					
			<tr>
				<td colspan="2" align="center" >
				  <table width="100%">
				  <tr>
				   <td colspan="3">&nbsp;</td>
				  </tr>
				   <tr>
				     <td width="100%" align="center" title="<bean:message key='ToolTip.FindClearance.Find'/>">
				        <html:submit value="Find" property="Search" styleClass="covbutton" />
				     </td>
				    </tr>
				   </table>
			   </td>
			</tr>
		</table>
		</td>
	</tr>		
 </table> 
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
 <html:hidden property="answer(Object::Customer::CustomerName)" styleId="customerName1"/>
	<html:hidden property="answer(Object::Customer::CustomerName2)" styleId="customerName2"/>
 <html:hidden property="answer(Object::Clearance::SESDate)" value="" styleId="SESDate" />
  <html:hidden property="answer(Object::Clearance::SEEDate)" value="" styleId="SEEDate" />
   <html:hidden property="answer(Object::Clearance::QESDate)" value="" styleId="QESDate" />
    <html:hidden property="answer(Object::Clearance::QEEDate)" value="" styleId="QEEDate" />
     <html:hidden property="answer(Object::Clearance::PESDate)" value="" styleId="PESDate" />
      <html:hidden property="answer(Object::Clearance::PEEDate)" value="" styleId="PEEDate" />
      <html:hidden property="answer(Object::Clearance::PageNum)" value="0"/>
      </div>
</html:form>
<SCRIPT type="text/javaScript">	
var formElement=document.forms[0];
	showPersonInformation(formElement);  				  
</SCRIPT>
