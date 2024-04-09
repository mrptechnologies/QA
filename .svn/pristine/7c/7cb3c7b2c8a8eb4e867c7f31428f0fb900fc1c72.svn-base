<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<!--begin custom header content for this example-->
<style type="text/css">
#siccodeAutoComplete {
    width:10em; /* set width here or else widget will expand to fit its container */
    padding-bottom:2em;
}
#sicAutoCompleteResContainer {
    width:30em; /* set width here or else widget will expand to fit its container */
    padding-bottom:2em;
}
</style>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:parameter id="autoCompleteSqlLookupName" name="autoCompleteSqlLookupName" />

<html:hidden property="autoCompleteSqlLookupName" name="autoCompleteSqlLookupName" styleId="sicLookupName" value="<%=""+autoCompleteSqlLookupName%>"/>

<div class="field"><p>SIC Code</p>
	<bean:define id="sicFromDB" name="AddCustomer" property="answer(Object::CustomerAdditional::SicCode)" />
	<html:hidden property="answer(sic)" value="<%=""+sicFromDB %>" styleId="sicFromDB"/>
					<%--
					<div id="siccodeAutoComplete">			
						<html:text name="AddCustomer" size="20" property="answer(Object::CustomerAdditional::SicCode)" style="float:left;width:60px;margin:0px 0px 0px 370px;" styleId="sicCode" onblur="setvalue()" maxlength="4"/>					
						<div id="sicAutoCompleteResContainer" class="field" style="text-align:left; float:left;margin:0px 0px 0px 385px"></div>																		
					</div>	 
					Modofied for bug 10882 by Diana on 14-July-2010--%>		
					<div id="siccodeAutoComplete">	
						<html:text tabindex="26"name="AddCustomer" size="20" property="answer(Object::CustomerAdditional::SicCode)" style="float:left;width:60px;margin:-2px 0px 0px 337px;" styleId="sicCode" onblur="setvalue()" maxlength="4"/>					
						<div id="sicAutoCompleteResContainer" class="field" style="text-align:left; float:left;margin:0px 0px 0px 355px"></div>																		
					</div>		
</div>


<%-- 
<script type="text/javascript">
YAHOO.example.BasicRemote = function() {
    // Use an XHRDataSource    
    var sicODS = new YAHOO.util.XHRDataSource('../AutoCompleteSICCode.do');
    //var sicODS = new YAHOO.util.XHRDataSource('../acTest/sicData.jsp');
    // Set the responseType
    sicODS.responseType = YAHOO.util.XHRDataSource.TYPE_JSARRAY;
    sicODS.responseSchema = {fields:["Siccode", "SicDivision","SicGroup","SicIndustry"]};

    // Enable caching
    sicODS.maxCacheEntries = 5;

    // Instantiate the AutoComplete
    var sicOAC = new YAHOO.widget.AutoComplete("sicCode", "sicAutoCompleteResContainer", sicODS);
    // The webservice needs custom parameters 
    sicOAC.generateRequest = function(sQuery) { 
        return "?answer(Object::ZipCode::PageNum)=0&AutoCompleteLookupSqlname="+document.forms[0].sicLookupName.value+"&FormName=AddCustomer&query=" + sQuery ; 
    };
    
    sicOAC.useShadow = true;
    sicOAC.resultTypeList = false;
	sicOAC.applyLocalFilter = false;
	sicOAC.queryMatchSubset = false;
	sicOAC.minQueryLength = 3;	
	sicOAC.queryDelay = 1;
	sicOAC.prehighlightClassName = "yui-ac-prehighlight";
	
	// Display up to 20 results in the container
	sicOAC.maxResultsDisplayed = 20

    // Custom formatter to highlight the matching letters
    sicOAC.formatResult = function(oSICResultData, sQuery, sSICResultMatch) {
        var query = sQuery.toLowerCase(),
            siccode = oSICResultData.Siccode,
            sivDivision = oSICResultData.SicDivision,
            sicGroup = oSICResultData.SicGroup || "", // Guard against null value
            query = sQuery.toLowerCase(),
            siccodeMatchIndex = siccode.toLowerCase().indexOf(query),
            sicDivisionMatchIndex = sivDivision.toLowerCase().indexOf(query),
            sicgroupMatchIndex = sicGroup.toLowerCase().indexOf(query),
            displaySICcode, displaySicDivision, displaynsicgroup;

        if(siccodeMatchIndex > -1) {
            displaySICcode = highlightSICMatch(siccode, query, siccodeMatchIndex);
        }
        else {
            displaySICcode = siccode;
        }

        if(sicDivisionMatchIndex > -1) {
            displaySicDivision = highlightSICMatch(sivDivision, query, sicDivisionMatchIndex);
        }
        else {
            displaySicDivision = sivDivision;
        }

        if(sicgroupMatchIndex > -1) {
            displaynsicgroup = highlightSICMatch(sicGroup, query, sicgroupMatchIndex);
        }
        else {
            displaynsicgroup = sicGroup ? sicGroup : "";
        }
		
        return displaySICcode + "\t" + displaySicDivision + "\t" + displaynsicgroup + "\t" + oSICResultData.SicIndustry + "\t"  ;

    };

    // Helper function for the formatter
    var highlightSICMatch = function(full, snippet, matchindex) {
        return full.substring(0, matchindex) +
                "<span class='match'>" +
                full.substr(matchindex, snippet.length) +
                "</span>" +
                full.substring(matchindex + snippet.length);
    };

    // Define an event handler to populate a hidden form field
    // when an item gets selected and populate the input field
    var myHiddenField1 = YAHOO.util.Dom.get("myHidden1");
    var myHandler1 = function(sType, aArg) {

        var myAC1 = aArg[0]; // reference back to the AC instance
        var elLI1 = aArg[1]; // reference to the selected LI element
        var oData1 = aArg[2]; // object literal of selected item's result data
        
        document.forms[0].sicDiv.value = oData1.SicDivision;
		document.forms[0].sicGroup.value = oData1.SicGroup;
		document.forms[0].sicIndus.value = oData1.SicIndustry;
        
        // update hidden form field with the selected item's ID
        myHiddenField1.value = elLI1.Siccode;
        myAC1.getInputEl().value = oData1.Siccode + "\t" + oData1.SicDivision+"\t" + (oData1.SicGroup ? " (" + oData1.SicIndustry + ")" : "")+ "\t" + oData1.SicIndustry + "\t" ;
   		//document.forms[0].City.value = oData1.City;
		//document.forms[0].County.value = oData1.County;
		
    };
    sicOAC.itemSelectEvent.subscribe(myHandler1);
	
    return {
        sicODS: sicODS,
        sicOAC: sicOAC
    };

}();
</script>--%>