function GoTOFindButton()
{
var formElement=document.forms[0];

var cbeginMM=formElement.csdmm.value;
var cbeginDD=formElement.csddd.value;
var cbeginYY=formElement.csdyy.value;
var cendMM=formElement.cedmm.value;
var cendDD=formElement.ceddd.value;
var cendYY=formElement.cedyy.value;

var uCrebeginMM=formElement.usdmm.value;
var uCrebeginDD=formElement.usddd.value;
var uCrebeginYY=formElement.usdyy.value;
var uCreendMM=formElement.uedmm.value;
var uCreendDD=formElement.ueddd.value;
var uCreendYY=formElement.uedyy.value;

var uEffbeginMM=formElement.efsmm.value;
var uEffbeginDD=formElement.efsdd.value;
var uEffbeginYY=formElement.efsyy.value;
var uEffendMM=formElement.efemm.value;
var uEffendDD=formElement.efedd.value;
var uEffendYY=formElement.efeyy.value;

if((uCrebeginMM!="")&&(uCrebeginDD!="")&&(uCrebeginYY!="")) {
formElement.inpUpdatedDateBegin.value=uCrebeginYY+"-"+uCrebeginMM+"-"+uCrebeginDD;
}

if((uCreendMM!="")&&(uCreendDD!="")&&(uCreendYY!="")) {
formElement.inpUpdatedDateEnd.value=uCreendYY+"-"+uCreendMM+"-"+uCreendDD;
}

if((cbeginMM!="")&&(cbeginDD!="")&&(cbeginYY!="")) {
formElement.inpCreatedDateBegin.value=cbeginYY+"-"+cbeginMM+"-"+cbeginDD;
}

if((cendMM!="")&&(cendDD!="")&&(cendYY!="")) {
formElement.inpCreatedDateEnd.value=cendYY+"-"+cendMM+"-"+cendDD;
}

if((uEffbeginMM!="")&&(uEffbeginDD!="")&&(uEffbeginYY!="")) {
formElement.inpEffectiveDateBegin.value=uEffbeginYY+"-"+uEffbeginMM+"-"+uEffbeginDD;
}

if((uEffendMM!="")&&(uEffendDD!="")&&(uEffendYY!="")) {
formElement.inpEffectiveDateEnd.value=uEffendYY+"-"+uEffendMM+"-"+uEffendDD;
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
if(uCrebeginMM!="" && uCrebeginMM < 1 ||uCrebeginMM > 12){
	alert("month should be 1-12");
	formElement.usdmm.focus();
	return false;
}
if(uCreendMM!="" && uCreendMM < 1 || uCreendMM > 12){
	alert("month should be 1-12");
	formElement.uedmm.focus();
	return false;
}
if(uEffbeginMM!="" && uEffbeginMM < 1 || uEffbeginMM > 12){
	alert("month should be 1-12");
	formElement.efsmm.focus();
	return false;
}
if(uEffendMM!="" && uEffendMM < 1 || uEffendMM > 12){
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
if(uCrebeginDD!="" && uCrebeginDD < 1 ||uCrebeginDD > 31){
	alert("date should be 1-31");
	formElement.usddd.focus();
	return false;
}
if(uCreendDD!="" && uCreendDD < 1 || uCreendDD > 31){
	alert("date should be 1-31");
	formElement.ueddd.focus();
	return false;
}
if(uEffbeginDD!="" && uEffbeginDD < 1 ||uEffbeginDD > 31){
	alert("date should be 1-31");
	formElement.efsdd.focus();
	return false;
}
if(uEffendDD!="" && uEffendDD < 1 || uEffendDD > 31){
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
if(uCrebeginYY!="" && uCrebeginYY<1000){
	alert("year should be >999");
	formElement.usdyy.focus();
	return false;
}
if(uCreendYY!="" && uCreendYY<1000){
	alert("year should be >999");
	formElement.uedyy.focus();
	return false;
}
if(uEffbeginYY!="" && uEffbeginYY<1000){
	alert("year should be >999");
	formElement.efsyy.focus();
	return false;
}
if(uEffendYY!="" && uEffendYY<1000){
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
if(isNaN(uCrebeginMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(uCrebeginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(uCrebeginYY)){
	alert("Date should be numeric.");
	return false;		
}		
if(isNaN(uCreendMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(uCreendDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(uCreendYY)){
	alert("Date should be numeric.");
	return false;		
}	
if(isNaN(uEffbeginMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(uEffbeginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(uEffbeginYY)){
	alert("Date should be numeric.");
	return false;		
}		
if(isNaN(uEffendMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(uEffendDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(uEffendYY)){
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
if((uCrebeginMM==2 && uCrebeginDD>29 && (uCrebeginYY%4==0)) || (uCrebeginMM==2 && uCrebeginDD>28 && (uCrebeginYY%4!=0))) {
	alert("'Quote Updated Date:From' isInvalid");
	return false;
}
if((uCreendMM==2 && uCreendDD>29 && (uCreendYY%4==0)) || (uCreendMM==2 && uCreendDD>28 && (uCreendYY%4!=0))) {
	alert("'Quote Updated Date:To' is Invalid");
	return false;
}
if((uEffbeginMM==2 && uEffbeginDD>29 && (uEffbeginYY%4==0)) || (uEffbeginMM==2 && uEffbeginDD>28 && (uEffbeginYY%4!=0))) {
	alert("'Quote Effective Date:From' is Invalid");
	return false;
}
if((uEffendMM==2 && uEffendDD>29 && (uEffendYY%4==0)) || (uEffendMM==2 && uEffendDD>28 && (uEffendYY%4!=0))) {
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
}else {
	formElement.quoteNumber.value=quoteNumber;
	formElement.quoteSubNumber.value="";		
}	
return true;
}
function FindQuote1(dataSourceURL)
{
	if(GoTOFindButton()) {
		document.getElementById("numberofRecords").innerHTML="Number of Quotes Found : 0";
		listQuote(dataSourceURL);	
	}
}
/**
 * AJAX - To search quote
 * @author mohan_r@solartis.net
 * Modified_by sathiyaseelan_m@solartis.net
 */   
  
function listQuote(dataSourceURL) { 
	   autologout();
 YAHOO.example.DynamicData = function() { 			  		   		  	
	    // Column definitions 
	    var myColumnDefs = [ // sortable:true enables sorting 
	        {key:"SNo", label:"SNo",resizable:"false",width:30,sortable:false}, 
	        {key:"InsuredName", label:"Insured Name",resizable:"false",width:220, sortable:true}, 
	        {key:"QuoteNumber", label:"Quote Number",resizable:"false",width:90, sortable:true}, 
	        {key:"QuoteStatus", label:"Quote Status",resizable:"false",width:75, sortable:true}, 
      		{key:"EffectiveDate", label:"Effective Date",resizable:"false",width:75, sortable:true},
	        {key:"LastModifiedDate", label:"Last Modified Date",resizable:"false",width:100, sortable:true},
   	        {key:"LastModifiedBy", label:"Last Modified By",resizable:"false",width:190, sortable:true}     			         
	    ]; 

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
	            {key:"InsuredName"}, 
	            {key:"QuoteNumber"}, 
	            {key:"QuoteStatus"}, 
	            {key:"EffectiveDate"},
   	            {key:"LastModifiedDate"},
	            {key:"LastModifiedBy"},
   	            {key:"TotalPremium"},   
   	            {key:"QuoteType"},	            
  	            {key:"CustomerId",parser:"number"},
  	            {key:"quoteId",parser:"number"},
  	            {key:"ownerId",parser:"number"},
  	            {key:"userId1"}, 
  	            {key:"agencyId",parser:"number"}, 
  	            {key:"PolicyNumber"},
  	            {key:"PrimaryPolicyNumber"},
  	            {key:"ParentPolicyId"},
  	            {key:"ParentPolicyVerId"},
  	            {key:"CurrentVerId"},
  	            {key:"totalRecords",parser:"number"} 	              	            
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
	        paginator: new YAHOO.widget.Paginator({ rowsPerPage:25,template : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
	
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
		document.getElementById("numberofRecords").innerHTML="Number of Quotes Found : "+TotalRecords;
	});
   
	    return { 
	        ds: myDataSource, 
	        dt: myDataTable 
	    }; 
	    
	}(); 
	}
 
 
  function setResults(transport){
  document.getElementById('QUOTE_LIST').innerHTML=transport.responseText;
  }
 
