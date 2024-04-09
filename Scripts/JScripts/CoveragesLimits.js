
	function setCoveragesDetail(){
	
	//alert("flag:"+flag)
	if(flag==0){
	//
    
 	
	 if(document.getElementById("CoveragesLimitsModified").value == 'N' && document.getElementById("CoveragesExpiringCarrier")!= undefined ){
		
		
		if(document.getElementById("CoveragesExpiringCarrier").value != null && document.getElementById("CoveragesExpiringCarrier").value !=''){
			document.getElementById("ExpiringCarrier").value = document.getElementById("CoveragesExpiringCarrier").value;
		}
		if(document.getElementById("CoveragesEffDate").value !=null && document.getElementById("CoveragesEffDate").value!=''){
			document.getElementById("EffectiveDate").value = document.getElementById("CoveragesEffDate").value;
		}
		if( document.getElementById("CoveragesExpDate").value !=null && document.getElementById("CoveragesExpDate").value != ''){
			document.getElementById("ExpirationDate").value = document.getElementById("CoveragesExpDate").value;
		}
		if(document.getElementById("RetroDate").value !=null && document.getElementById("RetroDate").value !=''){
			document.getElementById("RequestedRetroDate").value = document.getElementById("RetroDate").value;
		}
		if(document.getElementById("ExpPremium").value !=null && document.getElementById("ExpPremium").value != ''){
			document.getElementById("ExpiringPremium").value = document.getElementById("ExpPremium").value;
		 }
		 if(document.getElementById("CoveragesIncidentLimit").value !=null && document.getElementById("CoveragesIncidentLimit").value !=''){
		 
			//document.getElementById("IncidentLimit").value = document.getElementById("CoveragesIncidentLimit").value;
		 }
		 
		 if(document.getElementById("CoveragesAggregateLimit").value !=null && document.getElementById("CoveragesAggregateLimit").value !=''){

			document.getElementById("AggregateLimit").value = document.getElementById("CoveragesAggregateLimit").value;
		 }
		 
		  if(document.getElementById("CoveragesDeductible").value !=null &&  document.getElementById("CoveragesDeductible").value !=0){
		 
			document.getElementById("Deductible").value = document.getElementById("CoveragesDeductible").value;
		 }
		 if(document.getElementById("ReqCoveragesExpiring").value !=null &&  document.getElementById("ReqCoveragesExpiring").value !=0){
		 
			document.getElementById("RequestingCoverageAsExpired").value = document.getElementById("ReqCoveragesExpiring").value;
		 }
		 if(document.getElementById("RetroActivedateVaries").value !=null && document.getElementById("RetroActivedateVaries").value !=''){
			if(document.getElementById("RetroActivedateVaries").value=='Y'){
			document.getElementsByName('answer(Object::Plan::IsRetroActiveDateVaries)')[0].checked=true;
			}else {
			document.getElementsByName('answer(Object::Plan::IsRetroActiveDateVaries)')[1].checked=true;
			}
		 }
		 if(document.getElementById("DeductibleVaries").value !=null &&  document.getElementById("DeductibleVaries").value !=''){
			if(document.getElementById("DeductibleVaries").value=='Y'){
			document.getElementsByName('answer(Object::Plan::IsDeductibleVaries)')[0].checked=true;
			}else {
			document.getElementsByName('answer(Object::Plan::IsDeductibleVaries)')[1].checked=true;
			}
		 }		 		 
		 
		 			 
		 document.getElementById("CoveragesLimitsModified").value  = 'Y';
		flag = 1;
		
		if(document.getElementById("ReqCoveragesExpiring").value == 'Y'){
		 
		 	document.getElementById("ExpiringCarrier").readOnly = false;
		 	document.getElementById("EffectiveDate").readOnly = false;
		 	document.getElementById("ExpirationDate").readOnly = false;
		 	document.getElementById("RequestedRetroDate").readOnly = false;
		 	document.getElementById("ExpiringPremium").readOnly = false;
		 	
		 	
		 	
		 }
		 
	}
	}
  }

		function setCoveragesDetail2(){
		
	//alert("flag:"+flag)
	if(flag==0){
	
	 if(document.getElementById("CoveragesLimitsModified").value == 'N' && document.getElementById("CoveragesExpiringCarrier")!= undefined ){
		
		
		if(document.getElementById("CoveragesExpiringCarrier").value != null && document.getElementById("CoveragesExpiringCarrier").value !=''){
			document.getElementById("ExpiringCarrier").value = document.getElementById("CoveragesExpiringCarrier").value;
		}
		if(document.getElementById("CoveragesEffDate").value !=null && document.getElementById("CoveragesEffDate").value!=''){
			document.getElementById("EffectiveDate").value = document.getElementById("CoveragesEffDate").value;
		}
		if( document.getElementById("CoveragesExpDate").value !=null && document.getElementById("CoveragesExpDate").value != ''){
			document.getElementById("ExpirationDate").value = document.getElementById("CoveragesExpDate").value;
		}
		if(document.getElementById("RetroDate").value !=null && document.getElementById("RetroDate").value !=''){
			document.getElementById("RequestedRetroDate").value = document.getElementById("RetroDate").value;
		}
		if(document.getElementById("ExpPremium").value !=null && document.getElementById("ExpPremium").value != ''){
			document.getElementById("ExpiringPremium").value = document.getElementById("ExpPremium").value;
		 }
		

		 			 
		 document.getElementById("CoveragesLimitsModified").value  = 'Y';
		flag = 1;
		
		if(document.getElementById("ReqCoveragesExpiring").value == 'Y'){
		 
		 	document.getElementById("ExpiringCarrier").readOnly = false;
		 	document.getElementById("EffectiveDate").readOnly = false;
		 	document.getElementById("ExpirationDate").readOnly = false;
		 	document.getElementById("RequestedRetroDate").readOnly = false;
		 	document.getElementById("ExpiringPremium").readOnly = false;
		 	
		 	
		 }
		 
	}
	}
  }
  
  function setAggregateClaimsLimit(){
  	document.getElementById("UserModifiedAggLimit").value = document.getElementById("AggregateLimit").value;
  }