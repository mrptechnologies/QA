function validateFields(){

	var formElement=document.forms[0];
	if(formElement.relationChild.checked==false && formElement.relationSpouse.checked==false){
		alert("Please select relationship.");
		return false;
	}
	if(formElement.Age.value=="" && formElement.depYY.value=="" )
	{
		alert("Please Enter Age");
		return false;
	}
	
	var dmonth = parseInt(formElement.depMM.value, 10);
	var dday = parseInt(formElement.depDD.value, 10);
	var dyear = parseInt(formElement.depYY.value, 10);

	if ((formElement.depMM.value!=""||formElement.depDD.value!=""||formElement.depYY.value!=""))
	{
		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear))
		{
			alert("Please enter date in 'MM/DD/YYYY' format");
			formElement.depMM.select();
			return false;
		}

		var dob = dmonth+"/"+dday+"/"+dyear;
		//using function from Common.js
		if(!isDate(dob)){
			alert("Invalid Date")
			return false;
		}
	}

	if(validateNumRange(formElement.Age, 0, 99, 'Age', true)==false){
		return false;
	}
	if(formElement.depYY.value=="") {

		var Age=formElement.Age.value;
		var dtNow = new Date();
		var yearNow = dtNow.getFullYear();
		var Yob=yearNow-Age;
		formElement.depYY.value=Yob;
		formElement.depDD.value="01";
		formElement.depMM.value="01";
	}
	if((!formElement.genderMale.checked)&&(!formElement.genderFemale.checked))
	{
		alert("Please Enter Gender");
		return false;
	}


	if(validateNumRange(formElement.suffix, 0, 99, 'Suffix')==false){
		return false;
	}
	fillDate(formElement.ExpirationDatedd,formElement.ExpirationDatemm,formElement.ExpirationDateyy,formElement.ExpirationDate);	
	fillDate(formElement.studentVerifyDateDD,formElement.studentVerifyDateMM,formElement.studentVerifyDateYY,formElement.studentVerifyDate);
	fillDate(formElement.terminationDateDD,formElement.terminationDateMM,formElement.terminationDateYY,formElement.terminationDate);
	fillDate(formElement.planEffectiveDateDD,formElement.planEffectiveDateMM,formElement.planEffectiveDateYY,formElement.planEffectiveDate);
	fillDate(formElement.effectiveDateDD,formElement.effectiveDateMM,formElement.effectiveDateYY,formElement.effectiveDate);
	
	if(fnValidateDate(formElement.ExpirationDate, 'Expiration Date', false)==false){
		return false;
	}
	if(fnValidateDate(formElement.studentVerifyDate, 'Student verify date', false)==false){
		return false;
	}
	if(fnValidateDate(formElement.terminationDate, 'Termination date', false)==false){
		return false;
	}
	if(fnValidateDate(formElement.planEffectiveDate, 'Plan effective date', false)==false){
		return false;
	}
	if(fnValidateDate(formElement.effectiveDate, 'Effective date', false)==false){
		return false;
	}		
	return checksubmitcount();	
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

function fillDate(dd,mm,yy,target){
	if(dd.value+mm.value+yy.value!=""){
		target.value=mm.value+"/"+dd.value+"/"+yy.value;
	}
}

function fnValidateDate(field, what, validateBlank){
	//assume that field is having date in format MM/DD/YYYY
	var vardate = field.value;
	if (validateBlank==true && vardate=="")
	{
		alert("Please enter the "+what);
		return false;
	}
	if(validateBlank==false && vardate==""){
		return true;
	}
	
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);
	
	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear)|| dyear<1000)
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