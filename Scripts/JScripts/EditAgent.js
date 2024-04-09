

function setHomeAddress(box){
	var frm = box.form;
	if(box.checked) {
		frm.homeAddress1.value = frm.busAddress1.value;
		frm.homeAddress2.value = frm.busAddress2.value;
		frm.HomeCity.value = frm.City.value;
		frm.HomeState.value = frm.State.value;
		frm.homeCountryUS.checked = frm.busCountryUS.checked;
		frm.homeCountryCA.checked = frm.busCountryCA.checked;
		frm.HomeZip.value = frm.Zip.value;
		frm.HomePhoneNum.value = frm.BusinessPhoneNum.value;
		frm.HomeFaxNum.value = frm.BusinessFaxNum.value;
		frm.HomeEmail.value = frm.BusinessEmail.value;
	}
}

function GoTOFindButton(){
	if (newchecksubmitcount())
	{
		var formElement=document.forms[0];
		formElement.action="../AgencyForEditAgentSearchPage.do?formName=''";
		formElement.submit();
		return true;
	}
	return false;
  }

var tempAgencyName;
var tempAgencyId;

function AgencyPopup(mylink, windowname) {
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	if (typeof(mylink) == 'string') {
		href=mylink;
	} else {
		href=mylink.href;
	}
	//alert(href);
	mywin = window.open(href, windowname, 'width=400, height=260, left=400, top=150, scrollbars=yes');
	mywin.focus();

	return false;
}

function selectValue(radio){
	var formElement=document.forms[1];
	var index = parseInt(radio.value);
	var noOfFields = 3;
	var i =  noOfFields*index;
	tempAgencyId=formElement.elements[i+1].value;
	tempAgencyName=formElement.elements[i+2].value;
	return true;

}

//---------------------Validation added on 20070221

function validateFields(frm){
	var formElement=document.forms[0];

// Validae First Name and last Name	
	var field = document.forms[0].firstName;
	if (field.value=="")
	{
		alert("First Name cannot be left empty.");
		field.focus();
		return false;
	}
	/*field = document.forms[0].lastName;
	if (field.value=="")
	{
		alert("Last Name cannot be left empty.");
		field.focus();
		return false;
	}*/




//Business Zip Validation
	if(validateNumRange(formElement.Zip, 1, 9999999999, 'Business Zip ')==false)
		return false;

//Phone and Fax data validation


	if(ValidatePhone(formElement.BusinessPhoneNum,"Business phone number")==false)
		return false;


	if(ValidatePhone(formElement.BusinessFaxNum,"Business fax number")==false)
		return false;

//Home Zip Validation
	if(validateNumRange(formElement.HomeZip, 1, 9999999999, 'Home Zip ')==false)
		return false;


	if(ValidatePhone(formElement.HomePhoneNum,"Personal phone number")==false)
		return false;


	if(ValidatePhone(formElement.HomeFaxNum,"Personal fax number")==false)
		return false;




//Validate Business email address
	if (formElement.BusinessEmail.value!=""){
		if(checkMail(formElement.BusinessEmail.value)){
			alert("Please verify your business email address.");
			formElement.BusinessEmail.select();
			return false;
		}
	}


//Validate email address
	if (formElement.HomeEmail.value!=""){
		if(checkMail(formElement.HomeEmail.value)){
			alert("Please verify your personal email address.");
			formElement.HomeEmail.select();
			return false;
		}
	}
	(frm.BusinessEmail.value!="" )?(frm.userEmail.value = frm.BusinessEmail.value):(frm.userEmail.value = frm.HomeEmail.value);
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


















// Declaring required variables
var digits = "0123456789";
// non-digit characters which are allowed in phone numbers
var phoneNumberDelimiters = "()- ";
// characters which are allowed in international phone numbers
// (a leading + is OK)
var validWorldPhoneChars = phoneNumberDelimiters + "+";
// Minimum no of digits in an international phone no.
var minDigitsInIPhoneNumber = 11;

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

function stripCharsInBag(s, bag)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function checkInternationalPhone(strPhone){
s=stripCharsInBag(strPhone,validWorldPhoneChars);
return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
}

function ValidatePhone(Phone,Message){
	var Phone=Phone;
	
	if ((Phone.value!=null) && (Phone.value!="") && (Phone.value!="0")){
		if (checkInternationalPhone(Phone.value)==false){
			alert("Please Enter a Valid "+Message);
			Phone.value="";
			Phone.focus();
			return false;
		}
	}
	return true;
 }