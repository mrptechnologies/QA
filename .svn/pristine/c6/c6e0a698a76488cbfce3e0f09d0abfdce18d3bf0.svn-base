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

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:parameter id="autoCompleteSqlLookupName" name="autoCompleteSqlLookupName" />
<html:hidden property="autoCompleteSqlLookupName" name="autoCompleteSqlLookupName" styleId="zipLookupName" value="<%=""+autoCompleteSqlLookupName%>"/>
<bean:parameter id="ProductZip" name="ProductZipCodeList" />
<bean:parameter id="ZipPopUpList" name="ZipCodePopUpList" />

<tr id="cityContainer">
	<td class="FormLabels" align="left"><bean:message key="AddCustomer.City" /></td>
	<bean:define id="cityFromDB" name="<%=""+ProductZip%>" property="answer(Object::Customer::City)" />
	<html:hidden property="answer(cityFromDB)" value="<%=""+cityFromDB %>" styleId="cityFromDB"/>
    <td class="links"><html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;background:#EDF5FF"  name="<%=""+ProductZip%>" property="answer(Object::Customer::City)" readonly="true" size="20" maxlength="20" styleClass="txtbox" styleId="City"/>
	</td> 
</tr>
<tr id="countyContainer">
	<td class="FormLabels" align="left">County</td>
	<bean:define id="countyFromDB" name="<%=""+ProductZip%>" property="answer(Object::Customer::County)" />
	<html:hidden property="answer(countyFromDB)" value="<%=""+countyFromDB %>" styleId="countyFromDB"/>
	<td class="links"><html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;background:#EDF5FF"  property="answer(Object::Customer::County)" readonly="true" size="20" maxlength="20" styleClass="txtbox" styleId="County"/>
</tr>

 <tr id="stateContainer">
	<td class="FormLabels" align="left">State</td>	
	<td class="links" style="Class:txtbox">	
		<bean:parameter id="lob" name="lineOfBusiness" />			
		<dmshtml:get_lob_product_states nameInSession="arStates" lineOfBusiness="<%=lob%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
			<html:select name="<%=""+ProductZip%>" property="answer(Object::Customer::State)" styleId="stateFromDB">
			<html:option styleClass="txtbox" value ="">Select</html:option>
	 			 <logic:present name="arStates" scope="request">
	    				 <logic:iterate id="details" name="arStates" scope="request" >
							  <bean:define id='test' name="details"  property="stateCode"/>
									<html:option styleClass="txtbox" value ='<%=test.toString()%>'>
	 							 		 <bean:write name="details" property="state"/>
									 </html:option>
						</logic:iterate>
					</logic:present>  
			</html:select>
	</td>
</tr>

<%--<tr id="stateContainer">
	<td class="FormLabels" align="left">State</td>	
	<bean:define id="stateFromDB" name="<%=""+ProductZip%>" property="answer(Object::Customer::State)" />
	<html:hidden property="answer(stateFromDB)" value="<%=""+stateFromDB %>" styleId="stateFromDB"/>
	<td class="links"><html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;background:#EDF5FF"  property="answer(Object::Customer::State)" readonly="true" size="20" maxlength="20" styleClass="txtbox" styleId="State"/>
	</td>
</tr>--%>

<tr>
	<td class="FormLabels" align="left">Zip Code*</td>
	<bean:define id="zipFromDB" name="<%=""+ProductZip%>" property="answer(Object::Customer::Zip)" />
	<html:hidden property="answer(zip)" value="<%=""+zipFromDB %>" styleId="zipFromDB"/>
	<td class="links">
		<table>
			<tr><td></td>
				<td>
					<div id="zipcodeAutoComplete">			
						<html:text name="<%=""+ProductZip%>" size="20" property="answer(Object::Customer::Zip)" styleClass="txtbox" styleId="Zip"/>					
						<div id="zipAutoCompleteResContainer"></div>	
					</div>		
				</td><td>&nbsp;</td>
				<td>
					<a href="<%=""+ZipPopUpList%>?answer(Object::ZipCode::PageNum)=0&FormName=<%=""+ProductZip%>&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" />
					<IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
				</td>
			</tr>
		</table>		
	</td>
</tr>

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
        return "?answer(Object::ZipCode::PageNum)=0&AutoCompleteZipLookupSqlname="+document.forms[0].zipLookupName.value+"&FormName=<%=""+ProductZip%>&query=" + sQuery ; 
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