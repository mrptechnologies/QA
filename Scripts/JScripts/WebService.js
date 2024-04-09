
function editNameInvolvementDetails(additionalInsuredId) {
document.getElementById("nameInvolvementDiv").style.display = "block";  
document.getElementById("editNameInvolvementDiv").innerHTML="";
 loadNameInvolvementDetail(additionalInsuredId);
	document.getElementById("editNameInvolvementDiv").style.display = "block";
		// Instantiate the Dialog
	YAHOO.example.container.nameInvolvementDiv = new YAHOO.widget.Dialog("nameInvolvementDiv", 
							{ width : "80em",
							  fixedcenter : true,
							  visible : false, underlay:"shadow",
							  constraintoviewport : true,close:false
							});

	YAHOO.example.container.nameInvolvementDiv.render();
	YAHOO.example.container.nameInvolvementDiv.show();

YAHOO.util.Event.on('closeIcon2', 'click', function(e) {
     YAHOO.example.container.nameInvolvementDiv.cancel();
     closeNameInvolvementContainer();
    })
}

function closeNameInvolvementContainer(){
YAHOO.example.container.nameInvolvementDiv.cancel();
document.getElementById("nameInvolvementDiv").style.display = "none";  
}

function loadNameInvolvementDetail(additionalInsuredId){
 
  var panel="editNameInvolvementDiv";	   
  var url='../GetNameInvolvementDetails.do?answer(Object::Transaction::NameInvolvement::AdditionalInsuredId)= '+additionalInsuredId;

	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true,onComplete:function(){
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
  
 function submitNameInvolvementDetails() {
 var panel="nameInvolvementInfoDiv";
 
  var url='../UpdateNameInvolvementDetails.do';                              			
   try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.getElementById('nameInvolvementForm')).serialize(this), onComplete:function(){
	    	 if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
	    		forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
	      }alert(transport.responseText);},onException:function(){}
	     }
	    );
	  }catch(err) { 
	   txt="There was an error on this page.\n\n";
	   txt+="Error description: " + err.description + "\n\n";
	   txt+="Click OK to continue.\n\n";
	   alert(txt);
	  }	 
YAHOO.example.container.nameInvolvementDiv.cancel();	
 document.getElementById("nameInvolvementDiv").style.display = "none"; 

  return false;   
 }
 
 function editINFLocationDetails(locationDetailId) {
 document.getElementById("infLocationDiv").style.display = "block";  
 document.getElementById("editINFLocationDetailsDiv").innerHTML="";
 loadINFLocationDetail(locationDetailId);
	document.getElementById("editINFLocationDetailsDiv").style.display = "block";
		// Instantiate the Dialog
	YAHOO.example.container.infLocationDiv = new YAHOO.widget.Dialog("infLocationDiv", 
							{ width : "80em",
							  fixedcenter : true,
							  visible : false, underlay:"shadow",
							  constraintoviewport : true,close:false
							});

	YAHOO.example.container.infLocationDiv.render();
	YAHOO.example.container.infLocationDiv.show();

YAHOO.util.Event.on('closeIcon3', 'click', function(e) {
   YAHOO.example.container.infLocationDiv.cancel();
   closeLocationContainer(); 
    })
}

function closeLocationContainer(){
YAHOO.example.container.infLocationDiv.cancel();
document.getElementById("infLocationDiv").style.display = "none";  
}

function loadINFLocationDetail(locationDetailId){

  var panel="editINFLocationDetailsDiv";	   
  var url='../GetINFLocationDetails.do?answer(Object::INFLocation::LocationDetailId)= '+locationDetailId;
 
	  try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true,onComplete:function(){
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
  
 function submitINFLocationDetails() {
 var panel="INFLocationInfoDiv";
 
  var url='../UpdateINFLocationtDetails.do';                              			
   try {
	   autologout();
	   new Ajax.Updater(
	     panel,
	     url,
	     {
	      synchronous:true, parameters:$(document.getElementById('infLocationDetailsForm')).serialize(this), onComplete:function(){
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
YAHOO.example.container.infLocationDiv.cancel();	
closeLocationContainer(); 

  return false;   
 }
 
 function ValidateFields() {
 document.getElementById("transactionStatus1").value = document.getElementById("transactionStatus").value;

 }
 
 
 
 function editSubmissionCoverageDetails(coverageDetailId,transactionDetailId) {
 document.getElementById("coverageDiv").style.display = "block";  
 document.getElementById("editCoverageDetailDiv").innerHTML="";
loadSubmissionCoverageDetails(coverageDetailId,transactionDetailId);
 document.getElementById("editCoverageDetailDiv").style.display = "block";
  // Instantiate the Dialog
 YAHOO.example.container.coverageDiv = new YAHOO.widget.Dialog("coverageDiv", 
       { width : "80em",
         fixedcenter : true,
         visible : false, underlay:"shadow",
         constraintoviewport : true,close:false
       });

 YAHOO.example.container.coverageDiv.render();
 YAHOO.example.container.coverageDiv.show();

YAHOO.util.Event.on('closeIcon4', 'click', function(e) {
  
   YAHOO.example.container.coverageDiv.cancel();
   closeSubmissionSectionCoverageContainer();
    })
}


function loadSubmissionCoverageDetails(coverageDetailId,transactionDetailId){
  var panel="editCoverageDetailDiv";    
  var url='../GetSubmissionCoverageDetails.do?answer(Object::Transaction::Coverage::CoverageDetailId)= '+coverageDetailId+'&answer(Object::Transaction::TransactionDetailId)= '+transactionDetailId;
   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
       synchronous:true,onComplete:function(){
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
  
  
 function submitSubmissionSectionCoverageDetails() {
 var panel="coverageListDiv";
  var url='../UpdateSubmissionSectionCoverageDetailAction.do';                                 
   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
       synchronous:true, parameters:$(document.getElementById('sectionCoverageForm')).serialize(this), onComplete:function(){
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
YAHOO.example.container.coverageDiv.cancel(); 
document.getElementById("coverageDiv").style.display = "none"; 

  return false;   
 }  
 
function closeSubmissionSectionCoverageContainer(){
YAHOO.example.container.coverageDiv.cancel();
document.getElementById("coverageDiv").style.display = "none";  
} 

function editQuoteCoverageDetails(coverageDetailId,transactionDetailId) {
 document.getElementById("coverageDiv").style.display = "block";  
 document.getElementById("editCoverageDetailDiv").innerHTML="";
loadQuoteCoverageDetails(coverageDetailId,transactionDetailId);
 document.getElementById("editCoverageDetailDiv").style.display = "block";
  // Instantiate the Dialog
 YAHOO.example.container.coverageDiv = new YAHOO.widget.Dialog("coverageDiv", 
       { width : "80em",
         fixedcenter : true,
         visible : false, underlay:"shadow",
         constraintoviewport : true,close:false
       });

 YAHOO.example.container.coverageDiv.render();
 YAHOO.example.container.coverageDiv.show();

YAHOO.util.Event.on('closeIcon5', 'click', function(e) {
   YAHOO.example.container.coverageDiv.cancel();
   closeQuoteSectionCoverageContainer();
    })
}


function loadQuoteCoverageDetails(coverageDetailId,transactionDetailId){
  var panel="editCoverageDetailDiv";    
  var url='../GetQuoteCoverageDetails.do?answer(Object::Transaction::Coverage::CoverageDetailId)= '+coverageDetailId+'&answer(Object::Transaction::TransactionDetailId)= '+transactionDetailId;
   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
       synchronous:true,onComplete:function(){
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
  
  
 function submitQuoteSectionCoverageDetails() {
 var panel="coverageListDiv";
  var url='../UpdateQuoteSectionCoverageDetail.do';                                 
   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
       synchronous:true, parameters:$(document.getElementById('sectionCoverageForm')).serialize(this), onComplete:function(){
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
YAHOO.example.container.coverageDiv.cancel(); 
document.getElementById("coverageDiv").style.display = "none"; 

  return false;   
 }  
 
function closeQuoteSectionCoverageContainer(){
YAHOO.example.container.coverageDiv.cancel();
document.getElementById("coverageDiv").style.display = "none";  
} 



function editEndorsementCoverageDetails(coverageDetailId,transactionDetailId) {
 document.getElementById("coverageDiv").style.display = "block";  
 document.getElementById("editCoverageDetailDiv").innerHTML="";
loadEndorsementCoverageDetails(coverageDetailId,transactionDetailId);
 document.getElementById("editCoverageDetailDiv").style.display = "block";
  // Instantiate the Dialog
 YAHOO.example.container.coverageDiv = new YAHOO.widget.Dialog("coverageDiv", 
       { width : "80em",
         fixedcenter : true,
         visible : false, underlay:"shadow",
         constraintoviewport : true,close:false
       });

 YAHOO.example.container.coverageDiv.render();
 YAHOO.example.container.coverageDiv.show();

YAHOO.util.Event.on('closeIcon5', 'click', function(e) {
   YAHOO.example.container.coverageDiv.cancel();
   closeEndorsementSectionCoverageContainer();
    })
}


function loadEndorsementCoverageDetails(coverageDetailId,transactionDetailId){
  var panel="editCoverageDetailDiv";    
  var url='../GetEndorsementCoverageDetails.do?answer(Object::Transaction::Coverage::CoverageDetailId)= '+coverageDetailId+'&answer(Object::Transaction::TransactionDetailId)= '+transactionDetailId;
   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
       synchronous:true,onComplete:function(){
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
  
  
 function submitEndorsementSectionCoverageDetails() {
 var panel="coverageListDiv";
  var url='../UpdateEndorsementSectionCoverageDetail.do';                                 
   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
       synchronous:true, parameters:$(document.getElementById('sectionCoverageForm')).serialize(this), onComplete:function(){
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
YAHOO.example.container.coverageDiv.cancel(); 
document.getElementById("coverageDiv").style.display = "none"; 

  return false;   
 }  
 
function closeEndorsementSectionCoverageContainer(){
YAHOO.example.container.coverageDiv.cancel();
document.getElementById("coverageDiv").style.display = "none";  
} 