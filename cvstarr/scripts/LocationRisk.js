var addLocationDivActive = false;
var activeTabId = "";
YAHOO.namespace("example.container");
function loadTankPopUp() {
	document.getElementById("dialog1").style.display = "block";	
	// Instantiate the Dialog
	YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("dialog1", 
							{ width : "60em",
							  fixedcenter : true,
							  visible : false,
							  constraintoviewport : true
							});
	// Render the Dialog
	YAHOO.example.container.dialog1.render();
	//YAHOO.example.container.dialog1.show();

	 //Event for Cancel risk
	 YAHOO.util.Event.on('CancelRisk', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog1.cancel();
	 	document.getElementById("dialog1").style.display = "none";	
	 })
	YAHOO.util.Event.on('closeIcon1', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog1.cancel();
	 	document.getElementById("dialog1").style.display = "none";	
	 })
}
YAHOO.util.Event.onDOMReady(loadTankPopUp);

var addIndex;
function addRisk(){
	var heading = 'Add Tank Information'
	heading.replace(/ /g,"%20");
	var objectId = 0;
	var objectVerId =0;
	var repeatedSubApplicationID = 159;
	var objectName = document.getElementById("RiskSelection").value;
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ownerId = document.getElementById("ownerId1").value;
	var custId = document.getElementById("customerId1").value;
	var atsSpecId = -1;
	var actionName = escape('/saveSubmissionRisk1.do?');
	var submissionStatus = '';
	var submissionInsuredId = document.getElementById("customerId1").value;
	var submissionStatus = document.getElementById("SubmissionStatus1").value;
	var submissionId = document.getElementById("SubmissionId1").value;
	var tankDesc = document.getElementById("LocationDescription").value;
	var locationId = document.getElementById("locIdUpdated").value;
	var panelName = 'Submission_Panel';
	var RiskName = escape(document.getElementById("tankname").value);
	var ButtonName = 'Save Tank';
	var storageTankId ='-1';
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(repeatedSubApplicationID_ToLoad)='+repeatedSubApplicationID+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+'&answer(ButtonName)='+ButtonName+
	'&answer(zone)='+zone+'&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+submissionInsuredId+
	'&answer(Object::AST::SpecificQuestion::ASTSpecificQuestionId)='+atsSpecId+'&answer(SystemGeneratedNumber_Object::AST::TankNo__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_NUM)= '+
	'&answer(Object::Risk::RiskType__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_TYPE)='+objectName+
	'&answer(Object::UST::TankContents__DMS_SUBMISSION_RISK_STORAGE_TANK~TANK_CONTENTS)=Diesel'+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+submissionInsuredId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+locationId+'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Location::Risk::StorageTankId)='+storageTankId+'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus;

	var url = '../addTankRiskApp.do?'+pars1;
	var par2 = '&answer(Object::UST::TankDescription__DMS_SUBMISSION_RISK_STORAGE_TANK~TANK_DESCRIPTION)='+tankDesc+'&answer(Object::Risk::RiskName__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_NAME)='+RiskName;
	
	 autologout();
	 new Ajax.Request(url, {method: 'post',parameters:par2,onComplete:function(transport){
	 
	 },onSuccess: function(transport){if(transport.responseText!=""){showRiskPopUp(transport,locationId,heading);}else{YAHOO.example.container.dialog2.cancel();}}});

}

	function showRiskPopUp(data,locationId,heading){
		//alert(data.responseText)
		document.getElementById("RiskPopUpBody").innerHTML = data.responseText;
		
		loadRiskSavedPopUp(locationId,heading);
	
	}
	
	
	function loadRiskSavedPopUp(locId,heading) {
	document.getElementById("containerheading").innerHTML = heading;
	document.getElementById("RiskPopUp").style.display = "block";	
	// Instantiate the Dialog
	
	YAHOO.example.container.dialog2.show();
	var locationId = locId;
	YAHOO.util.Event.on('submitButtonForPopUp', 'click', function(e) {	 
	 	ShowLocationTankListDiv(locId);
	 })
	 YAHOO.util.Event.on('closeIcon2', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog2.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 	ShowLocationTankListDiv(locationId);
	 })
	 
	  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog2.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 	ShowLocationTankListDiv(locationId);
	 })
}
function initTankPopUp(){
YAHOO.example.container.dialog2 = new YAHOO.widget.Dialog("RiskPopUp", 
							{ width : "68em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []						 
							});
	// Render the Dialog
	YAHOO.example.container.dialog2.render();
}
function doSpecificSuccessActionForPopUp(){
	YAHOO.example.container.dialog2.cancel();
	 document.getElementById("RiskPopUp").style.display = "none";
		document.getElementById("RiskPopUpBody").innerHTML = "";
}

	function doSpecificOnCompleteAcionForPopUp(){		
	document.getElementById("loadercontent1").style.display ="none";document.getElementById("loadercontent2").style.display ="none";
 	var locIdUpdated = document.getElementById("locIdUpdated").value;
 	ShowLocationTankListDiv(locIdUpdated);	
	
	}
	
	function doSpecificCompleteAction(transport){	
		checkcount = false;
		document.getElementById("loadercontent1").style.display ="none";
		document.getElementById("loadercontent2").style.display ="none";
		loadLocationListTable();
		getApplication(transport.responseText);
		loadLocationListTable();
		
	}
	
	function doSpecificSuccessAction(transport){
	
	//To get risk details after spec question is added.
	document.getElementById("loadercontent1").style.display ="none";
	document.getElementById("loadercontent2").style.display ="none";
	if(SpecificQuestionAdded){
		addRisk();
		SpecificQuestionAdded = false;
	}
	else{
	if(YAHOO.example.container.dialog2 !=null && YAHOO.example.container.dialog2 != undefined){
		YAHOO.example.container.dialog2.cancel();
	}
	document.getElementById("RiskPopUp").style.display = "none";
	document.getElementById("RiskPopUpBody").innerHTML= "";
	getApplication(transport.responseText);
	initTankPopUp();
	}
	
	}
	
	function getApplication(data){
 	document.getElementById("Loc3TableData").style.display = "none";
	document.getElementById("AddLocationDiv").style.display = "none";
	document.getElementById("AddLocationDiv").innerHTML = " ";
	document.getElementById("LocationAndTanksList").innerHTML = data;
	var newLocName = document.getElementById("newLocationNameAssigned").value;
  	if(addLocationDivActive){
  	AddLocationAvailable =false;
	 	var parent = document.getElementById("divide1");
	 	
	 	var childToRemove = document.getElementById(addLocationId); 	
	 	parent.removeChild(childToRemove);	 	
	 	var locId = document.getElementById("locIdUpdated").value;	
	 	appendLocationToParent(locId,newLocName);
	 	document.getElementById("LocationAndTanksList").style.display = "block";	
	 	document.getElementById("SubmissionVerId1").value = document.getElementById("newSubmissionVerId").value;
	 	document.getElementById("LocationListSize").innerHTML ="Location Schedule("+ document.getElementById("locationSizeUpdated").value+")";
 	}
 	document.getElementById(activeTabId).lastChild.nodeValue = ""+newLocName;
 }
var count1=0;
 function appendLocationToParent(locId,newLocName){
 		count1++;
		var tsrLocationName = new String(newLocName);
		//alert(tsrLocationName)
		tsrLocationName = tsrLocationName.replace(/%20/g," ");
		tsrLocationName = tsrLocationName.replace(/___/g,"'");
		var parent = document.getElementById("divide1");
		//alert(tsrLocationName)
		
		var anc = document.createElement("a");	
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "addLocation"+count1+locId;
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeLocationsChild(id);}
		anc.appendChild(span);
		anc.onclick = function() {ShowLocationTankListDiv(locId,this.id);}		
		parent.appendChild(anc);		
		anc.appendChild(document.createTextNode(tsrLocationName));
		activateTabs(id);
 }
 
	 function getTanksWithLocation(locId,newLocName){
	 
	 	document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddLocationDiv").style.display = "none";
	 	appendLocationToParent(locId,newLocName);
	 	ShowLocationTankListDiv(locId);
	 }
	 
	 function getQuoteTanksWithLocation(locId,newLocName){
	 
	 	document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddLocationDiv").style.display = "none";
	 	appendLocationToParent(locId,newLocName);
	 	
	 	ShowQuoteLocationTankListDiv(locId);
	 }
	 
	 function ShowQuoteLocationTankListDiv(locId,id){

	if(showLocationsTanksDiv){ //Checked for tab close operation
 		var url ="../getLocationlistForTable.do?";
 		autologout();
 		new Ajax.Updater({success: 'LocationAndTanksList'},url, {method: 'post',asynchronous:true,encoding :'UTF-8' ,
		onFailure:function(){},
		onException:function(){},
 		onComplete:function(transport){
 		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddLocationDiv").style.display = "none";
		document.getElementById("AddLocationDiv").innerHTML = " ";
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
 
 function ShowLocationTankListDiv(locId,id){
 	
	if(showLocationsTanksDiv){ //Checked for tab close operation
		if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
		    document.getElementById("displayAddLocationBtnDiv").style.display = "block";
		}
 		var submissionId = document.getElementById("SubmissionId1").value;
        var submissionStatus=document.getElementById("SubmissionStatus1").value;
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
        var agencyId = document.getElementById("AgencyId1").value;
 		var url ="../getLocationlistForTable.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Agency::AgencyId)="+agencyId+"&answer(Object::Location::LocationId)="+locId;
 		autologout();
 		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddLocationDiv").style.display = "none";
		document.getElementById("AddLocationDiv").innerHTML = " ";
		document.getElementById("LocationAndTanksList").innerHTML = transport.responseText;
 		document.getElementById("LocationAndTanksList").style.display = "block";	
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

	if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    document.getElementById("displayAddLocationBtnDiv").style.display = "none";
	}
 	document.getElementById("AddLocationDiv").style.display = "none";	
	document.getElementById("LocationAndTanksList").style.display = "none";
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
	if(objChild.id != undefined && objChild.id != null){
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
	//Div page for Add location	
	autologout();
	//Div page for Add location	
	autologout();
	if(classForm){new Ajax.Updater({success: 'AddLocationDiv'},'../cvstarr/AddLocationUI3.jsp',{method:'post',onComplete:function(transport){ ShowAddLocationDiv1(id);},onSuccess: function(transport){}});}		
	new Ajax.Updater({success: 'AddLocationDiv'},'../cvstarr/class3.jsp',{method:'post',onComplete:function(transport){ ShowAddLocationDiv1(id);},onSuccess: function(transport){}});				
}

function ShowAddLocationDiv1(id){
		//Checked for tab close operation
	 	document.getElementById("Loc3TableData").style.display = "none";	
		document.getElementById("LocationAndTanksList").style.display = "none";
		updateDivForAddLocation();
		document.getElementById("AddLocationDiv").style.display = "block"; 
		addLocationDivActive = true;
		//document.getElementById("addLocation1").lastChild.data="Class 1";
		activateTabs(id);		

	
}
var addLocationId = "";

function appendtable()
{
	//Div page for Add location
	autologout();
	document.getElementById("AddLocationDiv").innerHTML = '<div class="formpage1"><div class="content"><div class="formhead"><h2 class="left">Add a Class</h2></div><h3>Class Information</h3><div id="AddLocationDiv1"></div></div></div>';
	appendtable1();
}

function appendtable1()
{	
	if(AddLocationAvailable == false) {
		index++;
		AddLocationAvailable = true;
		var parent = document.getElementById("divide1");
		var anc = document.createElement("a");	
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "addLocation"+index;
		addLocationId = id;
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeChild(id);}
		anc.appendChild(span);
		anc.onclick = function() {ShowAddLocationDiv(this.id);}
		parent.appendChild(anc);
		anc.appendChild(document.createTextNode("New Class"));
		updateDivForAddLocation();
		activateTabs(id);
		addLocationDivActive = true;
	}else{
		addLocationDivActive = true;
		activateTabs(addLocationId);
		updateDivForAddLocation();
	}
}

function updateDivForAddLocation(){		
	var url = '../cvstarr/AddViewClass.jsp';	
	autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showTab(transport);}});
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
	
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var ownerId = document.getElementById("ownerId1").value;
	var custId = document.getElementById("customerId1").value;
	var submissionStatus = document.getElementById("SubmissionStatus1").value;
	var actionName = escape('/saveSubmissionRisk1.go?');
	var locationId=document.getElementById("locIdUpdated").value;
	var	submissionId = document.getElementById("SubmissionId1").value;
	var panelName = 'Submission_Panel';
	heading.replace(/ /g,"%20");
		if(getSpecQuestion ==true){
		var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=LOCATION&answer(objectType)="location"&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(repeatedSubApplicationID_ToLoad)=-1&answer(State)=&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+locationId+'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
		
		var url = '../AddSubmissionSpecificQuestions.do?'+pars1;	
		autologout();
		new Ajax.Request(url, {method: 'post',onComplete:function(transport){
		SpecificQuestionAdded = true;
		},onSuccess: function(transport){showRiskPopUp(transport,locationId,heading);}});
	}
	
	if(getSpecQuestion==false){
		addRisk();
		YAHOO.example.container.dialog1.cancel();	
	}
}


function editSpecificQuestions(tankType){

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
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var ownerId = document.getElementById("ownerId1").value;
	var custId = document.getElementById("customerId1").value;
	var submissionStatus = document.getElementById("SubmissionStatus1").value;
	var actionName = escape('/saveSubmissionRisk1.go?');
	var locationId=document.getElementById("locIdUpdated").value;
	var	submissionId = document.getElementById("SubmissionId1").value;
	var panelName = 'Submission_Panel';
	var appEnabled = "";
	
	if(document.getElementById("SubmissionStatus1").value != 'In Progress'){
		appEnabled = 'N';
	}else{
		appEnabled = 'Y';
	}
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=LOCATION&answer(objectType)="location"&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(repeatedSubApplicationID_ToLoad)=-1&answer(State)=&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+'&answer(IsApplicationEnabled)='+appEnabled+
	'&answer(PrimaryKey_Object::Location::LocationId)='+locationId+'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;

		var url = '../AddSubmissionSpecificQuestions.do?'+pars1;	
		autologout();
		new Ajax.Request(url, {method: 'post',onComplete:function(transport){
		//SpecificQuestionAdded = true;
		},onSuccess: function(transport){showRiskPopUp(transport,locationId,heading);}});


}

function geteditRiskPopUp(tankId,riskType){

	var objectId = 0;
	var objectVerId =0;
	var objectName = riskType;
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var ownerId = document.getElementById("ownerId1").value;
	var custId = document.getElementById("customerId1").value;
	var actionName = escape('/saveSubmissionRisk1.do?');
	var locationId=document.getElementById("locIdUpdated").value;
	var	submissionId = document.getElementById("SubmissionId1").value;
	var   repeatedSubApplicationID_ToLoad = -1;
	var panelName = 'Submission_Panel';
	var ButtonName = 'Save Tank';
	var submissionStatus = document.getElementById("SubmissionStatus1").value;
	var appEnabled = "";
	if(document.getElementById("SubmissionStatus1").value != 'In Progress'){
		appEnabled = 'N';
	}else{
		appEnabled = 'Y';
	}
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(repeatedSubApplicationID_ToLoad)='+repeatedSubApplicationID_ToLoad+'&answer(State)=&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Location::Risk::StorageTankId)='+tankId+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+'&answer(IsApplicationEnabled)='+appEnabled+
	'&answer(Object::Location::Risk::StorageTankId)='+tankId+'&answer(PrimaryKey_Object::Location::LocationId)='+locationId+'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
	var heading = 'View/Edit Tank Information';
	heading.replace(/ /g,"%20");
	var url = '../addTankRiskApp.do?'+pars1;		
	autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showRiskPopUp(transport,locationId,heading);}});

}

function showTab(data){
	if(document.getElementById("Loc3TableData") != undefined){
		document.getElementById("Loc3TableData").style.display = "none";
	}
	
	document.getElementById("AddLocationDiv").style.display = "block";
	document.getElementById("AddLocationDiv1").innerHTML = data.responseText;
	document.getElementById("LocationAndTanksList").style.display = "none";
	document.getElementById("LocationAndTanksList").innerHTML = "";
}

	function removeChild(elem){
	AddLocationAvailable = false;
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    	document.getElementById("displayAddLocationBtnDiv").style.display = "none";
		}		
		document.getElementById("Loc3TableData").style.display = "block";	
		document.getElementById("AddLocationDiv").style.display = "none";
		document.getElementById("AddLocationDiv").innerHTML = "";
		document.getElementById("LocationAndTanksList").style.display = "none";
		document.getElementById("LocationAndTanksList").innerHTML = "";
		activateTabs('LocationSchedule');
		
		//loadLocationListTable();

	}
	
	function removeLocationsChild(elem){
		showLocationsTanksDiv = false;
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    	document.getElementById("displayAddLocationBtnDiv").style.display = "none";		}
		document.getElementById("Loc3TableData").style.display = "block";
		document.getElementById("AddLocationDiv").style.display = "none";
		document.getElementById("AddLocationDiv").innerHTML = "";
		document.getElementById("LocationAndTanksList").style.display = "none";
		document.getElementById("LocationAndTanksList").innerHTML = "";
		activateTabs('LocationSchedule');
		//loadLocationListTable();
	}
	
	 function AddRisk1(){

		var data =  document.getElementById("tankname").value;	
		var tankType = document.getElementById("RiskSelection").value;
		var locationId = document.getElementById("LocationIdForPopUp").value;
		if(tankType == ""){
		
			alert("Please select Tank Type");			
		
		}else if (data == "" ) {
			alert("Please enter the Tank Name");			
		} else {
			getSpecificQuestions(tankType);
			//addRisk(locationId);
			YAHOO.example.container.dialog1.cancel();		
			document.getElementById("dialog1").style.display = "none";	
		}
	 	
	 }
	 
	 
	 
	 function getEditLocationPopUp(){
	
	var heading = 'View/Edit Location Information';
	heading.replace(/ /g,"%20");
	var objectId = 0;
	var objectVerId =0;
	var objectName = "LOCATION";
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var ownerId = document.getElementById("ownerId1").value;
	var custId = document.getElementById("customerId1").value;
	var submissionStatus = document.getElementById("SubmissionStatus1").value;
	var locationId = document.getElementById("locIdUpdated").value;
	var	submissionId = document.getElementById("SubmissionId1").value;
	var panelName = 'Submission_Panel';
	var actionName = escape('/saveSubmissionRisk1.do?');
	var ButtonName = 'Save Location';
	var appEnabled = "";
	if(document.getElementById("SubmissionStatus1").value != 'In Progress'){
		appEnabled = 'N';
	}else{
		appEnabled = 'Y';
	}
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=LOCATION&answer(objectType)="location"&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(repeatedSubApplicationID_ToLoad)=-1&answer(State)=&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+'&answer(ButtonName)='+ButtonName+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+'&answer(IsApplicationEnabled)='+appEnabled+
	'&answer(PrimaryKey_Object::Location::LocationId)='+locationId+'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
	
	var url = '../AddSubmissionLocation1.do?'+pars1;	
	autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showRiskPopUp(transport,locationId,heading);}});

}
	 
