/**
 * For Group Functionality
 * @author gnanaguru_g@solartis.net
 */
 
 
 function validateAccount() {
 	
 	var formElement = document.forms[0];
 	var emailId = formElement.EmailId.value;
 	if(emailId!="") {
 		return validateUserAccount();
 	} else {
 		document.getElementById("ERROR_CONTAINER").innerHTML='Please Enter the Primary Contact E-Mail';
 		return false;
 	} 	 
 }
 
 function enableIndicator() {
 	document.getElementById("AJAX_INDICATOR").style.display='inline';
 }
 
 function disableIndicator() {
 	document.getElementById("AJAX_INDICATOR").style.display='none';
 }
 
/**
 * AJAX - Validation for User Account
 * @author gnanaguru_g@solartis.net
 */ 
 function validateUserAccount()
 {
 	 enableIndicator();
	 url="/validateCustomerAccount.do";	
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
	      }disableIndicator();},
       onException:function(){disableIndicator();}
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
 
 /**
  * Ajax Zip code lookup
  * @author gnanaguru_g@solartis.net
  */

function zipCodeLookup() {

	var formElement = document.forms[0];
	var zip = formElement.Zip.value;	
	var zipFromDb = formElement.zipFromDB.value;	
	
	if(formElement.County.value!="" && formElement.City.value!=""){
		//if(formElement.State.value=="OH"){
		//	formElement.State.value="Ohio";
		//}
	}
	
	if(zip != ""){
		if(zipFromDb!=zip) {	
			
			var state= formElement.State.value;
			var city = formElement.City.value;
			var county = formElement.County.value;	
			
			if(city==formElement.cityFromDB.value && county==formElement.countyFromDB.value ){
				state="";
				city="";
				county="";
			}	
	
			var url = '/statCityCountyLookup.do?answer(Object::ZipCode::Like::ZipCode)='+escape(zip)+'&answer(Object::ZipCode::Like::StateCode)='+escape(state)+
		                                        '&answer(Object::ZipCode::Like::CityName1)='+escape(city)+'&answer(Object::ZipCode::Like::County)='+escape(county);
			autologout();		                                        
			new Ajax.Request(url, {method: 'post',parameters:$(document.forms[0]).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){setZipDetail(transport);}});
		}
	}
	
	formElement.zipFromDB.value=zip;
	formElement.cityFromDB.value=formElement.City.value;
	formElement.countyFromDB.value=formElement.County.value;
}
  
function setZipDetail(transport) {

	var formElement = document.forms[0];
	var zipResponse = transport.responseText;
	var zipDetail = zipResponse.split('::');
	document.getElementById("ZIP_ERROR_CONTAINER").innerHTML=''; 
	
	/*
	 *Processing the result
	 */
	if(zipDetail[0]=='ZIP_FOUND') {
		if(zipDetail[1]=='OH') {
			formElement.State.value="OH";
			formElement.City.value=zipDetail[2];
			formElement.County.value=zipDetail[3];
				
		  	formElement.cityFromDB.value=zipDetail[2];
			formElement.countyFromDB.value=zipDetail[3];			
		}else {
			document.getElementById("ZIP_ERROR_CONTAINER").innerHTML='Entered Zip Code is not associated with Ohio.Please verify the Zip Code.';	
		}	
	} else if(zipDetail[0]=='MULTIPLE_ZIP_FOUND') {
		
		formElement.State.value='OH';
		formElement.City.value='';
		formElement.County.value='';
		formElement.cityFromDB.value="";
		formElement.countyFromDB.value="";
		document.getElementById("ZIP_ERROR_CONTAINER").innerHTML='Multiple State/City/County found for given Zip Code.';
		var mylink =window.open("../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&HomeFlag=Business&clear=yes",'Zipcode', 'width=550, height=350, left=550, top=125, scrollbars=yes');
		mylink.focus();
	} else if(zipDetail[0]=='ZIP_NOT_FOUND') {
		document.getElementById("ZIP_ERROR_CONTAINER").innerHTML='Zip- Not Found.Please verify the Zip Code';
	}
}
 
function  validataEmployer() {

	var formElement = document.getElementById("EmployerGroup");
 	var emailId = formElement.EmailId.value;
 	var sicCode = formElement.sicCode.value;
 	var count =0;
 	var error_message ="";
 	
 	if(formElement.BusinessName.value=="") {
 		//alert("Please Enter the Business Name"); 		
 		error_message=error_message+(++count)+". Business Name\n" 		
 		//formElement.BusinessName.select();
 		//return false;
 	} 	 	
 	
 	if(emailId!="") {
 		if( checkMail(emailId)) {
 			init('Please verify your business email address','Information');
 			oPanel3.show();
 			formElement.EmailId.select();
 			return false;
 		}
 	}else {
 		/*alert("Please Enter the Primary Contact E-Mail");
 		formElement.EmailId.select();
 		return false;*/ 		
 		error_message=error_message+(++count)+". Primary Contact E-Mail\n" 		
 	} 
 	
 	if(emailId!=formElement.ConfirmEmailId.value) {
 		init('Primary Contact E-Mail and Confirm Primary Contact E-Mail \n Should be the Same','Information');
 		oPanel3.show();
 		formElement.ConfirmEmailId.select();
 		return false;
 		
 	}	 	 	 	
 	
 	var zip = formElement.Zip.value;
	if(zip == "") {
		/*alert("Please Enter the Zip code");
		return false;*/		
		error_message=error_message+(++count)+". Zip\n" 		
	}
 	
 	var ph1 = formElement.PhoneNumber1.value;
 	var ph2 = formElement.PhoneNumber2.value;
 	var ph3 = formElement.PhoneNumber3.value;
 	
 	if(ph1!=""&&ph2!=""&&ph3!="") {
	 	var intph1 = isInteger(ph1);
		var intph2 = isInteger(ph2);
		var intph3 = isInteger(ph3);
		
		if((!(intph1))||(!(intph2))||(!(intph3))){
		        init('Business Phone# should be numeric','Information');
		        oPanel3.show();
			//alert("Business Phone# should be numeric");
			return false;
		}		
	}else {
		
		if(ph1==""){
			formElement.PhoneNumber1.select();
		} else if(ph2=="") {
			formElement.PhoneNumber2.select();
		} else {
			formElement.PhoneNumber3.select();
		}
		/*alert("Please Enter the Business Phone#");
		return false;*/
		error_message=error_message+(++count)+". Business Phone#\n" 		
	}
	
	var fax1 = formElement.FaxNumber1.value;
	var fax2 = formElement.FaxNumber2.value;
	var fax3 = formElement.FaxNumber3.value;
	if(fax1!="" && fax2!="" && fax3!=""){
		if((!isInteger(fax1)) || (!isInteger(fax2)) || (!isInteger(fax3))){
			init('Business Fax# should be numeric','Information');
			oPanel3.show();
			return false;
		}else{
			if(fax1==""){
				formElement.FaxNumber1.select();
			}
			else if(fax2==""){
				formElement.FaxNumber2.select();
			}
			else if(fax3==""){
				formElement.FaxNumber3.select();
			}
		}
	}
	
	if(error_message!="") {
		var msg="In order to save the Information, you need to give the valid Information for the following, \n\n";
		msg+=error_message+'\n';
		init(msg,'information');
		oPanel3.show();
		//alert(msg);
		return false;
	}
	
	if(document.getElementById("ERROR_CONTAINER").innerHTML!="") {
 		alert(document.getElementById("ERROR_CONTAINER").innerHTML);
 		return false;
 	}
 	
 	if(document.getElementById("ZIP_ERROR_CONTAINER").innerHTML=="Zip- Not Found.Please verify the Zip Code"){
 		alert("Given Zip Code is invalid.Please verify the Zip Code");
 		return false;
 	}else if(document.getElementById("ZIP_ERROR_CONTAINER").innerHTML=="Multiple State/City/County found for given Zip Code."){
 		if(zip.length != 5){
	 		alert("Given Zip Code is invalid. Please verify the Zip Code");
	 		return false;
	 	}
 	}else if(document.getElementById("ZIP_ERROR_CONTAINER").innerHTML=="Entered Zip Code is not associated with Ohio.Please verify the Zip Code."){
 		alert("Entered Zip Code is not associated with Ohio.Please verify the Zip Code.");
 		return false;
 	}
	var yearsInBusiness = formElement.YearsInBussiness.value;
	if(yearsInBusiness!=""){
		if(!isNumeric(yearsInBusiness)){
			init('Please Enter a numeric value for Number of years in business','Information');		
			oPanel3.show();
			formElement.YearsInBussiness.select();
			return false;
		}
	}
	var businessSrtDate = formElement.BusinessStartDate.value;	
	var businessSrtMonth = formElement.BusinessStartMonth.value;
	var businessSrtYear = formElement.BusinessStartYear.value;
	if(formElement.BusinessStartDate.value!="") {
		if(isNumeric(businessSrtDate) && businessSrtDate>0 && businessSrtDate<32){
			
			if(businessSrtMonth==02 && businessSrtDate<=28 && businessSrtYear%4 != 0){
				formElement.BusStartDate.value=formElement.BusinessStartYear.value+"/"+formElement.BusinessStartMonth.value+"/"+formElement.BusinessStartDate.value;
			}
			else if(businessSrtMonth==02 && businessSrtDate<=29 && businessSrtYear%4 == 0){
				formElement.BusStartDate.value=formElement.BusinessStartYear.value+"/"+formElement.BusinessStartMonth.value+"/"+formElement.BusinessStartDate.value;
			}
			else if((businessSrtMonth==01 || businessSrtMonth==03 || businessSrtMonth==05 || businessSrtMonth==07 || businessSrtMonth==08 || businessSrtMonth==10 || businessSrtMonth==12 ) && (businessSrtDate<=31)){
				formElement.BusStartDate.value=formElement.BusinessStartYear.value+"/"+formElement.BusinessStartMonth.value+"/"+formElement.BusinessStartDate.value;
			}
			else if((businessSrtMonth==04 || businessSrtMonth==06 || businessSrtMonth==09 || businessSrtMonth==11) && (businessSrtDate<=30)){
				formElement.BusStartDate.value=formElement.BusinessStartYear.value+"/"+formElement.BusinessStartMonth.value+"/"+formElement.BusinessStartDate.value;
			}
			else {
				init('Please Enter Valid Business Start Date','Information');
				oPane3.show();
		 		return false;
			}
			
		} else {
			init('Please Enter Valid Business Start Date','Information');
			oPanel3.show();
	 		return false;
		}
	} else {
		formElement.BusStartDate.value="";
	}
	
	if(!isNumeric(sicCode)){
		init('Please Enter Numeric SIC Code.','Information');
		oPanel3.show();
 		formElement.sicCode.select();
 		return false;
	}
}


/**
 * Utillity functions
 */

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

function isInteger(data)
{   
	var index;
	for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) {
      
       		if(c=="-") {
       			for(i=index+1;i < data.length;i++) {
       				
       				var e = data.charAt(i);
       				if (((e < "0") || (e > "9"))) {
       					return false;
       				}
       			}
       			break;
       			
       		} else {
  	 			return false;
  	 		}
       	 }
    }
    // All characters are numbers.
    return true;
}

function setBillingAddress(){
 	var formElement=document.forms[0];
 	if(formElement.setBillingAddressId.checked){
 		formElement.BillingAddress.value = formElement.BusinessAddress.value;
 	}
}
	
function isNumeric(s)
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