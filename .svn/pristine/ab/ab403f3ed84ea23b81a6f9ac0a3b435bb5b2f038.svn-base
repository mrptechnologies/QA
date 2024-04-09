function  SubmitToCreateQuote(){
    var url="/AutomatedRenwalQuoteAction.do?";
    var panel="Auto Renewal Quote Creation Process is Running...";
  	var form=document.forms[0];
		document.forms[0].inpDateBegin.value=form.Date3.value+"-"+form.Date1.value+"-"+form.Date2.value;
		document.forms[0].inpDateEnd.value=form.Date6.value+"-"+form.Date4.value+"-"+form.Date5.value;

  	try {	    
	    new Ajax.Updater(
					panel,
					url,
					{
						synchronous:true,
						parameters:$(document.forms[0]).serialize(this),
						onComplete: function(){
							 if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
								 forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
							 }
						     form.panel.style.display='inline';    						
						}
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
 
 function  SubmitToOfferQuote(){	
    var url="/AutomatedRenewalOfferAction.do?";
  	var panel="Auto Renewal Quote Offer Process is Running...";
  	var form=document.forms[0];
		document.forms[0].inpDateBegin.value=form.Date3.value+"-"+form.Date1.value+"-"+form.Date2.value;
		document.forms[0].inpDateEnd.value=form.Date6.value+"-"+form.Date4.value+"-"+form.Date5.value;

  	try {	    
	    new Ajax.Updater(
					panel,
					url,
					{
						synchronous:true,
						parameters:$(document.forms[0]).serialize(this),
						onComplete: function(){
						if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
							 forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
						 }    						
						}
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
 
 function QuoteCreateDisable(formElement){
	 if(document.getElementById("QuoteProposalSubmit") != null && document.getElementById("QuoteProposalSubmit") != undefined) {
		 document.getElementById("QuoteProposalSubmit").disabled = true;
	 }
}
 function QuoteOfferDisable(formElement){
	document.getElementById("AutoOfferSubmit").disabled = true;	
}

function QuoteCreateEnable(formElement){
	if(document.getElementById("QuoteProposalSubmit") != null && document.getElementById("QuoteProposalSubmit") != undefined) {
		document.getElementById("QuoteProposalSubmit").disabled = false;
	}
	if(document.getElementById("AutoOfferSubmit") != null && document.getElementById("AutoOfferSubmit") != undefined) {
		document.getElementById("AutoOfferSubmit").disabled = true;
	}
}
function QuoteOfferEnable(formElement){
	document.getElementById("AutoOfferSubmit").disabled = false;
	document.getElementById("QuoteProposalSubmit").disabled = true;		
}
function QuoteProposalEnable1(formElement){
	document.getElementById("QuoteProposalSubmit").disabled = false;
}

