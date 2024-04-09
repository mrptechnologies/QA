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
			var isNoofRecordsDisplayed=true;				  		  

		   var formatSubmissionNumLink = function(elCell, oRecord, oColumn, sData) {
		   
		   var formatSubmissionLink= " onclick='window.open(this.href);return false;' href='../GetSubmissionInsuredDetailAction.do?answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::SubmissionVerId)="+oRecord.getData("SubmissionVerId")+"&answer(Object::Submission::SubmissionId)="+oRecord.getData("SubmissionId")+"&answer(customerId)="+oRecord.getData("CustomerId")+"&answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+"&answer(Object::Submission::InsuredId)="+oRecord.getData("CustomerId")+"	' title='Click here to goto Submission Summary'>"+ oRecord.getData("SubmissionNo")  ;		
			 elCell.innerHTML ="<a"+ formatSubmissionLink+ "</a>";
			   var TotalRecords = oRecord.getData("TotalRecords");
			   document.getElementById("DivTotalRecords").innerHTML="Number of Records Found : <b><font color='red'>"+TotalRecords + "</font></b>";
			   if(TotalRecords > 0){				 				 
				 document.getElementById("DivTotalRecords").innerHTML+="<br>Click on the Transaction # in the below list to view the Genius error<br>";
			   }
		   }
			
			var formatPolicyNumLink = function(elCell, oRecord, oColumn, sData) {

				var	link="<a onclick='window.open(this.href);return false;' href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(conditionFlag)=Y &answer(TabPanelName)=Policy_Panel&answer(policyId)="+
						oRecord.getData("PolicyId")+ "&answer(policyVerId)="+oRecord.getData("PolicyVerId")+
						"&answer(Object::Application::ApplicationType)=POLICY_APPLICATION"+"'>"+ oRecord.getData("PolicyNo")+"</a>";
						elCell.innerHTML =link;	 
		   }
		   
		   var formatTransactionNumber = function(elCell, oRecord, oColumn, sData) {

				var url="'../FindProcessedErrorTransDetails.do?TransactionNumber=" + oRecord.getData("TransactionNumber") + 
				"&SubmissionNo=" + oRecord.getData("SubmissionNo") + "&PolicyNo=" + oRecord.getData("PolicyNo")+ "&flagValue=popup'"; 
				
				
				elCell.innerHTML ='<a href="javascript:void(0)" onclick="showErrorDetail('+url+');" title="Click here to view the Genius error">'+oRecord.getData("TransactionNumber")+'</a>';
		   }			 
		   // Column definitions 
		    var myColumnDefs = [ // sortable:true enables sorting 
		        {key:"SNo", label:"SNo", resizable:"false",width:30,sortable:false}, 
		        {key:"BatchId", label:"Batch #",resizable:"false",width:60,sortable:true}, 
		        {key:"TransactionNumber", label:"Transaction #",formatter:formatTransactionNumber,resizable:"false",width:100,sortable:true},
		        {key:"TransactionType", label:"Trans. Type",resizable:"false",width:90,sortable:true}, 
		        {key:"MasterStatusCode", label:"Master Status Code",resizable:"false",width:110,sortable:true},
		        //{key:"TransactionStatus", label:"Trans. Status", sortable:true,resizable:"false",width:65}, 
	      		{key:"SubmissionNo", label:"Submission #", formatter:formatSubmissionNumLink,resizable:"false",width:110,sortable:true},
		        {key:"PolicyNo", label:"Policy #",formatter:formatPolicyNumLink,resizable:"false",width:120,sortable:true},
	   	        {key:"CreatedDate", label:"Received Date",resizable:"false",width:100,sortable:true}
	   	        
		    ]; 

		    // Custom parser 
		    var stringToDate = function(sData) { 
		        var array = sData.split("-"); 
		        return new Date(array[1] + " " + array[0] + ", " + array[2]); 
		    };
		    
	     	 
		    // DataSource instance 

		    var myDataSource = new YAHOO.util.DataSource(dataSourceURL); 
	        myDataSource.connMethodPost=true;		    
		    myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON; 
		    myDataSource.responseSchema = { 
		        resultsList: "records", 
		        fields: [ 
		            {key:"SNo", parser:"number"}, 
		            {key:"BatchId"}, 
		            {key:"TransactionType"}, 
		            {key:"TransactionStatus"},
		            {key:"SubmissionNo"},
	  	            {key:"PolicyNo"},
	  	            {key:"CreatedDate"},  	
	  	            {key:"MasterStatusCode"},  
	  	            {key:"TransactionNumber"}, 
	  	            {key:"SubmissionId"},  	            
	  	            {key:"SubmissionVerId"},  	
	  	            {key:"PolicyId"},  
	  	            {key:"PolicyVerId"}, 
	  	            {key:"ParentQuoteId"},
	  	            {key:"ParentQuoteVerId"},
	  	            {key:"QuoteNumber"},
	  	            {key:"QuoteSubNumber"},  	
	  	            {key:"CustomerId"},      
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
	 
	 
	
	function FindProcessedErrorTransDetails(dataSourceURL)
	{
	 if(GoTOFindButton()) {
	   document.getElementById("DivTotalRecords").innerHTML="Number of Records Found : <b><font color='red'>0</font></b>";
	   listBatchLogDetails(dataSourceURL);
	 }
	}

	function initErrorDetailDialog() {		
		YAHOO.example.container.errorDetail = new YAHOO.widget.Dialog("errorDetail",
								{ width : "90em",
								  draggable: true,
								  fixedcenter : true,
								  visible : false,
								  modal:true,
								  zindex:"1000",
								  constraintoviewport : true
								});	
		YAHOO.example.container.errorDetail.setHeader("Error Detail");
		// Render the Dialog
		YAHOO.example.container.errorDetail.render();

	}
	YAHOO.util.Event.onDOMReady(initErrorDetailDialog);

	function showErrorDetail(url){

	 	//document.body.style.cursor="wait"; 	
		createXMLHttpRequest();
		getErrorContent(url,'');
		errorContentIsReady()
	}
	function getErrorContent(URL,parameters){
		xmlHttp.onreadystatechange = errorContentIsReady;
		xmlHttp.open("POST", URL,true);
		xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	    xmlHttp.setRequestHeader("Content-length", parameters.length);
	    xmlHttp.setRequestHeader("Connection", "close");
	    xmlHttp.send(parameters);
	}
	function errorContentIsReady(){
		if(xmlHttp && xmlHttp.readyState == 4){
			forwardToLoginPageIfInvalidSession(xmlHttp.responseText);
			document.getElementById('ERROR_CONT').innerHTML= xmlHttp.responseText;
			YAHOO.example.container.errorDetail.show();
			//setTimeout("showSubjDetailSucc("+subjid+")",10);	
		}
	}

