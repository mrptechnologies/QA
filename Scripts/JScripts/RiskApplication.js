var zipFromUI = document.Property.Zip.value;
var state=document.getElementById("custState").value;
var riskId=document.getElementsByName('answer(Object::Risk::ResProperty::ResPropertyId)')[0].value;
var sameInsAdd1=document.getElementsByName("answer(Object::Risk::ResProperty::sameInsAdress__DMS_RISK~SAME_AS_INSURED_ADDRESS)")[0];
var sameInsAdd2=document.getElementsByName("answer(Object::Risk::ResProperty::sameInsAdress__DMS_RISK~SAME_AS_INSURED_ADDRESS)")[1];
if(document.getElementById('ATTRIBUTEHEAD162')!=null && document.getElementById('ATTRIBUTEHEAD162')!= undefined) {
	if(!(state=='DE'||state=='DC'||state=='GA'||state=='MD'||state=='NJ'||state=='NC'||state=='PA'||state=='SC'||state=='VA'||state=='TX'||state=='FL')){
		document.getElementById('ATTRIBUTEHEAD162').innerHTML='';
		document.getElementById('ATTRIBUTE162').innerHTML='';
	}else if(!(riskId==-1 || riskId==0)) {		
		sameInsAdd1.disabled=true;
		sameInsAdd2.disabled=true;
		if(sameInsAdd1.checked) {
			document.Details.sameInsAdress.value='Y';
		}else {
			document.Details.sameInsAdress.value='N';
		}
	}
}else if(document.getElementById('ATTRIBUTEHEAD342')!=null && document.getElementById('ATTRIBUTEHEAD342')!= undefined) {
	if(!(state=='NJ'||state=='RI'||state=='CT'||state=='NY')){
		document.getElementById('ATTRIBUTEHEAD342').innerHTML='';
		document.getElementById('ATTRIBUTE342').innerHTML='';
	}else if(!(riskId==-1 || riskId==0)) {		
		sameInsAdd1.disabled=true;
		sameInsAdd2.disabled=true;
		if(sameInsAdd1.checked) {
			document.Details.sameInsAdress.value='Y';
		}else {
			document.Details.sameInsAdress.value='N';
		}
	}
}

function setAddress(data) {							

	if(data=='Y') {
		var formElements=document.Property;
		formElements.StreetNumber.value=document.getElementById("custStNo").value;
		formElements.StreetName.value=document.getElementById("custStName").value;
		formElements.Address2.value=document.getElementById("custAdd2").value;
		formElements.City.value=document.getElementById("custCity").value;
		formElements.State.value=document.getElementById("custState").value;
		formElements.Zip.value=document.getElementById("custZip").value;
		formElements.County.value=document.getElementById("custCounty").value;
		formElements.Zip.focus();
	}
}

function setDefault(frm){
	
    /**
     * To set the Owner ID
     */
    if(document.getElementById("ownerIdfrmjsp") !=null && document.getElementById("ownerIdfrmjsp") !=undefined) {
 	var objvalue=document.getElementById("ownerIdfrmjsp").value;
 	
	 	if(frm.OwnerId!=null && frm.OwnerId!= undefined) {
	 		//alert(frm.OwnerId);
		 	frm.OwnerId.value=objvalue;
			// alert(frm.OwnerId.value);
		}
 	}
 	/**
     * To set the User ID
     */
    if(document.getElementById("usrIdfrmjsp") !=null && document.getElementById("usrIdfrmjsp") !=undefined) {
 	var usrIdfrmjsp=document.getElementById("usrIdfrmjsp").value;
 	
	 	if(frm.CreatedBy!=null && frm.CreatedBy!= undefined) {
	 		//alert(frm.CreatedBy);
		 	frm.CreatedBy.value=usrIdfrmjsp;
			 //alert(frm.CreatedBy.value);
		}
 	}
 	
 	/**
     * To set the Created Date
     */
    
	 if(frm.CreatedDate!=null && frm.CreatedDate!= undefined) {
	 	if(frm.CreatedDate.value=="") {
		 	var currentTime = new Date();
		 	var month = currentTime.getMonth() + 1;
			var day = currentTime.getDate();
			var year = currentTime.getFullYear();
		 	frm.CreatedDate.value=year+'/'+month+'/'+day;
		 	//alert("frm.CreatedDate.value");
		 }
		//alert(frm.CreatedBy.value);
	}
	
	/**
     * To set the Address1
     */
    
	 if(frm.StreetName!=null && frm.StreetName!= undefined && frm.StreetNumber!=null && frm.StreetNumber!= undefined ) {
	        frm.Address1.value=frm.StreetNumber.value+" "+frm.StreetName.value;
	 }
	if(frm.name!='Property') {
		if(document.getElementsByName("answer(Object::Risk::ResProperty::ResPropertyId)")[0].value==-1) {
			alert('Please Update the Property Information');
			dolphintabs.init('dolphinnav', 0);
			return false;
		} else if(frm.name=='LossHistory' || frm.name=='AdditionalInterests') {
			if(document.Details.DateBuilt.value=='') {
				alert('Please Update the Details Information');
				dolphintabs.init('dolphinnav', 1);
				return false;
			}
		}		
	}	
	if(validateNewRepeatedSubApp(frm)) {
		return true;
	} else {
		return false;
	}
}