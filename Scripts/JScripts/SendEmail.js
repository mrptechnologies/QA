//=============================================================================
//				To Display the Email Pop-Up Window
//=============================================================================
function EmailPopup(mylink, windowname) {
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	if (typeof(mylink) == 'string') {
		href=mylink;
	} else {
		href=mylink.href;
	}
	
	var url = "../common/CheckForSessionExpired.jsp";
 	var isInvalidSession = 0;
 	autologout();
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
			isInvalidSession = forwardToLoginPageIfInvalidSession(transport.responseText);
			if(isInvalidSession == 0) {
				mywin = window.open(href, windowname, 'width=700, height=700, left=250, top=0, scrollbars=yes');
				mywin.focus();
		 	}
		},
		onSuccess: function(transport){}});
	
	return false;
}

//=============================================================================
//				To Display the Attachment Pop-Up Window
//=============================================================================
function AttachmentPopup(mylink, windowname) {
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	if (typeof(mylink) == 'string') {
		href=mylink;
	} else {
		href=mylink.href;
	}
	mywin = window.open(href, windowname, 'width=500, height=500, left=350, top=75, scrollbars=yes');
	mywin.focus();

	return false;
}


//====================================================================================

//=========================================================================
//						Validating the Email Address
//=========================================================================

function checkEmailAddress(address) {

	var filter  = /(([a-zA-Z0-9\-?\.?]+)@(([a-zA-Z0-9\-_]+\.)+)([a-z]{2,3})(\W?[,;]\W?(?!$))?)+$/i;
	if (filter.test(address)){
		return false;
	}else{
		return true;
	}
}

function validate(){

	if (document.getElementById("ThisTo").value ==""){
			alert("To Address is empty");
			return false;
	} else {
		var toId = document.getElementById("ThisTo").value;
		document.getElementById("ThisTo").value=toId.replace(/^\s+|\s+$/g,"");
	}
	
	if(checkEmailAddress(document.getElementById("ThisTo").value)){		
	     	alert("Invalid To address.");
	     	document.getElementById("ThisTo").focus();
	     	return false; 	
	 }	
	if((document.getElementById("ThisCc").value) != ""){
		var ccId = document.getElementById("ThisCc").value;
		document.getElementById("ThisCc").value=ccId.replace(/^\s+|\s+$/g,"");
		if(checkEmailAddress(document.getElementById("ThisCc").value)){
    	 	 alert("Invalid CC address.");
     		 document.getElementById("ThisCc").focus();
	         return false;  
	     }    
	}
	if((document.getElementById("ThisBcc").value) != ""){
		var bccId = document.getElementById("ThisBcc").value;
		document.getElementById("ThisBcc").value=bccId.replace(/^\s+|\s+$/g,"");
		if(checkEmailAddress(document.getElementById("ThisBcc").value)){
			 alert("Invalid BCC address.");
			 document.getElementById("ThisTo").focus();
			 return false;  
		}	 		
	}
	if((document.getElementById("ThisSubject").value) == ""){
		 alert("Subject is Empty!!!");
		 document.getElementById("ThisSubject").focus();
		 return false; 
	}	   	
	if((document.getElementById("editor").value) == ""){
		 alert("Message Area is Empty!!!");
		 document.getElementById("editor").focus();
		 return false;   	 
	 }						  		
}

//====================================================================================

//=========================================================================
//						Remove Attachments
//=========================================================================

function removeAttachement(attachementDiv, url, attachmentIndex)
 {
 	  var ans=confirm("Do you want to remove this Attachment?");	
 	  if(ans){
		  document.getElementById("RemoveIndex").value = attachmentIndex;	
		  document.getElementById("uploadDivFail").innerHTML="";
		  var emailForm=document.forms[0];
		  try {
		 // document.opener.autologout();
		   new Ajax.Updater(
		     attachementDiv,
		     url,
		     {
		     parameters:$(emailForm).serialize()
		     , onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(attachementDiv).innerHTML);}
		     }
		    );
		  }catch(err) {
		   txt="There was an error on this page.\n\n";
		   txt+="Error description: " + err.description + "\n\n";
		   txt+="Click OK to continue.\n\n";
		   alert(txt);
		   }
		return true
		}   
  return false;
 }