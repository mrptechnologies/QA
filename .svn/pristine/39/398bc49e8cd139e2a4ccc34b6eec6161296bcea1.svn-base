function GoTOFindButton()
{

var formElement=document.forms[0];

var startMM=formElement.startMonth.value;
var startDD=formElement.startDay.value;
var startYY=formElement.startYear.value;
var endMM=formElement.endMonth.value;
var endDD=formElement.endDay.value;
var endYY=formElement.endYear.value;
var batchId = '';//formElement.batchLogId.value;

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

function listTransactionsDetails(dataSourceURL) {
	 autologout();
	 YAHOO.example.DynamicData = function() { 			 
	 		document.getElementById("DivTotalRecords").innerHTML="Number of Records Found : 0"; 		  
			var isNoofRecordsDisplayed=true;				  		  
		    var formatLink = function(elCell, oRecord, oColumn, sData) {
		    var link= "<a onclick='window.open(this.href);return false;' href='../GetOutBoundTransactionDetails.do?answer(Object::Transaction::TransactionNumber)="+
						oRecord.getData("TransactionNo")+"&answer(Object::Transaction::TransactionType)="+oRecord.getData("TransactionType")
						+"&answer(BatchLogDetailId)="+oRecord.getData("BatchLogDetailId")
						+"&answer(Object::Transaction::TransactionDetailId)="+oRecord.getData("TransactionDetailId")
						+"&answer(Object::Transaction::TransactionMasterId)="+oRecord.getData("TransactionMasterId")+"'>"
						+ oRecord.getData("SNo") + "</a>";
		    if(isNoofRecordsDisplayed==true){
				 var TotalRecords = oRecord.getData("TotalRecords");
				 document.getElementById("DivTotalRecords").innerHTML="Number of Records Found : "+TotalRecords;
				 isNoofRecordsDisplayed=false;
			}
		 	 elCell.innerHTML =link;
		   }	    
		   var formatSubmissionLink = function(elCell, oRecord, oColumn, sData) {	
		      		var formatSubmissionLink= " onclick='window.open(this.href);return false;' href='../GetSubmissionInsuredDetailAction.do?answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::SubmissionVerId)="+oRecord.getData("SubmissionVerId")+"&answer(Object::Submission::SubmissionId)="+oRecord.getData("SubmissionId")+"&answer(customerId)="+oRecord.getData("CustomerId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Submission::InsuredId)="+oRecord.getData("CustomerId")+"	'>"+ oRecord.getData("SubmissionNo")  ;
				  		  elCell.innerHTML ="<a"+ formatSubmissionLink+ "</a>";
				  		  
		   }
		   var formatPolicyLink = function(elCell, oRecord, oColumn, sData) {	
		      		var	link="<a onclick='window.open(this.href);return false;' href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(conditionFlag)=Y &answer(TabPanelName)=Policy_Panel&answer(policyId)="+
						oRecord.getData("PolicyId")+ "&answer(policyVerId)="+oRecord.getData("PolicyVerId")+
						"&answer(Object::Application::ApplicationType)=POLICY_APPLICATION"+"'>"+ oRecord.getData("PolicyNo")+"</a>";
				  		  elCell.innerHTML =link; 
				  		  
		   }
		   // Column definitions 
		    var myColumnDefs = [ // sortable:true enables sorting 
		        {key:"SNo", label:"SNo", formatter:formatLink,sortable:false,resizable:"false",width:30}, 	         
		        {key:"TransactionType", label:"Tran. Type",sortable:true,resizable:"false",width:80}, 
		        {key:"ProductCode", label:"Product Code", sortable:true,resizable:"false",width:80}, 
	      		{key:"Status", label:"Status", sortable:true,resizable:"false",width:100},
		        {key:"ExpiryDate", label:"Expiry Date", sortable:true,resizable:"false",width:70},
	   	        {key:"InsuredNameCode", label:"Insured Name Code", sortable:true,resizable:"false",width:110},
	   	        {key:"InsuredName", label:"Insured Name",sortable:true,resizable:"false",width:115},
	   	        {key:"SubmissionNo", label:"Submission #",formatter:formatSubmissionLink,sortable:true,resizable:"false",width:75},
	   	        {key:"PolicyNo", label:"Policy #",formatter:formatPolicyLink,sortable:true,resizable:"false",width:95}
	   	        
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
		            {key:"TransactionNo"}, 
		            {key:"TransactionType"}, 
		            {key:"ProductCode"},
	   	            {key:"Status"},
		            {key:"ExpiryDate"},
	  	            {key:"InsuredNameCode"},
	  	            {key:"InsuredName"}, 
	   	            {key:"SubmissionNo"},
	   	            {key:"PolicyNo"},
	  	            {key:"TotalRecords"},
	  	            {key:"SubmissionId"},
	   	            {key:"SubmissionVerId"},  	            
	   	            {key:"CustomerId"},
		            {key:"BatchLogDetailId"},
		            {key:"TransactionDetailId"},
		            {key:"TransactionMasterId"},
		            {key:"PolicyId"},
		            {key:"PolicyVerId"}	  
		       	  	            
	   	           
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
		        generateRequest: generateRequest,
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
	 
	 

	function FindOutBoundTransaction(dataSourceURL)
	{
	 if(GoTOFindButton()) {
	   listTransactionsDetails(dataSourceURL);
	 }
	}
