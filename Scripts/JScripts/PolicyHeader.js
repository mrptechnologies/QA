/***********************************************
* Dolphin Tabs Menu- by JavaScript Kit (www.javascriptkit.com)
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more
***********************************************/

var dolphintab={
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

	var flag=1;	
	function showHidePolicyHeader(header)
	{
		if(flag==0){
		//dolphintabs.init("ID_OF_TAB_MENU_ITSELF", SELECTED_INDEX)
		  
			dolphintab.init(header, 0)	
			
			flag=1;		
			document['policyHeaderImg'].src="../Images/minus.gif";
			document.getElementById('Policy:TxtChange').innerHTML='Click here to hide detail';
		}
		else if(flag==1){
			dolphintab.hideallsubs()		
			flag=0;	
			document['policyHeaderImg'].src="../Images/plus.gif";
			document.getElementById('Policy:TxtChange').innerHTML='Click here to show detail';
		}
			
	}	
	function showHidePolicyHeaderUI3(){
		if(document.getElementById('policyContent').style.display == 'none')
		{
			document.getElementById('policyContent').style.display='block';
			document.getElementById('policyHeader').innerHTML="- Policy";
		}else{
			document.getElementById('policyContent').style.display='none';
			document.getElementById('policyHeader').innerHTML="+ Policy";
		}
	}