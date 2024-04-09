 /**
 * AJAX - to list Agencies in the create submission
 * @author Mohan R
 */ 
 
 //To load the Available agencies in the yahoo data table 
var agencyId=0; 


 function listAgency(dataSourceURL) { 
 	   autologout();
		
    YAHOO.example.XHR_Text = function() {
    
    		var formatRadio = function(elCell, oRecord, oColumn, sData) {	    	  		
	   		var html = "<input type='radio' name='LoginPage' id='Select' class='chk1' style='width:18px;'>"
	   		elCell.innerHTML = html;
	   }
	   	 var formatCity = function(elCell, oRecord, oColumn, sData) {	
			var link= "<div style='word-wrap: break-word'>" + oRecord.getData("City") + "</div>";
			
			 elCell.innerHTML =link;		 
		   }

       var moreColumnDefs = [
            {key:"Code", resizable:"false",width:55},
            {key:"Agency Name", resizable:"false",width:150},
            {key:"Branch Name", resizable:"false",width:65},
            {key:"List Name", resizable:"false",width:85},
            {key:"Address Line 1",  resizable:"false",width:90},
            {key:"Address Line 2", resizable:"false",width:90},
            {key:"City", resizable:"false",formatter:formatCity,width:65},
            {key:"State",  resizable:"false",width:20},
            {key:"Zip",  resizable:"false",width:30},
            {key:"Status",  resizable:"false",width:25},
            {key:"Select",formatter:formatRadio,resizeable:false}]; 
                       
		
		document.getElementById('divSelectButton').style.display='block';
		document.getElementById('divSelectButton1').style.display='block';
        
		
        var anotherDataSource = new YAHOO.util.DataSource(dataSourceURL);
        anotherDataSource.connMethodPost = true;
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Code","Agency Name","Branch Name","List Name","Address Line 1","Address Line 2","City","State","Zip","Status","Select","AgencyID"]
        };        
        
        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });
 	
 	        // Configuration for Pagination
        var myConfigs = {   
    	   initialRequest: generateListAgencyRequest(), // Initial request for first page of data 
    	   generateRequest: generateListAgencyRequest ,
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 20, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
 	
        
      var myDataTableY = new YAHOO.widget.ScrollingDataTable("AGENCY_LIST", moreColumnDefs,anotherDataSource,myConfigs,{height:"10em"});  
        
        
        
            myDataTableY.subscribe('cellClickEvent',function(oArgs) {
	    	var target = oArgs.target;
	    	var record = myDataTableY.getRecord(target);
	    	agencyId = record.getData("AgencyID");
			document.getElementById('agencId').value=agencyId
			document.getElementById('agencyName').value=record.getData("Agency Name");

	   });
  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();

 }
 
 // To submit agency selection page from the agency list
 function selectAgent(){
var agencyId=document.getElementById('agencId').value;
if(agencyId!="" && agencyId!=null && agencyId!=undefined){
 document.forms[0].submit();
 }else{
 alert("Please select the Agency");
 }
 }
 
  // To submit agency selection page from the agency list
 function submitAgent(){
 document.forms[0].submit();
 }
 function callSubmitEditAgency() {
 var result=validateFields();
 if(result!=false) {
 submitEditAgency();
 }
 }
 
function validateFields(){
	var formElement=document.forms[0];
	if(formElement.BusinessName.value=="")
	{
		alert("	Please enter the General Agency / Agency Name.");
		return false;
	}
	if(formElement.GeneralAgency.value=="")
	{
		alert("	Please enter the General Agency you are  Sub-producer to.");
		return false;
	}
	if((parseFloat(formElement.AgencyCommission.value)>100) || (parseFloat(formElement.AgencyCommission.value)<0))
	{
		alert("Agency Commission should be between 0-100%");
		return false;
	}
	
	if(formElement.AgencyCommission.value==""){
		alert("Please enter the Agency Commission");
		return false;
	}
	
	if(formElement.AgencyCommission.value!="" && isNaN(formElement.AgencyCommission.value)) {
		alert("Agency Commission should be numeric");
		return false;
	}
	if(formElement.State.value=="")
	{
		alert("Please enter the State Value.");
		return false;
	}
	if(formElement.Zip.value=="")
	{
		alert("Please enter the Zip Code Value.");
		return false;
	}
	
	return true;

}




 
  function submitEditAgency(){
  
//document.forms[0].action="../EditAgency.do";
 //document.forms[0].submit();
 
//document.getElementById("dialog1").style.display = "none";

var contractStartYear=document.getElementById("StartYear").value;
var contractStartMonth=document.getElementById("StartMonth").value;
var contractStartDate=document.getElementById("StartDate").value;

var contractEndYear=document.getElementById("EndYear").value;
var contractEndMonth=document.getElementById("EndMonth").value;
var contractEndDate=document.getElementById("EndDate").value;


var pn1=document.getElementById("BusinessPhoneNum").value;
var fn1=document.getElementById("BusinessFaxNum").value;
var pn2=document.getElementById("PersonalPhoneNum").value;
var fn2=document.getElementById("PersonalFaxNum").value;
if(contractStartMonth!="" && contractStartMonth < 1 || contractStartMonth > 12){
	alert("Month should be 1-12");
	document.forms[0].StartMonth.focus();
	return false;
}
if(contractStartDate!="" && contractStartDate < 1 || contractStartDate > 31){
	alert("Date should be 1-31");
	document.forms[0].StartDate.focus();
	return false;
}	
if(contractStartYear!="" && contractStartYear<1000){
	alert("Please enter the valid year");
	document.forms[0].StartYear.focus();
	return false;
}
if(contractEndMonth!="" && contractEndMonth < 1 || contractEndMonth > 12){
	alert("Month should be 1-12");
	document.forms[0].EndMonth.focus();
	return false;
}
if(contractEndDate!="" && contractEndDate < 1 || contractEndDate > 31){
	alert("Date should be 1-31");
	document.forms[0].EndDate.focus();
	return false;
}	
if(contractEndYear!="" && contractEndYear<1000){
	alert("Please enter the valid year");
	document.forms[0].EndYear.focus();
	return false;
}
if(isNaN(contractStartMonth)){
	alert("Month should be numeric.");
	document.forms[0].StartMonth.focus();
	return false;		
}
if(isNaN(contractStartDate)){
	alert("Date should be numeric.");
	document.forms[0].StartDate.focus();
	return false;		
}
if(isNaN(contractStartYear)){
	alert("Year should be numeric.");
	document.forms[0].StartYear.focus();
	return false;		
}
if(isNaN(contractEndMonth)){
	alert("Month should be numeric.");
	document.forms[0].EndMonth.focus();
	return false;		
}
if(isNaN(contractEndDate)){
	alert("Date should be numeric.");
	document.forms[0].EndDate.focus();
	return false;		
}
if(isNaN(contractEndYear)){
	alert("Year should be numeric.");
	document.forms[0].EndYear.focus();
	return false;		
}
if((contractStartMonth==2 && contractStartDate>29 && (contractStartYear%4==0)) || (contractStartMonth==2 && contractStartDate>28 && (contractStartYear%4!=0))) {
	alert("'Contract Start Date' is Invalid");
	return false;
}
if((contractEndMonth==2 && contractEndDate>29 && (contractEndYear%4==0)) || (contractEndMonth==2 && contractEndDate>28 && (contractEndYear%4!=0))) {
	alert("'Contract End Date' is Invalid");
	return false;
}
if(!isInteger(pn1)){
		 alert("Please enter the valid phone number");
		 return false;
	 }
if(!isInteger(fn1)){
		 alert("Please enter the valid fax number");
		 return false;
	 }	 
if(!isInteger(pn2)){
		 alert("Please enter the valid phone number");
		 return false;
}	
if(!isInteger(fn2)){
		 alert("Please enter the valid fax number");
		 return false;
}
var contractStartDate=contractStartYear+'-'+contractStartMonth+'-'+contractStartDate;
var contractEndDate=contractEndYear+'-'+contractEndMonth+'-'+contractEndDate;

document.getElementById("contractStartDate").value=contractStartDate;
document.getElementById("contractEndDate").value=contractEndDate;	 

  var panel="agencyInfo";
  var url='../EditAgencyUI3.do';                              			

	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){
	    	 if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
	    		forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
	      }},onException:function(){}
	     }
	    );
	  }catch(err) { 
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }	 
YAHOO.example.container.dialog1.cancel();	
closeContainer(); 
  return false;   
 }
  function isInteger(s){
		var i;
	    for (i = 0; i < s.length; i++){   
	        // Check that current character is number.
	        var c = s.charAt(i);         
	        if ((c < "0") || (c > "9")) return false;
	    }
	    // All characters are numbers.
	    return true;
	}
 //To load Agency information in the POPUp Window in UI3
 function loadPopupAgencyDetail(){
 
  var panel="dialog1";	   
  var agencyId=document.getElementById('agencyId').value;  
  var agencyName=document.getElementById('agencyName').value;
  var url='../AjaxEditAgencies.do?TabPanelName=Submission_Panel&agencyId='+agencyId+'&primaryObjectId='+agencyId+'&primaryObjectType=AGENCY'+agencyName;                              			

	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){
	    	 if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
	    		forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
	      }},onException:function(){}
	     }
	    );
	  }catch(err) {
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }	  
	
  return false;
  }
 
 
 /**
  *This method is used to generate the Request 
  *author Sathiyaseelan M
  */
  var generateListAgencyRequest = function() {
		var dbname=document.getElementById("dbname").value;	
		var ParentAgencyId=document.getElementById("ParentAgencyId").value;
		var LimitSearch=document.getElementById("LimitSearch").value;
		var inpPageNum=document.getElementById("inpPageNum").value;
		var orderby=document.getElementById("orderby").value;
		var OwnerId=document.getElementById("OwnerId").value;
		var AgencyCode=document.getElementById("AgencyCode").value;
		var BusinessName=encodeURIComponent(document.getElementById("BusinessName").value);
		var State=document.getElementById("State").value;
        // Build custom request
        return  "answer(TabPanelName)=Submission_Panel&answer(dbname)="+dbname+"&answer(Agency::NotEquals::ParentAgencyId)="+ParentAgencyId+"&LimitSearch="+LimitSearch+"&answer(Object::Agency::PageNum)="+inpPageNum+"&answer(orderby)="+orderby+"&answer(Agency::Equals::OwnerId)="+OwnerId+"&answer(Agency::Like::AgencyCode)="+AgencyCode+"&answer(Agency::Like::BusinessName)="+BusinessName+"&answer(Address::Equals::State)="+State+"&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME ASC";
    };
    
    function updateCount(url){
		document.getElementById('divSelectButton').style.display='block'; 	
 		new Ajax.Request(url, {method: 'post',parameters:generateListAgencyRequest(),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){
 		document.getElementById("AgencyCount").innerHTML = "Number of Agencies Found: "+transport.responseText;
 		}});
 
 
 }


