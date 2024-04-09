function GoTOFindButton()
{
var formElement=document.forms[0];

var cbeginMM=formElement.csdmm.value;
var cbeginDD=formElement.csddd.value;
var cbeginYY=formElement.csdyy.value;

var cendMM=formElement.cedmm.value;
var cendDD=formElement.ceddd.value;
var cendYY=formElement.cedyy.value;

var effbeginMM=formElement.esdmm.value;
var effbeginDD=formElement.esddd.value;
var effbeginYY=formElement.esdyy.value;

var effendMM=formElement.eedmm.value;
var effendDD=formElement.eeddd.value;
var effendYY=formElement.eedyy.value;

formElement.inpCreatedDateBegin.value = "";
formElement.inpCreatedDateEnd.value = "";
formElement.inpEffDateBegin.value = "";
formElement.inpEffDateEnd.value = "";

if((cbeginMM!="")&&(cbeginDD!="")&&(cbeginYY!="")) {
formElement.inpCreatedDateBegin.value=cbeginYY+"-"+cbeginMM+"-"+cbeginDD;	
}

if((cendMM!="")&&(cendDD!="")&&(cendYY!="")) {
formElement.inpCreatedDateEnd.value=cendYY+"-"+cendMM+"-"+cendDD;
}

if((effbeginMM!="")&&(effbeginDD!="")&&(effbeginYY!="")) {
formElement.inpEffDateBegin.value=effbeginYY+"-"+effbeginMM+"-"+effbeginDD;
}

if((effendMM!="")&&(effendDD!="")&&(effendYY!="")) {
formElement.inpEffDateEnd.value=effendYY+"-"+effendMM+"-"+effendDD;
}



if(cbeginMM!="" && cbeginMM < 1 || cbeginMM > 12){
	alert("month should be 1-12");
	formElement.csdmm.focus();
	return false;
}
if(cendMM!="" && cendMM < 1 || cendMM > 12){
	alert("month should be 1-12");
	formElement.cedmm.focus();
	return false;
}
if(effbeginMM!="" && effbeginMM < 1 || effbeginMM > 12){
	alert("month should be 1-12");
	formElement.efsmm.focus();
	return false;
}
if(effendMM!="" && effendMM < 1 || effendMM > 12){
	alert("month should be 1-12");
	formElement.efemm.focus();
	return false;
}
if(cbeginDD!="" && cbeginDD < 1 || cbeginDD > 31){
	alert("date should be 1-31");
	formElement.csddd.focus();
	return false;
}	
if(cendDD!="" && cendDD < 1 || cendDD > 31){
	alert("date should be 1-31");
	formElement.ceddd.focus();
	return false;
}
if(effbeginDD!="" && effbeginDD < 1 ||effbeginDD > 31){
	alert("date should be 1-31");
	formElement.efsdd.focus();
	return false;
}
if(effendDD!="" && effendDD < 1 || effendDD > 31){
	alert("date should be 1-31");
	formElement.efedd.focus();
	return false;
}
if(cbeginYY!="" && cbeginYY<1000){
	alert("year should be >999");
	formElement.csdyy.focus();
	return false;
}
if(cendYY!="" && cendYY<1000){
	alert("year should be >999");
	formElement.cedyy.focus();
	return false;
}
if(effbeginYY!="" && effbeginYY<1000){
	alert("year should be >999");
	formElement.efsyy.focus();
	return false;
}
if(effendYY!="" && effendYY<1000){
	alert("year should be >999");
	formElement.efeyy.focus();
	return false;
}

if(isNaN(cbeginMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(cbeginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(cbeginYY)){
	alert("Date should be numeric.");
	return false;		
}		
if(isNaN(cendMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(cendDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(cendYY)){
	alert("Date should be numeric.");
	return false;		
}		
if(isNaN(effbeginMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(effbeginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(effbeginYY)){
	alert("Date should be numeric.");
	return false;		
}		
if(isNaN(effendMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(effendDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(effendYY)){
	alert("Date should be numeric.");
	return false;		
}
if((cbeginMM==2 && cbeginDD>29 && (cbeginYY%4==0)) || (cbeginMM==2 && cbeginDD>28 && (cbeginYY%4!=0))) {
	alert("'Quote Created Date:From' is Invalid");
	return false;
}
if((cendMM==2 && cendDD>29 && (cendYY%4==0)) || (cendMM==2 && cendDD>28 && (cendYY%4!=0))) {
	alert("'Quote Created Date:To' is Invalid");
	return false;
}

if((effbeginMM==2 && effbeginDD>29 && (effbeginYY%4==0)) || (effbeginMM==2 && effbeginDD>28 && (effbeginYY%4!=0))) {
	alert("'Quote Effective Date:From' is Invalid");
	return false;
}
if((effendMM==2 && effendDD>29 && (effendYY%4==0)) || (effendMM==2 && effendDD>28 && (effendYY%4!=0))) {
	alert("'Quote Effective Date:To' is Invalid");
	return false;
}




	var quoteNumber = formElement.quoteNumberTemp.value;
	
	if(quoteNumber !="") {	
		var quoteAndSubQuoteNum = quoteNumber.split("-");	
		if(quoteAndSubQuoteNum.length==2) {	
			formElement.quoteNumber.value=quoteAndSubQuoteNum[0];
			formElement.quoteSubNumber.value=quoteAndSubQuoteNum[1];
		} else {	
			formElement.quoteNumber.value=quoteNumber;
			formElement.quoteSubNumber.value="";
		}
	} else {
		formElement.quoteNumber.value=quoteNumber;
		formElement.quoteSubNumber.value="";		
	}	

return true;
}

function validateDate(val,obj,desc){
	if(obj.value>val) {
		obj.value='';
		obj.focus();
		alert("Please Enter the Valid "+desc);
		return false;
	}	
}

function listPolicies(dataSourceURL){
if(GoTOFindButton()){
listPolicy(dataSourceURL);
}
}

function listPolicy(dataSourceURL) { 
	document.getElementById("numberofRecords").innerHTML="Number of Policies Found : 0";
	  autologout();
	 YAHOO.example.DynamicData = function() { 			  		  				  		  		   	   
		   var formatCreatedBy = function(elCell, oRecord, oColumn, sData) {	
			var link= "<div style='word-wrap: break-word'>" + oRecord.getData("CreatedBy") + "</div>";
			
			 elCell.innerHTML =link;		 
		   }
		   
		   			  
		    // Column definitions 
		    var myColumnDefs = [ // sortable:true enables sorting 
		        {key:"SNo", label:"SNo",resizable:"false",width:30, sortable:false}, 
		        {key:"InsuredName", label:"Insured Name",sortable:true,resizable:"false",width:180}, 
		        {key:"PolPolicyVerPolicyType", label:"Policy Type",resizable:"false",width:85,sortable:true}, 
		        {key:"PolicyNumberInVer", label:"Policy Number",resizable:"false",width:115,sortable:true}, 
		        {key:"PolicyStatus", label:"Policy Status",resizable:"false",width:65,sortable:true}, 
	      		{key:"EffectiveDate", label:"Effective Date",resizable:"false",width:70,sortable:true},
		        {key:"IssuedDate", label:"Issued Date",resizable:"false",width:70,sortable:true},
	   	        {key:"CreatedBy", label:"Created By",resizable:"false",formatter:formatCreatedBy,width:175,sortable:true}
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
		            {key:"SNo", parser:"number"}, 
		            {key:"InsuredName"}, 
		            {key:"PolicyNumberInVer"}, 
		            {key:"PolicyNumber"},
		            {key:"PolicyStatus"},
		            {key:"PolicyType"},
		            {key:"PolPolicyVerPolicyType"},
	   	            {key:"EffectiveDate"},
		            {key:"IssuedDate"},
	  	            {key:"CreatedBy"},
	  	            {key:"CustomerId"}, 
	  	            {key:"IsRenewal"},
	  	            {key:"PolicyId"},
	  	            {key:"PolicyVerId"},
	  	            {key:"CurrentVerId"},
	  	            {key:"totRecords"} ,
	  	            {key:"BusinessType"}	            	                    
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
			document.getElementById("numberofRecords").innerHTML="Number of Policies Found : "+TotalRecords;
		});


		    return { 
		        ds: myDataSource, 
		        dt: myDataTable 
		    }; 
		    
		}(); 
	}	
	 
	 

