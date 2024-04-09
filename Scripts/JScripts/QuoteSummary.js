function validateFields(){
	if(!validateReqEffDate()) {
		return false;
	}
	var formElement=document.forms[0];
	
	if(document.forms[0].effDate!= null){
	var vardate = frm.effDate.value;  

	var ddate = new Date(vardate);
	if (vardate=="")
	{
		alert("Please enter the Effective Date");
		frm.effDate.focus();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.effDate.select();
		return false;
	}
	}
	
	if(frm.reqeffdate!= null){
	var vardate1 = frm.reqeffdate.value;  	
	var ddate1 = new Date(vardate1);
	if (vardate1=="")
	{
		alert("Please enter the Effective Date");
		frm.reqeffdate.focus();
		return false;
	}
	
	var dmonth1 = parseInt(vardate1.substring(0, 2), 10);
	var dday1 = parseInt(vardate1.substring(3, 5), 10);
	var dyear1 = parseInt(vardate1.substring(6, 10), 10);

	if (isNaN(dmonth1) || dmonth1 < 1 || dmonth1 > 12 || isNaN(dday1) || dday1 < 1 || dday1 > 31 || isNaN(dyear1) || vardate1.substring(2, 3)!="/" || vardate1.substring(5, 6)!="/")
	{
		
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.reqeffdate.select();
		return false;
	}
	}

//	var reqDate = new Date("01/01/2005");
	var reqDate = new Date("10/01/2005");

	if (ddate < reqDate)
	{
		alert("Effective Date cannot be prior to October 1, 2005");
		frm.effDate.select();
		return false;
	} 
	
	//inception Date
	if(formElement.inceptionDate) {
		var inmm = formElement.inceptionDateMM.value;
		var indd = formElement.inceptionDateDD.value;
		var inyy = formElement.inceptionDateYY.value;
		if(inmm+indd+inyy!=""){
			formElement.inceptionDate.value = inmm+"/"+indd+"/"+inyy;
			if(fnValidateDate(formElement.inceptionDate, 'Inception Date', false)==false) {
				formElement.inceptionDate.value="";
				return false;
			}
		}
	}
	//uw Date
	if(formElement.uwDate) {
		var uwmm = formElement.uwDateMM.value;
		var uwdd = formElement.uwDateDD.value;
		var uwyy = formElement.uwDateYY.value;
		if(uwmm+uwdd+uwyy!=""){
			formElement.uwDate.value = uwmm+"/"+uwdd+"/"+uwyy;
			if(fnValidateDate(formElement.uwDate, 'Underwriting Date', false)==false) {
				formElement.uwDate.value="";
				return false;
			}
		}
	}
	
	//ratingCard
	if(validateNumRange(formElement.ratingCard, 0, 99999, 'Rating Card')==false)
		return false;

	//ppoEffDate
	if(formElement.ppoEffDate) {
		var ppoEffmm = formElement.ppoEffDateMM.value;
		var ppoEffdd = formElement.ppoEffDateDD.value;
		var ppoEffyy = formElement.ppoEffDateYY.value;
		if(ppoEffmm+ppoEffdd+ppoEffyy!=""){
			formElement.ppoEffDate.value = ppoEffmm+"/"+ppoEffdd+"/"+ppoEffyy;
			if(fnValidateDate(formElement.ppoEffDate, 'PPO Effective Date', false)==false) {
				formElement.ppoEffDate.value="";
				return false;
			}
		}
	}	

	return true;
}

function confirmFTP(path){
	var ans = window.confirm('This will upload the XML File to the FTP Site. Are you sure?');
	if (ans)
	{
		window.open(path);
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
		alert("Invalid Date: " + what)
		return false;
	}
}

function validateNumRange(field, minAge, maxAge, what){
	if(field!=null){
		if(field.value!="" && isNaN(field.value)){
			alert(what+" should be numeric.");
			field.value="";
			field.select();
			return false;
		}
		
		if(field.value!="" && !isNaN(field.value) && field.value<minAge || field.value>maxAge){
			alert(what+" should be between "+minAge+" and "+maxAge+".");
			field.value="";
			field.select();
			return false;		
		}
	}
	return true;
}

function validateDate(){
	var frm = document.forms[0];
	var vardate = frm.reqeffdate1.value
	var ddate = new Date(vardate);	
	if(!isDate(vardate)){
		alert("Invalid Date")
		frm.reqeffdate1.value =frm.referenceEffectiveDate.value; 
		frm.reqeffdate1.focus();
		return false;
	}
	if (vardate=="")
	{
		alert("Please enter the Effective Date");
		frm.reqeffdate1.value =frm.referenceEffectiveDate.value;
		frm.reqeffdate1.focus();
		
		
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.reqeffdate1.value =frm.referenceEffectiveDate.value;
		frm.reqeffdate1.focus();
		return false;
	}
	///alert(dmonth);
	//alert(dday);
	//alert(dyear);

	//alert(ddate);
	var reqDate = new Date("01/01/2005");
	///alert(reqDate);

	
	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.reqeffdate1.value =frm.referenceEffectiveDate.value;
		frm.reqeffdate1.focus();
		return false;
	}

	
	if(frm.reqeffdate1!=null && frm.reqeffdate1!=undefined ){
		frm.reqeffdate1.value=vardate;
		//alert(frm.effDatefrmRequest.value);
	}
	return true;
}









//Create Quote Proposal Button issue

function QuoteProposalDisable(formElement){
	document.getElementById("QuoteProposalSubmit").disabled = true;		
}

function QuoteProposalEnable(formElement){
	document.getElementById("QuoteProposalSubmit").disabled = false;		
}

//Notes value truncated issue
function maxLengthTextArea() {
	var field = document.forms[0].QuoteDiscription;
	if ( field.value.length > 120 )
  	{
  	
    	field.value = field.value.substring( 0, 120 );
    	alert( "Quote Notes value can only be 120 characters in length." );
    	return false;
  	}   		
}

//Endorsement Description value truncated issue
function maxLengthTextAreaDesc(type) {
	var field = document.forms[1].EndorsementDescription;
	if ( field.value.length > 128 )
  	{  	
    	field.value = field.value.substring( 0, 128 );
    	alert( type+" value can only be 128 characters in length." );
    	return false;
  	}
  	return true;  	
}

function validateReqEffDate() {

	var frm = document.forms[0];
	var varReqEffdate = frm.reqeffdate.value
	var ddate = new Date(varReqEffdate);	
	if(!isDate(varReqEffdate)){
		alert("Invalid Date")		
		return false;
	}
	if (varReqEffdate=="")
	{
		alert("Please enter the Effective Date");		
		return false;
	}
	var dmonth = parseInt(varReqEffdate.substring(0, 2), 10);
	var dday = parseInt(varReqEffdate.substring(3, 5), 10);
	var dyear = parseInt(varReqEffdate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || varReqEffdate.substring(2, 3)!="/" || varReqEffdate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		return false;
	}
	
	var reqDate = new Date("01/01/2005");
	
	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		return false;
	}
	
	return true;
}