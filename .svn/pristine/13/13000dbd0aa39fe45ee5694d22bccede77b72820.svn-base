var addClassButton = "";
var openTabClassesId = "";
var opentabCount = "0";
var getClassHazardsTab = "false";
var tabClassId = "";
var tabLoad="";
	YAHOO.namespace("example.container");
	function initTankPopUp1(){

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

		
		renderPopup = false;
		
		
		YAHOO.example.container.dialog2.render();
		}
	}
	function doSpecificCompleteAction(transport){	
		if(YAHOO.example.container.dialog2 != 'undefined' && YAHOO.example.container.dialog2 != null){
			YAHOO.example.container.dialog2.cancel();
			YAHOO.example.container.dialog2.modal = false;
			
		}
		try{
	 	if(document.getElementById("onAjaxCompleteActiveTabId").value == "HazardsTab"){
	 		showHazardsList1("hazardList");
	 		document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";
	 	}else if(document.getElementById("onAjaxCompleteActiveTabId").value == "AddClass"){
			var getClass=true;			
			//loadAllClassList('ClassInformation');
			getClass=false;
			removeAddClass(addClassId);
			newClassTab=true;
			var parentQuoteId = document.getElementById('ParentQuoteId').value;
			var parentQuoteVerId = document.getElementById('parentQuoteVerId').value;		
			var ownerId = document.getElementById('ownerIdfrmjsp').value;
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
			document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";		
		}else if(document.getElementById("onAjaxCompleteActiveTabId").value == "editClass") {
		 	var riskId = document.getElementById('classId').value;
		 	var parent = document.getElementById("classTabs");
	 		var childToRemove = tabClassId; 	
	 		removeClass(riskId,childToRemove);
		 	opentabCount = 0;
		 	showClass=true;
			showClassTab(riskId);
			setTimeout ("getApplication()", 400);			
			document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";
		}
		}catch(err){
			document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";
		}
		
	}
	
	function getApplication(){
		var riskId = document.getElementById('classId').value;
		var	className = document.getElementById('className').value;
		openClassPopup = false;
	 	appendClassTabToParent(riskId,className);
	 	showHazards('hazardQuestion');
	}
	function doSpecificSuccessAction(transport){
	if(YAHOO.example.container.documentDialog != 'undefined' && YAHOO.example.container.documentDialog != null){
			if(document.getElementById("ProposalDescription")!=null && document.getElementById("ProposalDescription")!='undefined'){
				document.getElementById("ProposalDescription").value=document.getElementById("Description").value;
			}
			YAHOO.example.container.documentDialog.cancel();	
			showFillInFormPopUpProposal();	
		}
	try{
		//To get risk details after spec question is added.
		if(document.getElementById("onAjaxCompleteActiveTabId").value=="BenefitsTab"){
			var respText = transport.responseText.replace(/^\s+|\s+$/, '');
			if(respText == "error"){
				document.getElementById("saveSuccess1").style.display = "none";
				document.getElementById("saveSuccess2").style.display = "none";
			}else{
				document.getElementById("saveSuccess1").style.display = "block";
				document.getElementById("saveSuccess2").style.display = "block";				
			}
			window.location=document.getElementById('Recalculate_Quote_link_save_benefits') + '&answer(Object::Quote::QuoteStartDate)=' + document.getElementById('txtDate').value + '&answer(Object::Quote::QuoteEndDate)=' + document.getElementById('ExpDate').value + '&answer(classBenefits)=true' + '&answer(hazardId)=' + document.getElementById('hazardId').value + '&answer(hazardsName)=' + document.getElementById('hazardsName').value + '&answer(classId)=' + document.getElementById('ClassId').value;
			document.getElementById("benefitContent").innerHTML = "";			
			document.getElementById("benefitContent").innerHTML = transport.responseText;
			if(document.getElementById("submitButtonNew")!=null&&document.getElementById("submitButtonNew")!='undefined'){			
				document.getElementById("submitButtonNew").className="covsmallbutton"; 			
			}
		}
		if(document.getElementById("onAjaxCompleteActiveTabId").value=="HazardsTab"){
			var classId = document.getElementById("classId").value;
			removeBenefitsTabs(classId);
			showHazardsList1("hazardList");
			document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";		
			document.getElementById("activateTabId").value=="ClassHazards_Row";
		}		
		}catch(err){			
			document.getElementById("loadercontent1").style.display = "none";
			document.getElementById("loadercontent2").style.display = "none";
		}
	}
 	
 	var addClassId = "";
	var count2=0;
	var AddClassAvailable = false;
	var newClassTab=true;
	function appendAddClassToParent(){
		if(AddClassAvailable == false) {
			AddClassAvailable = true;
			newClassTab=true;
		 	var parent = document.getElementById("classTabs");
			var anc = document.createElement("a");	
			anc.setAttribute("href","javascript:void(0);");
			anc.className = "loctab_active left";
			count2++;
			var id = "newClass"+count2;
			addClassId = id;
			anc.setAttribute("id",id);
			var span = document.createElement("span");
			span.className = "close right";
			span.onclick=function(){removeAddClass(id);}
			anc.appendChild(span);
			anc.onclick = function() {updateDivForAddClass();}
			parent.appendChild(anc);	
			anc.appendChild(document.createTextNode("New Class"));
			activateClassTabs(id);
			updateDivForAddClass();
		}
		else{
			newClassTab=true;
			updateDivForAddClass();
		}
	}
	function removeAddClass(id){
		if(document.getElementById(id) !=null && document.getElementById(id) !=undefined){
			document.getElementById(id).style.display="none";							
			loadAllClassList('ClassList');			
			AddClassAvailable = false;	
			newClassTab=false;
		}
	}

 	function updateDivForAddClass(){	
	 	if(newClassTab){
	 		activateClassTabs(addClassId);
		 	document.getElementById("onAjaxCompleteActiveTabId").value = "AddClass";
		 	addClassButton = "AddClass";
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
			var quoteClassSizeUpdated=parseInt(document.getElementById("ClassListSizeId").value)+1;
			var TabId = 'ClassHazards_Row';
			var appEnabled = 'Y';	
			var pars1 = 'answer(ApplicationName)=Quote class&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=RISK&answer(objectType)="location"&answer(Object::Location::LocationId)=-1&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&OwnerId='+ownerId+
			'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+ButtonName+'&answer(cancelButtonRequired)='+cancelButtonRequired+
			'&answer(State)=&answer(riskTerritory)=0&answer(zone)=&answer(TabPanelName)='+panelName+'&answer(Object::Risk::RiskId)='+riskId+
			'&answer(Object::Application::ApplicationType)='+Applicationtype+'&answer(Object::Customer::CustomerId)='+custId+
			'&answer(actionName)='+actionName+'&answer(ParentQuoteId)='+quoteId+'&answer(ParentQuoteVerId)='+quoteVerId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType+'&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+'&answer(QuoteId)='+quoteId+'&answer(DisplayValue_Object::Risk::Class::ClassName)=Class '+quoteClassSizeUpdated;
		
			var url = '../DisplayAddClassApplication.do?'+pars1;	
			new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
				getAddClassAppl(transport.responseText);
			}}); 
		}    		
		newClassTab = true;
    }
    function getAddClassAppl(data){	
		document.getElementById("RiskPopUpBody").style.border="1";
		document.getElementById("CovLimitsDiv").innerHTML="";
		document.getElementById("RiskPopUpBody").innerHTML = data;	
		document.getElementById("RiskPopUpBody").style.display="block";
		//to replace the content.
		document.getElementById("RiskPopUp").style.display = "block";
		document.getElementById("ClassList1").style.display = "none";
		document.getElementById("ClassInformationDiv").style.display = "none";	
	}
 	var showClass = false;
	function getClassList(classId,newClassName){
	 	
	 	var classIdExist = openTabClassesId.match(classId);
	 	showClass = true;
			if (classIdExist==null){
		 		appendClassTabToParent(classId,newClassName);
		 		showClassTab(classId);
		 	}else{
		 		var classIdArray=openTabClassesId.split(',');
		 		var classTabId="";
		 		for(var index=0;index<classIdArray.length;index++){
		 			if((classIdArray[index].match(classIdExist))!=null){
		 				classTabId="addClass"+classIdArray[index];
		 				classTabId = classTabId.trim();
		 			}
		 		}
		 		showClassTab(classId,classTabId);
		 	}
		}
	var count1 = 0;
	function appendClassTabToParent(classId,newClassName){
		if(opentabCount == 0)
 		{
	 		opentabCount = 1;
	 		count1++;
	 		getClassHazardsTab = "true";
			openTabClassesId = openTabClassesId +"," + classId+count1;
			var className = new String(newClassName);
			className = className.replace(/%20/g," ");
			className = className.replace(/___/g,"'");
		 	var parent = document.getElementById("classTabs");
			var anc = document.createElement("a");	
			anc.setAttribute("href","javascript:void(0);");
			anc.className = "loctab_active left";
			var id = "addClass"+classId+count1;
			tabClassId = id;
			anc.setAttribute("id",id);
			var span = document.createElement("span");
			span.className = "close right";
			span.onclick=function(){removeClass(classId,id);}
			anc.appendChild(span);
			anc.onclick = function() {showClassTab(classId,this.id);}
			parent.appendChild(anc);	
			anc.appendChild(document.createTextNode(className));
			activateClassTabs(id);
		}
		else{
			getClassHazardsTab ="false";
		}
	}
	
	function removeClass(classId,id){

		if(document.getElementById(id)!=null && document.getElementById(id)!=undefined) {
			
	    	document.getElementById(id).style.display = "none";
		}
			loadAllClassList("ClassList");
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
			if(document.getElementById(id)!=null && document.getElementById(id)!=undefined) {
				tabClassId = id;
				activateClassTabs(id);
			}
			
		 	var parentQuoteId = document.getElementById("parentQuoteId").value;
		    var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		    var customerId = document.getElementById("customerId").value;
		    var ownerId = document.getElementById("ownerId").value;
		    var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId+'&answer(RiskId)='+classId;
		    var url = "../GetQuoteClass.do?"+pars;
	 		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
	 		document.getElementById("CovLimitsDiv").style.display = "none";
	 		document.getElementById("ClassList1").style.display="none";
			document.getElementById("ClassInformationDiv").innerHTML = transport.responseText;
	 		document.getElementById("ClassInformationDiv").style.display = "block";	
	 		document.getElementById("RiskPopUp").style.display = "none";
	 		}});
			setTimeout("getEditClassPopUp("+classId+")",400);
			openTabHazardsId = "";
 		}
	 	showClass = true;

	}
	
 	function loadAllClassList(TabId){
 		if(TabId=="ClassHazards_Row"){
 			activateTabs(TabId);
 			disblePolicyTabs(TabId);
 			activateClassTabs("ClassList");
 		}else{
 		
 			activateClassTabs("ClassList");
 		}
 		tabLoad="ClassTab";
 		document.getElementById("CovLimitsDiv").style.display = "none";
 		document.getElementById("CovLimitsDiv").innerHTML = "";
 		document.getElementById("DocumentDiv").style.display = 'none'; 		
 		document.getElementById("saveSuccess1").style.display = 'none';
 		document.getElementById("ClassListDiv").style.display="block";
 		document.getElementById("ClassList1").style.display="block";
 		document.getElementById("ClassList1").style.display="block";
 		document.getElementById("ClassInformationDiv").style.display = "none";	
 		document.getElementById("PolicyInformationDiv").style.display="none";
 		document.getElementById("RiskPopUp").style.display = "none";
 		  YAHOO.example.XHR_Text = function() {
		    var formatUrl = function(elCell, oRecord, oColumn, sData) {        
		 			var className = "'"+oRecord.getData("ClassName")+"'";
		 			var classString = new String(className);
		 			classString = classString.replace(/ /g,"%20");
		 			classString = classString.replace(/&#39;/g,"___");
		 			var classId = oRecord.getData("ClassId");
		 			var onclickscript = "getClassList("+classId+","+classString+")";
		 				elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";                    
		     };
	        
			var formatDeleteUrl = function(elCell, oRecord, oColumn, sData) {        
		 	var className = "'"+oRecord.getData("ClassName")+"'";
		 			
		 		var onclickscript = "deleteQuoteClass("+oRecord.getData("ClassId")+")";
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
	        
	        enablePolicyTabs();
	        var parentQuoteStatus = document.getElementById("paretQuoteStatus").value;
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
		        var myDataTableY = new YAHOO.widget.DataTable("ClassList1", moreColumnDefsInProgress,anotherDataSource,myConfigs);  
			}else{
				var myDataTableY = new YAHOO.widget.DataTable("ClassList1", moreColumnDefsOthers,anotherDataSource,myConfigs);
			}
		   return {
	            oDS2: anotherDataSource,
	          oDT2: myDataTableY
	        };
	    }();
	    
 	}
 	
	
	function activateClassTabs(id){	
		var parent = document.getElementById("classTabs");
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
	
	function deleteQuoteClass(riskId){
		
		var parentQuoteId = document.getElementById('ParentQuoteId').value;
		var parentQuoteVerId = document.getElementById('parentQuoteVerId').value;
		var	submissionId = document.getElementById('SubmissionId1').value;
		var	submissionVerId = document.getElementById('SubmissionVerId1').value;
		var ownerId = document.getElementById('ownerIdfrmjsp').value;
		document.getElementById("onAjaxCompleteActiveTabId").value = "DeleteClass";
		
		var pars1 = 'answer(Object::Quote::ParentQuoteId)='+parentQuoteId+
		'&answer(Object::Quote::parentQuoteVerId1)='+parentQuoteVerId+
		'&answer(Object::Customer::CustomerId)='+riskId+
		'&answer(Object::Submission::SubmissionId)='+submissionId+
		'&answer(Object::Submission::SubmissionVerId)='+submissionVerId;		
		
		if(confirm('Are you sure to delete this Class?'))
		{
			var url = '../DeleteQuoteClassAction.do?'+pars1;	
			autologout();
			new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){loadAllClassList('ClassHazards_Row');
		
			var pars2 = 'answer(OwnerId)='+ownerId+
			'&answer(QuoteId)='+parentQuoteId+
			'&answer(ParentQuoteVerId)='+parentQuoteVerId;
			
		
			var classCountUrl = '../GetClassCountAfterQuoteDelete.do?'+pars2;
			new Ajax.Request(classCountUrl, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
			if(transport.responseText == ""){
				document.getElementById("classListId").innerHTML = "Class(0)";
				document.getElementById("ClassListSizeId").value=0;
				document.getElementById("saveSuccess1").style.display = "none";
				window.location=document.getElementById('Recalculate_Quote_link_delete_class') + '&answer(Object::Quote::QuoteStartDate)=' + document.getElementById('txtDate').value + '&answer(deleteClass)=true&answer(Object::Quote::QuoteEndDate)=' + document.getElementById('ExpDate').value;
				document.getElementById("deleteSuccess1").style.display = "block";
				document.getElementById("loadercontent1").style.display = "block";
			}else{
				document.getElementById("classListId").innerHTML = "Class("+transport.responseText+")";
				document.getElementById("ClassListSizeId").value=transport.responseText;
				document.getElementById("saveSuccess1").style.display = "none";
				window.location=document.getElementById('Recalculate_Quote_link_delete_class') + '&answer(Object::Quote::QuoteStartDate)=' + document.getElementById('txtDate').value + '&answer(deleteClass)=true&answer(Object::Quote::QuoteEndDate)=' + document.getElementById('ExpDate').value;
				document.getElementById("deleteSuccess1").style.display = "block";
				document.getElementById("loadercontent1").style.display = "block";
			}
			}});
		}});
			var classIdExist = openTabClassesId.match(riskId);		
			var classIdArray=openTabClassesId.split(',');
	 		var childTabToRemove="";
	 		for(var index=0;index<classIdArray.length;index++){
	 			if((classIdArray[index].match(classIdExist))!=null){
	 				childTabToRemove="addClass"+classIdArray[index];
	 				childTabToRemove = childTabToRemove.trim();
	 			}
	 		}
			var riskIdToRemove= childTabToRemove.substring(childTabToRemove.indexOf(riskId),childTabToRemove.length);					
			removeClass(riskIdToRemove,childTabToRemove);
		}
		else{
			return false;
		}
	}
	
	function disblePolicyTabs(id){	
		var parent = document.getElementById("PolicySummaryContent");
		arrChildren = parent.childNodes;
		// loop thru all child nodes
		for(i = 0; i < arrChildren.length; i++)
		{
	 		objChild = arrChildren[i];
			if(objChild.id != undefined && objChild.id != null){
				objChild.disabled = true;
			}
		}
		if(id != null && id!=undefined){
			 document.getElementById(id).disabled = false;
		 }
		document.body.style.cursor = "wait" ;
	}
	
	function disblePolicyInnerTabs(id){	
		var parent = document.getElementById("PolicyInformationDiv");
		arrChildren = parent.childNodes;
		// loop thru all child nodes
		for(i = 0; i < arrChildren.length; i++)
		{
	 		objChild = arrChildren[i];
			if(objChild.id != undefined && objChild.id != null){
				objChild.disabled = true;
			}
		}
		if(id != null && id!=undefined){
			 document.getElementById(id).disabled = false;
		 }
		document.body.style.cursor = "wait" ;
	}
	
	function enablePolicyTabs(){	
	
		var parent = document.getElementById("PolicySummaryContent");
		arrChildren = parent.childNodes;
		// loop thru all child nodes
		for(i = 0; i < arrChildren.length; i++)
		{
	 		objChild = arrChildren[i];
			if(objChild.id != undefined && objChild.id != null){
				objChild.disabled = false;
			}
		}
		document.body.style.cursor = "default" ;
		if(document.getElementById("submitButton") !=null&&document.getElementById("submitButton")!='undefined'){
			document.getElementById("submitButton").className="covsmallbutton";
		}
	}
	
	function enablePolicyInnerTabs(){	
	
		var parent = document.getElementById("PolicyInformationDiv");
		arrChildren = parent.childNodes;
		// loop thru all child nodes
		for(i = 0; i < arrChildren.length; i++)
		{
	 		objChild = arrChildren[i];
			if(objChild.id != undefined && objChild.id != null){
				objChild.disabled = false;
			}
		}
		document.body.style.cursor = "default" ;
	}
	
	function getClassList_recalculate(classId,newClassName,hazardId,hazardsName){
		recalculate = 1;
	 	var classIdExist = openTabClassesId.match(classId);
	 	showClass = true;
			if (classIdExist==null){
		 		appendClassTabToParent(classId,newClassName);
		 		showClassTab_recalculate(classId,"id",hazardId,hazardsName);
		 	}else{
		 		var classIdArray=openTabClassesId.split(',');
		 		var classTabId="";
		 		for(var index=0;index<classIdArray.length;index++){
		 			if((classIdArray[index].match(classIdExist))!=null){
		 				classTabId="addClass"+classIdArray[index];
		 				classTabId = classTabId.trim();
		 			}
		 		}
		 		showClassTab_recalculate(classId,classTabId,hazardId,hazardsName);
		 	}
		}
		
		function showClassTab_recalculate(classId,id,hazardId,hazardsName){
	 	opentabCount = 0;
		if(showClass){
			if(document.getElementById(id)!=null && document.getElementById(id)!=undefined) {
				tabClassId = id;
				activateClassTabs(id);
			}
			
		 	var parentQuoteId = document.getElementById("parentQuoteId").value;
		    var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		    var customerId = document.getElementById("customerId").value;
		    var ownerId = document.getElementById("ownerId").value;
		    var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId+'&answer(RiskId)='+classId;
		    var url = "../GetQuoteClass.do?"+pars;
	 		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){
	 		document.getElementById("CovLimitsDiv").style.display = "none";
	 		document.getElementById("ClassList1").style.display="none";
			document.getElementById("ClassInformationDiv").innerHTML = transport.responseText;
	 		document.getElementById("ClassInformationDiv").style.display = "block";	
	 		document.getElementById("RiskPopUp").style.display = "none";	
	 		getBenefits(hazardId,hazardsName,classId); 		
	 		}});	 		
 		}
	 	showClass = true;
	}