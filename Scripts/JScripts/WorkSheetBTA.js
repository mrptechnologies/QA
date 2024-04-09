
    function showReasonsText(){
    	
    	if(document.getElementById("collateralLOBFactor").value > 1 ||document.getElementById("collateralLOBFactor").value < 1  ){
    		document.getElementById("collateralLOBFactorReasonTD").style.display="";
    	}else{
    		document.getElementById("collateralLOBFactorReasonTD").style.display="none";
    		document.getElementById("collateralLOBFactorReason").value = "";
    	}
    	
    	
    	if(document.getElementById("qualityInforceBusinessFactor").value > 1 ||document.getElementById("qualityInforceBusinessFactor").value < 1  ){
    		document.getElementById("qualityInforceBusinessFactorRaesonTD").style.display=""; 	    	
    	}else{
    		document.getElementById("qualityInforceBusinessFactorRaesonTD").style.display="none";
    		document.getElementById("qualityInforceBusinessFactorRaeson").value="";
    	}
    	
    	if(document.getElementById("accountLabeledFactor").value > 1 ||document.getElementById("accountLabeledFactor").value < 1  ){
    		document.getElementById("accountLabeledFactorReasonTD").style.display="";	
    	}else{
    		document.getElementById("accountLabeledFactorReasonTD").style.display="none";
    		document.getElementById("accountLabeledFactorReason").value="";
    	}
    	
    	if(document.getElementById("producerLabeledFactor").value > 1 ||document.getElementById("producerLabeledFactor").value < 1  ){
    		document.getElementById("producerLabeledFactorReasonTD").style.display="";
    	}else{
    		document.getElementById("producerLabeledFactorReasonTD").style.display="none";
    		document.getElementById("producerLabeledFactorReason").value="";
    	}
    	
    	if(document.getElementById("qualityOfUWDataMadeFactor").value > 1 ||document.getElementById("qualityOfUWDataMadeFactor").value < 1  ){
    		document.getElementById("qualityOfUWDataMadeFactorReasonTD").style.display="";
    	}else{
    		document.getElementById("qualityOfUWDataMadeFactorReasonTD").style.display="none";
    		document.getElementById("qualityOfUWDataMadeFactorReason").value="";
    	}
    	
    	if(document.getElementById("highPerPersonSumInsuredFactor").value > 1 ||document.getElementById("highPerPersonSumInsuredFactor").value < 1  ){
    		document.getElementById("highPerPersonSumInsuredFactorReasonTD").style.display="";  	
    	}else{
    		document.getElementById("highPerPersonSumInsuredFactorReasonTD").style.display="none";
    		document.getElementById("highPerPersonSumInsuredFactorReason").value="";
    	}
    	
    	if(document.getElementById("highConcentrationofRiskFactor").value > 1 ||document.getElementById("highConcentrationofRiskFactor").value < 1  ){
    		document.getElementById("highConcentrationofRiskFactorReasonTD").style.display="";    	
    	}else{
    		document.getElementById("highConcentrationofRiskFactorReasonTD").style.display="none";
    		document.getElementById("highConcentrationofRiskFactorReason").value="";
    	}
    	
    	if(document.getElementById("unusualActivitiesFactor").value > 1 ||document.getElementById("unusualActivitiesFactor").value < 1  ){
    		document.getElementById("unusualActivitiesFactorReasonTD").style.display=""; 	
    	}else{
    		document.getElementById("unusualActivitiesFactorReasonTD").style.display="none";
    		document.getElementById("unusualActivitiesFactorReason").value="";
    	}
    
    }

	function getWorkSheetClassHazardsList(classId,id,className){

		var riskId = classId;
		
		var actName = "";	
			 	
	 	var parentQuoteId    = document.getElementById("parentQuoteId").value;
	 
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

		var subQuoteId    = document.getElementById("subQuoteId11").value;

		var productVerId  = document.getElementById("ProductVerId").value;

		var agencyId = document.getElementById("agencyId").value;

		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;

		var FamilyId = document.getElementById("ProductFamilyId").value;
	
	 	var ownerId = document.getElementById("ownerId").value;
	 
		var custId = document.getElementById("customerId").value;
	
		var pars = 'answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row&answer(riskTerritory)='
		'&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+	
	 	'&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
	 				
	 	var url = '../getWorksheetQuoteHazardsList.do?'+pars;	
	    var pars2  = 'answer(Object::Quote::Class::ClassId)='+riskId+'&answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId;
	    autologout();
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
		if(document.getElementById("CovLimitsDiv") !=undefined && document.getElementById("CovLimitsDiv") !=null){
	 			document.getElementById("CovLimitsDiv").style.display = "block";
	 			}
	 			if(document.getElementById("WorkSheetHazardDiv"+classId).style.display=='none'){
	 				document.getElementById("WorkSheetHazardDiv"+classId).style.display='block';
	 				document.getElementById("WorkSheetHazardDiv"+classId).innerHTML= transport.responseText;
	 				document.getElementById(id).innerHTML = "- "+className;
	 			}else{
	 				document.getElementById("WorkSheetHazardDiv"+classId).style.display='none';
	 				document.getElementById(id).innerHTML = "+ "+className;
	 			}
			 	if(document.getElementById("PolicyInformationDiv") !=undefined && document.getElementById("PolicyInformationDiv") !=null){
			 	document.getElementById("PolicyInformationDiv").style.display="none";
			 	}
	 		}});
	}
	
	function getWorkSheetClassBenefitsList(hazardId,classId,id,hazardName){

		var riskId = classId;
		var actName = "";	 		 	
	 	var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId11").value;
		var productVerId  = document.getElementById("ProductVerId").value;
		var agencyId = document.getElementById("agencyId").value;
		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
		
		var pars = 'answer(Object::Quote::Class::HazardId)='+hazardId+'&answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row'
	 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+	
	 				'&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
	 				
	 	var url = '../getWorksheetQuoteBenefitsList.do?'+pars;	
	    var pars2  = 'answer(subQuoteId)='+subQuoteId+'&answer(Object::Quote::Class::ClassId)='+classId+'&answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId;
	    autologout();
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
		if(document.getElementById("CovLimitsDiv") !=undefined && document.getElementById("CovLimitsDiv") !=null){
	 			document.getElementById("CovLimitsDiv").style.display = "block";
	 	}
	 			if(document.getElementById("WorkSheetBenefitsDiv"+hazardId+""+classId).style.display == 'none'){
	 				document.getElementById("WorkSheetBenefitsDiv"+hazardId+""+classId).style.display = 'block';
	 				document.getElementById("WorkSheetBenefitsDiv"+hazardId+""+classId).innerHTML= transport.responseText;
	 				document.getElementById(id).innerHTML= "- "+hazardName;
	 			}else{
	 				document.getElementById("WorkSheetBenefitsDiv"+hazardId+""+classId).style.display = 'none';
	 				document.getElementById(id).innerHTML= "+ "+hazardName;
	 			}			 	
	 			if(document.getElementById("PolicyInformationDiv") !=undefined && document.getElementById("PolicyInformationDiv") !=null){
			 	document.getElementById("PolicyInformationDiv").style.display="none";
			 	}
	 		}});
	}
	
	function getWorkSheetClassBenefitsConstructed(hazardId,classId,benefitId,id,benefitsName){

		var riskId = classId;
		var actName = "";	 		 	
	 	var parentQuoteId    = document.getElementById("parentQuoteId").value;
		var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;
		var subQuoteId    = document.getElementById("subQuoteId11").value;
		var productVerId  = document.getElementById("ProductVerId").value;
		var agencyId = document.getElementById("agencyId").value;
		var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
		var FamilyId = document.getElementById("ProductFamilyId").value;
	 	var ownerId = document.getElementById("ownerId").value;
		var custId = document.getElementById("customerId").value;
		
		var pars = 'answer(Object::Quote::Class::BenefitId)='+benefitId+'&answer(Object::Quote::Class::HazardId)='+hazardId+'&answer(productVerId)='+productVerId+'&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId+'&answer(DisplayValue_Object::AdditionalInsured::IsAddedInQuote)=Y&answer(objectId)=0&answer(objectVerId)=0&answer(Object::Application::ApplicationType)=QUOTE_APPLICATION&answer(objectName)=CLASSHAZARDS&answer(applicationType)=QUOTE&answer(applicationSubType)=&answer(isSubApplicationCoveredByForm)=Yes&answer(actionName)='+actName+'&answer(activateTabId)=ClassHazards_Row'
	 				'&answer(riskTerritory)=&answer(Object::Quote::PrevSubQuoteVerId)='+prevSubQuoteVerId+'&answer(Object::Quote::Class::ClassId)='+riskId+'&answer(Object::Quote::ClassHazardsId)='+riskId+'&answer(Object::Quote::ProductFamilyId)='+FamilyId+'&answer(FamilyId)='+FamilyId+'&answer(QuoteId)='+parentQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+	
	 				'&answer(Object::Customer::CustomerId)='+custId+'&answer(QuoteId)='+parentQuoteId+'&answer(CustomerId)='+custId+'&answer(subQuoteId)='+subQuoteId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(parentQuoteId)='+parentQuoteId;
	 				
	 	var url = '../getWorkSheetClassBenefitsConstructed.do?'+pars;	
	    var pars2  = 'answer(Object::Quote::Class::ClassId)='+classId+'&answer(subQuoteId)='+subQuoteId+'&answer(activeTabName)=General_Questions_Tab&activeTabName=General_Questions_Tab&answer(parentQuoteId)='+parentQuoteId+'&answer(parentQuoteVerId)='+parentQuoteVerId;
	    autologout();
		new Ajax.Request(url, {method: 'post',parameters:pars2,onComplete:function(transport){},onSuccess: function(transport){
		if(document.getElementById("CovLimitsDiv") !=undefined && document.getElementById("CovLimitsDiv") !=null){
	 			document.getElementById("CovLimitsDiv").style.display = "block";
	 			}
	 			if(document.getElementById("WorkSheetBenefitsConstructDiv"+benefitId+hazardId+classId).style.display=='none'){
	 				document.getElementById("WorkSheetBenefitsConstructDiv"+benefitId+hazardId+classId).innerHTML= transport.responseText;
	 				document.getElementById("WorkSheetBenefitsConstructDiv"+benefitId+hazardId+classId).style.display = 'block';
	 				document.getElementById(id).innerHTML= "- "+benefitsName;
	 			}else{
	 				document.getElementById("WorkSheetBenefitsConstructDiv"+benefitId+hazardId+classId).style.display = 'none';
	 				document.getElementById(id).innerHTML= "+ "+benefitsName;
	 			}
			 	if(document.getElementById("PolicyInformationDiv") !=undefined && document.getElementById("PolicyInformationDiv") !=null){
			 	document.getElementById("PolicyInformationDiv").style.display="none";
			 	}
	 		}});
	}
	
	function setLockStatus(frm){
		var formElement=document.forms[0];
		if(frm.Object$Quote$QuoteStatus.value=="Offered" || frm.Object$Quote$QuoteStatus.value=="Accepted" || frm.Object$Quote$QuoteStatus.value=="Bind Request" || frm.Object$Quote$QuoteStatus.value=="Declined" ){
			frm.LockStatus.value="Locked";
			return true;
		}
		if(frm.Object$Quote$QuoteStatus.value=="In Progress" ){
			frm.LockStatus.value="Unlocked";
			return true;
		}
	}
	
	function diplayCMP(formElement){

		//var formElement=document.forms[0];
		var commissionAdjustmentSign = formElement.CommissionAdjustmentSign.value;
		var commissionAdjustmentValue = formElement.CommissionAdjustmentValue.value;
		var oldCommissionPercentage = formElement.oldCommissionPercentage.value;
		var commissionAdjustment = commissionAdjustmentSign + commissionAdjustmentValue;
		var newCommissionPercentage = (oldCommissionPercentage/1)+(commissionAdjustment/1);	
		var notAnumber = isNaN(commissionAdjustmentValue);
		if(!notAnumber && validateCommissionRange(commissionAdjustment, oldCommissionPercentage)){
			formElement.CurrentCommissionPercentage.value = newCommissionPercentage;
			formElement.newCommissionPercentage.value = newCommissionPercentage;
		}else{
			if(notAnumber)
			alert("Please enter numeric values only");
			formElement.CommissionAdjustmentValue.focus();
	        formElement.CommissionAdjustmentValue.select();
			return false;
		}
	}
	
	function validateCommissionRange(commissionAdjustment, oldCommissionPercentage){
		var minRange = (0 - (oldCommissionPercentage/1));
		var maxRange = ((oldCommissionPercentage/1) + 10);
		if(commissionAdjustment>=minRange && commissionAdjustment<=maxRange){
			return true;
		}else{
			alert("Commission Adjustment % should be in between :"+minRange+" and "+maxRange);
			return false;
		}
	}
	
	
	function validateForm(frm) {
		var formElement=frm;
		if(document.getElementById("collateralLOBFactor").value > 1 ||document.getElementById("collateralLOBFactor").value < 1  ){    		
    		if(document.getElementById("collateralLOBFactorReason").value == ""){
    			alert('Please Enter "Collateral Lines Of Business In Force" Reason');
    			return false;
    		}
    	}
    	if(document.getElementById("qualityInforceBusinessFactor").value > 1 ||document.getElementById("qualityInforceBusinessFactor").value < 1  ){
    	
    		if(document.getElementById("qualityInforceBusinessFactorRaeson").value==""){
    			alert('Please Enter "Quality Of In Force Business In Place With The Producer" Reason');
    			return false;
    		}
    	
    	}
    	if(document.getElementById("accountLabeledFactor").value > 1 ||document.getElementById("accountLabeledFactor").value < 1  ){
    		if(document.getElementById("accountLabeledFactorReason").value==""){
    			alert('Please Enter "Account Labeled As A Target Based On Favorable Results Of Similar Size And Type Of Risk" Reason');
    			return false;
    		}
    	}
    	
    	if(document.getElementById("producerLabeledFactor").value > 1 ||document.getElementById("producerLabeledFactor").value < 1  ){
    		if(document.getElementById("producerLabeledFactorReason").value==""){
    			alert('Please Enter "Producer Labeled As A Target Based On The Size And Quality Of Their In Force A&H Business" Reason');
    			return false;
    		}
    	
    	}
    	
    	if(document.getElementById("qualityOfUWDataMadeFactor").value > 1 ||document.getElementById("qualityOfUWDataMadeFactor").value < 1  ){
    		if(document.getElementById("qualityOfUWDataMadeFactorReason").value==""){
    			alert('Please Enter "Quality Of Underwriting Data Made Available" Reason');
    			return false;
    		}
    	
    	}
    	if(document.getElementById("highPerPersonSumInsuredFactor").value > 1 ||document.getElementById("highPerPersonSumInsuredFactor").value < 1  ){
    		if(document.getElementById("highPerPersonSumInsuredFactorReason").value==""){
    			alert('Please Enter "High Per Person Sums Insured" Reason');
    			return false;
    		}
    	
    	}
    	
    	if(document.getElementById("highConcentrationofRiskFactor").value > 1 ||document.getElementById("highConcentrationofRiskFactor").value < 1  ){
    		if(document.getElementById("highConcentrationofRiskFactorReason").value==""){
    			alert('Please Enter "High Concentrations Of Risk In Any Given Location" Reason');
    			return false;
    		}
    	
    	}
    	
    	
    	if(document.getElementById("unusualActivitiesFactor").value > 1 ||document.getElementById("unusualActivitiesFactor").value < 1  ){
    		if(document.getElementById("unusualActivitiesFactorReason").value==""){
    			alert('Please Enter "Unusual Activities To Be Insured" Reason');
    			return false;
    		}
    	
    	}
    	
    	if(formElement.collateralLOBFactor!=null && formElement.collateralLOBFactor!=undefined){
		if(formElement.collateralLOBFactor.value == '' || formElement.collateralLOBFactor.value <= 0.0){
			alert("Please Enter Collateral Lines Of Business In Force");
			formElement.collateralLOBFactor.focus();
			formElement.collateralLOBFactor.select();
			return false;
		} else if(isNaN(formElement.collateralLOBFactor.value)){
			alert("Please Enter The Numeric Value For Collateral Lines Of Business In Force");
			formElement.collateralLOBFactor.focus();
			formElement.collateralLOBFactor.select();
			return false;
		}
    	}
		if(formElement.qualityInforceBusinessFactor.value == ''|| formElement.qualityInforceBusinessFactor.value <= 0.0){
			alert("Please Enter Quality Of In Force Business In Place With The Producer");
			formElement.qualityInforceBusinessFactor.focus();
			formElement.qualityInforceBusinessFactor.select();
			return false;
		} else if(isNaN(formElement.qualityInforceBusinessFactor.value)){
			alert("Please Enter The Numeric Value For Quality Of In Force Business In Place With The Producer");
			formElement.qualityInforceBusinessFactor.focus();
			formElement.qualityInforceBusinessFactor.select();
			return false;
		}
		
		if(formElement.accountLabeledFactor.value == ''|| formElement.accountLabeledFactor.value <= 0.0){
			alert("Please Enter Account Labeled As A Target Based On Favorable Results Of Similar Size And Type Of Risk");
			formElement.accountLabeledFactor.focus();
			formElement.accountLabeledFactor.select();
			return false;
		} else if(isNaN(formElement.accountLabeledFactor.value)){
			alert("Please Enter The Numeric Value For Account Labeled As A Target Based On Favorable Results Of Similar Size And Type Of Risk");
			formElement.accountLabeledFactor.focus();
			formElement.accountLabeledFactor.select();
			return false;
		}
				
		if(formElement.producerLabeledFactor.value == ''|| formElement.producerLabeledFactor.value <= 0.0){
			alert("Please Enter Producer Labeled As A Target Based On The Size And Quality Of Their In Force A&H Business");
			formElement.producerLabeledFactor.focus();
			formElement.producerLabeledFactor.select();
			return false;
		} else if(isNaN(formElement.producerLabeledFactor.value)){
			alert("Please Enter The Numeric Value For Producer Labeled As A Target Based On The Size And Quality Of Their In Force A&H Business");
			formElement.producerLabeledFactor.focus();
			formElement.producerLabeledFactor.select();
			return false;
		}
				
		if(formElement.qualityOfUWDataMadeFactor.value == ''|| formElement.qualityOfUWDataMadeFactor.value <= 0.0){
			alert("Please Enter Quality Of Underwriting Data Made Available");
			formElement.qualityOfUWDataMadeFactor.focus();
			formElement.qualityOfUWDataMadeFactor.select();
			return false;
		} else if(isNaN(formElement.qualityOfUWDataMadeFactor.value)){
			alert("Please Enter The Numeric Value For Quality Of Underwriting Data Made Available");
			formElement.qualityOfUWDataMadeFactor.focus();
			formElement.qualityOfUWDataMadeFactor.select();
			return false;
		}
				
		if(formElement.highPerPersonSumInsuredFactor.value == ''|| formElement.highPerPersonSumInsuredFactor.value <= 0.0){
			alert("Please Enter High Per Person Sums Insured ");
			formElement.highPerPersonSumInsuredFactor.focus();
			formElement.highPerPersonSumInsuredFactor.select();
			return false;
		} else if(isNaN(formElement.highPerPersonSumInsuredFactor.value)){
			alert("Please Enter The Numeric Value For High Per Person Sums Insured");
			formElement.highPerPersonSumInsuredFactor.focus();
			formElement.highPerPersonSumInsuredFactor.select();
			return false;
		}
				
		if(formElement.highConcentrationofRiskFactor.value == ''|| formElement.highConcentrationofRiskFactor.value <= 0.0){
			alert("Please Enter High Concentrations Of Risk In Any Given Location");
			formElement.highConcentrationofRiskFactor.focus();
			formElement.highConcentrationofRiskFactor.select();
			return false;
		} else if(isNaN(formElement.highConcentrationofRiskFactor.value)){
			alert("Please Enter The Numeric Value For High Concentrations Of Risk In Any Given Location");
			formElement.highConcentrationofRiskFactor.focus();
			formElement.highConcentrationofRiskFactor.select();
			return false;
		}
				
		if(formElement.unusualActivitiesFactor.value == ''|| formElement.unusualActivitiesFactor.value <= 0.0){
			alert("Please Enter Unusual Activities To Be Insured");
			formElement.unusualActivitiesFactor.focus();
			formElement.unusualActivitiesFactor.select();
			return false;
		} else if(isNaN(formElement.unusualActivitiesFactor.value)){
			alert("Please Enter The Numeric Value For Unusual Activities To Be Insured");
			formElement.unusualActivitiesFactor.focus();
			formElement.unusualActivitiesFactor.select();
			return false;
		}
		if(formElement.Object$Quote$QuoteStatus.value=="Offered" ||  formElement.Object$Quote$QuoteStatus.value=="Bind Request" ){
			formElement.action = "../executeWorksheetQuoteMandatoryRulesBTA.do";
		}
		else{
			formElement.action = "../SaveQuoteUnderwriterStatusActionBTA.do";
		}
		if(document.getElementById("isMinimumPremiumAppliesY") != null && document.getElementById("isMinimumPremiumAppliesY") != undefined){ 
			if(document.getElementById("isMinimumPremiumAppliesY").checked){
				var minimumPremium = formElement.MinimumPremium1.value;
				minimumPremium = minimumPremium.replace(/\$/g,"");
				minimumPremium = minimumPremium.replace(/\,/g,"");			

				var minPremiumInt = parseInt(minimumPremium);
				var minPremiumstr = minPremiumInt.toString();
				var isMinimumPremiumNumeric = IsDecimal(minimumPremium);
				
		
				if(minimumPremium == "" || minimumPremium <=0.0 || !isMinimumPremiumNumeric){
					alert("Please enter a value other than $0.");
					formElement.MinimumPremium1.focus();
					return false;
				}
				if(minPremiumstr.length > 7){
					alert("Maximum of 7 digits is allowed");
					formElement.MinimumPremium1.focus();
					return false;				
				}
				formElement.MinimumPremium1.value = minimumPremium;
			}
		}			
		document.getElementById("worksheetSave").disabled='true';
		return true;		
	}
	function showHideMinimumPremium(){	
		if(document.getElementById("isMinimumPremiumAppliesY") != null && document.getElementById("isMinimumPremiumAppliesY") != undefined){ 
			if(document.getElementById("isMinimumPremiumAppliesY").checked){
				document.getElementById("MinimumPremium1Tr").style.display="";
			}else{
				document.getElementById("MinimumPremium1Tr").style.display="none";
			}
		}
	}
	