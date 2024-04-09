<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%> 

<div class="hd">Edit Agency Information</div>
<div class="bd" style="overflow:scroll; height:40em;">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<div class="formpage">
	
<div class="formhead"><h2 class="left">Agency Information</h2></div>
	



		<bean:define id="agencyId" property="answer(Object::Agency::AgencyIdTemp)" name="AddAgency" scope="session"/>
		<bean:define id="ParentAgencyId" property="answer(Object::Agency::ParentAgencyId)" name="AddAgency" scope="session"/>
		
		<bean:define id="agencyName" property="answer(Object::Agency::BusinessName)" name="AddAgency" scope="session"/>
		<div class="field" style="width:600px ;">Agency Name*:<input type="text" id="BusinessName" name="answer(Object::Agency::BusinessName)" size="100" maxlength="100" class="txtbox" value="<%=agencyName+"" %>" class="widthText"/></div>
		<bean:define id="agencyCode" property="answer(Object::Agency::AgencyCode)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Agency Code:<input type="text" name="answer(Object::Agency::AgencyCode)" size="20" maxlength="50" class="txtbox" value="<%=agencyCode+"" %>"></div>
		<bean:define id="generalAgencyName" property="answer(Object::Agency::ParentAgencyId)" name="AddAgency" scope="session"/>
		<div class="field" style="width:595px ;">Sub-producer to which General Agency*:		
<dmshtml:get_general_agencies nameInSession="arListgeneralagencies"  parentAgencyId="-1" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>													 
							<html:select styleId="GeneralAgency" property="answer(Object::Agency::ParentAgencyId)" styleClass="txtbox" value="<%=""+ParentAgencyId %>">
													  <html:option value ="">Select</html:option>
													  <html:option value ="0">None</html:option>
													  <logic:present name="arListgeneralagencies" scope="session">
													  <logic:iterate id="details" name="arListgeneralagencies" scope="session" >
					    							  <bean:define id='test' name="details"  property="answer(Object::Agency::AgencyIdTemp)" />
					   								  <html:option value ='<%=test.toString()%>'>
					       									<bean:write name="details" property="answer(Object::Agency::BusinessName)" />
					   								 </html:option>
													 </logic:iterate>
													 </logic:present>
													 </html:select>
		</div>
		<bean:define id="salesManager" property="answer(Agency::Like::BusinessName)" name="AddAgency" scope="session"/>
		<div class="field" style="width:600px ;">Sales Manager:<input type="text" name="answer(Agency::Like::BusinessName)" id="SalesManager" value="<%=salesManager+"" %>"></div>						
<bean:define id="agencyCommission" property="answer(Object::AgencyAdditional::AgencyCommission)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Agency Commission*:<input type="text" name="answer(Object::AgencyAdditional::AgencyCommission)" size="6" maxlength="6" styleClass="txtbox" id="AgencyCommission" value="<%=agencyCommission %>"></div>
<bean:define id="taxId" property="answer(Object::AgencyAdditional::TaxId)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Tax Id:<input type="text" name="answer(Object::AgencyAdditional::TaxId)" size="20" maxlength="20" styleClass="txtbox" value="<%=taxId+"" %>"></div>	
<bean:define id="stateLicenseNumber" property="answer(Object::Agency::StateLicenseNumber)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">State License #:<input type="text" name="answer(Object::Agency::StateLicenseNumber)" size="20" maxlength="20" styleClass="txtbox" value="<%=stateLicenseNumber+"" %>"></div>	
<bean:define id="licenseNumber" property="answer(Object::Agency::LicenseNumber)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">License #:<input type="text" name="answer(Object::Agency::LicenseNumber)" size="20" maxlength="20" styleClass="txtbox" value="<%=licenseNumber+"" %>"></div>								
<bean:define id="licenseeName" property="answer(Object::Agency::LicenseeName)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Licensee Name:<input type="text" name="answer(Object::Agency::LicenseeName)" size="20" maxlength="30" styleClass="txtbox" value="<%=licenseeName+"" %>"></div>				
<bean:define id="agencyStatus" property="answer(Object::Agency::Status)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:595px ;">Status:
		<select name="answer(Object::Agency::Status)" class="txtbox" value="<%=agencyStatus+"" %>">
		<% if(agencyStatus.equals("A")){%>
			<option value="A" selected>Account Current</option>
		<% }else {%>
			<option value="A">Account Current</option>
		<%}%>	
		
		
		<% if(agencyStatus.equals("N1")){%>
			<option value="N1" selected>NO BUSINESS - BAD PAY</option>
		<% }else {%>
			<option value="N1">NO BUSINESS - BAD PAY</option>
		<%}%>
		
		
		<% if(agencyStatus.equals("N2")){%>
			<option value="N2" selected>NO BUSINESS - INACTIVE</option>
		<% }else {%>
			<option value="N2">NO BUSINESS - INACTIVE</option>
		<%}%>
		
		<% if(agencyStatus.equals("N3")){%>
			<option value="N3" selected>NO BUSINESS - OUT OF BUSINESS</option>
		<% }else {%>
			<option value="N3">NO BUSINESS - OUT OF BUSINESS</option>
		<%}%>	
		
		<% if(agencyStatus.equals("N4")){%>
			<option value="N4" selected>NO BUSINESS - CROSS-REFERENCED</option>
		<% }else {%>
			<option value="N4">NO BUSINESS - CROSS-REFERENCED</option>
		<%}%>
		
		<% if(agencyStatus.equals("N5")){%>
			<option value="N5" selected>NO BUSINESS - INSUFFICIENT VOLUME</option>
		<% }else {%>
			<option value="N5">NO BUSINESS - INSUFFICIENT VOLUME</option>
		<%}%>	
		
		<% if(agencyStatus.equals("C1")){%>
			<option value="C1" selected>CASH WITH APP</option>
		<% }else {%>
			<option value="C1">CASH WITH APP</option>
		<%}%>	
		
		<% if(agencyStatus.equals("C2")){%>
			<option value="C2" selected>FAXED AGREEMENT- ACQUIRED</option>
		<% }else {%>
			<option value="C2">FAXED AGREEMENT- ACQUIRED</option>
		<%}%>
		
		<% if(agencyStatus.equals("H")){%>
			<option value="H" selected>HOLD - SEE ACCOUNTING</option>
		<% }else {%>
			<option value="H">HOLD - SEE ACCOUNTING</option>
		<%}%>	
		
		<% if(agencyStatus.equals("P")){%>
			<option value="P" selected>PENDING - NEED BRKR AGREE. TO BIND</option>
		<% }else {%>
			<option value="P">PENDING - NEED BRKR AGREE. TO BIND</option>
		<%}%>
		
		<% if(agencyStatus.equals("R")){%>
			<option value="R" selected>RENEWALS ONLY - NO NEW BUSINESS</option>
		<% }else {%>
			<option value="R">RENEWALS ONLY - NO NEW BUSINESS</option>
		<%}%>
		
		<% if(agencyStatus.equals("R1")){%>
			<option value="R1" selected>RENEWALS ONLY - CASH WITH APP</option>
		<% }else {%>
			<option value="R1">RENEWALS ONLY - CASH WITH APP</option>
		<%}%>
		
		<% if(agencyStatus.equals("X2")){%>
			<option value="X2" selected>AcelaRate</option>	
		<% }else {%>
			<option value="X2">AcelaRate</option>	
		<%}%>										
												
		</select>
<bean:define id="startMonth" property="answer(StartMonth)" name="AddAgency" scope="session"/>		
<bean:define id="startDate" property="answer(StartDate)" name="AddAgency" scope="session"/>		
<bean:define id="startYear" property="answer(StartYear)" name="AddAgency" scope="session"/>		
	</div>				
		<div class="field" style="width:535px ;">Contract Start Date:
				<input type="text"  property ="answer(StartMonth)" style="width:20px ;"  maxlength="2" styleClass="txtbox" id="StartMonth" onkeyup="if(this.value.length==2) {document.forms[0].StartDate.focus()}" value="<%=startMonth+"" %>">&nbsp;
				<input type="text"  property ="answer(StartDate)"  style="width:20px ;"  maxlength="2" styleClass="txtbox" id="StartDate" onkeyup="if(this.value.length==2) {document.forms[0].StartYear.focus()}" value="<%=startDate+"" %>">&nbsp;
				<input type="text"  property ="answer(StartYear)"  style="width:40px ;"  maxlength="4" styleClass="txtbox" id="StartYear" value="<%=startYear+"" %>">&nbsp;(MM/DD/YYYY)
		</div>		
<bean:define id="endMonth" property="answer(EndMonth)" name="AddAgency" scope="session"/>				
<bean:define id="endDate" property="answer(EndDate)" name="AddAgency" scope="session"/>		
<bean:define id="endYear" property="answer(EndYear)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:535px ;">Contract End Date:
				<input type="text"  property ="answer(EndMonth)" style="width:20px ;"  maxlength="2" styleClass="txtbox" id="EndMonth" onkeyup="if(this.value.length==2) {document.forms[0].EndDate.focus()}" value="<%=endMonth+"" %>">&nbsp;
				<input type="text"  property ="answer(EndDate)"  style="width:20px ;"  maxlength="2" styleClass="txtbox" id="EndDate" onkeyup="if(this.value.length==2) {document.forms[0].EndYear.focus()}" value="<%=endDate+"" %>">&nbsp;
				<input type="text"  property ="answer(EndYear)"  style="width:40px ;"  maxlength="4" styleClass="txtbox" id="EndYear" value="<%=endYear+"" %>">&nbsp;(MM/DD/YYYY)

		</div>	
		<h3>Principal Business Address</h3>
		

<bean:define id="address1" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)" name="AddAgency" scope="session"/>				
		<div class="field" style=" width:585px ;height:40px;">Address 1:&nbsp;&nbsp;&nbsp;
		<textarea name='answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)' cols='30' rows='2'><%=address1+"" %></textarea>
		</div>
<bean:define id="address2" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address2)" name="AddAgency" scope="session"/>				
		<div class="field" style=" width:585px ;height:40px;">Address 2:&nbsp;&nbsp;&nbsp;
		<textarea name="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address2)"  rows="2" cols="30"><%=address2+"" %></textarea>
		
		</div>
<bean:define id="city" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" name="AddAgency" scope="session"/>				
		<div class="field" style="width:600px ;">City:<input type="text" name="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" maxlength="30" styleClass="txtbox"  id="City"  value="<%=city+"" %>"></input>
		</div>
<bean:define id="state" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)" name="AddAgency" scope="session"/>	
		
		<div class="field" style="width:595px ;">State*:
		<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<select name="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)"  id="State" class="txtbox">
				<option value ="">Select</option>
		        <logic:present name="arStates" scope="request">
		           <logic:iterate id="details" name="arStates" scope="request" >
				    <bean:define id='test' name="details"  property="typeDesc" />
				    
		<% if(test.equals(state)){%>
			<option value ='<%=test.toString()%>' selected="selected">
		<% }else {%>
			<option value ='<%=test.toString()%>'>
		<%}%>

				       <bean:write name="details" property="dmsType" />
				    </option>

				</logic:iterate>
				</logic:present>
		</select>											  
		
		</div>
<bean:define id="zip" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" name="AddAgency" scope="session"/>				
		<div class="field" style="width:600px ;">Zip*:<input type="text" name="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" style="width:220px;" maxlength="10" class="txtbox" id="Zip" value=<%=zip+"" %>>
		<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" ><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County." ></a></div>
<bean:define id="country" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" name="AddAgency" scope="session"/>				
		<div class="field" style="width:507px ;">Country:
		
	<% if(country.equals("US")){%>
		<input type="radio" name = "answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" style="width:20px;" value="US" checked/><bean:message key="GeneralAgency.us"/>&nbsp;&nbsp;&nbsp;
	
	<%}else { %>
		<input type="radio" name = "answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" style="width:20px;" value="US"/><bean:message key="GeneralAgency.us"/>&nbsp;&nbsp;&nbsp;
	<%} %>			
		<% if(country.equals("Canada")){%>
		<input type="radio" name ="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" style="width:20px;" value="Canada" checked/><bean:message key="GeneralAgency.canada"/>												
	<%}else { %>						
		<input type="radio" name ="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" style="width:20px;" value="Canada"/><bean:message key="GeneralAgency.canada"/>												
	<%} %>						
		</div>
<bean:define id="phone" property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::WorkPhone)" name="AddAgency" scope="session"/>				
		<div class="field"  style="width:600px ;"">Phone:<input type="text" name="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::WorkPhone)"  maxlength="30" id="BusinessPhoneNum" class="txtbox" value=<%=phone+"" %>>
		</div>
<bean:define id="fax" property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Fax)" name="AddAgency" scope="session"/>				
		<div class="field" style="width:600px ;">Fax:<input type="text" name="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Fax)"  maxlength="30" id="BusinessFaxNum" class="txtbox" value=<%=fax+"" %>></div>
<bean:define id="url" property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Url)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;"> Web Site:<input type="text" name="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Url)"  maxlength="30" id="BusinessContactUrl" class="txtbox" value=<%=url+"" %>></div>		

			<h3>Personal Information for Agency Administrative User</h3>
<bean:define id="firstName" property="answer(Object::AgencyAdditional::firstname)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">First Name:<input type="text" name="answer(Object::AgencyAdditional::firstname)" size="20" maxlength="20" styleClass="txtbox" value="<%=firstName+"" %>"></div>					
<bean:define id="lastName" property="answer(Object::AgencyAdditional::lastname)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Last Name:<input type="text" name="answer(Object::AgencyAdditional::lastname)" size="20" maxlength="20" styleClass="txtbox" value="<%=lastName+"" %>"></div>	
<bean:define id="middleName" property="answer(Object::AgencyAdditional::middlename)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Middle Name:<input type="text" name="answer(Object::AgencyAdditional::middlename)" size="20" maxlength="20" styleClass="txtbox" value="<%=middleName+"" %>"></div>	
<bean:define id="jobTitle" property="answer(Object::AgencyAdditional::jobtitle)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Job Title:<input type="text" name="answer(Object::AgencyAdditional::jobtitle)" size="20" maxlength="20" styleClass="txtbox" value="<%=jobTitle+"" %>"></div>	
<bean:define id="jobFunction" property="answer(Object::AgencyAdditional::jobfunction)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Job Function:<input type="text" name="answer(Object::AgencyAdditional::jobfunction)" size="20" maxlength="20" styleClass="txtbox" value="<%=jobFunction+"" %>"></div>	
<bean:define id="HomePhone" property="answer(Object::Agency::Contacts::HOME::Object::Contact::HomePhone)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Phone:<input type="text" name="answer(Object::Agency::Contacts::HOME::Object::Contact::HomePhone)" size="20" maxlength="20" styleClass="txtbox" id="PersonalPhoneNum" value="<%=HomePhone+"" %>"></div>	
<bean:define id="fax" property="answer(Object::Agency::Contacts::HOME::Object::Contact::Fax)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Fax:<input type="text" name="answer(Object::Agency::Contacts::HOME::Object::Contact::Fax)" size="20" maxlength="20" styleClass="txtbox" id="PersonalFaxNum" value="<%=fax+"" %>"></div>	
<bean:define id="EMailAddress" property="answer(Object::Agency::Contacts::HOME::Object::Contact::EMailAddress)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">E-Mail:<input type="text" name="answer(Object::Agency::Contacts::HOME::Object::Contact::EMailAddress)" size="50" maxlength="90" styleClass="txtbox" value="<%=EMailAddress+"" %>"></div>	


<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">
			<h3>Branch Information</h3>
<bean:define id="branchName" property="answer(Object::Agency::BranchName)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Branch Name:
			<select name="answer(Object::Agency::BranchName)" id="BranchName" class="txtbox" value="<%=branchName+"" %>">
		<% if(branchName.equals("Toronto")){%>
				<option value ="Toronto" selected>Toronto</option>
		<% }else {%>
				<option value ="Toronto">Toronto</option>
		<%}%>

		<% if(branchName.equals("Calgary")){%>
				<option value ="Calgary" selected>Calgary</option>
		<% }else {%>
				<option value ="Calgary">Calgary</option>
		<%}%>

		<% if(branchName.equals("Puerto Rico")){%>
				<option value ="Puerto Rico" selected>Puerto Rico</option>
		<% }else {%>
				<option value ="Calgary">Puerto Rico</option>
		<%}%>

		<% if(branchName.equals("Boston")){%>
				<option value ="Boston" selected>Boston</option>
		<% }else {%>
				<option value ="Calgary">Boston</option>
		<%}%>

		<% if(branchName.equals("Miami")){%>
				<option value ="Miami" selected>Miami</option>
		<% }else {%>
				<option value ="Miami">Miami</option>
		<%}%>

		<% if(branchName.equals("New York")){%>
				<option value ="New York" selected>New York</option>
		<% }else {%>
				<option value ="New York">New York</option>
		<%}%>

		<% if(branchName.equals("San Francisco")){%>
				<option value ="San Francisco" selected>New York</option>
		<% }else {%>
				<option value ="San Francisco">New York</option>
		<%}%>
			</select>				
		</div>	
</dmshtml:dms_static_with_connector>
			<h3>Remarks</h3>
<bean:define id="comments" property="answer(Object::AgencyAdditional::comments)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:585px ;height:40px;">Comments: <textarea name='answer(Object::AgencyAdditional::comments)' cols='30' rows='2'><%=comments+"" %></textarea></div>	

<bean:define id="active" property="answer(Object::Agency::Active)" name="AddAgency" scope="session"/>		
		<div class="field" style="width:600px ;">Active:
	<select name="answer(Object::Agency::Active)" id="Active" class="txtbox" value="<%=active+"" %>">
		<% if(active.equals("Y")){%>
					 <option value ='Y' selected>Yes</option>
		<% }else {%>
					 <option value ='Y'>Yes</option>
		<%}%>
		
		<% if(active.equals("N")){%>
					 <option value ='N' selected>No</option>
		<% }else {%>
					 <option value ='N'>No</option>
		<%}%>
	</select>				
		</div>
	<table align="center"><tr>
	<td>	
		<input type="button" class="covbutton" value="Save" onclick="callSubmitEditAgency();" style="width:60px;">
	</td>
	<td>
		<input type="button" class="covbutton" value="Cancel" onclick="closeContainer();" style="width:60px;">
	</td>
</tr>
</table>
	
	<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>
	<html:hidden property="answer(Object::UserDetail::roleName)" value=""/>
	<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
	<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 

	<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="" />
	<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="" />
	<html:hidden property="page" value="6" />
	
	<bean:define id="County1" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::County)" name="AddAgency" scope="session"/>		
	
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::County)"  styleId="County" value="<%=""+County1 %>"/>
	<html:hidden property="answer(Object::Agency::SiteId)" value="1"  />
	<html:hidden property="answer(Object::Agency::ObjectType)" value="agency"   />
		
 	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
	<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />
    <html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />

	<html:hidden property="answer(Object::Agency::OwnerId)" value="<%=""+ownerId %>" />

	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />
    <html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
    <html:hidden property="answer(Object::UserDetail::User)" value="<%=userName.toString()%>" />
 	<html:hidden  property="answer(rule_execution_staus)" value=""/>
    <html:hidden property="formName" value="Agency::AddAgency" />
    <html:hidden property="answer(form::ForwordControl)" value="success"/>

	<!-- Code to Prevent the back Button Issue-->
	
	<%if(! agencyId.equals("")) {%>
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyId+""%>"  />
	<%} %>

	<bean:define id="ParAgencyId" name="AddAgency" property="answer(Object::Agency::ParentAgencyId)"/> 
	<%if(! ParAgencyId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::ParentAgencyId)" value="<%=ParAgencyId.toString()%>"  />
	<%} %>


	<!-- Passing Agency Address ID -->
	<bean:define id="AgencyPrimaryAddressId" name="AddAgency" property="answer(Object::Agency::PrimaryAddressId)"/> 

	<%if(AgencyPrimaryAddressId==null) {%>
	<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="0"  />
	<%} else if(! AgencyPrimaryAddressId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="<%=AgencyPrimaryAddressId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="0"  />
	<%}%>
	<!-- Passing Agency BUSINESS Address ID -->
	<bean:define id="AgencyBusinessAddressId" name="AddAgency" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)"/> 

	<%if(AgencyBusinessAddressId==null) {%>
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
	<%} else if(! AgencyBusinessAddressId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="<%=AgencyBusinessAddressId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
	<%}%>

	<!-- Passing Agency HOME Address ID -->
	<bean:define id="AgencyHomeAddressId" name="AddAgency" property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)"/> 

	<%if(AgencyHomeAddressId==null) {%>
	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="0"  />
	<%} else if(! AgencyHomeAddressId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="<%=AgencyHomeAddressId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="0"  />
	<%}%>

	<input type=hidden name="answer(forwardNavigate)" value="success" />

	<!-- Passing Primary Agency Contact ID -->
	<bean:define id="AgencyPrimaryContactId" name="AddAgency" property="answer(Object::Agency::PrimaryContactId)"/> 
	<bean:define id="UserName1" name='AddAgency' property='answer(Object::UserDetail::userName)'/>
	<bean:define id="passWord" name='AddAgency' property='answer(Object::UserDetail::passWord)'/>
	<bean:define id="passWordConfirm" name='AddAgency' property='answer(Object::UserDetail::passWordConfirm)'/>
	
	<html:hidden property="answer(Object::UserDetail::userName)" value="<%=UserName1.toString()%>"  />
	<html:hidden property="answer(Object::UserDetail::passWord)" value="<%=passWord.toString()%>"  />
	<html:hidden property="answer(Object::UserDetail::passWordConfirm)" value="<%=passWordConfirm.toString()%>"  />
	<%if(AgencyPrimaryContactId==null) {%>
	<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="0"  />
	<%} else if(! AgencyPrimaryContactId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="<%=AgencyPrimaryContactId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="0"  />
	<%}%>

	<!-- Passing BUSINESS Agency Contact ID -->
	<bean:define id="AgencyBusSinessContactId" name="AddAgency" property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)"/> 

	<%if(AgencyBusSinessContactId==null) {%>
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
	<%} else if(! AgencyBusSinessContactId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="<%=AgencyBusSinessContactId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
	<%}%>
	<!-- Passing HOME Agency Contact ID -->
	<bean:define id="AgencyHomeContactId" name="AddAgency" property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)"/> 

	<%if(AgencyHomeContactId==null) {%>
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
	<%} else if(! AgencyHomeContactId.toString().equals("")) {%>
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="<%=AgencyHomeContactId.toString()%>"  />
	<%} else {%>
	<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
	<%}%>
	<html:hidden property="answer(Object::Agency::User)" value="<%=userName.toString()%>" />
	<html:hidden property="answer(Object::Agency::Active)" value="Y" />
	<html:hidden property="answer(Object::AgencyAdditional::Dcco1)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::Dcco2)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::Dcco3)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity1)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity2)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity3)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity4)" value=""/>
	<html:hidden property="answer(Object::AgencyAdditional::BRPrioity5)" value=""/>
	
		
		
</div


</div>
<a class="container-close" href="javascript:void(0);" onclick="closeContainer()" id="closeIcon3"></a>



		
		
	

  	