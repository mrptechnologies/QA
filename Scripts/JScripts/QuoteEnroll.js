
function payment(){
	if(document.PaymentMethod.Payment.value==""){
		executeApplicationRule('GET_SUB_QUESTION',new Array('214'),142,192);
	}
	else if(document.PaymentMethod.Payment.value=="ACH"){
		executeApplicationRule('GET_SUB_QUESTION',new Array('215'),142,192);
	}
	else if(document.PaymentMethod.Payment.value=="Credit Card"){
		executeApplicationRule('GET_SUB_QUESTION',new Array('216'),142,192);
	}
	else if(document.PaymentMethod.Payment.value=="Check"){
		executeApplicationRule('GET_SUB_QUESTION',new Array('217'),142,192);
	}
}

function validateCardDetails(){

var cardExpDate = document.PaymentMethod.ExpirationDate.value;
var cardType = document.PaymentMethod.CardName.value;
var cardNumber = document.PaymentMethod.CCAccountNumber.value;

validateCard(cardNumber,cardType)
validateCardDate(cardExpDate);
}


function paymentSelection(){
	if(document.PaymentMethod.Payment.value=="Check"){		
		document.PaymentMethod.InstitutionName.value=""
		document.PaymentMethod.ACHAccountNumber.value=""
		document.PaymentMethod.ABANumber.value=""
		document.PaymentMethod.CardName.value=""
		document.PaymentMethod.CCAccountNumber.value=""
		document.PaymentMethod.ExpirationDate.value=""
		document.PaymentMethod.SecurityCode.value=""
		document.PaymentMethod.CardHolderName.value=""
		document.PaymentMethod.AccountName.value=""
		
		//executeApplicationRule('GET_SUB_QUESTION',new Array('217'),142,192);		
	}
	else if(document.PaymentMethod.Payment.value=="ACH"){
		document.PaymentMethod.CardName.value=""
		document.PaymentMethod.CCAccountNumber.value=""
		document.PaymentMethod.ExpirationDate.value=""
		document.PaymentMethod.SecurityCode.value=""
		document.PaymentMethod.CardHolderName.value=""
		document.PaymentMethod.ChkNumber.value=""
		document.PaymentMethod.BankName.value=""
		document.PaymentMethod.ChkDate.value=""
		
		//executeApplicationRule('GET_SUB_QUESTION',new Array('215'),142,192);
	}
	else if(document.PaymentMethod.Payment.value=="Credit Card"){
		document.PaymentMethod.InstitutionName.value=""
		document.PaymentMethod.ACHAccountNumber.value=""
		document.PaymentMethod.ABANumber.value=""
		document.PaymentMethod.ChkNumber.value=""
		document.PaymentMethod.BankName.value=""
		document.PaymentMethod.ChkDate.value=""
		document.PaymentMethod.AccountName.value=""
		
		//executeApplicationRule('GET_SUB_QUESTION',new Array('216'),142,192);
	}
	return true;
}



function validateCardDate(vardate){

	var dat = new Date();	
	
	if(vardate==""){
		alert("Please enter a valid date");
		document.PaymentMethod.ExpirationDate.select();
		return false;
	}
	var dmonth = vardate.substring(0, 2);
	var dyear = vardate.substring(3, 5);
	
	var isValid= isInteger(dyear);
	
	if(!isValid) {	
		alert("Please enter a valid Year");
		document.PaymentMethod.ExpirationDate.select();	
		return false;
	} else {
		var fullYear = "20"+dyear;
		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.length > 5 )
		{
			alert("Please enter date in 'MM/YY' format");
			document.PaymentMethod.ExpirationDate.select();
			return false;
		} else{
			if( expired( dmonth, fullYear )){
				alert("Sorry!  The expiration date you have entered would make this card invalid.");
				document.PaymentMethod.ExpirationDate.select();
				return false;
			}
		} 
	}
	return true;	
}

function expired( month, year ) {
	var now = new Date();							// this function is designed to be Y2K compliant.
	var expiresIn = new Date(year,month,0,0,0);		// create an expired on date object with valid thru expiration date
	expiresIn.setMonth(expiresIn.getMonth()+1);		// adjust the month, to first day, hour, minute & second of expired month
	if( now.getTime() < expiresIn.getTime() ) return false;
	return true;									// then we get the miliseconds, and do a long integer comparison
}

function isInteger(data)
{   var index;
    for (index = 0; index < data.length; index++)
    {   
        // Check that current character is number.
        var c = data.charAt(index);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}


function validateCard(cardNumber,cardType) {
	if( cardNumber.length == 0 ) {						//most of these checks are self explanitory
		alert("Please enter a card number.");
		return false;				
	}
	if( cardType == "" ) {						//most of these checks are self explanitory
		alert("Please enter a card Type.");
		return false;				
	}
	for( var i = 0; i < cardNumber.length; ++i ) {		// make sure the number is all digits.. (by design)
		var c = cardNumber.charAt(i);
		if( c < '0' || c > '9' ) {
			alert("Please enter a valid card number.  Use only digits.  Do not use spaces or hyphens.");
			return false;
		}
	}
/*	var length = cardNumber.length;			//perform card specific length and prefix tests
	var firstDig = cardNumber.substring(0,1);
	var secondDig = cardNumber.substring(1,2);
	var FirstTwoDig = cardNumber.substring(0,2);
	var FirstFourDig = cardNumber.substring(0,4);
	
	if ( cardType == "American Express" ) {
		if( length != 15 && FirstTwoDig != 34 && FirstTwoDig != 37 ) {
			alert("Please enter a valid American Express Card number.");
			return false;
		}
		return true;
	} else if ( cardType == "Discover" ) {
		if( length != 16 && FirstFourDig != 6011 ) {
			alert("Please enter a valid Discover Card number.");
			return false;
		}
		return true;
	} else if ( cardType == "Master Card" ) {
		if( length != 16 && (FirstTwoDig < 51 || FirstTwoDig > 55 )) {
			alert("Please enter a valid MasterCard number.");
			return false;
		}
		return true;
	} else if ( cardType == "VISA" ) {
		if( length != 16 && length != 13 && firstDig != 4 ) {
			alert("Please enter a valid VISA Card number.");
			return false;
		}
		return true;
	} else if ( cardType == "Diners Club" ) {
		if( length != 14 && FirstTwoDig != 30 && FirstTwoDig != 36 && FirstTwoDig != 38 ) {
			alert("Please enter a valid Diners Club Card number.");
			return false;
		}
		return true;
	}
	
	} */
	
	if (cardType == "VISA") {
      // Visa: length 16, prefix 4, dashes optional.
      var re = /^4\d{3}-?\d{4}-?\d{4}-?\d{4}$/;
   } else if (cardType == "Master Card") {
      // Mastercard: length 16, prefix 51-55, dashes optional.
      var re = /^5[1-5]\d{2}-?\d{4}-?\d{4}-?\d{4}$/;
   } else if (cardType == "Discover") {
      // Discover: length 16, prefix 6011, dashes optional.
      var re = /^6011-?\d{4}-?\d{4}-?\d{4}$/;
   } else if (cardType == "American Express") {
      // American Express: length 15, prefix 34 or 37.
      var re = /^3[4,7]\d{13}$/;
   } else if (cardType == "Diners Club") {
      // Diners: length 14, prefix 30, 36, or 38.
      var re = /^3[0,6,8]\d{12}$/;
   }
   if (!re.test(cardNumber)) {
   	alert ( "Please enter a valid card Number." );
   	return false;
   }
	
	if( !mod10( cardNumber ) ) {                             		// run the check digit algorithm
		alert("Sorry!  This is not a valid credit card number.");
		return false;
	}	
	return true; // at this point card has not been proven to be invalid
}


function setElementValue(frm){
	if(document.getElementsByName("answer(RULE_OBJECT_TYPE)") != undefined && document.getElementsByName("answer(RULE_OBJECT_TYPE)") != null){
	 	var objName = document.getElementsByName("answer(RULE_OBJECT_TYPE)");
	 	alert(objName[1].value);
	 	for (var index = 0; index < objName.length; index++) {
	 		objName[index].value='MANDATORY';
	 	}
	}
	forwardAction('/Enrollment.do?', frm);
}