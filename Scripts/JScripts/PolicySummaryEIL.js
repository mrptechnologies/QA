/***********************************************
* Dolphin Tabs Menu- by JavaScript Kit (www.javascriptkit.com)
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more
***********************************************/

var dolphintabs={
	subcontainers:[], last_accessed_tab:null,

	revealsubmenu:function(curtabref){
	this.hideallsubs()
	if (this.last_accessed_tab!=null)
		this.last_accessed_tab.className=""
	if (curtabref.getAttribute("rel")) //If there's a sub menu defined for this tab item, show it
	document.getElementById(curtabref.getAttribute("rel")).style.display="block"
	curtabref.className="current"
	this.last_accessed_tab=curtabref
	},

	hideallsubs:function(){
	for (var i=0; i<this.subcontainers.length; i++)
		document.getElementById(this.subcontainers[i]).style.display="none"
	},


	init:function(menuId, selectedIndex){
	var tabItems=document.getElementById(menuId).getElementsByTagName("a")
		for (var i=0; i<tabItems.length; i++){
			if (tabItems[i].getAttribute("rel"))
				this.subcontainers[this.subcontainers.length]=tabItems[i].getAttribute("rel") //store id of submenu div of tab menu item
			if (i==selectedIndex){ //if this tab item should be selected by default
				tabItems[i].className="current"
				this.revealsubmenu(tabItems[i])
			}
		tabItems[i].onmouseover=function(){		
		//dolphintabs.revealsubmenu(this)  ***commented to avoid toggling on mouse move***
		}
		} //END FOR LOOP
	}

}	  		

function showPolicySummary(headerName){
dolphintabs.init(headerName,0);
}

function showInsured(headerName){
dolphintabs.init(headerName,1);
}

function showDocuments(headerName){
dolphintabs.init(headerName,2);
}

function showApplication(headerName){
dolphintabs.init(headerName,3);
}

function showPayment(headerName){
dolphintabs.init(headerName,4);
}

function showPostBoundCheckList(headerName){
dolphintabs.init(headerName,5);
var formElement = document.forms[0];

formElement.signedNo.checked=true;
formElement.proofNo.checked=true;
formElement.applicatNo.checked=true;

}

function showEndorsements(headerName){
dolphintabs.init(headerName,7);
}

function showReinsurance(headerName){
dolphintabs.init(headerName,6);
}


function showTabs(headerName,index){
	dolphintabs.init(headerName,index);
}



/**
  * Function to set the Hidden variables for the Reinsurance Tab.
  *
  */	


function setDefault(frm){
	
    /**
     * To set the Owner ID
     */
    if(document.getElementById("ownerIdfrmjsp") !=null && document.getElementById("ownerIdfrmjsp") !=undefined) {
 	var objvalue=document.getElementById("ownerIdfrmjsp").value;
 	
	 	if(frm.OwnerId!=null && frm.OwnerId!= undefined) {
	 		//alert(frm.OwnerId);
		 	frm.OwnerId.value=objvalue;
			// alert(frm.OwnerId.value);
		}
 	}
 	
 	/**
     * To set the User ID
     */
    if(document.getElementById("CreatedByfrmjsp") !=null && document.getElementById("CreatedByfrmjsp") !=undefined) {
 	var CreatedByfrmjsp=document.getElementById("CreatedByfrmjsp").value;
 	
	 	if(frm.CreatedBy!=null && frm.CreatedBy!= undefined) {
		 	frm.CreatedBy.value=CreatedByfrmjsp;
		}
 	}
 	
 	/**
     * To set the Created Date
     */
    
	 if(frm.CreatedDate!=null && frm.CreatedDate!= undefined) {
	 	if(frm.CreatedDate.value=="") {
		 	var currentTime = new Date();
		 	var month = currentTime.getMonth() + 1;
			var day = currentTime.getDate();
			var year = currentTime.getFullYear();
			var hours = currentTime.getHours();
			var minutes = currentTime.getMinutes();
			var seconds = currentTime.getSeconds();
		 	frm.CreatedDate.value=year+'/'+month+'/'+day+'/'+hours+':'+minutes+':'+seconds;
		 }
	}
	
	/**
     * To set the User ID
     */
    if(document.getElementById("UpdatedByfrmjsp") !=null && document.getElementById("UpdatedByfrmjsp") !=undefined) {
 	var UpdatedByfrmjsp=document.getElementById("UpdatedByfrmjsp").value;
 	
	 	if(frm.UpdatedBy!=null && frm.UpdatedBy!= undefined) {
		 	frm.UpdatedBy.value=UpdatedByfrmjsp;
		}
 	}
 	
 	/**
     * To set the Updated Date
     */
    
	 if(frm.UpdatedDate!=null && frm.UpdatedDate!= undefined) {
	 	if(frm.UpdatedDate.value=="") {
		 	var currentTime = new Date();
		 	var month = currentTime.getMonth() + 1;
			var day = currentTime.getDate();
			var year = currentTime.getFullYear();
			var hours = currentTime.getHours();
			var minutes = currentTime.getMinutes();
			var seconds = currentTime.getSeconds();
		 	frm.UpdatedDate.value=year+'/'+month+'/'+day+'/'+hours+':'+minutes+':'+seconds;
		 }
	}
	
	return true;
}	



function sendEmailDetails(){
var ownerId=document.getElementById('ownerIdfrmjsp').value;
var objId=document.getElementById('parentQuoteId').value;
var ObjectVerId=document.getElementById('parentQuoteVerId').value;
//var objType=document.getElementById('ownerId').value;
var SubQuoteVerId=document.getElementById('subQuoteVerId').value;
var QuoteStatus=document.getElementById('paretQuoteStatus').value;
var EmailType= "QUOTE";// document.getElementById('EmailType').value;
var QuoteNumber=document.getElementById('quoteNum').value;
var QuoteSubNumber=document.getElementById('quoteSubNum').value;
var PolicyNumber=document.getElementById('policyNumber').value;
var email=document.getElementById('email').value;
var roleName=document.getElementById('roleName').value;
var CustomerName=document.getElementById('custname').value;


	var insName1 = CustomerName;
	insName1 = insName1.replace(/___/g,'"');
	var insNamedecripted = encodeURIComponent(insName1);	
	EmailPopup('../PrefilledEmailAction.do?answer(pagename)=email&answer(Object::Activity::OwnerId)='+ownerId+
	'&answer(Object::Notification::Email::ObjectId)='+objId+'&answer(Object::Notification::Email::InsuredName)='+insNamedecripted+
	'&answer(Object::Notification::UserDetail::Email)='+email+'&answer(Object::Notification::UserDetail::RoleName)='+roleName+
	'&answer(Object::Notification::Email::ObjectVerId)='+ObjectVerId+
	'&answer(Object::Notification::Email::ObjectType)='+EmailType+
	'&answer(Object::Notification::Email::NotificationType)=EMAIL&answer(Object::UserDetail::ownerId)='+ownerId+
	'&answer(Object::Notification::Email::SubQuoteVerId)='+SubQuoteVerId+
	'&answer(Object::Notification::Email::ObjectStatus)='+QuoteStatus+
	'&answer(Object::Notification::Email::EmailType)=POLICY&answer(Object::Notification::Email::QuoteStatus)='+QuoteStatus+
	'&answer(Object::Notification::Email::QuoteNumber)='+QuoteNumber+
	'&answer(Object::Notification::Email::QuoteSubNumber)='+QuoteSubNumber+
	'&answer(Object::Notification::Email::PolicyNumber)='+PolicyNumber,"Email");
	
}


/*
 * doSpecificValidation and validateTextAreaElement are added to validate the Manuscript Fill in Pop up in Policy Side.
 * Fixed Bug# 12028
 * Added by Rajeshkumar P on 03-November-2010
 */	
var isSpecificValidationNeeded = true;
function doSpecificValidation(frm){

	if(frm.name == "ManuscriptEndorsementSubApplication") {
	
		if((document.getElementById('Description') != null) && (document.getElementById('Description') != undefined)) {
			if(document.getElementById('Description').value == '') { 
				alert('Enter the Description'); 
				return false; 
			}
		}
		if((document.getElementById('Content') != null) && (document.getElementById('Content') != undefined)) {
			if(document.getElementById('Content').value == '') { 
				alert('Enter the Content'); 
				return false; 
			} 
		}
	}
	return true;
}

function validateTextAreaElement(frm) {

	return true;
}

/*
 * validateCreateRenewalQuote is used to validate the policy whether it can create renewal quote or not
 * Added by Rajeshkumar P on 25-January-2011
 */
function validateCreateRenewalQuote() {
	
	if(document.getElementById("NonRenewalQuestion") != null && document.getElementById("NonRenewalQuestion") != undefined) {	
		if(document.getElementById("NonRenewalQuestion").value != "Y") {		
			alert("This policy is not set for Renewal. An underwriter need to set this Policy for Renewal.");
			return false;
		}			
	}
	if((document.getElementById("parentPolicyStatus") != null) && (document.getElementById("parentPolicyStatus") != undefined)) {
		var policyStatus = document.getElementById("parentPolicyStatus").value;	
		if(policyStatus == "BOUND") {
			alert("Policy is not Issued.Please issue the policy to Create Renewal Quote");
			return false;
		} else if(policyStatus == "CANCELED") {
			alert("Policy is Canceled.Please reinstate the policy to Create Renewal Quote");
			return false;
		}
	}
	
	
	//YAHOO.example.container.confirmCreateRenewalQuote.render();
	document.getElementById("CONFIRM_CREATE_RENEWAL_QUOTE").style.display = "block";	
	//init1();	
	YAHOO.example.container.confirmCreateRenewalQuote.show();
	
	/*var confirmed = confirm ("Do you want to create a new Renewal Quote for this Policy?");	
	if(confirmed) {
		return true;
	} else {
		return false;
	}	*/
}

function validateRenewalOptions() {
	
	var nonRenewalYes = document.getElementById("NonRenewalYes").checked;
	var nonRenewalNo = document.getElementById("NonRenewalNo").checked;
	var referRenewalYes = document.getElementById("ReferRenewalYes").checked;
	var referRenewalNo = document.getElementById("ReferRenewalNo").checked;
	
	if((nonRenewalYes || nonRenewalNo) && (referRenewalYes || referRenewalNo)) {
		return true;
	} else {
		alert("Please answer both the questions before saving");
	}
	return false;
}

/*
 * createNewRenewalQuote is used to create renewal quote. 
 * While creating the renewal quote the submit button in that page is disabled
 * Added by Rajeshkumar P on 18-March-2011
 */
function createNewRenewalQuote() {
	
	if(document.getElementById("EndorseAddSubmit") != null && document.getElementById("EndorseAddSubmit") != undefined) {		
		document.getElementById("EndorseAddSubmit").disabled = true;
	}	
	if(document.getElementById("SaveRenewal") != null && document.getElementById("SaveRenewal") != undefined) {
		document.getElementById("SaveRenewal").disabled = true;
	}
	document.getElementById("createRenewalQuote").submit();
	document.getElementById("CONFIRM_CREATE_RENEWAL_QUOTE").style.display ="none";
	YAHOO.example.container.confirmCreateRenewalQuote.hide();
}

/* confirmNoticeOfCancellation is to provide a confirmation dialog box for Notice of Cancellation Creation
 * Added by Dianajudith D */
function confirmNoticeOfCancellation() {
	//init3();	
	YAHOO.example.container.confirmNoticeOfCancellation.render();
	document.getElementById("CONFIRM_NOTICE_OF_CANCELLATION").style.display = "block";
	YAHOO.example.container.confirmNoticeOfCancellation.show();
	
	}

/* confirmNoticeOfNonRenewal is to provide a confirmation dialog box for Notice of Non Renewal Creation
 * Added by Dianajudith D */
function confirmNoticeOfNonRenewal() {
	//init2();	
	YAHOO.example.container.confirmNoticeOfNonRenewal.render();
	document.getElementById("CONFIRM_NOTICE_OF_NON_RENEWAL").style.display = "block";
	YAHOO.example.container.confirmNoticeOfNonRenewal.show();
	
	}
function init1() {	

	YAHOO.example.container.confirmCreateRenewalQuote = new YAHOO.widget.Dialog("confirmCreateRenewalQuote",
							{ width : "40em",
							  height : "10em",
							  fixedcenter : true,							  
							  visible : false,
							  zIndex : 1000,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  iframe : true,
							  underlay : 'none'	

							});	
	YAHOO.example.container.confirmCreateRenewalQuote.setHeader("Confirm Create Renewal Quote");	
	// Render the Dialog
	YAHOO.example.container.confirmCreateRenewalQuote.render();	

}
YAHOO.util.Event.onDOMReady(init1);

function init2() {	

	YAHOO.example.container.confirmNoticeOfNonRenewal = new YAHOO.widget.Dialog("confirmNoticeOfNonRenewal",
							{ width : "40em",
							  height : "10em",
							  fixedcenter : true,							  
							  visible : false,
							  zIndex : 1200,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  iframe : true,
							  underlay : 'none'	


							});	
	YAHOO.example.container.confirmNoticeOfNonRenewal.setHeader("Confirm Notice of Non Renewal");	
	// Render the Dialog
	YAHOO.example.container.confirmNoticeOfNonRenewal.render();	

}
YAHOO.util.Event.onDOMReady(init2);

function init3() {	

	YAHOO.example.container.confirmNoticeOfCancellation = new YAHOO.widget.Dialog("confirmNoticeOfCancellation",
							{ width : "40em",
							  height : "10em",
							  fixedcenter : true,							  
							  visible : false,
							  zIndex : 1100,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  iframe : true,
							  underlay : 'none'	
	

							});	
	YAHOO.example.container.confirmNoticeOfCancellation.setHeader("Confirm Notice of Cancellation");	
	// Render the Dialog
	YAHOO.example.container.confirmNoticeOfCancellation.render();	

}
YAHOO.util.Event.onDOMReady(init3);

function setPolicySubjectivityDetails(subjId) {

	var isRenewal = "false";
	if(document.getElementById('isRenewal') != null && document.getElementById('isRenewal') != undefined) {
		isRenewal = document.getElementById('isRenewal').value;
	}
	if(isRenewal == "false") {
		document.getElementById('subjectivityAlertObjectType').value='Subjectivity';
	} else if(isRenewal == "true") {
		document.getElementById('subjectivityAlertObjectType').value='RenewalSubjectivity';
	}
	document.getElementById('subjectivityObjectType').value='Subjectivity';
	showAttach(subjId,'0','Subjectivity');
}