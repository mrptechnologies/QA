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
	var ownerId = document.getElementById("ownerId");
	if(ownerId !=null && ownerId !=undefined) {
  		objvalue = document.getElementById("ownerId").value;  		
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
				mywin = window.open(href, windowname, 'width=600, height=450, left=550, top=125, scrollbars=yes');
				mywin.focus();
		 	}
		},
		onSuccess: function(transport){}});
	return false;
}

function InsuredPopup(mylink, windowname) {
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
	mywin = window.open(href, windowname, 'width=700, height=500, left=550, top=125, scrollbars=yes, resizable=0');
	mywin.focus();

	return false;
}

function selectValue(radio){
	var index = parseInt(radio.value);
	var noOfFields = 6;
	var i =  noOfFields*index;
	tempZipCode=radio.form.elements[i+1].value;
	tempZipCity=radio.form.elements[i+2].value;
	tempStateCode=radio.form.elements[i+3].value;
	tempCounty=radio.form.elements[i+4].value;
	tempCountyCode=radio.form.elements[i+5].value;
	return true;
}

function MapPopup(mylink) {

	var riskAddress1, riskAddress2, city, state, zipCode;
	var formElement=document.forms[0],href="";
	riskAddress1=formElement.riskAdd1.value;
	riskAddress2=formElement.riskAdd2.value;
	city=formElement.City.value;
	state=formElement.State.value;
	zipCode=formElement.Zip.value;		
	
 	if(riskAddress1!="") {
 			href=riskAddress1;
 	 }
    if(riskAddress2!="" && href!="")  {
    	    href=href+", "+riskAddress2;
   	   } else {
   		  href=href+riskAddress2;
   	}
    if(city!="" && href!="")    {
    	  href=href+", "+city;
    } else {
    	  href=href+city;
    }
    if(state!="" && href!="")    {
   		  href=href+", "+state;
    } else {
  		   href=href+state;
    }
    if(zipCode!="" && href!="")    {
   		  href=href+", "+zipCode;
    } else {
  		   href=href+zipCode;
    }

	href='http://www.google.com/maps?q='+href+'&amp;hl=en';
	window.open(href, "MapWindow", "width=850,height=800,left=350,top=125,resizable=1,scrollbars=yes");
}