/***********************************************
* Dolphin Tabs Menu- by JavaScript Kit (www.javascriptkit.com)
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more
***********************************************/

var dolphintabs={
	subcontainers:[], last_accessed_tab:null,

	revealsubmenu:function(curtabref){
	this.hideallsubs()
	if (this.last_accessed_tab!=null)
		this.last_accessed_tab.className=""
	if (curtabref.getAttribute("rel")) //If there's a sub menu defined for this tab item, show it
	document.getElementById(curtabref.getAttribute("rel")).style.display="block"
	curtabref.className="current"
	this.last_accessed_tab=curtabref
	},

	hideallsubs:function(){
	for (var i=0; i<this.subcontainers.length; i++)
		document.getElementById(this.subcontainers[i]).style.display="none"
	},


	init:function(menuId, selectedIndex){
	var tabItems=document.getElementById(menuId).getElementsByTagName("a")
		for (var i=0; i<tabItems.length; i++){
			if (tabItems[i].getAttribute("rel"))
				this.subcontainers[this.subcontainers.length]=tabItems[i].getAttribute("rel") //store id of submenu div of tab menu item
			if (i==selectedIndex){ //if this tab item should be selected by default
				tabItems[i].className="current"
				this.revealsubmenu(tabItems[i])
			}
		tabItems[i].onmouseover=function(){		
		//dolphintabs.revealsubmenu(this)  ***commented to avoid toggling on mouse move***
		}
		} //END FOR LOOP
	}

}	  		

function showPolicySummary(headerName){
dolphintabs.init(headerName,0);
}

function showInsured(headerName){
dolphintabs.init(headerName,1);
}

function showDocuments(headerName){
dolphintabs.init(headerName,2);
}

function showApplication(headerName){
dolphintabs.init(headerName,3);
}

function showPayment(headerName){
dolphintabs.init(headerName,4);
}

function showPostBoundCheckList(headerName){
dolphintabs.init(headerName,5);
var formElement = document.forms[0];

formElement.signedNo.checked=true;
formElement.proofNo.checked=true;
formElement.applicatNo.checked=true;

}

function showEndorsements(headerName){
dolphintabs.init(headerName,7);
}

function showReinsurance(headerName){
dolphintabs.init(headerName,6);
}


function showTabs(headerName,index){
	dolphintabs.init(headerName,index);
}



/**
  * Function to set the Hidden variables for the Reinsurance Tab.
  *
  */	


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
    if(document.getElementById("CreatedByfrmjsp") !=null && document.getElementById("CreatedByfrmjsp") !=undefined) {
 	var CreatedByfrmjsp=document.getElementById("CreatedByfrmjsp").value;
 	
	 	if(frm.CreatedBy!=null && frm.CreatedBy!= undefined) {
		 	frm.CreatedBy.value=CreatedByfrmjsp;
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
			var hours = currentTime.getHours();
			var minutes = currentTime.getMinutes();
			var seconds = currentTime.getSeconds();
		 	frm.CreatedDate.value=year+'/'+month+'/'+day+'/'+hours+':'+minutes+':'+seconds;
		 }
	}
	
	/**
     * To set the User ID
     */
    if(document.getElementById("UpdatedByfrmjsp") !=null && document.getElementById("UpdatedByfrmjsp") !=undefined) {
 	var UpdatedByfrmjsp=document.getElementById("UpdatedByfrmjsp").value;
 	
	 	if(frm.UpdatedBy!=null && frm.UpdatedBy!= undefined) {
		 	frm.UpdatedBy.value=UpdatedByfrmjsp;
		}
 	}
 	
 	/**
     * To set the Updated Date
     */
    
	 if(frm.UpdatedDate!=null && frm.UpdatedDate!= undefined) {
	 	if(frm.UpdatedDate.value=="") {
		 	var currentTime = new Date();
		 	var month = currentTime.getMonth() + 1;
			var day = currentTime.getDate();
			var year = currentTime.getFullYear();
			var hours = currentTime.getHours();
			var minutes = currentTime.getMinutes();
			var seconds = currentTime.getSeconds();
		 	frm.UpdatedDate.value=year+'/'+month+'/'+day+'/'+hours+':'+minutes+':'+seconds;
		 }
	}
	
	return true;
}	









