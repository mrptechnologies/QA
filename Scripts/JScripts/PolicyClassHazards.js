var activeTabId = "";
var addIndex;
var index =0;
var count1=0;
var AddClassAvailable = false;
var showClassDiv = true;
var index = 0;
var addClassId = "";
var openTabHazardsId = "";
var opentabCount = "0";
var getClassHazardsTab = "false";
var getClassBenefitsTab = "false";

function getClassInPolicySide(classId,newClassName){
		 	document.getElementById("Loc3TableDataInPolicySide").style.display = "none";
			document.getElementById("AddClassDivInPolicySide").style.display = "none";						
		 	var classIdExist = openTabClassesId.match(classId);
	 		showClassDiv = true;
			if (classIdExist==null){
		 		appendClassToParentPolicy(classId,newClassName);
		 		showClassInfomation(classId);
		 	}else{
		 		var classIdArray=openTabClassesId.split(',');
		 		var classTabId="";
		 		for(var index=0;index<classIdArray.length;index++){
		 			if((classIdArray[index].match(classIdExist))!=null){
		 				classTabId="addClass"+classIdArray[index];
		 			}
		 		}
		 		showClassInfomation(classId,classTabId);
		 	}
}

 function appendClassToParentPolicy(classId,newClassName){
 		if(opentabCount == 0)
 		{
	 		opentabCount = 1;
	 		count1++;
	 		showClassDiv = true;
	 		getClassHazardsTab = "true";
			openTabClassesId = openTabClassesId +"," +classId+count1;
			var tsrClassName = new String(newClassName);
			tsrClassName = tsrClassName.replace(/%20/g," ");
			tsrClassName = tsrClassName.replace(/___/g,"'");
			var parent = document.getElementById("divideTabPolicy");
			var anc = document.createElement("a");	
			anc.setAttribute("href","javascript:void(0);");
			anc.className = "loctab_active left";
			var id = "addClass"+classId+count1;
			anc.setAttribute("id",id);
			var span = document.createElement("span");
			span.className = "close right";
			span.onclick=function(){removeClassesChild(classId,id);activateTabsClassHazards('ClassSchedule');}
			anc.appendChild(span);
			anc.onclick = function() {showClassInfomation(classId,this.id);}		
			parent.appendChild(anc);	
			anc.appendChild(document.createTextNode(tsrClassName));
			//ShowClassDivPolicyClassHazards(classId,id);
			activateTabsClassHazards(id);
		}
		else{
			getClassHazardsTab ="false";
		}
 }

	function showClassInfomation(classId,id){
		opentabCount = 0;
		if(showClassDiv){
			if(id != null && id!=undefined){
				activateTabsClassHazards(id);
			}
			var policyId    = document.getElementById("policyId").value;
			var policyVerId = document.getElementById("policyVerId").value;
			var ownerId = document.getElementById("ownerId").value;
			var pars = 'answer(PolicyId)='+policyId+'&answer(PolicyVerId)='+policyVerId+'&answer(OwnerId)='+ownerId+'&answer(RiskId)='+classId;
		    var url = "../GetPolicyClassTabContent.do?"+pars
	 		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
			document.getElementById("Loc3TableDataInPolicySide").style.display = "none";			
			document.getElementById("AddClassDivInPolicySide").style.display = "block";
			document.getElementById("AddClassDivInPolicySide").innerHTML = transport.responseText;
			document.getElementById("Application").className="";
			
	 		}});
	 		setTimeout("getClassPopUp("+classId+")",400);
	 		openTabHazardsId = "";
	 		addClassDivActive = false;
	 	}
	 	showClassDiv = true;	
	}
	
	function showClassTab(id){
		activateTabsClass(id);
		document.getElementById("classContent").style.display = "block";
		document.getElementById("AddClassDiv").style.display = "none";
	}
	
 	function activateTabsClassHazards(id){	
		var parent = document.getElementById("divideTabPolicy");
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
	
	 function ShowClassDivPolicyClassHazards(id){
	
	 if(showClassDiv){
		activateTabsClass(id);
	 	var locationListArraySize = 0;	 	 	
	 	var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		var productVerId  = document.getElementById("productVerId").value;
		var agencyId = document.getElementById("agencyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("custId").value;
		var classId = document.getElementById("classId").value;
		var parentQuoteId = document.getElementById("parentQuoteId").value;
 		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value; 	
	 	var pars = 'answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+classId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(isApplicationEnabled)=N&answer(riskTerritory)=&answer(ObjectType)=POLICY&answer(objectType)=POLICY&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
	 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(policyId)='+policyId+'&answer(CustomerId)='+custId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(policyVerId)='+policyVerId;
	 				
	 	var url = '../DisplayApplication3.0.do?'+pars;	
	    
	    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
	    autologout();
		new Ajax.Request(url,{method: 'post',parameters:pars2,asynchronous:true,onFailure:function(){},onException:function(){},onComplete:function(transport){enableTabs(); document.getElementById("PolicyDiv").style.display = "block";},onSuccess: function(transport){
		document.getElementById("classContent").style.display = "none";
		document.getElementById("policyDialog").style.display = "none";
		document.getElementById("benefitContent").style.display = "none";
		document.getElementById("AddClassDiv").style.display = "block";
		document.getElementById("AddClassDiv").innerHTML = transport.responseText;
		document.getElementById("Application").className="";
		}});	
	 	addClassDivActive = false;
	 	}
	 	showClassDiv = true;
 	 }
 	 
 	function showHazardsInPolicy(id){
	 	document.getElementById("AddClassDivInPolicySide").style.display = "none";
	 	document.getElementById("benefitContent").style.display = "none";	
		document.getElementById("Loc3TableDataInPolicySide").style.display = "block";
    	addClassDivActive = false;
		activateTabsClassHazards(id);
		LoadNewQuoteHazardsInPolicy(id);
	}
	
 	 function showClassList(id){
	 	document.getElementById("AddClassDivInPolicySide").style.display = "none";	
	 	document.getElementById("benefitContent").style.display = "none";	
		document.getElementById("Loc3TableDataInPolicySide").style.display = "block";
    	addClassDivActive = false;
		activateTabsClassHazards(id);
		//loadClassListTable();
	}
	
	function removeClassesChild(classId,elem){
		showClassDiv = false;
		var parent = document.getElementById("divideTabPolicy");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		document.getElementById("Loc3TableDataInPolicySide").style.display = "block";
		document.getElementById("AddClassDivInPolicySide").style.display = "none";
		document.getElementById("benefitContent").style.display = "none";
		document.getElementById("AddClassDiv").innerHTML = "";
		activateTabsClassHazards('ClassSchedule');
		var classIdExist = openTabClassesId.match(classId);
		if (classIdExist!=null){
			var class1Id = "," + classId;
			openTabClassesId=openTabClassesId.replace(class1Id," ");
		}
		opentabCount = 0;	
	}
	
	function LoadNewQuoteHazardsInPolicy(TabId){
	 	var locationListArraySize = 0;	 	 	
	 	var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		var productVerId  = document.getElementById("productVerId").value;
		var agencyId = document.getElementById("agencyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("custId").value;  	
 	
	 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=HAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(isApplicationEnabled)=N&answer(riskTerritory)=&answer(ObjectType)=POLICY&answer(objectType)=POLICY&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
	 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(PolicyId)='+policyId+'&answer(CustomerId)='+custId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(PolicyVerId)='+policyVerId;
	 				
		var url = '../DisplayApplication3.0.do?'+pars;	
    	
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
	    autologout();
		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableDataInPolicySide").style.display = "none";
		document.getElementById("AddClassDivInPolicySide").style.display = "block";
		
		document.getElementById("AddClassDivInPolicySide").innerHTML = transport.responseText;
		document.getElementById("Application").className=""
 		}});
	}
	
	function activateTabsClass(id){	
		var parent = document.getElementById("classHazardTabPolicy");
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
	
	
YAHOO.namespace("example.container");
function initTankPopUp1(){
YAHOO.example.container.dialog2 = new YAHOO.widget.Dialog("RiskPopUp", 
							{ width : "68em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
							  modal : true,
							  zIndex : 1000,
							  constraintoviewport : true,
							  buttons : []						 
							});
	// Render the Dialog
	YAHOO.example.container.dialog2.render();
}
	var renderPaymentPopup=true;
	function getPaymentNotesPopUp(id){		
		var popupnotesid="popupnotes"+id;
		document.getElementById("PaymentPopup").style.display = "block";
		document.getElementById("Paymentheading").innerHTML="Payment Notes";
		if(renderPaymentPopup){	
			YAHOO.example.container.dialog2 = new YAHOO.widget.Dialog("PaymentPopup", 
									{ width : "50em",								
									  fixedcenter : true,
									  visible : false,
									  close:true,
									  modal : true,
									  zIndex : 1000,
									  constraintoviewport : true,
									  buttons : []						 
									});
				// Render the Dialog
			YAHOO.example.container.dialog2.render();
			renderPaymentPopup=false;
		}		
		YAHOO.example.container.dialog2.show();	
		document.getElementById("PaymentNotesPopUp").innerHTML=document.getElementById(popupnotesid).value
		YAHOO.util.Event.on('closePopupIcon', 'click', function(e) {	 
		 	YAHOO.example.container.dialog2.cancel();
		 	YAHOO.example.container.dialog2.modal = false;
		 	document.getElementById("PaymentPopup").style.display = "none";	
		 	document.getElementById("PaymentNotesPopUp").innerHTML="";
	 })
	}
	function ShowPolicyHazardsList(id){
	 if(showClassDiv){
		activateTabsClass(id);
	 	var locationListArraySize = 0;	 	 	
	 	var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
	 	var ownerId = document.getElementById("ownerId").value;
		var classId = document.getElementById("classId").value; 	
	
		var pars = 'answer(PolicyId)='+policyId+'&answer(PolicyVerId)='+policyVerId+'&answer(OwnerId)='+ownerId+'&answer(ClassId)='+classId;
	 	var url = "../GetPolicyHazardsListAction.do?"+pars;	
		
		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
		document.getElementById("classContent").style.display = "none";
		document.getElementById("policyDialog").style.display = "none";
		document.getElementById("AddClassDiv").style.display = "block";
		document.getElementById("AddClassDiv").innerHTML = transport.responseText;
		document.getElementById("Application").className="";
		}});	
 		
	 	addClassDivActive = false;
	 	}
	 	showClassDiv = true;
 	 }
 	 
	function getBenefitsAppl(hazardsId,hazardsName,classId,id){
		if(getClassBenefitsTab){
			activateBenefitsTabs(id);
			var policyId    = document.getElementById("policyId").value;
			var policyVerId = document.getElementById("policyVerId").value;
			var riskId = document.getElementById("classId").value;
			var	actName = "/saveBenefitsApplicationQuoteSummary3.0.go?";
	 		var locationListArraySize = 0;	 
	 		var cancelButtonRequired = "False";
			var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
			var appEnabled = "N";
			var agencyId = document.getElementById("agencyId").value;
		 	var ownerId = document.getElementById("ownerId").value;
		 	var planState = document.getElementById("planState").value
		 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=BENEFITV1&answer(applicationType)=RISK&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(IsApplicationEnabled)='+appEnabled+
	 					'&answer(riskTerritory)=&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Application::HazardsId)='+hazardsId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	 					'&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+'&answer(openTabAPolicyInfo)=openTabClassHazardY'+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId;
	 				
	 					var url = '../DisplayClassHazardsApplication3.0.do?'+pars;	
		    var pars2  = 'answer(Object::Plan::StateCode)='+planState+'&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
		    autologout();
			new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
			document.getElementById("PolicyInformationDiv").style.display = "none";			
			document.getElementById("policyDialog").style.display="none";
			document.getElementById("AddClassDiv").style.display="block";
			document.getElementById("AddClassDiv").innerHTML=transport.responseText;
 			}});
		}
		getClassBenefitsTab = true;
	}
	
	/*To get the derived Hazards List.
	*/
	/*function getBenefitsAppl1(data,hazardsId){	

	document.getElementById("RiskPopUpBody").className = "todotab_yellowbox2";
	document.getElementById("RiskPopUpBody").style.border="0";
	document.getElementById("RiskPopUpBody").innerHTML = data;	

	//to replace the content.
	document.getElementById("containerheading").innerHTML = "Benefits Application";	
	document.getElementById("RiskPopUp").style.display = "block";
	YAHOO.example.container.dialog2.show();	

	// Instantiate the Dialog
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
		count1++;
	}*/
	
	/* Class Popup in Policy Summary Page */
	
	function showRiskPopUp(data,riskId,heading){
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("benefitContent").style.display = "none";
		document.getElementById("policyDialog").innerHTML = data.responseText;	
		document.getElementById("policyDialog").style.display = "block";		
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

	function getClassPopUp(classId){
	var heading = 'View/Edit Class Information';
	heading.replace(/ /g,"%20");
	var objectId = 611;
	var objectVerId =688;
	var objectName = "CLASS";
	var objectType = 'RISK';
	var Applicationtype = 'POLICY_APPLICATION';
	var applicationType = 'RISK';
	var riskId = classId;
	var ownerId = document.getElementById("ownerId1").value;
	var actionName = "/CVSaveSubmissionClassRisk1.go?";
	var ButtonName = 'Save Class';
	var appEnabled = 'N';	 		
	var cancelButtonRequired = "false";
	var policyId    = document.getElementById("policyId").value;
	var policyVerId = document.getElementById("policyVerId").value;
	var custId = document.getElementById("custId").value;
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(IsApplicationEnabled)='+appEnabled+
	'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(cancelButtonRequired)='+cancelButtonRequired;

	var url = '../DisplayAddClassApplication.do?'+pars1;

	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("policyDialog").style.width="850px";
		document.getElementById("policyDialog").innerHTML = transport.responseText;	
		document.getElementById("policyDialog").style.display = "block";			
		}});
    }
    
    //Added for getting Benefits information as tab
	function removeBenefitsChild(classId,elem){
		getClassBenefitsTab = false;
		var parent = document.getElementById("classHazardTabPolicy");
		var childId = document.getElementById(elem);
		childId.style.display = "none";		
		document.getElementById("benefitContent").style.display="none";
		ShowPolicyHazardsList('hazardList');
		document.getElementById("AddClassDivInPolicySide").style.display="block";
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
		
		var parent = document.getElementById("classHazardTabPolicy");
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
		var parent = document.getElementById("classHazardTabPolicy");
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