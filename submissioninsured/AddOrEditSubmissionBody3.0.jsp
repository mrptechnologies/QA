<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/prototype.js"></script>

<jsp:include page="../common/autoCompleteScript.jsp">
<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETEZIPCODEADDEDITEMPLOYER" />
</jsp:include>
<style type="text/css">
#zipcodeAutoComplete {
    width:10em; /* set width here or else widget will expand to fit its container */
    padding-bottom:2em;
}
#zipcode {
    width:10em; /* set width here or else widget will expand to fit its container */
    padding-bottom:2em;
}
#zipAutoCompleteResContainer {
    width:25em; /* set width here or else widget will expand to fit its container */
    padding-bottom:2em;
}
</style>
<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js" type="text/javascript"> </SCRIPT>
<html:form action="/SaveInsuredSubmissionUI3" focus="InsuredName" onsubmit="return validateFields()">
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<bean:define id="SubmissionForExistingInsured" name="AddCustomer" property="answer(Object::ExistingInsured)"/>	
<bean:define id="ProposedEffDate" name="AddCustomer" property="answer(Object::Clearance::ProposedEffectiveDate)"/>
<bean:define id="ProposedEffDate1" name="AddCustomer" property="answer(Object::Clearance::ProposedEffectiveDate1)"/>
<bean:define id="ClearanceForwardPage" name="AddCustomer" property="answer(Object::Submission::ClearanceForwardPage)" scope="session"/>


<%String agencyIdTemp="";%> 
<%String agencyIdtoLink="";%>
<%String strAgentFName="";%>
<%String strAgentLName="";%>
<%long lngAgentId1=0;%>
<%long lngAgencyTemp=0;%>
<%long agencyId2=0;%>
<%String agencyName2="";%>
<%long generalagencyid2=0;%>
<%String generalagencyname2="";
String agencyAgentId="";%>

<%
	long submissionIdNBF =0;
	long submissionVerIdNBF =0;
	long subId =0;
	long subVerId =0;

%>
<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
 <%
         String nameFieldLength ="125";
       if (nameFieldLength.length() <= 0 && nameFieldLength == null){
         nameFieldLength = "60";           
         }
       
       %>


<%if (request.getParameter("agencyIdtoLink")!= null) {
   agencyIdtoLink=request.getParameter("agencyIdtoLink");
   agencyId2=Long.parseLong(agencyIdtoLink.toString());
}%>
<logic:equal name="AddCustomer" property="answer(Object::Submission::ClearanceForwardPage)" value="failure_show_list">
<html:hidden property="answer(Object::Clearance::BrokerBlocked)" styleId="BrokerBlocked" value="failure_show_list" />
<div class="clearance">									
<div class="message"><font color="blue">Should you proceed with submission of an application it may be rejected due to the potential clearance issue.</font></div>
</div>
</logic:equal>
<logic:equal name="AddCustomer" property="answer(Object::Submission::ClearanceForwardPage)" value="failure_hide_list">
<html:hidden property="answer(Object::Clearance::BrokerBlocked)" styleId="BrokerBlocked" value="BrokerBlocked" />
<html:hidden property="answer(Object::Clearance::BrokerBlocked)" styleId="BrokerBlocked11"/>
<div class="clearance">									
<div class="message" id="messagetext"><font color="blue">This submission will be referred to UW. Please provide complete Assured address information.</font></div>
</div>
</logic:equal>
<logic:equal name="AddCustomer" property="answer(Object::Submission::ClearanceForwardPage)" value="success">
<html:hidden property="answer(Object::Clearance::BrokerBlocked)" styleId="BrokerBlocked" value="success" />
<div class="clearance">									
<div class="message"><font color="blue">Insured <bean:write name='AddCustomer' property='answer(Object::Customer::CustomerName)'/> passed clearance. Please continue with New Submission below to complete application.</font></div>
</div>	
</logic:equal>


<br class="clear" />
<div class="formpageinsured1">
<div class="formpageinsured2">
<div class="formhead">
	
   <h2 class="left">Insured Detail</h2>
   <div class="details">Detailed Insured Information</div>
</div>

<h3>Name</h3>

<div class="field" style="width:510px;">Insured Name Type:
   <html:select name="AddCustomer" property="answer(Object::Customer::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation(this.form)">
       <html:option value ="Person" styleClass="txtbox">Person</html:option>
       <html:option value ="Company" styleClass="txtbox">Company</html:option>
   </html:select>
</div>

<div class="field"  style="width:515px;" id="insuredNameBlock"><span id="InsName1"><font color="red">* Legal Name 1:</font></span>
<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)" maxlength="125" styleClass="txtbox" styleId="InsuredName" /> </div>
 
<div class="field"  style="width:515px;" id="insuredNameBlock"><span id="InsName2">Legal Name 2:</span>
   <html:text name="AddCustomer" property="answer(Object::Customer::CustomerName2)" maxlength="125" styleClass="txtbox" styleId="InsuredName2" />
</div>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE_REMOVED"}%>' connector='or' negated="true">
<div class="field" style="width:515px;" >Name Code:
   <html:text name="AddCustomer" property="answer(Object::Customer::CustomerNumber)" maxlength="8" styleClass="txtbox" styleId="InsuredNumber" />
</div>
</dmshtml:dms_static_with_connector>

<div class="field" id="DBABlock" style="width:515px;">Insured DBA:
   <html:text name="AddCustomer" property="answer(Object::Customer::DBA)"  styleClass="txtbox" styleId="DBA" maxlength="125"/>
</div>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="true">
<div class="field" id="industryBlock" style="width:545px;"><font color="red">* Industry:</font><dmshtml:get_industry_name
		nameInSession="arListIndustry"
		ownerId="<%=Long.parseLong(ownerId.toString())%>"
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
		<html:select
		name="AddCustomer" property="answer(Object::Submission::IndustryName)"
		styleClass="txtbox" style="width:310px;" styleId="IndustryName">
			<html:option value="">Select</html:option>
			<logic:present name="arListIndustry" scope="request">
				<logic:iterate id="arListIndustry" name="arListIndustry">
				<bean:define id="industryName1" name="arListIndustry" property="Object::Product::IndustryName"></bean:define>
					<html:option
						value='<%=industryName1.toString()%>'>
						<bean:write name="arListIndustry" property="Object::Product::IndustryName" />
					</html:option>
				</logic:iterate>
			</logic:present>
		</html:select>
	</div>
	</dmshtml:dms_static_with_connector>
<h3>Primary Business Address</h3>

<div class="field" style="width:515px;"><font color="red">* Address Line 1:</font>
   <html:text name="AddCustomer" property="answer(Object::Customer::StreetName)" styleClass="txtbox" maxlength="50" styleId="Address1" />
</div>

<div class="field" style="width:515px;">Address Line 2:
   <html:text name="AddCustomer" property="answer(Object::Customer::Address2)" styleClass="txtbox" maxlength="50" styleId="Address2" />
</div>

<div class="field" style="width:515px;" ><font color="red">* City:</font>
   <html:text name="AddCustomer" property="answer(Object::Customer::City)"  maxlength="40" styleClass="txtbox" styleId="City" />
</div>

<div class="field" style="width:515px;">County Name:
   <html:text  name="AddCustomer"   property="answer(Object::Customer::County)" maxlength="20"  styleClass="txtbox" styleId="County"/>
</div>
<div class="field" style="width:510px;" ><font color="red">*&nbsp;State/Province:</font>
   <html:select name="AddCustomer" property="answer(Object::Customer::State)" styleClass="txtbox" styleId="State">
	<html:option value="" styleClass="txtbox">Select A State</html:option>
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
</div>

<div class="field" id="zipcodeAutoComplete" style=" text-align:center; width:386px ;float:left;height:2px;"><font color="red">*Zipcode or City Name:</font>
			<html:hidden property="autoCompleteSqlLookupName" styleId="zipLookupName" value="AUTOCOMPLETEZIPCODEALLSTATES"/>
		   <html:text name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:130px;"
			 styleClass="txtbox" styleId="Zip" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <div  id="zipAutoCompleteResContainer" class="field" style="text-align:left; float:left;"></div>
			 </div>
		<div>
		<!--Zipcode lookup start 05-06-2006--> <a
			href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search"
			title="Search for zip code, state, county"
			onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
			SRC="../Images/FindZipCode.jpg" BORDER="0" align="top"
			ALT="Search for Zip code, City, State and County."></a>
			</div>

<div class="field" style="width:510px;">Country:
<html:select name="AddCustomer" property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
  <html:option value="USA" styleClass="txtbox">United States</html:option>
</html:select>
</div>
<%boolean displayGeniusFields = false;%>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIBERTY_GENIUSADDRESS"}%>' connector='or' negated="false">
<%displayGeniusFields=true;%>
</dmshtml:dms_static_with_connector>
<%if(displayGeniusFields){%>
<h3>Genius Address</h3>
</div>
<div class="field" style="width:485px;">Is Genius Address same as Business Address?
  <input type="radio" name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" value="Y" id="MailingAddressSameAsBusinessAddress_Y" checked="checked" onclick="disableMailingAddressBlock()" />Yes
  <input type="radio" name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" value="N" id="MailingAddressSameAsBusinessAddress_N" onclick="enableMailingAddressBlock()" />No&nbsp;&nbsp;
</div>
<div class="formpageinsured2">
<div id="MailingAddressBlock" >
	<div class="field" style="width:515px;height:40px;">Genius Address 1
 		<html:text  property="answer(Object::Submission::MailingAddress1)" styleId="MailingAddress1" styleClass="txtbox" maxlength="50"  />
	</div>
	<div class="field" style="width:515px;height:40px;">Genius Address 2
 		<html:text  property="answer(Object::Submission::MailingAddress2)" styleId="MailingAddress2" styleClass="txtbox" maxlength="50"  />
	</div>
	<div class="field" style="width:515px;height:40px;">Genius Address 3
 		<html:text  property="answer(Object::Submission::MailingAddress3)" styleId="MailingAddress3" styleClass="txtbox" maxlength="50"  />
	</div>
	<div class="field" style="width:515px;height:40px;">Genius Address 4
 		<html:text  property="answer(Object::Submission::MailingAddress4)" styleId="MailingAddress4" styleClass="txtbox" maxlength="50"  />
	</div>
	<div class="field" style="width:515px;height:40px;">Genius Address 5
 		<html:text  property="answer(Object::Submission::MailingAddress5)" styleId="MailingAddress5" styleClass="txtbox" maxlength="50"  />
	</div>
</div>
<%}else{%>
</div>
<div class="field" style="width:485px;display:none;">Is Genius Address same as Business Address?
  <input type="radio" name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" value="Y" id="MailingAddressSameAsBusinessAddress_Y" checked="checked" onclick="disableMailingAddressBlock()" />Yes
  <input type="radio" name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)" value="N" id="MailingAddressSameAsBusinessAddress_N" onclick="enableMailingAddressBlock()" />No&nbsp;&nbsp;
</div>
<div class="formpageinsured2">
<div id="MailingAddressBlock" style="display:none;">
	<div class="field" style="width:515px;height:40px;">Genius Address 1
 		<html:text  property="answer(Object::Submission::MailingAddress1)" styleId="MailingAddress1" styleClass="txtbox" maxlength="50"  />
	</div>
	<div class="field" style="width:515px;height:40px;">Genius Address 2
 		<html:text  property="answer(Object::Submission::MailingAddress2)" styleId="MailingAddress2" styleClass="txtbox" maxlength="50"  />
	</div>
	<div class="field" style="width:515px;height:40px;">Genius Address 3
 		<html:text  property="answer(Object::Submission::MailingAddress3)" styleId="MailingAddress3" styleClass="txtbox" maxlength="50"  />
	</div>
	<div class="field" style="width:515px;height:40px;">Genius Address 4
 		<html:text  property="answer(Object::Submission::MailingAddress4)" styleId="MailingAddress4" styleClass="txtbox" maxlength="50"  />
	</div>
	<div class="field" style="width:515px;height:40px;">Genius Address 5
 		<html:text  property="answer(Object::Submission::MailingAddress5)" styleId="MailingAddress5" styleClass="txtbox" maxlength="50"  />
	</div>
</div>
<%}%>
<h3>Contact Information</h3>

<div class="field" style="width:515px;">Email Address:
   <html:text name="AddCustomer" property="answer(Object::Customer::EMailAddress)" onblur="checkEmailAddress(this.form)" styleClass="txtbox" styleId="emailID" />
</div>

<div class="field" style="width:435px;">Phone Number:
<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="PhoneNumber1" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}" />&nbsp;
<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox"
								styleId="PhoneNumber2" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}" />&nbsp;
<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhone)"  style="width:60px;"
								maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" />
</div>
<div class="field" style="width:435px;text-align: right;">Fax Number:       
<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber1"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}" />&nbsp;
<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber2"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}" />&nbsp;
<dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::Fax)" style="width:60px;  "
								maxlength="4" styleClass="txtbox" styleId="FaxNumber3" />
</div>

<div class="field" style="width:515px;" >Contact First Name:
<html:text name="AddCustomer" property="answer(Object::Customer::ContactFName)"  styleClass="txtbox" 	maxlength="<%=nameFieldLength%>" styleId="ContactFirstName" />
</div>
<div class="field" style="width:515px;">Contact Last Name:
<html:text name="AddCustomer" property="answer(Object::Customer::ContactLName)" styleClass="txtbox" styleId="ContactLastName" maxlength="<%=nameFieldLength%>" />
</div>
<div class="field" style="width:515px;">Contact Title:
<html:text name="AddCustomer" property="answer(Object::Customer::ContactTitle)" styleClass="txtbox" styleId="ContactTitle" />
</div>


<h3 id="CompanyInfmnBlock">Company Information</h3>


<div class="field" id="CompanywebsiteBlock" style="width:515px;">Website:
<html:text name="AddCustomer" property="answer(Object::Customer::ContactURL)"  styleClass="txtbox" styleId="CompanyWebSite" />
</div>
<div class="field" id="FOBBlock" style="width:510px;">Form of Business:
<html:select name="AddCustomer" property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.form)">
 <html:option value="">Select</html:option>
 <html:option value="Corporation">Corporation</html:option>
 <html:option value="Sole Proprietor">Sole Proprietor</html:option>
 <html:option value="Partnership">Partnership</html:option>
 <html:option value="Joint Venture">Joint Venture</html:option>
 <html:option value="Other">Other</html:option>
 </html:select>
</div>
<div class="field" id="otherFOBBlock" style="width:510px;height:40px;">If Other,please Specify
<html:textarea name="AddCustomer" property="answer(Object::Customer::OtherBusiness)" rows="2" cols="30" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
</div>



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="false">
			<div class="field" title="<bean:message key='ToolTip.InsuredDetail.Next'/>">
			<input type="submit" class="covsmallbutton" value="Next" style="width:100px;float:right;" id="NextButton">
			</div>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="true">
			<div class="field" title="Click here to go to Submission Hazards">
			<input type="submit" class="covsmallbutton" value="Next" style="width:100px;float:right;" id="NextButton">
			</div>
		</dmshtml:dms_static_with_connector>


</div>
</div>



<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}%>


<html:hidden property="answer(Object::Submission::SubmissionId)" value='<%=""+submissionIdNBF %>' />
<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=""+submissionVerIdNBF %>' />

<html:hidden property="answer(Object::Submission::SubmissionInsuredId)" value='<%=""+Customerid%>' />
<html:hidden property="answer(Object::Submission::InsuredId)" value='<%=""+Customerid%>' />
<html:hidden property="answer(Object::Clearance::SubmissionId)" value='<%=""+subId %>' />
<html:hidden property="answer(Object::Clearance::SubmissionVerId)" value='<%=""+subVerId %>' />


<html:hidden property="answer(duplicateAllowed)" value="no"  />
<html:hidden property="answer(Object::Entity::SiteId)" value="1"  />
<!-- <html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
<html:hidden property="answer(Object::Entity::EntityType)" value="CUSTOMER" /> -->
<!-- <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> -->
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" styleId="ownerId" />

<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
  <html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />

   <html:hidden property="answer(Object::Customer::User)" value="<%=userName.toString()%>" />


   <html:hidden property="answer(Object::Submission::CreatedBy)" value="<%=userName.toString()%>" />

   <html:hidden property="answer(Object::Submission::UpdatedBy)" value="<%=userName.toString()%>" />



<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />


<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />


<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />


   <html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />


<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>

<html:hidden property="answer(PrimaryKey_Object::Customer::CustomerId)" value="-1" />
<html:hidden property="answer(Object::Location::LocationId)" value="-1" />
<html:hidden property="answer(Object::Risk::ComProperty::CustomerId)" value="<%=Customerid.toString()%>" />
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<html:hidden property="answer(APP_TAB_TYPE)" value="YUI" />
<html:hidden property="answer(ButtonStyle)" value="covbutton" />
<html:hidden property="answer(objectId)" value="0" />
<html:hidden property="answer(objectVerId)" value="0" />
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="false">
	<html:hidden property="answer(objectName)" value="GENERAL QUESTION SUBMISSION" />
</dmshtml:dms_static_with_connector>

<html:hidden property="answer(applicationType)" value="LOCATION" />
<html:hidden property="answer(applicationSubType)" value="" />
<html:hidden property="answer(showOneTabAtTime)" value="y" />
<html:hidden property="answer(IsSubApplicationCoveredByForm)" value="Yes" />
<html:hidden property="answer(IsApplicationDisabled)" value="N" />
<html:hidden property="answer(teritory)" value="" />
<html:hidden property="answer(teritoryName)" value="" />

<html:hidden property="answer(zone)" value="" />
<html:hidden property="answer(requestForm)" value="Submission" />

<html:hidden property="answer(OwnerId)" value="<%=""+ownerId%>" />
<html:hidden property="answer(Object::Location::LocationNumber)" value="-1"/>
<html:hidden property="answer(Object::Risk::RiskId)" value="-1" />

<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(showOneTabAtTime)" value="N" />
<html:hidden property="answer(IsSubApplicationCoveredByForm)" value="Yes" />
<html:hidden property="answer(IsApplicationDisabled)" value="N" />
<html:hidden property="answer(objectId)" value="0" />
<html:hidden property="answer(objectVerId)" value="0" />
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="false">
	<html:hidden property="answer(objectName)" value="GENERAL QUESTION SUBMISSION" />
</dmshtml:dms_static_with_connector>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="true">
	<html:hidden property="answer(ApplicationName)" value="Submission Hazards" />
</dmshtml:dms_static_with_connector>
<html:hidden property="answer(applicationType)" value="SUBMISSION" />
<html:hidden property="answer(applicationSubType)" value="" />
<html:hidden property="answer(APP_TAB_TYPE)" value="YUI" />
<html:hidden property="answer(riskTerritory)" value="" />
<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />
<html:hidden property="answer(zone)" value="" />
<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate)" value='<%=""+ProposedEffDate %>' /> 
<html:hidden property="answer(Object::Submission::ProposedEffectiveDate)" value='<%=""+ProposedEffDate %>' /> 
<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate1)" value='<%=""+ProposedEffDate1 %>' />
<bean:define id="clStatus" name="AddCustomer" property="answer(Object::Submission::ClearanceStatus)"scope="session"/>
<!-- modified by mariraj to get sub and clearance status -->
<html:hidden property="answer(Object::Submission::ClearanceStatus)" value='<%=clStatus.toString() %>' /> 
<bean:define id="subStatus" name="AddCustomer" property="answer(Object::Submission::Status)"scope="session"/>
<html:hidden property="answer(Object::Customer::Status)" value='<%=subStatus.toString() %>' /> 

<html:hidden property="answer(AgentId)"/>
<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />

<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>


<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

	<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" /> 

 <!--  html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="no" / -->				

<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%	if(!Customerid.equals("")){%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}	
%>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(isInserted)" value="Y" />
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="SUBMISSION"%>"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Submission Management"%>"/>
	<html:hidden property="answer(Object::ExistingInsured)" value="<%=SubmissionForExistingInsured.toString()%>"/>
	<html:hidden property="answer(pagename)" value="Quote summary" />
	<html:hidden property="answer(requestForm)" value="Submission" />
	







</html:form>

<SCRIPT type="text/javascript">
	var formElement=document.forms[0];	
	showCompanyInformation(formElement);
function newchecksubmitcount(){
}
</SCRIPT>


<script type="text/javascript">
YAHOO.example.BasicRemote = function() {
    // Use an XHRDataSource    
   var oDS = new YAHOO.util.XHRDataSource('../AutoCompleteZipCode.do');
    // Set the responseType
    oDS.responseType = YAHOO.util.XHRDataSource.TYPE_JSARRAY;
    oDS.responseSchema = {fields:["Zipcode", "City","County","State","Country"]};

    // Enable caching
    oDS.maxCacheEntries = 5;

    // Instantiate the AutoComplete
    var oAC = new YAHOO.widget.AutoComplete("Zip", "zipAutoCompleteResContainer", oDS);
    // The webservice needs custom parameters 
    oAC.generateRequest = function(sQuery) { 
    	
        return "?answer(Object::ZipCode::PageNum)=0&AutoCompleteZipLookupSqlname="+document.forms[0].zipLookupName.value+"&FormName=AddCustomer&query=" + sQuery ; 
    };
         
    oAC.useShadow = true;
    oAC.resultTypeList = false;
	oAC.applyLocalFilter = false;
	oAC.queryMatchSubset = false;
	oAC.minQueryLength = 3;	
	oAC.queryDelay = 1;
	oAC.prehighlightClassName = "yui-ac-prehighlight";
	// Display up to 20 results in the container
	oAC.maxResultsDisplayed = 20

    // Custom formatter to highlight the matching letters
    oAC.formatResult = function(oResultData, sQuery, sResultMatch) {
        var query = sQuery.toLowerCase(),
            zipcode = oResultData.Zipcode,
            city = oResultData.City,
            county = oResultData.County || "", // Guard against null value
            query = sQuery.toLowerCase(),
            zipcodeMatchIndex = zipcode.toLowerCase().indexOf(query),
            cityMatchIndex = city.toLowerCase().indexOf(query),
            countyMatchIndex = county.toLowerCase().indexOf(query),
            displayZipcode, displayCity, displaynCounty;

        if(zipcodeMatchIndex > -1) {
            displayZipcode = highlightMatch1(zipcode, query, zipcodeMatchIndex);
        }
        else {
            displayZipcode = zipcode;
        }

        if(cityMatchIndex > -1) {
            displayCity = highlightMatch1(city, query, cityMatchIndex);
        }
        else {
            displayCity = city;
        }

        if(countyMatchIndex > -1) {
            displayCounty = highlightMatch1(county, query, countyMatchIndex);
        }
        else {
            displayCounty = county ? county : "";
        }
		
        return displayZipcode + "\t" + displayCity + "\t" + displayCounty + "\t" + oResultData.State + "\t" + oResultData.Country ;

    };

    // Helper function for the formatter
    var highlightMatch1 = function(full, snippet, matchindex) {
        return full.substring(0, matchindex) +
                "<span class='match'>" +
                full.substr(matchindex, snippet.length) +
                "</span>" +
                full.substring(matchindex + snippet.length);
    };

    // Define an event handler to populate a hidden form field
    // when an item gets selected and populate the input field
    var myHiddenField = YAHOO.util.Dom.get("myHidden");
    var myHandler = function(sType, aArgs) {

        var myAC = aArgs[0]; // reference back to the AC instance
        var elLI = aArgs[1]; // reference to the selected LI element
        var oData = aArgs[2]; // object literal of selected item's result data
        
        document.forms[0].City.value = oData.City;
		document.forms[0].County.value = oData.County;
		document.forms[0].State.value = oData.State;
        
        // update hidden form field with the selected item's ID
        myHiddenField.value = elLI.Zipcode;
        myAC.getInputEl().value = oData.Zipcode + "\t" + oData.City+"\t" + (oData.County ? " (" + oData.State + ")" : "")+ "\t" + oData.State + "\t" + oData.Country ;
   		document.forms[0].City.value = oData.City;
		document.forms[0].County.value = oData.County;
		
    };
    oAC.itemSelectEvent.subscribe(myHandler);
	
    return {
        oDS: oDS,
        oAC: oAC
    };

}();
</script>

<script type="text/javascript">
function setBrokerBlockedFlag(){
	var brokerFailure="";
	if(document.forms[0].BrokerBlocked!=null && document.forms[0].BrokerBlocked!=undefined){
		brokerFailure=document.forms[0].BrokerBlocked.value;
	}
if(brokerFailure=='BrokerBlocked') {  
	document.forms[0].action='../SaveInsuredSubmissionUI3BrokerFailure.do';
	document.getElementById('NextButton').value='Save';
	}	
}	

if(document.forms[0].MailingAddressSameAsBusinessAddress_Y!=null && document.forms[0].MailingAddressSameAsBusinessAddress_Y!=undefined){
	if(document.forms[0].MailingAddressSameAsBusinessAddress_Y.checked==true) {
	   	 document.forms[0].MailingAddress1.readOnly = true;
	     document.forms[0].MailingAddress2.readOnly = true;
	     document.forms[0].MailingAddress3.readOnly = true;
	     document.forms[0].MailingAddress4.readOnly = true;
	     document.forms[0].MailingAddress5.readOnly = true;
 	}
 }
function disableMailingAddressBlock() {
     document.forms[0].MailingAddress1.readOnly = true;
     document.forms[0].MailingAddress2.readOnly = true;
     document.forms[0].MailingAddress3.readOnly = true;
     document.forms[0].MailingAddress4.readOnly = true;
     document.forms[0].MailingAddress5.readOnly = true;
}

function enableMailingAddressBlock() {
     document.forms[0].MailingAddress1.readOnly = false;
     document.forms[0].MailingAddress2.readOnly = false;
     document.forms[0].MailingAddress3.readOnly = false;
     document.forms[0].MailingAddress4.readOnly = false;
     document.forms[0].MailingAddress5.readOnly = false;
}
setBrokerBlockedFlag();
</script>
