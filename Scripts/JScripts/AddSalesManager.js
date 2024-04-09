function validateFields(){

	var formElement=document.forms[0];
	
	if((formElement.effmm.value!="")&&(formElement.effdd.value!="")&&(formElement.effyy.value!="")) {
formElement.EffectiveDate.value=formElement.effmm.value+"/"+formElement.effdd.value+"/"+formElement.effyy.value;
}
	
	if(formElement.FirstName.value=="")
	{
		alert("Please enter First Name.");
		return false;
	}
	if(formElement.LastName.value=="")
	{
		alert("Please enter Last Name.");
		return false;
	}
	if(formElement.Type.value=="")
	{
		alert("Please select Type.");
		return false;
	}
	

	var mobileNum1 = formElement.mobile1.value;
	var mobileNum2 = formElement.mobile2.value;
	var mobileNum3 = formElement.mobile3.value;
	if(mobileNum1+mobileNum2+mobileNum3!=""){
		formElement.MobileNumber.value = mobileNum1+""+mobileNum2+""+mobileNum3;
		
		
	}
	var username = formElement.userName;
	var password = formElement.password;
	var confirmPassword = formElement.confirmPassword;
	
	if(username!=null) { //if ever the field exists
		if(username.value != "") { // if username field is filled
			if(username.value.length<6 || password.value.length<6) {
				alert("Username and Passwords should have atleast 6 charecters.");
				return false;
			}
			
			if(password.value != confirmPassword.value) {
				alert("Password and Confirm password should be same.");
				return false;
			}
		}
	}
	
	formElement.userEmail.value=formElement.contactEmail.value;
	if(formElement.IdEntityId.value!=""){
		formElement.action="/UpdateSalesManager.do";
	}
	return newchecksubmitcount();

}

function validateDate(){
	var formElement=document.forms[0];

	
//Expiration Date
if((formElement.elements[19].value!="")&&(formElement.elements[20].value!="")&&(formElement.elements[21].value!=""))
	{
formElement.elements[22].value=formElement.elements[19].value+"/"+formElement.elements[20].value+"/"+formElement.elements[21].value;
	}
	
}
