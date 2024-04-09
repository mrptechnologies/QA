function editAjaxNameInvolvementDetails(additionalInsuredId) {
document.getElementById("editNameInvolvementDiv").innerHTML="";
 loadNameInvolvementDetail(additionalInsuredId);
	document.getElementById("editNameInvolvementDiv").style.display = "block";
	document.getElementById("nameInvolvementDiv").style.display = "block";  
	
	  // Instantiate the Dialog
 YAHOO.example.container.nameInvolvementDiv = new YAHOO.widget.Dialog("nameInvolvementDiv", 
       { width : "80em",
         fixedcenter : true,
         visible : false, underlay:"shadow",
         constraintoviewport : true
       });
    YAHOO.example.container.nameInvolvementDiv.render();   
	YAHOO.example.container.nameInvolvementDiv.show();
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
		      synchronous:true,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);},onException:function(){}
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

function editCoverageDetails(coverageDetailId,transactionDetailId) {

	document.getElementById("coverageDiv").innerHTML="";
	loadCoverageDetails(coverageDetailId,transactionDetailId);
	 document.getElementById("coverageDiv").style.display = "block";
	 document.getElementById("coverageDivParent").style.display = "block";
	  // Instantiate the Dialog
	 YAHOO.example.container.coverageDiv = new YAHOO.widget.Dialog("coverageDivParent", 
	       { width : "80em",
	         fixedcenter : true,
	         visible : false, underlay:"shadow",
	         constraintoviewport : true
	       });

	 YAHOO.example.container.coverageDiv.render();
	 YAHOO.example.container.coverageDiv.show();


	}

function loadCoverageDetails(coverageDetailId,transactionDetailId){
	 
	  var panel="coverageDiv";    
	  var url='../GetCoverageDetails.do?answer(Object::Transaction::Coverage::CoverageDetailId)= '+coverageDetailId+'&answer(Object::TakeUp::TransactionDetailId)= '+transactionDetailId;
	   try {
	    autologout();
	    new Ajax.Updater(
	      panel,
	      url,
	      {
	       synchronous:true,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);},onException:function(){}
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