var addLocationDivActive = false;
var activeTabId = "";
YAHOO.namespace("example.container");
function loadTankPopUp() {
	document.getElementById("AddTankDialog").style.display = "block";	
	// Instantiate the Dialog
	YAHOO.example.container.AddTankDialog = new YAHOO.widget.Dialog("AddTankDialog", 
							{ width : "60em",
							  fixedcenter : true,
							  visible : false,
							  constraintoviewport : true
							});
	// Render the Dialog
	YAHOO.example.container.AddTankDialog.render();
	//YAHOO.example.container.AddTankDialog.show();

	 //Event for Cancel risk
	 YAHOO.util.Event.on('CancelRisk', 'click', function(e) {
	 
	 	YAHOO.example.container.AddTankDialog.cancel();
	 	document.getElementById("AddTankDialog").style.display = "none";	
	 })
	YAHOO.util.Event.on('closeIcon1', 'click', function(e) {
	 
	 	YAHOO.example.container.AddTankDialog.cancel();
	 	document.getElementById("AddTankDialog").style.display = "none";	
	 })
}
YAHOO.util.Event.onDOMReady(loadTankPopUp);

var addIndex;
function addRisk(){
	var heading = 'Add Tank Information'
	heading.replace(/ /g,"%20");
	var objectId = 0;
	var objectVerId =0;
	var objectName = document.getElementById("RiskSelection").value;
	var Applicationtype = 'QUOTE_APPLICATION'
	var objectType = 'QUOTE_RISK';
	var applicationType = 'RISK';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	
	
	var tankDesc = encodeURIComponent(document.getElementById("LocationDescription").value);

	var RiskName = encodeURIComponent(document.getElementById("tankname").value);
	var ButtonName = 'Save Tank';
	var storageTankId ='-1';
	
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;
	var locationId=document.getElementById("locIdUpdated").value;
	var recalculateneed = 'recalculate';
	
	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	// var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	
		appEnabled = IsApplicationDisabled;	
	
	var agencyId = document.getElementById("agencyId").value;
	
	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("FamilyId").value;
	
	var policyId = "";
	var policyVerId = "";
	
	if(document.getElementById("parentPolicyId1") != null && document.getElementById("parentPolicyId1") != undefined) {
		policyId = document.getElementById("parentPolicyId1").value;
	}
	if(document.getElementById("policyVerId1") != null && document.getElementById("policyVerId1") != undefined) {
		policyVerId = document.getElementById("policyVerId1").value;
	}
	var parameters = "answer(Object::Policy::ParentPolicyId)=" + policyId + "&answer(Object::Policy::ParentPolicyVerId)=" + policyVerId;
	var actionName = escape('/savePolicyEILRiskApplicationAction.go?' + parameters);
		
	
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+'&answer(ButtonName)='+ButtonName+
	'&answer(zone)='+zone+'&answer(actionName)='+actionName+
	'&answer(SystemGeneratedNumber_Object::AST::TankNo__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~RISK_NUM)=&answer(Object::Risk::RiskType__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~RISK_TYPE)='+objectName+
	'&answer(Object::UST::TankContents__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~TANK_CONTENTS)=Diesel&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(QuoteId)='+parentQuoteId+
	'&answer(Object::Location::Risk::StorageTankId)='+storageTankId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+
	'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+
	'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+
	'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Location::Risk::StorageTankId)=-1&answer(Object::Risk::RiskId)=-1&answer(Object::Customer::CustomerId)='+custId+
	'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId;
	
	var url = '../getEndorsementTankContent.do?'+pars1;
	var par2 = '&answer(Object::Risk::RiskName__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~RISK_NAME)='+RiskName+'&answer(Object::UST::TankDescription__DMS_PROP_QUOTE_VER_PLAN_RISK_STORAGETANK_DETAIL~TANK_DESCRIPTION)='+tankDesc;
	 autologout();
	 new Ajax.Request(url, {method: 'post',parameters:par2,
	 asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
	 	showRiskPopUp(transport.responseText,locationId,heading);
	 },onSuccess: function(transport){if(transport.responseText!=""){}else{YAHOO.example.container.dialog3.cancel();}}});

}

	function showRiskPopUp(data,locationId,heading){

		
		loadRiskSavedPopUp(locationId,heading,data);
	
	}
	
	
	function loadRiskSavedPopUp(locId,heading,data) {

	
	
	document.getElementById("containerheading").innerHTML = heading;
	
	document.getElementById("RiskPopUp").style.display = "block";	
	// Instantiate the Dialog
	var data1 = data;
	document.getElementById("RiskPopUpBody").innerHTML = data1;
	YAHOO.example.container.dialog3.show();
	var locationId = locId;
	YAHOO.util.Event.on('submitButtonForPopUp', 'click', function(e) {	 
	 	ShowLocationTankListDiv(locId);
	 })
	 YAHOO.util.Event.on('closeIcon3', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog3.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 	ShowQuoteLocationTankListDiv(locId);
	 })
	 
	  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog3.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 	ShowQuoteLocationTankListDiv(locId);
	 })
}
function initTankPopUp(){
YAHOO.example.container.dialog3 = new YAHOO.widget.Dialog("RiskPopUp", 
							{ width : "78em",
							  fixedcenter : true,
							  visible : false,
							  zIndex : 1000,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []
							});
	// Render the Dialog
	YAHOO.example.container.dialog3.render();
}
YAHOO.util.Event.onDOMReady(initTankPopUp);
function doSpecificSuccessActionForPopUp(){
	YAHOO.example.container.dialog3.cancel();
	 document.getElementById("RiskPopUp").style.display = "none";
		document.getElementById("RiskPopUpBody").innerHTML = "";
		loadQuoteLocationList1();
}

	function doSpecificOnCompleteAcionForPopUp(){		
	document.getElementById("loadercontent1").style.display ="none";document.getElementById("loadercontent2").style.display ="none";
 	var locIdUpdated = document.getElementById("locIdUpdated").value;
 	ShowLocationTankListDiv(locIdUpdated);	
	
	}
	
	function doSpecificCompleteAction(transport){	
	
		//loadQuoteLocationList1();
		checkcount = false;
		//document.getElementById("loadercontent1").style.display ="none";document.getElementById("loadercontent2").style.display ="none";
	//getApplication(transport.responseText);
		
	}
	
	function doSpecificSuccessAction(transport){
	
	//To get risk details after spec question is added.
	
	if(SpecificQuestionAdded){
		addRisk();
		SpecificQuestionAdded = false;
	}
	else{
	if(YAHOO.example.container.dialog3 !=null && YAHOO.example.container.dialog3 != undefined){
		YAHOO.example.container.dialog3.cancel();
	}
	if(YAHOO.example.container.documentDialog !=null && YAHOO.example.container.documentDialog != undefined){
		YAHOO.example.container.documentDialog.cancel();
	}
	if(document.getElementById("RiskPopUp") !=  undefined){
		document.getElementById("RiskPopUp").style.display = "none";
	}
	if(document.getElementById("RiskPopUpBody") != undefined){
		document.getElementById("RiskPopUpBody").innerHTML= "";
	}
	
	getApplication(transport.responseText);
	window.location.reload();
	}
	
	}
	
	function getApplication(data){
 	
 	
	
	//document.getElementById("Loc3TableData").style.display = "none";
	document.getElementById("AddLocationDiv").style.display = "none";
	document.getElementById("AddLocationDiv").innerHTML = "";
	document.getElementById("LocationAndTanksList").innerHTML = data;
	initTankPopUp();
	var newLocName = document.getElementById("newLocationNameAssigned").value;
	
  	if(addLocationDivActive){
  	AddLocationAvailable =false;
	 	var parent = document.getElementById("divide1");
	 	
	 	var childToRemove = document.getElementById(addLocationId); 	
	 	parent.removeChild(childToRemove);//to remove current tab
	 	
	 	var locId = document.getElementById("locIdUpdated").value;
	 	
	
	 	appendLocationToParent(locId,newLocName);//to add current tab
	 	document.getElementById("LocationAndTanksList").style.display = "block";	
	 	//document.getElementById("SubmissionVerId1").value = document.getElementById("newSubmissionVerId").value;
	 	
 	}
	if(document.getElementById("newSubQuoteVerId") != undefined){
 	
 	var subQuoteVerId = document.getElementById("newSubQuoteVerId").value;
 	var len = subQuoteVerId.length;
 	
 	subQuoteVerId = subQuoteVerId.substring(1,len-1);
 	
 		document.getElementById("subQuoteVerId").value = subQuoteVerId;
 	}
 	document.getElementById(activeTabId).lastChild.nodeValue = ""+newLocName;
 	document.getElementById("LocationSchedule").innerHTML ="Location Schedule("+ document.getElementById("locationSizeUpdated").value+")";
 	
 }
var count1=0;
 function appendLocationToParent(locId,newLocName){
 		count1++;
		var tsrLocationName = new String(newLocName);
		//alert(tsrLocationName)
		tsrLocationName = tsrLocationName.replace(/%20/g," ");
		tsrLocationName = tsrLocationName.replace(/___/g,"'");
		var parent = document.getElementById("divide1");
	
		var td=document.createElement("td");
		td.onclick = function() {ShowQuoteLocationTankListDiv(locId,this.id);}		
		td.setAttribute("border","0");
		td.setAttribute("width","150px");
		td.setAttribute("cellpadding","0");
		td.setAttribute("cellspacing","0");
		td.className = "todotab_active";
		td.setAttribute("height","35");
		var id=locId+"AddLocation_"+count1;
		td.setAttribute("id",id);
		
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeChild(id);}
		td.appendChild(span);
		
		td.appendChild(document.createTextNode(tsrLocationName));
		
		var tdSpace = document.createElement("td");
		tdSpace.setAttribute("valign","top");
		tdSpace.className = "todotab_space";
		var img = document.createElement("img");
		img.setAttribute("border","0");
		img.setAttribute("src","/Images/spacer.gif");
		img.setAttribute("width","1");
		img.setAttribute("height","1");
		tdSpace.appendChild(img);
		//parent.appendChild(tdSpace);
		//Bug Id 8436 Fixed.
		//Modified by Rajeshkumar P on 06-September-2010
		//"\u00a0" is the unicode for &nbsp; (Printing a space)
		var sp = document.createTextNode("\u00a0")
		parent.appendChild(sp);
		parent.appendChild(td);
		
		activateTabs(id);
 }
 
	 function getTanksWithLocation(locId,newLocName){
	 
	 	document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddLocationDiv").style.display = "none";
	 	appendLocationToParent(locId,newLocName);

	 	ShowLocationTankListDiv(locId);
	 }
	 
	 function getQuoteTanksWithLocation(locId,newLocName){
	 	
	 	document.getElementById("LocList").style.display = "none";
	 	document.getElementById("Loc3TableData").style.display = "none";
	 	document.getElementById("LocList").innerHTML = "";
		document.getElementById("AddLocationDiv").style.display = "none";
	 	appendLocationToParent(locId,newLocName);
	
	 	ShowQuoteLocationTankListDiv(locId);
	 }
	 
	 function ShowQuoteLocationTankListDiv(locId,id){
	
	 
	 	
	
	if(showLocationsTanksDiv){ //Checked for tab close operation
	 if(document.getElementById("LocList") != undefined){
			document.getElementById("LocList").style.display = "none";
			document.getElementById("LocList").innerHTML = "";
	}
	if(document.getElementById("Loc3TableData") != undefined){
	 		document.getElementById("Loc3TableData").style.display = "none";
	 }
 		var subQuoteId = document.getElementById("subQuoteId").value;
 		var customerId = document.getElementById("custId").value;
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
		
		
			appEnabled = IsApplicationDisabled;
			 
		
 		var url ="../getQuoteLocationTankListUI3.do?answer(Object::Customer::CustomerId)="+customerId+"&answer(subQuoteId)="+subQuoteId+"&answer(Object::Quote::Location::LocationId)="+locId+"&answer(appEnabled)="+appEnabled;
 		autologout();
 		new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
 		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
 		if(document.getElementById("Loc3TableData") != undefined){
 			document.getElementById("Loc3TableData").style.display = "none";
 		}
 		if(document.getElementById("LocList") != undefined){
 			document.getElementById("LocList").innerHTML = "";
 		}
		document.getElementById("AddLocationDiv").style.display = "none";
		if(document.getElementById("AddLocationDiv1") != undefined){
			document.getElementById("AddLocationDiv1").innerHTML = " ";
		}
		//document.getElementById("LocList").innerHTML = " ";
		document.getElementById("LocationAndTanksList").innerHTML = transport.responseText;
		
 		document.getElementById("LocationAndTanksList").style.display = "block";	
 		initTankPopUp();
 		
 		},
 		onSuccess: function(transport){
 		//loadTankListTable();//to load data table of Tank List
 		}});
 		if(id!=undefined && id !=null){
 		activateTabs(id);	
 		}
 		addLocationDivActive = false;
 	}
 	showLocationsTanksDiv = true;
 }
 
 function ShowLocationTankListDiv(locId,id){

	if(showLocationsTanksDiv){ //Checked for tab close operation
 		var submissionId = document.getElementById("SubmissionId1").value;
        var submissionStatus="";
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
        var agencyId = document.getElementById("AgencyId1").value;
 		var url ="../getLocationlistForTable.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(Object::Location::LocationId)="+locId;
 		autologout();
 		new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
 		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
 		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddLocationDiv").style.display = "none";
		document.getElementById("AddLocationDiv1").innerHTML = " ";
		document.getElementById("LocationAndTanksList").innerHTML = transport.responseText;
 		document.getElementById("LocationAndTanksList").style.display = "block";	
 		},
 		onSuccess: function(transport){
 		//loadTankListTable();//to load data table of Tank List
 		}});
 		if(id!=undefined && id !=null){
 		activateTabs(id);	
 		}
 		addLocationDivActive = false;
 	}
 	showLocationsTanksDiv = true;
 	
 }
 
 
var AddLocationAvailable = false;
var showLocationsTanksDiv = true;
var index = 0;
function showLocationList(id){

    
    document.getElementById("LocList").innerHTML = '<table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><tr><td class="todotab_yellowbox tab_yellowborder" ><div>&nbsp;</div><table border="0" cellpadding="5" cellspacing="0" width="98%" class="datadispborder" align=center id="Loc3TableData" ><tr><td><div id="LocationList1" class="locformbox1"></div></td></tr></table><p>&nbsp;</div></td></tr></table>';
	
 	document.getElementById("AddLocationDiv").style.display = "none";	
	
	document.getElementById("LocationAndTanksList").style.display = "none";

	loadEndorsementQuoteLocationList1();
	document.getElementById("LocList").style.display = "block";
	document.getElementById("Loc3TableData").style.display = "block";

	addLocationDivActive = false;
	activateTabs(id);
	//loadLocationListTable();
}
function activateTabs(id){	
	var parent = document.getElementById("divide1");
	arrChildren = parent.childNodes;

// loop thru all child nodes
for(i = 0; i < arrChildren.length; i++)
{
 
	objChild = arrChildren[i];
	if(objChild.id != undefined){
		objChild.className = "loctab_inactive left";
	}
}

if(id != null && id!=undefined){
 document.getElementById(id).className = 'loctab_active left';
 }
	//To check that active tab Name
	activeTabId = id;
}
function ShowAddLocationDiv(id){
	if(AddLocationAvailable){//Checked for tab close operation
	 	if(document.getElementById("Loc3TableData") != undefined){
	 		document.getElementById("Loc3TableData").style.display = "none";	
	 	}
	 	if(document.getElementById("LocationAndTanksList") != undefined){
			document.getElementById("LocationAndTanksList").style.display = "none";
		}
		document.getElementById("AddLocationDiv").innerHTML = '<table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><tr><td><div class="formpage2"><div class="content"><div class="formhead2"><h2 class="left">Add Location</h2></div><h3>Location Information</h3><div id="AddLocationDiv1"  ></div></div></div></td></tr></table>';
		updateDivForAddLocation();
		document.getElementById("AddLocationDiv").style.display = "block"; 
		updateDivForAddLocation();
		addLocationDivActive = true;
		activateTabs(id);		
	}
	
}
var addLocationId = "";
function appendtable()
{

	if(AddLocationAvailable == false) {
	index++;
	AddLocationAvailable = true;
		count1++;
		
		var parent = document.getElementById("divide1");
	
		var td=document.createElement("td");
		td.onclick = function() {ShowAddLocationDiv(this.id);}		
		td.setAttribute("border","0");
		td.setAttribute("width","150px");
		td.setAttribute("cellpadding","0");
		td.setAttribute("cellspacing","0");
		td.className = "todotab_active";
		td.setAttribute("height","35");
		var id="AddLocation_"+count1;
		td.setAttribute("id",id);
		addLocationId = id;
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeChild(id);}
		td.appendChild(span);
		
		td.appendChild(document.createTextNode("New Location"));
		
		var tdSpace = document.createElement("td");
		tdSpace.setAttribute("valign","top");
		tdSpace.className = "todotab_space";
		var img = document.createElement("img");
		img.setAttribute("border","0");
		img.setAttribute("src","/Images/spacer.gif");
		img.setAttribute("width","1");
		img.setAttribute("height","1");
		tdSpace.appendChild(img);
		//parent.appendChild(tdSpace);
		//parent.appendChild(img);
		parent.appendChild(td);
		updateDivForAddLocation();
		activateTabs(id);
		addLocationDivActive = true;
	}else{
		//document.getElementById("Loc3TableData").style.display = "none";
		//document.getElementById("AddLocationDiv").style.display = "block";
		//document.getElementById("LocationAndTanksList").style.display = "none";
		addLocationDivActive = true;
		activateTabs(addLocationId);
		updateDivForAddLocation();
	}
}


function updateDivForAddLocation(){
	
	var heading = 'View/Edit Location Information';
	heading.replace(/ /g,"%20");
	var objectName = "LOCATION";
	var objectId = 0;
	var objectVerId =0;
	var objectType = 'QUOTE_RISK';
	var applicationType = 'LOCATION';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ComPropertyId = -1;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;

	var actionName = escape('/savePolicyEILRiskApplicationAction.go?');

	var locationId='-1';
	var recalculateneed = 'recalculate'
	var objAppType = "QUOTE_APPLICATION";

	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	// var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("FamilyId").value;

	
	var pars1 = 'answer(DisplayValue_Object::Location::IsAddedInQuote)=Y&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+
	'&answer(zone)='+zone+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(QuoteId)='+parentQuoteId+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+objAppType+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationEnabled)=Y&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+
	'&answer(Object::Location::LocationId)='+locationId+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId;
	//var heading = '';

	var url = '../GetSubmissionLocation.do?'+pars1;	
	autologout();
	
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);showTab(transport);},
		onSuccess: function(transport){}});

}
var SpecificQuestionAdded = false;
function getSpecificQuestions(tankType){

	var objectId = 0;
	var objectVerId =0;
	var objectName ="";
	var USTSpecQuestionAdded = "";
	var ASTSpecQuestionAdded ="";
	var getSpecQuestion = false;
	var heading = "";
	if(document.getElementById("USTSpecQuestionAdded") !=null && document.getElementById("USTSpecQuestionAdded") != undefined){
	 USTSpecQuestionAdded = document.getElementById("USTSpecQuestionAdded").value;
	 
	}
	if(document.getElementById("ASTSpecQuestionAdded") != null && document.getElementById("ASTSpecQuestionAdded") != undefined){
	 ASTSpecQuestionAdded = document.getElementById("ASTSpecQuestionAdded").value;
	 
	}
	if(USTSpecQuestionAdded != 'Y'){
		if(tankType =='UST'){
			 objectName = "USTSpecificQuestion";
			 getSpecQuestion = true;
			 heading = 'Please answer UST Specific Question';
		}
	}
	if(ASTSpecQuestionAdded  != 'Y'){
		if(tankType =='AST'){
			 objectName = "ASTSpecificQuestion";
			 getSpecQuestion = true;
			 heading = 'Please answer AST Specific Question';
		}
	}
	
	var objectType = 'QUOTE_RISK';
	var Applicationtype = 'QUOTE_APPLICATION'
	var applicationType = 'RISK';
	
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;
	
	var policyId = "";
	var policyVerId = "";
	
	if(document.getElementById("parentPolicyId1") != null && document.getElementById("parentPolicyId1") != undefined) {
		policyId = document.getElementById("parentPolicyId1").value;
	}
	if(document.getElementById("policyVerId1") != null && document.getElementById("policyVerId1") != undefined) {
		policyVerId = document.getElementById("policyVerId1").value;
	}
	var parameters = "answer(Object::Policy::ParentPolicyId)=" + policyId + "&answer(Object::Policy::ParentPolicyVerId)=" + policyVerId;

	var actionName = escape('/savePolicyEILRiskApplicationAction.go?' + parameters);
	var recalculateneed = 'recalculate';
	var locationId=document.getElementById("locIdUpdated").value;
	var recalculateneed = 'recalculate'
	var objAppType = "QUOTE_APPLICATION";
	
	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	var productVerId  = document.getElementById("productVerId").value;
	
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	
		appEnabled = IsApplicationDisabled;
	
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("FamilyId").value;
		
	
	heading.replace(/ /g,"%20");
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=LOCATION&answer(objectType)="location"&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(State)=&answer(zone)=&answer(Object::Submission::InsuredId)='+custId+
	'&answer(Object::Application::ApplicationType)='+Applicationtype+'&answer(parentQuoteId)='+parentQuoteId+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+
	'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+objAppType+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(SubQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+
	'&answer(Object::Location::LocationId)='+locationId+'&answer(QuoteId)='+parentQuoteId+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId;
	
	if(getSpecQuestion ==true){
		var url = '../GetSubmissionSpecificQuestionsForm.do?'+pars1;		
		autologout();
		new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
		showRiskPopUp(transport.responseText,locationId,heading);
		SpecificQuestionAdded = true;
		},onSuccess: function(transport){}});
	}
	
	if(getSpecQuestion==false){
		addRisk();
		YAHOO.example.container.AddTankDialog.cancel();	
	}
}


function editSpecificQuestions(tankType){

	var heading = 'View/Edit Location Information';
	heading.replace(/ /g,"%20");
	
	var objectId = 0;
	var objectVerId =0;
	var objectName ="";
	var USTSpecQuestionAdded = "";
	var ASTSpecQuestionAdded ="";
	var getSpecQuestion = false;
	var heading = "";
	if(document.getElementById("USTSpecQuestionAdded") !=null && document.getElementById("USTSpecQuestionAdded") != undefined){
	 USTSpecQuestionAdded = document.getElementById("USTSpecQuestionAdded").value;
	}
	if(document.getElementById("ASTSpecQuestionAdded") != null && document.getElementById("ASTSpecQuestionAdded") != undefined){
	 ASTSpecQuestionAdded = document.getElementById("ASTSpecQuestionAdded").value;
	}

		if(tankType =='UST'){
			 objectName = "USTSpecificQuestion";
			 getSpecQuestion = true;
			 heading = 'View/Edit UST Specific Questions';
		}


		if(tankType =='AST'){
			 objectName = "ASTSpecificQuestion";
			 getSpecQuestion = true;
			 heading = 'View/Edit AST Specific Questions';
		}

	heading.replace(/ /g,"%20");
	var objectType = 'QUOTE_RISK';
	var applicationType = 'LOCATION';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ComPropertyId = -1;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;
	var recalculateneed = 'recalculate';
	var actionName = escape('/savePolicyEILRiskApplicationAction.go?');

	var locationId=document.getElementById("locIdUpdated").value;
	var recalculateneed = 'recalculate'
	var objAppType = "QUOTE_APPLICATION";

	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	var productVerId  = document.getElementById("productVerId").value;

	var IsApplicationDisabled =document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	
		appEnabled = IsApplicationDisabled;	
	
	
	if(appEnabled == "Y" && tankType == "AST"){
	
		heading = 'View/Edit AST Specific Questions';
	}else if(appEnabled == "N" && tankType == "AST"){
		heading = 'View AST Specific Questions';
	}
	
	if(appEnabled == "Y" && tankType == "UST"){
	
		heading = 'View/Edit UST Specific Questions';
	}else if(appEnabled == "N" && tankType == "UST"){
		heading = 'View UST Specific Questions';
	}
	
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("FamilyId").value;
	var policyId = document.getElementById("parentPolicyId1").value;
	var policyVerId = document.getElementById("policyVerId1").value;

	
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(Object::Policy::ParentPolicyVerId)='+policyVerId+'&answer(Object::Policy::ParentPolicyId)='+policyId+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+
	'&answer(zone)='+zone+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+objAppType+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+
	'&answer(Object::Location::LocationId)='+locationId+'&answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId;
	//var heading = '';

	var url = '../GetSubmissionLocation.do?'+pars1;		
	autologout();
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
		showRiskPopUp(transport.responseText,locationId,heading);
		},onSuccess: function(transport){}});
	
}

function geteditRiskPopUp(tankId,riskType){

	var objectName = riskType;
	var objectId = 0;
	var objectVerId =0;
	var objectType = 'QUOTE_RISK';
	var applicationType = 'RISK';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ComPropertyId = -1;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;
	var policyId = "";
	var policyVerId = "";
	
	if(document.getElementById("parentPolicyId1") != null && document.getElementById("parentPolicyId1") != undefined) {
		policyId = document.getElementById("parentPolicyId1").value;
	}
	if(document.getElementById("policyVerId1") != null && document.getElementById("policyVerId1") != undefined) {
		policyVerId = document.getElementById("policyVerId1").value;
	}
	
	var parameters = "answer(Object::Policy::ParentPolicyId)=" + policyId + "&answer(Object::Policy::ParentPolicyVerId)=" + policyVerId;

	var actionName = escape('/savePolicyEILRiskApplicationAction.go?' + parameters);

	var locationId=document.getElementById("locIdUpdated").value;
	var recalculateneed = 'recalculate'
	var objAppType = "QUOTE_APPLICATION";

	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var recalculateneed = 'recalculate';
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	// var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		
		var heading = 'View/Edit Tank Information';
	}else{
		
		var heading = 'View Tank Information';
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("FamilyId").value;
    
	appEnabled = IsApplicationDisabled;
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+'&answer(QuoteId)='+parentQuoteId+
	'&answer(zone)='+zone+'&answer(Object::Risk::RiskId)='+tankId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+objAppType+'&answer(parentQuoteId)='+parentQuoteId+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+
	'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Location::Risk::StorageTankId)='+tankId+'&answer(Object::Risk::RiskId)='+tankId+'&answer(parentQuoteId)='+parentQuoteId+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId;
	

	var url = '../addTankRiskApp.do?'+pars1;
	autologout();		
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
		showRiskPopUp(transport.responseText,locationId,heading);
		},onSuccess: function(transport){}});

}

function showTab(data){
	
	if(document.getElementById("Loc3TableData") != undefined){
		document.getElementById("Loc3TableData").style.display = "none";
	}
	document.getElementById("LocList").innerHTML = "";
	
	document.getElementById("AddLocationDiv").innerHTML = '<table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><tr><td><div class="formpage2"><div class="content"><div class="formhead2"><h2 class="left">Add Location</h2></div><h3>Location Information</h3><div id="AddLocationDiv1"  ></div></div></div></td></tr></table>';
	document.getElementById("AddLocationDiv1").innerHTML = data.responseText;
	
	document.getElementById("AddLocationDiv").style.display = "block";
	
	document.getElementById("LocationAndTanksList").style.display = "none";
	document.getElementById("LocationAndTanksList").innerHTML = "";
}

	function removeChild(elem){
	
	AddLocationAvailable = false;
	if(!addLocationDivActive){
		showLocationsTanksDiv = false;
	}
	document.getElementById("LocationAndTanksList").style.display = "none";
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		document.getElementById("LocList").innerHTML = '<table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><tr><td class="todotab_yellowbox tab_yellowborder" ><div>&nbsp;</div><table border="0" cellpadding="5" cellspacing="0" width="98%" class="datadispborder" align=center id="Loc3TableData" ><tr><td><div id="LocationList1" class="locformbox1"></div></td></tr></table><p>&nbsp;</div></td></tr></table>';
		
	 	document.getElementById("AddLocationDiv").style.display = "none";	
		
		document.getElementById("LocationAndTanksList").style.display = "none";
	
		loadEndorsementQuoteLocationList1();
		document.getElementById("LocList").style.display = "block";
		document.getElementById("Loc3TableData").style.display = "block";
		document.getElementById("LocationAndTanksList").innerHTML = "";
		activateTabs('LocationSchedule');
		//loadLocationListTable();

	}
	
	function removeLocationsChild(elem){
	
		showLocationsTanksDiv = false;
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		document.getElementById("LocList").innerHTML = '<table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><tr><td class="todotab_yellowbox tab_yellowborder" ><div>&nbsp;</div><table border="0" cellpadding="5" cellspacing="0" width="98%" class="datadispborder" align=center id="Loc3TableData" ><tr><td><div id="LocationList1" class="locformbox1"></div></td></tr></table><p>&nbsp;</div></td></tr></table>';
		loadQuoteLocationList1();
		document.getElementById("Loc3TableData").style.display = "block";
		document.getElementById("AddLocationDiv").style.display = "none";
		document.getElementById("AddLocationDiv1").innerHTML = "";
		document.getElementById("LocationAndTanksList").style.display = "none";
		document.getElementById("LocationAndTanksList").innerHTML = "";
		activateTabs('LocationSchedule');
		
		//loadLocationListTable();
	}
	
	 function AddRisk1(){

		var data =  document.getElementById("tankname").value;	
		var tankType = document.getElementById("RiskSelection").value;
		var locationId = document.getElementById("locIdUpdated").value;
		if(tankType == ""){
		
			alert("Please select Tank Type");			
		
		}else if (data == "" ) {
			alert("Please enter the Tank Name");			
		} else {
			getSpecificQuestions(tankType);
			//addRisk(locationId);
			YAHOO.example.container.AddTankDialog.cancel();		
			document.getElementById("AddTankDialog").style.display = "none";	
		}
	 	
	 }
	 
	 
	 
	 function getEditLocationPopUp(){
	var heading = 'View/Edit Location Information';
	heading.replace(/ /g,"%20");
	
	var objectName = "LOCATION";
	var objectId = 0;
	var objectVerId =0;
	var objectType = 'QUOTE_RISK';
	var applicationType = 'LOCATION';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ComPropertyId = -1;
	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;

	var actionName = escape('/savePolicyEILRiskApplicationAction.go?');
	
	var locationId=document.getElementById("locIdUpdated").value;
	
	var recalculateneed = 'recalculate';
	var objAppType = "QUOTE_APPLICATION";

	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	var productVerId  = document.getElementById("productVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		
		 heading = 'View/Edit Location Information';
	}else{
		
		 heading = 'View Location Information';
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	var FamilyId = document.getElementById("FamilyId").value;
	var recalculateneed = 'recalculate';
	appEnabled = IsApplicationDisabled;
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+
	'&answer(zone)='+zone+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(recalculateneeded)='+recalculateneed+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+objAppType+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+
	'&answer(Object::Location::LocationId)='+locationId+'&answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId;
	//var heading = '';

	var url = '../GetSubmissionLocation.do?'+pars1;		
	autologout();
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
		showRiskPopUp(transport.responseText,locationId,heading);
		},onSuccess: function(transport){}});

}
	 
function closeAddLocation() {

	//NULL Implementation to fix a Javascript error.
	var id="AddLocation_"+count1;
	if(document.getElementById(id) != null && document.getElementById(id) != undefined) {
		removeChild(id);
	}
}