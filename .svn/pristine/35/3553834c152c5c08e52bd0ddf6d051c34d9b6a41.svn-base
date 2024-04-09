<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/AddRisk.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<jsp:include page="../common/autoCompleteScript.jsp">
<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETEZIPCODEADDEDITEMPLOYER" />
</jsp:include>
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<bean:define id="objectId1" name="AddCustomer" property="answer(Object::Activity::ObjectId)" scope="session"/>
<bean:define id="insId" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope ="session" />
<bean:define id="customerName" name="AddCustomer" property="answer(Object::Customer::CustomerName)"/>
<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<html:form action="/SaveInsuredBTAUI3"  focus="InsuredName" onsubmit="return validateInsuredSummary()">

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

<%if (request.getParameter("agencyIdtoLink")!= null) {
agencyIdtoLink=request.getParameter("agencyIdtoLink");
agencyId2=Long.parseLong(agencyIdtoLink.toString());
}%>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />
<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
<html:hidden property="formName" value="form::LINKCUSTOMER" />

<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" align="left">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<logic:present name="staleDataSubmissionMsg"  scope="request">
					<tr>
						<td class="Error" >
							<bean:message key="error.staleDataSubmissionMsg"/>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</logic:present>
				
				<logic:present name="xmlValidationErrorList"  scope="request" >
				<tr>
					<td colspan="3">
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="sectionheadblackbig" align="center"><u><b><%="XML Has been generated with following validation Errors"%></b></u>
								</td>
							</tr>

							<tr>
								<td class="Error" WIDTH="100%">
									<ol>
										<bean:define id="arrList" name="xmlValidationErrorList" type="java.util.ArrayList"/>
										<logic:iterate id="errMsg" name="arrList" type="java.lang.String">
											<li>
											<%=errMsg%>
										</li>
										</logic:iterate>
									</ol>
								</td>
							</tr>
						</table>	
					</td>
				</tr>
				</logic:present >
	
    
				<%
				boolean errorOccured=false;
				%>
				<bean:define id="ansmap" name="AddCustomer" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
				<logic:iterate id="element" name="ansmap">
					<bean:define id="errorListkey" name="element" property="key" />
					<logic:equal name="errorListkey" value="Object::error::list">
						<bean:define id="errorListvalue" name="element" property="value" />
						<logic:iterate id="errmsg" name="errorListvalue">
							<tr>
							<td class="Error">
							<bean:write name="errmsg" property="errorMessage" />
				
							 <%
				        		errorOccured	=true;
								
							%>
							</td>
							</tr>
						</logic:iterate>
					</logic:equal>
				</logic:iterate> 

				<%
				if(errorOccured)
				{
					((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
				}
				%>
				<tr>
					<td>&nbsp;</td>
				</tr>																		
	
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							
							<tr>
								<td colspan="2" align="right" class="links" >
							
								 <%if(dataBaseIdViewPrivillage==1) {%>
									<tr>
									   
										<td class="FormLabels" align="left">&nbsp;&nbsp;Insured Id&nbsp;</td>
										<td class="TextMatter">&nbsp;<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)'/></td>
									</tr> 
							
							     <%}%>
							     
							<!--  to pass to the script -->
							<html:hidden name="AddCustomer" property ="answer(Object::Customer::CustomerId)" styleId="CustomerID" />
							<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
							<%
							  String nameFieldLength =(String) request.getAttribute("paramValue");
							if (nameFieldLength.length() <= 0 && nameFieldLength == null){
								 nameFieldLength = "60";								   
							  }
							
							%>
								</table>
								</td>
								</tr>
								</table>
								</td>
								</tr>
								</table>
															
							<br class="clear" />
							<div class="formpageinsured1">
							<div class="formpageinsured2">					
							<div class="formhead">
								<h2 class="left">Agency Information</h2>
							</div>
							<table>
							<tr>
							<td class="field" style="width:510px;"><font color="red">* Agency</font>
								<html:text  name="AddCustomer" property ="answer(AgencyName)"  size="60" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" />								
							</td>
							<td>
								<input type="button" class="covsmallbutton" value="Find Agency" BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButton()" />
							</td>
							</tr> 
							</table>
						<div class="formhead">
						   <h2 class="left">Insured Detail</h2>
						   <div class="details">Detailed Insured Information</div>
						</div>
						
						<h3></h3>
	
						<div class="field" style="width:515px;"><font color="red">* One Source Key ID:</font>
						<html:text property="answer(Object::Policy::OneSourceKey)" styleClass="txtbox" 	maxlength="8" styleId="OneSourceKey"  />
						</div>
						
						<h3>Name</h3>
						
							
								<div class="field" style="width:510px;">Insured Name Type
								<html:select name="AddCustomer" property="answer(Object::Customer::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation(this.form)">
										  <html:option value ="Company" styleClass="txtbox">Company</html:option>
										 <html:option value ="Person" styleClass="txtbox">Person</html:option>									    
								</html:select>
								</div> 
										
							
						<div class="field" style="width:510px;" id="insuredNameBlock" ><span id="InsName1"><font color="red">* Legal Name 1:</font></span>
							<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName" />
						</div>
						
						
						<div class="field" style="width:510px;" id="insuredNameBlock"><span id="InsName2">Legal Name 2:</span>
							<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName2)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName2" />
						</div>												
							
						<div class="field" style="width:510px;" id="DBABlock">Insured DBA
							<html:text  name="AddCustomer" property ="answer(Object::Customer::DBA)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="DBA" />
						</div>					
						<div class="field" id="industryBlock" style="width:545px;">Industry:<dmshtml:get_industry_name
							nameInSession="arListIndustry"
							ownerId="<%=Long.parseLong(ownerId.toString())%>"
							dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<html:select
							name="AddCustomer" property="answer(Object::Customer::IndustryName)"
							styleClass="txtbox" style="width:310px;" styleId="InsuredIndustryName">
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
						<h3>Primary Business Address</h3>
																
						<div class="field" style="width:510px;"><font color="red">* Address Line 1:</font>
							<html:text  name="AddCustomer" property="answer(Object::Customer::StreetName)" size="60" maxlength="50" styleClass="txtbox" styleId="Address1"/>
						</div>
						<div class="field" style="width:510px;">Address Line 2:
							<html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Address2"/>
						</div>
						<div class="field" style="width:510px;" ><font color="red">* City:</font>
						   <html:text name="AddCustomer" property="answer(Object::Customer::City)"  maxlength="40" styleClass="txtbox" styleId="City" />
						</div>
						
						<div class="field" style="width:510px;">County Name:
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
						
						<h3>Contact Information</h3>
						
						<div class="field" style="width:510px;">Email Address
							<html:text  name="AddCustomer" property ="answer(Object::Customer::EMailAddress)" onblur="checkEmailAddress(this.form)" size="30"  styleClass="txtbox" styleId="emailID" />
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

						<div class="field" style="width:510px;">Contact First Name
							<html:text  name="AddCustomer" property ="answer(Object::Customer::ContactFName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" />
						</div>
						<div class="field" style="width:510px;">Contact Last Name
							<html:text  name="AddCustomer" property ="answer(Object::Customer::ContactLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" />
						</div>	
						<div class="field" style="width:510px;">Contact Title
								<html:text  name="AddCustomer" property ="answer(Object::Customer::ContactTitle)"  size="4" styleClass="txtbox" styleId="ContactTitle" />
						</div>		
						<h3 id="CompanyInfmnBlock">Company Information</h3>
						<div class="field" style="width:510px;" id="CompanywebsiteBlock">Company website
							<html:text  name="AddCustomer" property ="answer(Object::Customer::ContactURL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" />
						</div>
						<div class="field" style="width:510px;" id="FOBBlock">Form of Business
							<html:select name="AddCustomer" property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.form)">
									<html:option value="">Select</html:option>	 
								    <html:option value="Corporation">Corporation</html:option>		    
								    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
								    <html:option value="Partnership">Partnership</html:option>		    
								    <html:option value="Joint Venture">Joint Venture</html:option>
								    <html:option value="Other">Other</html:option>
							</html:select>
						</div>
						<div class="field" style="width:510px;" id="otherFOBBlock">
							If Other,please Specify
							<html:textarea name="AddCustomer" property ="answer(Object::Customer::OtherBusiness)" rows="2" cols="30" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
						</div>
						<br/>
						<div class="field" style="width:510px;">
							<html:submit value="Next" property="amswer(button)" styleClass="covsmallbutton" style="width:100px;float:right;"/>										
						</div>
						</div>
						</div>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}%>


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

   
   <html:hidden property="answer(Object::Customer::CreatedBy)" value="<%=userName.toString()%>" />
   
   <html:hidden property="answer(Object::Customer::UpdatedBy)" value="<%=userName.toString()%>" />



<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />


<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />


<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />


   <html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
 

<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>

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
 
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%	if(!Customerid.equals("")){%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}	
%>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Insured"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Insured Management"%>"/>
<html:hidden property="answer(IsPopupEnabledAgencyFind)" value="true" styleId="IsPopupEnabledAgencyFind" />
<html:hidden property="answer(agencyId)" styleId="StyleAgencyId"/>
<html:hidden property="answer(AgentId)" styleId="StyleAgentId"/>
<html:hidden property="answer(Object::AGENCY::BUSINESSNAME)" styleId="StyleBusinessName" />	
<html:hidden property="answer(AgentNumber)" styleId="StyleAgentNumber" />	
<html:hidden property="answer(AgentFirstName)" styleId="StyleAgentFirstName" />	
<html:hidden property="answer(AgentLastName)" styleId="StyleAgentLastName" />	
<html:hidden property="answer(AgentMiddleName)" styleId="StyleAgentMiddleName" />	
<table style="display:none;">
<tr>
<td id="AgencyNameHeader">
</td>
</tr>
<tr>
<td id="AgentNameHeader">
</td>
</tr>
</table>
</html:form>

 
 <SCRIPT type="text/javascript">
    //alert("enter");
	var formElement=document.forms[0];	
	showCompanyInformation(formElement);
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