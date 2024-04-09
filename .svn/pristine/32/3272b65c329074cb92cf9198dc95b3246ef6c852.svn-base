function listClearance(dataSourceURL) { 
	document.getElementById("numberofRecords").innerHTML="Number of Clearance Found : 0";
	var isNoofRecordsDisplayed=true;
  	autologout();
 	YAHOO.example.DynamicData = function() {	
	   
	   var formatSubmissionName1 = function(elCell, oRecord, oColumn, sData) {
			   var submissionName1Link= "<div style='word-wrap: break-word'>" + oRecord.getData("SubmissionName1") + "</div>";
		   elCell.innerHTML = submissionName1Link;		 
	   }  
	   var formatSubmissionName2 = function(elCell, oRecord, oColumn, sData) {
		   var submissionName2= "<div style='word-wrap: break-word'>" + oRecord.getData("SubmissionName2") + "</div>";
		   elCell.innerHTML = submissionName2;		 
	   }
	   
	   var formatDBA = function(elCell, oRecord, oColumn, sData) {
		   var dba= "<div style='word-wrap: break-word'>" + oRecord.getData("DBA") + "</div>";
		   elCell.innerHTML = dba;		 
	   }
	   
	   var formatBrokerName = function(elCell, oRecord, oColumn, sData) {
		   var brokerName = "<div style='word-wrap: break-word'>" + oRecord.getData("BrokerName") + "</div>";
		   elCell.innerHTML = brokerName;		 
	   } 
	   	   
	   var formatSubmissionNumLink = function(elCell, oRecord, oColumn, sData) {

			   var submissionLink = oRecord.getData("SubmissionNumber");
		 
		   submissionLink = "<div style='word-wrap: break-word'>" + submissionLink + "</div>";
	       elCell.innerHTML =submissionLink;
	   }
	  
	    // Column definitions 
	    var myColumnDefs = [ // sortable:true enables sorting 
	        {key:"SNo", label:"SNo",resizable:"false",width:30,sortable:false,resizeable:true}, 
	        {key:"DataSource", label:"Data Source",sortable:true,resizable:"false",width:50,resizeable:true}, 
	        {key:"SubmissionNumber", label:"Submission #",resizable:"false",formatter:formatSubmissionNumLink,width:90,sortable:true,resizeable:true}, 
	        {key:"SubmissionHasReservation", label:"Submission Has Reservation",resizable:"false",width:75,sortable:true,resizeable:true}, 
	        {key:"SubmissionName1", label:"Submission Name1",resizable:"false",formatter:formatSubmissionName1,width:100,sortable:true,resizeable:true}, 
      		{key:"SubmissionName2", label:"Submission Name2",resizable:"false",formatter:formatSubmissionName2,formatter:formatSubmissionName2,width:100,sortable:true,resizeable:true},
	        {key:"DBA", label:"DBA",resizable:"false",formatter:formatDBA,width:70,sortable:true,resizeable:true},
   	        {key:"State", label:"State",resizable:"false",width:35,sortable:true,resizeable:true},
	        {key:"ZipCode", label:"Zip Code",resizable:"false",width:60,sortable:true,resizeable:true},
	        {key:"QuoteNumber", label:"Quote #",resizable:"false",width:60,sortable:true,resizeable:true},
	        {key:"QuoteHasReservation", label:"Quote Has Reservation",resizable:"false",width:75,sortable:true,resizeable:true},
	        {key:"PolicyNumber", label:"Policy #",resizable:"false",width:100,sortable:true,resizeable:true},
	        {key:"PolicyHasReservation", label:"Policy Has Reservation",resizable:"false",width:75,sortable:true,resizeable:true},
	        {key:"BrokerName", label:"Broker Name",resizable:"false",width:100,formatter:formatBrokerName,sortable:true,resizeable:true},
	        {key:"Linked", label:"Linked",resizable:"false"/*,formatter:formatLinked*/,width:45,sortable:true,resizeable:true}
	    ]; 

	    // Custom parser 
	    var stringToDate = function(sData) { 
	        var array = sData.split("-"); 
	        return new Date(array[1] + " " + array[0] + ", " + array[2]); 
	    }; 

     	var parameters=getFormAsString(document.forms[0]); 
	    // DataSource instance 

	    parameters = parameters.replace(/\+/g,'%2B');
	    var myDataSource = new YAHOO.util.DataSource(dataSourceURL); 
	    myDataSource.connMethodPost = true;
	    myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON; 
	    myDataSource.responseSchema = { 
	        resultsList: "records", 
	        fields: [ 
	            {key:"SNo"}, 
				{key:"DataSource"},
				{key:"SubmissionNumber"},
				{key:"SubmissionHasReservation"},
				{key:"SubmissionName1"},
				{key:"SubmissionName2"},
				{key:"DBA"},
				{key:"State"},
				{key:"ZipCode"},
				{key:"QuoteNumber"},
				{key:"QuoteHasReservation"},
				{key:"PolicyNumber"},
				{key:"PolicyHasReservation"},
				{key:"BrokerName"},
				{key:"Linked"},
				{key:"CustomerId"},
				{key:"AgencyId"},
				{key:"SubmissionId"},
				{key:"SubmissionVerId"},
				{key:"QuoteId"},
				{key:"PolicyId"},
				{key:"ClearanceStatus"},
				{key:"ExtCustomerId"},
				{key:"LineOfBusinessId"},
				{key:"TabPanelName"},
				{key:"totRecords"}          	                    
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
	        paginator: new YAHOO.widget.Paginator({ rowsPerPage:10,  template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   

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
		document.getElementById("numberofRecords").innerHTML="Number of Clearance Found : "+TotalRecords;
	});

	    return { 
	        ds: myDataSource, 
	        dt: myDataTable 
	    }; 
	    
	}(); 
}	
 
 

function setNameValues()
{
    var formElement=document.forms[0];
    //alert(formElement.LegalName1.value);
    if(formElement.NameType.value == 'Company')
    {
    	formElement.customerName1.value = formElement.LegalName1.value;
    	formElement.customerName2.value = formElement.LegalName2.value;
    }
    else if(formElement.NameType.value == 'Person')
    {
    	formElement.customerName1.value = formElement.FirstName.value;
    	formElement.customerName2.value = formElement.LastName.value;
    }    
}
function validateDate()
{
		var formElement=document.forms[0];
		
		var subStartMM=formElement.SESDate1.value;
		var subStartDD=formElement.SESDate2.value;
		var subStartYY=formElement.SESDate3.value;
				                  	
		var subEndMM=formElement.SEEDate1.value;
		var subEndDD=formElement.SEEDate2.value;
		var subEndYY=formElement.SEEDate3.value;
				
		var quoteStartMM=formElement.QESDate1.value;
		var quoteStartDD=formElement.QESDate2.value;
		var quoteStartYY=formElement.QESDate3.value;
				
		var quoteEndMM=formElement.QEEDate1.value;
		var quoteEndDD=formElement.QEEDate2.value;
		var quoteEndYY=formElement.QEEDate3.value;
		
		var polStartMM=formElement.PESDate1.value;
		var polStartDD=formElement.PESDate2.value;
		var polStartYY=formElement.PESDate3.value;
		
		var polEndMM=formElement.PEEDate1.value;
		var polEndDD=formElement.PEEDate2.value;
		var polEndYY=formElement.PEEDate3.value;
		
		if(subStartMM!="" && subStartMM < 1 || subStartMM > 12){
			alert("Month should be 1-12");
			formElement.SESDate1.focus();
			return false;
		}	
		if(subEndMM!="" && subEndMM < 1 || subEndMM > 12) {
			alert("Month should be 1-12");
			formElement.SEEDate1.focus();
			return false;
		}	
		if(quoteStartMM!="" && quoteStartMM < 1 ||quoteStartMM > 12) {
			alert("Month should be 1-12");
			formElement.QESDate1.focus();
			return false;
		}
		if(quoteEndMM!="" && quoteEndMM < 1 || quoteEndMM > 12) {
			alert("Month should be 1-12");
			formElement.QEEDate1.focus();
			return false;
		}	
		if(polStartMM!="" && polStartMM < 1 || polStartMM > 12) {
			alert("Month should be 1-12");
			formElement.PESDate1.focus();
			return false;
		}
		if(polEndMM!="" && polEndMM < 1 || polEndMM > 12) {
			alert("Month should be 1-12");
			formElement.PEEDate1.focus();
			return false;
		}	
				
		if(subStartDD!="" && subStartDD < 1 || subStartDD > 31) {
			alert("Date should be 1-31");
			formElement.SESDate2.focus();
			return false;
		}
		if(subEndDD!="" && subEndDD < 1 || subEndDD > 31) {
			alert("Date should be 1-31");
			formElement.SEEDate2.focus();
			return false;
		}	
		if(quoteStartDD!="" && quoteStartDD < 1 || quoteStartDD > 31) {
			alert("Date should be 1-31");
			formElement.QESDate2.focus();
			return false;
		}
		if(quoteEndDD!="" && quoteEndDD < 1 || quoteEndDD > 31) {
			alert("Date should be 1-31");
			formElement.QEEDate2.focus();
			return false;
		}
		if(polStartDD!="" && polStartDD < 1 || polStartDD > 31) {
			alert("Date should be 1-31");
			formElement.PESDate2.focus();
			return false;
		}
		if(polEndDD!="" && polEndDD < 1 || polEndDD > 31) {
			alert("Date should be 1-31");
			formElement.PEEDate2.focus();
			return false;
		}
		
		if(subStartYY!="" && subStartYY<1000){
			alert("year should be >999");
			formElement.SESDate3.focus();
			return false;
		}
		if(subEndYY!="" && subEndYY<1000){
			alert("year should be >999");
			formElement.SEEDate3.focus();
			return false;
		}
		if(quoteStartYY!="" && quoteStartYY<1000){
			alert("year should be >999");
			formElement.QESDate3.focus();
			return false;
		}
		if(quoteEndYY!="" && quoteEndYY<1000){
			alert("year should be >999");
			formElement.QEEDate3.focus();
			return false;
		}
		if(polStartYY!="" && polStartYY<1000){
			alert("year should be >999");
			formElement.PESDate3.focus();
			return false;
		}
		if(polEndYY!="" && polEndYY<1000){
			alert("year should be >999");
			formElement.PEEDate3.focus();
			return false;
		}		
		
		if((isNaN(subStartMM)) || (isNaN(subStartDD)) || (isNaN(subStartYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(subEndMM)) || (isNaN(subEndDD)) || (isNaN(subEndYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(quoteStartMM)) || (isNaN(quoteStartDD)) || (isNaN(quoteStartYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(quoteEndMM)) || (isNaN(quoteEndDD)) || (isNaN(quoteEndYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(polStartMM)) || (isNaN(polStartDD)) || (isNaN(polStartYY))){
			alert("Date should be numeric.");
			return false;		
		}
		if((isNaN(polEndMM)) || (isNaN(polEndDD)) || (isNaN(polEndYY))){
			alert("Date should be numeric.");
			return false;		
		}		
		
		if((subStartMM==2 && subStartDD>29 && (subStartYY%4==0)) || (subStartMM==2 && subStartDD>28 && (subStartYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((subEndMM==2 && subEndDD>29 && (subEndYY%4==0)) || (subEndMM==2 && subEndDD>28 && (subEndYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((quoteStartMM==2 && quoteStartDD>29 && (quoteStartYY%4==0)) || (quoteStartMM==2 && quoteStartDD>28 && (quoteStartYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((quoteEndMM==2 && quoteEndDD>29 && (quoteEndYY%4==0)) || (quoteEndMM==2 && quoteEndDD>28 && (quoteEndYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((polStartMM==2 && polStartDD>29 && (polStartYY%4==0)) || (polStartMM==2 && polStartDD>28 && (polStartYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}
		if((polEndMM==2 && polEndDD>29 && (polEndYY%4==0)) || (polEndMM==2 && polEndDD>28 && (polEndYY%4!=0))) {
			alert("Invalid Date");
			return false;
		}

		formElement.SESDate.value="";
		formElement.SEEDate.value="";	
		formElement.QESDate.value="";
		formElement.QEEDate.value="";
		formElement.PESDate.value="";
		formElement.PEEDate.value="";
			
		if((subStartMM!="")&&(subStartDD!="")&&(subStartYY!="")) {
			formElement.SESDate.value=subStartYY+"-"+subStartMM+"-"+subStartDD;
		}		
		if((subEndMM!="")&&(subEndDD!="")&&(subEndYY!="")) {
			formElement.SEEDate.value=subEndYY+"-"+subEndMM+"-"+subEndDD;
			
		}		
		if((quoteStartMM!="")&&(quoteStartDD!="")&&(quoteStartYY!="")) {
			formElement.QESDate.value=quoteStartYY+"-"+quoteStartMM+"-"+quoteStartDD;
			
		}		
		if((quoteEndMM!="")&&(quoteEndDD!="")&&(quoteEndYY!="")) {
			formElement.QEEDate.value=quoteEndYY+"-"+quoteEndMM+"-"+quoteEndDD;
			
		}
		
		if((polStartMM!="")&&(polStartDD!="")&&(polStartYY!="")) {
			formElement.PESDate.value=polStartYY+"-"+polStartMM+"-"+polStartDD;
			
		}
		if((polEndMM!="")&&(polEndDD!="")&&(polEndYY!="")) {
			formElement.PEEDate.value=polEndYY+"-"+polEndMM+"-"+polEndDD;
			
		}				
		setNameValues();
		return true;				
}  	

function listClearances(dataSourceURL){
	
	if(validateDate()){
		getSearchResults();
		listClearance(dataSourceURL);
		if(document.getElementById("searchResultContent") != null && document.getElementById("searchResultContent") != undefined) {
			document.getElementById("searchResultContent").style.display = "block";
		}
	}	  
}

function initSearchDialog() {		
	YAHOO.example.container.searchResult = new YAHOO.widget.Dialog("searchResults",
							{ width : "100%",
							  height : "100%",
							  xy:[140,180],
							  draggable: true,
							  visible : false,
							  close : false,
							  modal:true,
							  zindex:"1000",
							  constraintoviewport : true
							});	
	YAHOO.example.container.searchResult.setHeader("Clearance Search Results");
	// Render the Dialog
	YAHOO.example.container.searchResult.render();

}


function getSearchResults(){
		document.getElementById('SEARCH_CONT').innerHTML= document.getElementById('searchResultContent').innerHTML;
		YAHOO.example.container.searchResult.show();
}
 




