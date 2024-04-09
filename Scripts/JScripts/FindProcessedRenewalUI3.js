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

if((cbeginMM!="")&&(cbeginDD!="")&&(cbeginYY!="")) {
formElement.inpCreatedDateBegin.value=cbeginYY+"-"+cbeginMM+"-"+cbeginDD;	
}
else {
formElement.inpCreatedDateBegin.value="";
}

if((cendMM!="")&&(cendDD!="")&&(cendYY!="")) {
formElement.inpCreatedDateEnd.value=cendYY+"-"+cendMM+"-"+cendDD;
}
else {
formElement.inpCreatedDateEnd.value="";
}
if((effbeginMM!="")&&(effbeginDD!="")&&(effbeginYY!="")) {
formElement.inpEffDateBegin.value=effbeginYY+"-"+effbeginMM+"-"+effbeginDD;
}
else {
formElement.inpEffDateBegin.value="";
}
if((effendMM!="")&&(effendDD!="")&&(effendYY!="")) {
formElement.inpEffDateEnd.value=effendYY+"-"+effendMM+"-"+effendDD;
}
else {
formElement.inpEffDateEnd.value="";
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

function findProcessedRenewals(dataSourceURL) {

	if(GoTOFindButton())
		listProcessedRenewals(dataSourceURL);	
}

function listProcessedRenewals(dataSourceURL) {

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
		var link= "<div style='word-wrap: break-word'>"
					+ oRecord.getData("RenewalIssuedBy")  +
						  		  "</div>";
		 elCell.innerHTML =link;		 
		 
	   }
	   
	    var formatQuoteNumLink = function(elCell, oRecord, oColumn, sData) {	

			var parentPolicyId = oRecord.getData("ParentPolicyId");
			if(parentPolicyId != "" && parentPolicyId != null) {
		       	var link="<a href='../GetEndorsementQuoteDetail.do?answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+
		       		"&answer(QuoteId)="+oRecord.getData("RenewalQuote")+
		       		"&answer(parentPolicyStatus)="+oRecord.getData("PolicyStatus")+
		       		"&answer(parentQuoteId)="+oRecord.getData("RenewalQuote")+
		       		"&answer(policyNumber)="+oRecord.getData("RenewalPolicy")+
		       		"&answer(Object::Policy::ParentPolicyId)="+oRecord.getData("ParentPolicyId")+
		       		"&answer(Object::Policy::ParentPolicyVerId)="+oRecord.getData("ParentPolicyCurrentVerId")+
		       		"&answer(Object::Agency::AgencyId)="+oRecord.getData("agencyId")+
		       		"&answer(policyEffDate)="+oRecord.getData("RenewalPolicyEffectiveDate")+
		       		"&answer(policyExpDate)="+oRecord.getData("RenewalPolicyExpirationDate")+"'>"
				   			+ oRecord.getData("RenewalQuoteNumber")  +
				  		  "</a>";
			} else {
				var link="<a href='../GetEndorsementQuoteDetail.do?answer(Object::Customer::CustomerId)="+oRecord.getData("CustomerId")+
		       		"&answer(QuoteId)="+oRecord.getData("RenewalQuote")+
		       		"&answer(parentPolicyStatus)="+oRecord.getData("PolicyStatus")+
		       		"&answer(parentQuoteId)="+oRecord.getData("RenewalQuote")+
		       		"&answer(policyNumber)="+oRecord.getData("RenewalPolicy")+
		       		"&answer(Object::Policy::ParentPolicyId)="+oRecord.getData("PolicyId")+
		       		"&answer(Object::Policy::ParentPolicyVerId)="+oRecord.getData("ParentPolicyCurrentVerId")+
		       		"&answer(Object::Agency::AgencyId)="+oRecord.getData("agencyId")+
		       		"&answer(policyEffDate)="+oRecord.getData("RenewalPolicyEffectiveDate")+
		       		"&answer(policyExpDate)="+oRecord.getData("RenewalPolicyExpirationDate")+"'>"
				   			+ oRecord.getData("RenewalQuoteNumber")  +
				  		  "</a>";
			}
			if(isNoofRecordsDisplayed==true){
				var TotalRecords = oRecord.getData("totRecords");
				document.getElementById("numberofRecords").innerHTML="Number of Policies Found : "+TotalRecords;
				isNoofRecordsDisplayed=false;
			}
			     		  elCell.innerHTML =link;
	   }				 
	   
	    var formatPolicyNumLink = function(elCell, oRecord, oColumn, sData) {

					var link="<a href='../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(conditionFlag)=Y &answer(TabPanelName)=Policy_Panel&answer(policyId)="+
					oRecord.getData("PolicyId")+ "&answer(policyVerId)="+oRecord.getData("PolicyVerId")+
					"&answer(Object::Application::ApplicationType)=POLICY_APPLICATION"+"'>"+ oRecord.getData("PolicyNumberInVer")+"</a>";	
						  		  

		 elCell.innerHTML =link;
		 
		if(isNoofRecordsDisplayed==true){
			var TotalRecords = oRecord.getData("totRecords");
			document.getElementById("numberofRecords").innerHTML="Number of Policies Found : "+TotalRecords;
			isNoofRecordsDisplayed=false;
			}
	   }
	   
	   var formatRenewalPremium = function(elCell, oRecord, oColumn, sData) {	
		var link= FormatCurrency(oRecord.getData('RenewalPremium'));
		
		 elCell.innerHTML =link;		 
	   }
	 
	    // Column definitions 
	    var myColumnDefs = [ // sortable:true enables sorting 
	        {key:"SNo", label:"SNo", sortable:false,resizable:"false",width:30}, 
	        {key:"RenewalQuote", label:"Quote #",resizable:"false",width:40,formatter:formatQuoteNumLink, sortable:true}, 
	        {key:"InsuredName", label:"Insured Name",formatter:formatLink,sortable:true,resizable:"false",width:85}, 
	        {key:"AgencyName", label:"Agency Name",sortable:true,resizable:"false",width:85}, 
	        {key:"RenewalQuoteStatus", label:"Quote Status",resizable:"false",width:65, sortable:true}, 
	        {key:"RenewalPremium", label:"Premium",formatter:formatRenewalPremium,resizable:"false",width:60, sortable:true}, 	        
	        {key:"RenewalQuoteEffectiveDate", label:"Quote Eff Date",resizable:"false",width:80,sortable:true},        
	        {key:"RenewalIssuedDate", label:"Issued Date",resizable:"false",width:70,sortable:true},
	        {key:"RenewalIssuedBy", label:"Issued By",formatter:formatIssuedBy,resizable:"false",width:100,sortable:true},
	        {key:"RenewalPolicy", label:"Policy #",resizable:"false",width:110,formatter:formatPolicyNumLink,sortable:true} 	        
	         
	    ]; 
	    
	    // Column definitions for Broker Login	    
	    var myColumnDefsBroker = [ // sortable:true enables sorting 
	        {key:"SNo", label:"SNo", sortable:false,resizable:"false",width:30}, 
	        {key:"RenewalQuote", label:"Quote #",resizable:"false",width:40,formatter:formatQuoteNumLink, sortable:true}, 
	        {key:"InsuredName", label:"Insured Name",formatter:formatLink,sortable:true,resizable:"false",width:125}, 
	        {key:"AgencyName", label:"Agency Name",sortable:true,resizable:"false",width:120}, 
	        {key:"RenewalQuoteStatus", label:"Quote Status",resizable:"false",width:65, sortable:true}, 
	        {key:"RenewalQuoteEffectiveDate", label:"Quote Eff Date",resizable:"false",width:80,sortable:true},        
	        {key:"RenewalIssuedDate", label:"Issued Date",resizable:"false",width:70,sortable:true},
	        {key:"RenewalIssuedBy", label:"Issued By",formatter:formatIssuedBy,resizable:"false",width:100,sortable:true},
	        {key:"RenewalPolicy", label:"Policy #",resizable:"false",width:110,formatter:formatPolicyNumLink,sortable:true} 	        
	         
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
	            {key:"RenewalQuote"}, 
	            {key:"RenewalQuoteNumber"},
	            {key:"InsuredName"}, 
	            {key:"AgencyName"},
	            {key:"RenewalQuoteStatus"},
   	            {key:"RenewalPremium"},
	            {key:"RenewalTerm"},
	            {key:"RenewalQuoteEffectiveDate"},
  	            {key:"RenewalQuoteCreatedDate"},
  	            {key:"RenewalQuoteCreatedBy"},  	            
  	            {key:"RenewalPolicy"}, 
  	            {key:"RenewalBoundDate"},
  	            {key:"RenewalBoundBy"},  
  	            {key:"RenewalIssuedDate"},
  	            {key:"RenewalIssuedBy"},  
  	            {key:"ParentPolicyId"},
  	            {key:"ParentPolicyVerId"},
  	            {key:"PolicyNumberInVer"},
  	            {key:"PolicyStatus"},
  	            {key:"RenewalPolicyEffectiveDate"},
  	            {key:"RenewalPolicyExpirationDate"},
  	            {key:"ownerId",parser:"number"},
  	            {key:"userId1",parser:"number"}, 
  	            {key:"agencyId",parser:"number"},
  	            {key:"PolicyId"},
  	            {key:"PolicyVerId"},
  	            {key:"ParentPolicyCurrentVerId"},
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




