//give the parameter as the form
function validateFormEIL(frm) {
	  			
	if(document.getElementById("CommissionAdjustmentValue") != null && document.getElementById("CommissionAdjustmentValue") != undefined) {
		var alertMsg = "Only 2 decimal places are allowed for Commission Adjustment %";
		if(!validateNumberOfDecimalPlaces(document.getElementById("CommissionAdjustmentValue").value, 2, alertMsg)) {
			return false;
		}
	}
	
  		// Added as per siby's forwarded mail on 13 sep 2010 (if tria is yes and tria factor is zero then tria factor should be defaulted to 0.03) 			
  		var triaYesSelected=document.getElementsByName('answer(Object::Plan::TRIACoverage)')[0].checked;
  		var field=	document.getElementById("TRIACoverageFactor");	
  		if(triaYesSelected && parseFloat(field.value) == 0 ) {
   			field.value='0.03';   				   				
  		}
  		var nonTriaField=document.getElementById("NonTRIACoverageFactor");	
  		if(triaYesSelected && parseFloat(nonTriaField.value) == 0 ) {
   			field.value='0.03';   				   				
  		}
  		if(document.getElementById("isUWCalculate") != null && document.getElementById("isUWCalculate") != undefined) {
			document.getElementById("isUWCalculate").value = "";
		}	

	//just call other functions.
	if(frm.Object$Quote$QuoteStatus.value=="Offered" || frm.Object$Quote$QuoteStatus.value=="Bind Request"){
		frm.LockStatus.value="Locked";
	}else if(frm.Object$Quote$QuoteStatus.value=="In Progress" || frm.Object$Quote$QuoteStatus.value=="Referred"){
		frm.LockStatus.value="Unlocked";
	}
	var returnValue = false;
	if(validateFactors(frm) && updateCommissionFactorCalculate(frm) && validateBranchCode(frm) && onOutOfFocus('DeductibleFactor')
		&& onOutOfFocus('OccuranceAggregateLimitFactor') && onOutOfFocus('CoverageDOnSiteBIPDFactor') 
  		&& onOutOfFocus('CoverageELoadingAndAutoLoadingFactor') && onOutOfFocus('UWCreditFactor') 
  		&& onOutOfFocus('TRIACoverageFactor')&& onOutOfFocus('AdjustedPremium')) {
		returnValue =  true;
	}
	if(returnValue){
		frm.UnderwriterSaveSubmit.disabled = true;	
	}

	return returnValue;
}

function validateBranchCode(frm) {
	
	var branchCode = "";
	if(frm.branchCode != null && frm.branchCode != undefined) {
		branchCode = frm.branchCode.value;
		if(branchCode == "") {
			alert("Please select the Branch for Policy # rule");
			return false;
		}
	}	
	return true;
}

function validateFactors(frm) {
	
	var deductibleFactor = frm.DeductibleFactor;
	var aggregateLimitFactor = frm.OccuranceAggregateLimitFactor;
	var onsiteBIPDFactor = frm.CoverageDOnSiteBIPDFactor;
	var loadingUnloadingFactor = frm.CoverageELoadingAndAutoLoadingFactor;
	var uwCreditFactor = frm.UWCreditFactor;
	var triaFactor = frm.TRIACoverageFactor;
	var nonTriaFactor = frm.NonTRIACoverageFactor;
	var mep  = frm.mepPercentage
	var assignedUnderwriter  = frm.assignedUnderwriter
	var adjustedPremium =frm.AdjustedPremium;

	if(deductibleFactor!=null && deductibleFactor.value < 0) {
		alert("Deductible Factor cannot go below 0.");
		return false;
	}
	if(aggregateLimitFactor!=null && aggregateLimitFactor.value < 0) {
		alert("Aggregate Limit Factor cannot go below 0.");
		return false;
	}
	if(onsiteBIPDFactor!=null && onsiteBIPDFactor.value < 0) {
		alert("Onsite BIPD Factor cannot go below 0.");
		return false;
	}
	if(loadingUnloadingFactor!=null && loadingUnloadingFactor.value < 0) {
		alert("Loading and Unloading Factor cannot go below 0.");
		return false;
	}
	if(uwCreditFactor!=null && uwCreditFactor.value < 0) {
		alert("UW Credit Debit Factor cannot go below 0.");
		return false;
	}
	if(triaFactor!=null && triaFactor.value < 0) {
		alert("TRIA Factor cannot go below 0.");
		return false;
	}	
	if(nonTriaFactor!=null && nonTriaFactor.value < 0) {
		alert("Non Certified TRIA Factor cannot go below 0.");
		return false;
	}
	if(assignedUnderwriter!=null && assignedUnderwriter.value ==""){
		alert("Please select Associated Underwriter.");
		return false;
	}		
	
	// Alphabets Checking
	if(deductibleFactor != null) {
		if (isNaN(deductibleFactor.value) || isNaN(deductibleFactor.value)) {
			alert("Deductible Factor need to be numerical values.");
			deductibleFactor.focus();
			return false;
		}	
	}
	
	if(aggregateLimitFactor != null) {
		if (isNaN(aggregateLimitFactor.value) || isNaN(aggregateLimitFactor.value)) {
			alert("Aggregate Limit Factor need to be numerical values.");
			aggregateLimitFactor.focus();
			return false;
		}	
	}
	
	if(onsiteBIPDFactor != null) {
		if (isNaN(onsiteBIPDFactor.value) || isNaN(onsiteBIPDFactor.value)) {
			alert("Onsite BIPD Factor need to be numerical values.");
			onsiteBIPDFactor.focus();
			return false;
		}	
	}
	
	if(loadingUnloadingFactor != null) {
		if (isNaN(loadingUnloadingFactor.value) || isNaN(loadingUnloadingFactor.value)) {
			alert("Loading and Unloading Factor need to be numerical values.");
			loadingUnloadingFactor.focus();
			return false;
		}	
	}
	
	if(uwCreditFactor != null) {
		if (isNaN(uwCreditFactor.value) || isNaN(uwCreditFactor.value)) {
			alert("Credit Debit Factor need to be numerical values.");
			uwCreditFactor.focus();
			return false;
		}	
		   if(uwCreditFactor.value < 60 ) {
   				alert("UW Credit Debit Factor cannot be less than 60");
   				uwCreditFactor.focus();
   				return false;
  			}
	}
	
	if(triaFactor != null) {
		if (isNaN(triaFactor.value) || isNaN(triaFactor.value)) {
			alert("TRIA Factor need to be numerical values.");
			triaFactor.focus();
			return false;
		}
			
	}
	if(nonTriaFactor != null) {
		if (isNaN(nonTriaFactor.value) || isNaN(nonTriaFactor.value)) {
			alert("Non Certified TRIA Factor need to be numerical values.");
			nonTriaFactor.focus();
			return false;
		}
			
	}
	if(adjustedPremium != null) {
		if (isNaN(adjustedPremium.value) || isNaN(adjustedPremium.value)) {
			alert("Adjusted Minimum Premium need to be numerical values.");
			adjustedPremium.focus();
			return false;
		}	
	}
	
	if(mep != null && mep != undefined){
		if (isNaN(mep.value)) {
			alert("Minimum Earned Premium % need to be numerical values.");
			mep.focus();
			return false;			
		}else {
			if(mep.value < 0 || mep.value > 100 ) {
				alert("Minimum Earned Premium % should be between 0 and 100");
	   			mep.focus();
	   			return false;
			}
		}
	}
	
	return true;
}

function onOutOfFocus(fieldName) {
	var formElement=document.forms[0];
	var field = document.getElementById(fieldName);
	
	if(fieldName=="AdjustedPremium" && field!=null) {
  		if(field.value=="") {
   			alert("Adjusted Premium cannot be blank.");
   			field.select();
   			return false;
  		}
  		if (field.value.length<1 || !field.value.match(/[^\s]/)){  
   			alert("Adjusted Premium cannot be empty space.");
   			field.select();
   			return false;   
  		}
  		if(field.value!="" && isNaN(field.value)) {
   			alert(" Adjusted Premium should be numeric.");
   			field.focus();
   			return false;
  		}

  		if(field.value!="" && field.value < 0 ) {
  			alert("Adjusted Premium cannot be negative.");
   			field.focus();
   			return false;
  		}
  		if(field.value!="" && field.value == 0 ) {
  			alert("Adjusted Premium cannot be Zero.");
   			field.focus();
   			return false;
  		}
  		
 	}
	
 	if(fieldName=="DeductibleFactor" && field!=null) {
  		if(field.value=="") {
   			alert("Deductible Factor cannot be blank.");
   			field.select();
   			return false;
  		}
  		if (field.value.length<1 || !field.value.match(/[^\s]/)){  
   			alert("Deductible Factor cannot be empty space.");
   			field.select();
   			return false;   
  		}
  		if(field.value!="" && isNaN(field.value)) {
   			alert("Deductible Factor should be numeric.");
   			field.focus();
   			return false;
  		}

  		if(field.value!="" && field.value < 0 ) {
  			alert("Deductible Factor cannot be negative.");
   			field.focus();
   			return false;
  		}
  		if(field.value < 0 || field.value > 1000 ) {
   			alert("Deductible Factor should be between 0 and 1000");
   			field.focus();
   			return false;
  		}
 	}
 	if(fieldName=="OccuranceAggregateLimitFactor" && field!=null) {
  			if(field.value=="") {
			   alert("Aggregate Limit Factor cannot be blank.");
			   field.select();
			   return false;
 			}
  			if (field.value.length<1 || !field.value.match(/[^\s]/)){  
		   		alert("Aggregate Limit Factor cannot be empty space.");
			   	field.select();
			   	return false;   
			}
  			if(field.value!="" && isNaN(field.value)) {
   				alert("Aggregate Limit Factor should be numeric.");
   				field.focus();
			   	return false;
  			}
  			if(field.value!="" && field.value < 0 ) {
   				alert("Aggregate Limit Factor cannot be negative.");
   				field.focus();
   				return false;
  			}
  			if(field.value < 0 || field.value > 1000 ) {
   				alert("Aggregate Limit Factor should be between 0 and 1000");
   				field.focus();
   				return false;
  			}
 		}
 
 		if(fieldName=="CoverageDOnSiteBIPDFactor" && field!=null) {
  			if(field.value=="") {
   				alert("Onsite BIPD Factor cannot be blank.");
   				field.select();
   				return false;
  			}
  			if (field.value.length<1 || !field.value.match(/[^\s]/)){  
	   			alert("Onsite BIPD Factor cannot be empty space.");
   				field.select();
			    return false;   
			}
  			if(field.value!="" && isNaN(field.value)) {
		   		alert("Onsite BIPD Factor should be numeric.");
   				field.focus();
			   	return false;
  			}
  			if(field.value!="" && field.value < 0 ) {
   				alert("Onsite BIPD Factor cannot be negative.");
   				field.focus();
   				return false;
  			}
  			if(field.value < 0 || field.value > 1000 ) {
   				alert("Onsite BIPD Factor should be between 0 and 1000");
   				field.focus();
   				return false;
  			}
 		}
 
 		if(fieldName=="CoverageELoadingAndAutoLoadingFactor" && field!=null) {
  			if(field.value=="") {
			   	alert("Loading and Unloading Factor cannot be blank.");
			   	field.select();
			   	return false;
  			}
  			if (field.value.length<1 || !field.value.match(/[^\s]/)) {  
   				alert("Loading and Unloading Factor cannot be empty space.");
   				field.select();
   				return false;   
  			}
  			if(field.value!="" && isNaN(field.value)) {
   				alert("Loading and Unloading Factor should be numeric.");
   				field.focus();
   				return false;
  			}
  			if(field.value!="" && field.value < 0 ) {
   				alert("Loading and Unloading Factor cannot be negative.");
   				field.focus();
   				return false;
  			}
  			if(field.value < 0 || field.value > 1000 ) {
   				alert("Loading and Unloading Factor should be between 0 and 1000");
   				field.focus();
   				return false;
  			}
 		}
 
 		if(fieldName=="UWCreditFactor" && field!=null) {
 			UWCreditValue = parseFloat('1.25')
  			if(field.value=="") {
			   	alert("UW Credit Debit Factor cannot be blank.");
			   	field.select();
			   	return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)) {			  
			   	alert("UW Credit Debit Factor cannot be empty space.");
			   	field.select();
			   	return false;   
			}
			if(field.value!="" && isNaN(field.value)) {
			   	alert("UW Credit Debit Factor should be numeric.");
			   	field.focus();
			   	return false;
			}
  			if(field.value!="" && field.value < 0 ) {
   				alert("UW Credit Debit Factor cannot be negative.");
   				field.focus();
   				return false;
  			}


 		}
 
 		if(fieldName=="TRIACoverageFactor" && field!=null) {
  			if(field.value=="") {
   				alert("TRIA Factor cannot be blank.");
   				field.select();
   				return false;
  			}
  			if (field.value.length<1 || !field.value.match(/[^\s]/)) {  
   				alert("TRIA Factor cannot be empty space.");
   				field.select();
   				return false;   
  			}
  			if(field.value!="" && isNaN(field.value)) {
   				alert("TRIA Factor should be numeric.");
   				field.focus();
   				return false;
  			}
  			if(field.value!="" && field.value < 0 ) {
   				alert("TRIA Factor cannot be negative.");
   				field.focus();
   				return false;
  			}
  			if(field.value < 0 || field.value > 1000 ) {
   				alert("TRIA Factor should be between 0 and 1000");
   				field.focus();
   				return false;
  			}
  		}

		if(fieldName=="NonTRIACoverageFactor" && field!=null) {
  			if(field.value=="") {
   				alert("Non Certified TRIA Factor cannot be blank.");
   				field.select();
   				return false;
  			}
  			if (field.value.length<1 || !field.value.match(/[^\s]/)) {  
   				alert("Non Certified TRIA Factor cannot be empty space.");
   				field.select();
   				return false;   
  			}
  			if(field.value!="" && isNaN(field.value)) {
   				alert("Non Certified TRIA Factor should be numeric.");
   				field.focus();
   				return false;
  			}
  			if(field.value!="" && field.value < 0 ) {
   				alert("Non Certified TRIA Factor cannot be negative.");
   				field.focus();
   				return false;
  			}
  			if(field.value < 0 || field.value > 1000 ) {
   				alert("Non Certified TRIA Factor should be between 0 and 1000");
   				field.focus();
   				return false;
  			}
  		}	
	return true;
}


function updateCommissionFactorCalculate(frm){
	var commissionAdjustmentSign = frm.CommissionAdjustmentSign.value;
	var commissionAdjustmentValue = frm.CommissionAdjustmentValue.value;
	var commissionAdjustment = commissionAdjustmentSign + commissionAdjustmentValue;	
	var oldCommissionPercentage = frm.oldCommissionPercentage.value;
	var notAnumber = isNaN(commissionAdjustmentValue);
	if(!notAnumber && validateCommissionRange(commissionAdjustment, oldCommissionPercentage)){
		var commissionfactor = (1 + ((commissionAdjustment)/100));
		var rateImpactedyes = false;
		
			frm.commissionFactor.value = commissionfactor;	
		
		return true;
	}else{
		if(notAnumber)
		alert("Please enter numeric values only");
		frm.CommissionAdjustmentValue.focus();
        frm.CommissionAdjustmentValue.select();
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
