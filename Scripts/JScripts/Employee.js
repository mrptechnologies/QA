     /**
 * For Employee Functionality
 * @author gnanaguru_g@solartis.net
 */
 
 
 function validateAccount() {
 	
 	var formElement = document.getElementById("addCencusFrm"); 
 	var emailId = formElement.emailId.value;
 	if(emailId!="") {
 		validateUserAccount();
 		return true;
 	} else {
 		init("Enter Valid Contact E-mail",'Information');
 		oPanel3.show()
 		return false;
 	}
 	
 
 }
 
/**
 * AJAX - Validation for User Account
 * @author gnanaguru_g@solartis.net
 */ 
 function validateUserAccount()
 {
	 url="/validateRiskAccount.do";	
	 panel="ERROR_CONTAINER";
	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){
	    	 if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
	    		forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
	      }},
       onException:function(){alert("Exception");}
	     }
	    );
	  }catch(err) {
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }	  
	
  return false;
 
 }
 
 function validateEmployee() {
 	
 	var formElement = document.getElementById("addCencusFrm"); 	
 	var emailId = formElement.emailId.value;
 	
 	if(emailId!="") {
 		if( checkMail(emailId)) {
 			init('Please verify your business email address.','Information');			
			oPanel3.show()
 			return false;
 		}
 	}else {
 		init('Enter the Contact E-Mail','Information');			
		oPanel3.show()
 		return false;
 	}
 	
 	if(formElement.ConfirmEmailId!=null && formElement.ConfirmEmailId != undefined){
		 	if(emailId!=formElement.ConfirmEmailId.value) {
		 		init('Contact E-Mail and Confirm Contact E-Mail\n Should be the Same','Information');			
				oPanel3.show();
		 		return false;
		 	}
	}
 	
 	var dmonth = parseInt(formElement.dobMonth.value, 10);
	var dday = parseInt(formElement.dobDate.value, 10);
	var dyear = parseInt(formElement.dobYear.value, 10);
	
	if ((formElement.dobMonth.value!=""||formElement.dobDate.value!=""||formElement.dobYear.value!=""))
	{
		
		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear))
		{
			init('Please enter date in MM/DD/YYYY format','Information');			
			oPanel3.show();		
			return false;
		}

		var dob = dmonth+"/"+dday+"/"+dyear;
		//using function from Common.js
		if(!isDate(dob)){
			init('Invalid Date','Information');			
			oPanel3.show();
			return false;
		}
	}//else {	
		// Code to calculate the year of birth from the age entered,if the user doesn't enter DOB.	
	//	if(formElement.styleAge!=null && formElement.styleAge!= undefined) {
	//		if(formElement.styleAge.value!=""){
	//			var Age=formElement.styleAge.value;
	//			var dtNow = new Date();
	//			var yearNow = dtNow.getFullYear();
	//			var Yob=yearNow-Age;
				//formElement.dobMonth.value="01";
				///formElement.dobDate.value="01";
				//formElement.dobYear.value=Yob;
	//		} 
	//	}else {
	//	   formElement.styleAge.value = 0;
		//	init('Please Enter the valid DOB','Information');			
		//	oPanel3.show();
		//	return false;
	//	}				
	//}
	if(formElement.dobMonth.value!="" && formElement.dobDate.value!="" && formElement.dobYear.value){
		calculateAge();
	if(formElement.styleAge.value!="") {
		if(!(isInteger(formElement.styleAge.value))){
		init('Please enter a numeric value for age','Information');			
		oPanel3.show();
		//formElement.styleAge.select();
		return false;
	} if((formElement.styleAge.value <15) || (formElement.styleAge.value>98))
		{
		init('Age should be between 15 and 99 years!','Information');			
		oPanel3.show();
		//formElement.styleAge.value="";
		formElement.dobMonth.value="";
		formElement.dobDate.value="";
		formElement.dobYear.value="";
		//formElement.styleAge.focus();
		return false;
		}
	}
	}
	
	
	if(formElement.ssn1!=null && formElement.ssn1!=undefined){
		var xxx=formElement.ssn1.value;
		var xx=formElement.ssn2.value;
		var xxxx=formElement.ssn3.value;
		formElement.ssn1ss2ss3.value=xxx+xx+xxxx;
	}
	
	if(document.getElementById("ERROR_CONTAINER")!=null && document.getElementById("ERROR_CONTAINER")!=undefined){
		if(document.getElementById("ERROR_CONTAINER").innerHTML!="") {
	 		alert(document.getElementById("ERROR_CONTAINER").innerHTML);
	 		return false;
	 	}
	 }
	 
	 return true;
 }
 
 
 function checkMail(emailStr)
{
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(emailStr))
	{
		return false;
	}
	else
	{
		return true;
	}
}	

function calculateAge(){
  var formElement = document.getElementById("addCencusFrm"); 	
  var myMonth = formElement.dobMonth.value;
  var myDate = formElement.dobDate.value;
  var myYear = formElement.dobYear.value;
 
var age;
var now = new Date();
var todayDate = now.getDate();
var todayMonth = now.getMonth()+1;
var todayYear = now.getFullYear();
if(myDate <= todayDate)
{
if(myMonth <= todayMonth){
age = todayYear-myYear;}
else if(myMonth>todayMonth){
age = todayYear - myYear-1;}
}
else if(myDate > todayDate)
{
if(myMonth < todayMonth){
age = todayYear - myYear -1;}
else{
age = todayYear - myYear -1;
}}
 formElement.styleAge.value = age;
 return true;

}