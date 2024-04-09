
function LoadNewQuotePolicyInformationTab(TabId){
 	if(TabId == "PolicyInformation_Row"){
 		activateTabs(TabId);
 		activateInnerTabs('Pol_Definition_Row');
 	}
 	else{
 		activateInnerTabs('Pol_Definition_Row');
 	} 	
  	document.getElementById("PolicyInformationDiv").style.display="none";
 	document.getElementById("EndorsementClass").style.display="none";
 	document.getElementById("docTable").style.display = "none";
 	document.getElementById("RiskPopUp").style.display = "none";
 	document.getElementById("CoveragesDiv").style.display = "none";
 	document.getElementById("CovLimitsDiv").style.display="none";
 	document.getElementById("ScheduleDiv").style.display = "none";
 	document.getElementById("QuoteDiv").innerHTML = "";
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
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
 	var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	var riskTerritory = "";
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
 	
 	var pars = 'answer(ApplicationName)=policy Definition&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=POLICYINFORMATION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_POLICY_INFORMATION~APPLICATION_ID)=202&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_POLICY_INFORMATION~APPLICATION_VER_ID)=228&answer(riskTerritory)='+riskTerritory+'&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=Quote_POLICY_INFORMATION&answer(objectType)=QuoteAdditionalInsured&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabPolicyInfoY';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    pars2 = pars2+pars3;
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 
		 		 document.getElementById("QuoteDiv").style.display = "block";
		 		  document.getElementById("PolicyInformationDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CoveragesDiv").style.display = "none";
		 	document.getElementById("CovLimitsDiv").style.display="none";
		 	document.getElementById("ScheduleDiv").style.display = "none";
		 	document.getElementById("QuoteDiv").innerHTML = "";
		 	document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML = transport.responseText;
		 	document.getElementById("Application").className="";
		 	if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!='undefined'){
				document.getElementById("submitButton").className="covsmallbutton"; 			
			}
		 	}
		}
	);
	}
	function LoadNewQuotePolicyHazardsTab(TabId){
	activateTabs('PolicyInformation_Row');
	activateInnerTabs('Pol_Hazards_Row');
	var pageName = document.getElementById("PageName").value;
	 	var actName = "";	 	
	 	if(pageName=="CoveragesAndLimits"){
	 		actName = "/saveHazardsApplication3.0.go?";
	 	}else{
	 		actName = "/saveQuoteHazardsApplication.go?.go?";
	 	}
	 document.getElementById("docTable").style.display = "none";
		document.getElementById("CovLimitsDiv").style.display="none";
		document.getElementById("QuoteDiv").style.display = "none";
		document.getElementById("QuoteDiv").innerHTML = "";
		
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
 	
 	
 	var pars = 'answer(ApplicationName)=policy Hazards&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=HAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabPolicyHazardY';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
        pars2 = pars2+pars3;
     autologout();
	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
		document.getElementById("docTable").style.display = "none";
		document.getElementById("CovLimitsDiv").style.display="none";
		document.getElementById("QuoteDiv").style.display = "block";
		document.getElementById("QuoteDiv").innerHTML = "";
		document.getElementById("QuoteDiv").innerHTML = transport.responseText;
		document.getElementById("Application").className="";
		enableTabs();
		if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!='undefined'){
			document.getElementById("submitButton").className="covsmallbutton"; 			
		}
 		}});
	}
	function LoadNewQuotePolicyBenefitsTab(TabId){
	activateTabs('PolicyInformation_Row');
 	activateInnerTabs('Pol_Benefits_Row');
 	var locationListArraySize = 0;	 	
 	document.getElementById("ClassListDiv").style.display="none";
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	var productVerId  = document.getElementById("ProductVerId").value;
	var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value;
	document.getElementById("QuoteDiv").style.display = "none";
 	document.getElementById("CovLimitsDiv").style.display="none";
	document.getElementById("QuoteDiv").innerHTML = "";
	document.getElementById("docTable").style.display = "none";
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
 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
 	
 	var pars = 'answer(ApplicationName)=policy Benefits&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=BENEFITS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(Object::Application::ApplicationId__DMS_PROP_QUOTE_VER_ADD_BENEFITS~APPLICATION_ID)=262&answer(Object::Application::ApplicationVerId__DMS_PROP_QUOTE_VER_ADD_BENEFITS~APPLICATION_VER_ID)=288&answer(riskTerritory)=&answer(State)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(riskType)=Class&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabPolicyBenefitY';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
     pars2 = pars2+pars3;
     autologout();
     	new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
		 	document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("CovLimitsDiv").style.display="none";
			document.getElementById("QuoteDiv").innerHTML = "";
			document.getElementById("docTable").style.display = "none";
			document.getElementById("QuoteDiv").innerHTML = transport.responseText;		
			document.getElementById("Application").className="";
			enableTabs();
			if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!='undefined'){
				document.getElementById("submitButton").className="covsmallbutton"; 			
			}
		 }
		}
	);
	}
	
	 	function LoadClassList(TabId){
		activateTabs(TabId);
 		var locationListArraySize = 0;	 	 	
 		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId").value;
		var productVerId  = document.getElementById("ProductVerId").value;
		//var groupVerId = document.getElementById("GroupVerId").value;
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
		
 		var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;
 				
 		var url = '../GetQuoteClassList.do?'+pars;	
    
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    	var parentPolicyId = document.getElementById("parentPolicyId").value;
	 	var policyNumber =document.getElementById("policyNumber").value;
	 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
	 	
	 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
	    pars2 = pars2+pars3;	
    	 autologout();
		 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("QuoteDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("QuoteDiv").innerHTML = "";		 	
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	document.getElementById("Application").className="";
		 	}
		}
		);
		
	}
	 
	 function LoadNewQuoteClassHazards(TabId){
	activateTabs(TabId);
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
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
    pars2 = pars2+pars3;
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 	 enableTabs();
		 		 document.getElementById("QuoteDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("QuoteDiv").innerHTML = "";
		 	
		 	
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	document.getElementById("Application").className="";
		 	}
		}
	);
	}
	
	function LoadDocumentationTab(TabId){

	activateTabs(TabId);
	document.getElementById("EndorsementClass").style.display = "none";
	document.getElementById("QuoteDiv").style.display = "none";
	document.getElementById("RiskPopUp").style.display = "none";
	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	var ownerId = document.getElementById("ownerId").value;
	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	refereshQuoteAttachmentList(parentQuoteId,parentQuoteVerId,ownerId,'QUOTE');
	refereshQuoteEmailList(parentQuoteId,ownerId,'QUOTE');
	document.getElementById("docTable").style.display = "block";
	document.getElementById("CoveragesDiv").style.display = "none";
	document.getElementById("CoveragesDiv").innerHTML = document.getElementById("DocumentDiv").innerHTML;
	document.getElementById("PolicyInformationDiv").style.display = "none";
	document.getElementById("ScheduleDiv").style.display = "none";
	enableTabs();
	}
	
	function LoadNewQuotePolicyExclusions(TabId){
	activateTabs(TabId);
	document.getElementById("EndorsementClass").style.display="none";
	document.getElementById("RiskPopUp").style.display = "none";
	document.getElementById("ScheduleDiv").style.display = "none";
	document.getElementById("QuoteDiv").innerHTML = "";
 	document.getElementById("CoveragesDiv").style.display = "none";
 	document.getElementById("docTable").style.display = "none";
 	document.getElementById("PolicyInformationDiv").style.display = "none";		 			 	
	
 	var locationListArraySize = 0;	 	
 	
 	var parentQuoteId    = document.getElementById("parentQuoteId").value;

	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	var subQuoteId    = document.getElementById("subQuoteId").value;

	var productVerId  = document.getElementById("ProductVerId").value;
	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
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
 	var pars = 'answer(ApplicationName)=policy Exclusion&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=POLICYEXCLUSION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(SubQuoteVerId)='+subQuoteVerId+'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabPolicyExclusionY';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
    pars2 = pars2+pars3;
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 	},onSuccess: function(transport){	
		 	document.getElementById("QuoteDiv").innerHTML = "";
		 	document.getElementById("CoveragesDiv").style.display = "none";
		 	document.getElementById("docTable").style.display = "none";
		 	document.getElementById("ScheduleDiv").style.display = "none";
		 	document.getElementById("PolicyInformationDiv").style.display = "none";		 			 	
		 	document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	document.getElementById("Application").className="";
		 	if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!='undefined'){
				document.getElementById("submitButton").className="covsmallbutton"; 			
			}
		 	}
		}
	);
	}
	/* To get a List of Classes For the Corresponding Quote ID and Quote Ver Id*/
	function LoadClassBenefitsList(TabId){
		activateTabs(TabId);
 		var locationListArraySize = 0;	 	 	
 		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId").value;
		var productVerId  = document.getElementById("ProductVerId").value;
	//	var groupVerId = document.getElementById("GroupVerId").value;
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
		
 		var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;
 				
 		var url = '../GetQuoteClassBenefitsList.do?'+pars;	
    
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    	var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
    pars2 = pars2+pars3;	
    	 autologout();
		 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("QuoteDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("QuoteDiv").innerHTML = "";		 	
		 	document.getElementById("Application").className="";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
		);
		
	}
	
	function LoadClassBenefitsList(TabId){
		activateTabs(TabId);
 		var locationListArraySize = 0;	 	 	
 		var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId").value;
		var productVerId  = document.getElementById("ProductVerId").value;
	//	var groupVerId = document.getElementById("GroupVerId").value;
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
		
 		var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId;
 				
 		var url = '../GetQuoteClassBenefitsList.do?'+pars;	
    
    	var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    	var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
    pars2 = pars2+pars3;	
    	 autologout();
		 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("QuoteDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("QuoteDiv").innerHTML = "";		 	
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	document.getElementById("Application").className="";
		 	}
		}
		);
		
	}

	function LoadNewQuotePolicyExclusions(TabId){
	activateTabs(TabId);
 	var locationListArraySize = 0;	 	
 	document.getElementById("EndorsementClass").style.display="none";
 	document.getElementById("CovLimitsDiv").style.display="none";
 	document.getElementById("RiskPopUp").style.display = "none";
 	document.getElementById("QuoteDiv").innerHTML = "";
 	document.getElementById("CoveragesDiv").style.display = "none";
 	document.getElementById("docTable").style.display = "none";
 	document.getElementById("ScheduleDiv").style.display = "none";
 	document.getElementById("PolicyInformationDiv").style.display = "none";		 			 	
 	
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
	var FamilyId = document.getElementById("ProductFamilyId").value;
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	
 	
 	var pars = 'answer(ApplicationName)=policy Exclusion&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=POLICYEXCLUSION&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplicationQuoteSummary3.0.go?&answer(activateTabId)='+TabId+'&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(SubQuoteVerId)='+prevSubQuoteVerId+'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(openTabAPolicyInfo)=openTabPolicyExclusionY';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
    pars2 = pars2+pars3;
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 
		 	},onSuccess: function(transport){	
		 	document.getElementById("CoveragesDiv").style.display = "none";
		 	document.getElementById("QuoteDiv").innerHTML = "";
		 	document.getElementById("PolicyInformationDiv").style.display = "none";
		 	document.getElementById("ScheduleDiv").style.display = "none";
		 	document.getElementById("docTable").style.display = "none";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("Application").className="";
		 	if(document.getElementById("submitButton")!=null && document.getElementById("submitButton")!='undefined'){
				document.getElementById("submitButton").className="covsmallbutton"; 			
			}
		 	}
		}
	);
	}
	function LoadNewQuoteAircraftSchedule(TabId)
	{
	document.getElementById("EndorsementClass").style.display="none";
	activateTabs(TabId);
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

	var FamilyId = document.getElementById("ProductFamilyId").value;
	document.getElementById("docTable").style.display = "none";
 	document.getElementById("RiskPopUp").style.display = "none";
 	document.getElementById("CovLimitsDiv").innerHTML = "";
 	document.getElementById("PolicyInformationDiv").style.display = "none";
 	document.getElementById("QuoteDiv").style.display = "none";
 	document.getElementById("CoveragesDiv").style.display = "none";
 	var ownerId = document.getElementById("ownerId").value;
	var custId = document.getElementById("customerId").value;
 	var quoteVerId = document.getElementById("parentQuoteVerId").value;
 	var quoteStatus = document.getElementById("paretQuoteStatus1").value;
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=AIRCRAFT&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+'&answer(Object::Quote::QuoteStatus)='+quoteStatus+
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(quoteVerId)='+quoteVerId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
 				
 				var url = '../CVGetAircraftList2.do?'+pars;	
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
    pars2 = pars2+pars3;
    autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("docTable").style.display = "none";
		 	document.getElementById("RiskPopUp").style.display = "none";
		 	document.getElementById("CovLimitsDiv").innerHTML = "";
		 	document.getElementById("PolicyInformationDiv").style.display = "none";
		 	document.getElementById("QuoteDiv").style.display = "none";
		 	document.getElementById("CoveragesDiv").style.display = "none";
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
	);
 	
	}
	function LoadNewQuoteAddEditAircraft(){
 	var locationListArraySize = 0;	 	
 	
 	var parentQuoteId    	= document.getElementById("parentQuoteId").value;

	var parentQuoteVerId 	= document.getElementById("parentQuoteVerId").value;

	var subQuoteId    		= document.getElementById("subQuoteId").value;

	var productVerId  		= document.getElementById("ProductVerId").value;

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
 	
 	
 	var pars = 'answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=AIRCRAFT&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)=/saveApplication3.0.go?&answer(isApplicationEnabled)='+appEnabled+
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+'&answer(openTabAPolicyInfo)=openTabAircraftScheduleY'+
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(Object::Quote::AircraftRiskId)=-1';
 				
 				var url = '../DisplayApplication3.0.do?'+pars;	
    
    var pars2  = 'answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab';
    var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	
 	var pars3 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;
    pars2 = pars2+pars3;
     autologout();
	 new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		 enableTabs();
		 		 document.getElementById("QuoteDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("QuoteDiv").innerHTML = "";
		 	document.getElementById("CovLimitsDiv").style.display="none";
		 	
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}
	
	 function activateTabs(TabId){	
	  if(document.getElementById("Documentation_Row") != undefined){
    	document.getElementById("Documentation_Row").disabled = true;
    	document.getElementById("Documentation_Row").className = "todotab_inactive";
    }
     if(document.getElementById("CoverageandLimits_Row") != undefined){
    	document.getElementById("CoverageandLimits_Row").disabled = true;
    	document.getElementById("CoverageandLimits_Row").className = "todotab_inactive";
    }
    if(document.getElementById("EndorsementDetail_Row") != undefined){
    	document.getElementById("EndorsementDetail_Row").disabled = true;
    	document.getElementById("EndorsementDetail_Row").className = "todotab_inactive";
    }
    
     if(document.getElementById("PolicyInformation_Row") != undefined){
    	document.getElementById("PolicyInformation_Row").disabled = true;
    	document.getElementById("PolicyInformation_Row").className = "todotab_inactive";
    }
     if(document.getElementById("PolicyExclusions_Row") != undefined){
    	document.getElementById("PolicyExclusions_Row").disabled = true;
    	document.getElementById("PolicyExclusions_Row").className = "todotab_inactive";
    }
     if(document.getElementById("ClassHazards_Row") != undefined){
    	document.getElementById("ClassHazards_Row").disabled = true;
    	document.getElementById("ClassHazards_Row").className = "todotab_inactive";
    }
    if(document.getElementById("Worksheet") != undefined){
    	document.getElementById("Worksheet").disabled = true;
    	document.getElementById("Worksheet").className = "todotab_inactive";
    }    
      if(document.getElementById("ClassBenefits_Row") != undefined){
    	document.getElementById("ClassBenefits_Row").disabled = true;
    	document.getElementById("ClassBenefits_Row").className = "todotab_inactive";
    }
    if(document.getElementById("AircraftSchedule")!=undefined){
    	document.getElementById("AircraftSchedule").disabled = true;
    	document.getElementById("AircraftSchedule").className = "todotab_inactive";
    }
    if(document.getElementById("EndorsementMiscDetail_Row")!=undefined){
    	document.getElementById("EndorsementMiscDetail_Row").disabled = true;
    	document.getElementById("EndorsementMiscDetail_Row").className = "todotab_inactive";
    }
    if(document.getElementById("EndorsementMiscDesc_Row")!=undefined){
    	document.getElementById("EndorsementMiscDesc_Row").disabled = true;
    	document.getElementById("EndorsementMiscDesc_Row").className = "todotab_inactive";
    }
    if(document.getElementById("EndorsementCancelDetail_Row")!=undefined){
    	document.getElementById("EndorsementCancelDetail_Row").disabled = true;
    	document.getElementById("EndorsementCancelDetail_Row").className = "todotab_inactive";
    }
    if(document.getElementById("EndorsementDetail_Row")!=undefined){
    	document.getElementById("EndorsementDetail_Row").disabled = true;
    	document.getElementById("EndorsementDetail_Row").className = "todotab_inactive";
    }
    if(document.getElementById("CancelOption_row")!=undefined){
    	document.getElementById("CancelOption_row").disabled = true;
    	document.getElementById("CancelOption_row").className = "todotab_inactive";
    }    
    if(document.getElementById("EndorsementCancelDesc_Row")!=undefined){
    	document.getElementById("EndorsementCancelDesc_Row").disabled = true;
    	document.getElementById("EndorsementCancelDesc_Row").className = "todotab_inactive";
    }
    if(document.getElementById("AircraftSchedule")!=undefined){
    	document.getElementById("AircraftSchedule").disabled = true;
    	document.getElementById("AircraftSchedule").className = "todotab_inactive";
    }
    if(document.getElementById("ScheduleOfForms_Row")!=undefined){
    	document.getElementById("ScheduleOfForms_Row").disabled = true;
    	document.getElementById("ScheduleOfForms_Row").className = "todotab_inactive";
    }    
	 if(document.getElementById(TabId)!=undefined){
	 	document.getElementById(TabId).className = "todotab_active";
	 }
	 }
	 
	 function enableTabs(){
	 if(document.getElementById("EndorsementMiscDesc_Row")!=undefined){
    	document.getElementById("EndorsementMiscDesc_Row").disabled = false;
    }
    if(document.getElementById("EndorsementMiscDetail_Row")!=undefined){
    	document.getElementById("EndorsementMiscDetail_Row").disabled = false;
    }
    if(document.getElementById("Documentation_Row") != undefined){
    	document.getElementById("Documentation_Row").disabled = false;
    }
     if(document.getElementById("CoverageandLimits_Row") != undefined){
    	document.getElementById("CoverageandLimits_Row").disabled = false;
    }
     if(document.getElementById("EndorsementDetail_Row") != undefined){
    	document.getElementById("EndorsementDetail_Row").disabled = false;
    }
    
    if(document.getElementById("PolicyInformation_Row") != undefined ){
    	document.getElementById("PolicyInformation_Row").disabled = false;
    }
  	if(document.getElementById("PolicyExclusions_Row") != undefined){
 		document.getElementById("PolicyExclusions_Row").disabled = false;
 	}
 	if(document.getElementById("ClassHazards_Row") != undefined){
 		document.getElementById("ClassHazards_Row").disabled = false;
 	}
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 		document.getElementById("ClassBenefits_Row").disabled = false;
 	}
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 		document.getElementById("ClassBenefits_Row").disabled = false;
 	}
 	if(document.getElementById("EndorsementCancelDetail_Row") != undefined){
 		document.getElementById("EndorsementCancelDetail_Row").disabled = false;
 	}
 	if(document.getElementById("EndorsementCancelDesc_Row") != undefined){
 		document.getElementById("EndorsementCancelDesc_Row").disabled = false;
 	}
 	if(document.getElementById("Worksheet") != undefined){
    	document.getElementById("Worksheet").disabled = false;
    }  
    
    if(document.getElementById("AircraftSchedule")!=undefined){
    	document.getElementById("AircraftSchedule").disabled = false;
    }
    if(document.getElementById("Documentation_Row") != undefined){
    	document.getElementById("Documentation_Row").disabled = false;
    }    
    if(document.getElementById("ScheduleOfForms_Row") != undefined){
    	document.getElementById("ScheduleOfForms_Row").disabled = false;
    }
 		document.body.style.cursor = "default";
    }
    
    
     	function LoadNewQuoteCoverageandLimits(TabId){
     	activateTabs(TabId);
     	document.getElementById("docTable").style.display = "none";
 		document.getElementById("EndorsementClass").style.display="none";
 		document.getElementById("CovLimitsDiv").style.display="none";
 		document.getElementById("RiskPopUp").style.display = "none";
 		document.getElementById("PolicyInformationDiv").style.display = "none";
		document.getElementById("ScheduleDiv").style.display = "none";
		document.getElementById("QuoteDiv").style.display = "none";
		document.getElementById("CoveragesDiv").innerHTML="";
 		var parentQuoteId = document.getElementById("parentQuoteId").value;
	 	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	 	var subQuoteId = document.getElementById("subQuoteId").value;
	 	var customerId = document.getElementById("customerId").value;
	 	var agencyId = document.getElementById("agencyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
	 	//var userId = document.getElementById("userId").value;
	 //	var subQuoteProductId = document.getElementById("subQuoteProductId1").value;
	 	var prodId = document.getElementById("productId1").value;
	 	var ProductVerId = document.getElementById("productVerId1").value;
	 	var GroupId = document.getElementById("GroupId").value;
	 	var GroupVerId = document.getElementById("GroupVerId").value;
	 	var productStatus = document.getElementById("productStatus").value;
	 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
	 	var isOptionsDisabled = document.getElementById("IsOptionDisabled").value;
	 	var custState = document.getElementById("planStateId").value;
	 	var productName=document.getElementById("productName").value;
	 	var parentPolicyId = document.getElementById("parentPolicyId").value;
 	var policyNumber =document.getElementById("policyNumber").value;
 	var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	
 	var pars2 = 'answer(QuoteId)='+parentQuoteId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Customer::CustomerId)='+customerId+'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId;

	 	
	 	var pars = 'changePlan=yes&answer(Object::Risk::Teritory)=0&answer(parentQuoteId)='+parentQuoteId+'&answer(Object::Quote::ProductId)='+prodId+'&answer(Object::Quote::ProductVerId)='+ProductVerId+
	 	'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(Object::Agency::AgencyId)='+agencyId+
	 	'&answer(IsOptionDisabled)='+isOptionsDisabled+'&answer(QuoteId)='+parentQuoteId+'&answer(subQuoteId)='+subQuoteId+
	 	'&answer(Object::Customer::CustomerId)='+customerId+'&answer(Object::Agency::AgencyId)='+agencyId+
	 	'&answer(ownerId)='+ownerId+'&answer(Plan::PlanNumber)='+subQuoteId+
	 	'&answer(Object::Quote::ProductId)='+prodId+'&answer(Option::DefaultValue)=No&answer(ProductId)='+prodId+
	 	'&answer(ProductVerId)='+ProductVerId+'&answer(prdGroupId)='+GroupId+'&answer(prdGroupVerId)='+GroupVerId+
	 	'&answer(productStatus)='+productStatus+'&answer(subQuoteVerId)='+subQuoteVerId+'&answer(customerId)='+customerId+
	 	'&answer(Object::Plan::StateCode)='+custState+'&answer(isUpdated)=Y&answer(Object::Quote::PrevSubQuoteVerId)='+subQuoteVerId+'&answer(openTabAPolicyInfo)=openTabCoverageLimitsY&answer(heading)='+productName;
	 	
	 	var url = '../EndorsementPlanChangeBTA.do?'+pars;
	 	autologout();
	 	new Ajax.Request(url, 
		 	{method: 'post',parameters:pars2,
				asynchronous:true,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
			 	document.getElementById("CoveragesDiv").style.display = "block";
			 	document.getElementById("CoveragesDiv").innerHTML= transport.responseText;
				 enableTabs();
			 	},onSuccess: function(transport){	
			 	
			 	document.getElementById("QuoteDiv").style.display = "none";
			 	document.getElementById("CoveragesDiv").style.display = "block";			 	
			 	document.getElementById("CoveragesDiv").innerHTML= transport.responseText;
			 	document.getElementById("PolicyInformationDiv").style.display = "none";
			 	document.getElementById("ScheduleDiv").style.display = "none";
			 	}
			}
		);
 	}
 	function LoadNewQuoteWorksheet(TabId){
    		activateTabs(TabId);			
			var parentQuoteId = document.getElementById("parentQuoteId").value;
	        var submissionStatus="";
	        var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	        var customerId = document.getElementById("customerId").value;
	        var ownerId = document.getElementById("ownerId").value;
		 	var subQuoteId = document.getElementById("subQuoteId").value;
		 	var prodId = document.getElementById("productId1").value;
	 	    var ProductVerId = document.getElementById("productVerId1").value;
	 	    var policyNumber = document.getElementById("policyNumber").value;
	 	    var parentPolicyId = document.getElementById("parentPolicyId").value;
	 	    var ParentPolicyVerId= document.getElementById("parentPolicyVerId").value;
	 		document.getElementById("QuoteDiv").style.display = "none";
			document.getElementById("CovLimitsDiv").style.display="none";
			document.getElementById("docTable").style.display = "none";
			document.getElementById("CoveragesDiv").style.display = "none";
			document.getElementById("PolicyInformationDiv").style.display = "none";
			document.getElementById("EndorsementClass").style.display="none";
			document.getElementById("RiskPopUp").style.display = "none";
			document.getElementById("ScheduleDiv").style.display = "none";			 	
	        var pars = 'answer(QuoteId)='+parentQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(OwnerId)='+ownerId+'&answer(Object::UWWorkSheet::ParentQuoteId)='+subQuoteId+'&answer(subQuoteId)='+subQuoteId+'&answer(productId)='+prodId+'&answer(productVerId)='+ProductVerId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+'&answer(Object::Policy::ParentPolicyVerId)='+ParentPolicyVerId;
			new Ajax.Request("../GetUWWorkSheetAction.do?"+pars, 
		 	{method: 'post',
				asynchronous:true,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
			 	document.getElementById("CoveragesDiv").style.display = "block";
			 //	document.getElementById("CoveragesDiv").innerHTML= transport.responseText;
				 enableTabs();
			 	},onSuccess: function(transport){	
			 	
			 	document.getElementById("QuoteDiv").style.display = "none";
			 	document.getElementById("CovLimitsDiv").style.display="none";
			 	document.getElementById("docTable").style.display = "none";
			 	document.getElementById("CoveragesDiv").style.display = "block";			 	
			 	document.getElementById("CoveragesDiv").innerHTML= transport.responseText;
			 	showHideMinimumPremium();
			 	showReasonsText();
			 	document.getElementById("PolicyInformationDiv").style.display = "none";
			 	document.getElementById("EndorsementClass").style.display="none";
			 	document.getElementById("RiskPopUp").style.display = "none";
			 	document.getElementById("ScheduleDiv").style.display = "none";			 	
			 	}
			 	}
			
		);
    }
 	function LoadEndorsementDetailTab(TabId){
     	activateTabs(TabId);
     	
     	var parentQuoteId = document.getElementById("parentQuoteId").value;
	 	var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
	 	var subQuoteId = document.getElementById("subQuoteId").value;
	 	var customerId = document.getElementById("customerId").value;
	 	var agencyId = document.getElementById("agencyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
	 	document.getElementById("CovLimitsDiv").style.display="none";
	 	var prodId = document.getElementById("productId1").value;
	 	var ProductVerId = document.getElementById("productVerId1").value;
	 	var GroupId = document.getElementById("GroupId").value;
	 	var GroupVerId = document.getElementById("GroupVerId").value;
	 	var productStatus = document.getElementById("productStatus").value;
	 	var subQuoteVerId = document.getElementById("subQuoteVerId").value;
	 	var isOptionsDisabled = document.getElementById("IsOptionDisabled").value;
	 	var custState = "";	 
	 	var parentPolicyId = document.getElementById("parentPolicyId").value;
 	    var policyNumber =document.getElementById("policyNumber").value;
 	    var parentPolicyVerId = document.getElementById("parentPolicyVerId").value;
 	    var FamilyId = document.getElementById("ProductFamilyId").value;
 	    var planStateId = document.getElementById("planStateId").value;
 	    var paretQuoteStatus = document.getElementById("paretQuoteStatus1").value;
 	    var parentPolicyStatus = document.getElementById("parentPolicyStatus1").value;
 	    document.getElementById("QuoteDiv").style.display = "none";
	 	document.getElementById("docTable").style.display = "none";
	 	document.getElementById("CoveragesDiv").style.display = "none";			 	
	 	document.getElementById("PolicyInformationDiv").style.display = "none";
     	var pars2 = 'answer(productId)='+prodId+'&answer(productVerId)='+ProductVerId+'&answer(parentQuoteId)='+parentQuoteId+
     	'&answer(Object::Quote::QuoteVerId)='+parentQuoteVerId+'&answer(subQuoteId)='+subQuoteId+'&answer(FamilyId)='+FamilyId+
     	'&answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)=&answer(Object::Quote::ProductId)='+prodId+'&answer(customerId)='+customerId+
     	'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(State)'+planStateId+'&answer(Object::Policy::ParentPolicyId)='+parentPolicyId+
     	'&answer(Object::Quote::PolicyNumber)='+policyNumber+'&answer(policyNumber)='+policyNumber+
     	'&answer(Object::Quote::QuoteStatus)='+paretQuoteStatus+'&answer(Object::Quote::ProductVerId)='+ProductVerId+
     	'&answer(Object::Policy::ParentPolicyVerId)='+parentPolicyVerId+
     	'&answer(EndorsementDetail_Forward)=Yes&answer(parentPolicyStatus)='+parentPolicyStatus;
 		var url = '/GetEndorsementDetailAction.do?';
 		autologout();
	 	new Ajax.Request(url, 
		 	{method: 'post',parameters:pars2,
				asynchronous:true,
				onFailure:function(){},
				onException:function(){},
				onComplete:function(transport){
			 	document.getElementById("CoveragesDiv").style.display = "block";
			 	document.getElementById("CoveragesDiv").innerHTML= transport.responseText;
				 enableTabs();
			 	},onSuccess: function(transport){	
			 	document.getElementById("QuoteDiv").style.display = "none";
			 	document.getElementById("docTable").style.display = "none";
			 	document.getElementById("CoveragesDiv").style.display = "block";			 	
			 	document.getElementById("CoveragesDiv").innerHTML= transport.responseText;
			 	document.getElementById("PolicyInformationDiv").style.display = "none";
			 	}
			}
		);
 	}
  function activateInnerTabs(TabId){
 	document.getElementById('PolicyInformationDiv').style.display="block";
	 if(document.getElementById("Pol_Definition_Row") != undefined){
    	document.getElementById("Pol_Definition_Row").className = "todotab_inactive";
    	}
   	 if(document.getElementById("Pol_Hazards_Row") != undefined){
    	document.getElementById("Pol_Hazards_Row").className = "todotab_inactive";
    	}    	
   	 if(document.getElementById("Pol_Benefits_Row") != undefined){    	
    	document.getElementById("Pol_Benefits_Row").className = "todotab_inactive";
    	}
    if(document.getElementById(TabId)!=undefined){
    	document.getElementById(TabId).disabled = false;
	 	document.getElementById(TabId).className = "todotab_active";
	 }
	 }
	 
	 function LoadMiscEndorsementDetailTab(TabId){
     	activateTabs(TabId);
     	document.getElementById("Premium Effect").style.display = "block";
	 	document.getElementById("Endorsement Description").style.display = "none";
	 	if(document.getElementById('EndorsementDetail_Row') != null && document.getElementById('EndorsementDetail_Row') != undefined){
	 		document.getElementById('EndorsementDetail_Row').className="todotab_active";
	 	}
	 	enableTabs();
	 }
	 
	 
	 function LoadMiscEndorsementDescriptionTab(TabId){
     	activateTabs(TabId);
     	document.getElementById("Endorsement Description").style.display = "block";
	 	document.getElementById("Premium Effect").style.display = "none";
	 	if(document.getElementById('EndorsementDetail_Row') != null && document.getElementById('EndorsementDetail_Row') != undefined){
	 		document.getElementById('EndorsementDetail_Row').className="todotab_active";
	 	}
	 	enableTabs();
	 }
	 
	 
	  function LoadCancelEndorsementDetailTab(TabId){
     	activateTabs(TabId);
     	if(document.getElementById('EndorsementDetail_Row') != null && document.getElementById('EndorsementDetail_Row') != undefined){
     		document.getElementById('EndorsementDetail_Row').className="todotab_active";
     	}
     	document.getElementById("Premium Effect").style.display = "block";
	 	document.getElementById("Reason").style.display = "none";
	 	enableTabs();
	 }
	 
	 
	 function LoadCancelEndorsementDescriptionTab(TabId){
     	activateTabs(TabId);   
     	showDesc();
     	if(document.getElementById('EndorsementDetail_Row') != null && document.getElementById('EndorsementDetail_Row') != undefined){
     		document.getElementById('EndorsementDetail_Row').className="todotab_active";
     	}
     	document.getElementById("Reason").style.display = "block";
	 	document.getElementById("Premium Effect").style.display = "none";
	 	enableTabs();
	 }
	 
	 
	 function sendEmailDetails(){
		var ownerId=document.getElementById("ownerId").value;
		var objId=document.getElementById('parentQuoteId').value;
		var ObjectVerId=document.getElementById('parentQuoteVerId').value;		
		var SubQuoteVerId=document.getElementById('subQuoteVerId').value;
		var QuoteStatus=document.getElementById("paretQuoteStatus1").value;
		var EmailType= "QUOTE";// document.getElementById('EmailType').value;
		var QuoteNumber=document.getElementById('QuoteNumberHid').value;
		var QuoteSubNumber=document.getElementById('QuoteSubNumberHid').value;
		var PolicyNumber=document.getElementById('policyNumber').value;
		var email=document.getElementById('emailHid').value;
		var roleName=document.getElementById('roleNameHid').value;
		var CustomerName=document.getElementById('custname').value;


		var insName1 = CustomerName;
		insName1 = insName1.replace(/___/g,'"');
		var insNamedecripted = encodeURIComponent(insName1);	
		EmailPopup('../PrefilledEmailAction.do?answer(pagename)=email&answer(Object::Activity::OwnerId)='+ownerId+
		'&answer(Object::Notification::Email::ObjectId)='+objId+'&answer(Object::Notification::Email::InsuredName)='+insNamedecripted+
		'&answer(Object::Notification::UserDetail::Email)='+email+'&answer(Object::Notification::UserDetail::RoleName)='+roleName+
		'&answer(Object::Notification::Email::ObjectVerId)='+ObjectVerId+
		'&answer(Object::Notification::Email::ObjectType)='+EmailType+
		'&answer(Object::Notification::Email::NotificationType)=EMAIL&answer(Object::UserDetail::ownerId)='+ownerId+
		'&answer(Object::Notification::Email::SubQuoteVerId)='+SubQuoteVerId+
		'&answer(Object::Notification::Email::ObjectStatus)='+QuoteStatus+
		'&answer(Object::Notification::Email::EmailType)=POLICY&answer(Object::Notification::Email::QuoteStatus)='+QuoteStatus+
		'&answer(Object::Notification::Email::QuoteNumber)='+QuoteNumber+
		'&answer(Object::Notification::Email::QuoteSubNumber)='+QuoteSubNumber+
		'&answer(Object::Notification::Email::PolicyNumber)='+PolicyNumber,"Email");	
	}
	 
	 function validateRenewalQuoteDate(frm){
		    var vardate = frm.txtDate1.value;
		    var ddate = new Date(vardate);
		    var effdate=frm.policyEffDate.value;  
		    var expdate=frm.policyExpDate.value;
		    var effDate = new Date(effdate);
		    var expDate = new Date(expdate);  
		    var productName = frm.productName.value;
		   
		    var renewalFlag = "N";
		    
		    if((productName == "Renewal-DP1") || (productName == "Renewal-DP3")||(productName == "Renewal-HO3")||(productName == "Renewal-HO8")||(productName == "Renewal-BR") ||(productName == "Renewal-Vacant-DP1") || (productName == "Renewal-Vacant-DP3") || (productName == "Renewal CUP") || (productName == "Storage Tank - Renewal"))  {
		          renewalFlag ="Y";
		         
		      } 
		    
		   
		    if(!isDate(vardate)){
				alert("Invalid Date");
				frm.txtDate1.value=frm.referenceStartDate.value;
				frm.txtDate1.select();
				return false;
			}
			if (vardate==""){
				alert("Please enter the Effective Date");
				frm.txtDate1.focus();
				return false;
			}
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);
		    
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				alert("Please enter date in 'MM/DD/YYYY' format");
				frm.txtDate1.select();
				return false;
			}
			
			var reqDate = new Date("01/01/2005");
			
			if (ddate < reqDate)
			{			
				alert("Effective Date cannot be prior to Jan 1, 2005");
				frm.txtDate1.value=frm.referenceStartDate.value;
				frm.txtDate1.select();
				return false;
			}			
			if(renewalFlag == "Y"){			
			   if(ddate < expDate) {
					alert("Please enter the valid Renewal Effective Date");
					frm.txtDate1.value=frm.referenceStartDate.value;					
					frm.txtDate1.select();
					return false;
				}
			} 
			var effDate1 = document.getElementById('txtDate1').value;
			var dmonth1 = parseInt(effDate1.substring(0, 2), 10);
			var dday1 = parseInt(effDate1.substring(3, 5), 10);
			var dyear1 = parseInt(effDate1.substring(6, 10), 10);
			var expDate1 = Ext.getCmp('expDate1').getValue(); 
			var MM2 = expDate1.getMonth()+1;
			var DD2 = expDate1.getDate();
			var YY2 = expDate1.getFullYear();
			if(MM2<10){ MM2 = "0"+(MM2);}
			if(DD2<10){ DD2 = "0"+DD2;}
			Ext.getCmp('expDate1').setValue(MM2+'/'+DD2+'/'+YY2);
			document.forms[0].QuoteEndDate.value =MM2+'/'+DD2+'/'+YY2;
			var effDate2 = Ext.getCmp('txtDate1').getValue();
			if(YY2 < dyear1){
				alert("Please enter the valid Renewal Expiration date");
				return false;
			}
			if((MM2 < dmonth1) && (YY2==dyear1)){
				alert("Please enter the valid Renewal Expiration date");
				return false;
			}
			if((MM2 == dmonth1) && (DD2<=dday1) && (YY2==dyear1)){
				alert("Please enter the valid Renewal Expiration date");
				return false;
			}					
			return true;
		}
	 	function showDesc(){				
	 		if(document.getElementById('Cancel_Reason') != null && document.getElementById('Cancel_Reason') != undefined){	
	 			if(document.getElementById('Cancel_Reason').value=='Other'){
					document.getElementById('Other_Desc_Container').style.display ='';
				}else {
					document.getElementById('EndorsementDescription').value='';
					document.getElementById('Other_Desc_Container').style.display ='none';
				}
	 		}
	 		
			if(document.getElementById('Reinstate_Reason') !=null && document.getElementById('Reinstate_Reason') != undefined){
				if(document.getElementById('Reinstate_Reason').value=='Underwriting Reasons'){
		 			document.getElementById('Other_Desc_Container').style.display ='';
		 		}else {
		 			document.getElementById('EndorsementDescription').value='';
		 			document.getElementById('Other_Desc_Container').style.display ='none';
		 		}
			}
		}
		function showFillInFormPopUp(appId,appVerId,quoteDocId,docId,docVerId,title,editionDate,docDivId){
 	initDocumentDialog();//to init Documenty pop-up
 	var subQuoteId1 = document.getElementById("subQuoteId11").value;
    var subQuoteVerId1 = document.getElementById("subQuoteVerId").value;
   // var riskTerritory1 = document.getElementById("riskTerritory1").value;
    var customerId1 = document.getElementById("customerId").value;
    var agencyId1 = document.getElementById("agencyId").value;
    var prodId1 = document.getElementById("productId1").value;
    var productVerId1 = document.getElementById("productVerId1").value;
   // var GroupId1 = document.getElementById("GroupId").value
    var ownerId1 = document.getElementById("ownerId").value;
    // var GroupVerId1 = document.getElementById("GroupVerId").value;
    var parentQuoteId1 = document.getElementById("parentQuoteId").value;
   // var productStatus1 = document.getElementById("productStatus").value;
   // var CustomerState1 = document.getElementById("CustomerState").value;
   // var ProductFamilyId1 = document.getElementById("ProductFamilyId").value;
   // var parentQuoteVerId1 = document.getElementById("parentQuoteVerId").value;
 	var quoteType = document.getElementById("QuoteType").value;
 	var quoteNumber = document.getElementById("QuoteNumberHid").value;
 	var state = document.getElementById("planStateId").value;
 	var actionName = escape("/saveQuoteDocumentApplicationAction3.0.go?");
 	var clearnceStatus = "";
 	if(document.getElementById("clearnceStatus1") != undefined){
 		clearnceStatus = document.getElementById("clearnceStatus1").value;
 	}
 	title = escape(title);
	editionDate = editionDate+" "+title
 	var pars = 'answer(productId)='+prodId1+'&answer(productVerId)='+productVerId1+'&answer(Object::Quote::QuoteType)='+quoteType+'&answer(applicationId)='+appId+'&answer(applicationVerId)='+appVerId+
 				'&answer(Object::Customer::CustomerId)='+customerId1+'&answer(QuoteId)='+subQuoteId1+'&answer(ownerId)='+ownerId1+'&answer(Object::Document::Manuscript::Endorsement::QuoteDocId)='+quoteDocId+
 				'&answer(Object::Application::ApplicationType)=DOCUMENT_APPLICATION&answer(parentQuoteId)='+parentQuoteId1+'&answer(subQuoteId)='+subQuoteId1+
 				'&answer(actionName)='+actionName+'&answer(Object::Agency::AgencyId)='+agencyId1+'&answer(Object::Document::Manuscript::Endorsement::SubQuoteVerId)='+subQuoteVerId1+
 				'&answer(documentType)=QUOTE_DOCUMENT&answer(Object::Document::Manuscript::Endorsement::DocumentId)='+docId+'&answer(Object::Document::Manuscript::Endorsement::DocumentVerId)='+docVerId+
 				'&answer(DisplayValue_Object::Document::DocumentHeading)='+editionDate+'&answer(DisplayValue_Object::Document::EditionDate)='+editionDate+'&answer(DisplayValue_Object::Document::Title)='+title+'&answer(prevSubQuoteVerId)='+subQuoteVerId1+'&answer(modQuoteNumber)='+quoteNumber+'&answer(State)='+state+'&answer(Object::Clearance::NoRecords)='+clearnceStatus+title+'&answer(Object::Doc::NewDocNameId)='+docDivId;
 	var url = "../GetDocumentApplication.do?";
 	autologout();			
 	new Ajax.Request(url, 
	 	{method: 'post',
			asynchronous:true,parameters:pars,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 	},onSuccess: function(transport){	
		 	
			document.getElementById("DocumentPopUpHeading").innerHTML = ""+unescape(title);
			document.getElementById("DocumentPopUp").style.display = "block";	
			document.getElementById("DocumentPopUpBody").innerHTML = transport.responseText;
			if(document.getElementById("submitButtonNew")!=null && document.getElementById("submitButtonNew")!='undefined'){
			document.getElementById("submitButtonNew").className="covsmallbutton"; 
			}
			if(document.getElementById("CancelRisk1")!=null && document.getElementById("CancelRisk1")!='undefined'){
			document.getElementById("CancelRisk1").className="covsmallbutton"; 
			}
			YAHOO.example.container.documentDialog.show();
			YAHOO.util.Event.on('closeIcon2', 'click', function(e) {
	 
		 	YAHOO.example.container.documentDialog.cancel();
		 	document.getElementById("DocumentPopUpBody").innerHTML = " ";
		 	document.getElementById("DocumentPopUp").style.display = "none";	
		 	
		 })
		 
		  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
		 
		 	YAHOO.example.container.documentDialog.cancel();
		 	document.getElementById("DocumentPopUpBody").innerHTML = " ";
		 	document.getElementById("DocumentPopUp").style.display = "none";	
		 	
		 })
		 
		 	}
		}
	);	
 	
 	}
 	var documentDialog=true;
 	function initDocumentDialog(){
 	
	YAHOO.example.container.documentDialog = new YAHOO.widget.Dialog("DocumentPopUp", 
							{ width : "78em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []
							});
	// Render the Dialog
	//if(documentDialog==true){
		YAHOO.example.container.documentDialog.render();
	//	documentDialog=false;
	//}	
}
 function showFillInFormPopUpProposal(){
 		var frm=document.getElementById("ProposalDocumentApplication");

 		var url=escape("../saveQuoteDocumentApplicationAction3.0.do");

 		
 		
 		new Ajax.Request(url, {method: 'post',parameters:$(frm).serialize(this),
 	onLoading: function() {
	
	},onComplete:function(transport){
 	},onSuccess: function(transport){
 	}});

 	}