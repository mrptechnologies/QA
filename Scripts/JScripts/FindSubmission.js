function GoTOFindButton()
{
var formElement=document.forms[0];

var beginMM=formElement.LastModified1.value;
var beginDD=formElement.LastModified2.value;
var beginYY=formElement.LastModified3.value;
var endMM=formElement.LastModified4.value;
var endDD=formElement.LastModified5.value;
var endYY=formElement.LastModified6.value;

var CrebeginMM=formElement.CreatedDate1.value;
var CrebeginDD=formElement.CreatedDate2.value;
var CrebeginYY=formElement.CreatedDate3.value;
var CreendMM=formElement.CreatedDate4.value;
var CreendDD=formElement.CreatedDate5.value;
var CreendYY=formElement.CreatedDate6.value;

if(CrebeginMM!="" && CrebeginMM < 1 || CrebeginMM > 12){
	alert("month should be 1-12");
	formElement.CreatedDate1.focus();
	return false;
}	
if(beginMM!="" && beginMM < 1 || beginMM > 12){
	alert("month should be 1-12");
	formElement.LastModified1.focus();
	return false;
}
if(endMM!="" && endMM < 1 ||endMM > 12){
	alert("month should be 1-12");
	formElement.LastModified4.focus();
	return false;
}
if(CreendMM!="" && CreendMM < 1 || CreendMM > 12){
	alert("month should be 1-12");
	formElement.CreatedDate4.focus();
	return false;
}

if(CrebeginDD!="" && CrebeginDD < 1 || CrebeginDD > 31){
	alert("date should be 1-31");
	formElement.CreatedDate2.focus();
	return false;
}	
if(beginDD!="" && beginDD < 1 || beginDD > 31){
	alert("date should be 1-31");
	formElement.LastModified2.focus();
	return false;
}
if(endDD!="" && endDD < 1 ||endDD > 31){
	alert("date should be 1-31");
	formElement.LastModified5.focus();
	return false;
}
if(CreendDD!="" && CreendDD < 1 || CreendDD > 31){
	alert("date should be 1-31");
	formElement.CreatedDate5.focus();
	return false;
}

if(beginYY!="" && beginYY<1000){
	alert("year should be >999");
	formElement.LastModified3.focus();
	return false;
}
if(endYY!="" && endYY<1000){
	alert("year should be >999");
	formElement.LastModified6.focus();
	return false;
}
if(CrebeginYY!="" && CrebeginYY<1000){
	alert("year should be >999");
	formElement.CreatedDate3.focus();
	return false;
}
if(CreendYY!="" && CreendYY<1000){
	alert("year should be >999");
	formElement.CreatedDate6.focus();
	return false;
}


if(isNaN(CrebeginMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(CrebeginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(CrebeginYY)){
	alert("Date should be numeric.");
	return false;		
}		
if(isNaN(beginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(beginYY)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(beginMM)){
	alert("Date should be numeric.");
	return false;		
}		
if(isNaN(endMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(endDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(endYY)){
	alert("Date should be numeric.");
	return false;		
}		
if(isNaN(CreendMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(CrebeginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(CreendYY)){
	alert("Date should be numeric.");
	return false;		
}	

if((beginMM==2 && beginDD>29 && (beginYY%4==0)) || (beginMM==2 && beginDD>28 && (beginYY%4!=0))) {
	alert("'Last Modified From' is Invalid");
	return false;
}
if((endMM==2 && endDD>29 && (endYY%4==0)) || (endMM==2 && endDD>28 && (endYY%4!=0))) {
	alert("'Last Modified To' is Invalid");
	return false;
}
if((CrebeginMM==2 && CrebeginDD>29 && (CrebeginYY%4==0)) || (CrebeginMM==2 && CrebeginDD>28 && (CrebeginYY%4!=0))) {
	alert("'Created Date From' isInvalid");
	return false;
}
if((CreendMM==2 && CreendDD>29 && (CreendYY%4==0)) || (CreendMM==2 && CreendDD>28 && (CreendYY%4!=0))) {
	alert("'Created Date To' is Invalid");
	return false;
}	

if((CrebeginMM!="")&&(CrebeginDD!="")&&(CrebeginYY!="")) {
formElement.inpCreatedDateBegin.value=CrebeginYY+"-"+CrebeginMM+"-"+CrebeginDD;
}

if((CreendMM!="")&&(CreendDD!="")&&(CreendYY!="")) {
formElement.inpCreatedDateEnd.value=CreendYY+"-"+CreendMM+"-"+CreendDD;
}

if((beginMM!="")&&(beginDD!="")&&(beginYY!="")) {
formElement.inpUpdatedDateBegin.value=beginYY+"-"+beginMM+"-"+beginDD;
}

if((endMM!="")&&(endDD!="")&&(endYY!="")) {
formElement.inpUpdatedDateEnd.value=endYY+"-"+endMM+"-"+endDD; 
}
return true;
}

function listSubmission(dataSourceURL) { 
	 YAHOO.example.DynamicData = function() { 
	 		var isNoofRecordsDisplayed=true;    
			

		   var formatBrokerName = function(elCell, oRecord, oColumn, sData) {	
		   var name= "<div style='word-wrap: break-word'>"
							+ oRecord.getData("BrokerName")  +
								  		   "</div>";
			elCell.innerHTML =name;
			}   
		   		   
		  
		    // Column definitions 
		    var myColumnDefs = [ // sortable:true enables sorting 
		        {key:"SNo", label:"SNo", sortable:false,resizable:"false",width:30}, 
		        {key:"BrokerName", label:"Broker Name" ,formatter:formatBrokerName, sortable:true,resizable:"false",width:75},
		        {key:"SubmissionNumber", label:"Submission<br>Number",sortable:true,resizable:"false",width:68}, 
		        {key:"SubmissionName", label:"Submission<br>Name",sortable:true,resizable:"false",width:70}, 
		        {key:"SubmissionStatus", label:"Submission<br>Status", sortable:false,resizable:"false",width:60}, 
	   	        {key:"ClearanceStatus", label:"Clearance<br>Status", sortable:false,resizable:"false",width:50}, 
	   	        {key:"DBA", label:"DBA", sortable:true,resizable:"false",width:60},
		        {key:"Address", label:"Address", sortable:false,resizable:"false",width:100}, 
	      		{key:"City", label:"City", sortable:true,resizable:"false",width:75},
		        {key:"State", label:"State", sortable:true,resizable:"false",width:28},
	   	        {key:"Zip", label:"Zip", sortable:true,resizable:"false",width:32},
	   	        {key:"CreatedDate", label:"Created<br>Date", sortable:false,resizable:"false",width:65}
	   	        
		    ]; 
				//{key:"", label:"", sortable:false, resizable:true,formatter:formatButton,width:50}
		    // Custom parser 
		    var stringToDate = function(sData) { 
		        var array = sData.split("-"); 
		        return new Date(array[1] + " " + array[0] + ", " + array[2]); 
		    };
		    

	     	var myDataSource = new YAHOO.util.DataSource(dataSourceURL);
	        myDataSource.connMethodPost = true; 
 
		    myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON; 
		    myDataSource.responseSchema = { 
		        resultsList: "records", 
		        fields: [ 
		            {key:"SNo", parser:"number"}, 
		            {key:"BrokerName"},
		            {key:"SubmissionNumber"}, 
		            {key:"SubmissionName"}, 
		            {key:"SubmissionStatus"}, 
		            {key:"ClearanceStatus"}, 
		            {key:"DBA"},
		            {key:"Address"},
	   	            {key:"City"},
		            {key:"State"},
	  	            {key:"Zip"},
	  	            {key:"CreatedDate"},
	  	            {key:"CustomerId"},  
	  	            {key:"SubmissionVerId"},
	  	            {key:"SubmissionId"},	
	  	            {key:"Status"},
	  	            {key:"SubmissionNumberLike"},
	  	            {key:"AgencyId"},            
	  	            {key:"AgentId"},
	  	            {key:"AgencyIdToLink"},
	  	            {key:"ObjectType"},
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
			        generateRequest: generateRequest ,
 
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
		    var myDataTable = new YAHOO.widget.DataTable("dynamicdata", myColumnDefs, myDataSource, myConfigs); 
		    // Update totalRecords on the fly with value from server 

		    myDataTable.handleDataReturnPayload = function(oRequest, oResponse, oPayload) { 
		        oPayload.totalRecords = oResponse.meta.totalRecords; 

		        return oPayload; 
		    } 
			//Update Total Number of Records
			myDataTable.subscribe('dataReturnEvent' , function(oArgs) { 
			var TotalRecords =  oArgs.response.meta.totalRecords;
			document.getElementById("numberofRecords").innerHTML="Number of Submissions Found : "+TotalRecords;
		});

		    return { 
		        ds: myDataSource, 
		        dt: myDataTable 
		    }; 
		    
		}(); 
	}	
	 

	 
	 
	function FindSubmission(dataSourceURL)
	{
		if(GoTOFindButton()) {
			document.getElementById("numberofRecords").innerHTML="Number of Submissions Found : 0";
			listSubmission(dataSourceURL);	
		}
	}
	/* function copySubmission(url,obj)
		{
		//document.getElementById('SubmissionList').action=url;
		//obj.disabled=true;
		//document.getElementById('SubmissionList').submit();
		new Ajax.Request(url,{method:"post"}); 
		
		}
	 */

