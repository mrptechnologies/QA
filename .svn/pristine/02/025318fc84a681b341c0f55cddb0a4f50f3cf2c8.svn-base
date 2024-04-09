function customerToRisk(){
	var formElement=document.forms[0];	

	formElement.RiskCustomerId.value 	= formElement.CustomerID.value;
	formElement.RiskName.value 			= (formElement.InsuredFName.value + " " + formElement.InsuredLName.value);
	formElement.RiskNumber.value 		= formElement.InsuredNumber.value;
	formElement.RiskStNum.value 		= formElement.StreetNumber.value;
	formElement.RiskStName.value 		= formElement.StreetName.value;
	formElement.RiskAddress2.value		= formElement.Address2.value;
	formElement.RiskCity.value 			= formElement.City.value;
	formElement.RiskState.value 		= formElement.State.value;
	formElement.RiskZip.value 			= formElement.Zip.value;
	formElement.RiskCounty.value 		= formElement.County.value;
	
}


function validateFields(){
	var formElement=document.forms[0];
	var intnum = "";
	if(formElement.InsuredNumber != null && formElement.InsuredNumber != undefined ){
		intnum = isInteger(formElement.InsuredNumber.value);
	}
	
	var intfx1 = isInteger(formElement.FaxNumber1.value);
	var intfx2 = isInteger(formElement.FaxNumber2.value);
	var intfx3 = isInteger(formElement.FaxNumber3.value);
	
if(formElement.InsuredFName.value=="")
	{
		alert("Please enter the Insured First Name");
		return false;
	}
if(formElement.InsuredLName.value=="")
	{
		alert("Please enter the Insured Last Name");
		return false;
	}
if(formElement.Address1.value=="")
	{
		alert("Please enter the Address Line 1");
		return false;
	}
if(formElement.City.value=="")
	{
		alert("Please enter the City");
		return false;
	}
if(formElement.State.value=="")
	{
		alert("Please select your state");
		return false;
	}	
if(formElement.Zip.value=="")
	{
		alert("Please enter your Zip Code");
		return false;
	}	
	
if(formElement.PhoneNumber1.value=="" && formElement.PhoneNumber2.value=="" && formElement.PhoneNumber3.value==""){
	alert("Please enter the Phone #");
	return false;
} else {
	var intph1 = isInteger(formElement.PhoneNumber1.value);
	var intph2 = isInteger(formElement.PhoneNumber2.value);
	var intph3 = isInteger(formElement.PhoneNumber3.value);
}

if(formElement.EmailAddress.value!="")
	{
	var filter  = /(([a-zA-Z0-9\-?\.?]+)@(([a-zA-Z0-9\-_]+\.)+)([a-z]{2,3})(\W?[,;]\W?(?!$))?)+$/i;
	if (!filter.test(formElement.EmailAddress.value)){
		alert("Invalid EMail address.");
		document.getElementById("EmailAddress").focus();
		return false;
	}
}
if(formElement.SponsorDate.value!="")
	{
		if(validateDate()==false) {
			return false;
		}
	}
if(!isInteger(formElement.Zip.value))
	{
		alert("Please enter a valid Zip Code");
		return false;
	}

if((!(intph1))||(!(intph2))||(!(intph3))){
	alert("Phone# should be numeric");
		return false;
	}		

if((!(intfx1))||(!(intfx2))||(!(intfx3))){
	alert("Fax# should be numeric");
		return false;
	}	
		
	customerToRisk();
	return newchecksubmitcount();	
}

function GoTOFindPLButton(){
    var formElement=document.forms[0];
    var customerid = formElement.CustomerID.value;
    var url ="../InsuredAgencyPLSearchPage.do"; 
    parameter ="formName=''&answer(Agency::NotEquals::ParentAgencyId)=-1&answer(Object::Customer::CustomerId)="+customerid; 
    url = url+"?"+parameter;
    //alert(""+url);
    //alert(""+formElement.CustomerID.value);
   	formElement.action=url
	//alert("enterted");
    formElement.submit();
	return true;
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

function validateDate(submit){
	var frm = document.forms[0];
	var vardate = frm.SponsorDate.value
	var ddate = new Date(vardate);
	if(!isDate(vardate)){
		alert("Invalid Date")
		frm.SponsorDate.select();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.SponsorDate.select();
		return false;
	}
	/*var reqDate = new Date("01/01/2005");
	
	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.txtDate.select();
		frm.txtDate.focus();
		return false;
	}

	if(submit!=null && submit=="submit") {
		if(frm.selectGroup!=null) {
			frm.selectGroup.value=0;
		}
		ProductBrowse();
	}
	if(frm.effDatefrmRequest!=null && frm.effDatefrmRequest!=undefined ){
		frm.effDatefrmRequest.value=vardate;
		//alert(frm.effDatefrmRequest.value);
	}*/
	return true;
}