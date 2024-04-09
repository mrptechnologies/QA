<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<!--begin custom header content for this example-->
<style type="text/css">
#autoCompleteAgencyAgent {
    width:20em; /* set width here or else widget will expand to fit its container */
    padding-bottom:2.5em;
    z-index:150;
}
#Agenname{
    width:20em; /* set width here or else widget will expand to fit its container */
    padding-bottom:0.2em;
    z-index:120;
}
#autoCompleteAgencyAgentResContainer {
    width:30em; /* set width here or else widget will expand to fit its container */
    padding-bottom:1em;
    z-index: 140;
}
.match {
    font-weight:bold;
}
</style>
 
<bean:define id="formName"  value="<%=""+request.getParameter("ParamFormName")  %>" />
<bean:define id="agencyName"  value="<%=""+request.getParameter("ParamAgencyName")  %>" />
<bean:define id="ownerId"  value="<%=""+request.getParameter("ParamOwnerId")  %>" />
<%
	String isAgencyChangeEnabled = "";
	if(request.getParameter("isAgencyChangeAllowed")!=null){ 
		isAgencyChangeEnabled = ""+request.getParameter("isAgencyChangeAllowed");
	} 
%>
<html:hidden property="answer(FormName)" value="<%=formName%>" styleId="StyleFormName" />
<html:hidden property="answer(Agency::Equals::OwnerId)" value="<%=ownerId%>" styleId="StyleOwnerId" />

		<div id="autoCompleteAgencyAgent">
			<%if(isAgencyChangeEnabled.equals("Yes")){ %>
				<html:text name="<%=formName%>" property="answer(AgencyName)" size="45" maxlength="60" styleClass="txtbox"  styleId="Agenname" value="<%=agencyName%>"/>
			<%}else{ %>
				<html:text name="<%=formName%>" property="answer(AgencyName)" readonly="true" size="45" maxlength="60" styleClass="txtbox"  styleId="Agenname" value="<%=agencyName%>"/>
			<%} %>
		<div id="autoCompleteAgencyAgentResContainer"></div>
		</div>
<bean:parameter id="autoCompleteAgencyAgentLookupSqlName"	name="AutoCompleteAgencyAgentLookupSqlName" />
<html:hidden property="AutoCompleteAgencyAgentLookupSqlName"name="<%=formName%>" styleId="AgencySearchLookupName" value="<%=""+autoCompleteAgencyAgentLookupSqlName%>"/>
<html:hidden property="answer(Object::Agency::BusinessName)"name="<%=formName%>" styleId="StyleBusinessName" value="<%=agencyName%>"/>
<script type="text/javascript">

YAHOO.example.BasicRemote = function() {
    // Use an XHRDataSource    
   var oDS = new YAHOO.util.XHRDataSource('../AgencyAgentAutoCompleteSearchAction.do');
    // Set the responseType
    oDS.responseType = YAHOO.util.XHRDataSource.TYPE_JSARRAY;
    oDS.responseSchema = {fields:["AgencyCode","BusinessName","AgentLastName","AgentFirstName","AgentMiddleName","AgencyId","ParentAgencyId","AgentId","AgentNumber","AgentMailId","AgentWorkPhone","AgentFax"]};

    // Enable caching
    oDS.maxCacheEntries = 5;

    // Instantiate the AutoComplete
    var oAC = new YAHOO.widget.AutoComplete("Agenname", "autoCompleteAgencyAgentResContainer", oDS);
    // The webservice needs custom parameters 
    oAC.generateRequest = function(sQuery) { 
var paramAgenname=encodeURIComponent(document.getElementById('Agenname').value).replace(/\+/g,'%2B');
        return "?answer(Agency::Equals::OwnerId)="+document.getElementById('StyleOwnerId').value+"&AutoCompleteAgencyAgentLookupSqlName="+document.getElementById('AgencySearchLookupName').value+"&answer(Object::Agency::BusinessName)="+paramAgenname+"&answer(Object::Agency::PageNum)=0&answer(Object::Agency::NumOfRecords)=40&FormName="+document.getElementById('StyleFormName').value+"&query="+encodeURIComponent(sQuery) ; 
    };
         
    oAC.useShadow = true;
    oAC.resultTypeList = false;
	oAC.applyLocalFilter = false;
	oAC.queryMatchSubset = false;
	oAC.minQueryLength = 2;	
	oAC.queryDelay = -10;
	oAC.prehighlightClassName = "yui-ac-prehighlight";
	// Display up to 40 results in the container
	oAC.maxResultsDisplayed = 20;
	
	// Custom formatter to highlight the matching letters
    oAC.formatResult = function(oResultData, sQuery, sResultMatch) {
        var query = sQuery.toLowerCase(),
            agencyCode = oResultData.AgencyCode?"":oResultData.AgencyCode,
            agencyId= oResultData.AgencyId,
            parentAgencyId=oResultData.ParentAgencyId,
            businessName = oResultData.BusinessName,
            agentId= oResultData.AgentId,
            agentNumber= oResultData.AgentNumber,
            agentLastName = oResultData.AgentLastName,
            agentFirstName = oResultData.AgentFirstName,
            agentMiddleName = oResultData.AgentMiddleName?"":oResultData.AgentMiddleName,
            agentEmailId = oResultData.AgentMailId,
            agentWorkPhone =  oResultData.AgentWorkPhone,
            agentFax = oResultData.AgentFax,
            
            agencyCodeMatchIndex = agencyCode.toLowerCase().indexOf(query),
            agencyIdMatchIndex = agencyId.toLowerCase().indexOf(query),
            agentIdMatchIndex = agentId.toLowerCase().indexOf(query),
            businessNameMatchIndex = businessName.toLowerCase().indexOf(query),
            agentLastNameMatchIndex = agentLastName.toLowerCase().indexOf(query),
            agentFirstNameMatchIndex = agentFirstName.toLowerCase().indexOf(query),
            agentMiddleNameMatchIndex = agentMiddleName.toLowerCase().indexOf(query),
            
           
            displayAgencyCode,displayAgencyId, displayBusinessName,displayAgentId,displayAgentLastName,displayAgentFirstName,displayAgentMiddleName;
            
            if(agencyCode == null || agencyCode == "null"){agencyCode="";}

        if(agencyCodeMatchIndex > -1) {
            displayAgencyCode = highlightMatch1(agencyCode, query, agencyCodeMatchIndex);
        }
        else {
            displayAgencyCode = agencyCode;
        }
  
        if(agencyIdMatchIndex > -1) {
            displayAgencyId = highlightMatch1(agencyId, query, agencyIdMatchIndex);
        }
        else {
            displayAgencyId = agencyId;
        }

        if(agentIdMatchIndex > -1) {
            displayAgentId = highlightMatch1(agentId, query, agentIdMatchIndex);
        }
        else {
            displayAgentId = agentId;
        }

        if(businessNameMatchIndex > -1) {
            displayBusinessName = highlightMatch1(businessName, query, businessNameMatchIndex);
        }
        else {
            displayBusinessName = businessName;
        }

        if(agentLastNameMatchIndex > -1) {
            displayAgentLastName = highlightMatch1(agentLastName, query, agentLastNameMatchIndex);
        }
        else {
            displayAgentLastName = agentLastName;
        }

        if(agentFirstNameMatchIndex > -1) {
            displayAgentFirstName = highlightMatch1(agentFirstName, query, agentFirstNameMatchIndex);
        }
        else {
            displayAgentFirstName = agentFirstName;
        }

		if(agentMiddleNameMatchIndex > -1) {
            displayAgentMiddleName = highlightMatch1(agentMiddleName, query, agentMiddleNameMatchIndex);
        }
        else {
            displayAgentMiddleName = agentMiddleName;
        }

        return displayAgencyCode + "\t(" +displayAgencyId+")\t"+ displayBusinessName + "-\t(" + displayAgentId +")\t"+ displayAgentLastName + "\t" + displayAgentFirstName+ "\t" + displayAgentMiddleName ;

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
        document.<%=formName%>.StyleAgencyId.value = oData.AgencyId;
		document.<%=formName%>.StyleBusinessName.value = oData.BusinessName;
		document.<%=formName%>.StyleAgentId.value = oData.AgentId;
		// alert(oData.AgencyCode)
		document.<%=formName%>.ObjectAgencyId.value = oData.AgencyCode; // Guard against null value;?"":oData.AgencyCode;
		if(document.<%=formName%>.autoCompAgentId!=undefined && document.<%=formName%>.autoCompAgentId!=null){		
			document.<%=formName%>.autoCompAgentId.value = oData.AgentId;					
		}
		// alert(1);
		document.<%=formName%>.StyleAgentNumber.value = oData.AgentNumber;
		// alert(oData.AgentFirstName)
		document.<%=formName%>.StyleAgentFirstName.value = oData.AgentFirstName;
		document.<%=formName%>.StyleAgentLastName.value = oData.AgentLastName;
		document.<%=formName%>.StyleAgentMiddleName.value = oData.AgentMiddleName;
		document.<%=formName%>.StyleAgentBusinessID.value = oData.AgentMailId;
		document.<%=formName%>.StyleAgentPhone.value = oData.AgentWorkPhone;
		// alert("fax"+oData.AgentFax)
		document.<%=formName%>.StyleAgentFax.value = oData.AgentFax;
		// alert("agenname")
		document.<%=formName%>.Agenname.value =  oData.BusinessName;
		// alert("name ::"+oData.AgentFirstName +" "+oData.AgentLastName)
		document.<%=formName%>.StyleAgentFullName.value =  oData.AgentFirstName +" "+oData.AgentLastName;
		
		document.getElementById("AgencyNameHeader").innerHTML = oData.BusinessName;
		document.getElementById("AgentNameHeader").innerHTML = oData.AgentLastName + " " + oData.AgentFirstName +" " + oData.AgentMiddleName;
		// update hidden form field with the selected item's ID
        myHiddenField.value = elLI.AgencyId;
     myAC.getInputEl().value =  oData.BusinessName ;
    };
   
    oAC.itemSelectEvent.subscribe(myHandler);
	
    return {
        oDS: oDS,
        oAC: oAC
    };

}();
</script>
