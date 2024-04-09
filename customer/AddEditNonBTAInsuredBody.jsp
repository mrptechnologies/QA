<% 
/**
 * Copyright 2002-2010 of Solartis Inc, USA .
 * All Rights Reserved.
 * This software is confidential and proprietary information of Solartis,Inc, USA.
 * This should not be used without proper agreement signed with Solartis Inc,USA.
 */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<jsp:include page="../common/autoCompleteScript.jsp">
	<jsp:param name="autoCompleteSqlLookupName"
		value="AUTOCOMPLETEZIPCODEADDEDITEMPLOYER" />
</jsp:include>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"> </SCRIPT>
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/datatable/assets/skins/sam/datatable.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/autocomplete/assets/skins/sam/autocomplete.css" />
<script type="text/javascript" src="../Scripts/YUI/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<script type="text/javascript" src="../Scripts/YUI/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/event-delegate/event-delegate-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/animation/animation-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/autocomplete/autocomplete-min.js"></script>

<style type="text/css">
.yui-skin-sam .yui-ac-input { position:"center"; }
</style>
	
<html:form action="/SaveInsuredNonBTA" onsubmit="return validateFrm()">

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

	<div class="formpageinsured1">
	<div class="formpageinsured2">
	<div class="formhead">
	<h2 class="left">Insured Detail</h2>
	</div>
	<h3></h3>
	
	<div class="field" style="width:515px;"><font color="red">* One Source Key ID:</font>
	<html:text property="answer(Object::Policy::OneSourceKey)" styleClass="txtbox"
				maxlength="8" styleId="OneSourceKey"  />
	</div>
	
	<h3>Name</h3>
													
	<div class="field" style="width:515px;">Insured Name Type:
   		<html:select styleClass="txtbox" styleId="NameType" property="answer(Object::Customer::NameType)" onchange="showCompanyInformation(this.form)">
       		<html:option value ="Company" styleClass="txtbox">Company</html:option>
       		<html:option value ="Person" styleClass="txtbox">Person</html:option>       		
	   	</html:select>
	</div>
	
	<div class="field"  style="width:515px;"><span id="InsName1"><font color="red">* Legal Name 1:</font></span>
		<html:text property ="answer(Object::Customer::CustomerName)" styleClass="txtbox" styleId="InsuredName" />
	</div>
 
	<div class="field"  style="width:515px;"><span id="InsName2">Legal Name 2:</span>
	   <html:text property="answer(Object::Customer::CustomerName2)" styleClass="txtbox" styleId="InsuredName2" />
	</div>
	
	<div class="field" id="DBABlock" style="width:515px;">Insured DBA:
	   <html:text property="answer(Object::Customer::DBA)"  styleClass="txtbox" styleId="DBA" />
	</div>
				
	<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
	<%
	  String nameFieldLength =(String) request.getAttribute("paramValue");
	if (nameFieldLength.length() <= 0 && nameFieldLength == null){
		 nameFieldLength = "60";								   
	  }
	
	%>			
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

	<div class="field" style="width:515px;"><font color="red">*&nbsp;Address Line 1:</font>
	   <html:text property="answer(Object::Customer::StreetName)" styleClass="txtbox" maxlength="50" styleId="Address1" />
	</div>

	<div class="field" style="width:515px;">Address Line 2:
	   <html:text property="answer(Object::Customer::Address2)" styleClass="txtbox" maxlength="50" styleId="Address2" />
	</div>

    <div class="field" style="width:515px;">Address Line 3:
	   <html:text property="answer(Object::Customer::Address3)" styleClass="txtbox" maxlength="50" styleId="Address3" />
	</div>
	
	<div class="field" style="width:515px;" ><font color="red">* City:</font>
	   <html:text property="answer(Object::Customer::City)"  maxlength="40" styleClass="txtbox" styleId="City" />
	</div>
	
	<div class="field" style="width:515px;">County Name:
	   <html:text property="answer(Object::Customer::County)" maxlength="20"  styleClass="txtbox" styleId="County"/>
	</div>
	
	<div class="field" style="width:510px;" ><font color="red">*&nbsp;State/Province:</font>
	   <html:select property="answer(Object::Customer::State)" styleClass="txtbox" styleId="State">
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

	<div class="field" id="zipcodeAutoComplete" style="text-align:center; width:386px ;float:left;height:2px;"><font color="red">*Zipcode or City Name:</font>
		<html:hidden property="autoCompleteSqlLookupName" styleId="zipLookupName" value="AUTOCOMPLETEZIPCODEALLSTATES"/>
		<html:text name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:130px;"
		    styleClass="txtbox" styleId="Zip" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <div id="zipAutoCompleteResContainer" class="field" style="text-align:left; float:left;"></div>
	</div>
	<div  style="text-align:left; width:540px;float:right;">
		<!--Zipcode lookup start 05-06-2006-->
		<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search"
			title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" />
		<IMG SRC="../Images/FindZipCode.jpg" BORDER="0" align="top" ALT="Search for Zip code, City, State and County."/></a>
	</div>
	
	<div class="field" style="width:510px;">Country:
		<html:select property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
			<html:option value="USA" styleClass="txtbox">United States</html:option>
		</html:select>
	</div>
	
	<h3>Contact Information</h3>

	<div class="field" style="width:515px;">Email Address:
	   <html:text property="answer(Object::Customer::EMailAddress)" onblur="checkEmailAddress(this.form)" styleClass="txtbox" styleId="emailID" />
	</div>
	
	<div class="field" style="width:435px;">Phone Number:
		<dmshtml:dms_text property="answer(Object::Customer::WorkPhoneAreaCode)" style="width:45px;"
										maxlength="3" styleClass="txtbox" styleId="PhoneNumber1" 
										onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}" />&nbsp;
		<dmshtml:dms_text property="answer(Object::Customer::WorkPhoneExchangeCode)" style="width:40px;"
										maxlength="3" styleClass="txtbox"
										styleId="PhoneNumber2" 
										onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}" />&nbsp;
		<dmshtml:dms_text property="answer(Object::Customer::WorkPhone)"  style="width:60px;"
										maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" />
	</div>

	<div class="field" style="width:435px;text-align: right;">Fax Number:       
		<dmshtml:dms_text property="answer(Object::Customer::FaxAreaCode)" style="width:45px;"
										maxlength="3" styleClass="txtbox" styleId="FaxNumber1"
										onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}" />&nbsp;
		<dmshtml:dms_text property="answer(Object::Customer::FaxExchangeCode)" style="width:40px;"
										maxlength="3" styleClass="txtbox" styleId="FaxNumber2"
										onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}" />&nbsp;
		<dmshtml:dms_text property="answer(Object::Customer::Fax)" style="width:60px;  "
										maxlength="4" styleClass="txtbox" styleId="FaxNumber3" />
	</div>
	
	<div class="field" style="width:515px;" >Contact First Name:
		<html:text property="answer(Object::Customer::ContactFName)"  styleClass="txtbox" styleId="ContactFirstName" />
	</div>
	<div class="field" style="width:515px;">Contact Last Name:
		<html:text property="answer(Object::Customer::ContactLName)" styleClass="txtbox" styleId="ContactLastName" />
	</div>
	<div class="field" style="width:515px;">Contact Title:
		<html:text property="answer(Object::Customer::ContactTitle)" styleClass="txtbox" styleId="ContactTitle" />
	</div>
		
	<h3 id="CompanyInfmnBlock">Company Information</h3>
		
	<div class="field" id="CompanywebsiteBlock" style="width:515px;">Website:
		<html:text property="answer(Object::Customer::ContactURL)"  styleClass="txtbox" styleId="CompanyWebSite" />
	</div>
	<div class="field" id="FOBBlock" style="width:515px;">Form of Business:
		<html:select property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.value)">
			<html:option value="">Select</html:option>
			<html:option value="Corporation">Corporation</html:option>
			<html:option value="Sole Proprietor">Sole Proprietor</html:option>
			<html:option value="Partnership">Partnership</html:option>
			<html:option value="Joint Venture">Joint Venture</html:option>
			<html:option value="Other">Other</html:option>
		 </html:select>
	</div>
	
	<table border="0" cellpadding="0" cellspacing="0" align="left" width="80%" id="otherFOBBlock">
		<tr>
			<td width="30%" class="field">If Other,please Specify:&nbsp;&nbsp;</td>
			<td width="70%"><html:textarea name="AddCustomer" property="answer(Object::Customer::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" /></td>
		</tr>
	</table>	
	
	<br><br><br><br><br>
	<table border="0" cellpadding="0" cellspacing="0" align="center" width="98%" >
	<tr>
		<td align="right">
		
			<html:submit value="Next" styleClass="covbutton" property="answer(submit)" style="width:80px" />
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	</table>
	
	</div>
	</div>		
	
<bean:parameter id="agencyId" name="answer(Agency::AgencyId)" />
<bean:parameter id="agentId" name="answer(AgentId)" />
<html:hidden property="answer(Agency::AgencyId)" value="<%=agencyId+""%>"/>
<html:hidden property="answer(AgentId)" value="<%=agentId+""%>" styleId="agentId"/>
<html:hidden property="formName" value="form::LINKCUSTOMER" />
<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>
<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

</html:form>

	<script type="text/javascript">
	NumChars ="0123456789";
	showCompanyInformation(this.form);
	function showCompanyInformation(){
	var nameType = document.getElementById("NameType").value;
	var formOfBusiness =document.getElementById("FormOfBusiness").value;

	    if(nameType == 'Person'){
		    document.getElementById('CompanywebsiteBlock').style.display='none'
			document.getElementById('FOBBlock').style.display='none'
			document.getElementById('otherFOBBlock').style.display='none'
			document.getElementById('CompanyInfmnBlock').style.display='none'
			document.getElementById('DBABlock').style.display='none'
			document.getElementById('InsName1').innerHTML ='<font color="red">* First Name:</font>';
			document.getElementById('InsName2').innerHTML ='<font color="red">* Last Name:</font>';
			
		}else{
			document.getElementById('InsName1').innerHTML ='<font color="red">* Legal Name1:</font>';
			document.getElementById('InsName2').innerHTML ='Legal Name2:';
			document.getElementById('CompanywebsiteBlock').style.display='block'
			document.getElementById('FOBBlock').style.display='block'
			document.getElementById('DBABlock').style.display='block'
			document.getElementById('CompanyInfmnBlock').style.display='block'
			
			if(formOfBusiness == 'Other'){
				document.getElementById('otherFOBBlock').style.display='block';
			}else{
				document.getElementById('otherFOBBlock').style.display='none'
			}
		}	
	}
	
	function showOtherFOBInformation(FormOfBusiness){
		
		if(FormOfBusiness == 'Other'){
		     	document.getElementById('otherFOBBlock').style.display='block';
		}else{
				document.getElementById('otherFOBBlock').style.display='none';
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
	
	function validateFrm(){
	  if(document.getElementById('OneSourceKey').value==""){
			alert("Please enter OneSourceKey");			
			document.forms[0].OneSourceKey.focus();
			return false;
		}
	   if(!IsNumeric(document.getElementById('OneSourceKey').value)){
  	     alert("Please Enter the Numeric value for one Source key");
  	     document.forms[0].OneSourceKey.focus();
  	     return false;
	     }
	   if(document.getElementById('InsuredName').value==""){
			alert("Please enter Legal Name 1");			
			document.forms[0].InsuredName.focus();
			return false;
		}
		if(document.getElementById('Address1').value==""){
			alert("Please enter Address1");			
			document.forms[0].Address1.focus();
			return false;
		}
		if(document.getElementById('City').value==""){
			alert("Please enter City");			
			document.forms[0].City.focus();
			return false;
		}
		if(document.getElementById('State').value==""){
			alert("Please select State");
			document.forms[0].State.focus();
			return false;
		}
		if(document.getElementById('Zip').value==""){
			alert("Please enter ZipCode");			
			document.forms[0].Zip.focus();
			return false;
		}
		if((document.forms[0].Zip.value.length!=5)||(document.forms[0].Zip.value<=0))
		{
			alert("Please enter a valid Zip Code");
			document.forms[0].Zip.focus();
			return false;
		}
		if(!isInteger(document.forms[0].Zip.value))
		{
			alert("Please enter a valid Zip Code");
			document.forms[0].Zip.focus();
			return false;
		}
	}
	
	function IsNumeric(Data) {
	var It = true;
      var c;
      for (var x = 0; x < Data.length; x++)
      if (It) {
      c = Data.charAt(x);
      It = ( NumChars.indexOf(c) != -1);
     }
    return It;
  }
	
	function isInteger(s){
		var i;
		for (i = 0; i < s.length; i++){   
			// Check that current character is number.
			var c = s.charAt(i);         
			if ((c < "0") || (c > "9")) return false;
		}
	// All characters are numbers.
	return true;
	}
	
	
	</script>
	
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