function validate(){
	var formElement=document.forms[0];
	
	var InsuredName = formElement.InsuredName.value
	if(InsuredName=="") {		
		alert("Please Enter the InsuredName");	
		return false;
	}
	
	
	if(formElement.Agenname != null) {
		var Agenname = formElement.Agenname.value;
		if(Agenname=="") {
		
			alert("Please Select the AgencyName");	
			return false;
		}
	}
	
	var Zip = formElement.Zip.value
	if(Zip=="") {
	
		alert("Please Select the Zip Code");	
		return false;
	}
	
	var State = formElement.State.value
	
	if(State=="") {
	
		alert("Please Select the State");	
		return false;
	}
	
	var City = formElement.City.value
	if(City=="") {
	
		alert("Please Select the City");	
		return false;
	}
	
	var County = formElement.County.value
	if(County=="") {
	
		alert("Please Select the County");	
		return false;
	}
	
	var yearbuilt = formElement.YearBuilt.value
	if(yearbuilt=="") {
	
		alert("Please Enter the Year Built");	
		return false;
	} 
	
	if(!validateyear(yearbuilt)) {
		alert("Please Enter Valid Year");
		return false;
	}
	
	var FireHydrant = formElement.FireHydrant.value
	if(FireHydrant!="") {
		if(!isDecimal(FireHydrant)) {
			alert("Please Enter Valid FireHydrant Distance");
			return false;	
		} 
	} 
	
	var	ownerid = formElement.ownerIdfrmjsp.value
	
	if (ownerid == 5) {	
	var costalWaterDistance1 = formElement.CostalWaterDistanceTemp1.value
	var costalWaterDistance2 = formElement.CostalWaterDistanceTemp2.value
	var costalWaterDistance3 = formElement.CostalWaterDistanceTemp3.value
	var costalWaterDistance4 = formElement.CostalWaterDistanceTemp4.value
	var costalWaterDistance5 = formElement.CostalWaterDistanceTemp5.value
	var costalWaterDistance6 = formElement.CostalWaterDistanceTemp6.value
	var costalWaterDistance7 = formElement.CostalWaterDistanceTemp7.value
	
	if(costalWaterDistance1=="" && costalWaterDistance2=="" && costalWaterDistance3=="" && costalWaterDistance4=="" && costalWaterDistance5=="" && costalWaterDistance6=="" && costalWaterDistance7=="") {
	
		alert("Please Enter the CoastalWaterDistance");	
		return false;
	} 
	
	if(costalWaterDistance1!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance1;
		
	}
	
	if(costalWaterDistance2!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance2;
	}
	
	if(costalWaterDistance3!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance3;
	}
	
	if(costalWaterDistance4!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance4;
	}
	
	if(costalWaterDistance5!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance5;
	}
	
	if(costalWaterDistance6!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance6;
	}
	
	if(costalWaterDistance7!="") {
		formElement.CostalWaterDistance.value=costalWaterDistance7;
	}
	
	} else if (ownerid == 9) {
		
		var costalWaterDistance7 = formElement.CostalWaterDistanceTemp7.value
		if(costalWaterDistance7=="") {
	
			alert("Please Enter the CoastalWaterDistance");	
			return false;
		} 
		if(costalWaterDistance7!="") {
			formElement.CostalWaterDistance.value=costalWaterDistance7;
		}
	}
	
	var Construction1 = formElement.constructionType1.value
	var Construction2 = formElement.constructionType2.value
	var Construction3 = formElement.constructionType3.value
	if(Construction1!="") {
		formElement.ConstructionType.value=Construction1;
	}
	if(Construction2!="") {
		formElement.ConstructionType.value=Construction2;
	}
	if(Construction3!="") {
		formElement.ConstructionType.value=Construction3;
	}
	
	var isValidYear = formElement.isValidZip.value;
	if(isValidYear=="NO") {
	
		alert("Please Enter Valid ZipCode");	
		return false;
	}
	
	var RatingTerritory = formElement.RatingTerritory.value;
	var RatingTerritoryName = formElement.RatingTerritoryName.value;
	var Zone = formElement.Zone.value;
	if(RatingTerritory=="") {
	
		alert("Please Select the Rating Territory");	
		return false;
	}
	if(formElement.wiringUpdatedYes.checked) {
		var WiringUpdated = formElement.WiringUpdated.value;
		if(WiringUpdated=="") {
		
			alert("Please Enter Year for Wiring Updated");	
			return false;
		}
		if(!validateyear(WiringUpdated) || WiringUpdated<yearbuilt) {
			alert("Please Enter Valid Year for Wiring Updated");
			return false;
		}
		
		
		var heatingUpdated = formElement.heatingUpdated.value;
		if(heatingUpdated=="") {
		
			alert("Please Enter Year for Heating Updated");	
			return false;
		}
		if(!validateyear(heatingUpdated) || heatingUpdated<yearbuilt) {
			alert("Please Enter Valid Year for Heating Updated");
			return false;
		}
		
		var plumbingUpdated = formElement.plumbingUpdated.value;
		if(plumbingUpdated=="") {
		
			alert("Please Enter Year for Plumbing Updated");	
			return false;
		}
		if(!validateyear(plumbingUpdated) || plumbingUpdated<yearbuilt) {
			alert("Please Enter Valid Year for Plumbing Updated");
			return false;
		}
		
	
	}
	
	if(formElement.roofUpdatedYes.checked) {
		
		var roofUpdated = formElement.roofUpdated.value;
		if(roofUpdated=="") {
		
			alert("Please Enter Year for Roof Updated");	
			return false;
		}
		if(!validateyear(roofUpdated) || roofUpdated<yearbuilt) {
			alert("Please Enter Valid Year for Roof Updated");
			return false;
		}
	}
	
	formElement.riskAdd1.value=formElement.streetNumber.value+' '+formElement.streetName.value
	return checkClaimInfo(formElement);
}

function validateyear(year) {

	var dat = new Date();
	
	var currentyear = dat.getFullYear();
	
	var yearBuilt=year;
	
	var isValid= isInteger(yearBuilt);
	
	if(!isValid) {
	
		
		return false;
	} else {
	
		if(yearBuilt>currentyear || yearBuilt==0) {
		
			
			return false;
		} else {
		
			if(yearBuilt.length<4) {
			
				
				return false;
			} 
		
		}
	
	}
	return true;
}

function getTerritory(form){
	checkRules(form, document);
	territoryLookup(form, document);
}


function dynamicConstructionType(formElement,document) {
	
	var state =formElement.State.value
	var occupancy = formElement.Occupancy.value; 
	
	
	if(occupancy == 'Vacant') {	
	
		document.getElementById("ConstructionType1").style.display='none';
		document.getElementById("ConstructionType2").style.display='none';
		document.getElementById("ConstructionType3").style.display='inline';
		formElement.constructionType1.value="";
		formElement.constructionType2.value="";
		formElement.constructionType3.value="Frame";
	}else if (state=='FL') {
	
		document.getElementById("ConstructionType1").style.display='none';
		document.getElementById("ConstructionType2").style.display='inline';
		document.getElementById("ConstructionType3").style.display='none';
		formElement.constructionType1.value="";
		formElement.constructionType2.value="Frame";
		formElement.constructionType3.value="";
	} 
	else {
	
		document.getElementById("ConstructionType1").style.display='inline';
		document.getElementById("ConstructionType2").style.display='none';
		document.getElementById("ConstructionType3").style.display='none';
		formElement.constructionType1.value="Frame";
		formElement.constructionType2.value="";
		formElement.constructionType3.value="";
	}
}

function getConstructionTypeByOccupancy(formElement) {
    var state =formElement.State.value
	var occupancy = formElement.Occupancy.value; 	
	if(occupancy == 'Vacant') {	

		document.getElementById("ConstructionType1").style.display='none';
		document.getElementById("ConstructionType2").style.display='none';
		document.getElementById("ConstructionType3").style.display='inline';
		formElement.constructionType1.value="";
		formElement.constructionType2.value="";
		formElement.constructionType3.value="Frame";
	}else if (state=='FL') {
	
		document.getElementById("ConstructionType1").style.display='none';
		document.getElementById("ConstructionType2").style.display='inline';
		document.getElementById("ConstructionType3").style.display='none';
		formElement.constructionType1.value="";
		formElement.constructionType2.value="Frame";
		formElement.constructionType3.value="";
	} 
	else {
	
		document.getElementById("ConstructionType1").style.display='inline';
		document.getElementById("ConstructionType2").style.display='none';
		document.getElementById("ConstructionType3").style.display='none';
		formElement.constructionType1.value="Frame";
		formElement.constructionType2.value="";
		formElement.constructionType3.value="";
	}
}


function dynamicCostalwaterDistance(formElement,document) {
	
	var state =formElement.State.value
	var territory = formElement.RatingTerritory.value
	var zone = formElement.Zone.value
	var	ownerid = formElement.ownerIdfrmjsp.value
	
	if(ownerid == 5){	
	if((state=='NC' && territory=='4') || (state=='SC' && territory=='2')) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		document.getElementById("CostalWaterTemp7").style.display='inline';
		formElement.CostalWaterDistanceTemp1.value="";
		formElement.CostalWaterDistanceTemp2.value="";
		formElement.CostalWaterDistanceTemp3.value="";	
		formElement.CostalWaterDistanceTemp4.value="";
		formElement.CostalWaterDistanceTemp5.value="";
		formElement.CostalWaterDistanceTemp6.value="";
		formElement.CostalWaterDistanceTemp7.value="25000";
	}else if((state=='TX' && territory=='2')){
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='inline';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		document.getElementById("CostalWaterTemp7").style.display='none';
		formElement.CostalWaterDistanceTemp1.value="";
		formElement.CostalWaterDistanceTemp2.value="25000";
		formElement.CostalWaterDistanceTemp3.value="";	
		formElement.CostalWaterDistanceTemp4.value="";
		formElement.CostalWaterDistanceTemp5.value="";
		formElement.CostalWaterDistanceTemp6.value="";
		formElement.CostalWaterDistanceTemp7.value="";
	
	}
	else if((state=='TX' && territory=='1')) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='inline';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		document.getElementById("CostalWaterTemp7").style.display='none';
		formElement.CostalWaterDistanceTemp7.value="";
		formElement.CostalWaterDistanceTemp1.value="";	
		formElement.CostalWaterDistanceTemp2.value="";	
		formElement.CostalWaterDistanceTemp3.value="21000";	
		formElement.CostalWaterDistanceTemp4.value="";
		formElement.CostalWaterDistanceTemp5.value="";
		formElement.CostalWaterDistanceTemp6.value="";
	} else if((state=='FL' && zone=='1')) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='inline';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		document.getElementById("CostalWaterTemp7").style.display='none';
		formElement.CostalWaterDistanceTemp1.value="";	
		formElement.CostalWaterDistanceTemp2.value="";	
		formElement.CostalWaterDistanceTemp3.value="";	
		formElement.CostalWaterDistanceTemp4.value="5000";
		formElement.CostalWaterDistanceTemp5.value="";	
		formElement.CostalWaterDistanceTemp6.value="";
		formElement.CostalWaterDistanceTemp7.value="";
	} else if((state=='FL' && zone=='2')) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='inline';
		document.getElementById("CostalWaterTemp6").style.display='none';
		document.getElementById("CostalWaterTemp7").style.display='none';
		formElement.CostalWaterDistanceTemp1.value="";	
		formElement.CostalWaterDistanceTemp2.value="";	
		formElement.CostalWaterDistanceTemp3.value="";	
		formElement.CostalWaterDistanceTemp4.value="";
		formElement.CostalWaterDistanceTemp5.value="5000";	
		formElement.CostalWaterDistanceTemp6.value="";
		formElement.CostalWaterDistanceTemp7.value="";
	} else if((state=='FL' && (zone=='3' || zone=='4' || zone=='5'))) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='inline';
		document.getElementById("CostalWaterTemp7").style.display='none';
		formElement.CostalWaterDistanceTemp1.value="";	
		formElement.CostalWaterDistanceTemp2.value="";	
		formElement.CostalWaterDistanceTemp3.value="";	
		formElement.CostalWaterDistanceTemp4.value="";
		formElement.CostalWaterDistanceTemp5.value="";	
		formElement.CostalWaterDistanceTemp6.value="5000";
		formElement.CostalWaterDistanceTemp7.value="";
	} else {
		
		document.getElementById("CostalWaterTemp1").style.display='inline';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		document.getElementById("CostalWaterTemp7").style.display='none';
		formElement.CostalWaterDistanceTemp1.value="30000";
		formElement.CostalWaterDistanceTemp2.value="";
		formElement.CostalWaterDistanceTemp3.value="";
		formElement.CostalWaterDistanceTemp4.value="";
		formElement.CostalWaterDistanceTemp5.value="";
		formElement.CostalWaterDistanceTemp6.value="";
		formElement.CostalWaterDistanceTemp7.value="";
	
	}
	} else if(ownerid == 9){
		document.getElementById("CostalWaterTemp7").style.display='inline';
		formElement.CostalWaterDistanceTemp7.value="6000";
	}
}

function displayQuestionForWiringUpdated() {
	
	var formElement = document.forms[0];
	var yearBuild=formElement.YearBuilt.value;
	
	//Wiring, Heating,Plumbing- Question is displayed while YearBuild is <1950
	if(yearBuild<1950 && yearBuild.length==4) {
		
		document.getElementById("questionForWiringUpdated").style.display="inline";
		if(!formElement.wiringUpdatedYes.checked) {
			formElement.wiringUpdatedNo.checked="true";
		}
		if(!formElement.roofUpdatedYes.checked) {
			formElement.roofUpdatedNo.checked="true";
		}
		//wiringDisable(formElement,document);
		
	} else {
		document.getElementById("questionForWiringUpdated").style.display="none";
		formElement.wiringUpdatedNo.checked="true";
		formElement.WiringUpdated.value="";
		formElement.heatingUpdated.value="";
		formElement.plumbingUpdated.value="";
		formElement.roofUpdatedNo.checked="true";
		formElement.roofUpdated.value="";	
	}	
}

function GoTOFindButton(){
	
    var formElement=document.forms[0];
    formElement.claimHtml.value=document.getElementById("losshistory").innerHTML
    formElement.agencyLookup.value="YES";
	formElement.action="../AgencySearchPageForQuickQuote.do?formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1";
    formElement.submit();
	return true;
}

function roofDisable(formElement,document) {
	
	formElement.roofUpdated.readOnly=true;
	formElement.roofUpdated.value='';
}

function roofEnable(formElement,document) { 
	
	formElement.roofUpdated.readOnly=false;
}

function wiringDisable(formElement,document) {
	
	formElement.WiringUpdated.readOnly=true;
	formElement.heatingUpdated.readOnly=true;
	formElement.plumbingUpdated.readOnly=true;
	formElement.WiringUpdated.value='';
	formElement.heatingUpdated.value='';
	formElement.plumbingUpdated.value='';
}

function wiringEnable(formElement,document) {
	
	formElement.WiringUpdated.readOnly=false;
	formElement.heatingUpdated.readOnly=false;
	formElement.plumbingUpdated.readOnly=false;
}

function setDefault() {
		
	var formElements = document.forms[0];
	var agencylookup = formElements.agencyLookup.value;
	var	ownerid = formElements.ownerIdfrmjsp.value
	if(agencylookup !="YES") {
		formElements.ClaimGTAmount.checked="true";
		formElements.wiringUpdatedNo.checked="true";
		formElements.roofUpdatedNo.checked="true";
		formElements.claimInLast3Years.value="0";
   		formElements.FireHydrant.value="100";
   		
   		if (ownerid == 5){
   			formElements.CostalWaterDistanceTemp1.value="30000";
   			formElements.ProtectionClass.value="6";
   		} else if (ownerid == 9){
   			formElements.CostalWaterDistanceTemp7.value="6000";
   			formElements.ProtectionClass.value="4";
   		}
	} else{
		
		var ratingTerritory=formElements.RatingTerritory.value;
		var ratingTerritoryName=formElements.RatingTerritoryName.value;
		if(ratingTerritory !="" && ratingTerritory.length>0) {
			if(formElements.State.value == "FL"){
				document.getElementById("dwellingHeader").innerHTML="DWELLING DETAILS   --   RatingTerritory:- "+ratingTerritoryName;
			} else {
				document.getElementById("dwellingHeader").innerHTML="DWELLING DETAILS   --   RatingTerritory:- "+ratingTerritory;
			}			
		}
		setzipDetails(formElements.City.value,formElements.County.value,formElements.State.value);	
		document.getElementById("losshistory").innerHTML=formElements.claimHtml.value;
	}
	var yearBuild=formElements.YearBuilt.value;
	
	//Wiring, Heating,Plumbing- Question is displayed while YearBuild is <1950
	if(yearBuild<1950 && yearBuild.length==4) {
		
		document.getElementById("questionForWiringUpdated").style.display="inline";
	}
	var state =formElements.State.value
	var territory = formElements.RatingTerritory.value	
	var zone = formElements.Zone.value		

	if(state=='FL') {
		document.getElementById("ConstructionType1").style.display='none';
		document.getElementById("ConstructionType2").style.display='inline';
		formElements.constructionType1.value="";
		formElements.constructionType2.value="Frame";
	} else {
		document.getElementById("ConstructionType1").style.display='inline';
		document.getElementById("ConstructionType2").style.display='none';
		formElements.constructionType1.value="Frame";
		formElements.constructionType2.value="";
	}
	
	if(ownerid == 5){	
	if((state=='NC' && territory=='4') || (state=='SC' && territory=='2') || (state=='TX' && territory=='2')) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='inline';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		formElements.CostalWaterDistanceTemp1.value="";	
		formElements.CostalWaterDistanceTemp2.value="25000";	
		formElements.CostalWaterDistanceTemp3.value="";	
		formElements.CostalWaterDistanceTemp4.value="";
		formElements.CostalWaterDistanceTemp5.value="";
		formElements.CostalWaterDistanceTemp6.value="";
	} else if((state=='TX' && territory=='1')) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='inline';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		formElements.CostalWaterDistanceTemp1.value="";	
		formElements.CostalWaterDistanceTemp2.value="";	
		formElements.CostalWaterDistanceTemp3.value="21000";	
		formElements.CostalWaterDistanceTemp4.value="";
		formElements.CostalWaterDistanceTemp5.value="";
		formElements.CostalWaterDistanceTemp6.value="";
	} else if((state=='FL' && zone=='1')) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='inline';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		formElements.CostalWaterDistanceTemp1.value="";	
		formElements.CostalWaterDistanceTemp2.value="";	
		formElements.CostalWaterDistanceTemp3.value="";	
		formElements.CostalWaterDistanceTemp4.value="5000";
		formElements.CostalWaterDistanceTemp5.value="";	
		formElements.CostalWaterDistanceTemp6.value="";
	} else if((state=='FL' && zone=='2')) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='inline';
		document.getElementById("CostalWaterTemp6").style.display='none';
		formElements.CostalWaterDistanceTemp1.value="";	
		formElements.CostalWaterDistanceTemp2.value="";	
		formElements.CostalWaterDistanceTemp3.value="";	
		formElements.CostalWaterDistanceTemp4.value="";
		formElements.CostalWaterDistanceTemp5.value="5000";	
		formElements.CostalWaterDistanceTemp6.value="";
	} else if((state=='FL' && (zone=='3' || zone=='4' || zone=='5'))) {
		
		document.getElementById("CostalWaterTemp1").style.display='none';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='inline';
		formElements.CostalWaterDistanceTemp1.value="";	
		formElements.CostalWaterDistanceTemp2.value="";	
		formElements.CostalWaterDistanceTemp3.value="";	
		formElements.CostalWaterDistanceTemp4.value="";
		formElements.CostalWaterDistanceTemp5.value="";	
		formElements.CostalWaterDistanceTemp6.value="5000";
	} else {
		
		document.getElementById("CostalWaterTemp1").style.display='inline';
		document.getElementById("CostalWaterTemp2").style.display='none';
		document.getElementById("CostalWaterTemp3").style.display='none';
		document.getElementById("CostalWaterTemp4").style.display='none';
		document.getElementById("CostalWaterTemp5").style.display='none';
		document.getElementById("CostalWaterTemp6").style.display='none';
		formElements.CostalWaterDistanceTemp2.value="";	
		formElements.CostalWaterDistanceTemp1.value="30000";
		formElements.CostalWaterDistanceTemp3.value="";		
		formElements.CostalWaterDistanceTemp4.value="";
		formElements.CostalWaterDistanceTemp5.value="";
		formElements.CostalWaterDistanceTemp6.value="";
	}
	} else if(ownerid == 9) {
		document.getElementById("CostalWaterTemp7").style.display='inline';
		formElements.CostalWaterDistanceTemp7.value="6000";
	}
}					

/**
  *AJAX to get the UI for Claim Details
  *
  */
function getClaimDetail() {
	
	if(validateClaimDetail()) {
		url="/getClaimUI.do"
		var formElement=document.forms[0];
		parameters=getFormAsString();
		createXMLHttpRequest();
		getTheContent1(url,parameters);
		displayClaimUI();
	}
 
}

function getTheContent1(URL,parameters){
	xmlHttp.onreadystatechange = displayClaimUI;
	xmlHttp.open("POST", URL,true);
	xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlHttp.setRequestHeader("Content-length", parameters.length);
    xmlHttp.setRequestHeader("Connection", "close");
    xmlHttp.send(parameters);
}


/**
  * gets the contents of the form as a URL encoded String
  * suitable for appending to a url
  * @param formName to encode
  * @return string with encoded form values , beings with &
  */ 
 function getFormAsString(){
 	//Setup the return String
 	returnString ="";
	//Get the form values
	try {
		formElements=document.forms[0].elements;
		
		if(formElements!=null){
		//loop through the array , building up the url
		//in the form /strutsaction.do&name=value
			for ( var i=formElements.length-1; i>=0; --i ){
				//we escape (encode) each value
				name=formElements[i].name;
				val=encodeURI(formElements[i].value);
				returnString=returnString+name+"="+val+"&";
			}
		}
	} catch(e){}
	
 	//return the values
	
 	return returnString; 


 }

function displayClaimUI() {
 	if (xmlHttp.readyState == 4) { // Complete
      if (xmlHttp.status == 200) { // OK response     
	 	document.getElementById("losshistory").innerHTML=xmlHttp.responseText;
	 }
	}
}

//To edit the Claim Information
function goTOEditLossHistory(mylink,claimNumber) {
	
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	if (typeof(mylink) == 'string') {
		href=mylink;
	} else {
		href=mylink.href;
	}
	mywin = window.open(href, "EditLossHistory", 'width=450, height=230, left=450, top=225');
	mywin.focus();

	return false;
	
}

/**
 *
 */
 function checkClaimInfo(formElement) {
 	formElement.NewClaim.value="No";
 	if(formElement.LossDate!=null ){
 	
	 	if(formElement.LossDate.value!="" || formElement.LossCause.value != "" ||formElement.LossAmount.value !="" || formElement.LossType.value !="" || formElement.LossCompany.value !="") {
 			if(validateClaimDetail()) {
 				formElement.NewClaim.value="Yes";
 				return true;
 			}else {
 				return false;
 			}
 		}else {
 			return true;
 		}
 	}
 }
 

/**
  *For Claim Validation
  */
  
  function validateClaimDetail() {
  	
  	var formElement=document.forms[0];
  	if(formElement.LossDate != null) {
  		var lossDate=formElement.LossDate.value;
  		if(lossDate == "") {
			alert("Please enter the LossDate");
			return false;
		} else {
		
			if(!isDate(lossDate)) {
				alert("Please enter the LossDate in 'MM/DD/YYYY' format");
				return false;
			} else {
				
				var date_array = lossDate.split("/");
				
				 if(date_array[0]>12 || date_array[0]==0) {
					alert("Please enter the valid Month in LossDate");
					return false;
				}
				 if(date_array[1]>31 || date_array[1]==0) {
					alert("Please enter the valid Date in LossDate");
					return false;
				}
				if(!validateLHyear(date_array[2])) {
					alert("Please enter the valid Year in LossDate");
					return false;
				} 
			}
					
		
		}
  	}
  	
  	if(formElement.LossCause != null) {
	  	if(formElement.LossCause.value == "") {
				alert("Please enter the Loss Description");
				return false;
			}
  	}
  	
  	if(formElement.LossAmount !=null) {
  	
  		if(formElement.LossAmount.value == "") {
			alert("Please enter the AmountPaid/Reserved");
			return false;
		} else {
		
			if(!isAmount(formElement.LossAmount.value)) {
				alert("Please enter the valid AmountPaid/Reserved ");
				return false;
			}
		}
  	}
  	
  	return true;
  
  }

//For Date Validation(MM/DD/YYYY)
function isDate(data)
{   var index;
    
    if(data.length==10) {
	    for (index = 0; index < data.length; index++)
	    {   
	        // Check that current character is number.
	        var c = data.charAt(index);
	        if (((c < "0") || (c > "9"))) {
	      
	       		if(index=='2' || index=='5') {
		       		if(c!="/") {
		       			return false;
		  	 		}
		       	 } else {
		       	 	return false;
		       	 }
		     }
	    }
	    // All characters are numbers.
	    return true;
	} else {
	
		return false;
	}
}

//For Year Validation
function validateLHyear(data) {

	var dat = new Date();
	
	var currentyear = dat.getFullYear();
	
	var year=data;
	
	if(year>currentyear || year==0) {
			
		return false;
	} else {
		
		return true;
	}
}

function isAmount(data)
{
	var len=data.length;
	var temp=0;
	
	if (len>0)
	{
	 for (index = len-1; index >-1; index--)
	    {  
	    	 var c = data.charAt(index);
	    
	   		
	   		  if(c=="," )
	   			  {	   			
	   			  if(index==0)
	   			  {
	   			  return false;
	   			  }
	   				   if(temp!=3 && temp!=7)
	   					   {	   					
	     						 return false;
	    				  }	     			   
	   			}
	    	if(c=="$")
	   		     {
	     			   if(index!=0)
	     				  {	    	    			
	    	    			  return false;
	     				 }	     				
	     		}
	    	 if(c!=1 && c!=2 && c!=3 && c!=4 && c!=5 && c!=6 && c!=7 && c!=8 && c!=9 && c!=0 && c!="$" && c!=",")
	     			 {	     				
	     				  return false;
	    			 }    	 
	  			  
	     		   temp++;
	    }
	    return true;
	}
	return false;
}

function isDecimal(data)
{   var index;
    for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) {
      
       		if(c==".") {
       			for(i=index+1;i < data.length;i++) {
       				
       				var e = data.charAt(i);
       				if (((e < "0") || (e > "9"))) {
       					return false;
       				}
       			}
       			break;
       			
       		} else {
  	 			return false;
  	 		}
       	 }
    }
    // All characters are numbers.
    return true;
}

//Sacripts For POPUP MENU

viewport = {
  getWinWidth: function () {
    this.width = 0;
    if (window.innerWidth) this.width = window.innerWidth - 18;
    else if (document.documentElement && document.documentElement.clientWidth) 
  		this.width = document.documentElement.clientWidth;
    else if (document.body && document.body.clientWidth) 
  		this.width = document.body.clientWidth;
  },
  
  getWinHeight: function () {
    this.height = 0;
    if (window.innerHeight) this.height = window.innerHeight - 18;
  	else if (document.documentElement && document.documentElement.clientHeight) 
  		this.height = document.documentElement.clientHeight;
  	else if (document.body && document.body.clientHeight) 
  		this.height = document.body.clientHeight;
  },
  
  getScrollX: function () {
    this.scrollX = 0;
  	if (typeof window.pageXOffset == "number") this.scrollX = window.pageXOffset;
  	else if (document.documentElement && document.documentElement.scrollLeft)
  		this.scrollX = document.documentElement.scrollLeft;
  	else if (document.body && document.body.scrollLeft) 
  		this.scrollX = document.body.scrollLeft; 
  	else if (window.scrollX) this.scrollX = window.scrollX;
  },
  
  getScrollY: function () {
    this.scrollY = 0;    
    if (typeof window.pageYOffset == "number") this.scrollY = window.pageYOffset;
    else if (document.documentElement && document.documentElement.scrollTop)
  		this.scrollY = document.documentElement.scrollTop;
  	else if (document.body && document.body.scrollTop) 
  		this.scrollY = document.body.scrollTop; 
  	else if (window.scrollY) this.scrollY = window.scrollY;
  },
  
  getAll: function () {
    this.getWinWidth(); this.getWinHeight();
    this.getScrollX();  this.getScrollY();
  }
  
}

var menuLayers = {
  timer: null,
  activeMenuID: null,
  offX: 4,   // horizontal offset
  offY: 6,   // vertical offset
  show: function(id, e) {
    var mnu = document.getElementById? document.getElementById(id): null;
    if (!mnu) return;
    this.activeMenuID = id;
    if ( mnu.onmouseout == null ) mnu.onmouseout = this.mouseoutCheck;
    if ( mnu.onmouseover == null ) mnu.onmouseover = this.clearTimer;
    viewport.getAll();
    this.position(mnu,e);
  },

  hide: function() {
    this.clearTimer();
    if (this.activeMenuID && document.getElementById)
      this.timer = setTimeout("document.getElementById('"+menuLayers.activeMenuID+"').style.visibility = 'hidden'", 200);
  },

  position: function(mnu, e) {
    var x = e.pageX? e.pageX: e.clientX + viewport.scrollX;
    var y = e.pageY? e.pageY: e.clientY + viewport.scrollY;

    if ( x + mnu.offsetWidth + this.offX > viewport.width + viewport.scrollX )
      x = x - mnu.offsetWidth - this.offX;
    else x = x + this.offX;

    if ( y + mnu.offsetHeight + this.offY > viewport.height + viewport.scrollY )
      y = ( y - mnu.offsetHeight - this.offY > viewport.scrollY )? y - mnu.offsetHeight - this.offY : viewport.height + viewport.scrollY - mnu.offsetHeight;
    else y = y + this.offY;

    mnu.style.left = x + "px"; mnu.style.top = y + "px";
    this.timer = setTimeout("document.getElementById('" + menuLayers.activeMenuID + "').style.visibility = 'visible'", 200);
  },

  mouseoutCheck: function(e) {
    e = e? e: window.event;
    // is element moused into contained by menu? or is it menu (ul or li or a to menu div)?
    var mnu = document.getElementById(menuLayers.activeMenuID);
    var toEl = e.relatedTarget? e.relatedTarget: e.toElement;
    if ( mnu != toEl && !menuLayers.contained(toEl, mnu) ) menuLayers.hide();
  },

  // returns true of oNode is contained by oCont (container)
  contained: function(oNode, oCont) {
    if (!oNode) return; // in case alt-tab away while hovering (prevent error)
    while ( oNode = oNode.parentNode )
      if ( oNode == oCont ) return true;
    return false;
  },

  clearTimer: function() {
    if (menuLayers.timer) clearTimeout(menuLayers.timer);
  }

}
