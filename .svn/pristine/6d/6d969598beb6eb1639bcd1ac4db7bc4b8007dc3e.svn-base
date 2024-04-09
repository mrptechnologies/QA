<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<style type="text/css">
<!--begin custom header content for this example-->
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
p { color: #2E2E2E; font-family: arial; font-size:12px; padding: 1px 2px 1px 5px;  }

.pagehead { font-family: Garamond ,Helvatica, Arial, MS Sans Serif, Verdana; font-size: 30pt; font-weight:100; color: #E41B23;margin:-50 0 0 0px;}

#main { float: left; width: 770px; font-family: Verdana, Arial, sans-serif; color: #000000;font-size: 10pt; background: #fff;  }

.field{clear:both;margin:6px 0 3px 10px;font-size:12px;text-align:left;font-weight:normal;}

	.field p
	{
	   float:left;
	   margin:0px;
	   padding:0 0 0 21px;
	   text-align:left;
	   float:left;
	   font-family: Verdana, Arial, sans-serif; 
	   color: #000000;
	   font-size: 10pt; 
	   font-size:12px;
	}
</style>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:parameter id="autoCompleteSqlLookupName" name="autoCompleteSqlLookupName" />
<html:hidden property="autoCompleteSqlLookupName" name="autoCompleteSqlLookupName" styleId="zipLookupName" value="<%=""+autoCompleteSqlLookupName%>"/>

<bean:define id="zipFromDB" name="AddCustomer" property="answer(Object::Customer::Zip)" />
<html:hidden property="answer(zip)" value="<%=""+zipFromDB %>"  styleId="zipFromDB"/>
			<%--<div class="field" id="zipcodeAutoComplete" style="text-align:left; width:175px ;float:left;"><p>Zipcode or City Name</p><font color="red">*</font>
			    <html:text tabindex="10" name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:70px;margin:0px 0px 0px 285px;" styleClass="txtbox" styleId="Zip" />
			    <div  id="zipAutoCompleteResContainer" class="field" style="text-align:left; float:left;margin:0px 0px 0px 306px"></div>			    
	 		</div>
	 		Modified for Bug 10882 by Diana on 14-July-2010 --%>
			<div class="field" id="zipcodeAutoComplete" style="text-align:left; width:175px ;float:left;"><p>Zipcode or City Name</p><font color="red">*</font>
			    <html:text tabindex="11" name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:70px;margin:0px 0px 0px 253px;" styleClass="txtbox" styleId="Zip" />
			    <div  id="zipAutoCompleteResContainer" class="field" style="text-align:left; float:left;margin:0px 0px 0px 306px"></div>			    
	 		</div>
	 		<div><font size="2" style="text-align:left; width:185px;float:right;margin-right:21px">To search for a zip, enter at least 3 digits and wait for results to populate.</font> </div>
		<!-- <div  class="field" style="text-align:center; width:270px;float:right;">
		<input	type="button"	onclick="return ZipCodePopup(document.getElementById('zipLink'), 'ZipCode');"	value="Find" class="button" style="width:60px; height:22px">
	Zipcode lookup start 05-06-2006 <a	href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes"	id="zipLink" title="Search for zip code, state, county" /></a> -->
				
			</div>	

<div class="field" id="cityContainer">
	<p style="margin:0 0 0 21px;"><bean:message key="AddCustomer.City" /></p>
	<bean:define id="cityFromDB" name="AddCustomer" property="answer(Object::Customer::City)" />
	<html:hidden property="answer(cityFromDB)" value="<%=""+cityFromDB %>" styleId="cityFromDB"/>
	<%--<html:text style="width:150px;margin:0px 0px 0px 400px; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;background:#EDF5FF"  name="AddCustomer" property="answer(Object::Customer::City)" readonly="true" size="20" maxlength="20" styleClass="txtbox" styleId="City"/>
	Modified for bug 10882 by Diana on 14-July-2010 --%>
	
	<html:text style="width:150px;margin:0px 0px 0px 371px; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;background:#EDF5FF"  name="AddCustomer" property="answer(Object::Customer::City)" readonly="true" size="20" maxlength="20" styleClass="txtbox" styleId="City"/>
</div>

<div class="field" id="countyContainer">
	<td class="FormLabels" align="left"><p style="margin:0 0 0 21px;">County</p></td>
	<bean:define id="countyFromDB" name="AddCustomer" property="answer(Object::Customer::County)" />
	<html:hidden property="answer(countyFromDB)" value="<%=""+countyFromDB %>" styleId="countyFromDB"/>
	<%--<html:text style="width:150px;margin:0px 0px 0px 380px;border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;background:#EDF5FF"  property="answer(Object::Customer::County)" readonly="true" size="20" maxlength="20" styleClass="txtbox" styleId="County"/>
	Modified for the bug 10882 by Diana on 14-July-2010 --%>
	<html:text style="width:150px;margin:0px 0px 0px 350px;border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;background:#EDF5FF"  property="answer(Object::Customer::County)" readonly="true" size="20" maxlength="20" styleClass="txtbox" styleId="County"/>
</div>

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
        return "?answer(Object::ZipCode::PageNum)=0&AutoCompleteZipLookupSqlname="+document.getElementById("EmployerGroup").zipLookupName.value+"&FormName=AddCustomer&query=" + sQuery ; 
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
        
        document.getElementById("EmployerGroup").City.value = oData.City;
		document.getElementById("EmployerGroup").County.value = oData.County;
		document.getElementById("EmployerGroup").State.value = oData.State;
        
        // update hidden form field with the selected item's ID
        myHiddenField.value = elLI.Zipcode;
        myAC.getInputEl().value = oData.Zipcode + "\t" + oData.City+"\t" + (oData.County ? " (" + oData.State + ")" : "")+ "\t" + oData.State + "\t" + oData.Country ;
   		document.getElementById("EmployerGroup").City.value = oData.City;
		document.getElementById("EmployerGroup").County.value = oData.County;
		
    };
    oAC.itemSelectEvent.subscribe(myHandler);
	
    return {
        oDS: oDS,
        oAC: oAC
    };

}();
</script>