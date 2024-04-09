function validateFields(){

	var formElement=document.forms[0];	

	if(formElement.DocName.value=="")
	{
		alert("Please enter the Document Name.");
		return false;
	}
	if(formElement.DocType.value=="")
	{
		alert("Please select the Document Type.");
		return false;
	}
	
	if(formElement.DocTemplUrl.value==""){
		alert("Please enter the Document Template URL");
		return false;
	}
			
 	/**var ReleaseMonth=formElement.ReleaseMonth.value;
	var ReleaseDate=formElement.ReleaseDate.value;
	var ReleaseYear=formElement.ReleaseYear.value;
	
	if(formElement.ReleaseMonth.value=="" && formElement.ReleaseDate.value=="" && formElement.ReleaseYear.value==""){
		alert("Please enter the Release Date");
		return false;
	}

    if(formElement.ReleaseMonth.value>12 || formElement.ReleaseMonth.value==0) {
		alert("Please enter the valid Release Month");
		return false;
	}
	 if(formElement.ReleaseDate.value>31 || formElement.ReleaseDate.value==0) {
		alert("Please enter the valid Release Date");
		return false;
	}
	if(!validateYear(formElement.ReleaseYear.value)) {
		alert("Please enter the valid Release Year");
		return false;
	}
	
	var ExpirationMonth=formElement.ExpirationMonth.value;
	var ExpirationDate=formElement.ExpirationDate.value;
	var ExpirationYear=formElement.ExpirationYear.value;
	
	if(formElement.ExpirationMonth.value=="" && formElement.ExpirationDate.value=="" && formElement.ReleaseYear.value==""){
		alert("Please enter the Expiration Date");
		return false;
	}

    if(formElement.ExpirationMonth.value>12 || formElement.ExpirationMonth.value==0) {
		alert("Please enter the valid Expiration Month");
		return false;
	}
	 if(formElement.ExpirationDate.value>31 || formElement.ExpirationDate.value==0) {
		alert("Please enter the valid Expiration Date");
		return false;
	}
	if(!validateYear(formElement.ExpirationYear.value)) {
		alert("Please enter the valid Expiration Year");
		return false;
	}**/
	
	var ReleaseMM=formElement.ReleaseMonth.value;
	var ReleaseDD=formElement.ReleaseDate.value;
	var ReleaseYY=formElement.ReleaseYear.value;
	
	var ExpirationMM=formElement.ExpirationMonth.value;
	var ExpirationDD=formElement.ExpirationDate.value;
	var ExpirationYY=formElement.ExpirationYear.value;
	
	if((ReleaseMM!="")&&(ReleaseDD!="")&&(ReleaseYY!="")) {
	formElement.inpReleaseDate.value=ReleaseMM+"/"+ReleaseDD+"/"+ReleaseYY;
	}
	
	if((ExpirationMM!="")&&(ExpirationDD!="")&&(ExpirationYY!="")) {
	formElement.inpExpDate.value=ExpirationMM+"/"+ExpirationDD+"/"+ExpirationYY;
	}
	
	return true;
}

function validateYear(data) {

	var dat = new Date();
	
	var currentyear = dat.getFullYear();
	
	var year=data;
	
	if(year>currentyear || year==0) {
			
		return false;
	} else {
		
		return true;
	}
}


