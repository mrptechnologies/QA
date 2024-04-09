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
	 	var pageName = document.getElementById("PageName").value;
	 	var actName = "";	 	
	 	if(pageName=="CoveragesAndLimits"){
	 		actName = "/saveApplication3.0.go?";
	 	}else{
	 		actName = "/saveApplicationQuoteSummary3.0.go?";
	 	}
		activateTabsClassBenefits(id);
 		var locationListArraySize = 0;	 	 	
 		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId").value;
		var productVerId  = document.getElementById("ProductVerId").value;
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
		var appEnabled = "";
		if(IsApplicationDisabled == 'N'){
			appEnabled = 'Y';
		}else{
			appEnabled = "N";	
		}
		var agencyId = document.getElementById("agencyId").value;

		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	//	var FamilyId = document.getElementById("ProductFamilyId").value;
 		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
		var parentPolicyId = document.getElementById("parentPolicyId").value;
	 	var policyNumber =document.getElementById("policyNumber").value;
	 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
	 	
	 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
		
 		var pars = 'answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ClassBenefits::ClassBenefitsId)='+classId+'&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_CLASS_BENEFITS~APPLICATION_ID)=242&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_CLASS_BENEFITS~APPLICATION_VER_ID)=268&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSBENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassBenefits_Row&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_CLASS_BENEFITS~APPLICATION_ID)=242&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_CLASS_BENEFITS~APPLICATION_VER_ID)=268&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE_CLASS_BENEFITS&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=ClassBenefits&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassBenefitsY';
 		var url = '../DisplayApplication3.0.do?'+pars;	
    
   		var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
   		  pars2 = pars2+pars3;
     	autologout();
     	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableDatas").style.display = "none";
		document.getElementById("AddClassDivs").style.display = "block";
		document.getElementById("AddClassDivs").innerHTML = transport.responseText;
		document.getElementById("Application").className="";
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
	var pageName = document.getElementById("PageName").value;
	 	var actName = "";	 	
	 	if(pageName=="CoveragesAndLimits"){
	 		actName = "/saveBenefitsApplication3.0.go?";
	 	}else{
	 		actName = "/saveApplicationQuoteSummary3.0.go?";
	 	}
 	var locationListArraySize = 0;	 	
 	
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}
	var agencyId = document.getElementById("agencyId").value;

	var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
//	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	var parentPolicyId = document.getElementById("parentPolicyId").value;
	 	var policyNumber =document.getElementById("policyNumber").value;
	 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
	 	
	 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
 	
 	var pars = 'answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=BENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassBenefits_Row&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassBenefitsY';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
   var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     pars2 = pars2+pars3;
     autologout();
	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableDatas").style.display = "none";
		document.getElementById("AddClassDivs").style.display = "block";
		document.getElementById("AddClassDivs").innerHTML = transport.responseText;
		document.getElementById("Application").className="";
 		}});
	}
	
	function showCommonBenefits(id){
	 	document.getElementById("AddClassDivs").style.display = "none";	
		document.getElementById("Loc3TableDatas").style.display = "block";
    	addClassDivActive = false;
		activateTabsClassBenefits(id);
		LoadNewQuoteBenefits(id);
	}