/***********************************************
* Dolphin Tabs Menu- by JavaScript Kit (www.javascriptkit.com)
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more
***********************************************/

var endorsedolphintabs={
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
		//endorsedolphintabs.revealsubmenu(this)  ***commented to avoid toggling on mouse move***
		}
		} //END FOR LOOP
	}

}			
		
	
		var flag=0;	
		function showHideEndorseHeader(){
			if(flag==0){
				//endorsedolphintabs.init("ID_OF_TAB_MENU_ITSELF", SELECTED_INDEX)
				endorsedolphintabs.init("endorseheadernav", 0)	
				flag=1;		
				document['endorseHeaderImg'].src="/Images/minus.gif";
				document.getElementById('endorse:TxtChange').innerHTML='Click here to hide detail';
			}
			else if(flag==1){
				endorsedolphintabs.hideallsubs()		
				flag=0;	
				document['endorseHeaderImg'].src="/Images/plus.gif";
				document.getElementById('endorse:TxtChange').innerHTML='Click here to show detail';
			}
		
		}
		
		
		
		