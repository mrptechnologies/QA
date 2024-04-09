function validateDate(submit){
	
	var frm = document.forms[0];
	var vardate = frm.txtDate.value;
	var ddate = new Date(vardate);
    var effdate=frm.policyEffDate.value;  
    var expdate=frm.policyExpDate.value;
    var effDate = new Date(effdate);
    var expDate = new Date(expdate);    
    var renewalFlag = "N";
    var index=frm.endorsementType.selectedIndex;

    

     if((frm.endorsementType.options[index].text == "Renewal-DP1") || (frm.endorsementType.options[index].text == "Renewal-DP3")||(frm.endorsementType.options[index].text == "Renewal-HO3")||(frm.endorsementType.options[index].text == "Renewal-HO8")||(frm.endorsementType.options[index].text == "Renewal-BR") ||(frm.endorsementType.options[index].text == "Renewal-Vacant-DP1") || (frm.endorsementType.options[index].text == "Renewal-Vacant-DP3") || (frm.endorsementType.options[index].text == "Renewal CUP") || (frm.endorsementType.options[index].text == "Storage Tank - Renewal") || (frm.endorsementType.options[index].text == "Renewal"))  {
          renewalFlag ="Y";
      }    
    
    
    if(!isDate(vardate)){
		alert("Invalid Date");
		frm.txtDate.select();
		return false;
	}
	if (vardate==""){
		alert("Please enter valid Effective Date");
		frm.txtDate.focus();
		return false;
	}
	
	
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);
    
	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
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
		frm.txtDate.select();
		return false;
	}
	
	
	if(renewalFlag == "Y"){
	
	   if(ddate < expDate) {
			alert("Please enter the valid Renewal Effective Date");
			frm.txtDate.value=frm.refQuoteStartDate2.value;
			
			//frm.txtDate.value=frm.policyEffDate.value; ;
			frm.txtDate.select();
			return false;
		}
		} else{     
	    
	   if((ddate < effDate) || (ddate > expDate)) {
			alert("Please enter  Effective date between Effective date and the Expiry Date" );
			frm.txtDate1.value=effdate;
			frm.txtDate.value=effdate;
			if(frm.refQuoteStartDate !=null && frm.refQuoteStartDate != 'undefined')
			 frm.refQuoteStartDate.value= frm.txtDate.value;
			//frm.txtDate.value=frm.policyEffDate.value; ;
			frm.txtDate.select();
			return false;
	
		}
	 }
	//if((ddate > expDate)) {
		
	//	alert("Please enter Endorsement Effective date between Effective date and the Renewal Date");
		//		frm.txtDate.value="";
		//frm.txtDate.value=frm.policyEffDate.value; ;
	//	frm.txtDate.select();
	//	return false;
	
	//}
	
	
	

	if(submit!= "" && submit=="submit") {
		if(frm.selectGroup!=null) {
			frm.selectGroup.value=0;
		}
		frm.action="../BrowseEndorsement.do";
		
	    if(renewalFlag == "Y"){	
		 	document.forms[0].refQuoteStartDate2.value =  document.forms[0].txtDate.value ; 
		
		 }else{
		     document.forms[0].refQuoteStartDate.value =  document.forms[0].txtDate.value ;
		 }   
		frm.submit();
		
	}
	     	   
	    
	return true;
}


function validateDate1(submit){
	
	
	var frm = document.forms[0];
	var vardate = frm.txtDate.value;
	var ddate = new Date(vardate);
    var effdate=frm.policyEffDate.value;  
    var expdate=frm.policyExpDate.value;
    var effDate = new Date(effdate);
    var expDate = new Date(expdate);  
    var productName = frm.productName.value;
   
    var renewalFlag = "N";
    
    if((productName == "Renewal-DP1") || (productName == "Renewal-DP3")||(productName == "Renewal-HO3")||(productName == "Renewal-HO8")||(productName == "Renewal-BR") ||(productName == "Renewal-Vacant-DP1") || (productName == "Renewal-Vacant-DP3") || (productName == "Renewal CUP") || (productName == "Storage Tank - Renewal"))  {
          renewalFlag ="Y";
         
      } 
    
   
    if(!isDate(vardate)){
		alert("Invalid Date");
		frm.txtDate.value=frm.referenceStartDate.value;
		frm.txtDate.select();
		return false;
	}
	if (vardate==""){
		alert("Please enter the Effective Date");
		frm.txtDate.focus();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);
    
	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
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
		frm.txtDate.value=frm.referenceStartDate.value;
		frm.txtDate.select();
		return false;
	}
	
	
	if(renewalFlag == "Y"){
	
	   if(ddate < expDate) {
			alert("Please enter the valid Renewal Effective Date");
			frm.txtDate.value=frm.referenceStartDate.value;
			
			//frm.txtDate.value=frm.policyEffDate.value; ;
			frm.txtDate.select();
			return false;
		}
		} else{     
	    
	   if((ddate < effDate) || (ddate > expDate)) {
			alert("Please enter  Effective date between Policy Effective date and the Expiry Date" );
			frm.txtDate.value=effdate;
			if(frm.refQuoteStartDate !=null && frm.refQuoteStartDate!='undefined'){
			 	frm.refQuoteStartDate.value= frm.txtDate.value;
			 }
			 
			//frm.txtDate.value=frm.policyEffDate.value; ;
			frm.txtDate.select();
			return false;
	
		}
	 }
	
	
	
	//if((ddate > expDate)) {
		
	//	alert("Please enter Endorsement Effective date between Effective date and the Renewal Date");
		//		frm.txtDate.value="";
		//frm.txtDate.value=frm.policyEffDate.value; ;
	//	frm.txtDate.select();
	//	return false;
	
	//}
	
	
	

	if(submit!=null && submit=="submit") {
		if(frm.selectGroup!=null) {
			frm.selectGroup.value=0;
		}
	}
	return true;
}









function getTypeInStatus()
{
	var formElement=document.forms[0];
	if(validateDate()==false) {
		return false;
	}
	formElement.action="../BrowseEndorsement.do";
	formElement.submit();
	//submitPlanName();
	return true;
}

function validateFields() {

	var formElement=document.forms[0];
	var submit ='no';
	var index=formElement.endorsementType.selectedIndex;
	if(validateDate(submit)) {
	
		if(formElement.txtDate.value=="") {
		  
		  alert("Please Enter the Effective Date");
		  return false;
		}
		
		if(formElement.endorsementType.value=="") {
		  
		  alert("Please Select the Endorsement Type");
		  return false;
		}
	
		if(formElement.endorsementStatus.value=="") {
		  
		  alert("Please Select the Endorsement Status");
		  return false;
		}
		 var formElement1 = formElement.endorsementType.options[index].text;
       
       
       if((formElement1 == "Renewal-DP1") ||(formElement1 == "Renewal-DP3")||(formElement1 == "Renewal-HO3")|| (formElement1 == "Renewal-HO8")||(formElement1 == "Renewal-BR") || (formElement1 == "Renewal-Vacant-DP1")||(formElement1 == "Renewal-Vacant-DP3")||(formElement1 == "Renewal CUP") ||(formElement1 == "Storage Tank - Renewal") || (formElement1 == "Renewal Endorsement - BTA") ){
         
			if(document.getElementById('ExpirationDate1') != null && document.getElementById('ExpirationDate1') != undefined){
				var expirationDate = document.getElementById('ExpirationDate1').value;
	  			var dmonth = parseInt(expirationDate.substring(0, 2), 10);
				var dday = parseInt(expirationDate.substring(3, 5), 10);
				var dyear = parseInt(expirationDate.substring(6, 10), 10);
				var effectiveDate = document.getElementById('txtDate1').value;
				var dmonth1 = parseInt(effectiveDate.substring(0, 2), 10);
				var dday1 = parseInt(effectiveDate.substring(3, 5), 10);
				var dyear1 = parseInt(effectiveDate.substring(6, 10), 10);
				if(dyear < dyear1){
					alert("Please enter the valid Renewal Expiration date");
					return false;	
				}
				if((dmonth < dmonth1) && (dyear==dyear1)){
					alert("Please enter the valid Renewal Expiration date");
					return false;
				}
				if((dmonth == dmonth1) && (dday<=dday1) && (dyear==dyear1)){
					alert("Please enter the valid Renewal Expiration date");
					return false;
				}
			}
		}	
	} else {
		
		return false;
	}
	formElement.SelectEndorseSubmit.disabled = true;
	return true;

}
