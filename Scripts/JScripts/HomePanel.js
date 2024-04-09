
function getXBrowserID( sID ){
	var element = null;
	
	if ( document.getElementById ) { element = document.getElementById( sID ); }
	else if ( document.layers ) { element = document.layers[sID]; }
	else if ( document.all ) { element = document.all[sID]; }
	
	return element;
}

function switchContent( sID1, sState1, sID2, sState2, sID3, sState3 ){

	var oElement1 = null;
	oElement1 = getXBrowserID ( sID1 );
	oElement1.style.display = sState1;

	var oElement2 = null;
	oElement2 = getXBrowserID ( sID2 );
	oElement2.style.display = sState2;

	var oElement3 = null;
	oElement3 = getXBrowserID ( sID3 );
	oElement3.style.display = sState3;

	return null;
}

function pageWidth() {
	return window.innerWidth != null? window.innerWidth: document.documentElement && document.documentElement.clientWidth ? document.documentElement.clientWidth:document.body != null? document.body.clientWidth:null;
}

function pageHeight() {
	return window.innerHeight != null? window.innerHeight: document.documentElement && document.documentElement.clientHeight ? document.documentElement.clientHeight:document.body != null? document.body.clientHeight:null;
}

function adjustPageWidth() {

	var nXWidth = pageWidth();
	var oXPage = null;
	var oXColumn1 = null;
	var oXColumn2 = null;
	var oXColumn3 = null;

	/* Draw for 800x600 Minimum */
	if ( nXWidth < 800 ) {
		nXWidth = 800;
	}

	var nEdgeWidth = 10;
	var nSidebarWidth = 26;
	var nSpace = 2;
	var nWidth = nXWidth - nSidebarWidth - ( 1 * nEdgeWidth );
	var nColumnWidth = Math.round(nWidth / 2) - nSpace;

	oXPage = getXBrowserID( "startPage" );
	oXColumn1 = getXBrowserID( "pageColumn1" );
	oXColumn2 = getXBrowserID( "pageColumn2" );
	oXColumn3 = getXBrowserID( "pageColumn3" );
	
	if(oXPage!=null && oXPage!=undefined){
		oXPage.style.width = ( nWidth ) + "px";
		if( oXColumn1 != null) oXColumn1.style.width = ( nColumnWidth ) + "px";
		if( oXColumn2 != null) oXColumn2.style.width = ( nColumnWidth ) + "px";
		if( oXColumn3 != null) oXColumn3.style.width = ( nColumnWidth ) + "px";
	}

	return null;
}

function getSearchEndDate(period) {
	var searchEndDate = "";
	if(period>=0) {	
		var now = new Date();
		var curMonth = now.getMonth()+1;
		var curDate = now.getDate();      
		var curYear = now.getFullYear(); 
		var endMonth = null;
   		var endDate = null;
   		var endYear = null; 
		if(period==30) {
			if((curMonth-1)==1 || (curMonth-1)==3 || (curMonth-1)==5 || (curMonth-1)==7 || (curMonth-1)==8 || (curMonth-1)==10) {
				endDate=31;
				endMonth=curMonth-1;
				endYear=curYear;
			}
			else if((curMonth-1)==4 || (curMonth-1)==6 || (curMonth-1)==9 || (curMonth-1)==11) {
				endDate=30;
				endMonth=curMonth-1;
				endYear=curYear;
			}
			else if((curMonth-1)==0) {
   				endDate = 31;
   				endMonth = 12;
   				endYear = curYear-1;
   			}
   			else if((curMonth-1)==2) {
   				endMonth = 2;
   				endYear = curYear;
   				if(curYear%4==0) {
   					endDate = 29;
   				} else {
   					endDate = 28;
   				} 						
   			}
   			searchEndDate = endYear+"-"+endMonth+"-"+endDate;
		} else {
			searchEndDate = curYear+"-"+curMonth+"-"+curDate;
		}
	}
	return searchEndDate;
}

function getSearchStartDate(period) {
	var searchStartDate = "";
	if(period>=0) { 
        var now = new Date();
        var curMonth = now.getMonth()+1;
        var curDate = now.getDate();      
   		var curYear = now.getFullYear();
   		var searchEndDate = curYear+"-"+curMonth+"-"+curDate; 
   		var startMonth = null;
   		var startDate = null;
   		var startYear = null;   			
   		if(period==0) {
   			searchStartDate = searchEndDate;
   		}   		
   		if((period==7 && curDate>7) || (period==14 && curDate>14)) {   			
   			startDate = curDate-(period-1);
   			startMonth = curMonth;
   			startYear = curYear;
   			searchStartDate = startYear+"-"+startMonth+"-"+startDate;   		        	
        }
        if((period==7 && curDate<=7) || (period==14 && curDate<=14)){   				
   			if((curMonth-1)==1 || (curMonth-1)==3 || (curMonth-1)==5 || (curMonth-1)==7 || (curMonth-1)==8 || (curMonth-1)==10) {
   				var temp = (period-1)-curDate;   			
   				if(temp<0){temp=0}
   				startDate = 31-(temp);
   				startMonth = curMonth-1;
   				startYear = curYear;
   			}
   			else if((curMonth-1)==4 || (curMonth-1)==6 || (curMonth-1)==9 || (curMonth-1)==11) {
   				startDate = 30-((period-1)-curDate);
   				startMonth = curMonth-1;
   				startYear = curYear;
   			}
   			else if((curMonth-1)==0) {
   				var temp = (period-1)-curDate;   			
   				if(temp<0){temp=0}
   				startDate = 31-(temp);
   				startMonth = 12;
   				startYear = curYear-1;
   			}
   			else if((curMonth-1)==2) {
   				startMonth = curMonth-1;
   				startYear = curYear;
   				if(curYear%4==0) {
   					startDate = 29-((period-1)-curDate);
   				} else {
   					startDate = 28-((period-1)-curDate);
   				  } 						
   			}
   			searchStartDate = startYear+"-"+startMonth+"-"+startDate;   				  								  		        	
        } 
        if(period==30) {
   			startDate = 1;
   			if(curMonth==1) {
   				startMonth = 12;
   				startYear = curYear-1;
   			} else {
   				startMonth = curMonth-1;
   				startYear = curYear;
   			  } 
   			searchStartDate = startYear+"-"+startMonth+"-"+startDate; 				
   		}      
    } 
	return searchStartDate;
}
