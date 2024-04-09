<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AddAdditionalInsured.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
<bean:define id="CustomerName" name="AddCustomer" property="answer(Object::Customer::CustomerName)" scope="session"/>
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<bean:define id="additionalInsuredId" property="answer(Object::AdditionalInsured::AdditionalInsuredID)" name="AdditionalInsured" />
<bean:define id="AdditionalyNamedInsured" property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" name="AdditionalInsured" />
<bean:define id="submissionId" property="answer(submissionId)" name="AdditionalInsured"></bean:define>
<bean:define id="submissionVerId" property="answer(submissionVerId)" name="AdditionalInsured"></bean:define>
<html:form action="/SaveAdditionalInsuredAction" onsubmit="return Validate();">



<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
	<%
	  String nameFieldLength =(String) request.getAttribute("paramValue");
	if (nameFieldLength.length() <= 0 && nameFieldLength == null){
		 nameFieldLength = "60";								   
	  }
	
	%>
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td>
	
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
	<tr><td>&nbsp;</td></tr>	
	<tr><td>
		<jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>
	</logic:notEqual>
    
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			
			<tr><td><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+Customerid%>" title="<bean:message key='ToolTip.AdditionalInsuredInfo.InsuredSummary'/>" class="button2" style="width:150px" >Go To Insured Summary</a></td></tr>
			<tr bordercolor="red">
				<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
			</tr>
			<tr bordercolor="red">             
				
				<td class="sectionhead" colspan="4" align="center">ADD/EDIT ADDITIONAL INSURED INFORMATION</td>
				
			</tr>
			<tr>
				<td >&nbsp; </td>
			</tr>	
			<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Additional Insured Type</td>
			<td>
			 <html:radio name="AdditionalInsured" onclick="callShowInsuredInformation()" property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="N" styleId="insured" > </html:radio>
			Additional Insured&nbsp;&nbsp;&nbsp;&nbsp;
			
			 <html:radio name="AdditionalInsured" onclick="callShowInsuredInformation()" property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="Y" styleId="namedInsured" > </html:radio>Additional Named Insured
			</td>
			</tr>
			
			<dmshtml:GetParameterByOwnerId nameInSession="isWaivaerOfSurogationRequired" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="INSURED_REQUIRED_WAIVER_OF_SUROGATION" />	
			<dmshtml:GetParameterByOwnerId nameInSession="isPrimaryContributoryRequired" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="INSURED_REQUIRED_PRIMARY_CONTRIBUTORY" />					
			<%
			String isWaivaerOfSurogationRequired =(String) request.getAttribute("isWaivaerOfSurogationRequired");
			String isPrimaryContributoryRequired =(String) request.getAttribute("isPrimaryContributoryRequired");					
			%>
						
			<tr>
			<dmshtml:get_type nameInSession="arStates"  dcdObjectType="INSURED_TYPE" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>

			<td class="FormLabels" align="left">&nbsp;&nbsp;Insured  Type *</td>
			<td class="links" style="Class:txtbox">&nbsp;
			
			<dmshtml:get_DropDown_Values nameInSession="dropDownValues"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" lookupType="Additional_Insured_Type" ownerId='<%=ownerId+""%>' />
	

			<logic:present name="dropDownValues" scope="request">	
			<bean:define id="dropDownValues" name="dropDownValues" type="java.util.ArrayList"/>										
			<html:select property="answer(Object::AdditionalInsured::InsuranceType)" styleClass='txtbox' styleId="AdditionalInsuredType" >
			<%for(int i=0;i<dropDownValues.size();i++) {
				com.dms.ejb.data.QuestionHashMap dropDownMap=(com.dms.ejb.data.QuestionHashMap)dropDownValues.get(i);	
			%>

			<html:option value ='<%=dropDownMap.getString("DropDownValue")%>'>
			<%=dropDownMap.getString("DropDownDescription")%></html:option>										
			<%}%>
			</html:select>
			</logic:present>

			</td>
			</tr>
			
		<tr>
			<%if (isPrimaryContributoryRequired.equalsIgnoreCase("YES")){ %>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Primary and Contributory Wording</td>
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="AdditionalInsured" property="answer(Object::AdditionalInsured::IsPrimaryAndContributoryWording)" styleClass="txtbox" styleId="IsPrimaryAndContributoryWording">
					<html:option value="N">No</html:option>	
					<html:option value="Y">Yes</html:option>	 
				    	    
				    
			</html:select>
			<%} %>
			</td>
		</tr>	
		<tr>
			<%if (isWaivaerOfSurogationRequired.equalsIgnoreCase("YES")){ %>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Waiver of Subrogation</td>
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="AdditionalInsured" property="answer(Object::AdditionalInsured::IsWaiverOfSubrogation)" styleClass="txtbox" styleId="IsWaiverOfSubrogation">
					<html:option value="N">No</html:option>	
					<html:option value="Y">Yes</html:option>	 
				</html:select>
			<%} %>	
			</td>
		</tr>		
			<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Insured Name Type</td>
			<td class="links" style="Class:txtbox">&nbsp;<html:select value="Company" name="AdditionalInsured" property="answer(Object::AdditionalInsured::CompanyPerson)" styleClass="txtbox" styleId="CompanyPerson" onchange="showCompanyInformation(this.form)">
					 <html:option value ="Person" styleClass="txtbox">Person</html:option>
				     <html:option value ="Company" styleClass="txtbox">Company</html:option>
			</html:select>
			</td>
		</tr> 
		<!-- <tr id="insuredFirstBlock">
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Insured First Name</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::InsuredFName)" size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredFName" /></td>
		</tr>-->
		
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Legal Name 1 *</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::InsuredName)" size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Legal Name 2</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::InsuredLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredLName" /></td>
		</tr> 
		<tr id="DBABlock">
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;DBA/TA</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::DBA)" size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="DBA" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Name Code</td>
			<td>
			 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>' connector='or' negated="true">
				&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::InsuredNumber)" size="8" maxlength="8" styleClass="txtbox" />
			 </dmshtml:dms_static_with_connector>
			  <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>' connector='or' negated="false">	
			    &nbsp;<bean:write name="AdditionalInsured" property ="answer(Object::AdditionalInsured::InsuredNumber)" />
			  </dmshtml:dms_static_with_connector>
			</td>
			 
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Loan/Account/Reference Number (if any)</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::LoanNumber)" styleClass="txtbox" styleId="LoanNumber" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Number</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::StreetNumber)" styleClass="txtbox" styleId="StreetNumber" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Name 1</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::StreetName)" size="60" maxlength="50" styleClass="txtbox" styleId="Street2" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Street Name 2</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Street2" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;City</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::City)" size="20" maxlength="40" styleClass="txtbox" styleId="City" /></td>
		</tr>
		<tr>
			<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;County Name</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::County)" size="20" maxlength="20" styleClass="txtbox" styleId="County" /></td>
		</tr>
		<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;State/Province*</td>
		
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="AdditionalInsured" property="answer(Object::AdditionalInsured::State)" styleClass="txtbox" styleClass="txtbox" styleId="State">
				<html:option value ="" styleClass="txtbox">Select A State</html:option>
				   		
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
			<td class="FormLabels" align="left">&nbsp;&nbsp;Zip Code*</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property="answer(Object::AdditionalInsured::Zip)" size="10" maxlength="10" styleClass="txtbox" styleId="Zip" onkeyup="if(this.value.length==5) {this.value=this.value}"/>
			<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AdditionalInsured&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a></td>
			<!-- 05-06-2006 end-->																	
		</tr>							
		<tr>
			<td class="FormLabels" align="left">&nbsp;&nbsp;Country</td>
		
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="AdditionalInsured" property="answer(Object::AdditionalInsured::Country)" styleClass="txtbox" styleId="Country">
				<html:option value ="USA" styleClass="txtbox">United States</html:option>									   		   
				</html:select>
			</td>
		</tr>
		<tr id="CompanyFNameBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact First Name</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::Contact::FName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" />
			</td>
		</tr>
		<tr id="CompanyLNameBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Last Name</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::Contact::LName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" />
			</td>
		</tr>
		<tr id="CompanyTitleBlock" >
			<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Title</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::Contact::Title)"  size="4" styleClass="txtbox" styleId="ContactTitle" />
			</td>
		</tr>
		<tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Email Address</td>
				<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::Contact::EmailAddress1)" onblur="" size="30"  styleClass="txtbox" styleId="emailID" />
				</td>
			</tr>
			
			 <tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Phone #</td>
				<td class="links">&nbsp;<dmshtml:dms_text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::WorkPhoneAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber1"  onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::WorkPhoneExchgCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber2" onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::WorkPhone)"  size="4" maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" /></td>
			</tr>	
			<tr>
				<td class="FormLabels" align="left">&nbsp;&nbsp;Fax #</td>
				<td class="links">&nbsp;<dmshtml:dms_text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::FaxAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber1" onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::FaxExchgCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber2" onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::Fax)"  size="4" maxlength="4" styleClass="txtbox" styleId="FaxNumber3"/></td>
		</tr>	
		
		<tr id="CompanywebsiteBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Company website</td>
			<td class="links">&nbsp;<html:text  name="AdditionalInsured" property ="answer(Object::AdditionalInsured::Contact::URL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" />
			</td>
	</tr>
			
		<tr id="FOBBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;Form of Business</td>
			<td class="links" style="Class:txtbox">&nbsp;<html:select name="AdditionalInsured" property="answer(Object::AdditionalInsured::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.form)">
					<html:option value="">Select</html:option>	 
				    <html:option value="Corporation">Corporation</html:option>		    
				    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
				    <html:option value="Partnership">Partnership</html:option>		    
				    <html:option value="Joint Venture">Joint Venture</html:option>
				    <html:option value="Other">Other</html:option>
			</html:select>
			</td>
		</tr> 
		<tr id="otherFOBBlock">
			<td class="FormLabels" align="left">&nbsp;&nbsp;If Other,please Specify</td>
			<td class="links">&nbsp;<html:textarea name="AdditionalInsured" property ="answer(Object::AdditionalInsured::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
			</td>
		</tr>
		
		<tr><td>&nbsp;</td></tr>
		</table>
		<table width="100%">
		<tr>
		<td align="left" width="30%" >
			&nbsp;			
			</td><td align="left">
			<html:submit value="Save" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
		
		</td>
	</tr>
	</table>
	</td></tr>
	</table>
	<html:hidden property="answer(Object::AdditionalInsured::AdditionalInsuredID)" value="<%=additionalInsuredId.toString()%>" />
	<html:hidden property="answer(Object::AdditionalInsured::AdditionalyNamedInsured)" value="<%=AdditionalyNamedInsured.toString() %>" />
	
	<html:hidden  property="answer(Object::AdditionalInsured::AdditionalInsuredID)" value="<%= ""+additionalInsuredId%>" />
   
	<html:hidden property="answer(Object::AdditionalInsured::CustomerID)" value="<%=Customerid.toString()%>" />
    <html:hidden property="answer(Object::AdditionalInsured::CreatedBy)" value="<%=usernameId.toString()%>" />   
   <html:hidden property="answer(Object::AdditionalInsured::UpdatedBy)" value="<%=usernameId.toString()%>" />
      <html:hidden property="answer(Object::AdditionalInsured::OwnerId)" value="<%=ownerId.toString()%>" />
      <html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Insured"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Insured Management"%>"/>
 <html:hidden property="answer(pageType)" value = "ADDITIONAL_INSURED"/>
  <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<html:hidden property="InsuredSummaryActiveTab" value="additionalInsuredTab" />
	</html:form>
	
 <SCRIPT type="text/javascript">
 callShowInsuredInformation();
function callShowInsuredInformation(){
	var formElement = document.forms[0];
	if(formElement.namedInsured.checked){
		showInsuredInformation('Y');
 	}else{
 		showInsuredInformation('N');
 	}	
 	showCompanyInformation(formElement);
 }
 
</SCRIPT>	