function AgentPopup(mylink, windowname) {
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	
	if (typeof(mylink) == 'string') {
		href = mylink;
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
				mywin = window.open(href, windowname, 'width=750, height=315, left=550, top=125, scrollbars=no');
				mywin.focus();
		 	}
		},
		onSuccess: function(transport){}});
	
	return false;
}

  
function AgentPopupQuoteSummary(){
     
     var dispParentQuoteId = document.getElementById('parentQuoteId1').value;
    // alert("dispParentQuoteId"+dispParentQuoteId)
     
	 var url = "../quote/ChangeAgencyAgentInQuoteSummary.jsp";
	 var mywin;
	 
	 parameter ="answer(parentQuoteId)="+dispParentQuoteId; 
	 url = url+"?"+parameter;
	// alert("url :: "+url)
	mywin = window.open(url,'Change_Agency_Agent','width=800, height=720, left=550, top=125, scrollbars=yes');
	mywin.focus();
	return false;
  }  
  
 