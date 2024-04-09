function refereshPreBindList() {
	   var parms = "answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ProductVerId)="+document.getElementById('productVerId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SubQuoteId)="+document.getElementById('subQuoteId1').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::Quote::ProductId)="+document.getElementById('productId1').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus1').value;
	   YAHOO.example.DynamicData = function() {
	    var formatCheck = function(elCell, oRecord, oColumn, sData) {
	   		var subId = oRecord.getData("SubjectivityId");
	   		var html = "<input name='answer(PreBindSubjctivtyId)' value='"+subId+"' type='checkbox'>"
	   		elCell.innerHTML = html;
	   }
	   
	   var formatlink = function(elCell, oRecord, oColumn, sData) {
	    var parm1 = parms+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjectivityId");
	    var url="'../getSubjectivityDetail.go?"+parm1+"'";
	    elCell.innerHTML = '<a href="javascript:void(0)" class="plainlink" onclick="showSubjDetail('+url+','+oRecord.getData("SubjectivityId")+');">'+oRecord.getData("Subjectivity")+'</a>';
	   }
	        var myColumnDefs = [
	            {key:"<input onclick='checkAllPreBind(this)' type='checkbox'>",formatter:formatCheck,sortable:false, resizeable:true},
	            {key:"No",sortable:false, resizeable:true,width:20},
	            {key:"Subjectivity",formatter:formatlink, sortable:true,resizeable:true,width:250},
	            {key:"Type", sortable:false, resizeable:true,width:70},
	            {key:"Level", sortable:true, resizeable:true,width:50},
	            {key:"Location_Name",sortable:true, resizeable:true,width:100},
	            {key:"Risk_Name", sortable:true, resizeable:true,width:60},
	            {key:"Status",sortable:true, resizeable:false,width:65},
	            {key:"Modified",sortable:false, resizeable:false,width:60}
	        ];
	        autologout();
	        var myDataSource = new YAHOO.util.DataSource("../quote/QuoteSubjectivityResult.jsp?answer(ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(SubQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(OwnerId)="+document.getElementById('ownerId').value+"&answer(SubReqProcess)=Pre Bind&");
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		    myDataSource.responseSchema = {
		        resultsList: "records",
		        fields: [
		            {key:"No"},{key:"Subjectivity"},{key:"Type"},{key:"Level"},{key:"CauseList"},
		            {key:"RequiredBefore"},{key:"Status"},{key:"Attach"},{key:"Notes"},{key:"Email"},
		            {key:"SubjectivityId"},{key:"Location_Name"},{key:"Risk_Name"},{key:"<input onclick='checkAllPreBind(this)' type='checkbox'>"},{key:"Modified"}
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

		    var myConfigs = {
		    initialRequest: "sort=&dir=asc&startIndex=0&results=10", // Initial request for first page of data
	        dynamicData: true, // Enables dynamic server-driven data
	        sortedBy : {key:"", dir:YAHOO.widget.DataTable.CLASS_ASC}, // Sets UI initial sort arrow
	     	paginator : new YAHOO.widget.Paginator({
	        rowsPerPage    : 10, // REQUIRED

         	// use a custom layout for pagination controls
	          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",

	         // use these in the rows-per-page dropdown
	         rowsPerPageOptions : [10,15,20],

	         // use custom page link labels
	         pageLabelBuilder : function (page,paginator) {
	             var recs = paginator.getPageRecords(page);
	             return (recs[0] + 1) + ' - ' + (recs[1] + 1);
	         }
	     		})
	 		};
	        var myDataTable = new YAHOO.widget.DataTable("PRE_BIND_LIST_TABLE",
	                myColumnDefs, myDataSource,myConfigs);
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

function refereshPostBindList() {
	var parms = "answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ProductVerId)="+document.getElementById('productVerId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SubQuoteId)="+document.getElementById('subQuoteId1').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::Quote::ProductId)="+document.getElementById('productId1').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus1').value;
	 YAHOO.example.DynamicData = function() {
	    var formatCheck = function(elCell, oRecord, oColumn, sData) {
	   		var subId = oRecord.getData("SubjectivityId");
	   		var html = "<input name='answer(PostBindSubjctivtyId)' value='"+subId+"' type='checkbox'>"
	   		elCell.innerHTML = html;
	   }

	   var formatlink = function(elCell, oRecord, oColumn, sData) {
	    var parm1 = parms+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjectivityId");
	    var url="'../getSubjectivityDetail.go?"+parm1+"'";
	    elCell.innerHTML = '<a href="javascript:void(0)" class="plainlink" onclick="showSubjDetail('+url+','+oRecord.getData("SubjectivityId")+');">'+oRecord.getData("Subjectivity")+'</a>';
	   }
	        var myColumnDefs = [
	            {key:"<input onclick='checkAllPostBind(this)' type='checkbox'>",formatter:formatCheck,sortable:false, resizeable:true},
	            {key:"No",sortable:false, resizeable:false,width:20},
	            {key:"Subjectivity",formatter:formatlink, sortable:true,resizeable:false,width:250},
	            {key:"Type", sortable:false, resizeable:false,width:70},
	            {key:"Level", sortable:true, resizeable:false,width:50},
	            {key:"Location_Name",sortable:true, resizeable:false,width:100},
	            {key:"Risk_Name", sortable:true, resizeable:false,width:60},
	            {key:"Status",sortable:true, resizeable:false,width:65},
	            {key:"Modified",sortable:false, resizeable:false,width:60}
	        ];
	        autologout();
	        var myDataSource = new YAHOO.util.DataSource("../quote/QuoteSubjectivityResult.jsp?answer(ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(SubQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(OwnerId)="+document.getElementById('ownerId').value+"&answer(SubReqProcess)=Post Bind&");
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		    myDataSource.responseSchema = {
		        resultsList: "records",
		        fields: [
		            {key:"No"},{key:"Subjectivity"},{key:"Type"},{key:"Level"},{key:"CauseList"},
		            {key:"RequiredBefore"},{key:"Status"},{key:"Attach"},{key:"Notes"},{key:"Email"},
		            {key:"SubjectivityId"},{key:"Location_Name"},{key:"Risk_Name"},{key:"<input onclick='checkAllPostBind(this)' type='checkbox'>"},{key:"Modified"}
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

		    var myConfigs = {
		    initialRequest: "sort=&dir=asc&startIndex=0&results=10", // Initial request for first page of data
	        dynamicData: true, // Enables dynamic server-driven data
	        sortedBy : {key:"", dir:YAHOO.widget.DataTable.CLASS_ASC}, // Sets UI initial sort arrow
	     	paginator : new YAHOO.widget.Paginator({
	        rowsPerPage    : 10, // REQUIRED

         	// use a custom layout for pagination controls
	          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",

	         // use these in the rows-per-page dropdown
	         rowsPerPageOptions : [10,15,20],

	         // use custom page link labels
	         pageLabelBuilder : function (page,paginator) {
	             var recs = paginator.getPageRecords(page);
	             return (recs[0] + 1) + ' - ' + (recs[1] + 1);
	         }
	     		})
	 		};
	        var myDataTable = new YAHOO.widget.DataTable("POST_BIND_LIST_TABLE",
	                myColumnDefs, myDataSource,myConfigs);
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

YAHOO.namespace("example.container");

function init() {
	// Instantiate the Dialog
	YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("dialog1",
							{ width : "70em",
							  fixedcenter : true,
							  visible : false,
							  constraintoviewport : true,
							  buttons : []
							});
	// Render the Dialog
	YAHOO.example.container.dialog1.render();
}
YAHOO.util.Event.onDOMReady(init);

function initManuscritp() {
	YAHOO.example.container.manuScript = new YAHOO.widget.Dialog("manuScript",
							{ width : "50em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []
							});
YAHOO.example.container.manuScript.setHeader("Add Manuscript Subjectivity");
	// Render the Dialog
	YAHOO.example.container.manuScript.render();
}
YAHOO.util.Event.onDOMReady(initManuscritp);

function initSubjectivityDetailDialog() {
	if(YAHOO.example.container.subjDetail ==undefined || YAHOO.example.container.subjDetail == null){
	YAHOO.example.container.subjDetail = new YAHOO.widget.Dialog("subjDetail",
							{ width : "75em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []
							});
YAHOO.example.container.subjDetail.setHeader("Subjectivity Detail");
	// Render the Dialog
	YAHOO.example.container.subjDetail.render();
	}
}
YAHOO.util.Event.onDOMReady(initSubjectivityDetailDialog);

function checkAllPostBind(obj){
	var check = false;
	if(obj.checked){check=true}
	var size = document.getElementsByName('answer(PostBindSubjctivtyId)').length;
	for(i=0;i<size;i++){
		document.getElementsByName('answer(PostBindSubjctivtyId)')[i].checked=check;
	}
}
function checkAllPreBind(obj){
	var check = false;
	if(obj.checked){check=true}
	var size = document.getElementsByName('answer(PreBindSubjctivtyId)').length;
	for(i=0;i<size;i++){
		document.getElementsByName('answer(PreBindSubjctivtyId)')[i].checked=check;
	}
}
function countAllCheckedPreBind(obj){
   	var size = document.getElementsByName('answer(PreBindSubjctivtyId)').length;
	for(i=0;i<size;i++){
	  if(document.getElementsByName('answer(PreBindSubjctivtyId)')[i].checked == true ) {
	     return true;
	  }
	}
	return false;
}
function countAllCheckedPostBind(obj){
   	var size = document.getElementsByName('answer(PostBindSubjctivtyId)').length;
	for(i=0;i<size;i++){
	  if(document.getElementsByName('answer(PostBindSubjctivtyId)')[i].checked == true ) {
	     return true;
	  }
	}
	return false;
}
function updateSubjectivityStatus(form,obj,key){
	var check = false;

	var parms = "&answer(agencyId)="+document.getElementById("agencyId").value+"&answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::User::AgencyId)="+document.getElementById('AgencyId_hidden').value;
	var SubjectivityRequiredProcess ='Pre Bind';
	var postBindRefresh = false;
	if(obj.value=='Overridden'){SubjectivityRequiredProcess='Post Bind';postBindRefresh=true;}
	check= countAllCheckedPreBind(obj);
	if(check) {
		var ans = window.confirm('Are you sure, you want to update the status for all the selected pre-bind subjectivities?');
	}

	if(!check) {
	     alert("No Subjectivities are selected");
	     obj.value='';
	}
	if (ans) {
		if(document.getElementById("isRenewal") != null && document.getElementById("isRenewal") != undefined) {
			var url = "/SaveAllSubjectivity.do?answer(Object::Subjectivity::Status)="+obj.value+"&answer(SubjectivityType)="+key+"&answer(SubjectivityRequiredProcess)="+SubjectivityRequiredProcess+"&answer(isRenewal)="+document.getElementById("isRenewal").value+parms;
		} else {
			var url = "/SaveAllSubjectivity.do?answer(Object::Subjectivity::Status)="+obj.value+"&answer(SubjectivityType)="+key+"&answer(SubjectivityRequiredProcess)="+SubjectivityRequiredProcess+parms;
		}
		if(document.getElementById('Quote_Endorsement')!=null && document.getElementById('Quote_Endorsement')!=undefined){
			url = url+"&answer(Quote::QuoteType)=Endorsement&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value;
		}
		autologout();
		new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshPreBindList();if(postBindRefresh){refereshPostBindList();}obj.value='';}});
	}else{
		return false;
	}
}
function updatePostSubjectivityStatus(form,obj,key){
	var check = false;
	var parms = "&answer(agencyId)="+document.getElementById("agencyId").value+"&answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::User::AgencyId)="+document.getElementById('AgencyId_hidden').value;
	var SubjectivityRequiredProcess ='Post Bind';
	var preBindRefresh = false;
	var status = obj.value;
	if(status=='Overridden'){SubjectivityRequiredProcess='Pre Bind';status='Open';preBindRefresh=true;}
	check= countAllCheckedPostBind(obj);
	if(check) {
		var ans = window.confirm('Are you sure, you want to update the status for all the selected post-bind subjectivities?');
	}
	if(!check) {
	     alert("No Subjectivities are selected");
	     obj.value='';
	}
		if (ans) {
			if(document.getElementById("isRenewal") != null && document.getElementById("isRenewal") != undefined) {
				var url = "/SaveAllSubjectivity.do?answer(Object::Subjectivity::Status)="+status+"&answer(SubjectivityType)="+key+"&answer(SubjectivityRequiredProcess)="+SubjectivityRequiredProcess+"&answer(isRenewal)="+document.getElementById("isRenewal").value+parms;
			} else {
				var url = "/SaveAllSubjectivity.do?answer(Object::Subjectivity::Status)="+status+"&answer(SubjectivityType)="+key+"&answer(SubjectivityRequiredProcess)="+SubjectivityRequiredProcess+parms;
			}
			autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshPostBindList();if(preBindRefresh){refereshPreBindList();}obj.value='';}});
		}else{
			return false;
		}
}
function updateSubjectivityDetail(form){
	var status = document.getElementById('SubjectivityStatus').value;
    var subjectivityRequiredProcess = document.getElementById('subjectivityRequiredProcess').value;
    var hiddsubjReqProcess = document.getElementById('subjReqProcess').value;
	var subId = document.getElementById('quoteSubjectivityIdHidden').value;
	var parms = "&answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::User::AgencyId)="+document.getElementById('AgencyId_hidden').value;

	var subStatus=status;reqProcess=subjectivityRequiredProcess;key='SubjectivityId';
	if(subjectivityRequiredProcess =='Post Bind' && hiddsubjReqProcess =='Pre Bind'){
	subStatus='Overridden'
	}
	if(status =='Overridden' && subjectivityRequiredProcess =='Pre Bind' && hiddsubjReqProcess =='Pre Bind'){
		reqProcess = 'Post Bind';
	}
	if(subjectivityRequiredProcess =='Pre Bind' && hiddsubjReqProcess =='Post Bind'){
		subStatus ='Open';
	}
	if(subjectivityRequiredProcess =='Pre Bind'){
		key='PreBindSubjctivtyId';
	}
	if(subjectivityRequiredProcess =='Post Bind'){
		key='PostBindSubjctivtyId';
	}

	var url = "/SaveAllSubjectivity.do?answer(Object::Subjectivity::Status)="+subStatus+"&answer(SubjectivityType)="+key+"&answer(SubjectivityRequiredProcess)="+reqProcess+"&answer("+key+")="+subId+"&answer(Object::User::AgencyId)="+document.getElementById('AgencyId_hidden').value+parms;
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:'',onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshPostBindList();refereshPreBindList();document.getElementById('SUB_CONT').innerHTML='';YAHOO.example.container.subjDetail.hide();}});
}

function updateEndorsementSubjectivityDetail(form){
var status = form.SubjectivityStatus.value;var subjectivityRequiredProcess = form.subjectivityRequiredProcess.value;var hiddsubjReqProcess = form.subjReqProcess.value;
	var subId = form.quoteSubjectivityIdHidden.value;
	var subStatus=status;reqProcess=subjectivityRequiredProcess;key='SubjectivityId';
	if(subjectivityRequiredProcess =='Post Bind' && hiddsubjReqProcess =='Pre Bind'){
	subStatus='Overridden'
	}
	if(status =='Overridden' && subjectivityRequiredProcess =='Pre Bind' && hiddsubjReqProcess =='Pre Bind'){
		reqProcess = 'Post Bind';
	}
	if(subjectivityRequiredProcess =='Pre Bind' && hiddsubjReqProcess =='Post Bind'){
		subStatus ='Open';
	}
	var url = "/SaveAllSubjectivity.do?answer(Object::Subjectivity::Status)="+subStatus+"&answer(SubjectivityType)="+key+"&answer(SubjectivityRequiredProcess)="+reqProcess+"&answer(SubjectivityId)="+subId;
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:'',onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshEndorsementPreBindList();document.getElementById('SUB_CONT').innerHTML='';YAHOO.example.container.subjDetail.hide();}});



}
function saveManuScript(form){
	var url = "/AddSubjectivity.do"
	if(form.Subj_Level.value=="")
	{
	alert("Please select Subjectivity Level");
	return false;
	}
	if(form.subj_desc.value==''){
		alert('Please enter the Subjectivity Description');
		return false;
	}
	if(form.subj_cause.value==''){
		alert('Please enter the Subjectivity Cause');
		return false;
	}
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshPreBindList();refereshPostBindList();YAHOO.example.container.manuScript.hide();}});
}

function saveEndorsementManuScript(form){
var url = "/AddSubjectivity.do"
	if(form.Subj_Level.value=="")
	{
	alert("Please select Subjectivity Level");
	return false;
	}
	if(form.subj_desc.value==''){
		alert('Please enter the Subjectivity Description');
		return false;
	}
	if(form.subj_cause.value==''){
		alert('Please enter the Subjectivity Cause');
		return false;
	}
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshEndorsementPreBindList();YAHOO.example.container.manuScript.hide();}});


}

function saveRenewalEndorsementManuScript(form){
var url = "/AddSubjectivity.do"
	if(form.Subj_Level.value=="")
	{
	alert("Please select Subjectivity Level");
	return false;
	}
	if(form.subj_desc.value==''){
		alert('Please enter the Subjectivity Description');
		return false;
	}
	if(form.subj_cause.value==''){
		alert('Please enter the Subjectivity Cause');
		return false;
	}
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshPreBindList();refereshPostBindList();YAHOO.example.container.manuScript.hide();}});


}

var subjid=0;
function showSubjDetail(url,id){
subjid=id;
 	document.body.style.cursor="wait";
 	document.getElementById('LoaderIndicator').style.display='inline';
	createXMLHttpRequest();
	getSubjContent(url,'');
	subjContentIsReady(id)
}
function getSubjContent(URL,parameters){
	xmlHttp.onreadystatechange = subjContentIsReady;
	xmlHttp.open("POST", URL,true);
	xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlHttp.setRequestHeader("Content-length", parameters.length);
    xmlHttp.setRequestHeader("Connection", "close");
    xmlHttp.send(parameters);
}
function subjContentIsReady(id){
if(xmlHttp && xmlHttp.readyState == 4){
document.getElementById('SUB_CONT').innerHTML= xmlHttp.responseText;
forwardToLoginPageIfInvalidSession(xmlHttp.responseText);
if(YAHOO.example.container.subjDetail !=undefined || YAHOO.example.container.subjDetail != null){
	YAHOO.example.container.subjDetail.show();
}
setTimeout("showSubjDetailSucc("+subjid+")",10);

}
}
function showSubjDetailSucc(id){
	refereshAttachmentList(id,document.getElementById('ownerId').value,'Subjectivity');
	refereshNotesList(id,document.getElementById('ownerId').value,'Subjectivity');
	document.body.style.cursor="default";
	document.getElementById('LoaderIndicator').style.display='none';
}

function showManuscriptSubjectivity(productId,productVerId,subQuoteVerId,subQuoteId,parentQuoteVerId,customerId,paretQuoteStatus,parentQuoteId){
	var pars='?answer(ProductId)='+productId+'&answer(ProductVerId)='+productVerId+'&answer(SuQuoteVerId)='+subQuoteVerId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(CustomerId)='+customerId+'&answer(QuoteStatus)='+paretQuoteStatus+'&answer(ParentQuoteId)='+parentQuoteId;
	autologout();
	new Ajax.Updater('Manuscript_CONT','../quote/ManuscriptSubjectivityDetail.jsp'+pars,{synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Manuscript_CONT").innerHTML);YAHOO.example.container.manuScript.show();document.getElementById("subj_desc").focus();},onException:function(){}});
}

function refreshSubjectivity(){
var parms ="answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ProductVerId)="+document.getElementById('productVerId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SubQuoteId)="+document.getElementById('subQuoteId1').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::Quote::ProductId)="+document.getElementById('productId1').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus1').value+"&answer(OwnerId)="+document.getElementById('ownerId').value;
autologout();
new Ajax.Request('../getSubjectivity.go', {method: 'post',parameters:parms,onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshPreBindList();refereshPostBindList();enableTabs();}});
}

function refreshPolicyPreBind(){
	  YAHOO.example.DynamicData = function() {
	    var formatCheck = function(elCell, oRecord, oColumn, sData) {
	   		var subId = oRecord.getData("SubjectivityId");
	   		var html = "<input name='answer(PreBindSubjctivtyId)' value='"+subId+"' type='checkbox'>"
	   		elCell.innerHTML = html;
	   }
	   var formatlink = function(elCell, oRecord, oColumn, sData) {
		   var parm1 = "answer(Object::Policy::Subjectivity::PolicySubjectivityId)="+oRecord.getData("SubjectivityId")+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus').value;
		   var url="'../GetPolicySubjectivity.go?"+parm1+"'";
		   elCell.innerHTML = '<div><a href="javascript:void(0)" class="plainlink" onclick="showSubjDetail('+url+','+oRecord.getData("SubjectivityId")+');">'+oRecord.getData("Subjectivity")+'</a></div>';
	   }
	        var myColumnDefs = [
	            {key:"<input onclick='checkAllPreBind(this)' type='checkbox'>",formatter:formatCheck,sortable:false, resizable:true},
	            {key:"No",sortable:false, resizable:"false",width:20},
	            {key:"Subjectivity",formatter:formatlink, sortable:true,resizable:"false",width:300},
	            {key:"Type", sortable:false, resizable:"false",width:70},
	            {key:"Level", sortable:true, resizable:"false",width:55},
	            {key:"Location_Name",sortable:true, resizable:"false",width:100},
	            {key:"Risk_Name", sortable:true, resizable:"false",width:60},
	            {key:"Status",sortable:true, resizable:"false",width:60},
	            {key:"Modified",sortable:false, resizable:"false",width:60}
	        ];
	        var myDataSource = new YAHOO.util.DataSource("../policy/PolicySubjectivityResult.jsp?answer(PolicyId)="+document.getElementById('policyId').value+"&answer(PolicyVerId)="+document.getElementById('policyVerId').value+"&answer(OwnerId)="+document.getElementById('ownerId').value+"&answer(PolicyNumber)="+document.getElementById('policyNumber').value+"&answer(SubReqProcess)=Pre Bind&");
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		    myDataSource.responseSchema = {
		        resultsList: "records",
		        fields: [
		            {key:"No"},{key:"Subjectivity"},{key:"Type"},{key:"Level"},{key:"CauseList"},
		            {key:"RequiredBefore"},{key:"Status"},{key:"Attach"},{key:"Notes"},{key:"Email"},
		            {key:"SubjectivityId"},{key:"Location_Name"},{key:"Risk_Name"},{key:"<input onclick='checkAllPreBind(this)' type='checkbox'>"},{key:"Modified"}
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

		    var myConfigs = {
		    initialRequest: "sort=&dir=asc&startIndex=0&results=10", // Initial request for first page of data
	        dynamicData: true, // Enables dynamic server-driven data
	        sortedBy : {key:"", dir:YAHOO.widget.DataTable.CLASS_ASC}, // Sets UI initial sort arrow
	     	paginator : new YAHOO.widget.Paginator({
	        rowsPerPage    : 10, // REQUIRED

         	// use a custom layout for pagination controls
	          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",

	         // use these in the rows-per-page dropdown
	         rowsPerPageOptions : [10,15,20],

	         // use custom page link labels
	         pageLabelBuilder : function (page,paginator) {
	             var recs = paginator.getPageRecords(page);
	             return (recs[0] + 1) + ' - ' + (recs[1] + 1);
	         }
	     		})
	 		};
	        var myDataTable = new YAHOO.widget.DataTable("PRE_BIND_LIST_TABLE",
	                myColumnDefs, myDataSource,myConfigs);
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
function refreshPolicyPostBind(){
	  YAHOO.example.DynamicData = function() {
	    var formatCheck = function(elCell, oRecord, oColumn, sData) {
	   		var subId = oRecord.getData("SubjectivityId");
	   		var html = "<input name='answer(PostBindSubjctivtyId)' value='"+subId+"' type='checkbox'>"
	   		elCell.innerHTML = html;
	   }
	   var formatlink = function(elCell, oRecord, oColumn, sData) {
		   var parm1 = "answer(Object::Policy::Subjectivity::PolicySubjectivityId)="+oRecord.getData("SubjectivityId")+"&answer(Object::Customer::CustomerId)="+document.getElementById("custId").value+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus').value;
		   var url="'../GetPolicySubjectivity.go?"+parm1+"'";
		   elCell.innerHTML = '<div><a href="javascript:void(0)" class="plainlink" onclick="showSubjDetail('+url+','+oRecord.getData("SubjectivityId")+');">'+oRecord.getData("Subjectivity")+'</a></div>';
	   }
	        var myColumnDefs = [
	            {key:"<input onclick='checkAllPostBind(this)' type='checkbox'>",formatter:formatCheck,sortable:false, resizable:true},
	            {key:"No",sortable:false, resizable:"false",width:20},
	            {key:"Subjectivity",formatter:formatlink, sortable:true,resizable:"false",width:300},
	            {key:"Type", sortable:false, resizable:"false",width:70},
	            {key:"Level", sortable:true, resizable:"false",width:55},
	            {key:"Location_Name",sortable:true, resizable:"false",width:100},
	            {key:"Risk_Name", sortable:true, resizable:"false",width:60},
	            {key:"Status",sortable:true, resizable:"false",width:60},
	            {key:"Modified",sortable:false, resizable:"false",width:60}
	        ];
	        var myDataSource = new YAHOO.util.DataSource("../policy/PolicySubjectivityResult.jsp?answer(PolicyId)="+document.getElementById('policyId').value+"&answer(PolicyVerId)="+document.getElementById('policyVerId').value+"&answer(OwnerId)="+document.getElementById('ownerId').value+"&answer(PolicyNumber)="+document.getElementById('policyNumber').value+"&answer(SubReqProcess)=Post Bind&");
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		    myDataSource.responseSchema = {
		        resultsList: "records",
		        fields: [
		            {key:"No"},{key:"Subjectivity"},{key:"Type"},{key:"Level"},{key:"CauseList"},
		            {key:"RequiredBefore"},{key:"Status"},{key:"Attach"},{key:"Notes"},{key:"Email"},
		            {key:"SubjectivityId"},{key:"Location_Name"},{key:"Risk_Name"},{key:"<input onclick='checkAllPreBind(this)' type='checkbox'>"},{key:"Modified"}
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

		    var myConfigs = {
		    initialRequest: "sort=&dir=asc&startIndex=0&results=10", // Initial request for first page of data
	        dynamicData: true, // Enables dynamic server-driven data
	        sortedBy : {key:"", dir:YAHOO.widget.DataTable.CLASS_ASC}, // Sets UI initial sort arrow
	     	paginator : new YAHOO.widget.Paginator({
	        rowsPerPage    : 10, // REQUIRED

         	// use a custom layout for pagination controls
	          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",

	         // use these in the rows-per-page dropdown
	         rowsPerPageOptions : [10,15,20],

	         // use custom page link labels
	         pageLabelBuilder : function (page,paginator) {
	             var recs = paginator.getPageRecords(page);
	             return (recs[0] + 1) + ' - ' + (recs[1] + 1);
	         }
	     		})
	 		};
	        var myDataTable = new YAHOO.widget.DataTable("POST_BIND_LIST_TABLE",
	                myColumnDefs, myDataSource,myConfigs);
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
function updatePoliySubjectivityDetail(form){
	
	var id =document.getElementById("policySubjectivityId").value;
	
	var status = form.subjStatus.value; 
	var parms = "&answer(PolicyId)="+document.getElementById('policyId').value+"&answer(PolicyVerId)="+document.getElementById('policyVerId').value+"&answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('custId').value;
	var url = "/SaveAllPolicySubjectivity.do?answer(Object::Subjectivity::Status)="+status+"&answer(SubjectivityType)=PostBindSubjctivtyId&answer(PostBindSubjctivtyId)="+id+parms;
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refreshPolicyPostBind();document.getElementById('SUB_CONT').innerHTML=='';YAHOO.example.container.subjDetail.hide();}});

}

function updatePoliySubjectivityStatus(form,obj,key){
	check= countAllCheckedPostBind(obj);

	if(check) {
		var ans = window.confirm('Are you sure, you want to update the status for all the selected post-bind subjectivities?');
	}

	if(!check) {
	     alert("No Subjectivities are selected");
	     obj.value='';
	}

	if (ans) {
		if(document.getElementById("isRenewal") != null && document.getElementById("isRenewal") != undefined) {
			var agencyId = document.getElementById("agencyId").value;
			var parms = "&answer(PolicyId)="+document.getElementById('policyId').value+"&answer(PolicyVerId)="+document.getElementById('policyVerId').value+"&answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('custId').value+"&answer(isRenewal)="+document.getElementById("isRenewal").value+"&answer(agencyId)="+agencyId;
			var url = "/SaveAllPolicySubjectivity.do?answer(Object::Subjectivity::Status)="+obj.value+"&answer(SubjectivityType)="+key+parms;
		} else {
			var parms = "&answer(PolicyId)="+document.getElementById('policyId').value+"&answer(PolicyVerId)="+document.getElementById('policyVerId').value+"&answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('custId').value;
			var url = "/SaveAllPolicySubjectivity.do?answer(Object::Subjectivity::Status)="+obj.value+"&answer(SubjectivityType)="+key+parms;
		}
		autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refreshPolicyPostBind();obj.value='';}});
		}else{
			return false;
		}
}
function showPolicyManuscriptSubjectivity(){
	autologout();
	var parameter='answer(PolicyId)='+document.getElementById('policyId').value+'&answer(PolicyVerId)='+document.getElementById('policyVerId').value+'&answer(OwnerId)='+document.getElementById('ownerId').value+'&answer(PolicyNumber)='+document.getElementById('policyNumber').value;
	new Ajax.Updater('Manuscript_CONT','../policy/ManuscriptSubjectivityDetail.jsp',{synchronous:true, parameters:parameter, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Manuscript_CONT").innerHTML);YAHOO.example.container.manuScript.show();document.getElementById("subj_desc").focus();},onException:function(){}});
}
function savePolicyManuScript(form){
	var url = "/AddPolicySubjectivity.do"
	if(form.subj_desc.value==''){
		alert('Please enter the Subjectivity Description');
		return false;
	}
	if(form.subj_cause.value==''){
		alert('Please enter the Subjectivity Cause');
		return false;
	}
	autologout();
	new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refreshPolicyPostBind();YAHOO.example.container.manuScript.hide();}});
}

function getSubjectivityDetailpopup(subjectivityId){
var parms = "answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ProductVerId)="+document.getElementById('productVerId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SubQuoteId)="+document.getElementById('subQuoteId1').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::Quote::ProductId)="+document.getElementById('productId1').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus1').value;
 var parm1 = parms+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+subjectivityId;
 var url="../getSubjectivityDetail.go?"+parm1;
 showSubjDetail(url,subjectivityId);
}
function refereshEndorsementPreBindList() {
	   var parms = "answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ProductVerId)="+document.getElementById('productVerId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SubQuoteId)="+document.getElementById('subQuoteId1').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::Quote::ProductId)="+document.getElementById('productId1').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus1').value;
	   YAHOO.example.DynamicData = function() {
	    var formatCheck = function(elCell, oRecord, oColumn, sData) {
	   		var subId = oRecord.getData("SubjectivityId");
	   		var html = "<input name='answer(PreBindSubjctivtyId)' value='"+subId+"' type='checkbox'>"
	   		elCell.innerHTML = html;
	   }
	   var formatlink = function(elCell, oRecord, oColumn, sData) {
	    var parm1 = parms+"&answer(Object::Quote::Subjectivity::QuoteSubjectivityId)="+oRecord.getData("SubjectivityId");
	    var url="'../GetEndorsementSubjectivity.do?"+parm1+"'";
	    elCell.innerHTML = '<a href="javascript:void(0)" class="plainlink" onclick="showSubjDetail('+url+','+oRecord.getData("SubjectivityId")+');">'+oRecord.getData("Subjectivity")+'</a>';
	   }
	        var myColumnDefs = [
	            {key:"<input onclick='checkAllPreBind(this)' type='checkbox'>",formatter:formatCheck,sortable:false, resizable:true},
	            {key:"No",sortable:false, resizable:true,width:20},
	            {key:"Subjectivity",formatter:formatlink, sortable:true,resizable:true,width:280},
	            {key:"Type", sortable:false, resizable:true,width:65},
	            {key:"Level", sortable:true, resizable:true,width:50},
	            {key:"Location_Name",sortable:true, resizable:true,width:100},
	            {key:"Risk_Name", sortable:true, resizable:true,width:100},
	            {key:"Status",sortable:true, resizable:false,width:65},
	            {key:"Modified",sortable:false, resizable:false,width:60}
	        ];
	        autologout();
	        var myDataSource = new YAHOO.util.DataSource("../endorsement/QuoteSubjectivityResult.jsp?answer(ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(SubQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(OwnerId)="+document.getElementById('ownerId').value+"&answer(SubReqProcess)=Pre Bind&");
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSON;
		    myDataSource.responseSchema = {
		        resultsList: "records",
		        fields: [
		            {key:"No"},{key:"Subjectivity"},{key:"Type"},{key:"Level"},{key:"CauseList"},
		            {key:"RequiredBefore"},{key:"Status"},{key:"Attach"},{key:"Notes"},{key:"Email"},
		            {key:"SubjectivityId"},{key:"Location_Name"},{key:"Risk_Name"},{key:"<input onclick='checkAllPreBind(this)' type='checkbox'>"},{key:"Modified"}
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

		    var myConfigs = {
		    initialRequest: "sort=&dir=asc&startIndex=0&results=10", // Initial request for first page of data
	        dynamicData: true, // Enables dynamic server-driven data
	        sortedBy : {key:"", dir:YAHOO.widget.DataTable.CLASS_ASC}, // Sets UI initial sort arrow
	     	paginator : new YAHOO.widget.Paginator({
	        rowsPerPage    : 10, // REQUIRED

         	// use a custom layout for pagination controls
	          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",

	         // use these in the rows-per-page dropdown
	         rowsPerPageOptions : [10,15,20],

	         // use custom page link labels
	         pageLabelBuilder : function (page,paginator) {
	             var recs = paginator.getPageRecords(page);
	             return (recs[0] + 1) + ' - ' + (recs[1] + 1);
	         }
	     		})
	 		};
	        var myDataTable = new YAHOO.widget.DataTable("PRE_BIND_LIST_TABLE",
	                myColumnDefs, myDataSource,myConfigs);
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
function showEndorsementManuscriptSubjectivity(productId,productVerId,subQuoteVerId,subQuoteId,parentQuoteVerId,customerId,paretQuoteStatus,parentQuoteId){
	var pars='?answer(ProductId)='+productId+'&answer(ProductVerId)='+productVerId+'&answer(SuQuoteVerId)='+subQuoteVerId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(CustomerId)='+customerId+'&answer(QuoteStatus)='+paretQuoteStatus+'&answer(ParentQuoteId)='+parentQuoteId;
	autologout();
	new Ajax.Updater('Manuscript_CONT','../endorsement/ManuscriptSubjectivityDetail.jsp'+pars,{synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Manuscript_CONT").innerHTML);YAHOO.example.container.manuScript.show();document.getElementById("subj_desc").focus();},onException:function(){}});
}

function showRenewalEndorsementManuscriptSubjectivity(productId,productVerId,subQuoteVerId,subQuoteId,parentQuoteVerId,customerId,paretQuoteStatus,parentQuoteId){
	var pars='?answer(ProductId)='+productId+'&answer(ProductVerId)='+productVerId+'&answer(SuQuoteVerId)='+subQuoteVerId+'&answer(SubQuoteId)='+subQuoteId+'&answer(ParentQuoteVerId)='+parentQuoteVerId+'&answer(CustomerId)='+customerId+'&answer(QuoteStatus)='+paretQuoteStatus+'&answer(isRenewalEndorsement)=YES&answer(ParentQuoteId)='+parentQuoteId;
	autologout();
	new Ajax.Updater('Manuscript_CONT','../endorsement/ManuscriptSubjectivityDetail.jsp'+pars,{synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Manuscript_CONT").innerHTML);YAHOO.example.container.manuScript.show();document.getElementById("subj_desc").focus();},onException:function(){}});
}

function refreshEndorsementSubjectivity(){
//var parms ="answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ProductVerId)="+document.getElementById('productVerId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SubQuoteId)="+document.getElementById('subQuoteId1').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::Quote::ProductId)="+document.getElementById('productId1').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus1').value+"&answer(OwnerId)="+document.getElementById('ownerId').value;
autologout();
//new Ajax.Request('../getEndorsementSubjectivity.go', {method: 'post',parameters:parms,onComplete:function(transport){},onSuccess: function(transport){refereshEndorsementPreBindList();enableTabs();}});
refereshEndorsementPreBindList();
}



function refreshRenewalEndorsementSubjectivity(){
//var parms ="answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ProductVerId)="+document.getElementById('productVerId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SubQuoteId)="+document.getElementById('subQuoteId1').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::Quote::ProductId)="+document.getElementById('productId1').value+"&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value+"&answer(Object::Quote::QuoteStatus)="+document.getElementById('paretQuoteStatus1').value+"&answer(OwnerId)="+document.getElementById('ownerId').value;
autologout();
//new Ajax.Request('../getEndorsementSubjectivity.go', {method: 'post',parameters:parms,onComplete:function(transport){},onSuccess: function(transport){refereshEndorsementPreBindList();enableTabs();}});

refereshPreBindList();
refereshPostBindList();
}

function updateEndorsementSubjectivityStatus(form,obj,key){
	var parms = "&answer(Object::Quote::ParentQuoteId)="+document.getElementById('parentQuoteId1').value+"&answer(Object::Quote::ParentQuoteVerId)="+document.getElementById('parentQuoteVerId').value+"&answer(Object::Quote::SuQuoteVerId)="+document.getElementById('subQuoteVerId').value+"&answer(Object::User::AgencyId)="+document.getElementById('AgencyId_hidden').value;
	var SubjectivityRequiredProcess ='Pre Bind';
	var postBindRefresh = false;
	if(obj.value=='Overridden'){SubjectivityRequiredProcess='Post Bind';postBindRefresh=true;}
	var ans = window.confirm('Are you sure, you want to update the status for all the selected pre-bind subjectivities?');
	if (ans) {
		var url = "/SaveAllSubjectivity.do?answer(Object::Subjectivity::Status)="+obj.value+"&answer(SubjectivityType)="+key+"&answer(SubjectivityRequiredProcess)="+SubjectivityRequiredProcess+parms;
		if(document.getElementById('Quote_Endorsement')!=null && document.getElementById('Quote_Endorsement')!=undefined){
			url = url+"&answer(Quote::QuoteType)=Endorsement&answer(Object::Customer::CustomerId)="+document.getElementById('customerId1').value;
		}
		autologout();
		new Ajax.Request(url, {method: 'post',parameters:$(form).serialize(this),onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);},onSuccess: function(transport){refereshEndorsementPreBindList();obj.value='';}});
	}else{
		return false;
	}
}

function getPolicySubjectivityDetailpopup(subjectivityId){
	var parm1 = "answer(Object::Policy::Subjectivity::PolicySubjectivityId)="+subjectivityId;
	var url="../GetPolicySubjectivity.go?"+parm1;
	 showSubjDetail(url,subjectivityId);
}