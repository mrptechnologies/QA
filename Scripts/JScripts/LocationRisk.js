function getLocationList()
 {

	 url="../locationrisk/LocationListResult.jsp";	
	 panel="LOCATION_LIST_TREE";
	 autologout();
	 new Ajax.Request(url, {method: 'post',onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){document.getElementById("LOCATION_LIST_TREE").innerHTML=transport.responseText;locationTree();}});	 
 }