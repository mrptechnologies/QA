
function GoTOFindButton()
{

var formElement=document.forms[0];

var startMM=formElement.startMonth.value;
var startDD=formElement.startDay.value;
var startYY=formElement.startYear.value;
var endMM=formElement.endMonth.value;
var endDD=formElement.endDay.value;
var endYY=formElement.endYear.value;
var batchId = formElement.batchLogId.value;

 //To store the number of days for each month
 var monthLength = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

if(isNaN(startMM)){
		alert("should be numeric.");
		document.forms[0].startMonth.focus()
        return false
 }
 if(isNaN(startDD)){
		alert("should be numeric.");
		document.forms[0].startDay.focus()
		return false;
 }
 if(isNaN(startYY)){
		alert("should be numeric.");
		document.forms[0].startYear.focus()
		return false;
 }
 if(isNaN(endMM)){
		alert("should be numeric.");
		document.forms[0].endMonth.focus()
		return false;
 }
 if(isNaN(endDD)){
		alert("should be numeric.");
		document.forms[0].endDay.focus()
		return false;
 }
 if(isNaN(endYY)){
		alert("should be numeric.");
		document.forms[0].endYear.focus()
		return false;
 }
 
 if(isNaN(batchId)){
		alert("should be numeric.");
		document.forms[0].batchLogId.focus()
		return false;
 }
 if(startYY!="" && startYY<999){
        alert("year should be >999");
       	document.forms[0].startYear.focus()
		return false;
 }
  //Entered year is leap year then february month can have 29 days
 if (startYY!="" && startYY % 4 == 0) {
    monthLength[1] = 29;
 }
 if (startYY!="" && startYY % 4 != 0) {
    monthLength[1] = 28;
 }
 if(startMM!="" && startMM < 1 || startMM > 12){
	alert("month should be 1-12");
	document.forms[0].startMonth.focus()
	return false;
 }
 
 if(startDD!="" && startDD < 1 || startDD > monthLength[startMM-1]){
	alert("Enter Correct Day");
	document.forms[0].startDay.focus()
	return false;
 }	
 if(endYY!="" && endYY<999){
        alert("year should be >999");
       	document.forms[0].endYear.focus()
		return false;
 }
  //Entered year is leap year then february month can have 29 days
 if (endYY!="" && endYY % 4 == 0) {
    monthLength[1] = 29;
 }
 if (endYY!="" && endYY % 4 != 0) {
    monthLength[1] = 28;
 }
 if(endMM!="" && endMM < 1 || endMM > 12){
	alert("month should be 1-12");
	document.forms[0].endMonth.focus()
	return false;
 }
 if(endDD!="" && endDD < 1 || endDD > monthLength[endMM-1]){
	alert("Enter Correct Day");
	document.forms[0].endDay.focus()
	return false;
 }	
 if((startMM!="")&&(startDD!="")&&(startYY!="")) {
   formElement.requestedStartDate.value=startYY+"-"+startMM+"-"+startDD;
 }

 if((endMM!="")&&(endDD!="")&&(endYY!="")) {
   formElement.requestedEndDate.value=endYY+"-"+endMM+"-"+endDD;
 }
  return true;
}
function listBatchLogDetails(dataSourceURL) {
	 autologout();
	 YAHOO.example.DynamicData = function() { 
	 		document.getElementById("DivTotalRecords").innerHTML="Number of Records Found : 0";			  		  
			var isNoofRecordsDisplayed=true;				  		  
		    var formatLink = function(elCell, oRecord, oColumn, sData) {	
		    var url = oRecord.getData("ResponseXML");
		    var link= "<a href='javascript:void(0);' onClick='javascript:window.open(\"../"+url+"\")'>View Xml</a>";
	    	if(isNoofRecordsDisplayed==true){
				 var TotalRecords = oRecord.getData("TotalRecords");
				 document.getElementById("DivTotalRecords").innerHTML="Number of Records Found : "+TotalRecords;
			 isNoofRecordsDisplayed=false;
			}
		 	 elCell.innerHTML =link;
		   }
		    var formatBatchIdLink = function(elCell, oRecord, oColumn, sData) {	
			var link= "<a href='../FindDataFeedTransactionDetails.do?answer(Object::BatchLog::Like::BatchLogId)="+
						oRecord.getData("BatchLogId")+"'>"
						+ oRecord.getData("BatchLogId") + "</a>";
			 elCell.innerHTML =link;
			}
		   // Column definitions 
		    var myColumnDefs = [ // sortable:true enables sorting 
		        {key:"SNo", label:"SNo", sortable:false,resizable:"false",width:25}, 
		        {key:"BatchLogId", label:"Batch Log #",formatter:formatBatchIdLink,sortable:true,resizable:"false",width:70}, 
		        {key:"TransactionType", label:"Transaction Type",sortable:true,resizable:"false",width:97}, 
		        {key:"ProductCode", label:"Product Code", sortable:true,resizable:"false",width:80}, 
	      		{key:"TotalRecordsinBatch", label:"Total Records", sortable:true,resizable:"false",width:80},
		        {key:"TotalPremiumForBatch", label:"Total Premium", sortable:true,resizable:"false",width:80},
	   	        {key:"SendURL", label:"Send URL", sortable:true,resizable:"false",width:270},
	   	        {key:"ResponseXML", label:"Response XML", formatter:formatLink, sortable:false,resizable:"false",width:75}
		    ]; 

		    // Custom parser 
		    var stringToDate = function(sData) { 
		        var array = sData.split("-"); 
		        return new Date(array[1] + " " + array[0] + ", " + array[2]); 
		    };

		    var myDataSource = new YAHOO.util.DataSource(dataSourceURL); 
		    myDataSource.connMethodPost=true;
		    myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON; 
		    myDataSource.responseSchema = { 
		        resultsList: "records", 
		        fields: [ 
		            {key:"SNo", parser:"number"}, 
		            {key:"BatchLogId"}, 
		            {key:"TransactionType"}, 
		            {key:"ProductCode"},
	   	            {key:"TotalRecordsinBatch"},
		            {key:"TotalPremiumForBatch"},
	  	            {key:"SendURL"},
	  	            {key:"ResponseXML"},  	            
	  	            {key:"TotalRecords"}  	            
	   	           
		        ], 
		        metaFields: { 
		            totalRecords: "totalRecords" // Access to value in the server response 
		        } 
		    }; 

		    myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
		         // the remote response is in oArgs.response,
		         // the raw text is oArgs.response.responseText   
		         var rawResponse = oArgs.response.responseText;
		         forwardToLoginPageIfInvalidSession(rawResponse);
		         
		     });

		    // DataTable configuration 
		    var myConfigs = { 
		        initialRequest: generateRequest(), // Initial request for first page of data
		        generateRequest:generateRequest,
		        dynamicData: true, // Enables dynamic server-driven data 
		        sortedBy : {key:"SNo", dir:YAHOO.widget.DataTable.CLASS_ASC}, // Sets UI initial sort arrow 
		        paginator: new YAHOO.widget.Paginator({ rowsPerPage:25,  template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   

		         // use these in the rows-per-page dropdown   
		         rowsPerPageOptions : [10,15,25],   
		   
		         // use custom page link labels   
		         pageLabelBuilder : function (page,paginator) {   
		             var recs = paginator.getPageRecords(page);   
		             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
		         }   
		     		})
		 		}; 	        

		    // DataTable instance 
		    var myDataTable = new YAHOO.widget.DataTable("dynamicSearchResultData", myColumnDefs, myDataSource, myConfigs); 
		    // Update totalRecords on the fly with value from server 

		    myDataTable.handleDataReturnPayload = function(oRequest, oResponse, oPayload) { 
		        oPayload.totalRecords = oResponse.meta.totalRecords; 

		        return oPayload; 
		    } 

		    return { 
		        ds: myDataSource, 
		        dt: myDataTable 
		    }; 
		    
		}(); }	
	 
	 
	
	
	function FindGetDataFeed(dataSourceURL)
	{
	 if(GoTOFindButton()) {
	   listBatchLogDetails(dataSourceURL);
	 }
	}

