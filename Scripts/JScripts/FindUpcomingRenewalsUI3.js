function GoTOFindButton()
{
var formElement=document.forms[0];

var effbeginMM=formElement.esdmm.value;
var effbeginDD=formElement.esddd.value;
var effbeginYY=formElement.esdyy.value;

var effendMM=formElement.eedmm.value;
var effendDD=formElement.eeddd.value;
var effendYY=formElement.eedyy.value;

var expbeginMM=formElement.expsdmm.value;
var expbeginDD=formElement.expsddd.value;
var expbeginYY=formElement.expsdyy.value;

var expendMM=formElement.expedmm.value;
var expendDD=formElement.expeddd.value;
var expendYY=formElement.expedyy.value;
var daysInMonth = DaysArray(12);

if(expbeginMM!="" && expbeginMM < 1 || expbeginMM > 12){
	alert("month should be 1-12");
	formElement.CreatedDate1.focus();
	return false;
}	
if(effbeginMM!="" && effbeginMM < 1 || effbeginMM > 12){
	alert("month should be 1-12");
	formElement.LastModified1.focus();
	return false;
}
if(effendMM!="" && effendMM < 1 ||effendMM > 12){
	alert("month should be 1-12");
	formElement.LastModified4.focus();
	return false;
}
if(expendMM!="" && expendMM < 1 || expendMM > 12){
	alert("month should be 1-12");
	formElement.CreatedDate4.focus();
	return false;
}

if(expbeginDD!="" && expbeginDD < 1 || expbeginDD > daysInMonth[parseInt(expbeginMM)]){
	alert("date should be 1-"+daysInMonth[parseInt(expbeginMM)]);
	formElement.CreatedDate2.focus();
	return false;
}	
if(effbeginDD!="" && effbeginDD < 1 || effbeginDD > daysInMonth[parseInt(effbeginMM)]){
	alert("date should be 1-"+daysInMonth[parseInt(effbeginMM)]);
	formElement.LastModified2.focus();
	return false;
}
if(effendDD!="" && effendDD < 1 ||effendDD > daysInMonth[parseInt(effendMM)]){
	alert("date should be 1-"+daysInMonth[parseInt(effendMM)]);
	formElement.LastModified5.focus();
	return false;
}
if(expendDD!="" && expendDD < 1 || expendDD > daysInMonth[parseInt(expendMM)]){
	alert("date should be 1-"+daysInMonth[parseInt(expendMM)]);
	formElement.CreatedDate5.focus();
	return false;
}

if(effbeginYY!="" && effbeginYY<1000){
	alert("year should be >999");
	formElement.LastModified3.focus();
	return false;
}
if(effendYY!="" && effendYY<1000){
	alert("year should be >999");
	formElement.LastModified6.focus();
	return false;
}
if(expbeginYY!="" && expbeginYY<1000){
	alert("year should be >999");
	formElement.CreatedDate3.focus();
	return false;
}
if(expendYY!="" && expendYY<1000){
	alert("year should be >999");
	formElement.CreatedDate6.focus();
	return false;
}


if(isNaN(expbeginMM)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(expbeginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(expbeginYY)){
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
if(isNaN(effbeginMM)){
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
if(isNaN(expendDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(expbeginDD)){
	alert("Date should be numeric.");
	return false;		
}
if(isNaN(expendYY)){
	alert("Date should be numeric.");
	return false;		
}	

if((effbeginMM==2 && effbeginDD>29 && (effbeginYY%4==0)) || (effbeginMM==2 && effbeginDD>28 && (effbeginYY%4!=0))) {
	alert("'Policy Effective Start Date' is Invalid");
	return false;
}
if((effendMM==2 && effendDD>29 && (effendYY%4==0)) || (effendMM==2 && effendDD>28 && (effendYY%4!=0))) {
	alert("'Policy Effective End Date' is Invalid");
	return false;
}
if((expbeginMM==2 && expbeginDD>29 && (expbeginYY%4==0)) || (expbeginMM==2 && expbeginDD>28 && (expbeginYY%4!=0))) {
	alert("'Policy Expiration Start Date' isInvalid");
	return false;
}
if((expendMM==2 && expendDD>29 && (expendYY%4==0)) || (expendMM==2 && expendDD>28 && (expendYY%4!=0))) {
	alert("'Policy Expiration End Date' is Invalid");
	return false;
}	

if((effbeginMM!="")&&(effbeginDD!="")&&(effbeginYY!="")) {
formElement.inpEffDateBegin.value=effbeginYY+"-"+effbeginMM+"-"+effbeginDD;
}

if((effendMM!="")&&(effendDD!="")&&(effendYY!="")) {
formElement.inpEffDateEnd.value=effendYY+"-"+effendMM+"-"+effendDD;
}

if((expbeginMM!="")&&(expbeginDD!="")&&(expbeginYY!="")) {
formElement.inpExpDateBegin.value=expbeginYY+"-"+expbeginMM+"-"+expbeginDD;
}

if((expendMM!="")&&(expendDD!="")&&(expendYY!="")) {
formElement.inpExpDateEnd.value=expendYY+"-"+expendMM+"-"+expendDD;
}


return true;
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}


/*function validateDate(val,obj,desc){
	if(obj.value>val) {
		obj.value='';
		obj.focus();
		alert("Please Enter the Valid "+desc);
		return false;
	}	
}*/

function findUpcomingRenewals(dataSourceURL) {

	if(GoTOFindButton())
		listUpcomingRenewals(dataSourceURL);	
}

function listUpcomingRenewals(dataSourceURL) {

document.getElementById("numberofRecords").innerHTML="Number of Policies Found : 0";
		var isNoofRecordsDisplayed=true; 
  autologout();
	YAHOO.example.DynamicData = function() {	  		  
	    var formatLink = function(elCell, oRecord, oColumn, sData) {	
		var link= "<a href='../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId="+
					oRecord.getData("CustomerId")+"'><div style='word-wrap: break-word'>"
					+ oRecord.getData("InsuredName")  +
						  		  "</div></a>";
		 elCell.innerHTML =link;
		 
		 
	   }
	   
	   var formatIssuedBy = function(elCell, oRecord, oColumn, sData) {	
		var link= "<div style='word-wrap: break-word'>" + oRecord.getData("IssuedBy") + "</div>";
		
		 elCell.innerHTML =link;		 
	   }
	   
	    var formatPolicyNumLink = function(elCell, oRecord, oColumn, sData) {

				var link="<a title='Click here to goto Policy Summary' href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(conditionFlag)=Y &answer(TabPanelName)=Policy_Panel&answer(policyId)="+
					oRecord.getData("PolicyId")+ "&answer(policyVerId)="+oRecord.getData("PolicyVerId")+
					"&answer(Object::Application::ApplicationType)=POLICY_APPLICATION"+"'>"+ oRecord.getData("PolicyNumberInVer")+"</a>";					

		 elCell.innerHTML =link;
		 
		if(isNoofRecordsDisplayed==true){
			var TotalRecords = oRecord.getData("totRecords");
			document.getElementById("numberofRecords").innerHTML="Number of Policies Found : "+TotalRecords;
			isNoofRecordsDisplayed=false;
			}
	   }
	   
	   var formatTotalPremium = function(elCell, oRecord, oColumn, sData) {	
		var link= FormatCurrency(oRecord.getData('TotalPremium'));
		
		 elCell.innerHTML =link;		 
	   }
	  
	    // Column definitions 
	    var myColumnDefs = [ // sortable:true enables sorting 
	        {key:"SNo", label:"SNo", sortable:false,resizable:"false",width:30}, 
	        {key:"PolicyNumber", label:"Policy #",resizable:"false",width:100,formatter:formatPolicyNumLink,sortable:true},       
	        {key:"InsuredName", label:"Insured Name",formatter:formatLink,sortable:true,resizable:"false",width:165}, 	        
	        {key:"AgencyName", label:"Agency Name",resizable:"false",width:165,sortable:true},
	        {key:"EffectiveDate", label:"Effective Date",resizable:"false",width:80,sortable:true},
	        {key:"ExpirationDate", label:"Expiration Date",resizable:"false",width:85,sortable:true},
	        {key:"TotalPremium", label:"Total Premium",formatter:formatTotalPremium,resizable:"false",width:80,sortable:true},
	        {key:"PolicyStatus", label:"Policy Status",resizable:"false",width:75,sortable:true}
	    ]; 
	    
	    // Column definitions for Broker Login
	    var myColumnDefsBroker = [ // sortable:true enables sorting 
	        {key:"SNo", label:"SNo", sortable:false,resizable:"false",width:20}, 
	        {key:"PolicyNumber", label:"Policy #",resizable:"false",width:100,formatter:formatPolicyNumLink,sortable:true},       
	        {key:"InsuredName", label:"Insured Name",formatter:formatLink,sortable:true,resizable:"false",width:210}, 	        
	        {key:"AgencyName", label:"Agency Name",resizable:"false",width:210,sortable:true},
	        {key:"EffectiveDate", label:"Effective Date",resizable:"false",width:80,sortable:true},
	        {key:"ExpirationDate", label:"Expiration Date",resizable:"false",width:85,sortable:true},	        
	        {key:"PolicyStatus", label:"Policy Status",resizable:"false",width:75,sortable:true}
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
	            {key:"PolicyNumber"}, 
  	            {key:"PolicyNumberInVer"},
	            {key:"InsuredName"}, 
	            {key:"EffectiveDate"},
   	            {key:"ExpirationDate"},
	            {key:"TotalPremium"},
	            {key:"ProductName"},
  	            {key:"BoundDate"},
  	            {key:"BoundBy"},  	            
  	            {key:"IssuedDate"}, 
  	            {key:"IssuedBy"},
  	            {key:"AgencyName"},
  	            {key:"PolicyStatus"},
  	            {key:"PolicyId"},
  	            {key:"PolicyVerId"},
  	            {key:"CustomerId",parser:"number"}, 
  	            {key:"totRecords",parser:"number"} 	            
   	           
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
	        initialRequest: generateRequest(),        // Initial request for first page of data
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
	    if((document.getElementById("premiumPrivilage") != null) && (document.getElementById("premiumPrivilage") != undefined)) {
	    
	    	if(document.getElementById("premiumPrivilage").value == 'Yes')
			    var myDataTable = new YAHOO.widget.DataTable("dynamicdata", myColumnDefs, myDataSource, myConfigs); 
			else if(document.getElementById("premiumPrivilage").value == 'No')
				var myDataTable = new YAHOO.widget.DataTable("dynamicdata", myColumnDefsBroker, myDataSource, myConfigs); 
		}	    
	    
	    // Update totalRecords on the fly with value from server 

	    myDataTable.handleDataReturnPayload = function(oRequest, oResponse, oPayload) { 
	        oPayload.totalRecords = oResponse.meta.totalRecords; 

	        return oPayload; 
	    } 

	    return { 
	        ds: myDataSource, 
	        dt: myDataTable 
	    }; 
	    
	}(); 
}


  


