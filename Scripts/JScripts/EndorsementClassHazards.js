var addClassDivActive = false;
var activeTabId = "";
var addIndex;
var index =0;
var count1=0;
var AddClassAvailable = false;
var showClassDiv = true;
var index = 0;
var addClassId = "";
var openTabClassesId ="";
var opentabCount = "0";
var getClassHazardsTab = "false";
var classTabId = "";
var benefitsArray = new Array();
var benefitsIndex = 0;
var getClassBenefitsTab = "false";
var openTabHazardsId = "" ;
var isSpecificValidationNeeded = false;
var AddClassAvailable = false;
function getClass(classId,newClassName){
		 	document.getElementById("Loc3TableData").style.display = "none";
			document.getElementById("AddClassDiv").style.display = "none";
		 	appendClassToParent(classId,newClassName);
}

 function appendClassToParent(classId,newClassName){
 		if(opentabCount == 0)
 		{
	 		opentabCount = 1;
	 		count1++;
	 		openTabClassesId = openTabClassesId +"," + classId+count1;
			var className = new String(newClassName);
			className = className.replace(/%20/g," ");
			className = className.replace(/___/g,"'");
		 	var parent = document.getElementById("EndorsementClassTabs");
			var anc = document.createElement("a");	
			anc.setAttribute("href","javascript:void(0);");
			anc.className = "loctab_active left";
			var id = "addClass"+classId+count1;
			classTabId = id;
			anc.setAttribute("id",id);
			var span = document.createElement("span");
			span.className = "close right";
			span.onclick=function(){removeClass(classId,id);}
			anc.appendChild(span);
			anc.onclick = function() {showClassTab(classId,id); }
			parent.appendChild(anc);	
			anc.appendChild(document.createTextNode(className));
			activateClassTabs(id);
		}
		
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
	 	if(document.getElementById(id)!=null && document.getElementById(id)!=undefined) {
	 		classTabId = id;
	 		activateTabsClassHazards(id);
	 	}
 		var locationListArraySize = 0;	 	 	
 		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId").value;
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
	//	var FamilyId = document.getElementById("ProductFamilyId").value;
 		var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
 		var pars = 'answer(ApplicationName)=Quote Class&answer(Object::Quote::ClassHazardsId)='+classId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
 		var url = '../DisplayApplication3.0.do?'+pars;	
    	var parentPolicyId = document.getElementById("parentPolicyId").value;
	 	var policyNumber =document.getElementById("policyNumber").value;
	 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
	 	
	 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
    	
   		var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
   		    pars2 = pars2+pars3;
     	autologout();
     	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddClassDiv").style.display = "block";
		document.getElementById("AddClassDiv").innerHTML = transport.responseText;
		document.getElementById("Application").className="";
 		}});
		//if(id!=undefined && id !=null){
 		//activateTabs(id);	
 		//}
 		addClassDivActive = false;
 	}
 	showClassDiv = true;
 	 }
 	 
 	function showHazards(id){
    	addClassDivActive = false;
		activateTabsClassHazards(id);
		LoadNewQuoteHazards(id);
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
			document.getElementById("AddClassDiv").style.display = "block";
			document.getElementById("AddClassDiv").innerHTML = transport.responseText;
	 		}});
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
	var subQuoteId    = document.getElementById("subQuoteId").value;
	var productVerId  = document.getElementById("ProductVerId").value;
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	var cancelButtonRequired = "False";
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
 	
 	var pars = 'answer(ApplicationName)=Quote Class Hazards&answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(IsApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE_CLASS_HAZARDS&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassHazardY&answer(cancelButtonRequired)='+cancelButtonRequired;
 	var url = '../DisplayClassHazardsApplication3.0.do?'+pars;	
    var pars2  = 'answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_CLASS_HAZARDS_QUESTIONS~APPLICATION_ID)=222&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_CLASS_HAZARDS_QUESTIONS~APPLICATION_VER_ID)=248&answer(riskType)=ClassHazards&answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId;
     autologout();
	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
 		document.getElementById("Loc3TableData").style.display = "none";
 		document.getElementById("dialog1").style.display = "none";
 		document.getElementById("benefitContent").style.display = "none";
 		document.getElementById("saveSuccess1").style.display = "none";
 		document.getElementById("saveSuccess2").style.display = "none";
		document.getElementById("AddClassDiv").style.display = "block";
		document.getElementById("AddClassDiv").innerHTML = transport.responseText;
		document.getElementById("onAjaxCompleteActiveTabId").value = "HazardList";
		if(document.getElementById("submitButtonNew")!=null && document.getElementById("submitButtonNew")!='undefined'){
			document.getElementById("submitButtonNew").className="covsmallbutton"; 			
		}
 		}});
	}
	
	function LoadAllEndorsementClassList(TabId){
		if(TabId == "ClassHazards_Row"){
			activateTabs(TabId); 	
		}		
		activateClassTabs("ClassList");	
		document.getElementById("docTable").style.display = "none";
		document.getElementById("QuoteDiv").style.display = "none";
		document.getElementById("CoveragesDiv").style.display = "none";
		document.getElementById("PolicyInformationDiv").style.display = "none";
		document.getElementById("saveSuccess1").style.display = "none";
		document.getElementById("EndorsementClass").style.display="block";
		document.getElementById("ClassListDiv").style.display="block";
		document.getElementById("ClassContentDiv").style.display = "none";	
		document.getElementById("CovLimitsDiv").style.display = "none";
		document.getElementById("RiskPopUp").style.display = "none";
		document.getElementById("ScheduleDiv").style.display = "none";
 		  YAHOO.example.XHR_Text = function() {
	 	    
		    var formatUrl = function(elCell, oRecord, oColumn, sData) {        
		 			var className = "'"+oRecord.getData("ClassName")+"'";
		 			var classString = new String(className);
		 			classString = classString.replace(/ /g,"%20");
		 			classString = classString.replace(/&#39;/g,"___");
		 			var classId = oRecord.getData("ClassId");
		 			var onclickscript = "getEndorsementClassList("+classId+","+classString+")";
	             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";                    
	
	        };
	        var formatDeleteUrl = function(elCell, oRecord, oColumn, sData) {        
		 	var className = "'"+oRecord.getData("ClassName")+"'";
		 			
		 		var onclickscript = "deleteEndorsementQuoteClass("+oRecord.getData("ClassId")+")";
	           	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";                    
	
	        };
	        
		 	var moreColumnDefsInProgress = [
	            {key:"Number", resizable:"true",width:50},
	            {key:"Class Name", resizable:"true",formatter:formatUrl,width:150},
	            {key:"Class Description",  resizable:"true",width:500},
	            {key:"Delete Class",  resizable:"true",formatter:formatDeleteUrl,width:80}
	        ];
	        
	        var moreColumnDefsOthers = [
	            {key:"Number", resizable:"true",width:50},
	            {key:"Class Name", resizable:"true",formatter:formatUrl,width:200},
	            {key:"Class Description",  resizable:"true",width:500}
	        ];
	        
	        var parentQuoteStatus = document.getElementById("paretQuoteStatus1").value;
	        var parentQuoteId = document.getElementById("parentQuoteId").value;
	        var submissionStatus="";
	        var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	        var customerId = document.getElementById("customerId").value;
	        var ownerId = document.getElementById("ownerId").value;
	        var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;

	        if(parentQuoteStatus == "In Progress"){
	        var anotherDataSource = new YAHOO.util.DataSource("../GetQuoteClassTabContent.do?"+pars);
	        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        anotherDataSource.responseSchema = {
	            recordDelim: "__~",
	            fieldDelim: "|",
   	            fields: ["Number","Class Name","Class Description","Delete Class","ClassId","ClassName"]	            
	        };
	        
	        }else{
	        var anotherDataSource = new YAHOO.util.DataSource("../GetQuoteClassTabContent.do?"+pars);
	        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        anotherDataSource.responseSchema = {
	            recordDelim: "__~",
	            fieldDelim: "|",
   	            fields: ["Number","Class Name","Class Description","Delete Class","ClassId","ClassName"]	            
	        };
	        }
	        
	        // Configuration for Pagination
	        var myConfigs = {   
	     	paginator : new YAHOO.widget.Paginator({   
	         rowsPerPage    : 10, // REQUIRED  
	               
	         // use a custom layout for pagination controls   
	          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
	      
	         // use these in the rows-per-page dropdown   
	         rowsPerPageOptions : [10,15,20],   
	   
	         // use custom page link labels   
	         pageLabelBuilder : function (page,paginator) {   
	             var recs = paginator.getPageRecords(page);   
	             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
	         }   
	     		})   
	 		};  	
	        
	        if(parentQuoteStatus == "In Progress"){
		        var myDataTableY = new YAHOO.widget.DataTable("ClassListDiv", moreColumnDefsInProgress,anotherDataSource,myConfigs);  
			}else{
				var myDataTableY = new YAHOO.widget.DataTable("ClassListDiv", moreColumnDefsOthers,anotherDataSource,myConfigs);
			}
		   return {
	            oDS2: anotherDataSource,
	          oDT2: myDataTableY
	        };
	    }();
		enableTabs();
	}
	var showClass = false;
	function getEndorsementClassList(classId,newClassName){
		showClass = true;
		var classIdExist = openTabClassesId.match(classId);
			if (classIdExist==null){
		 		appendClassToParent(classId,newClassName);
		 		showClassTab(classId);
		 	}else{
		 		var classIdArray=openTabClassesId.split(',');
		 		var classTabId="";
		 		for(var index=0;index<classIdArray.length;index++){
		 			if((classIdArray[index].match(classIdExist))!=null){
		 				classTabId="addClass"+classIdArray[index];
		 				classTabId = classTabId.replace(/^\s+|\s+$/g,"");
		 			}
		 		}
		 		showClassTab(classId,classTabId);		 		
		 	}
	}
	
	function removeClass(classId,id){
	
		if(document.getElementById(id)!=null && document.getElementById(id)!=undefined) {
	    		document.getElementById(id).style.display = "none";
			}
		LoadAllEndorsementClassList("ClassList");
		showClass = false;
		var classIdExist = openTabClassesId.match(classId);
		if (classIdExist!=null){
			var class1Id = "," + classId;
			openTabClassesId=openTabClassesId.replace(class1Id," ");
		}
		opentabCount = 0;

	}
	function showClassTab(classId,id){
			opentabCount = 0;
			if(showClass){
				if(id != null && id!=undefined){
					activateClassTabs(id);
					classTabId = id;
				}
			 	var parentQuoteId = document.getElementById("parentQuoteId").value;
			    var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
			    var customerId = document.getElementById("customerId").value;
			    var ownerId = document.getElementById("ownerId").value;
			    var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId+'&answer(RiskId)='+classId;
			    var url = "../GetQuoteClass.do?"+pars
		 		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
		 		document.getElementById("ClassListDiv").style.display="none";
		 		document.getElementById("RiskPopUp").style.display="none";
				document.getElementById("ClassContentDiv").innerHTML = transport.responseText;
		 		document.getElementById("ClassContentDiv").style.display = "block";	
		 		}});
		 		setTimeout("getEditClassPopUp("+classId+")",200);
		 		openTabHazardsId="";
	 		}
	 		showClass = true;
	}
	
	var newClassTab=true;
	function addEndorsementClass(){	
	if(newClassTab){
		activateClassTabs(addClassId);
	 	document.getElementById("onAjaxCompleteActiveTabId").value = "AddClass";
		var objectId = 611;
		var objectVerId =688;
		var objectName = "CLASS";	
		var objectType = 'RISK';
		var Applicationtype = 'QUOTE_APPLICATION';
		var applicationType = 'RISK';
		var quoteId = document.getElementById('parentQuoteId').value;
		var quoteVerId = document.getElementById('parentQuoteVerId').value;
		var ownerId = document.getElementById('ownerId').value;
		var custId = document.getElementById('customerId').value;
		var actionName = escape('/saveAddClassApplication.do?');
		var panelName = 'Quote_Panel';
		var cancelButtonRequired = "False";
		var ButtonName = "Continue";
		var riskId = -1;
		var TabId = 'ClassHazards_Row';
		var appEnabled = 'Y';
		var classSizeUpdated = parseInt(document.getElementById("ClassListSizeId").value)+1;
		var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&OwnerId='+ownerId+
		'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(cancelButtonRequired)='+cancelButtonRequired+
		'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(TabPanelName)='+panelName+
		'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
		'&answer(actionName)='+actionName+'&answer(ParentQuoteId)='+quoteId+'&answer(ParentQuoteVerId)='+quoteVerId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+'&answer(QuoteId)='+quoteId+'&answer(DisplayValue_Object::Risk::Class::ClassName)=Class '+classSizeUpdated+'&answer(Object::Customer::CustomerId)='+custId;
		var url = '../DisplayAddClassApplication.do?'+pars1;	
		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
			document.getElementById("ClassListDiv").style.display="none";
			document.getElementById("ClassContentDiv").style.display="none";
			document.getElementById("RiskPopUp").style.display = "block";
			document.getElementById("RiskPopUpBody").innerHTML = transport.responseText;
			if(document.getElementById("submitButtonNew")!=null && document.getElementById("submitButtonNew")!='undefined'){
				document.getElementById("submitButtonNew").className="covsmallbutton"; 			
			}		
		}});
	}
	newClassTab = true;
}
 YAHOO.namespace("example.container");
	function initClassPopup() {
			// Instantiate the Dialog
				YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("RiskPopUp", 
							{ width : "68em",
							  fixedcenter : true,
							  visible : true,
							  close:true,
							  modal : true,
							  zIndex : 1000,
							  constraintoviewport : true
							});
			YAHOO.example.container.dialog1.render();
		}
function doSpecificCompleteAction(transport){	
		//checkcount = false
	 	if(document.getElementById("onAjaxCompleteActiveTabId").value == "AddClass"){
			//LoadAllEndorsementClassList('ClassList');
	 		document.getElementById("RiskPopUpBody").innerHTML = " ";
	 		document.getElementById("RiskPopUp").style.display = "none";
	 		removeAddClass(addClassId);
	 		newClassTab=true;
	 		var parentQuoteId = document.getElementById('parentQuoteId').value;
			var parentQuoteVerId = document.getElementById('parentQuoteVerId').value;		
			var ownerId = document.getElementById('ownerId').value;
			var pars2 = 'answer(OwnerId)='+ownerId+'&answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId;		
			var classCountUrl = '../GetClassCountAfterQuoteDelete.do?'+pars2;
			new Ajax.Request(classCountUrl, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
			if(transport.responseText == ""){
				document.getElementById("classListId").innerHTML = "Class(0)";
				document.getElementById("ClassListSizeId").value=0;
			}else{
				document.getElementById("classListId").innerHTML = "Class("+transport.responseText+")";
				document.getElementById("ClassListSizeId").value=transport.responseText;
			}
			}});
		}
		else if (document.getElementById("onAjaxCompleteActiveTabId").value == "EditClass"){			
			var riskId = document.getElementById('classId').value;			
			var parent = document.getElementById("EndorsementClassTabs");
	 		var childToRemove = classTabId; 				
	 		removeClass(riskId,childToRemove);
	 		opentabCount = 0;
		 	showClass = true;
			showClassTab(riskId);			
			setTimeout ("getApplication()", 200);
		}
		if(document.getElementById("onAjaxCompleteActiveTabId").value=="HazardList"){
			var classId = document.getElementById("classId").value;
			removeBenefitsTabs(classId);
			showHazardsList1("hazardList");
		}
		if(document.getElementById("onAjaxCompleteActiveTabId").value=="BenefitsTab"){
			document.getElementById("saveSuccess1").style.display = "block";
			document.getElementById("saveSuccess2").style.display = "block";
			document.getElementById("benefitContent").innerHTML = "";			
			document.getElementById("benefitContent").innerHTML = transport.responseText;
			if(document.BenefitsV1.submitButtonNew !=null && document.BenefitsV1.submitButtonNew!='undefined'){
				document.BenefitsV1.submitButtonNew.className="covsmallbutton"; 			
			}
		}	
		document.getElementById("loadercontent1").style.display = "none";
		document.getElementById("loadercontent2").style.display = "none";
			
	}
	function getApplication(){
		var riskId = document.getElementById('classId').value;
		var className = document.getElementById('className').value;
		appendClassToParent(riskId,className);
		showHazards('hazardQuestion');
	}
	
	function doSpecificSuccessAction(transport){
		//To get risk details after spec question is added
		//YAHOO.example.container.dialog1.cancel();
	 	//document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	//document.getElementById("RiskPopUp").style.display = "none";	
		//initClassPopup();
		try{
		if(YAHOO.example.container.documentDialog != 'undefined' && YAHOO.example.container.documentDialog != null){
			YAHOO.example.container.documentDialog.cancel();
			YAHOO.example.container.documentDialog.modal = false;
			showFillInFormPopUpProposal();
		}
		if(document.getElementById("onAjaxCompleteActiveTabId").value=="BenefitsTab"){
		
		var respText = transport.responseText.replace(/^\s+|\s+$/, '');
			if(respText == "error"){
				document.getElementById("saveSuccess1").style.display = "none";
				document.getElementById("saveSuccess2").style.display = "none";
			}else{
				document.getElementById("saveSuccess1").style.display = "block";
				document.getElementById("saveSuccess2").style.display = "block";				
			}			
			document.getElementById("benefitContent").innerHTML = "";			
			document.getElementById("benefitContent").innerHTML = transport.responseText;
			document.getElementById('classBenefitsSave').value = "true";
			document.getElementById('referenceStartDate').value = document.getElementById('txtDate').value;
			document.getElementById('QuoteEndDate').value = document.getElementById('expDate1').value;
			document.getElementById('hazardIdRecalc').value = document.getElementById('HazardsId').value;
			document.getElementById('hazardId').value = document.getElementById('HazardsId').value;
			document.getElementById('hazardsNameRecalc').value = document.getElementById('HazardNameHidden').value;
			document.getElementById('classIdRecalc').value = document.getElementById('ClassId').value;
			document.getElementById('classNameRecalc').value = document.getElementById('className').value;
			document.getElementById('recalculateHidden').value = "openTabClassHazardY";
			document.getElementById('classBenefitsTab_ClassTab').value = "true";
			document.getElementById('openTabNameHid').value = "openTabClassHazardY";
			document.getElementById('referenceStartDate').value =document.getElementById('quoteStartDatehidden').value;
			document.getElementById('QuoteEndDate').value =document.getElementById('QuoteEndDatehidden').value; 			
			document.getElementById("frm").submit();
		}	
		document.getElementById("loadercontent1").style.display = "none";
		document.getElementById("loadercontent2").style.display = "none";
		}catch(err){			
			document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";
		}
	}
	
	function activateClassTabs(id){	
		var parent = document.getElementById("EndorsementClassTabs");
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
	
	
	function getEditClassPopUp(classId){	
	document.getElementById("onAjaxCompleteActiveTabId").value ="EditClass";
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
	var ButtonName = "Save Class";
	var TabId = 'ClassHazards_Row';
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
			appEnabled = 'Y';
	}else{
			appEnabled = 'N';	
	}
	var pars1 = 'answer(ApplicationName)=Quote Class&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&OwnerId='+ownerId+
	'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(TabPanelName)='+panelName+
	'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
	'&answer(actionName)='+actionName+'&answer(ParentQuoteId)='+quoteId+'&answer(ParentQuoteVerId)='+quoteVerId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(activateTabId)='+TabId+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(QuoteId)='+quoteId+'&answer(Object::Customer::CustomerId)='+custId;
	var url = '../DisplayAddClassApplication.do?'+pars1;	
	new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
		document.getElementById("AddClassDiv").style.display = "none";
		document.getElementById("benefitContent").style.display = "none";
		document.getElementById("saveSuccess1").style.display = "none";
		document.getElementById("saveSuccess2").style.display = "none";
		document.getElementById("dialog1").style.display = "block";
		document.getElementById("dialog1").innerHTML = transport.responseText;	
		if(document.Class.submitButtonNew !=null && document.Class.submitButtonNew!='undefined'){
			document.Class.submitButtonNew.className="covsmallbutton"; 			
		}	
	}});
	}
	
	function deleteEndorsementQuoteClass(riskId){
		
		var parentQuoteId = document.getElementById('parentQuoteId').value;
		var parentQuoteVerId = document.getElementById('parentQuoteVerId').value;
		var ownerId = document.getElementById('ownerId').value;
		
		var pars1 = 'answer(Object::Quote::ParentQuoteId)='+parentQuoteId+
		'&answer(Object::Quote::parentQuoteVerId1)='+parentQuoteVerId+
		'&answer(Object::Customer::CustomerId)='+riskId;		
		
		if(confirm('Are you sure to delete this Class?'))
		{
			var url = '../DeleteQuoteClassAction.do?'+pars1;	
			autologout();
			new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){LoadAllEndorsementClassList('ClassHazards_Row');
		
			var pars2 = 'answer(OwnerId)='+ownerId+
			'&answer(QuoteId)='+parentQuoteId+
			'&answer(ParentQuoteVerId)='+parentQuoteVerId;
			
		
			var classCountUrl = '../GetClassCountAfterQuoteDelete.do?'+pars2;
			new Ajax.Request(classCountUrl, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
			if(transport.responseText == ""){
				document.getElementById("classListId").innerHTML = "Class(0)";
				document.getElementById("ClassListSizeId").value=0;
				document.getElementById('EndorsementQuoteStartDate').value = document.getElementById('txtDate').value;
				document.getElementById('QuoteEndDate').value = document.getElementById('expDate1').value;
				document.getElementById('deleteClassTab').value = "true";	
				document.getElementById('classBenefitsTab_ClassTab').value = "";
				document.forms[0].submit();
			}else{
				document.getElementById("classListId").innerHTML = "Class("+transport.responseText+")";
				document.getElementById("ClassListSizeId").value=transport.responseText;
				document.getElementById('EndorsementQuoteStartDate').value = document.getElementById('txtDate').value;
				document.getElementById('QuoteEndDate').value = document.getElementById('expDate1').value;
				document.getElementById('deleteClassTab').value = "true";
				document.getElementById('classBenefitsTab_ClassTab').value = "";
				document.forms[0].submit();				
			}
			}});
		}});
			var classIdExist = openTabClassesId.match(riskId);		
			var classIdArray=openTabClassesId.split(',');
	 		var childTabToRemove="";
	 		for(var index=0;index<classIdArray.length;index++){
	 			if((classIdArray[index].match(classIdExist))!=null){
	 				childTabToRemove="addClass"+classIdArray[index];
	 				childTabToRemove = childTabToRemove.replace(/^\s+|\s+$/g,"");
	 			}
	 		}
			var riskIdToRemove= childTabToRemove.substring(childTabToRemove.indexOf(riskId),childTabToRemove.length);					
			removeClass(riskIdToRemove,childTabToRemove);
			var parentQuoteId = document.getElementById('parentQuoteId').value;
			var parentQuoteVerId = document.getElementById('parentQuoteVerId').value;		
			var ownerId = document.getElementById('ownerId').value;
			var pars2 = 'answer(OwnerId)='+ownerId+'&answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId;		
			var classCountUrl = '../GetClassCountAfterQuoteDelete.do?'+pars2;
			new Ajax.Request(classCountUrl, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
				if(transport.responseText == ""){
					document.getElementById("classListId").innerHTML = "Class(0)";
					document.getElementById("ClassListSizeId").value=0;
				}else{
					document.getElementById("classListId").innerHTML = "Class("+transport.responseText+")";
					document.getElementById("ClassListSizeId").value=transport.responseText;
				}
			}});
		}
		else{
			return false;
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
	 	var planState = document.getElementById("planStateId").value
	 	var pars = 'answer(ApplicationName)=Quote Class Benefits&answer(ApplicationName)=Class Benefits&answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=BENEFITV1&answer(applicationType)=RISK&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(IsApplicationEnabled)='+appEnabled+
	 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE_CLASS_BENEFITS&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+'&answer(cancelButtonRequired)='+cancelButtonRequired+
	 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabClassHazardY';
	 				
	 				var url = '../DisplayClassHazardsApplication3.0.do?'+pars;	
	    var pars2  = 'answer(Object::Plan::StateCode)='+planState+'&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_ID)=305&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_CLASS_HAZARDS_BENEFITS_QUESTIONS~APPLICATION_VER_ID)=331&answer(riskType)=ClassBenefits&answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(Object::Application::HazardsId)='+hazardsId;
	     autologout();
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
		document.getElementById("AddClassDiv").style.display="none";
		document.getElementById("dialog1").style.display = "none";
		document.getElementById("saveSuccess1").style.display = "none";
		document.getElementById("saveSuccess2").style.display = "none";
		document.getElementById("benefitContent").style.display="block";
		document.getElementById("benefitContent").innerHTML=transport.responseText;	
		if(document.BenefitsV1.submitButtonNew !=null && document.BenefitsV1.submitButtonNew!='undefined'){
			document.BenefitsV1.submitButtonNew.className="covsmallbutton"; 			
		}	
 		}});
 		}
 		getClassBenefitsTab = true;
	}
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
	var addClassId = "";
	var count2=0;
	function appendAddClassToParent(){
		if(AddClassAvailable == false) {
			AddClassAvailable = true;
			newClassTab=true;
		 	var parent = document.getElementById("EndorsementClassTabs");
			var anc = document.createElement("a");	
			anc.setAttribute("href","javascript:void(0);");
			anc.className = "loctab_active left";
			count2++;
			var id = "newClass"+count2;
			addClassId = id;
			anc.setAttribute("id",id);
			var span = document.createElement("span");
			span.className = "close right";
			span.onclick=function(){removeAddClass(id)}
			anc.appendChild(span);
			anc.onclick = function() {addEndorsementClass();}
			parent.appendChild(anc);	
			anc.appendChild(document.createTextNode("New Class"));
			activateClassTabs(id);
			addEndorsementClass();
		}else{
			newClassTab=true;
			addEndorsementClass();			
		}
	}
	function removeAddClass(id){
		if(document.getElementById(id) !=null && document.getElementById(id) !=undefined){
			document.getElementById(id).style.display="none";
			LoadAllEndorsementClassList('ClassList');
			AddClassAvailable = false;	
			newClassTab=false;		
		}
	}
	
	function getEndorsementClassList_recalculate(classId,newClassName,hazardId,hazardsName){
		recalculate = 1;
		showClass = true;
		var classIdExist = openTabClassesId.match(classId);
			if (classIdExist==null){
		 		appendClassToParent(classId,newClassName);
		 		showClassTab_recalculate(classId,hazardId,hazardsName);
		 	}else{
		 		var classIdArray=openTabClassesId.split(',');
		 		var classTabId="";
		 		for(var index=0;index<classIdArray.length;index++){
		 			if((classIdArray[index].match(classIdExist))!=null){
		 				classTabId="addClass"+classIdArray[index];
		 				classTabId = classTabId.replace(/^\s+|\s+$/g,"");
		 			}
		 		}
		 		showClassTab_recalculate(classId,hazardId,hazardsName,classTabId);
		 	}
	}
	
	function showClassTab_recalculate(classId,hazardId,hazardsName,id){
		opentabCount = 0;
		if(showClass){
			if(id != null && id!=undefined){
				activateClassTabs(id);
				classTabId = id;
			}
		 	var parentQuoteId = document.getElementById("parentQuoteId").value;
		    var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		    var customerId = document.getElementById("customerId").value;
		    var ownerId = document.getElementById("ownerId").value;
		    var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId+'&answer(RiskId)='+classId;
		    var url = "../GetQuoteClass.do?"+pars
	 		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
	 		document.getElementById("ClassListDiv").style.display="none";
	 		document.getElementById("RiskPopUp").style.display="none";
			document.getElementById("ClassContentDiv").innerHTML = transport.responseText;
	 		document.getElementById("ClassContentDiv").style.display = "block";	
	 		getBenefits(hazardId,hazardsName,classId); 		
	 		}});
		}
		showClass = true;
	}