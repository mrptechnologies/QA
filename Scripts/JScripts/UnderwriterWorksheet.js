//give the parameter as the form
function validateForm(frm)
{
	//just call other functions
	var returnValue = false;
	if(checkUWFactors(frm)&& validateCompositeRates(frm) && updateCommissionFactorCalculate(frm) && onOutOfFocus('DefaultPolicyFee') && onOutOfFocus('FilingFee') && onOutOfFocus('InspectionFee') && onOutOfFocus('LossSurcharge_Factor') && onOutOfFocus('MiscSurcharge_Factor') && onOutOfFocus('Deductible_CreditOverride_Factor') 
	&& onOutOfFocus('MedicalUWFactor') && onOutOfFocus('PharmacyUWFactorDefault') && onOutOfFocus('DiscretionaryAdjDefaultFactor') && onOutOfFocus('PharmacyDiscretionaryAdjDefaultFactor')&& onOutOfFocus('TargetLossRatioPharmacy')&& onOutOfFocus('TargetLossRatioMedical')
	&& onOutOfFocus('AdditionalCostsPharmacyFactor')&& onOutOfFocus('AdditionalCostsMedicalFactor') && onOutOfFocus('YearLoad') && onOutOfFocus('Discount') 
	&& onOutOfFocus('DefaultBasisFactor2M') && onOutOfFocus('DefaultBasisFactor3M') && onOutOfFocus('DefaultBasisFactor4M') && onOutOfFocus('DefaultBasisFactor5M')
	&& onOutOfFocus('RateModificationFactor') && onOutOfFocus('TerrorismFactor') && onOutOfFocus('JudgementFactor')){
		returnValue =  true;
	}
	if(returnValue){
		frm.UnderwriterSaveSubmit.disabled = true;	
	}

	return returnValue;
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


function updateCommissionFactorCalculate(frm){
	var commissionAdjustmentSign = frm.CommissionAdjustmentSign.value;
	var commissionAdjustmentValue = frm.CommissionAdjustmentValue.value;
	var commissionAdjustment = commissionAdjustmentSign + commissionAdjustmentValue;	
	var oldCommissionPercentage = frm.oldCommissionPercentage.value;
	var notAnumber = isNaN(commissionAdjustmentValue);
	if(!notAnumber && validateCommissionRange(commissionAdjustment, oldCommissionPercentage)){
		var commissionfactor = (1 + ((commissionAdjustment)/100));
		var rateImpactedyes = frm.RateImpactedyes.checked;
		if(rateImpactedyes){
			frm.commissionFactor.value = commissionfactor;	
		}else{
			frm.commissionFactor.value = 1.0;
		}
		return true;
	}else{
		if(notAnumber)
		alert("Please enter numeric values only");
		frm.CommissionAdjustmentValue.focus();
        frm.CommissionAdjustmentValue.select();
		return false;
	}
}


function updateCommissionFactorSave(frm){
	var newCommissionPercentage = frm.CommissionPercentageSelect.value;
	var oldCommissionPercentage = frm.oldCommissionPercentage.value;
	//old code
	//var commissionfactor = ((1 + (newCommissionPercentage/100))/(1 + (oldCommissionPercentage/100)));	
	var commissionfactor = (1 + ((newCommissionPercentage-oldCommissionPercentage)/100));
	var rateImpactedyes = frm.RateImpactedyes.checked;
	if(rateImpactedyes){
		frm.commissionFactor.value = commissionfactor;	
	}else{
		frm.commissionFactor.value = 1.0;
	}
	return true;
}

function diplayCMP(frm){
	var formElement;
	var form1=document.forms[0];
	var form2=document.forms[1];
	if(form1.CommissionAdjustmentSign!=null && form1.CommissionAdjustmentSign!= undefined){
		
		formElement = form1;
	}else {
	
		formElement = form2;
	}
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

function checkUWFactors(frm)
{
	var noOfEmps = frm.noOfEmps.value;
	//Medical
	if(frm.MedicalUWFactor!=null) {
		var MedicalUWFactor = frm.MedicalUWFactor.value;
		var medicalPrefferedRate = frm.medicalPrefferedRate.value*1000;
		var medicalMaxRate = frm.medicalMaxRate.value*1000;
		var parentDmsPropQuoteType=frm.QuoteType.value;
		var PlanName=frm.ProductId.value;
		if (isNaN(MedicalUWFactor))
		{
			alert("Underwriting factor should be numeric values.");
			frm.MedicalUWFactor.select();
			return false;
		}
		if ((MedicalUWFactor/1) < 0)
		{
			alert("Underwriting factor should be positive numeric values.");
			frm.MedicalUWFactor.select();
			return false;
		}
		if(parentDmsPropQuoteType=="NEW_BUSINESS")
		{
			MedicalUWFactor = MedicalUWFactor*1000;	
		}
	}	
	return true;
}
function checkQuoteStatus(frm)
{
	return true;
}

function validateCompositeRates(frm)
{

	var PREC = 4;
	var CompositeEmpSpouseFactor = frm.CompositeEmpSpouseFactor;
	var CompositeEmpChildFactor = frm.CompositeEmpChildFactor;
	var CompositeEmployeeFactor = frm.CompositeEmployeeFactor;
	var CompositeFamilyFactor = frm.CompositeFamilyFactor;
	
	if(checkUWFactors(frm)==false) {
		return false;
	}

	if(CompositeEmpSpouseFactor!=null && CompositeEmpSpouseFactor.value <= 0)
	{
		alert("The composite Employee and Spouse Factor cannot go below 0.");
		return false;
	}
	if(CompositeEmpChildFactor!=null && CompositeEmpChildFactor.value <= 0)
	{
		alert("The composite Employee and Child Factor cannot go below 0.");
		return false;
	}
	if(CompositeEmployeeFactor!=null && CompositeEmployeeFactor.value <= 0)
	{
		alert("The composite Employee Factor cannot go below 0.");
		return false;
	}
	if(CompositeFamilyFactor!=null && CompositeFamilyFactor.value <= 0)
	{
		alert("The composite Family Factor cannot go below 0.");
		return false;
	}
		


	if ((CompositeEmpSpouseFactor != null) && (CompositeEmpChildFactor != null))
	{
		var fltCCompositeEmpSpouseFactor = parseFloat((CompositeEmpSpouseFactor.value),10);
		var fltCompositeEmpChildFactor = parseFloat((CompositeEmpChildFactor.value),10);
		var fltCompositeEmployeeFactor = parseFloat((CompositeEmployeeFactor.value),10);

		if (isNaN(CompositeEmpSpouseFactor.value) || isNaN(CompositeEmpChildFactor.value))
		{
			alert("Composite factors need to be numerical values.");
			CompositeEmpSpouseFactor.focus();
			return false;
		}

		var addVar = fltCCompositeEmpSpouseFactor + fltCompositeEmpChildFactor;
		addVar = addVar.toPrecision(PREC);

		var fltCompositeFamilyFactor = addVar - fltCompositeEmployeeFactor;
		fltCompositeFamilyFactor = fltCompositeFamilyFactor.toPrecision(PREC);

		CompositeFamilyFactor.value = fltCompositeFamilyFactor;
		if(fltCompositeFamilyFactor<0)
		{
			alert("The Family Factor can not go below 0.");
			return false;
		}

		if (isNaN(fltCompositeFamilyFactor))
		{
			var ans = true;
			ans = window.confirm('Oops! An error was encountered while calculating Composite Factors.\n\nDo you want to continue anyway?');
			return ans;
		}
		return true;
	}
	return true;
}

function validateNumRangeValue(field, minAge, maxAge, what, checkInt, exclude1){
	if(field != null){
		var thisfield = field.value;
		if(exclude1!=null && checkInt!="" && thisfield!="") {
			if(thisfield.indexOf(exclude1)!=-1){ //if exclude charecter exists
				thisfield = field.value.split(exclude1);
				if(thisfield.length<3){ // remove exclude charecter just once
					thisfield=thisfield[0]+thisfield[1];
				} else {
					thisfield = field.value; //assign back the field value and leave for further validation
				}
			}
		}
		if(checkInt!=null && checkInt==true && !isInteger(thisfield)) {
			alert(what+" should be integer.");
			field.value="";
			field.select();
			return false;
		}
		if(field.value!="" && isNaN(thisfield)){
			alert(what+" should be numeric.");
			field.value="";
			field.select();
			return false;
		}
		
		if(thisfield!="" && !isNaN(thisfield) && thisfield<minAge || thisfield>maxAge){
			alert(what+" should be between "+minAge+" and "+maxAge+".");
			field.value="";
			field.select();
			return false;		
		}
	}
	return true;
}

function validateNullField(field, what){	
	if(field !=null ){
		if(field.value==""){
			alert(what+" is mandatory field");
			field.value="";
			field.select();
			return false;		
		}
	}
	return true;
}

function onOutOfFocus(fieldName){
	var formElement=document.forms[0];
	var field = document.getElementById(fieldName);

		if(fieldName=="MedicalUWFactor" && (formElement.MedicalUWFactor !=null)) {
			copyToField(formElement.DrugUWFactor, formElement.MedicalUWFactor);			
			copyToField(formElement.LifeUWFactor, formElement.MedicalUWFactor);
			copyToField(formElement.WdiUWFactor, formElement.MedicalUWFactor);
			copyToField(formElement.DentalUWFactor, formElement.MedicalUWFactor);
		}
		
		if(fieldName=="AdjForNonStandardBenefitMedical") {
			copyToField(formElement.AdjForNonStandardBenefitDrug, formElement.AdjForNonStandardBenefitMedical);
			copyToField(formElement.AdjForNonStandardBenefitLife, formElement.AdjForNonStandardBenefitMedical);
			copyToField(formElement.AdjForNonStandardBenefitWdi, formElement.AdjForNonStandardBenefitMedical);
			copyToField(formElement.AdjForNonStandardBenefitDentel, formElement.AdjForNonStandardBenefitMedical);
		}

		if(fieldName=="MedicalExpAdjFactor") {
			copyToField(formElement.DrugExpAdjFactor, formElement.MedicalExpAdjFactor);
			copyToField(formElement.LifeExpAdjFactor, formElement.MedicalExpAdjFactor);
			copyToField(formElement.WdiExpAdjFactor, formElement.MedicalExpAdjFactor);
			copyToField(formElement.DentalExpAdjFactor, formElement.MedicalExpAdjFactor);
		}
		
		if(fieldName=="MedicalUWFactor" && field!=null) {
			if(field.value=="") {
				alert("Medical UnderWriter Adjustment Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Medical UnderWriter Adjustment Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Medical UnderWriter Adjustment Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Medical UnderWriter Adjustment Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0.25 || field.value > 1.75 ) {
				alert("Medical UnderWriter Adjustment Factor should be between 0.25 and 1.75");
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="PharmacyUWFactorDefault" && field!=null) {
			if(field.value=="") {
				alert("Pharmacy UnderWriter Adjustment Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Pharmacy UnderWriter Adjustment Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Pharmacy UnderWriter Adjustment Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Pharmacy UnderWriter Adjustment Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0.25 || field.value > 1.75 ) {
				alert("Pharmacy UnderWriter Adjustment Factor should be between 0.25 and 1.75");
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="DiscretionaryAdjDefaultFactor" && field!=null) {
			if(field.value=="") {
				alert("Discretionary Adjustment Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Discretionary Adjustment Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Discretionary Adjustment Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Discretionary Adjustment Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0.0001 || field.value > 2.0 ) {
				alert("Discretionary Adjustment Factor should be between 0.0001 and 2.0");
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="PharmacyDiscretionaryAdjDefaultFactor" && field!=null) {
			if(field.value=="") {
				alert("Discretionary Adjustment Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Discretionary Adjustment Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Discretionary Adjustment Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Discretionary Adjustment Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0.0001 || field.value > 2.0 ) {
				alert("Discretionary Adjustment Factor should be between 0.0001 and 2.0");
				field.focus();
				return false;
			}
		}

		if(fieldName=="TargetLossRatioMedical" && field!=null) {
			if(field.value=="") {
				alert("Medical Target Loss Ratio Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Medical Target Loss Ratio Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Medical Target Loss Ratio Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Medical Target Loss Ratio Factor cannot be negative.");
				field.focus();
				return false;
			}
		}
		if(fieldName=="TargetLossRatioPharmacy" && field!=null) {
			if(field.value=="") {
				alert("Pharmacy Target Loss Ratio Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Pharmacy Target Loss Ratio Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Pharmacy Target Loss Ratio Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Pharmacy Target Loss Ratio Factor cannot be negative.");
				field.focus();
				return false;
			}
		}
		if(fieldName=="AdditionalCostsMedicalFactor" && field!=null) {
			if(field.value=="") {
				alert("Medical Additional PMPM Costs cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Medical Additional PMPM Costs cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Medical Additional PMPM Costs should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Medical Additional PMPM Costs cannot be negative.");
				field.focus();
				return false;
			}
		}
		if(fieldName=="AdditionalCostsPharmacyFactor" && field!=null) {
			if(field.value=="") {
				alert("Pharmacy Additional PMPM Costs cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Pharmacy Additional PMPM Costs cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Pharmacy Additional PMPM Costs should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Pharmacy Additional PMPM Costs cannot be negative.");
				field.focus();
				return false;
			}
		}		
		
		if(fieldName=="LossSurcharge_Factor" && field!=null) {
			if(field.value=="") {
				alert("Loss Surcharge cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Loss Surcharge cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Loss Surcharge should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Loss Surcharge cannot be negative.");
				field.focus();
				return false;
			}
			
			if(field.value<0 || field.value >100 ) {
				alert("Loss Surcharge should be between '0' and '100'");				
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="MiscSurcharge_Factor" && field!=null) {
			if(field.value=="") {
				alert("Miscellaneous Surcharge cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Miscellaneous Surcharge cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Miscellaneous Surcharge should be numeric.");
				field.focus();
				return false;
			}

			if(field.value< -100 || field.value >100 ) {
				alert("Miscellaneous Surcharge should be between '-100' and '100'");
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="Deductible_CreditOverride_Factor" && field!=null) {
			if(field.value=="") {
				alert("Deductible Credit cannot be blank.");
				field.select();
				return false;
			}
			if (!field.value.match(/[^\s]/)){
			
				alert("Deductible Credit cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Deductible Credit should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 && document.getElementById("riskState").value!="FL" ) {			
				alert("Deductible Credit cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value!="" && (field.value > 100 || field.value < -100)) {
			    alert("Deductible Credit percent cannot be greater the 100 or less than -100");
			    field.focus();
			    return false;
		   }
		}
		
		if(fieldName=="DefaultPolicyFee" && field!=null) {
			if(field.value=="") {
				alert("Default Policy Fee cannot be blank.");
				field.select();
				return false;
			}
			if (!field.value.match(/[^\s]/)){
			
				alert("Default Policy Fee cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Default Policy Fee should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Default Policy Fee cannot be negative.");
				field.focus();
				return false;
			}
		}
		if(fieldName=="FilingFee" && field!=null) {
			if(field.value=="") {
				alert("Filing Fee cannot be blank.");
				field.select();
				return false;
			}
			if (!field.value.match(/[^\s]/)){
			
				alert("Filing Fee cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Filing Fee should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Filing Fee cannot be negative.");
				field.focus();
				return false;
			}
		}
		if(fieldName=="InspectionFee" && field!=null) {
			if(field.value=="") {
				alert("Inspection Fee cannot be blank.");
				field.select();
				return false;
			}
			if (!field.value.match(/[^\s]/)){
			
				alert("Inspection Fee cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Inspection Fee should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Inspection Fee cannot be negative.");
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="YearLoad" && field!=null) {
			if(field.value=="") {
				alert("Year Load Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Year Load Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Year Load Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Year Load Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value != 1 && field.value != 2 ) {
				alert("Year Load Factor should be 1 or 2");
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="Discount" && field!=null) {
			if(field.value=="") {
				alert("Discount Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Discount Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Discount Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Discount Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0 || field.value > 0.2 ) {
				alert("Discount Factor should be between 0 to 0.2");
				field.focus();
				return false;
			}
		}
		if(fieldName=="DefaultBasisFactor2M" && field!=null) {
			if(field.value=="") {
				alert("DefaultBasisFactor 2M Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("DefaultBasisFactor 2M Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("DefaultBasisFactor 2M Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("DefaultBasisFactor 2M Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0.30 || field.value > 0.40 ) {
				alert("DefaultBasisFactor 2M Factor should be between 0.30 to 0.40");
				field.focus();
				return false;
			}
		}
		if(fieldName=="DefaultBasisFactor3M" && field!=null) {
			if(field.value=="") {
				alert("DefaultBasisFactor 3M Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("DefaultBasisFactor 3M Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("DefaultBasisFactor 3M Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("DefaultBasisFactor 3M Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0.15 || field.value > 0.25 ) {
				alert("DefaultBasisFactor 3M Factor should be between 0.15 to 0.25");
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="DefaultBasisFactor4M" && field!=null) {
			if(field.value=="") {
				alert("DefaultBasisFactor 4M Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("DefaultBasisFactor 4M Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("DefaultBasisFactor 4M Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("DefaultBasisFactor 4M Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0.10 || field.value > 0.15 ) {
				alert("DefaultBasisFactor 4M Factor should be between 0.10 to 0.15");
				field.focus();
				return false;
			}
		}
		
		
		if(fieldName=="DefaultBasisFactor5M" && field!=null) {
			if(field.value=="") {
				alert("DefaultBasisFactor 5M Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("DefaultBasisFactor 5M Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("DefaultBasisFactor 5M Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("DefaultBasisFactor 5M Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 0.05 || field.value > 0.10 ) {
				alert("DefaultBasisFactor 5M Factor should be between 0.05 to 0.10");
				field.focus();
				return false;
			}
		}
		
		if(fieldName=="RateModificationFactor" && field!=null) {
			if(field.value=="") {
				alert("RateModification Factor cannot be blank.");
				field.select();
				return false;
			}

			if (field.value<1 || field.value>5 ){
				alert("RateModification Factor must be from 1 to 10.");
				field.select();
				return false;			
			}

			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("RateModification Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("RateModification Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("RateModification Factor cannot be negative.");
				field.focus();
				return false;
			}
			
		}
		
		if(fieldName=="TerrorismFactor" && field!=null) {
			if(field.value=="") {
				alert("Terrorism Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Terrorism Factor cannot be empty space.");
				field.select();
				return false;			
			}
			
			if (field.value < 0 || field.value > 10){
				alert("Terrorism Factor must be from 0 to 5.");
				field.select();
				return false;			
			}
			
			if(field.value!="" && isNaN(field.value)) {
				alert("Terrorism Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Terrorism Factor cannot be negative.");
				field.focus();
				return false;
			}
			
		}
		
		if(fieldName=="JudgementFactor" && field!=null) {
			if(field.value=="") {
				alert("Judgement Factor cannot be blank.");
				field.select();
				return false;
			}
			if (field.value.length<1 || !field.value.match(/[^\s]/)){
			
				alert("Judgement Factor cannot be empty space.");
				field.select();
				return false;			
			}
			if(field.value!="" && isNaN(field.value)) {
				alert("Judgement Factor should be numeric.");
				field.focus();
				return false;
			}

			if(field.value!="" && field.value < 0 ) {
				alert("Judgement Factor cannot be negative.");
				field.focus();
				return false;
			}
			if(field.value < 1 || field.value > 2 ) {
				alert("Judgement Factor should be between 1.00 to 2.00");
				field.focus();
				return false;
			}
		}
	return true;
}

function copyToField(destField, srcField){
	if((srcField !=null ) && (destField !=null )){
		destField.value = srcField.value;
	}
}

function setLockStatus(frm){
	var formElement=document.forms[0];
	if(formElement.Object$Quote$QuoteStatus.value=="Offered" || formElement.Object$Quote$QuoteStatus.value=="Accepted" || formElement.Object$Quote$QuoteStatus.value=="Bind Request"){
		formElement.LockStatus.value="Locked";
		return true;
	}
}

function setLockStatusNew(frm){	
	
	if(frm.Object$Quote$QuoteStatus.value=="Offered" || frm.Object$Quote$QuoteStatus.value=="Bind Request" || frm.Object$Quote$QuoteStatus.value=="Declined"){
		frm.LockStatus.value="Locked";
		return true;
	}else if(frm.Object$Quote$QuoteStatus.value=="In Progress"){
		frm.LockStatus.value="Unlocked";
		return true;
	}	
}