var addClassDivActive = false;
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

	function showRiskPopUp(data,riskId,heading){
		document.getElementById("RiskPopUpBody").innerHTML = data.responseText;		
		loadRiskSavedPopUp(riskId,heading);	
	}
		
	function loadRiskSavedPopUp(risId,heading) {
	document.getElementById("containerheading").innerHTML = heading;
	document.getElementById("RiskPopUp").style.display = "block";	
	// Instantiate the Dialog
	
	YAHOO.example.container.dialog2.show();
	var riskId = risId;

	 YAHOO.util.Event.on('closeIcon2', 'click', function(e) { 
	 	YAHOO.example.container.dialog2.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 })
	 
	  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {	 
	 	YAHOO.example.container.dialog2.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 })
}

	function getClass(classId,newClassName){
		 	document.getElementById("Loc3TableData").style.display = "none";
			document.getElementById("AddClassDiv").style.display = "none";
		 	appendClassToParent(classId,newClassName);
		 	ShowClassDiv(classId);
	}
	 
function initTankPopUp(){
YAHOO.example.container.dialog2 = new YAHOO.widget.Dialog("RiskPopUp", 
							{ width : "68em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
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
	//document.getElementById("loadercontent1").style.display ="none";document.getElementById("loadercontent2").style.display ="none";
 	ShowClassDiv();		
	}
	
	function doSpecificCompleteAction(transport){	
		checkcount = false;
		//loadClassListTable();
		getApplication(transport.responseText);
		//loadClassListTable();
	}
	
	function doSpecificSuccessAction(transport){
	//To get risk details after spec question is added.
	document.getElementById("RiskPopUp").style.display = "none";
	document.getElementById("RiskPopUpBody").innerHTML= "";
	getApplication(transport.responseText);
	initTankPopUp();
	}
	
	function getApplication(data){	
	document.getElementById("Loc3TableData").style.display = "none";
	document.getElementById("AddClassDiv").style.display = "none";
	document.getElementById("AddClassDiv").innerHTML = " ";
	document.getElementById("LocationAndTanksList").style.display="inline";
	document.getElementById("LocationAndTanksList").innerHTML = data;
	var newClassName = document.getElementById("newClassNameAssigned").value;
  	if(addClassDivActive){
  		AddClassAvailable =false;
	 	var parent = document.getElementById("divide1");
	 	var childToRemove = document.getElementById(addClassId); 	
	 	parent.removeChild(childToRemove);
	 	var classId = document.getElementById("riskIdUpdated").value;
	 	appendClassToParent(classId,newClassName);
	 	document.getElementById("LocationAndTanksList").style.display = "block";	
	 	document.getElementById("SubmissionVerId1").value = document.getElementById("newSubmissionVerId").value;
	 	document.getElementById("ClassListSize").innerHTML ="Class ("+ document.getElementById("classSizeUpdated").value+")";
 	}
 	document.getElementById(activeTabId).lastChild.nodeValue = ""+newClassName;
 }
var count1=0;
 function appendClassToParent(classId,newClassName){
 		count1++;
		var tsrClassName = new String(newClassName);
		tsrClassName = tsrClassName.replace(/%20/g," ");
		tsrClassName = tsrClassName.replace(/___/g,"'");
		var parent = document.getElementById("divide1");
		var anc = document.createElement("a");	
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "addClass"+count1+classId;
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeLocationsChild(id);}
		anc.appendChild(span);
		anc.onclick = function() {ShowClassDiv(classId,this.id);}		
		parent.appendChild(anc);		
		anc.appendChild(document.createTextNode(tsrClassName));
		activateTabs(id);
 }
 
 function ShowClassDiv(classId,id){
 	if(showClassDiv){ 
 		var submissionId = document.getElementById("SubmissionId1").value;
 		var submissionVerId = document.getElementById("SubmissionVerId1").value;
        var submissionStatus="";
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
       	var riskId = classId;
 		var url ="../CVGetClasslistForTable.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Risk::RiskId)="+riskId;
 		//alert("SubmissionId::"+submissionId+"SubmissionVerId::"+submissionVerId+"submissionStatus::"+submissionStatus+"CustomerId::"+custId+"OwnerId::"+ownerId+"RiskId::"+riskId);
 		autologout();
 		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("AddClassDiv").innerHTML = " ";
		document.getElementById("LocationAndTanksList").innerHTML = transport.responseText;
 		document.getElementById("LocationAndTanksList").style.display = "block";	
 		//loadTankListTable();//to load data table of Tank List
 		}});
 		if(id!=undefined && id !=null){
 		activateTabs(id);	
 		}
 		addClassDivActive = false;
 	}
 	showClassDiv = true;
 }
	  
var AddClassAvailable = false;
var showClassDiv = true;
var index = 0;
function showClassList(id){
	/*if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    document.getElementById("displayAddLocationBtnDiv").style.display = "none";
	}*/
 	document.getElementById("AddClassDiv").style.display = "none";	
	document.getElementById("LocationAndTanksList").style.display = "none";
	document.getElementById("Loc3TableData").style.display = "block";
    addClassDivActive = false;
	activateTabs(id);
	loadClassListTable();
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
function ShowAddClassDiv(id){
	//Div page for Add location	
	autologout();
	new Ajax.Updater({success: 'AddClassDiv'},'../cvstarr/AddClassUI3.jsp',{method:'post',onComplete:function(transport){ ShowAddClassDiv1(id);},onSuccess: function(transport){}});

}
function ShowAddClassDiv1(id){
	if(AddClassAvailable){//Checked for tab close operation
	 	document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("LocationAndTanksList").style.display = "none";
		updateDivForAddClass();
		document.getElementById("AddClassDiv").style.display = "block"; 
		addClassDivActive = true;
		activateTabs(id);		
	}
	
}
var addClassId = "";

function appendtable()
{
//Div page for Add location
	autologout();		
	document.getElementById("AddClassDiv").innerHTML = '<div class="formpage4"><div class="content"><div class="formhead"><h2 class="left">Add Class</h2></div><h3>Class Information</h3><div id="AddClassDiv1"  ></div></div></div>';
	appendtable1();
}

function appendtable1()
{	
	if(AddClassAvailable == false) {
		index++;
		AddClassAvailable = true;
		var parent = document.getElementById("divide1");
		var anc = document.createElement("a");	
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "addClass"+index;
		addClassId = id;
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeChild(id);}
		anc.appendChild(span);
		anc.onclick = function() {ShowAddClassDiv1(this.id);}
		parent.appendChild(anc);
		anc.appendChild(document.createTextNode("New Class"));
		updateDivForAddClass();
		activateTabs(id);
		addClassDivActive = true;
	}else{
		addClassDivActive = true;
		activateTabs(addClassId);
		updateDivForAddClass();
	}
}


function updateDivForAddClass(){	
	var objectId = 611;
	var objectVerId =688;
	var objectName = "CLASS";	
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var ownerId = document.getElementById('ownerId1').value;
	var custId = document.getElementById('customerId1').value;
	var submissionStatus = '';
	var actionName = escape('/CVSaveSubmissionClassRisk1.go?');
	
	var riskId=-1;
	var	submissionId = document.getElementById('SubmissionId1').value;
	var panelName = 'Submission_Panel';
	var cancelButtonRequired = "False";
	var ButtonName = "Continue";
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
	var url = '../AddSubmissionClass1.do?'+pars1;	
	autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showTab(transport);}});
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
if(document.getElementById("Loc3TableData") != undefined){document.getElementById("Loc3TableData").style.display = "none";}
	document.getElementById("AddClassDiv").style.display = "block";
	document.getElementById("AddClassDiv").innerHTML = '<div class="formpage4"><div class="content"><div class="formhead4"><h2 class="left">Add a Class</h2></div> 	<h3>Class Information</h3><div id="AddClassDiv1"></div></div></div>'
	document.getElementById("AddClassDiv1").innerHTML = data.responseText;
	document.getElementById("LocationAndTanksList").style.display = "none";
	document.getElementById("LocationAndTanksList").innerHTML = data.responseText;
}

	function removeChild(elem){
	AddClassAvailable = false;
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    	document.getElementById("displayAddLocationBtnDiv").style.display = "none";
		}		
		document.getElementById("Loc3TableData").style.display = "block";	
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("AddClassDiv").innerHTML = "";
		document.getElementById("LocationAndTanksList").style.display = "none";
		document.getElementById("LocationAndTanksList").innerHTML = "";
		activateTabs('ClassSchedule');
		
		//loadLocationListTable();

	}
	
	function removeLocationsChild(elem){
		showClassDiv = false;
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    	document.getElementById("displayAddLocationBtnDiv").style.display = "none";
		}
		document.getElementById("Loc3TableData").style.display = "block";
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("AddClassDiv").innerHTML = "";
		document.getElementById("LocationAndTanksList").style.display = "none";
		document.getElementById("LocationAndTanksList").innerHTML = "";
		activateTabs('ClassSchedule');
		//loadLocationListTable();
	}
	
		 
	 
	function getEditClassPopUp(){
	var heading = 'View/Edit Class Information';
	heading.replace(/ /g,"%20");
	var objectId = 611;
	var objectVerId =688;
	var objectName = "CLASS";
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var riskId= document.getElementById("riskIdUpdated").value;
	var ownerId = document.getElementById("ownerId1").value;
	var custId = document.getElementById("customerId1").value;
	var submissionStatus = "";
	var	submissionId = document.getElementById("SubmissionId1").value;
	var panelName = 'Submission_Panel';
	var actionName = escape('/CVSaveSubmissionClassRisk1.go?');
	var ButtonName = 'Save Class';
	var appEnabled = "";

	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;

	var url = '../AddSubmissionClass1.do?'+pars1;	
	autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showRiskPopUp(transport,riskId,heading);}});
    }
	 

	