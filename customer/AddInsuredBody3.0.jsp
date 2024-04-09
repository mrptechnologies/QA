<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>


<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>

<%String customerId="";%>
<%String cusState="";%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
 <logic:present name ='arrObjectDetail' scope ='session'>
	<logic:iterate id="arrObjectDetail" name="arrObjectDetail" scope="session" >
		<bean:define id="custid" name="arrObjectDetail" property="id"/> 
		<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/> 
		 <%customerId=""+custid;%>
		 <%cusState=""+custState;%>
    </logic:iterate>
 </logic:present>

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
<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
<tr>
  <td>&nbsp;</td>
</tr>
<tr>
  <td> 
    <div  style ="font-style:bolditalic;font-size:14pt;"><bean:write name='AddCustomer' property='answer(Object::Customer::CustomerName)'/></div>
  </td>
</tr>
<tr>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>&nbsp;</td>
</tr>
</table>
<div  id="Doc" style="display:block">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center" >	 
   <tr>
     <td  valign="bottom" height="25">
      <table border="0" cellpadding="0" cellspacing="0" >	 
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="145px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="BasicInformationTab" onclick="javascript:loadBasicInformationTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Basic Information</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="images/spacer.gif" width="30" height="4" ></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="145px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  id="LocationsTab"  onclick="javascript:loadLocationsTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="images/spacer.gif" width="30" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="145px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="SubmissionsTab" onclick="javascript:loadSubmissionsTab(this.id);">
				<tr>
					<td align="center" Style="Cursor:hand">Submissions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="images/spacer.gif" width="30" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="145px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="QuotesTab" onclick="javascript:loadQuotesTab(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand" >Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="images/spacer.gif" width="30" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="145px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="PoliciesTab" onclick="javascript:loadPoliciesTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Policies</td>
				</tr>
			</table>
         </td>
        </tr>
   </table> 
  </td>
</tr>
<tr>
<td>
<div class="formpage02">
  	<table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
	 <tr>
	  <td align="left" valign="top">
	   	<div id="InsuredDiv">
    	  <table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
    	       <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
	        <td  colspan="2"><h3>Name</h3></td>
	       </tr>
	       <tr>
			<td  width="19%" align="right" class="field">Insured Name Type:</td>
			<td width="81%" align="left">
			 <html:select name="AddCustomer" property="answer(Object::Customer::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation(this.form)">
					 <html:option value ="Person" styleClass="txtbox">Person</html:option>
				     <html:option value ="Company" styleClass="txtbox">Company</html:option>
			 </html:select>
			</td>
		   </tr> 
		   <dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
			<%
			  String nameFieldLength =(String) request.getAttribute("paramValue");
			if (nameFieldLength.length() <= 0 && nameFieldLength == null){
				 nameFieldLength = "60";								   
			  }
			
			%>
           <tr>
			<td width="19%" align="right" class="field" id="insuredNameBlock">* Legal Name 1:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field" id="insuredNameBlock">Legal Name 2:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName2)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName2" /></td>
	       </tr>
	       <tr id="DBABlock">
			<td width="19%" align="right" class="field">Insured DBA:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::DBA)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="DBA" /></td>
	       </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
	        <td  colspan="2"><h3>Address</h3></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Address Line 1:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address1)" size="60" maxlength="50" styleClass="txtbox" styleId="Address1"/></td>
	      </tr>
	      <tr>
			<td width="19%" align="right" class="field">Address Line 2:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Address2"/></td>
	      </tr>
	      <tr>
				<td width="19%" align="right" class="field">City:</td>
				<td width="81%" align="left"><html:text name="AddCustomer" property="answer(Object::Customer::City)"  maxlength="40" styleClass="txtbox" styleId="City" /></td>
		  </tr>
		  <tr>
			<td width="19%" align="right" class="field">State/Province:</td>
			<td width="81%" align="left">
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
			</td>
	      </tr>
	      <tr>
				<td width="19%" align="right" class="field">Zip Code:</td>
				<td width="81%" align="left">
				 <html:text name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:150px;" styleClass="txtbox" styleId="Zip" />
            	  <a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/FindZipCode.jpg" BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>		
            	</td>
		  </tr>
		  <tr>
			<td width="19%" align="right" class="field">Country:</td>
			<td width="81%" align="left">
			    <html:select name="AddCustomer" property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
                  <html:option value="USA" styleClass="txtbox">United States</html:option>
                </html:select>
			</td>
		  </tr>	
		  <tr>
			<td colspan="2" class="field1">Do you wish to lock Mailing address getting updated through Clearance database download?
			
			 <html:radio name="AddCustomer" property="answer(Object::Customer::NameType)"  style="width:18px;"  value="Yes">Yes</html:radio>
             <html:radio name="AddCustomer" property="answer(Object::Customer::NameType)"  style="width:18px;" value="No">No</html:radio>
		    </td>
	      </tr> 
		  <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
	        <td  colspan="2"><h3>Contact Information</h3></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Email Address:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::EMailAddress)" onblur="checkEmailAddress(this.form)" size="30"  styleClass="txtbox" styleId="emailID" /></td>
	       </tr>	    
	       <tr>
			<td width="19%" align="right" class="field">Phone Number:</td>
			<td width="81%" align="left">
			  <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="PhoneNumber1" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}" />&nbsp;
              <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox"
								styleId="PhoneNumber2" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}" />&nbsp;
              <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhone)"  style="width:60px;"
								maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" />
			</td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Fax Number:</td>
			<td width="81%" align="left">
			   <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber1"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}" />&nbsp;
               <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber2"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}" />&nbsp;
               <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::Fax)" style="width:60px;  "
								maxlength="4" styleClass="txtbox" styleId="FaxNumber3" />
			</td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact First Name:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactFName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact Last Name:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact Title:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactTitle)"  size="4" styleClass="txtbox" styleId="ContactTitle" /></td>
	       </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr id="CompanyInfmnBlock">
	        <td  colspan="2"><h3>Company Information</h3></td>
	       </tr>
	       <tr id="CompanywebsiteBlock">
			<td width="19%" align="right" class="field">Website:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactURL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" /></td>
	       </tr>
           <tr id="FOBBlock">
			<td width="19%" align="right" class="field">Form of Business:</td>
			<td width="81%" align="left">
			  <html:select name="AddCustomer" property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.value)">
				<html:option value="select">Select</html:option>	 
			    <html:option value="Corporation">Corporation</html:option>		    
			    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
			    <html:option value="Partnership">Partnership</html:option>		    
			    <html:option value="Joint Venture">Joint Venture</html:option>
			    <html:option value="Other">Other</html:option>
			</html:select>
			</td>
	       </tr>
	       <tr id="otherFOBBlock">
				<td width="19%" align="right" class="field">If Other,please Specify&nbsp;&nbsp;</td>
				<td width="81%" align="left">&nbsp;&nbsp;&nbsp;<html:textarea name="AddCustomer" property ="answer(Object::Customer::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
				</td>
		   </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	     </table>
	    </div>
	  
	    
	    <div id="BasicInformationDiv" style="display:none">
	     <table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
          <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
	        <td  colspan="2"><h3>Name</h3></td>
	       </tr>
	       <tr>
			<td  width="19%" align="right" class="field">Insured Name Type:</td>
			<td width="81%" align="left">
			 <html:select name="AddCustomer" property="answer(Object::Customer::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation()">
					 <html:option value ="Person" styleClass="txtbox">Person</html:option>
				     <html:option value ="Company" styleClass="txtbox">Company</html:option>
			 </html:select>
			</td>
		   </tr> 
		  
           <tr>
			<td width="19%" align="right" class="field" id="insuredNameBlock">* Legal Name 1:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field" id="insuredNameBlock">Legal Name 2:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName2)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName2" /></td>
	       </tr>
	       <tr id="DBABlock">
			<td width="19%" align="right" class="field">Insured DBA:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::DBA)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="DBA" /></td>
	       </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
	        <td  colspan="2"><h3>Address</h3></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Address Line 1:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address1)" size="60" maxlength="50" styleClass="txtbox" styleId="Address1"/></td>
	      </tr>
	      <tr>
			<td width="19%" align="right" class="field">Address Line 2:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Address2"/></td>
	      </tr>
	      <tr>
				<td width="19%" align="right" class="field">City:</td>
				<td width="81%" align="left"><html:text name="AddCustomer" property="answer(Object::Customer::City)"  maxlength="40" styleClass="txtbox" styleId="City" /></td>
		  </tr>
		  <tr>
			<td width="19%" align="right" class="field">State/Province:</td>
			<td width="81%" align="left">
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
			</td>
	      </tr>
	      <tr>
				<td width="19%" align="right" class="field">Zip Code:</td>
				<td width="81%" align="left">
				 <html:text name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:150px;" styleClass="txtbox" styleId="Zip" />
            	  <a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/FindZipCode.jpg" BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>		
            	</td>
		  </tr>
		  <tr>
			<td width="19%" align="right" class="field">Country:</td>
			<td width="81%" align="left">
			    <html:select name="AddCustomer" property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
                  <html:option value="USA" styleClass="txtbox">United States</html:option>
                </html:select>
			</td>
		  </tr>	
		     <tr>
			<td colspan="2" class="field1">Do you wish to lock Mailing address getting updated through Clearance database download?
			
			 <html:radio name="AddCustomer" property="answer(Object::Customer::NameType)"  style="width:18px;"  value="Yes">Yes</html:radio>
             <html:radio name="AddCustomer" property="answer(Object::Customer::NameType)"  style="width:18px;" value="No">No</html:radio>
		    </td>
	      </tr> 
		  <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
	        <td  colspan="2"><h3>Contact Information</h3></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Email Address:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::EMailAddress)" onblur="checkEmailAddress(this.form)" size="30"  styleClass="txtbox" styleId="emailID" /></td>
	       </tr>	    
	       <tr>
			<td width="19%" align="right" class="field">Phone Number:</td>
			<td width="81%" align="left">
			  <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="PhoneNumber1" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}" />&nbsp;
              <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox"
								styleId="PhoneNumber2" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}" />&nbsp;
              <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhone)"  style="width:60px;"
								maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" />
			</td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Fax Number:</td>
			<td width="81%" align="left">
			   <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber1"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}" />&nbsp;
               <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber2"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}" />&nbsp;
               <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::Fax)" style="width:60px;  "
								maxlength="4" styleClass="txtbox" styleId="FaxNumber3" />
			</td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact First Name:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactFName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact Last Name:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact Title:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactTitle)"  size="4" styleClass="txtbox" styleId="ContactTitle" /></td>
	       </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr id="CompanyInfmnBlock">
	        <td  colspan="2"><h3>Company Information</h3></td>
	       </tr>
	       <tr id="CompanywebsiteBlock">
			<td width="19%" align="right" class="field">Website:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactURL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" /></td>
	       </tr>
           <tr id="FOBBlock">
			<td width="19%" align="right" class="field">Form of Business:</td>
			<td width="81%" align="left">
			  <html:select name="AddCustomer" property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.value)">
				<html:option value="Select">Select</html:option>	 
			    <html:option value="Corporation">Corporation</html:option>		    
			    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
			    <html:option value="Partnership">Partnership</html:option>		    
			    <html:option value="Joint Venture">Joint Venture</html:option>
			    <html:option value="Other">Other</html:option>
			</html:select>
			</td>
	       </tr>
	       <tr id="otherFOBBlock" style="display:none;">
				<td width="19%" align="right" class="field">If Other,please Specify&nbsp;&nbsp;</td>
				<td width="81%" align="left">&nbsp;&nbsp;&nbsp;<html:textarea name="AddCustomer" property ="answer(Object::Customer::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
				</td>
		   </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	     </table>
	    </div>
	  </td>
	</tr>
   </table>
 </div>  
 </td>
</tr>    
</table>
</div>  

 
<SCRIPT type="text/javascript">
var nameType = document.getElementById("NameType").value;
var formOfBusiness =document.getElementById("FormOfBusiness").value;

 if(FormOfBusiness == 'Other'){
		document.getElementById('otherFOBBlock').style.display='block';
}else{
		document.getElementById('otherFOBBlock').style.display='none';
}	
function showOtherFOBInformation(FormOfBusiness){
		
		if(FormOfBusiness == 'Other'){
		     	document.getElementById('otherFOBBlock').style.display='block';
		}else{
				document.getElementById('otherFOBBlock').style.display='none';
		}	
	}					

function showCompanyInformation(){
var nameType = document.getElementById("NameType").value;

	    if(nameType == 'Person'){
		    document.getElementById('CompanywebsiteBlock').style.display='none'
			document.getElementById('FOBBlock').style.display='none'
			document.getElementById('otherFOBBlock').style.display='none'
			document.getElementById('CompanyInfmnBlock').style.display='none'
			document.getElementById('DBABlock').style.display='none'
			
		}else{
			document.getElementById('CompanywebsiteBlock').style.display='block'
			document.getElementById('FOBBlock').style.display='block'
			document.getElementById('DBABlock').style.display='block'
			document.getElementById('CompanyInfmnBlock').style.display='block'
			
			if(FormOfBusiness == 'Other'){
				document.getElementById('otherFOBBlock').style.display='block';
			}else{
				document.getElementById('otherFOBBlock').style.display='none'
			}
		}	
	}	
	

	

	function maxLengthTextArea() {
	var field = document.getElementById('OtherBusiness').value;
	if ( field.value.length > 240 )
  	{
  	
    	field.value = field.value.substring( 0, 240 );
    	alert( "Only 240 characters is allowed." );
    	return false;
  	}   	
}	




 function activateInsuredTabs(activateId){
    document.body.style.cursor = "wait";
    if(document.getElementById("BasicInformationTab") != undefined){
    	document.getElementById("BasicInformationTab").disabled = true;
    }
   
 	if(document.getElementById("LocationsTab") != undefined){
 		document.getElementById("LocationsTab").disabled = true;
 	}
 	if(document.getElementById("SubmissionsTab") != undefined){
 		document.getElementById("SubmissionsTab").disabled = true;
 	}
 	if(document.getElementById("QuotesTab") != undefined){
 		document.getElementById("QuotesTab").disabled = true;
 	}
 	if(document.getElementById("PoliciesTab") != undefined){
 		document.getElementById("PoliciesTab").disabled = true;
 	}
 	
 	
 	document.getElementById("BasicInformationTab").className = "todotab_inactive";
 	document.getElementById("LocationsTab").className = "todotab_inactive";
 	document.getElementById("SubmissionsTab").className = "todotab_inactive";
 	document.getElementById("QuotesTab").className = "todotab_inactive";
 	document.getElementById("PoliciesTab").className = "todotab_inactive";
 	 	
 	document.getElementById(activateId).className = "todotab_active";		
 }	
	
 
function loadBasicInformationTab(basicInformationTabId){	
	 activateInsuredTabs(basicInformationTabId);	
	 document.getElementById("InsuredDiv").innerHTML = document.getElementById("BasicInformationDiv").innerHTML;
	 document.getElementById("InsuredDiv").style.display = "block";	
	 enableTabs();
}
function loadLocationsTab(locationsTabId){
 activateInsuredTabs(locationsTabId);	
 var customerId = <%=""+customerId%>;
 var cusState = '<%=""+cusState%>';
 var ownerId = <%=""+ownerId%>;
 var riskType = 'COMMERCIAL';
 var sarchObjectId = <%=""+customerId%>;
 var agencyId2 =<%=""+agencyId2%>;
 var objectId = 0;
 var comPropertyId = -1;
 var objectVerId = 0;
 var objectName = 'HOME_RISK';
 var applicationType = 'LOCATION';
 var selectedRiskType ='COMMERCIALAUTO';
 var pageNum = 0;
 var tabNo = 0;
 
 
var pars2='answer(APP_TAB_TYPE)=YUI&answer(customerId)='+
 customerId+'&answer(Object::UserDetail::ownerId)='+ownerId+
 '&answer(OwnerId)='+ownerId+'&answer(RiskType)='+riskType+'&answer(SearchObjectId)='+
 customerId+'&answer(Object::Customer::CustomerId)='+
 customerId+'&answer(Object::Risk::ComProperty::CustomerId)='+
 customerId+'&answer(Object::Agency::AgencyId)='+agencyId2+'&answer(objectId)='+objectId+
 '&answer(Object::Risk::ComProperty::ComPropertyId)='+comPropertyId+
 '&answer(objectVerId)='+objectVerId+'&answer(objectName)='+objectName+
  '&answer(applicationType)='+applicationType+
  '&answer(applicationSubType)=&answer(Navigation)=&answer(teritory)='
  '&answer(territoryName)=&answer(zone)='
  '&answer(state)=&answer(showOnetTab)=Y&answer(tabNo)='+tabNo+
 '&answer(Object::Employee::PageNum)='+pageNum+'&answer(Object::Customer::State)='+cusState+
 '&answer(Object::Risk::ComProperty::CustomerId)='+customerId+'&answer(Object::Risk::ComProperty::ComPropertyId)='+
 comPropertyId+'&answer(SelectedRiskType)='+selectedRiskType;
 
 	var url = '../InsuredLocationListUI3.0.do?';
		
		new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
			forwardToLoginPageIfInvalidSession(transport.responseText);
			loadLocationList();
			
		 		enableTabs();
		 	},onSuccess: function(transport){	
		 	document.getElementById("InsuredDiv").innerHTML= transport.responseText;
		 	}
		}
	);
}

function loadLocationList(){

 	    YAHOO.example.XHR_Text = function() {
    var formatUrl = function(elCell, oRecord, oColumn, sData) {        
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			locString = locString.replace(/ /g,"%20");
	 			var onclickscript = "getInsuredTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";             
             
        };

       
	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40,sortable:true},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:100,sortable:true},
            {key:"Address Line 1",  resizable:"true",width:160},
            {key:"Address Line 2", resizable:"true",width:160},
            {key:"City", resizable:"true",width:90},
            {key:"State",  resizable:"true",width:70},
            {key:"Country",  resizable:"true",width:70}
           
        ];
          
         var customerId = <%=""+customerId%>;
		 var cusState = '<%=""+cusState%>';
		 var ownerId = <%=""+ownerId%>;
		 var riskType = 'COMMERCIAL';
		 var sarchObjectId = <%=""+customerId%>;
		 var agencyId2 =<%=""+agencyId2%>;
		 var objectId = 0;
		 var comPropertyId = -1;
		 var objectVerId = 0;
		 var objectName = 'HOME_RISK';
		 var applicationType = 'LOCATION';
		 var selectedRiskType ='COMMERCIALAUTO';
		 var pageNum = 0;
		 var tabNo = 0;  
		 
      autologout();       
       var anotherDataSource = new YAHOO.util.DataSource('../InsuredLocationListResultUI3.0.do?answer(APP_TAB_TYPE)=YUI&answer(customerId)='+
		 customerId+'&answer(Object::UserDetail::ownerId)='+ownerId+
		 '&answer(OwnerId)='+ownerId+'&answer(RiskType)='+riskType+'&answer(SearchObjectId)='+
		 customerId+'&answer(Object::Customer::CustomerId)='+
		 customerId+'&answer(Object::Risk::ComProperty::CustomerId)='+
		 customerId+'&answer(Object::Agency::AgencyId)='+agencyId2+'&answer(objectId)='+objectId+
		 '&answer(Object::Risk::ComProperty::ComPropertyId)='+comPropertyId+
		 '&answer(objectVerId)='+objectVerId+'&answer(objectName)='+objectName+
		  '&answer(applicationType)='+applicationType+
		  '&answer(applicationSubType)=&answer(Navigation)=&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(state)=&answer(showOnetTab)=Y&answer(tabNo)='+tabNo+
		 '&answer(Object::Employee::PageNum)='+pageNum+'&answer(Object::Customer::State)='+cusState+
		 '&answer(Object::Risk::ComProperty::CustomerId)='+customerId+'&answer(Object::Risk::ComProperty::ComPropertyId)='+
		 comPropertyId+'&answer(SelectedRiskType)='+selectedRiskType);
			      
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","Country"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });
        
        // Configuration for Pagination
        var myConfigs = {   
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
         
        var myDataTableY = new YAHOO.widget.DataTable("LocationList1", moreColumnDefs,anotherDataSource,myConfigs);  
	 
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();

 }		
 
  function enableTabs(){
   
   	 if(document.getElementById("BasicInformationTab") != undefined){
    	document.getElementById("BasicInformationTab").disabled = false;
    }
 	if(document.getElementById("LocationsTab") != undefined){
 		document.getElementById("LocationsTab").disabled = false;
 	}
 	if(document.getElementById("SubmissionsTab") != undefined){
 		document.getElementById("SubmissionsTab").disabled = false;
 	}
 	if(document.getElementById("QuotesTab") != undefined){
 		document.getElementById("QuotesTab").disabled = false;
 	}
 	if(document.getElementById("PoliciesTab") != undefined){
 		document.getElementById("PoliciesTab").disabled = false;
 	}
 	document.body.style.cursor = "default";
   
   }
</SCRIPT>
 