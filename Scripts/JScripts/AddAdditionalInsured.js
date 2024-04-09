function showCompanyInformation(formElement){
		var nameType = formElement.CompanyPerson.value;
		var FormOfBusiness = formElement.FormOfBusiness.value;

		if(nameType == 'Person'){
			document.getElementById('FOBBlock').style.display='none'
			document.getElementById('otherFOBBlock').style.display='none'
			document.getElementById('DBABlock').style.display='none'
			if((document.getElementById('insuredFirstBlock') != 'undefined') && (document.getElementById('insuredFirstBlock') != undefined) && (document.getElementById('insuredFirstBlock') != null))
				document.getElementById('insuredFirstBlock').style.display='table-row'
			if((document.getElementById('insuredLastBlock') != 'undefined') && (document.getElementById('insuredLastBlock') != undefined) && (document.getElementById('insuredLastBlock') != null))
				document.getElementById('insuredLastBlock').style.display='table-row'
			
		}else{
			document.getElementById('FOBBlock').style.display='table-row'
			document.getElementById('DBABlock').style.display='table-row'
			if((document.getElementById('insuredFirstBlock') != 'undefined') && (document.getElementById('insuredFirstBlock') != undefined) && (document.getElementById('insuredFirstBlock') != null))
				document.getElementById('insuredFirstBlock').style.display='none'
			if((document.getElementById('insuredLastBlock') != 'undefined') && (document.getElementById('insuredLastBlock') != undefined) && (document.getElementById('insuredLastBlock') != null))
				document.getElementById('insuredLastBlock').style.display='none'
			
			if(FormOfBusiness == 'Other'){
				document.getElementById('otherFOBBlock').style.display='table-row';
			}else{
				document.getElementById('otherFOBBlock').style.display='none'
			}
		}	
	}
	
	function showOtherFOBInformation(formElement){
		var nameType = formElement.CompanyPerson.value;
		var FormOfBusiness = formElement.FormOfBusiness.value;

		if(FormOfBusiness == 'Other'){
				document.getElementById('otherFOBBlock').style.display='table-row';
		}else{
				document.getElementById('otherFOBBlock').style.display='none';
		}		
	}	
	
	function maxLengthTextArea() {
	var field = document.forms[0].OtherBusiness;
	if ( field.value.length > 240 )
  	{
  	
    	field.value = field.value.substring( 0, 240 );
    	alert( "Only 240 characters is allowed." );
    	return false;
  	}   	
  	}
  	
  	function Validate(){

  		var formElement=document.forms[0];  		
  		if(formElement.InsuredName.value=="")
		{
			alert("Please enter the Insured Name");
			formElement.InsuredName.style.background='#FFCC33';
			formElement.InsuredName.focus();
			return false;
		}
		if(formElement.AdditionalInsuredType.value=="")
		{
				alert("Please Select the Insured Type");
				fformElement.AdditionalInsuredType.style.background='#FFCC33';
				formElement.AdditionalInsuredType.focus();
				return false;
		}
  		
		if(formElement.State.value=="")
		{
			alert("Please select your state");
			formElement.State.focus();
			return false;
		}	
		if((formElement.Zip.value=="") || ((formElement.Zip.value).length)!=5 || (!isInteger(formElement.Zip.value)))
			{
				alert("Please enter your Zip Code");
				
				formElement.Zip.style.background='#FFCC33';
				formElement.Zip.focus();
				return false;
			}	
		
		if(formElement.emailID.value != ""){
			if(!checkEmailAddress(formElement)){
		     	return false; 	
	 		}
	 	}	
	 	
	 		if((!isInteger(formElement.PhoneNumber1.value)) || (!isInteger(formElement.PhoneNumber2.value)) || (!isInteger(formElement.PhoneNumber3.value)) )
			{
				alert("Please enter the Valid Phone Number");
				formElement.PhoneNumber1.style.background='#FFCC33';
				formElement.PhoneNumber1.focus();
				return false;
			}
		
		if((!isInteger(formElement.FaxNumber1.value)) || (!isInteger(formElement.FaxNumber2.value)) || (!isInteger(formElement.FaxNumber3.value)) )
			{
				alert("Please enter the Valid Fax Number");
				formElement.FaxNumber1.style.background='#FFCC33';
				formElement.FaxNumber1.focus();
				return false;
			}	
  	}
  	
  	
  	function ValidateEndorsement(){

  		var formElement=document.forms[1];  		
  		if(formElement.InsuredName.value=="")
		{
			alert("Please enter the Insured Name");
			formElement.InsuredName.style.background='#FFCC33';
			formElement.InsuredName.focus();
			return false;
		}
		if(formElement.AdditionalInsuredType.value=="")
		{
				alert("Please Select the Insured Type");
				fformElement.AdditionalInsuredType.style.background='#FFCC33';
				formElement.AdditionalInsuredType.focus();
				return false;
		}
  		
		if(formElement.State.value=="")
		{
			alert("Please select your state");
			formElement.State.focus();
			return false;
		}	
		if((formElement.Zip.value=="") || (formElement.Zip.value=="0") || (!isInteger(formElement.Zip.value)))
			{
				alert("Please enter the Valid Zip Code");
				formElement.Zip.style.background='#FFCC33';
				formElement.Zip.focus();
				return false;
			}	
		
		if(formElement.emailID.value != ""){
			if(!checkEmailAddress(formElement)){
		     	return false; 	
	 		}
	 	}	
	 	
	 	if((!isInteger(formElement.PhoneNumber1.value)) || (!isInteger(formElement.PhoneNumber2.value)) || (!isInteger(formElement.PhoneNumber3.value)) )
			{
				alert("Please enter the Valid Phone Number");
				formElement.PhoneNumber1.style.background='#FFCC33';
				formElement.PhoneNumber1.focus();
				return false;
			}
		
		if((!isInteger(formElement.FaxNumber1.value)) || (!isInteger(formElement.FaxNumber2.value)) || (!isInteger(formElement.FaxNumber3.value)) )
			{
				alert("Please enter the Valid Fax Number");
				formElement.FaxNumber1.style.background='#FFCC33';
				formElement.FaxNumber1.focus();
				return false;
			}	
  	}
  	
  	function showAdditionalyNamedInsuredCompanyInformation(formElement){
		var nameType = formElement.CompanyPerson.value;
		var FormOfBusiness = formElement.FormOfBusiness.value;
		//alert(nameType);

		if(nameType == 'Person'){
			document.getElementById('CompanywebsiteBlock').style.display='none'
			document.getElementById('FOBBlock').style.display='none'
			document.getElementById('otherFOBBlock').style.display='none'
			document.getElementById('DBABlock').style.display='none'
			document.getElementById('insuredFirstBlock').style.display='table-row'
			document.getElementById('insuredLastBlock').style.display='table-row'
			
		}else{
			//alert("test");
			document.getElementById('CompanywebsiteBlock').style.display='table-row'
			document.getElementById('FOBBlock').style.display='table-row'
			document.getElementById('DBABlock').style.display='table-row'
			document.getElementById('insuredFirstBlock').style.display='none'
			document.getElementById('insuredLastBlock').style.display='none'
			
			if(FormOfBusiness == 'Other'){
				document.getElementById('otherFOBBlock').style.display='table-row';
			}else{
				document.getElementById('otherFOBBlock').style.display='none'
			}
		}	
	}
	
	function showInsuredInformation(isNamedInsured){
		if(isNamedInsured == 'N'){
			document.getElementById('CompanywebsiteBlock').style.display='none'
			document.getElementById('CompanyFNameBlock').style.display='none'
			document.getElementById('CompanyLNameBlock').style.display='none'
			document.getElementById('CompanyTitleBlock').style.display='none'
			document.getElementById('FOBBlock').style.display='none'
			
		}else{
			document.getElementById('CompanywebsiteBlock').style.display='table-row'
			document.getElementById('CompanyFNameBlock').style.display='table-row'
			document.getElementById('CompanyLNameBlock').style.display='table-row'
			document.getElementById('CompanyTitleBlock').style.display='table-row'
			document.getElementById('FOBBlock').style.display='table-row'
		}	
	}	
	
	
	function checkEmailAddress(formElement) {
	 var address = formElement.emailID.value;
 	 var filter  = /(([a-zA-Z0-9\-?\.?]+)@(([a-zA-Z0-9\-_]+\.)+)([a-z]{2,3})(\W?[,;]\W?(?!$))?)+$/i;
	 if(address!=""){
		 if (!filter.test(address)){
		 	 alert("Invalid EmailID");
		 	 formElement.emailID.style.background='#FFCC33';
	     	 formElement.emailID.focus();	  
	      	return false;
		 }else{
		    return true;
		 }
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