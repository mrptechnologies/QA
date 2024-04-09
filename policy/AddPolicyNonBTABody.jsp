<%/*
 * Copyright 2002-2010 of Solartis Inc, USA .
 * All Rights Reserved.
 * This software is confidential and proprietary information of Solartis,Inc, USA.
 * This should not be used without proper agreement signed with Solartis Inc,USA.
 */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>  
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/autocomplete/assets/skins/sam/autocomplete.css" />

<SCRIPT SRC="../Scripts/JScripts/CreateSubmission.js" type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript"	src="../Scripts/YUI/2.4.1/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/autocomplete/autocomplete.js"></script>

<style type="text/css">
#AgencyId{
    width:26em; /* set width here or else widget will expand to fit its container */
    z-index: 140;
}
#autoCompleteSearchAgencyContainer {
    width:30em; /* set width here or else widget will expand to fit its container */
    padding-bottom:1em;
    z-index: 140;
}
.match {
    font-weight:bold;
    color:0000FF;
}

</style>
<%String flag = "";%>
<%if(request.getParameter("clear")!=null){ %>
<%if(request.getParameter("clear").equals("Y")){%>
	<%flag="1";%>	
<%}%>
<%}%>

<html:form action="/LinkAgenttoInsuredNonBTAAction.do">
	
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

	<div class="formpage01">
	<div class="content">
	<div class="formhead">
	<h2 class="left">Select Agency</h2>
	</div>
	<div>&nbsp;</div>

	<div class="field" id="agencyAutoComplete" style="text-align:center; width:355px;float:left;height:2px;">Select Agency/Broker:
	<%if(flag.equals("1")){%>
		<html:text styleClass="txtbox" styleId="AgencyId" property="answer(Object::Agency::BusinessName1)" size="50" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%}%>
	<%if(!flag.equals("1")){%>
		<html:text styleClass="txtbox" styleId="AgencyId" property="answer(Object::Agency::BusinessName1)" size="50" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%}%>
			 <div id="autoCompleteSearchAgencyContainer" class="field" style="text-align:left; top:5px; left:200px; position:relative;"></div>
     </div>
	<div style="text-align:left; width:430px;float:right;">	
		<input type="button" value="Find Agency" class="covsmallbutton"	style="width:100px;" onclick="findAgency();">
	</div>
	</div>
	<br><br>
	</div>
	
<html:hidden property="answer(Agency::Equals::OwnerId)" value="<%=""+ownerId %>" styleId="OwnerId"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" styleId="TabPanelName"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' styleId="dbname"/>	


<html:hidden property="formName" value="form::SEARCHAGENT" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=""+ownerId %>' />	
<html:hidden property="answer(forwardKey)" value="<%="SubmissionAgencySuccess"%>" />
<html:hidden property="answer(PageType)" value="<%="SubmissionAgency"%>" />
<html:hidden property="answer(AgentId)" value="<%="-1"%>"  styleId="agentId"/>

<html:hidden property="LimitSearch" value="yes" styleId="LimitSearch"/>
<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />

<html:hidden property="answer(1*Entity::Equals::SearchObjectType)" value="AGENCY" />   
<html:hidden property="entityType" value="AGENT" />
<html:hidden property="answer(Agency::AgencyId)" value="<%=""%>" styleId="agencId"/>
<html:hidden property="answer(Object::Entity::PageNum)" value="0"/>
			
<script type="text/javascript">
autoComplete('AgencyId','autoCompleteSearchAgencyContainer');
function autoComplete(agencyId,containerId){
   YAHOO.example.BasicRemote = function() {
   
   	var dbname=document.getElementById("dbname").value;	
	var LimitSearch=document.getElementById("LimitSearch").value;
	var inpPageNum=document.getElementById("inpPageNum").value;
	var OwnerId=document.getElementById("OwnerId").value;
	var agencyId = document.getElementById("agencId").value;
		
    // Use an XHRDataSource 
	var oDSauto = new YAHOO.util.XHRDataSource("../ListOfAgenciesAutoComplete.do?answer(TabPanelName)=Submission_Panel&answer(dbname)="+dbname+"&LimitSearch="+LimitSearch+"&answer(Object::Agency::PageNum)="+inpPageNum+"&answer(Agency::Equals::OwnerId)="+OwnerId);
    // Set the responseType
   	oDSauto.responseType = YAHOO.util.XHRDataSource.TYPE_JSARRAY;
	oDSauto.responseSchema = {fields:["AgencyName","AgencyIdRes"]};
	
    // Enable caching
    oDSauto.maxCacheEntries = 3;
    
    // Instantiate the AutoComplete	
    var oACauto = new YAHOO.widget.AutoComplete('AgencyId', 'autoCompleteSearchAgencyContainer', oDSauto);

    // The webservice needs custom parameters  
    oACauto.generateRequest = function(sQuery) {     
       return "&answer(Agency::Like::BusinessName)="+sQuery;
    };
    
    oACauto.useShadow = true;
    oACauto.resultTypeList = false;
 	oACauto.applyLocalFilter = false;
 	oACauto.queryMatchSubset = false;
 	oACauto.minQueryLength = 3; 
 	oACauto.queryDelay = -10;
 	oACauto.prehighlightClassName = "yui-ac-prehighlight";
 	// Display up to 20 results in the container
 	oACauto.maxResultsDisplayed = 20;
    
    oACauto.formatResult = function(oResultData, sQuery, sResultMatch) {
    var sKey = sResultMatch;
    var query = sQuery.toLowerCase();
    var agencyName = oResultData.AgencyName;
    //for highlighting the query
    var agencyNameMatchIndex = agencyName.toLowerCase().indexOf(query);   
    
    var displayAgencyName;  
        
        if(agencyNameMatchIndex > -1) {
            displayAgencyName = highlightMatch1(agencyName, query, agencyNameMatchIndex);
        }
        else {
            displayAgencyName = agencyName;
        }
        
    var aMarkup = [ "\t - \t ", agencyName,  ];
   return displayAgencyName ;
   };
    
     // Helper function for the formatter
    var highlightMatch1 = function(full, snippet, matchindex) {
        return full.substring(0, matchindex) +
                "<span class='match'>" +
                full.substr(matchindex, snippet.length) +
                "</span>" +
                full.substring(matchindex + snippet.length);
    };
    
    oACauto.prehighlightClassName = "yui-ac-prehighlight";
    oACauto.useShadow = true;    
	
    var myHandler = function(sType, aArgs) {
	    var myAC = aArgs[0]; // reference back to the AC instance
	    var elLI = aArgs[1]; // reference to the selected LI element
	    var oData1 = aArgs[2]; // object literal of selected item's result data
		var result = oData1.AgencyName;
		document.getElementById('agencId').value = oData1.AgencyIdRes;
		selectAgent();
    };
    oACauto.itemSelectEvent.subscribe(myHandler);
    
    return {
        oDS: oDSauto,
        oAC: oACauto
    };
}();
}

function findAgency(){
	document.forms[0].action = "/FindAgencyNonBTA.do";
	document.forms[0].submit();
}
</script>

</html:form>