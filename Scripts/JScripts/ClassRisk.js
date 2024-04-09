var addClassDivActive = false;
var activeTabId = "";
var getClassHazardsTab = "false";
var getClassBenefitsTab = "false";
var displayPanelName = "";
var opentabCount = "0";
var classHazardsId = 0;
var openTabClassesId = "" ;

var openTabHazardsId = "" ;
var openClassPopup = false;

var benefitsArray = new Array();
var benefitsIndex = 0;

function disableEnterKey(e) {
	key = e ? e.which : window.event.keyCode;
	if(key==13) {
		return false;
	}
}

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
		document.getElementById("benefitContent").style.display = "none";
		document.getElementById("classContent").style.display = "none";
		document.getElementById("hazardContent").style.display = "none";
		document.getElementById("benefitContent").style.display = "none";
		document.getElementById("saveSuccess1").style.display="none";
		document.getElementById("saveSuccess2").style.display="none";
		document.getElementById("submissionDialog").style.display = "block";
		document.getElementById("submissionDialog").className = "todotab_yellowbox4";
		document.getElementById("submissionDialog").innerHTML = data.responseText;	
		if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!='undefined'){
			document.getElementById("submitButton").className="covsmallbutton"; 
			
		}
		if(document.Class.submitButtonNew !=null && document.Class.submitButtonNew !='undefined'){
			document.Class.submitButtonNew.className="covsmallbutton"; 
			
		}
		
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
	 	openClassPopup = false;	
	 })
	 
	  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {	 
	 	YAHOO.example.container.dialog2.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 	openClassPopup = false;
	 })
}

	function getClass(classId,newClassName){
			initClassPopUp();
			document.getElementById("ActiveTab").value="AddClassTab";
		 	document.getElementById("Loc3TableData").style.display = "none";
			document.getElementById("AddClassDiv").style.display = "none";
			var classIdExist = openTabClassesId.match(classId);			
			showClassDiv =true;
			if (classIdExist==null){
		 		appendClassToParent(classId,newClassName);
		 		ShowClassDiv(classId);
		 	}else{
		 		var classIdArray=openTabClassesId.split(',');
		 		var classTabId="";
		 		for(var index=0;index<classIdArray.length;index++){
		 			if((classIdArray[index].match(classIdExist))!=null){
		 				classTabId="addClass"+classIdArray[index];
		 				classTabId = classTabId.replace(/^\s+|\s+$/g,"");
		 			}
		 		}		 		
		 		ShowClassDiv(classId,classTabId);
		 	}
	}
	 
function initClassPopUp(){
YAHOO.example.container.dialog2 = new YAHOO.widget.Dialog("RiskPopUp", 
							{ width : "68em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
							  modal : true,
							  zIndex : 1000,
							  constraintoviewport : true,
							  buttons : [],
							  draggable:true					 
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
			try{
			if(YAHOO.example.container.dialog2 != 'undefined' && YAHOO.example.container.dialog2 != null){
				YAHOO.example.container.dialog2.cancel();
				YAHOO.example.container.dialog2.modal = false;
			}
		 	document.getElementById("RiskPopUpBody").innerHTML = " ";
		 	document.getElementById("RiskPopUp").style.display = "none";
		 	
			if(document.getElementById("ActiveTab").value=="ClassHazardsTab"){
				getDerivedHazardsList(transport.responseText);
			}else if(document.getElementById("ActiveTab").value=="PolicyHazardsTab"){
				showSubmissionHazards('SubmissionHazards');
			}else if(document.getElementById("ActiveTab").value=="PolicyBenefitsTab"){
				showBenefitList('submissionBenefits');
			}else if(document.getElementById("ActiveTab").value=="BenefitsTab"){
			
				//Do Nothing
			}else if(document.getElementById("ActiveTab").value=="AddClassTab"){
				addClassDivActive=false;
				getApplication(transport.responseText);
			}else{		
				getApplication(transport.responseText);
			}
			//loadClassListTable();
			}catch(e){
				document.getElementById("loadercontent1").style.display = "none";
				document.getElementById("loadercontent2").style.display = "none";
			}
	}
	function doSpecificSuccessAction(transport){
		//To get risk details after spec question is added.
		try{
			if(YAHOO.example.container.dialog2 != 'undefined' && YAHOO.example.container.dialog2 != null){
				YAHOO.example.container.dialog2.cancel();
				YAHOO.example.container.dialog2.modal = false;
			}
		 	document.getElementById("RiskPopUpBody").innerHTML = " ";
		 	document.getElementById("RiskPopUp").style.display = "none";	
		 	
			if(document.getElementById("ActiveTab").value=="ClassHazardsTab"){
				//getDerivedHazardsList(transport.responseText);
				var classId = document.getElementById('ClassId').value;
				removeBenefitsTabs(classId);
			}else if(document.getElementById("ActiveTab").value=="BenefitsTab"){
				var respText = transport.responseText.replace(/^\s+|\s+$/, '');
				if(respText == "error"){
					document.getElementById("saveSuccess1").style.display = "none";
					document.getElementById("saveSuccess2").style.display = "none";
					document.getElementById("benefitContent").innerHTML = "";			
					document.getElementById("benefitContent").innerHTML = transport.responseText;
				}else{
					document.getElementById("saveSuccess1").style.display = "block";
					document.getElementById("saveSuccess2").style.display = "block";
					document.getElementById("benefitContent").innerHTML = "";			
					document.getElementById("benefitContent").innerHTML = transport.responseText;
					if(document.BenefitsV1.submitButtonNew !=null && document.BenefitsV1.submitButtonNew !='undefined'){
						document.BenefitsV1.submitButtonNew.className="covsmallbutton"; 						
					}
				}
			}else if(document.getElementById("ActiveTab").value=="AddClassTab"){
				getApplication(transport.responseText);			
			}else{
				getApplication(transport.responseText);				
			}
			document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";
			initClassPopUp();
		}catch(err){
			document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";
			initClassPopUp();
		}
	}
	/*To get the derived Hazards List.
	*/
	function getDerivedHazardsList(data){	
	
		document.getElementById("classContent").style.display="none";
		document.getElementById("hazardContent").style.display="block";
		document.getElementById("hazardContent").innerHTML=data;		
		activateClassTabs('classHazardsList');
	}
	function showDerivedHazardTab(classId,id){
		activateClassTabs(id);
		var	submissionId = document.getElementById("SubmissionId1").value;
		
		var submissionVerId = document.getElementById("SubmissionVerId1").value;
		var custId = document.getElementById("customerId1").value;		
		var appEnabled = "";
	
		if(document.getElementById("SubmissionStatus2").value != 'In Progress'){
			appEnabled = 'N';
		}else{
			appEnabled = 'Y';
		}
		var actionName = escape('/saveSubmissionBenefitsApplication3.0.go?');		
		var pars1 = '&answer(Object::Application::ApplicationId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_ID)=305&answer(Object::Application::ApplicationVerId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_VER_ID)=331'+
					'&answer(Object::Application::ApplicationId)=305&answer(Object::Application::ApplicationVerId)=331'+
					'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(objectName)=CLASSBENEFITS&answer(applicationType)=QUOTE'+
					'&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actionName+'&answer(activateTabId)=ClassBenefits_Row&answer(IsApplicationEnabled)='+appEnabled+
 					'&answer(riskTerritory)=&answer(ObjectType)=RISK_CLASS_BENEFITS&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(riskType)=ClassBenefits&answer(recalculateneeded)=recalculate&answer(openTabAPolicyInfo)=openTabClassBenefitsY';
		
		var pars2='&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Quote::Class::ClassId)='+classId+'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId;
		var pars = pars1+pars2;
		var url ='../getHazards.do?'+pars2;
		
		new Ajax.Request(url, {method: 'post',parameters:pars,onComplete:function(transport){},onSuccess: function(transport){
		document.getElementById("classContent").style.display="none";
		document.getElementById("submissionDialog").style.display="none";
		document.getElementById("benefitContent").style.display="none";
		document.getElementById("saveSuccess1").style.display="none";
		document.getElementById("saveSuccess2").style.display="none";
		document.getElementById("hazardContent").style.display="block";
		document.getElementById("hazardContent").innerHTML=transport.responseText;	
		if(document.getElementById("submitButton")!=null&&document.getElementById("submitButton")!='undefined'){
			document.getElementById("submitButton").className="covsmallbutton"; 
			
		}
		if(document.getElementById("submitButtonNew")!=null&&document.getElementById("submitButtonNew")!='undefined'){
			document.getElementById("submitButtonNew").className="covsmallbutton"; 
			
		}
		
	}});
	
	}
	function getBenefitsAppl(hazardsId,hazardsName,classId,id){
		if(getClassBenefitsTab){
		activateBenefitsTabs(id);
		document.getElementById("ActiveTab").value ="BenefitsTab";
		var	submissionId = document.getElementById("SubmissionId1").value;		
		var submissionVerId = document.getElementById("SubmissionVerId1").value;		
		var appEnabled = "";	
		var cancelButtonRequired = "False";
		var planState="";
		if(document.getElementById("planState")!=null && document.getElementById("planState")!='undefined'){
		 planState = document.getElementById("planState").value
		}
		if(document.getElementById("SubmissionStatus2").value != 'In Progress'){
			appEnabled = 'N';
		}else{
			appEnabled = 'Y';
		}
		var actionName = escape('/saveSubmissionBenefitsAppl.go?');		
		var pars1 = 'answer(Object::Application::ApplicationId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_ID)=305&answer(Object::Application::ApplicationVerId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_VER_ID)=331'+
					'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(objectName)=BENEFITV1&answer(applicationType)=RISK'+
					'&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actionName+'&answer(activateTabId)=ClassBenefits_Row&answer(IsApplicationEnabled)='+appEnabled+'&answer(cancelButtonRequired)='+cancelButtonRequired+
 					'&answer(riskTerritory)=&answer(ObjectType)=RISK_CLASS_BENEFITS&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(riskType)=ClassBenefits&answer(recalculateneeded)=recalculate&answer(openTabAPolicyInfo)=openTabClassBenefitsY'+
 					'&answer(Object::Application::ApplicationId)=305&answer(Object::Application::ApplicationVerId)=331&answer(Object::Quote::ClassBenefits::IsSaved)=Y'+
 					'&answer(Object::Quote::ClassBenefits::IsSaved__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~IS_SAVED)=Y';
		
		var pars2='answer(Object::Plan::StateCode)='+planState+'&answer(ApplicationName)=Submission Class Benefits&answer(Object::Quote::Class::ClassId)='+classId+'&answer(Object::Quote::ClassBenefits::IsSaved)=Y&answer(DisplayValue_Object::Quote::ClassBenefits::IsSaved)=Y&answer(Object::Risk::RiskId)='+classId+'&answer(Object::Application::HazardsId)='+hazardsId+'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId;		
		var url ='../AddSubmissionClass1.do?'+pars1;
		
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
		document.getElementById("classContent").style.display="none";
		document.getElementById("submissionDialog").style.display="none";
		document.getElementById("hazardContent").style.display="none";
		document.getElementById("saveSuccess1").style.display="none";
		document.getElementById("saveSuccess2").style.display="none";		
		document.getElementById("benefitContent").style.display="block";
		document.getElementById("benefitContent").innerHTML=transport.responseText;
		if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!='undefined'){
			document.getElementById("submitButton").className="covsmallbutton"; 
			
		}
		if(document.BenefitsV1.submitButtonNew !=null && document.BenefitsV1.submitButtonNew !='undefined'){
			document.BenefitsV1.submitButtonNew.className="covsmallbutton"; 						
		}
		
		}});	
		}
		getClassBenefitsTab = true;
	}
	 
	/*To get the derived Hazards List.
	*/
	/*function getBenefitsAppl1(data,hazardsId){	
		document.getElementById("RiskPopUpBody").className = "todotab_yellowbox2";
		document.getElementById("RiskPopUpBody").style.border="0";
		document.getElementById("ActiveTab").value = "BenefitsTab";
		initClassPopUp();
		count1++;	
		document.getElementById("RiskPopUpBody").innerHTML = data;		
		//to replace the content.
		document.getElementById("containerheading").innerHTML = "Benefits Application";	
		document.getElementById("RiskPopUp").style.display = "block";			
		// Instantiate the Dialog
		YAHOO.example.container.dialog2.show();		
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
	}*/
	
	function showBenefitsApplicationContent(classId,hazardsId,id){
	
		activateClassTabs(id);	
		var	submissionId = document.getElementById("SubmissionId1").value;
		
		var submissionVerId = document.getElementById("SubmissionVerId1").value;
		
		
		var appEnabled = "";
	
		if(document.getElementById("SubmissionStatus2").value != 'In Progress'){
			appEnabled = 'N';
		}else{
			appEnabled = 'Y';
		}
		var actionName = escape('/saveSubmissionBenefitsApplication3.0.go?');		
		var pars1 = '&answer(Object::Application::ApplicationId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_ID)=305&answer(Object::Application::ApplicationVerId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_VER_ID)=331&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(objectName)=CLASSBENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actionName+'&answer(activateTabId)=ClassBenefits_Row&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Application::ApplicationId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_ID)=305&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_CLASS_BENEFITS~APPLICATION_VER_ID)=331&answer(ObjectType)=RISK_CLASS_BENEFITS&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(riskType)=ClassBenefits&answer(recalculateneeded)=recalculate&answer(openTabAPolicyInfo)=openTabClassBenefitsY';
		
		var pars2='answer(Object::Risk::RiskId)='+classId+'&answer(Object::Application::HazardsId)='+hazardsId+'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId;
		var pars = pars1+pars2;
		var url ='../AddSubmissionClass1.do?'+pars2;
		
		new Ajax.Request(url, {method: 'post',parameters:pars,onComplete:function(transport){},onSuccess: function(transport){
			document.getElementById("classContent").style.display="none";
			document.getElementById("hazardContent").style.display="block";
			document.getElementById("hazardContent").innerHTML=transport.responseText;
		}});
	}
	function getApplication(data){		 
	document.getElementById("Loc3TableData").style.display = "none";
	document.getElementById("AddClassDiv").style.display = "none";
	document.getElementById("AddClassDiv").innerHTML = " ";
	document.getElementById("LocationAndTanksList").style.display="inline";
	document.getElementById("LocationAndTanksList").innerHTML = data;
	var newClassName = document.getElementById("newClassNameAssigned").value;
	document.getElementById(activeTabId).lastChild.nodeValue = ""+newClassName;
	openClassPopup = false;	
	var classId = document.getElementById("riskIdUpdated").value;
	
  	if(addClassDivActive){
  		AddClassAvailable =false;
	 	var parent = document.getElementById("divide1");
	 	var childToRemove = document.getElementById(addClassId); 	
	 	parent.removeChild(childToRemove);	 	
	 	appendClassToParent(classId,newClassName);
	 	document.getElementById("LocationAndTanksList").style.display = "block";	
	 	document.getElementById("SubmissionVerId1").value = document.getElementById("newSubmissionVerId").value;
	 	document.getElementById("ClassListSize").innerHTML ="Class List";
 		document.getElementById("ClassListSizeId1").value=document.getElementById("classSizeUpdated").value
 	}
 	getClassHazardsTab="false";
 	showClassHazardTab(classId,"classHazardsQuestion"); 	 	
 }
var count1=0;
 function appendClassToParent(classId,newClassName){
 		//alert("appendClassToParent:" + "classId:"+classId+"newClassName:"+newClassName); 		
 		count1++;
 		openTabClassesId = openTabClassesId +"," + classId+count1;
		var tsrClassName = new String(newClassName);
		tsrClassName = tsrClassName.replace(/%20/g," ");
		tsrClassName = tsrClassName.replace(/___/g,"'");
		var parent = document.getElementById("divide1");
		var anc = document.createElement("a");	
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "addClass"+classId+count1;
		//alert("id:"+id);
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeLocationsChild(classId,id);}
		anc.appendChild(span);
		anc.onclick = function() {ShowClassDiv(classId,this.id);}		
		parent.appendChild(anc);		
		anc.appendChild(document.createTextNode(tsrClassName));
		activateTabs(id);
 }
 
 function ShowClassDiv(classId,id){
 	document.getElementById("ActiveTab").value = "ClassTab";
 	opentabCount = 0;
 	if(showClassDiv){ 
 		var submissionId = document.getElementById("SubmissionId1").value;
 		var submissionVerId = document.getElementById("SubmissionVerId1").value;
        var submissionStatus="";
        var custId = document.getElementById("customerId1").value;
        var ownerId = document.getElementById("ownerId1").value;
       	var riskId = classId;
 		var url ="../CVGetClasslistForTable.do?answer(TabPanelName)=Submission_Panel&answer(Object::Submission::SubmissionId)="+submissionId+"&answer(Object::Submission::SubmissionVerId)="+submissionVerId+"&answer(Object::Submission::SubmissionStatus)="+submissionStatus+"&answer(Object::Submission::InsuredId)="+custId+"&answer(requestForm)=Submission&customerId="+custId+"&answer(Object::UserDetail::ownerId)="+ownerId+"&answer(OwnerId)"+ownerId+"&SearchObjectId="+custId+"&answer(Object::Customer::CustomerId)="+custId+"&answer(Object::Risk::RiskId)="+riskId;
 		var pars2 = 'answer(requestForm)=Submission';
 		autologout();
 		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("AddClassDiv").innerHTML = " ";
		document.getElementById("LocationAndTanksList").innerHTML ="";
		document.getElementById("LocationAndTanksList").innerHTML = transport.responseText;
 		document.getElementById("LocationAndTanksList").style.display = "block";	
 		//loadTankListTable();//to load data table of Tank List
 		}});
 		if(id!=undefined && id !=null){
 		activateTabs(id);	
 		}
 		addClassDivActive = false;
 		setTimeout("getEditClassPopUp("+classId+")",200);
 		openTabHazardsId = "";
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
	openTabHazardsId = "";
 	document.getElementById("AddClassDiv").style.display = "none";	
	document.getElementById("LocationAndTanksList").style.display = "none";
	document.getElementById("saveSuccess1").style.display="none";
	document.getElementById("saveSuccess2").style.display="none";
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

function activateClassTabs(id){	
	var parent = document.getElementById("divideTabs");
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
	document.getElementById("ActiveTab").value="AddClassTab";
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
		span.onclick=function(){showClassList("ClassSchedule");removeChild(id);}
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
	document.getElementById("ActiveTab").value = "AddClassTab";
	var objectName = "CLASS";	
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var ownerId = document.getElementById('ownerId1').value;
	var custId = document.getElementById('customerId1').value;
	var submissionStatus = '';
	var actionName = escape('/CVSaveSubmissionClassRisk1.go?');	
	var riskId=-1;
	var submissionClassSizeUpdated = parseInt(document.getElementById("ClassListSizeId1").value)+1;
	var	submissionId = document.getElementById('SubmissionId1').value;
	var panelName = 'Submission_Panel';
	var cancelButtonRequired = "False";
	var ButtonName = "Next";
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(DisplayValue_Object::Risk::Class::ClassName)=Class '+submissionClassSizeUpdated;
	var url = '../AddSubmissionClass1.do?'+pars1;	
	var pars2 = 'answer(ApplicationName)=Submission Class';
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){showTab(transport);}});
}

function showBenefitList(id){	
	document.getElementById("ActiveTab").value="PolicyBenefitsTab";
	activateTabs(id);
	
	var objectId = 0;
	var objectVerId =0;
	var objectName = "BENEFITS";	
	var objectType = 'QUOTE';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var ownerId = document.getElementById('ownerId1').value;
	var custId = document.getElementById('customerId1').value;
	var submissionStatus = '';
	var actionName = escape('/saveHazardsApplication.go?');
	displayPanelName = "Benefits"	
	var riskId=-1;
	var	submissionId = document.getElementById('SubmissionId1').value;
	var submissionVerId = document.getElementById('SubmissionVerId1').value
		
	var panelName = 'Submission_Panel';
	var cancelButtonRequired = "False";
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=QUOTE&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	'&answer(State)=&answer(riskTerritory)=&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Submission::SubmissionVerId)='+submissionVerId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId+
	'&answer(Object::Customer::SubmissionVerId)='+submissionVerId+
	'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
	var pars2 = 'answer(ApplicationName)=Submission Class';
	
	var url = '../AddSubmissionClass1.do?'+pars1;	
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){showTab(transport);}});
}

function getClassHazardTabs(riskId,newClassName){
		document.getElementById("ActiveTab").value = "ClassHazardsTab";
		appendClassHazardTabs(riskId,newClassName);
		showClassHazardTab(riskId);
}
var count1=0;
 function appendClassHazardTabs(riskId,newClassName){
 		if(opentabCount == 0)
 		{
	 		opentabCount = 1;
	 		count1++;
	 		getClassHazardsTab = "true";
			var tsrClassName = new String(newClassName);
			tsrClassName = tsrClassName.replace(/%20/g," ");
			tsrClassName = tsrClassName.replace(/___/g,"'");
			tsrClassName = tsrClassName +"-Hazard Questions"
			var parent = document.getElementById("divideTabs");
			var anc = document.createElement("a");	
			anc.setAttribute("href","javascript:void(0);");
			anc.className = "loctab_active left";
			var id = "addClass"+count1+riskId;
			anc.setAttribute("id",id);
			//var span = document.createElement("span");
			//span.className = "close right";
			//span.onclick=function(){removeHazardsChild(id);}
			//anc.appendChild(span);
			anc.onclick = function() {getClassHazardsTab ="false";showClassHazardTab(riskId,id);}
			parent.appendChild(anc);	
			anc.appendChild(document.createTextNode(tsrClassName));
			activateClassTabs(id);
			classHazardsId = id;
		}
		else{
			getClassHazardsTab ="false";
		}
 }

function showClassHazardTab(riskId,id){		
	document.getElementById("ActiveTab").value=="ClassHazardsTab"
	if(getClassHazardsTab == "false"){
		activateClassTabs(id);
	}
	var objectId = 0;
	var objectVerId =0;
	var objectName = "CLASSHAZARDS";	
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'QUOTE';
	var ownerId = document.getElementById('ownerId1').value;
	var custId = document.getElementById('customerId1').value;
	var submissionStatus = '';
	var actionName = escape('/saveSubmissionClassHazards.go?');
	var	submissionId = document.getElementById('SubmissionId1').value;
	var panelName = 'Submission_Panel';
	var cancelButtonRequired = "False";
	var ButtonName ="Next";

	var status = document.getElementById("SubmissionStatus2").value;
	if(status != 'In Progress'){
			appEnabled = 'N';
		}else{
			appEnabled = 'Y';
	}
	
	var pars1 = 'answer(ButtonName)='+ButtonName+'&answer(Object::Application::ApplicationId)=222&answer(Object::Application::ApplicationVerId)=248&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=QUOTE&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	'&answer(State)=&answer(riskTerritory)=&answer(zone)=&answer(TabPanelName)='+panelName+'&answer(IsApplicationEnabled)='+appEnabled+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(ObjectType)=RISK_CLASS_HAZARDS&answer(riskType)=ClassHazards&answer(DisplayValue_Object::Quote::ClassHazards::IsSaved)=Y';
	var url = '../AddSubmissionClass1.do?'+pars1;	
	var pars2 = 'answer(ApplicationName)=Submission Class Hazards&answer(Object::Application::ApplicationId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_QUESTIONS~APPLICATION_ID)=222&answer(Object::Application::ApplicationVerId__DMS_SUBMISSION_VER_ADD_CLASS_HAZARDS_QUESTIONS~APPLICATION_VER_ID)=248&answer(Object::Quote::Class::ClassId)='+riskId;
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){showClassHazardList(transport);
	if(document.getElementById("submitButtonNew")!=null&&document.getElementById("submitButtonNew")!='undefined'){
		document.getElementById("submitButtonNew").className="covsmallbutton"; 
		
	}	
	
	}});
}

function showClassHazardList(data){
	//activateClassTabs('classHazardsList');
	document.getElementById("benefitContent").style.display = "none";
	document.getElementById("classContent").style.display="none";
	document.getElementById("submissionDialog").style.display="none";
	document.getElementById("submissionDialog").innerHTML="";
	document.getElementById("saveSuccess1").style.display="none";
	document.getElementById("saveSuccess2").style.display="none";
	document.getElementById("benefitContent").style.display="none";
	document.getElementById("benefitContent").innerHTML="";
	document.getElementById("hazardContent").style.display="block";
	document.getElementById("hazardContent").innerHTML=data.responseText;
	document.getElementById("ActiveTab").value="ClassHazardsTab"
}
function showClassInformation(id){
	activateClassTabs(id);
	document.getElementById("hazardContent").style.display="none";
	document.getElementById("classContent").style.display="block";
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
	var submissionStatus = document.getElementById("SubmissionStatus2").value;
	var appEnabled = "";
	if(document.getElementById("SubmissionStatus1").value != 'In Progress'){
		appEnabled = 'N';
	}else{
		appEnabled = 'Y';
	}
	var pars1 = 'answer(ApplicationName)=Submission Class&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
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
	document.getElementById("AddClassDiv").innerHTML = '<div class="formpage4" style = "padding-top:25px;border:0px #d2d2d2 solid;"><div id="AddClassDiv1" style="border: 1px #f0aa39 solid;"></div></div>'
	document.getElementById("AddClassDiv1").innerHTML = data.responseText;
	document.getElementById("LocationAndTanksList").style.display = "none";
	document.getElementById("LocationAndTanksList").innerHTML = data.responseText;
	
	if(document.getElementById("submitButtonNew") != undefined && document.getElementById("submitButtonNew") != null ){
		document.getElementById("submitButtonNew").className="covsmallbutton";
	}
}

	function removeChild(elem){
		AddClassAvailable = false;
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    	document.getElementById("displayAddLocationBtnDiv").style.display = "none";
		}		
		if(document.getElementById("classContent")!=null && document.getElementById("classContent")!=undefined){
			document.getElementById("classContent").style.display="block";
		}
		if(document.getElementById("hazardContent")!=null && document.getElementById("hazardContent")!=undefined){
			document.getElementById("hazardContent").style.display="none";
		}
		activateTabs('ClassSchedule');
		
		//loadLocationListTable();

	}
	
	function removeHazardsChild(elem){
		AddClassAvailable = false;
		var parent = document.getElementById("divideTabs");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    	document.getElementById("displayAddLocationBtnDiv").style.display = "none";
		}		
		
		activateClassTabs('classInformation');
		document.getElementById("hazardContent").style.display="none";
		document.getElementById("classContent").style.display="block";
		opentabCount = 0;		
		//loadLocationListTable();

	}
	
	function removeLocationsChild(classId,elem){
		//alert("removeLocationsChild:" + "classId:"+classId+"elem:"+elem);
		showClassDiv = false;
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		document.getElementById(elem).style.display = "none";
		if(document.getElementById("displayAddLocationBtnDiv")!=null && document.getElementById("displayAddLocationBtnDiv")!=undefined) {
	    	document.getElementById("displayAddLocationBtnDiv").style.display = "none";
		}
		document.getElementById("Loc3TableData").style.display = "block";
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("AddClassDiv").innerHTML = "";
		document.getElementById("LocationAndTanksList").style.display = "none";
		document.getElementById("LocationAndTanksList").innerHTML = "";
		var classIdExist = openTabClassesId.match(classId);
		//alert("openTabClassesId Before" + openTabClassesId);
		if (classIdExist!=null){
			//alert("not equal to null");
			var class1Id = "," + classId;
			openTabClassesId=openTabClassesId.replace(class1Id," ");
		}
		//alert("openTabClassesId After" + openTabClassesId);
		activateTabs('ClassSchedule');
	}
	
		 
	 
	function getEditClassPopUp(classId){
	var heading = 'View/Edit Class Information';
	document.getElementById("ActiveTab").value="AddClassTab"
	heading.replace(/ /g,"%20");
	var objectId = 611;
	var objectVerId =688;
	var objectName = "CLASS";
	var objectType = 'SUBMISSION';
	var Applicationtype = 'SUBMISSION_APPLICATION'
	var applicationType = 'RISK';
	var riskId = classId;
	var ownerId = document.getElementById("ownerId1").value;
	var custId = document.getElementById("customerId1").value;
	//var submissionStatus = "";
	var	submissionId = document.getElementById("SubmissionId1").value;
	var panelName = 'Submission_Panel';
	var actionName = escape('/CVSaveSubmissionClassRisk1.go?');
	var ButtonName = 'Save Class';
	var appEnabled = "";
	var cancelButtonRequired ="false";
	var status = document.getElementById("SubmissionStatus2").value;
	if(status != 'In Progress'){
			appEnabled = 'N';
		}else{
			appEnabled = 'Y';
	}
	//document.onkeypress = disableEnterKey

	var pars1 = 'answer(ApplicationName)=Submission Class&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(TabPanelName)='+panelName+'&answer(IsApplicationEnabled)='+appEnabled+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+status+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(cancelButtonRequired)='+cancelButtonRequired;

	var url = '../AddSubmissionClass1.do?'+pars1;	
	autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showRiskPopUp(transport,riskId,heading);}});		
    }
	 	 
	function showSubmissionHazards(submissionHazardsId){
		document.getElementById("ActiveTab").value = "PolicyHazardsTab";
		activateTabs(submissionHazardsId);		
		var objectId = 0;
		var objectVerId =0;
		var objectName = "HAZARDS";	
		var objectType = 'QUOTE';
		var Applicationtype = 'SUBMISSION_APPLICATION'
		var applicationType = 'QUOTE';
		var ownerId = document.getElementById('ownerId1').value;
		var custId = document.getElementById('customerId1').value;
		var submissionStatus = '';
		var actionName = escape('/saveHazardsApplication.go?');		
		var	submissionId = document.getElementById('SubmissionId1').value;
		var submissionVerId = document.getElementById('SubmissionVerId1').value
		var panelName = 'Submission_Panel';
		var cancelButtonRequired = "False";
		var ButtonName = "Next";
		displayPanelName = "Hazards";
		
		var pars1 = 'answer(ApplicationName)=Submission Class Hazards&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=QUOTE&answer(objectType)="location"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
		'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(cancelButtonRequired)='+cancelButtonRequired+
		'&answer(State)=&answer(riskTerritory)=&answer(zone)=&answer(TabPanelName)='+panelName+
		'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
		'&answer(Object::Application::ApplicationType)='+Applicationtype+
		'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
		'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId+'&answer(Object::Customer::SubmissionVerId)='+submissionVerId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
		
		var url = '../AddSubmissionClass1.do?'+pars1;	
		autologout();
		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showTab(transport);

		
		if(document.getElementById("submitButton")!=null&&document.getElementById("submitButton")!='undefined'){
			document.getElementById("submitButton").className="covsmallbutton"; 
			
		}
		}});
	}

	function appendClassBenefitTabs(){
 		var riskId=document.getElementById('ClassId').value;
		var tsrClassName = document.getElementById('newClassNameAssigned').value;
		tsrClassName = tsrClassName.replace(/%20/g," ");
		tsrClassName = tsrClassName.replace(/___/g,"'");
		tsrClassName = tsrClassName +"-Benefit List";
		var parent = document.getElementById("divideTabs");
		var anc = document.createElement("a");	
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "addBenefit"+riskId;
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		anc.appendChild(span);
		anc.onclick = function() {showClassBenefitTab(riskId,this.id);	activateClassTabs(this.id)}
		parent.appendChild(anc);	
		anc.appendChild(document.createTextNode(tsrClassName));
		showClassBenefitTab(riskId,id);
		activateClassTabs(id);
 }

function showClassBenefitTab(riskId,id){
	var objectId = 0;
	var objectVerId =0;
	var objectName = "CLASSBENEFITS";	
	var objectType = 'QUOTE';
	var Applicationtype = 'SUBMISSION_APPLICATION';
	var applicationType = 'QUOTE';
	var ownerId = document.getElementById('ownerId1').value;
	var custId = document.getElementById('customerId1').value;
	var submissionStatus = '';
	var actionName = escape('/CVSaveSubmissionClassRisk1.go?');
	

	var	submissionId = document.getElementById('SubmissionId1').value;
	var	submissionVerId = document.getElementById('SubmissionVerId1').value;
	
	var panelName = 'Submission_Panel';
	var cancelButtonRequired = "False";
	var pars1 = 'answer(ApplicationName)=Submission Class Benefits&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=QUOTE&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	'&answer(State)=&answer(riskTerritory)=&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+submissionStatus+
	'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+
	'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+
	'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
	var url = '../AddSubmissionClass1.do?'+pars1;	
	autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){showClassHazardList(transport);}});

}

	function deleteSubmissionClass(riskId){		
		//alert("deleteSubmissionClass"+riskId);
		var	submissionId = document.getElementById('SubmissionId1').value;
		var	submissionVerId = document.getElementById('SubmissionVerId1').value;
        var custId = document.getElementById("customerId1").value;
		
		var pars1 = 'answer(Object::Risk::RiskId)='+riskId+
		'&answer(Object::Submission::SubmissionId)='+submissionId+
		'&answer(Object::Submission::SubmissionVerId)='+submissionVerId+
		'&answer(Object::Customer::CustomerId)='+custId+
		'&answer(Object::Submission::InsuredId)='+custId+'&answer(requestForm)=Submission&answer(DeleteClass)=Y';

		if(confirm('Are you sure to delete this Class?'))
		{
			var url = '../DeleteSubmissionClassAction.do?'+pars1;	
			autologout();
			new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){				
				showClassList('ClassSchedule');
				updateClassListSize(transport);
			}});
			var classIdExist = openTabClassesId.match(riskId);		
			var classIdArray=openTabClassesId.split(',');
 			var childTabToRemove="";
 			for(var index=0;index<classIdArray.length;index++){
 				if((classIdArray[index].match(classIdExist))!=null){
 					childTabToRemove = "addClass"+classIdArray[index];
 					childTabToRemove = childTabToRemove.replace(/^\s+|\s+$/g,"");
 				}
 			}
 			var riskIdToRemove= childTabToRemove.substring(childTabToRemove.indexOf(riskId),childTabToRemove.length);					
			removeLocationsChild(riskIdToRemove,childTabToRemove);
		}
		else
		{
			  return false;
		}
	}
	
	function updateClassListSize(data){
		var classSize1 = 0;
		var data1 = data.responseText;
		if(data1==null || data1==''){			
			classSize1 = 0;
		}else{
			document.getElementById("classSizeUpdatedLoadClassListDiv").innerHTML = data.responseText;
			var classSize1 = document.getElementById('classSizeUpdatedLoadClassList').value;
			document.getElementById("ClassListSizeId1").value=classSize1;
		}
		document.getElementById("ClassListSize").innerHTML ="Class List";
	}
	
	function removeBenefitsChild(classId,elem){
		getClassBenefitsTab = false;
		var parent = document.getElementById("divideTabs");
		var childId = document.getElementById(elem);
		childId.style.display = "none";		
		document.getElementById("benefitContent").style.display="none";
		activateBenefitsTabs('classHazardsList');
		document.getElementById("hazardContent").style.display="block";
		var classIdExist = openTabHazardsId.match(elem);
		if (classIdExist!=null){
			var class1Id = "," + elem;
			openTabHazardsId=openTabHazardsId.replace(class1Id," ");
		}				
	}
	
	function getBenefits(hazardsId,hazardsName,classId){	
		var braceFound = hazardsName.indexOf('(');
		var strhazardsName = new String(hazardsName);		
		if(braceFound > -1){
			strhazardsName = strhazardsName.replace(/[(]/g,"");
			strhazardsName = strhazardsName.replace(/[)]/g,"");
			hazardsName = strhazardsName;
		}
		var matchStr = classId + hazardsName + hazardsId;
		var classIdExist = openTabHazardsId.match(matchStr);
		if (classIdExist==null){	
			var id;
			var classIdArray1 = openTabHazardsId.split(',');
			var classTabId1 = "";
			if(classIdArray1.length > 3){
				alert("Maximum allowed open tabs are 3. Please close the open tabs to open a new tab.");
			}else{			
				count1++;			
				id = "addBenefit"+classId+hazardsName+hazardsId+count1;	
				benefitsIndex++;
				benefitsArray[benefitsIndex] = id;
				appendBenefitTab(hazardsId,hazardsName,classId,id);
				getBenefitsAppl(hazardsId,hazardsName,classId,id);
			}
		}else{
			var classIdArray=openTabHazardsId.split(',');
			var classTabId="";			
			for(var index=0;index<classIdArray.length;index++){
				if((classIdArray[index].match(classIdExist))!=null){
					classTabId=classIdArray[index];
				}
			}
			getBenefitsAppl(hazardsId,hazardsName,classId,classTabId);						
		}
		if(document.getElementById("submitButton")!=null&&document.getElementById("submitButton")!='undefined'){
			document.getElementById("submitButton").className="covsmallbutton"; 
			
		}
		if(document.getElementById("submitButtonNew")!=null&&document.getElementById("submitButtonNew")!='undefined'){
			document.getElementById("submitButtonNew").className="covsmallbutton"; 
			
		}
		
	}
		
	function appendBenefitTab(hazardsId,hazardsName,classId,id){
		openTabHazardsId = openTabHazardsId + "," + id;
		var strhazardsName = new String(hazardsName);
		strhazardsName = strhazardsName.replace(/%20/g," ");
		strhazardsName = strhazardsName.replace(/___/g,"'");
		var nameLength = strhazardsName.length;
		var hazardsNameSubStr = "";
		if(nameLength > 30)
		{
			hazardsNameSubStr = strhazardsName.substring(0,30);
			hazardsNameSubStr = hazardsNameSubStr + "...";
		}else{
			hazardsNameSubStr = strhazardsName;
		}
		
		var parent = document.getElementById("divideTabs");
		var anc = document.createElement("a"); 
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";		
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeBenefitsChild(classId,id);}
		anc.appendChild(span);
		anc.onclick = function(){getBenefitsAppl(hazardsId,hazardsName,classId,id);}  
		parent.appendChild(anc);  
		anc.appendChild(document.createTextNode(hazardsNameSubStr));
		activateBenefitsTabs(id);
		getBenefitsAppl(hazardsId,hazardsName,classId,id);
	}
	
	function activateBenefitsTabs(id){ 
		var parent = document.getElementById("divideTabs");
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
	}
	
	function removeBenefitsTabs(classId){
		for(var i=1; i<benefitsArray.length; i++){	
			document.getElementById(benefitsArray[i]).style.display = "none";
		}
		openTabHazardsId = "";
	}