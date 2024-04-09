var addClassDivActive = false;
var activeTabId = "";
var addIndex;
var index =0;
var count1=0;
var AddClassAvailable = false;
var showClassDiv = true;
var index = 0;
var addClassId = "";

function getClassBenefits(classId,newClassName){
		 	document.getElementById("Loc3TableDatas").style.display = "none";
			document.getElementById("AddClassDivs").style.display = "none";
		 	appendClassToParentBenefits(classId,newClassName);
}

 function appendClassToParentBenefits(classId,newClassName){
 		count1++;
		var tsrClassName = new String(newClassName);
		tsrClassName = tsrClassName.replace(/%20/g," ");
		tsrClassName = tsrClassName.replace(/___/g,"'");
		var parent = document.getElementById("divideTabs");
		var anc = document.createElement("a");	
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "addClass"+count1+classId;
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeClassesChild(id);}
		anc.appendChild(span);
		anc.onclick = function() {ShowClassDivClassBenefits(classId,this.id);}		
		parent.appendChild(anc);	
		anc.appendChild(document.createTextNode(tsrClassName));
		ShowClassDivClassBenefits(classId,id);
		//activateTabsClassBenefits(id);
 }

 	function activateTabsClassBenefits(id){	
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
		//To check that active tab Name
		activeTabId = id;

	}
	
	 function ShowClassDivClassBenefits(classId,id){
	 if(showClassDiv){
	 //	var pageName = document.getElementById("PageName").value;
	 	var actName = "";	 	
	 //	if(pageName=="CoveragesAndLimits"){
	 //		actName = "/saveApplication3.0.go?";
	 //	}else{
	 //		actName = "/saveApplicationQuoteSummary3.0.go?";
	 //	}
		activateTabsClassBenefits(id);
 		var locationListArraySize = 0;	 	 	
 		var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
		var appEnabled = "";
		if(IsApplicationDisabled == 'N'){
			appEnabled = 'Y';
		}else{
			appEnabled = "N";	
		}
		var agencyId = document.getElementById("agencyId").value;
		
 		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("custId").value;
		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
 		var pars = 'answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ClassBenefits::ClassBenefitsId)='+classId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=CLASSBENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassBenefits_Row&answer(isApplicationEnabled)='+appEnabled+
				'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(Object::Customer::CustomerId)='+custId+'&answer(PolicyId)='+policyId+'&answer(customerId)='+custId+'&answer(PolicyVerId)='+policyVerId+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId;
 		
 		var url = '../DisplayApplication3.0.do?'+pars;	
    
   		var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     	autologout();
     	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableDatas").style.display = "none";
		document.getElementById("AddClassDivs").style.display = "block";
		document.getElementById("AddClassDivs").innerHTML = transport.responseText;
		document.getElementById("Application").className = "todotab_yellow";
 		}});
		//if(id!=undefined && id !=null){
 		//activateTabs(id);	
 		//}
 		addClassDivActive = false;
 	}
 	showClassDiv = true;
 	 }
 	 
 	 function showCommonBenefits(id){
	 	document.getElementById("AddClassDivs").style.display = "none";	
		document.getElementById("Loc3TableDatas").style.display = "block";
    	addClassDivActive = false;
		activateTabsClassBenefits(id);
		LoadNewQuoteBenefits(id);
	}
 	 function showClassListClassBenefits(id){
	 	document.getElementById("AddClassDivs").style.display = "none";	
		document.getElementById("Loc3TableDatas").style.display = "block";
    	addClassDivActive = false;
		activateTabsClassBenefits(id);
		//loadClassListTable();
	}
	
	function removeClassesChild(elem){
		showClassDiv = false;
		var parent = document.getElementById("divideTabs");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		document.getElementById("Loc3TableDatas").style.display = "block";
		document.getElementById("AddClassDivs").style.display = "none";
		document.getElementById("AddClassDivs").innerHTML = "";
		activateTabsClassBenefits('ClassSchedule');
	}
	
	
	function LoadNewQuoteBenefits(TabId){
//	var pageName = document.getElementById("PageName").value;
	 	var actName = "";	 	
//	 	if(pageName=="CoveragesAndLimits"){
//	 		actName = "/saveBenefitsApplication3.0.go?";
//	 	}else{
//	 		actName = "/saveBenefitsApplication3.0.go?";
//	 	}
 	var locationListArraySize = 0;	 	
 	
 	var policyId    = document.getElementById("policyId").value;

	var policyVerId = document.getElementById("policyVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("custId").value;
 	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
 		var pars = 'answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=BENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassBenefits_Row&answer(isApplicationEnabled)='+appEnabled+
				'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(Object::Customer::CustomerId)='+custId+'&answer(PolicyId)='+policyId+'&answer(customerId)='+custId+'&answer(PolicyVerId)='+policyVerId+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId;
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
   var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableDatas").style.display = "none";
		document.getElementById("AddClassDivs").style.display = "block";
		document.getElementById("AddClassDivs").innerHTML = transport.responseText;
		document.getElementById("Application").className = "todotab_yellow";
 		}});
	}
	
	// Policy Information script
	
	 function activateInnerTabs(TabId){

 	document.getElementById('PolicyInformationDiv').style.display="block";
	 if(document.getElementById("Pol_Definition_Row") != undefined){
    	//document.getElementById("Pol_Definition_Row").disabled = true;
    	document.getElementById("Pol_Definition_Row").className = "todotab_inactive";
    	}
   	 if(document.getElementById("Pol_Hazards_Row") != undefined){
    	//document.getElementById("Pol_Hazards_Row").disabled = true;
    	document.getElementById("Pol_Hazards_Row").className = "todotab_inactive";
    	}    	
   	 if(document.getElementById("Pol_Benefits_Row") != undefined){
    	//document.getElementById("Pol_Benefits_Row").disabled = true;
    	document.getElementById("Pol_Benefits_Row").className = "todotab_inactive";
    	}
    if(document.getElementById(TabId)!=undefined){
    document.getElementById(TabId).disabled = false;
	 	document.getElementById(TabId).className = "todotab_active";
	 }
	 }
	
 	function LoadPolicyDefinitionTab(TabId){
	activateQuoteTabs("PolicyInformationTab");
 	activateInnerTabs(TabId);
 	var locationListArraySize = 0;	 	
 	document.getElementById("PolicyDiv").style.display="none";
 	
	var policyId    = document.getElementById("policyId").value;
	var policyVerId = document.getElementById("policyVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

 	var ownerId = document.getElementById("ownerId").value;
	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=POLICYINFORMATION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)=N'+
 				'&answer(Object::Application::ApplicationId__POL_ADD_POLICY_POLICYINFORMATION~APPLICATION_ID)=202&answer(Object::Application::ApplicationVerId__POL_ADD_POLICY_POLICYINFORMATION~APPLICATION_VER_ID)=228&answer(riskTerritory)=&answer(State)=&answer(policyId)='+policyId+'&answer(ObjectType)=POLICY_INFORMATION&answer(objectType)=QuoteAdditionalInsured&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(policyId)='+policyId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(policyVerId)='+policyVerId;

 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("PolicyDiv").style.display = "none";
		 	},onSuccess: function(transport){	
		 	//document.getElementById("PolicyDiv").innerHTML = "";
		 	
		 	document.getElementById("PolicyInformationDiv").style.display = "block";
		 	document.getElementById("PolicyInformationDivContent").innerHTML= transport.responseText;
		 	//document.getElementById("Policy Information").className = "todotab_yellowbox4";
		 	document.getElementById("Application").className = "";
		 	
		 	
		 	}
		}
	);
	}
	
	function LoadPolicyHazardsTab(TabId){
	activateQuoteTabs("PolicyInformationTab");
 	activateInnerTabs(TabId);
 	var locationListArraySize = 0;	 	
 	document.getElementById("PolicyDiv").style.display="none";
 	var policyId    = document.getElementById("policyId").value;
	var policyVerId = document.getElementById("policyVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

 	var ownerId = document.getElementById("ownerId").value;
 	
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=HAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)=N'+
 				'&answer(Object::Application::ApplicationId__POL_ADD_POLICY_HAZARDS~APPLICATION_ID)=252&answer(Object::Application::ApplicationVerId__POL_ADD_POLICY_HAZARDS~APPLICATION_VER_ID)=278&answer(riskTerritory)=&answer(State)=&answer(policyId)='+policyId+'&answer(ObjectType)=QUOTE&answer(objectType)=QuoteAdditionalInsured&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(policyId)='+policyId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(policyVerId)='+policyVerId;
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    autologout();
	new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("PolicyDiv").style.display = "none";
		 	},onSuccess: function(transport){	
		 	//document.getElementById("PolicyDiv").innerHTML = "";
		 	
		 	document.getElementById("PolicyInformationDiv").style.display = "block";
		 	document.getElementById("PolicyInformationDivContent").innerHTML= transport.responseText;
		 	//document.getElementById("Hazards").className = "todotab_yellowbox4";	 	
		 	document.getElementById("Application").className = "";
		 	}
		}
	);
	}
	
	function LoadPolicyBenefitsTab(TabId){
	activateQuoteTabs("PolicyInformationTab");
 	activateInnerTabs(TabId);
 	var locationListArraySize = 0;	 	
 	document.getElementById("PolicyDiv").style.display="none";
 	var policyId    = document.getElementById("policyId").value;
	var policyVerId = document.getElementById("policyVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

 	var ownerId = document.getElementById("ownerId").value;
 	var parentQuoteId = document.getElementById("parentQuoteId").value;
 	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
 	var pars = 'answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=POLICY_APPLICATION&answer(objectName)=BENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)=N'+
 				'&answer(Object::Application::ApplicationId__POL_ADD_POLICY_BENEFITS~APPLICATION_ID)=262&answer(Object::Application::ApplicationVerId__POL_ADD_POLICY_BENEFITS~APPLICATION_VER_ID)=288&answer(riskTerritory)=&answer(State)=&answer(policyId)='+policyId+'&answer(ObjectType)=QUOTE&answer(objectType)=QuoteAdditionalInsured&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(policyId)='+policyId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(policyVerId)='+policyVerId;
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    autologout();
	new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("PolicyDiv").style.display = "none";
		 	},onSuccess: function(transport){	
		 	//document.getElementById("PolicyDiv").innerHTML = "";
		 	
		 	document.getElementById("PolicyInformationDiv").style.display = "block";
		 	document.getElementById("PolicyInformationDivContent").innerHTML= transport.responseText;
		 	//document.getElementById("Benefits").className = "todotab_yellowbox4";
		 	document.getElementById("Application").className = "";
		 	}
		}
	);
	}
	
 function activateQuoteTabs(activateId){
 document.body.style.cursor = "wait";
 activeTabName1 = "";
	
 	if(document.getElementById("DocumentationTab") != undefined){
 	document.getElementById("DocumentationTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("CoveragesLimitsTab") != undefined){
 	document.getElementById("CoveragesLimitsTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("PolicyInformationTab") != undefined){
 	document.getElementById("PolicyInformationTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("PolicyExclusionTab") != undefined){
 	document.getElementById("PolicyExclusionTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("ClassHazardsTab") != undefined){
 	document.getElementById("ClassHazardsTab").className = "todotab_inactive";
	}
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 	document.getElementById("ClassBenefits_Row").className = "todotab_inactive";
 	}
 	if(document.getElementById("EndorsementTab") != undefined){
 	document.getElementById("EndorsementTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("Pol_Definition_Row") != undefined){
 	document.getElementById("Pol_Definition_Row").className = "todotab_inactive";
 	}
 	if(document.getElementById("Pol_Hazards_Row") != undefined){
 	document.getElementById("Pol_Hazards_Row").className = "todotab_inactive";
 	}
 	if(document.getElementById("Pol_Benefits_Row") != undefined){
 	document.getElementById("Pol_Benefits_Row").className = "todotab_inactive";
 	}
 	document.getElementById(activateId).className = "todotab_active";		
 }