var tempZipCode;
var tempZipCity;
var tempCounty;
var tempStateCode;
var tempCountyCode;


function validateRequest(frm)
 {
	 if(frm.ThisState.value==""){
		 return true;
	 }

	 return true;
}
function ZipCodePopup(mylink, windowname) {
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	if (typeof(mylink) == 'string') {
		href=mylink;
	} else {
		href=mylink.href;
	}
	var objvalue=0;
 	if(document.getElementById("ownerIdfrmjsp") !=null && document.getElementById("ownerIdfrmjsp") !=undefined) {
  		objvalue=document.getElementById("ownerIdfrmjsp").value;
  	}
  	href=href+'&answer(ownerId)='+objvalue;
  	
  	var url = "../common/CheckForSessionExpired.jsp";
 	var isInvalidSession = 0;
 	autologout();
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
			isInvalidSession = forwardToLoginPageIfInvalidSession(transport.responseText);
			if(isInvalidSession == 0) {
				mywin = window.open(href, windowname, 'width=700, height=350, left=300, top=125, scrollbars=yes');
				mywin.focus();
		 	}
		},
		onSuccess: function(transport){}});
	

	return false;
}

function selectValue(radio){
	var index = parseInt(radio.value);
	var noOfFields = 7;
	//var noOfFieldsAdjFactor = 3;
	var i =  noOfFields*index;
	//i=i-noOfFieldsAdjFactor;
	
	tempZipCode=radio.form.elements[i+0].value;
	tempZipCity=radio.form.elements[i+1].value;
	tempStateCode=radio.form.elements[i+3].value;
	tempCounty=radio.form.elements[i+4].value;
	tempCountyCode=radio.form.elements[i+5].value;



	return true;

}




/* function submitToParent(frm)
 {

     window.opener.document.parentForm.Zip.value = tempZipCode;
	 window.opener.document.parentForm.City.value = tempZipCity;
     window.opener.document.parentForm.County.value = tempCounty;
     window.opener.document.parentForm.State.value = tempStateCode;
	 setTimeout( "window.close();", 10 );
	 return true;
}*/

