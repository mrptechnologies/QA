/***********************************************
* Dolphin Tabs Menu- by JavaScript Kit (www.javascriptkit.com)
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more
***********************************************/

var dolphinsubtabs={
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
		//dolphinsubtabs.revealsubmenu(this)  ***commented to avoid toggling on mouse move***
		}
		} //END FOR LOOP
	}

}			

function showProperty(formElement,applicationHeaderName){
	dolphinsubtabs.init(applicationHeaderName,0);	
}	

function showLossHistory(applicationHeaderName){
dolphinsubtabs.init(applicationHeaderName,1);	
}

function showAddlInformation(applicationHeaderName){
dolphinsubtabs.init(applicationHeaderName,2);
}

function showAddlInterests(applicationHeaderName){
dolphinsubtabs.init(applicationHeaderName,3);	
}	

function newchecksubmitcount1(){

	var formElement=document.forms[0];
	
formElement.IssuePolicySubmit.disabled = true;
	var Carrier1DeclinedMonth;
	var Carrier1DeclinedDate;
	var Carrier1DeclinedYear;

	if(formElement.Carrier1DeclinedMonth!= undefined && formElement.Carrier1DeclinedMonth != null){
	
		Carrier1DeclinedMonth = formElement.Carrier1DeclinedMonth.value;	
		Carrier1DeclinedDate  = formElement.Carrier1DeclinedDate.value;	
		Carrier1DeclinedYear  = formElement.Carrier1DeclinedYear.value;
	
		if((Carrier1DeclinedMonth!="")&&(Carrier1DeclinedDate!="")&&(Carrier1DeclinedYear!="")) {
			formElement.DeclinedDate1.value = Carrier1DeclinedMonth+"/"+Carrier1DeclinedDate+"/"+Carrier1DeclinedYear;
	
		}
		
		var Carrier2DeclinedMonth = formElement.Carrier2DeclinedMonth.value;
		var Carrier2DeclinedDate  = formElement.Carrier2DeclinedDate.value;
		var Carrier2DeclinedYear  = formElement.Carrier2DeclinedYear.value;
		
		if((Carrier2DeclinedMonth!="")&&(Carrier2DeclinedDate!="")&&(Carrier2DeclinedYear!="")) {
			formElement.DeclinedDate2.value=Carrier2DeclinedMonth+"/"+Carrier2DeclinedDate+"/"+Carrier2DeclinedYear;
		}
		
		var Carrier3DeclinedMonth = formElement.Carrier3DeclinedMonth.value;
		var Carrier3DeclinedDate  = formElement.Carrier3DeclinedDate.value;
		var Carrier3DeclinedYear  = formElement.Carrier3DeclinedYear.value;
		
		if((Carrier3DeclinedMonth!="")&&(Carrier3DeclinedDate!="")&&(Carrier3DeclinedYear!="")) {
			formElement.DeclinedDate3.value=Carrier3DeclinedMonth+"/"+Carrier3DeclinedDate+"/"+Carrier3DeclinedYear;
		}
	}
	return submit_form ( );
}