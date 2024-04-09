
function validateFields(){



var formElement=document.forms[0];

var cbeginMM=formElement.StartMonth.value;
var cbeginDD=formElement.StartDate.value;
var cbeginYY=formElement.StartYear.value;

var cendMM=formElement.EndMonth.value;
var cendDD=formElement.EndDate.value;
var cendYY=formElement.EndYear.value;


if((cbeginMM!="")&&(cbeginDD!="")&&(cbeginYY!="")) {
formElement.contractDateStart.value=cbeginYY+"-"+cbeginMM+"-"+cbeginDD;	
}

if((cendMM!="")&&(cendDD!="")&&(cendYY!="")) {
formElement.contractDateEnd.value=cendYY+"-"+cendMM+"-"+cendDD;
}

   var formElement=document.forms[0];
	if(formElement.BusinessName.value=="")
	{
		alert("	Please enter the General Agency / Agency Name.");
		return false;
	}
	if(formElement.GeneralAgency.value=="")
	{
		alert("	Please enter the General Agency you are  Sub-producer to.");
		return false;
	}
	if((parseFloat(formElement.AgencyCommission.value)>100) || (parseFloat(formElement.AgencyCommission.value)<0))
	{
		alert("Agency Commission should be between 0-100%");
		return false;
	}
	
	/*if(formElement.AgencyCommission.value==""){
		alert("Please enter the Agency Commission");
		return false;
	}*/
	
	if(formElement.AgencyCommission.value!="" && isNaN(formElement.AgencyCommission.value)) {
		alert("Agency Commission should be numeric");
		return false;
	}
	if(formElement.State.value=="")
	{
		alert("Please enter the State Value.");
		return false;
	}
	if(formElement.Zip.value=="")
	{
		alert("Please enter the Zip Code Value.");
		return false;
	}
	
	if(formElement.State.value=="")
	{
		alert("Please enter the State Code Value.");
		return false;
	}	
	
	if(formElement.MailingAddressSameAsBusiness_Y.checked==true) {
       
	      
	     formElement.MailingAddress1.value=formElement.Address1.value;
	     formElement.MailingAddress2.value=formElement.Address2.value;
	     formElement.MailingAddress3.value=formElement.City.value + "," + formElement.State.value + "," + formElement.Zip.value + ".";
	     formElement.MailingAddress4.value = "";
	     formElement.MailingAddress5.value = "";
      }
     
     
	/**if(formElement.FirstName.value=="")
	{
		alert("Please enter the Agency First Name.");
		return false;
	}
	if(formElement.LastName.value=="")
	{
		alert("Please enter the Agency Last Name.");
		return false;
	}**/


	if(formElement.BranchName.value==""){
		alert("Please select Branch Name")
		return false;	
	}

//--------------------------------------------------------------
//Phone and Fax data validation

	if(validateNumRange(formElement.BusinessPhoneNum, 0, 99999999999, 'Business phone number ')==false)
		return false;


	if(validateNumRange(formElement.BusinessFaxNum, 0, 99999999999, 'Business fax number ')==false)
		return false;



	if(validateNumRange(formElement.HomePhoneNum, 0, 99999999999, 'Personal phone number ')==false)
		return false;


	if(validateNumRange(formElement.HomeFaxNum, 0, 99999999999, 'Personal fax number ')==false)
		return false;




//Validate email address
	if (formElement.contactEmail.value!=""){
		if(checkMail(formElement.contactEmail.value)){
		alert("Please verify your email address.");
		formElement.contactEmail.select();
		return false;
	}}

//Validate URL
if (testURL(formElement, formElement.BusinessContactUrl)==false){
	return false;
}


//--------------------------------------------------------------



	
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




// simple test for URL format
function testURL(form, Ctrl) {
	if(Ctrl.value != ""){
	if ((Ctrl.value.indexOf("http://",0) == -1) && (Ctrl.value.indexOf("www.",0) == -1)) {		
		alert("Please provide a valid URL");
		return (false);
	}} else
		return (true);
}