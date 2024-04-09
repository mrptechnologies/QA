function AgencyPopup(mylink, windowname) {
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
				mywin = window.open(href, windowname, 'width=750, height=300, left=550, top=125, scrollbars=no');
				mywin.focus();
		 	}
		},
		onSuccess: function(transport){}});
	
	return false;
}