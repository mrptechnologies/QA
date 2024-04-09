/**
 * JavaScript - Validation rules for PaymentPlan
 * @author vijayakumar_k@solartis.net
 */ 



function validatePaymentDate(date){
		
		var vardate = date;
		var dmonth = parseInt(vardate.substring(0, 2), 10);
		var dday = parseInt(vardate.substring(3, 5), 10);
		var dyear = parseInt(vardate.substring(6, 10), 10);
		
		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/" || dyear < 1990 || dyear > 2100 )
		{	
			return false;
		}
		if ((dmonth==2||dmonth==4||dmonth==6||dmonth==9||dmonth==11) && (dday > 30)){
			return false;
		}
		if ((dyear%4)!=0 && dmonth==2 && dday > 28){
			return false;
		}
		if ((dyear%4)==0 && dmonth==2 && dday > 28){
			return false;
		}
	return true;
}
	function validateDateForPolicyPeriod(date,startDate,endDate){
	
		var myDate = Date.parse(date);
		var myStartDate = Date.parse(startDate);
		var myEndDate = Date.parse(endDate);
		
		
		if ((myStartDate <= myDate) && (myDate < myEndDate)) {
		    return true;   
		}
	    return false;
	}
	
	function isPaymentAmount(data){
	    
		 var len=data.length;
		 if (len>0)
		 {
		  for (index = len-1; index >-1; index--)
		     {  
		       var c = data.charAt(index);
		      	
		        if(c!=1 && c!=2 && c!=3 && c!=4 && c!=5 && c!=6 && c!=7 && c!=8 && c!=9 && c!=0 && c!="." && c!="-")
		         {          
		            return false;
		         }      
		     }
		     return true;
		 }
	}
	
	
	function validateSubmit(){
 			
 		var totalFeeAmount = 0;
 		var totalInstallmentAmount = 0;
 		var totalPremium = 0;
 		var  length = document.forms[0].InstallmentPremium.length;;
        var count = document.forms[0].Count.value;
       		
 		if (validateFields()){
 		
   	    if(count==1){
   	    	totalPremium = parseFloat(document.forms[0].InstallmentPremium.value);
   	    }else{		
 			for( var i = 0;i<length; i++){
 				totalPremium = totalPremium + parseFloat(document.forms[0].InstallmentPremium[i].value);
 			} 
        }
 		if(Math.round(totalPremium) == Math.round(document.forms[0].TotalInstallmentPayment.value)){
 			if(count==1){
 				document.forms[0].TotalInstallmentPremium.value = parseFloat(document.forms[0].InstallmentPremium.value) + parseFloat(document.forms[0].InstallmentFee.value) ;
 				totalFeeAmount = parseFloat(document.forms[0].InstallmentFee.value);
 				totalInstallmentAmount =  parseFloat(document.forms[0].TotalInstallmentPremium.value);
 			}else{
 			for( var i = 0;i<length; i++){
 				document.forms[0].TotalInstallmentPremium[i].value = parseFloat(document.forms[0].InstallmentPremium[i].value) + parseFloat(document.forms[0].InstallmentFee[i].value) ;
 				totalFeeAmount = totalFeeAmount + parseFloat(document.forms[0].InstallmentFee[i].value);
 				totalInstallmentAmount = totalInstallmentAmount + parseFloat(document.forms[0].TotalInstallmentPremium[i].value);
			} 
		    }
			document.forms[0].TotalInstallmentFee.value = totalFeeAmount;
			document.forms[0].TotalInstallmentAmount.value = Math.round(totalInstallmentAmount);
			
			var ans = window.confirm("Are you sure  need to proceed");
						
				if(ans)
				{
			     	return true;
				}else
				{
			 	 	return false;
				}
				
 		}else{
 			alert("Total Installment Premium is not equal");
 			if(count==1){
 			document.forms[0].InstallmentPremium.value = document.forms[0].TotalInstallmentPremium.value - parseFloat(document.forms[0].InstallmentFee.value);
 			}else{
 			for( var i = 0;i<length; i++){
       			document.forms[0].InstallmentPremium[i].value = document.forms[0].TotalInstallmentPremium[i].value - parseFloat(document.forms[0].InstallmentFee[i].value);
    		}
    		}
    		return false;
 		}
 		
 		}else{
 		if(count==1){
 			document.forms[0].InstallmentPremium.value = document.forms[0].TotalInstallmentPremium.value - parseFloat(document.forms[0].InstallmentFee.value);
 		}else{
 		for( var i = 0;i<length; i++){
       		document.forms[0].InstallmentPremium[i].value = document.forms[0].TotalInstallmentPremium[i].value - parseFloat(document.forms[0].InstallmentFee[i].value);
   		}
   		}
 		return false;
 		}
	}
	
	function validateFields(){
		
	var formElement=document.forms[0];
	var  length = document.forms[0].InstallmentPremium.length;
	var count = document.forms[0].Count.value;
	
	if(count==1){
		if(formElement.InstallmentPremium.value=="")
		{
			alert("Installment Premium should not be empty");
			return false;
		}
		if(formElement.InstallmentFee.value=="")
		{
			alert("Installment Fee should not be empty");
			return false;
		}
		if(formElement.DueDate.value=="")
		{
			alert("DueDate should not be empty");
			return false;
		}
		if(!isPaymentAmount(formElement.InstallmentPremium.value)){
			alert("Numeric Field Should not Allow Alphabets");
			return false;
		}
		if(!isPaymentAmount(formElement.InstallmentFee.value)){
			alert("Numeric Field Should not Allow Alphabets ");
			return false;
		}
		if(!validatePaymentDate(formElement.DueDate.value)){
			alert("Invalid Date");
			return false;
		}
		if(!validateDateForPolicyPeriod(formElement.DueDate.value,formElement.QuoteEffDate.value,formElement.QuoteExpDate.value)){
			alert("Invalid Date for the policy period");
			return false;
		}
		if(formElement.InstallmentFee.value!="")
		{
			if(formElement.InstallmentFee.value.length !=0){	
				var installmentFeeValue = formElement.InstallmentFee.value.split('.');
				if(installmentFeeValue[0].length>6 || installmentFeeValue[1].length>4){
					alert("Installment Fee  should be less than or equal to xxxxxx.xxxx");
					return false;
				}
			}
		}
	}else{	
	    for( var i = 0;i<length; i++){
	    
		if(formElement.InstallmentPremium[i].value=="")
		{
			alert("Installment Premium should not be empty");
			return false;
		}
		if(formElement.InstallmentFee[i].value=="")
		{
			alert("Installment Fee should not be empty");
			return false;
		}
		if(formElement.DueDate[i].value=="")
		{
			alert("DueDate should not be empty");
			return false;
		}
		if(!isPaymentAmount(formElement.InstallmentPremium[i].value)){
			alert("Numeric Field Should not Allow Alphabets");
			return false;
		}
		if(!isPaymentAmount(formElement.InstallmentFee[i].value)){
			alert("Numeric Field Should not Allow Alphabets ");
			return false;
		}
		if(!validatePaymentDate(formElement.DueDate[i].value)){
			alert("Invalid Date");
			return false;
		}
		if(!validateDateForPolicyPeriod(formElement.DueDate[i].value,formElement.QuoteEffDate.value,formElement.QuoteExpDate.value)){
			alert("Invalid Date for the policy period");
			return false;
		}
		if(formElement.InstallmentFee[i].value!="")
				{
					if(formElement.InstallmentFee[i].value.length !=0){	
						var installmentFeeValue = formElement.InstallmentFee[i].value.split('.');
						if(installmentFeeValue[0].length>6 || installmentFeeValue[1].length>4){
							alert("Installment Fee  should be less than or equal to xxxxxx.xxxx");
							return false;
						}
					}
				}			
		}
	}	
	return true;
	}
	
	
	function validate(){
		
		var totalFeeAmount = 0;
 		var totalInstallmentAmount = 0;
 		var  length = document.forms[0].InstallmentPremium.length;
	    var count = document.forms[0].Count.value;	
	     
		if (validateFields()){	
		if(count==1){
 				document.forms[0].TotalInstallmentPremium.value = parseFloat(document.forms[0].InstallmentPremium.value) + parseFloat(document.forms[0].InstallmentFee.value) ;
 				totalFeeAmount = parseFloat(document.forms[0].InstallmentFee.value);
 				totalInstallmentAmount =  parseFloat(document.forms[0].TotalInstallmentPremium.value);
 		}else{
 		for( var i = 0;i<length; i++){
				document.forms[0].TotalInstallmentPremium[i].value = parseFloat(document.forms[0].InstallmentPremium[i].value) + parseFloat(document.forms[0].InstallmentFee[i].value) ;
 				totalFeeAmount = totalFeeAmount + parseFloat(document.forms[0].InstallmentFee[i].value);
 				totalInstallmentAmount = totalInstallmentAmount + parseFloat(document.forms[0].TotalInstallmentPremium[i].value);
		} 
		}
		document.forms[0].TotalInstallmentFee.value = totalFeeAmount;
		document.forms[0].TotalInstallmentAmount.value = totalInstallmentAmount;
		}else{
		if(count==1){
				document.forms[0].InstallmentFee.value = document.forms[0].TotalInstallmentPremium.value - parseFloat(document.forms[0].InstallmentPremium.value);
		}else{
		for( var i = 0;i<length; i++){
       			document.forms[0].InstallmentFee[i].value = document.forms[0].TotalInstallmentPremium[i].value - parseFloat(document.forms[0].InstallmentPremium[i].value);
   		}
		}
		}
		return false;
	}
	
	
	function paymentTransactionSubmit(){
     
	var formElement=document.forms[1];
	
	if(formElement.paymentDate.value=="")
		{
			alert("PaymentDate should not be empty");
			return false;
		}
	if(!validatePaymentDate(formElement.paymentDate.value)){
			alert("Invalid Date");
			return false;
		}
	if(formElement.paymentAmount.value=="" || formElement.paymentAmount.value==0)
		{
			alert("Payment Amount should not be empty or zero");
			return false;
		}	
	if(!isPaymentAmount(formElement.paymentAmount.value)){
			alert("Numeric Field Should not Allow Alphabets");
			return false;
		}
		var ans = window.confirm("Are you sure  need to proceed");
						
				if(ans)
				{
			     	return true;
				}else
				{
			 	 	return false;
				}
	}
	