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
function listBatchLogTransactions(dataSourceURL) {

	 YAHOO.example.DynamicData = function() { 			  		  
			var isNoofRecordsDisplayed=true;		

		    var formatInsuredLink = function(elCell, oRecord, oColumn, sData) {	
		      		var formatInsuredLink= " onclick='window.open(this.href);return false;' href='../GetINFInsuredMasterDetails.do?answer(TransactionMasterId)="+oRecord.getData("TransMasterId")+"' title='This will take you to Insured Summary'>"+ oRecord.getData("InsuredName");
				  		  
				  		  elCell.innerHTML ="<a"+ formatInsuredLink+ "</a>";
		   }
		  
		    var formatSubmissionLink = function(elCell, oRecord, oColumn, sData) {	
		      		var formatSubmissionLink= " onclick='window.open(this.href);return false;' href='../GetSubmissionInsuredDetailAction.do?answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::SubmissionVerId)="+oRecord.getData("SubmissionVerId")+"&answer(Object::Submission::SubmissionId)="+oRecord.getData("SubmissionId")+"&answer(customerId)="+oRecord.getData("CustomerId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Submission::InsuredId)="+oRecord.getData("CustomerId")+"	' title='This will take you to Submission Summary'>"+ oRecord.getData("SubmissionNumber");
				  		  elCell.innerHTML ="<a"+ formatSubmissionLink+ "</a>";
				  		  
		   }
		    var formatPolicyLink = function(elCell, oRecord, oColumn, sData) {	
		      	var	link="<a onclick='window.open(this.href);return false;' href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(conditionFlag)=Y &answer(TabPanelName)=Policy_Panel&answer(policyId)="+
						oRecord.getData("PolicyId")+ "&answer(policyVerId)="+oRecord.getData("PolicyVerId")+
						"&answer(Object::Application::ApplicationType)=POLICY_APPLICATION"+"'>"+ oRecord.getData("PolicyNumber")+"</a>";
						elCell.innerHTML =link;		 
				  		  
		   }
		    var formatBatchLogDetailLink = function(elCell, oRecord, oColumn, sData) {	
		      	var formatBatchLogDetailLink= " onclick='window.open(this.href);return false;' href='../GetOutBoundTransactionDetails.do?answer(Object::Transaction::TransactionType)="+oRecord.getData("TransactionType")+"&answer(BatchLogDetailId)="+oRecord.getData("BatchLogDetailId")+"&answer(Object::Transaction::TransactionNumber)="+oRecord.getData("TransactionNumber")
		      	+"&answer(Object::Transaction::TransactionDetailId)="+oRecord.getData("TransactionDetailId")
				+"&answer(Object::Transaction::TransactionMasterId)="+oRecord.getData("TransactionMasterId")
		      	+"' title='This will take you to Outbound Transaction record where you could update outbound transaction data in the interface database.'>"+ oRecord.getData("SNo")  ;
				  		  
				  		  elCell.innerHTML ="<a"+ formatBatchLogDetailLink+ "</a>";  
		  		if(isNoofRecordsDisplayed==true){
					var TotalRecords = oRecord.getData("TotalRecords");
					document.getElementById("DivTotalRecords").innerHTML="Number of Records Found : "+TotalRecords;
					isNoofRecordsDisplayed=false;
				}
			  
		   }	   
		  
		    // Column definitions 
		    var myColumnDefs = [ // sortable:true enables sorting 
		        {key:"SNo", label:"SNo", sortable:false,resizable:"false",formatter:formatBatchLogDetailLink,width:30}, 
		        {key:"BatchLogId", label:"Batch Log #",sortable:true,resizable:"false",width:60}, 
		        {key:"TransactionType", label:"Transaction Type",sortable:true,resizable:"false",width:95}, 
		        {key:"ProductCode", label:"Product Code", sortable:true,resizable:"false",width:75}, 
	      		{key:"Status", label:"Status", sortable:true,resizable:"false",width:65},
		        {key:"InsuredNameCode", label:"Insured Name Code", sortable:true,resizable:"false",width:120},
	   	        {key:"InsuredName", label:"Insured Name", sortable:true,resizable:"false",formatter:formatInsuredLink,width:100},
	   	        {key:"SubmissionNumber", label:"Submission #", sortable:true,resizable:"false",formatter:formatSubmissionLink,width:100},
	   	        {key:"PolicyNumber", label:"Policy #", sortable:true,resizable:"false",formatter:formatPolicyLink,width:110}
		    ]; 

		    // Custom parser 
		    var stringToDate = function(sData) { 
		        var array = sData.split("-"); 
		        return new Date(array[1] + " " + array[0] + ", " + array[2]); 
		    };
		    
	     	 
		    // DataSource instance 
		    var myDataSource = new YAHOO.util.DataSource(dataSourceURL); 
		    myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		    myDataSource.connMethodPost=true;
		    myDataSource.responseSchema = { 
		        resultsList: "records", 
		        fields: [ 
		            {key:"SNo", parser:"number"}, 
		            {key:"BatchLogId"}, 
		            {key:"TransactionType"}, 
		            {key:"ProductCode"},
	   	            {key:"Status"},
		            {key:"InsuredNameCode"},
	  	            {key:"InsuredName"},
	  	            {key:"SubmissionNumber"},  	            
	  	            {key:"PolicyNumber"},  	            
	   	            {key:"TransMasterId"},
	  	            {key:"SubmissionId"},
	   	            {key:"SubmissionVerId"},  	            
	   	            {key:"CustomerId"},   	           
	   	            {key:"BatchLogDetailId"} ,  	
	  	            {key:"TransactionNumber"},
	  	            {key:"TransactionDetailId"},
		            {key:"TransactionMasterId"},
		            {key:"PolicyId"},
		            {key:"PolicyVerId"},
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
	// alert("2");
	 listBatchLogTransactions(dataSourceURL);
	 }
	}

