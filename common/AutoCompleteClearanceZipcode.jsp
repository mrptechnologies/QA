<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

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
</style>
<bean:parameter id="InsautoCompleteSqlLookupName" name="autoCompleteSqlLookupName" />
<html:hidden property="autoCompleteSqlLookupName" name="autoCompleteSqlLookupName" styleId="zipLookupName" value="<%=""+InsautoCompleteSqlLookupName%>"/>
	<div class="field" style="text-align: right ; width:200px ;"><font color="red">*</font>&nbsp;Zip Code:
			
					<div id="zipcodeAutoComplete">
						<html:text name="AddCustomer" size="20" property="answer(Object::Customer::Zip)" styleId="Zip" size="5" maxlength="5" styleClass="txtbox" style="width:180px"/>
						
						<div id="zipAutoCompleteResContainer"></div>
						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddParentQuote&clear=yes&PopupWindowName=Zip Code Search"
					title="Search for zip code, state, county"
					onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
					SRC="../Images/FindZipCode.jpg" BORDER="0" align="top"
					ALT="Search for Zip code, City, State and County."></a> 
					</div>	
					
				</div>
			
			
	<%-- 	<div class="field" style="text-align: center ; width:450px ;"><font color="red">*</font>&nbsp;Zip Code:
			<div id="zipcodeAutoComplete">
				<html:text name="AddCustomer" property="answer(Object::Customer::Zipcode)" size="5" maxlength="5" styleClass="txtbox" readonly="false" styleId="Zip"  style="width:180px;"/>
				<div id="zipAutoCompleteResContainer"></div>
			</div>	--%>
			
			
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