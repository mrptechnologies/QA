
function FactorCalculatePopup(mylink, windowname) {
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	if (typeof(mylink) == 'string') {
		href=mylink;
	} else {
		href=mylink.href;
	}
	mywin = window.open(href, windowname, 'width=300, height=410, left=400, top=150, scrollbars=yes');
	mywin.focus();

	return false;
}

function DoFactorCalculate(frm)
{
	Validate(frm);
	var frm = document.forms[0];
	setPercentage(frm);
	getPercentage(frm);
	var result=(frm.ThisDesiredTotalMedialPremium.value*frm.ThisCurrentUWFactor.value)/frm.ThisCurrentTotalMedicalPremium.value;
	frm.ThisNewFactor.value=Math.round(result*100000)/100000;	
}

function submitToChild()
 {
	var frm = document.forms[0];
	frm.ThisCurrentUWFactor.value=0;
	frm.ThisCurrentUWFactor.value =""+(window.opener.document.UWWorkSheet.MedicalUWFactor.value);
	return true;
}

function validateRequest(frm)
{
	 return true;
}

//Validation
function Validate(frm)
 {
	 var frm = document.forms[0];
		
	if(validateNumRange(frm.ThisCurrentTotalMedicalPremium, 0, 9999999999, 'Current Total Medical Premiumm ')==false)
	return false;
	
	if(validateNumRange(frm.ThisCurrentUWFactor, 0, 9999999999, 'Current UW Factor ')==false)
	return false;

	if(validateNumRange(frm.ThisDesiredPercentageChange, -9999999999, 9999999999, 'Desired Percentage Change ')==false)
	return false;

	if(validateNumRange(frm.ThisDesiredTotalMedialPremium, -9999999999, 9999999999, 'Desired Total Medial Premium ')==false)
	return false;

}

function validateNumRange(field, minAge, maxAge, what, checkInt, exclude1){
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

//Adding up Desired Percentage Change of Current Total Medical Premium with Desired Total Medial Premium
function setPercentage(frm) {
	var frms = document.forms[0];
	var int1=frms.ThisCurrentTotalMedicalPremium.value;
	var int2=frms.ThisDesiredPercentageChange.value;
	var a = int1/100;
	var b = (a*int2);
	var c=frms.ThisDesiredTotalMedialPremium.value;
	var d=((int1*1)+(b*1));
	d=Math.round(d*1)/1;
	frms.ThisDesiredTotalMedialPremium.value = d;
	return true;
}

//Calculate back the Desired Percentage Change using formula (Desired Total Medial Premium-Current Total Medical Premium)/(Current Total Medical Premium*100)
function getPercentage(frm) {
	var frms = document.forms[0];
	var e=frms.ThisDesiredTotalMedialPremium.value*1;
	var f=frms.ThisCurrentTotalMedicalPremium.value*1;
	var g=(e-f)/f*100;
	var h=Math.round(g*100)/100;	
	frms.ThisDesiredPercentageChange.value=h;
	return true;
}

//Reset Desired Total Medial Premium
function setDesiredTotalMedialPremiumValue(frm) {
	var frms = document.forms[0];
	Validate(frms);
	frms.ThisDesiredTotalMedialPremium.value=frms.ThisCurrentTotalMedicalPremium.value;
	setPercentage(frm);
	return true;
}

//Reset Desired Percentage
function setDesiredPercentageChangeValue(frm) {
	var frms = document.forms[0];
	Validate(frms);
	frms.ThisDesiredPercentageChange.value=0;
	getPercentage(frm);
	return true;
}