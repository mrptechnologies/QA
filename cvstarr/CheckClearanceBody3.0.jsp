<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Calendar" %>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/CheckClearance.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"> </SCRIPT>

<script type="text/javascript" src="../Scripts/prototype.js"></script>
<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="AgentID" property="answer(Object::UserDetail::AgentId)" name="LoginPage" scope="session" />
<bean:define id="AgencyID" property="answer(Object::UserDetail::AgencyId)" name="LoginPage" scope="session" />
<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>
<jsp:include page="../common/autoCompleteScript.jsp"> 
<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETEZIPCODEADDEDITEMPLOYER" />
</jsp:include>
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


<html:form action="/SearchClearanceFailureActionUI3.do">



	<html:hidden property="answer(dbname)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="versionNum" value="1.0" />
	<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
	<html:hidden property="formName" value="form::Clearance" />	
	<div class="formpageinsured">
		<div class="formhead"><h2 class="left">Clear Insured</h2></div>
		
		<h3>Basic Insured Information</h3>
		<div class="field" style="width:461px ;"><font color="red">*</font>&nbsp; Insured Name Type:		
			<html:select property="answer(Object::Clearance::NameType)"
					styleId="NameType" name="AddCustomer"
					>
					<html:option value="Company" styleClass="txtbox">Company</html:option>
					<html:option value="Person" styleClass="txtbox">Person</html:option>					
				</html:select>
		</div>
		<div id="divCompany">
		<div class="field"  style="width:465px ;" id="company_legal_name1"><font color="red">*</font>&nbsp;Legal Name / DBA:<html:text name="AddCustomer" property="answer(Object::Clearance::LegalName1)" size="50" maxlength="50" styleClass="txtbox" styleId="LegalName1" /></div><!--
		<div class="field" style="width:465px ;" id="company_legal_name2">Legal Name 2:<html:text	name="AddCustomer" property="answer(Object::Clearance::LegalName2)" size="50"	maxlength="50" styleClass="txtbox" styleId="LegalName2" /></div>
		
		<div class="field" style="width:465px ;" id="insureddba">Insured DBA:<html:text	name="AddCustomer" property="answer(Object::Clearance::DBA)" size="50" maxlength="50"	styleClass="txtbox" styleId="DBA" /></div>-->
		</div>
		
		<div id="divPerson">
		<div class="field"  style="width:465px ;" ><font color="red">*</font>&nbsp;First Name:<html:text name="AddCustomer" property="answer(Object::Clearance::FirstName)" size="50" maxlength="50" styleClass="txtbox" styleId="FirstName" /></div>
		<!--<div class="field" style="width:465px ;" >Last Name:<html:text	name="AddCustomer" property="answer(Object::Clearance::LastName)" size="50"	maxlength="50" styleClass="txtbox" styleId="LastName" /></div>
	
		--></div>
		
		
		<%-- <div class="field" style="text-align: right ; width:450px ;"><font color="red">*</font>&nbsp;Zip Code:
			<html:text name="AddCustomer" property="answer(Object::Clearance::Zipcode)" size="5" maxlength="5" styleClass="txtbox" readonly="false" styleId="Zip"  style="width:180px;"/>
			<a
					href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddParentQuote&clear=yes&PopupWindowName=Zip Code Search"
					title="Search for zip code, state, county"
					onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
					SRC="../Images/FindZipCode.jpg" BORDER="0" align="top"
					ALT="Search for Zip code, City, State and County."></a>
			</div>--%>
			
			<html:hidden property="autoCompleteSqlLookupName" styleId="zipLookupName" value="AUTOCOMPLETEZIPCODEALLSTATES"/>
			<div class="field" id="zipcodeAutoComplete" style="text-align:right; width:167px ;float:left"><font color="red">*</font>Zipcode or City Name:
			    <html:text name="AddCustomer" property="answer(Object::Clearance::Zipcode)" maxlength="10" style="width:140px;" styleClass="txtbox" styleId="Zip" />
			    <div  id="zipAutoCompleteResContainer" class="field" style="text-align:left; float:left;"></div>			    
	 		</div>
	 		
		<div  class="field" style="text-align:left; width:590px;float:right;">
		<!--Zipcode lookup start 05-06-2006--> <a
					href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddParentQuote&clear=yes&PopupWindowName=Zip Code Search"
					title="Search for zip code, state, county"
					onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
					SRC="../Images/FindZipCode.jpg" BORDER="0" align="top"
					ALT="Search for Zip code, City, State and County."></a>
			</div>			
		
		<div class="field" style="width:460px ;">Country:
			<html:select property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
				<html:option value ="USA" styleClass="txtbox">USA</html:option>									   		   
			</html:select>
		</div>

		
<!-- 		<div class="field" style="width:505px ;text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*</font>&nbsp;Proposed Effective Date:       
<dmshtml:dms_text property="answer(Month)" size="2" style="width:40px;"
								maxlength="2" styleClass="txtbox" styleId="csdmm"
								onkeyup="validateDate(12,this,'Month');" />&nbsp;
<dmshtml:dms_text property="answer(Date)" size="2" style="width:40px;"
								maxlength="2" styleClass="txtbox" styleId="csddd"
								onkeyup="validateDate(31,this,'Date');" />&nbsp;
<dmshtml:dms_text property="answer(Year)" size="2" style="width:80px;  "
								maxlength="4" styleClass="txtbox" styleId="csdyy" 
								onkeyup="var dat = new Date();var currentyear = dat.getFullYear();validateDate(currentyear+1,this,'Year');"/> (MM/DD/YYYY) 
</div> -->

<% Date  myDate = Calendar.getInstance().getTime();
									DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
									String today = formatter.format(myDate);%>

		<div class="field" style="text-align:right; width:167px ;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">*</font>&nbsp;Proposed Effective Date:    
          <div style="text-align:left; width:590px;float:right;margin:-20px 0px 0px 190px" id="proposedEffectiveDate" ></div>
           <jsp:include page="../common/ExtDateField.jsp">
           <jsp:param name="inputDateField" value="ProposedEffectiveDate1"/>
           <jsp:param name="panelDiv" value="proposedEffectiveDate" />
           <jsp:param name="minimumDate" value="" />
           <jsp:param name="maximumDate" value="" />
           <jsp:param name="allowBlank" value="false"/>           
       	   <jsp:param name="setDefaultToday" value="true"/>
       	   <jsp:param name="TodayDate" value="<%=today%>"/>
           </jsp:include>
     	</div>
     
		<div class="field">
			<input type="button" class="covbutton" value="Next"  onclick="submitClearance()" style="width:100px;">	
			</div>
		
		<div id="CLEARANCE_LIST">
		</div>	
		
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	<html:hidden name="AddCustomer" property="answer(Object::Clearance::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden name="AddCustomer" property="answer(Object::Customer::City)"  styleId="City"/>
	<html:hidden name="AddCustomer" property="answer(Object::Customer::County)" styleId="County"/>
	<html:hidden name="AddCustomer" property="answer(Object::Customer::State)" styleId="State"/>
	<html:hidden property="answer(Object::Customer::CustomerName)" styleId="customerName1"/>
	<html:hidden property="answer(Object::Customer::CustomerName2)" styleId="customerName2"/>
	<html:hidden property="answer(Object::Customer::NameType)" styleId="HNameType" />
	<html:hidden property="answer(Object::Customer::DBA)" styleId="HDBA"/>
	<html:hidden property="answer(Object::Customer::Zip)" styleId="HZip"/>	
	<html:hidden property="answer(Object::Submission::Status)" value="In Progress" />
	<html:hidden property="answer(Object::Customer::Status)" value="In Progress" />
	<html:hidden property="answer(Object::Submission::ClearanceStatus)" styleId="Main_Clearance_Status" value="Cleared" />
	<html:hidden property="answer(Object::isClearance)" value="Y" />
	<html:hidden property="answer(Object::Clearance::LobId)" value="1" />
	<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate)" styleId="ProposedEffectiveDate"/>
	<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate1)" styleId="ProposedEffectiveDate1"/>
	<html:hidden property="answer(Object::Submission::CreatedBy)" value="<%=usernameId.toString()%>" />   
   	<html:hidden property="answer(Object::Clearance::LobId)" value="1" />
   	<html:hidden property="answer(Object::PageType)" value="CHECK_CLEARANCE" />
   	<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
   	
<bean:define id="AgentID" property="answer(Object::UserDetail::AgentId)" name="LoginPage" scope="session" />
<bean:define id="AgencyID" property="answer(Object::UserDetail::AgencyId)" name="LoginPage" scope="session" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session"/>
<html:hidden property="answer(Object::UserDetail::roleName)" value="<%=roleName.toString()%>" />

	<%String agencyId="";%>
	<%String agencyIdtoLink="";%>
	<%long lngAgencyTemp=0;%>
	<%long agencyId2=0;%>
	<%String agencyName2="";%>
	<%long generalagencyid2=0;%>
	<%String generalagencyname2="";
	String agencyAgentId="";%> 	
	
		<bean:define id="agencyIdTemp1" name="AddCustomer" property="answer(Agency::AgencyId)"/>
	<bean:define id="AgentId1" name="AddCustomer" property="answer(AgentId)"/>
   	
   				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="true">						
			<%
				String agencyName = ""; 
			    agencyId = ""+agencyIdTemp1;
			    agencyAgentId = ""+AgentId1;
			    AgencyID = ""+agencyIdTemp1;
			%><%if(!agencyId.equalsIgnoreCase("")){%>
	
	          <%} %>				
	
	
			<%if(!agencyAgentId.equalsIgnoreCase("")){%>
			 <html:hidden property="answer(AgentId)" value='<%=""+agencyAgentId%>' />
		 <%}else{ %>
			 <html:hidden property="answer(AgentId)" value='<%=""+AgentID%>' />
		 <%} %>	
		<html:hidden property="answer(Agency::AgencyId)" value='<%=""+agencyId%>'/>								 				
    		</dmshtml:dms_static_with_connector>	
    		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="false">
				

					<html:hidden property="answer(Agency::AgencyId)" value='<%=""+AgencyID%>'/>						
					<%if(!agencyAgentId.equalsIgnoreCase("")){%>
						 <html:hidden property="answer(AgentId)" value='<%=""+agencyAgentId%>' />
					 <%}else{ %>
						 <html:hidden property="answer(AgentId)" value='<%=""+AgentID%>' />
					 <%} %>				
    		</dmshtml:dms_static_with_connector>
	</div>   	
	<html:hidden property="answer(Object::Alert::AgencyId)" value="<%=""+AgencyID %>"/>
</html:form>

<SCRIPT type="text/javaScript">	
var formElement=document.forms[0];

function resetFields(){
	formElement.LegalName1.value = "";
	// formElement.LegalName2.value = "";
	formElement.FirstName.value = "";
	// formElement.LastName.value = "";
	formElement.Zip.value = "";
	 // formElement.DBA.value = "";
	formElement.AgencyName.value = "";
}


	showPersonInformationUI3(document.forms[0]);
  		var currdate = new Date(); 
  		var month = currdate.getMonth()+1;   
		
  		if(currdate.getMonth() < 9)
  			document.getElementById('csdmm').value=new String("0"+month);
  		else 
  			document.getElementById('csdmm').value=month;  			
  		if(currdate.getDate() < 10)
  			document.getElementById('csddd').value=new String("0"+currdate.getDate());
  		else 			
  			document.getElementById('csddd').value=currdate.getDate();  				
  		document.getElementById('csdyy').value=currdate.getFullYear();  
  		
  		
/**
 * AJAX - To check clearance
 * @author mohan_r@solartis.net
 */ 
 
 function searchClearance(){
  
  var url="/ClearanceActionUI3.do"; 
  var panel="CLEARANCE_LIST";
  var form=document.forms[0];
  
  try {			
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){},onSuccess: function(transport){showTest(transport.responseText);}});		
   }catch(err) {
    txt="There was an error on this page.\n\n";
    txt+="Error description: " + err.description + "\n\n";
    txt+="Click OK to continue.\n\n";
    alert(txt);
   }   
 
 return true;
  
 }
 
 function showTest(testData){
  var resultData = testData.split("$HTMLSPLITTER$");
   trimText=resultData[0].replace(/^\s*|\s*$/g,'');

  if(trimText=='UNDERWRITER_SHOW_LIST'){
  	document.getElementById('CLEARANCE_LIST').innerHTML=resultData[1];
  }  	
  if(trimText=='BROKER_HIDE_LIST'){
  	document.getElementById('CLEARANCE_LIST').innerHTML=resultData[1];  	
  }
    if(trimText=='CLEARANCE_SUCCESS'){
    document.getElementById('CLEARANCE_LIST').innerHTML=resultData[1];    
    document.forms[0].action="../CVClearanceAction3.0.do";
 	
  }
 }
 
function  submitClearance(){
var result=Validate();
setHiddenValue();
if(result!=false){
searchClearance();
}
 }
 
 function setHiddenValue()
{
    var formElement=document.forms[0];

    if(formElement.NameType.value == 'Company')
    {
    	formElement.customerName1.value = formElement.LegalName1.value;
    	// formElement.customerName2.value = formElement.LegalName2.value;
    	if(formElement.Updated_customer_name!=null && formElement.Updated_customer_name){
    		formElement.Updated_customer_name.value = formElement.LegalName1.value;
    	}
    	
    }
    else if(formElement.NameType.value == 'Person')
    {
    	formElement.customerName1.value = formElement.FirstName.value+" "; // +formElement.LastName.value;
    	if(formElement.Updated_customer_name!=null && formElement.Updated_customer_name){
    		formElement.Updated_customer_name.value = formElement.FirstName.value+" "; // +formElement.LastName.value;
    	}
   
    }    
    formElement.HNameType.value = formElement.NameType.value;
    formElement.HZip.value = formElement.Zip.value;
   // formElement.HDBA.value = formElement.DBA.value;    
}


showPersonInformationUI3(document.forms[0]);
  				  
</SCRIPT> 

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
<script type="text/javascript">
   Ext.onReady(function(){
 	 var inputDate = Ext.getCmp('ProposedEffectiveDate1').getValue();
 	 var splitDate = inputDate.split('/');
 	 
   document.forms[0].ProposedEffectiveDate1.value = splitDate[2]+'-'+splitDate[0]+'-'+splitDate[1];
   
});
   </script>