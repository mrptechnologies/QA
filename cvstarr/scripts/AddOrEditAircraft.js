var addClassDivActive = false;
var activeTabId = "";

function getEditAircraftWindow(riskId){
 	
 	var locationListArraySize = 0;	 	
 	
 	var parentQuoteId    	= document.getElementById("parentQuoteId").value;

	var parentQuoteVerId 	= document.getElementById("parentQuoteVerId").value;

	var subQuoteId    		= document.getElementById("subQuoteId11").value;

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
 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(ObjectType)=QUOTE&answer(objectType)=QUOTE&answer(recalculateneeded)=recalculate&answer(Object::Agency::AgencyId)='+agencyId+	
 				'&answer(recalculateneeded)=recalculate&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+
 				'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId+
 				'&answer(Object::Quote::AircraftRiskId)='+riskId;
 				
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
		 		 document.getElementById("CovLimitsDiv").style.display = "block";
		 	},onSuccess: function(transport){	
		 	document.getElementById("CovLimitsDiv").innerHTML = "";
		 	document.getElementById("CovLimitsDiv").innerHTML= transport.responseText;
		 	}
		}
	);
	}