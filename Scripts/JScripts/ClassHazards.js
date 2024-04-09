var addClassDivActive = false;
var activeTabId = "";
var addIndex;
var index =0;
var count1=0;
var AddClassAvailable = false;
var showClassDiv = true;
var index = 0;
var addClassId = "";
var editClass="";
var benefitsArray = new Array();
var benefitsIndex = 0;

var getClassBenefitsTab = "false";
var openTabHazardsId = "" ;

function disableEnterKey(e) {
	key = e ? e.which : window.event.keyCode;
	if(key==13) {
		return false;
	}
}

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
	var parent = document.getElementById("classHazardTab");
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
 		var pars = 'answer(ApplicationName)=Quote class&answer(Object::Quote::ClassHazardsId)='+classId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(isApplicationEnabled)='+appEnabled+
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
 	   document.getElementById("onAjaxCompleteActiveTabId").value = "ClassHazardsId";
	 	document.getElementById("AddClassDiv").style.display = "none";	
		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("benefitContent").style.display = "none";
		document.getElementById("saveSuccess1").style.display = "none";
		document.getElementById("saveSuccess2").style.display = "none";
		document.getElementById("deleteSuccess1").style.display = "none";
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
		//document.getElementById("AddClassDiv").innerHTML = "";
		activateTabsClassHazards('ClassSchedule');
	}
	
	function LoadNewQuoteHazards(TabId){
		var riskId = document.getElementById("classId").value;
		var pageName = document.getElementById("PageName").value;
		document.getElementById("onAjaxCompleteActiveTabId").value = "HazardsTab";
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
		}else if(IsApplicationDisabled == 'Y'){
			appEnabled = "N";	
		}
		var agencyId = document.getElementById("agencyId").value;
		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
 		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
 		var cancelButtonRequired = "False";
 		var pars = 'answer(ApplicationName)=Quote Class Hazards&answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(cancelButtonRequired)='+cancelButtonRequired+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(IsApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE_CLASS_HAZARDS&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
 		var url = '../DisplayClassHazardsApplication3.0.do?'+pars;	
   		var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_CLASS_HAZARDS_QUESTIONS~APPLICATION_ID)=222&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_CLASS_HAZARDS_QUESTIONS~APPLICATION_VER_ID)=248&answer(riskType)=ClassHazards';
   	 	autologout();
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
	 		document.getElementById("Loc3TableData").style.display = "none";
	 		document.getElementById("dialog1").style.display = "none";	 		
			document.getElementById("AddClassDiv").style.display = "block";
			document.getElementById("AddClassDiv").innerHTML = transport.responseText;
			if(document.getElementById("submitButtonNew")!=null&&document.getElementById("submitButtonNew")!='undefined'){
				document.getElementById("submitButtonNew").className="covsmallbutton"; 
				
			}
	 		}});
	}
	
	function showHazardsList1(id){
		recalculate = 0;
		activateTabsClassHazards(id);
		
		var riskId = document.getElementById("classId").value;
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
		appEnabled = 'Y';
		var agencyId = document.getElementById("agencyId").value;
	
		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
		
		var pars = 'answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(IsApplicationEnabled)='+appEnabled+
	 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
	 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
	 				
	 	var url = '../getQuoteHazardsList.do?'+pars;	
	    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId;
	    autologout();
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
	 		document.getElementById("Loc3TableData").style.display = "none";
	 		document.getElementById("dialog1").style.display = "none";
	 		document.getElementById("benefitContent").style.display = "none";
	 		document.getElementById("saveSuccess1").style.display = "none";
			document.getElementById("saveSuccess2").style.display = "none";
			document.getElementById("deleteSuccess1").style.display = "none";			
			document.getElementById("AddClassDiv").style.display = "block";
			document.getElementById("AddClassDiv").innerHTML = transport.responseText;
	 		}});
	}
	function showHazardsListforClose1(id,riskId){
		activateTabsClassHazards(id);
		
		
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
		appEnabled = 'Y';
		var agencyId = document.getElementById("agencyId").value;
	
		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
		
		var pars = 'answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(IsApplicationEnabled)='+appEnabled+
	 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
	 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
	 				
	 	var url = '../getQuoteHazardsList.do?'+pars;	
	    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId;
	    autologout();
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
	 		document.getElementById("Loc3TableData").style.display = "none";
	 		document.getElementById("dialog1").style.display = "none";
	 		document.getElementById("benefitContent").style.display = "none";
	 		document.getElementById("saveSuccess1").style.display = "none";
			document.getElementById("saveSuccess2").style.display = "none";
			document.getElementById("deleteSuccess1").style.display = "none";			
			document.getElementById("AddClassDiv").style.display = "block";
			document.getElementById("AddClassDiv").innerHTML = transport.responseText;
	 		}});
	}
	YAHOO.namespace("example.container");
	function initTankPopUp(){

	if(renderPopup==true){
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
		renderPopup=false;
		}
	}
	
	function getBenefitsAppl(hazardsId,hazardsName,classId,id){
	if(getClassBenefitsTab){
		activateBenefitsTabs(id);
		document.getElementById("onAjaxCompleteActiveTabId").value = "BenefitsTab";
		var riskId = document.getElementById("classId").value;
		var cancelButtonRequired = "False";
		var pageName = document.getElementById("PageName").value;
		 	var actName = "";	 	
		 	if(pageName=="CoveragesAndLimits"){
		 		actName = "/saveHazardsApplication3.0.go?";
		 	}else{
		 		actName = "/saveBenefitsApplicationQuote.go?";
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
	 	var planState = document.getElementById("planState").value
	 	var pars = 'answer(ApplicationName)=Class Benefits&answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=BENEFITV1&answer(applicationType)=RISK&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(IsApplicationEnabled)='+appEnabled+
	 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE_CLASS_BENEFITS&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
	 				
	 				var url = '../DisplayClassHazardsApplication3.0.do?'+pars;	
	    var pars2  = 'answer(Object::Plan::StateCode)='+planState+'&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_ID)=305&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_VER_ID)=331&answer(riskType)=ClassBenefits&answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(Object::Application::HazardsId)='+hazardsId;
	     autologout();
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
		document.getElementById("AddClassDiv").style.display="none";
		document.getElementById("dialog1").style.display = "none";
		//document.getElementById("AddClassDiv").innerHTML="";
		document.getElementById("dialog1").innerHTML = "";
		document.getElementById("saveSuccess1").style.display = "none";
		document.getElementById("saveSuccess2").style.display = "none";
		document.getElementById("deleteSuccess1").style.display = "none";
		document.getElementById("benefitContent").style.display="block";
		document.getElementById("benefitContent").innerHTML=transport.responseText;		
		
		if(document.getElementById("submitButtonNew")!=null&&document.getElementById("submitButtonNew")!='undefined'){
			
			document.getElementById("submitButtonNew").className="covsmallbutton"; 
			
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
		document.getElementById("CovLimitsDiv").innerHTML="";
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
	}*/
	
	function getEditClassPopUp(classId){	
		document.getElementById("onAjaxCompleteActiveTabId").value = "editClass";

		var objectId = 611;
		var objectVerId =688;
		var objectName = "CLASS";	
		var objectType = 'RISK';
		var Applicationtype = 'QUOTE_APPLICATION';
		var applicationType = 'RISK';
		var quoteId = document.getElementById('parentQuoteId').value;
		var quoteVerId = document.getElementById('parentQuoteVerId').value;
		var ownerId = document.getElementById('ownerId').value;	
		var riskId = classId;
		var custId = document.getElementById('customerId').value;
		var actionName = escape('/saveAddClassApplication.do?');
		var panelName = 'Quote_Panel';
		var cancelButtonRequired = "False";
		var ButtonName = "Save";
		var TabId = 'ClassHazards_Row';
		//document.onkeypress = disableEnterKey
		var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;	
		var appEnabled = "";
		if(IsApplicationDisabled == 'N'){
				appEnabled = 'Y';
		}else{
				appEnabled = "N";	
		}
		var pars1 = 'answer(ApplicationName)=Quote Class&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&OwnerId='+ownerId+
		'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(cancelButtonRequired)='+cancelButtonRequired+
		'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(TabPanelName)='+panelName+
		'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
		'&answer(actionName)='+actionName+'&answer(ParentQuoteId)='+quoteId+'&answer(ParentQuoteVerId)='+quoteVerId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(activateTabId)='+TabId+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(QuoteId)='+quoteId+'&answer(Object::Customer::CustomerId)='+custId;
		
		var url = '../DisplayAddClassApplication.do?'+pars1;	
			new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
			getClassAppl(transport.responseText);
		}});
	}
	function getClassAppl(data){			
		document.getElementById("CovLimitsDiv").style.display = "none";
	 	document.getElementById("ClassList1").style.display="none";
	 	document.getElementById("AddClassDiv").style.display="none";
		document.getElementById("benefitContent").style.display="none";
		document.getElementById("AddClassDiv").innerHTML="";
		document.getElementById("saveSuccess1").style.display = "none";
		document.getElementById("saveSuccess2").style.display = "none";
		document.getElementById("deleteSuccess1").style.display = "none";
		document.getElementById("dialog1").innerHTML = data;	
		//to replace the content.
		document.getElementById("dialog1").style.display = "block";
		
		if(document.Class.submitButtonNew !=null&&document.Class.submitButtonNew!='undefined'){
			
			document.Class.submitButtonNew.className="covsmallbutton"; 
			
		}
		if(document.getElementById("sbttn")!=null&&document.getElementById("sbttn")!='undefined'){
			
			document.getElementById("sbttn").className="covsmallbutton"; 
			
		}
		
		//document.getElementById("dialog1").className="locformpages";		
	}
	
	//Added for getting Benefits information as tab
	function removeBenefitsChild(classId,elem){
		if(recalculate){
			removeBenefitsTabs(classId);
			showHazardsList1("hazardList");
			
		getClassBenefitsTab = false;
		var parent = document.getElementById("classHazardTab");
		var childId = document.getElementById(elem);
		childId.style.display = "none";		
		document.getElementById("benefitContent").style.display="none";
		activateTabsClassHazards('hazardList');
		showHazardsListforClose1('hazardList',classId)
		document.getElementById("AddClassDiv").style.display="block";
		var classIdExist = openTabHazardsId.match(elem);
		if (classIdExist!=null){
			var class1Id = "," + elem;
			openTabHazardsId=openTabHazardsId.replace(class1Id," ");
		}
		
		}else{
		getClassBenefitsTab = false;
		var parent = document.getElementById("classHazardTab");
		var childId = document.getElementById(elem);
		childId.style.display = "none";		
		document.getElementById("benefitContent").style.display="none";
		activateTabsClassHazards('hazardList');
		document.getElementById("AddClassDiv").style.display="block";
		var classIdExist = openTabHazardsId.match(elem);
		if (classIdExist!=null){
			var class1Id = "," + elem;
			openTabHazardsId=openTabHazardsId.replace(class1Id," ");
		}
		}
	}
	
	function getBenefits(hazardsId,hazardsName,classId){	
		var braceFound = hazardsName.indexOf('(');
		var strhazardsName = new String(hazardsName);	
		document.getElementById("hazardId").value = hazardsId;
		document.getElementById("hazardsName").value = hazardsName;
			
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
		
		var parent = document.getElementById("classHazardTab");
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
		var parent = document.getElementById("classHazardTab");
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