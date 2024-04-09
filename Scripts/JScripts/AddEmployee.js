function showHide() {	
alert("hai");
if (document.getElementById) 
{		// W3C standard		
alert("hai1");
var cobraElection = document.getElementById("cobraElection").style;		
var ordinaryElection = document.getElementById("ordinaryElection").style;		
var ordinaryElection1 = document.getElementById("ordinaryElection1").style;		
cobraElection.display="block";	
ordinaryElection.display="block";
ordinaryElection1.display="block";


}	
}
function showHide1() {	

var formElement=document.forms[0];
if(formElement.COBRAOpted1.checked==true){
formElement.EmployeeCoveredInCOBRA1.disabled=true;
formElement.EmployeeCoveredInCOBRA2.disabled=true;
formElement.SpouseCoveredInCOBRA1.disabled=true;
formElement.SpouseCoveredInCOBRA2.disabled=true;
formElement.numOfCobraChildren.disabled=true;

formElement.EmployeeCoveredInCOBRA1.checked=false;
formElement.EmployeeCoveredInCOBRA2.checked=false;
formElement.SpouseCoveredInCOBRA1.checked=false;
formElement.SpouseCoveredInCOBRA2.checked=false;
formElement.numOfCobraChildren.value=0;



if (formElement.EmployeeElection.value=="EEOnly") {
	formElement.EmployeeCoveredInCOBRA1.disabled=false;
	formElement.EmployeeCoveredInCOBRA2.disabled=false;
	formElement.EmployeeCoveredInCOBRA1.checked=true;
	formElement.SpouseCoveredInCOBRA2.checked=true;
	formElement.emloyeeCovCobra.value='Y';
	formElement.spouseCovCobra.value='N';
	formElement.childrenCovCobra.value='0';
}

if (formElement.EmployeeElection.value=="EEandSpouse") {
	formElement.EmployeeCoveredInCOBRA1.disabled=false;
	formElement.EmployeeCoveredInCOBRA2.disabled=false;
	formElement.EmployeeCoveredInCOBRA1.checked=true;
	formElement.SpouseCoveredInCOBRA1.disabled=false;
	formElement.SpouseCoveredInCOBRA2.disabled=false;
	formElement.SpouseCoveredInCOBRA1.checked=true;
	formElement.emloyeeCovCobra.value='Y';
	formElement.spouseCovCobra.value='Y';
	formElement.childrenCovCobra.value='0';
}

if(formElement.EmployeeElection.value=="Family") {
	formElement.EmployeeCoveredInCOBRA1.disabled=false;
	formElement.EmployeeCoveredInCOBRA2.disabled=false;
	formElement.EmployeeCoveredInCOBRA1.checked=true;
	formElement.SpouseCoveredInCOBRA1.disabled=false;
	formElement.SpouseCoveredInCOBRA2.disabled=false;

	formElement.SpouseCoveredInCOBRA1.checked=true;
	formElement.numOfCobraChildren.disabled=false;

	formElement.emloyeeCovCobra.value='Y';
	formElement.spouseCovCobra.value='Y';
	formElement.childrenCovCobra.value='0';
}

if(formElement.EmployeeElection.value=="EEandChildren") {

	formElement.EmployeeCoveredInCOBRA1.disabled=false;
	formElement.EmployeeCoveredInCOBRA2.disabled=false;
	
	formElement.EmployeeCoveredInCOBRA1.checked=true;
	formElement.SpouseCoveredInCOBRA2.checked=true;
	
	formElement.numOfCobraChildren.disabled=false;

	formElement.emloyeeCovCobra.value='Y';
	formElement.spouseCovCobra.value='N';
	formElement.childrenCovCobra.value='0';
}

if(formElement.EmployeeElection.value=="none") {

	formElement.EmployeeCoveredInCOBRA2.checked=true;
	formElement.SpouseCoveredInCOBRA2.checked=true;

	formElement.emloyeeCovCobra.value='N';
	formElement.spouseCovCobra.value='N';
	formElement.childrenCovCobra.value='0';

}


} else {

formElement.EmployeeCoveredInCOBRA1.disabled=true;
formElement.EmployeeCoveredInCOBRA2.disabled=true;
formElement.SpouseCoveredInCOBRA1.disabled=true;
formElement.SpouseCoveredInCOBRA2.disabled=true;
formElement.numOfCobraChildren.disabled=true;


}
}



function showHide2() {	

var formElement=document.forms[0];
if(formElement.COBRAOpted1.checked==true){
formElement.EmployeeCoveredInCOBRA1.disabled=true;
formElement.EmployeeCoveredInCOBRA2.disabled=true;
formElement.SpouseCoveredInCOBRA1.disabled=true;
formElement.SpouseCoveredInCOBRA2.disabled=true;
formElement.numOfCobraChildren.disabled=true;

if (formElement.EmployeeElection.value=="EEOnly") {
	formElement.EmployeeCoveredInCOBRA1.disabled=false;
	formElement.EmployeeCoveredInCOBRA2.disabled=false;
	
}

if (formElement.EmployeeElection.value=="EEandSpouse") {
	formElement.EmployeeCoveredInCOBRA1.disabled=false;
	formElement.EmployeeCoveredInCOBRA2.disabled=false;
	
	formElement.SpouseCoveredInCOBRA1.disabled=false;
	formElement.SpouseCoveredInCOBRA2.disabled=false;
	
}

if(formElement.EmployeeElection.value=="Family") {

	formElement.EmployeeCoveredInCOBRA1.disabled=false;
	formElement.EmployeeCoveredInCOBRA2.disabled=false;
	
	
	formElement.SpouseCoveredInCOBRA1.disabled=false;
	formElement.SpouseCoveredInCOBRA2.disabled=false;
	formElement.numOfCobraChildren.disabled=false;
}

if(formElement.EmployeeElection.value=="EEandChildren") {

	formElement.EmployeeCoveredInCOBRA1.disabled=false;
	formElement.EmployeeCoveredInCOBRA2.disabled=false;
	formElement.numOfCobraChildren.disabled=false;
}


} else {

formElement.EmployeeCoveredInCOBRA1.disabled=true;
formElement.EmployeeCoveredInCOBRA2.disabled=true;
formElement.SpouseCoveredInCOBRA1.disabled=true;
formElement.SpouseCoveredInCOBRA2.disabled=true;
formElement.numOfCobraChildren.disabled=true;


}
}

function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

//Pass fild element, msg
function NumberValidation(FieldValue,maxNo,msg)
{   

   if(isInteger(FieldValue)){
	var value=parseInt(FieldValue);
	 if(value>parseInt(maxNo))
		{ alert(msg);
		 return false;}
	}
	return true;
}

function YearValidation(FieldValue,maxNo,msg)
{ 
	if(isInteger(FieldValue)){
	var value=parseInt(FieldValue);
	 if(value<parseInt(maxNo))
		{ alert(msg);
		 return false;}
	}
	return true;
}



function validateFields(){

	var formElement=document.forms[0];
	var intxxx = isInteger(formElement.ssn1.value);
	var intxx = isInteger(formElement.ssn2.value);
	var intxxxx = isInteger(formElement.ssn3.value);


	var ssn1val = formElement.ssn1.value;
	var ssn2val = formElement.ssn2.value;
	var ssn3val = formElement.ssn3.value;
	var ssnval = ssn1val+ssn2val+ssn3val;

	if((ssnval.length > 0 && ssnval.length < 9 ) || parseInt(ssnval,10)<1) {
		alert("SSN not valid.");
		formElement.ssn1.select();
		return false;
	}
	
		
	if((!(intxxx))||(!(intxx))||(!(intxxxx))){
	alert("SSN Value should be numeric");
		return false;
	}

	if(formElement.age.value=="" & formElement.dobyy.value=="")
	{
		alert("Please enter Date of Birth or age");
		return false;
	}
	
	var dmonth = parseInt(formElement.dobmm.value, 10);
	var dday = parseInt(formElement.dobdd.value, 10);
	var dyear = parseInt(formElement.dobyy.value, 10);

	if ((formElement.dobmm.value!=""||formElement.dobdd.value!=""||formElement.dobyy.value!=""))
	{
		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear))
		{
			alert("Please enter date in 'MM/DD/YYYY' format");
			formElement.dobmm.select();
			return false;
		}

		var dob = dmonth+"/"+dday+"/"+dyear;
		//using function from Common.js
		if(!isDate(dob)){
			alert("Invalid Date")
			return false;
		}
	}

	if (formElement.dobmm.value!=""||formElement.dobdd.value!="")
	{
		//using function from Common.js
		var calcAge1 = calcAge(dday, dmonth, dyear);
		
		if ((calcAge1<15) || (calcAge1>98))
		{
			alert("Age should be between 15 and 99 years.");
			return false;
		}
	}
	
	if(formElement.age.value!="") {
		if(!(isInteger(formElement.age.value))){
		alert("Please enter a numeric value for age");
		formElement.age.select();
		return false;
		
	}
	

	if((formElement.age.value <15) || (formElement.age.value>98))
	{
		alert("Age should be between 15 and 99 years");
		formElement.age.value="";
		formElement.age.focus();
		return false;
		}
	}

	if (formElement.dobyy.value=="")
	{
		var Age=formElement.age.value;
		var dtNow = new Date();
		var yearNow = dtNow.getFullYear();
		var Yob=yearNow-Age;
		formElement.dobmm.value="01";
		formElement.dobdd.value="01";
		formElement.dobyy.value=Yob;
	}
	
	if((!(formElement.gender1.checked))&&(!(formElement.gender2.checked))  )
	{
		alert("Please enter Gender");
		return false;
	}
	else if((formElement.EmployeeElection.value=="") )
	{
		alert("Please Select Health Plan Coverage Election");
		return false;
	}
	
	var empElec = ((formElement.EmployeeElection.value=="EEandChildren")|| (formElement.EmployeeElection.value=="Family"));
	if((formElement.numOfChildren.value=="")&& empElec)
	{
		alert("Please Enter No Of Children");
		formElement.numOfChildren.focus();
		return false;
	}

	var childno = formElement.numOfChildren.value;

	if ((!(childno=="") && (!(isInteger(childno)))))
	{
	alert("Number of children field should only have integer values.");
	formElement.numOfChildren.select();
	return false;
	}
	var intChildNo = parseInt(childno);

	if ((!(childno=="") && intChildNo<1)&& empElec)
	{
		alert("Number of children should be one or more");
		formElement.numOfChildren.select();
		return false;
	}
	
	
	if(validateNumRange(formElement.numOfCobraChildren, 0, 99, 'Cobra: Number Of Children Covered', true)==false)
		return false;
	
	var xxx=formElement.ssn1.value;
	var xx=formElement.ssn2.value;
	var xxxx=formElement.ssn3.value;
	formElement.ssn1ss2ss3.value=xxx+xx+xxxx;


	var hdmm = formElement.HireDatemm.value;
	var hddd = formElement.HireDatedd.value;
	var hdyy = formElement.HireDateyy.value;
	if(hdmm+hddd+hdyy!=""){
		formElement.hireDate.value = hdmm+"/"+hddd+"/"+hdyy;
		if(fnValidateDate(formElement.hireDate, 'Hire date', false)==false)
			return false;
	}

	var expmm = formElement.ExpirationDatemm.value;
	var expdd = formElement.ExpirationDatedd.value;
	var expyy = formElement.ExpirationDateyy.value;
	if(expmm+expdd+expyy!=""){
		formElement.ExpirationDate.value = expmm+"/"+expdd+"/"+expyy;
		if(fnValidateDate(formElement.ExpirationDate, 'Pre-Existing Condition Expiration date', false)==false)
			return false;
	}

	var empeffmm = formElement.emplEffectiveDatemm.value;
	var empeffdd = formElement.emplEffectiveDatedd.value;
	var empeffyy = formElement.emplEffectiveDateyy.value;
	if(empeffmm+empeffdd+empeffyy!=""){
		formElement.emplEffectiveDate.value = empeffmm+"/"+empeffdd+"/"+empeffyy;
		if(fnValidateDate(formElement.emplEffectiveDate, 'Effective date', false)==false)
			return false;
	}
	
	var sigmm = formElement.signatureDatemm.value;
	var sigdd = formElement.signatureDatedd.value;
	var sigyy = formElement.signatureDateyy.value;
	if(sigmm+sigdd+sigyy!=""){
		formElement.signatureDate.value = sigmm+"/"+sigdd+"/"+sigyy;
		if(fnValidateDate(formElement.signatureDate, 'Signature date', false)==false)
			return false;
	}
	
	if(formElement.lifeAmount.value == "0" ||
		formElement.lifeAmount.value=="0.0") {
		formElement.lifeAmount.value = "";
	}
	
	if(formElement.wdiAmount.value == "0" ||
		formElement.wdiAmount.value=="0.0") {
		formElement.wdiAmount.value = "";
	}
	if(validateLifeAmount(formElement.lifeAmount)==false)
		return false;
	
	if(validateNumRange(formElement.wdiAmount, 500, 2000, 'WDI Amount')==false)
		return false;
		
	var admm = formElement.approveDateMM.value;
	var addd = formElement.approveDateDD.value;
	var adyy = formElement.approveDateYY.value;
	if(admm+addd+adyy!=""){
		formElement.approveDate.value = admm+"/"+addd+"/"+adyy;
		if(fnValidateDate(formElement.approveDate, 'Approve date', false)==false)
			return false;
	}
	
	if(validateNumRange(formElement.certificateNumber, 0, 999999999, 'Certificate Number', true)==false)
		return false;
	
	if(validateNumRange(formElement.salary, 0, 999999999, 'Salary')==false)
		return false;



	if(validateNumRange(formElement.hoursWorkedPerWeek, 0, 512, 'Hours Worked Per Week', true)==false)
		return false;

	if(validateNumRange(formElement.countyCode, 0, 999, 'County Code', true)==false)
		return false;
	
	if(validateNumRange(formElement.zipCode, 0, 9999999999, 'Zip Code', true, '-')==false)
		return false;
		
	if(formElement.Workph1.value!="" && formElement.Workph2.value!="" && formElement.Workph3.value!=""){
		if((validateNumRange(formElement.Workph1,0,999,'Work Phone')==false)||(validateNumRange(formElement.Workph2,0,999,'Work Phone')==false)||(validateNumRange(formElement.Workph3,0,9999,'Work Phone')==false)){
			return false;
		}
		formElement.businessPhone.value=formElement.Workph1.value+"-"+formElement.Workph2.value+"-"+formElement.Workph3.value;
	}
	
	if(formElement.Homeph1.value!="" && formElement.Homeph2.value!="" && formElement.Homeph3.value!=""){
		if((validateNumRange(formElement.Homeph1,0,999,'Home Phone')==false)||(validateNumRange(formElement.Homeph2,0,999,'Home Phone')==false)||(validateNumRange(formElement.Homeph3,0,9999,'Home Phone')==false)){
			return false;
		}
		formElement.homePhone.value=formElement.Homeph1.value+"-"+formElement.Homeph2.value+"-"+formElement.Homeph3.value;
	}	

	return newchecksubmitcount();	
}

function validateLifeAmount(field){
	if(field.value!="" && field.value=="0"){
		return true;
	}
	if(validateNumRange(field, 25000, 300000, 'Life amount')==false){
		return false;
	}

	if(field.value!="" && !isNaN(field.value) && (field.value)%1000!=0){
		alert("Life amount should range between $25,000 and $3,00,000, and should be in multiples of 1000.");
		field.value="";		
		field.select();
		return false;		
	}
	return true;
}

function validateNumRange(field, minAge, maxAge, what, checkInt, exclude1){
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
	return true;
}

function fnValidateDate(field, what, validateBlank){
	//assume that field is having date in format MM/DD/YYYY
	var vardate = field.value;
	if (validateBlank==true && vardate=="")
	{
		alert("Please enter the "+what);
		return false;
	}
	
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);
	
	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear))
	{
		alert("Please enter date in 'MM/DD/YYYY' format for "+what);
		return false;
	}

	var dob = dmonth+"/"+dday+"/"+dyear;
	//using function from Common.js
	if(!isDate(dob)){
		alert("Invalid Date")
		return false;
	}
}

function fnValidateDateRange(field, what, validateBlank, minDate, maxDate){
	if(fnValidateDate(field, what, validateBlank)==false){
		return false;
	}
	var vardate = field.value;
	var ddate = new Date(vardate);
	
	if(minDate!=""&& sDate(minDate)){
		var reqMinDate = new Date(minDate);
		if(ddate < reqMinDate){
			alert(what+" cannot be prior to "+minDate);
			return false;
		}
	}
	
	if(maxDate!=""&& sDate(maxDate)){
		var reqMaxDate = new Date(maxDate);
		if(ddate < reqMaxDate){
			alert(what+" cannot be later than "+maxDate);
			return false;
		}
	}
}

function toggleWDI(field){
	if(field!=null && field.checked==true){
		field.form.styleWDI.value="Y";
	} else{
		field.form.styleWDI.value="N";
	}
}

function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9")))
			return false;
			
    }
    // All characters are numbers.
    return true;
}

function checkChildren() {
	var frm = document.forms[0];
	var empElec = ((frm.EmployeeElection.value=="EEandChildren")|| (frm.EmployeeElection.value=="Family") || (frm.EmployeeElection.value==""));
	if(!empElec) {
		frm.numOfChildren.value="0";
		frm.numOfChildren.readOnly=true;
	} else {
		frm.numOfChildren.readOnly=false;
	}
}