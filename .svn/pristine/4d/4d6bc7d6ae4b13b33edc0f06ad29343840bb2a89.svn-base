var addClassDivActive = false;
var activeTabId = "";
var addIndex;
var index =0;
var count1=0;
var AddClassAvailable = false;
var showClassDiv = true;
var index = 0;
var addClassId = "";

function getClass(classId,newClassName){
		 	document.getElementById("Loc3TableData").style.display = "none";
			document.getElementById("AddClassDiv").style.display = "none";
		 	appendClassToParent(classId,newClassName);
}

 function appendClassToParent(classId,newClassName){
 		count1++;
		var tsrClassName = new String(newClassName);
		tsrClassName = tsrClassName.replace(/%20/g," ");
		tsrClassName = tsrClassName.replace(/___/g,"'");
		var parent = document.getElementById("divideTab");
		var anc = document.createElement("a");	
		anc.setAttribute("href","javascript:void(0);");
		anc.className = "loctab_active left";
		var id = "addClass"+count1+classId;
		anc.setAttribute("id",id);
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeClassesChild(id);}
		anc.appendChild(span);
		anc.onclick = function() {ShowClassDiv(classId,this.id);}		
		parent.appendChild(anc);	
		anc.appendChild(document.createTextNode(tsrClassName));
		ShowClassDiv(classId,id);
		//activateTabsClassHazards(id);
 }

 	function activateTabsClassHazards(id){	
		var parent = document.getElementById("divideTab");
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
	
	 function ShowClassDiv(classId,id){
	 if(showClassDiv){
	 	var pageName = document.getElementById("PageName").value;
	 	var actName = "";	 	
	 	if(pageName=="CoveragesAndLimits"){
	 		actName = "/saveApplication3.0.go?";
	 	}else{
	 		actName = "/saveApplicationQuoteSummary3.0.go?";
	 	}
	 	activateTabsClassHazards(id);
 		var locationListArraySize = 0;	 	 	
 		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId11").value;
		var productVerId  = document.getElementById("ProductVerId").value;
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
		var subQuoteVerId = document.getElementById("subQuoteVerId").value;
		var appEnabled = "";
		if(IsApplicationDisabled == 'N'){
			appEnabled = 'Y';
		}else{
			appEnabled = "N";	
		}
		var agencyId = document.getElementById("agencyId").value;

		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
 		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
 		var pars = 'answer(Object::Quote::ClassHazardsId)='+classId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
 		var url = '../DisplayApplication3.0.do?'+pars;	
    
   		var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     	autologout();
     	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddClassDiv").style.display = "block";
		document.getElementById("AddClassDiv").innerHTML = transport.responseText;
 		}});
		//if(id!=undefined && id !=null){
 		//activateTabs(id);	
 		//}
 		addClassDivActive = false;
 	}
 	showClassDiv = true;
 	 }
 	 
 	function showHazards(id){
	 	document.getElementById("AddClassDiv").style.display = "none";	
		document.getElementById("Loc3TableData").style.display = "block";
    	addClassDivActive = false;
		activateTabsClassHazards(id);
		LoadNewQuoteHazards(id);
	}
	
 	 function showClassList(id){
	 	document.getElementById("AddClassDiv").style.display = "none";	
		document.getElementById("Loc3TableData").style.display = "block";
    	addClassDivActive = false;
		activateTabsClassHazards(id);
		//loadClassListTable();
	}
	
	function removeClassesChild(elem){
		showClassDiv = false;
		var parent = document.getElementById("divideTab");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		document.getElementById("Loc3TableData").style.display = "block";
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("AddClassDiv").innerHTML = "";
		activateTabsClassHazards('ClassSchedule');
	}
	
	function LoadNewQuoteHazards(TabId){
	var pageName = document.getElementById("PageName").value;
	 	var actName = "";	 	
	 	if(pageName=="CoveragesAndLimits"){
	 		actName = "/saveHazardsApplication3.0.go?";
	 	}else{
	 		actName = "/saveHazardsApplicationQuoteSummary3.0.go?";
	 	}
 	var locationListArraySize = 0;	 	 	
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	var subQuoteId    = document.getElementById("subQuoteId11").value;
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
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=HAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     autologout();
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddClassDiv").style.display = "block";
		document.getElementById("AddClassDiv").innerHTML = transport.responseText;
 		}});
	}
	