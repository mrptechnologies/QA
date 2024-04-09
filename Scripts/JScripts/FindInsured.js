
 function FindInsured(dataSourceURL)
{
	if(GoTOFindButton()) {
		document.getElementById("DivTotalRecords").innerHTML="Number of Insureds Found : 0";
		listInsured(dataSourceURL);	
	}
}

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


if(CrebeginMM!="" && CrebeginDD!="" && CrebeginYY!="" && CreendMM=="" && CreendDD=="" && CreendYY=="") {
	alert("Please Enter Created Date To");
	return false;
}
if(CrebeginMM=="" && CrebeginDD=="" && CrebeginYY=="" && CreendMM!="" && CreendDD!="" && CreendYY!="") {
	alert("Please Enter Created Date From");
	return false;
}
if(beginMM!="" && beginDD!="" && beginYY!="" && endMM=="" && endDD=="" && endYY=="") {
	alert("Please Enter Last Modified To");
	return false;
}
if(beginMM=="" && beginDD=="" && beginYY=="" && endMM!="" && endDD!="" && endYY!="") {
	alert("Please Enter Last Modified  From");
	return false;
}
if(CreendYY!="" && CrebeginMM < 1 || CrebeginMM > 12){
	alert("month should be 1-12");
	return false;
}	
if(beginMM!="" && beginMM < 1 || beginMM > 12){
	alert("month should be 1-12");
	return false;
}
if(endMM!="" && endMM < 1 ||endMM > 12){
	alert("month should be 1-12");
	return false;
}
if(CreendMM!="" && CreendMM < 1 || CreendMM > 12){
	alert("month should be 1-12");
	return false;
}

if(CrebeginDD!="" && CrebeginDD < 1 || CrebeginDD > 31){
	alert("date should be 1-31");
	return false;
}	
if(beginDD!="" && beginDD < 1 || beginDD > 31){
	alert("date should be 1-31");
	return false;
}
if(endDD!="" && endDD < 1 ||endDD > 31){
	alert("date should be 1-31");
	return false;
}
if(CreendDD!="" && CreendDD < 1 || CreendDD > 31){
	alert("date should be 1-31");
	return false;
}

if(beginYY!="" && beginYY<999){
	alert("year should be >999");
	return false;
}
if(endYY!="" && endYY<999){
	alert("year should be >999");
	return false;
}
if(CrebeginYY!="" && CrebeginYY<999){
	alert("year should be >999");
	return false;
}
if(CreendYY!="" && CreendYY<999){
	alert("year should be >999");
	return false;
}


if(isNaN(CrebeginMM)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(CrebeginDD)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(CrebeginYY)){
		alert("should be numeric.");
		return false;
		
	}		
if(isNaN(beginDD)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(beginYY)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(beginMM)){
		alert("should be numeric.");
		return false;
		
	}		
if(isNaN(endMM)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(endDD)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(endYY)){
		alert("should be numeric.");
		return false;
		
	}		
if(isNaN(CreendMM)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(CrebeginDD)){
		alert("should be numeric.");
		return false;
		
	}
if(isNaN(CreendYY)){
		alert("should be numeric.");
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


function listInsured(dataSourceURL) { 
 YAHOO.example.DynamicData = function() { 			  		  
	   
	   
	  
	    // Column definitions 
	    var myColumnDefs = [ // sortable:true enables sorting 
	        {key:"SNo", label:"SNo", sortable:false,resizable:"false",width:30}, 
	        {key:"InsuredNumber", label:"Insured Number",sortable:true,resizable:"false",width:85}, 
	        {key:"InsuredName", label:"Insured Name",sortable:true,resizable:"false",width:238}, 
	        {key:"Address", label:"Address", sortable:false,resizable:"false",width:265}, 
      		{key:"City", label:"City", sortable:true,resizable:"false",width:85},
	        {key:"State", label:"State", sortable:true,resizable:"false",width:40},
   	        {key:"Zip", label:"Zip", sortable:true,resizable:"false",width:50}
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
	            {key:"InsuredNumber"}, 
	            {key:"InsuredName"}, 
	            {key:"Address"},
   	            {key:"City"},
	            {key:"State"},
  	            {key:"Zip"},
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
		document.getElementById("DivTotalRecords").innerHTML="Number of Insureds Found : "+TotalRecords;
	});
   

	    return { 
	        ds: myDataSource, 
	        dt: myDataTable 
	    }; 
	    
	}(); 
}	
  

