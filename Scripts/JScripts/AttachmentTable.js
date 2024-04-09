function refereshAttachmentList(objectId,ownerId,objectType) {
	  YAHOO.example.Basic = function() {	    	    	     
	    	
	    	var formatCheck = function(elCell, oRecord, oColumn, sData) {	   		
		   		//var subId = oRecord.getData("SubjectivityId");	   		
		   		var html = "<input name='answer(AttachmentId)' value='"+oRecord.getData('Id')+"' type='checkbox'>";
		   		elCell.innerHTML = html;
	  		 }
	  		 
	  		 var formatLink = function(elCell, oRecord, oColumn, sData) {	  		   		 	
	  		 	elCell.innerHTML = "<a href='../DisplayAttachment.do?attachmentUrl="+escape(oRecord.getData('URL'))+"&attachmentType="+oRecord.getData('Type')+"&fileName="+escape(oRecord.getData('FileName'))+"&disposition=inline' target='new' class='plainlink' >"+oRecord.getData('File')+"</a>";	  		 	 
	  		 }
	    	
	        var myColumnDefs = [
	        	{key:"<input onclick='checkAllAttachment(this)' type='checkbox'>",formatter:formatCheck,sortable:false},
	         	{key:"S.No",sortable:false,resizable:"false",width:15},
	            {key:"Name",sortable:true,resizable:"false",width:150},
	            {key:"Description", sortable:true,resizable:"false",width:170},
	            {key:"File",sortable:true,resizable:"false",width:118},
	            {key:"Uploaded By", sortable:false,resizable:"false",width:124},
	            {key:"Uploaded Date", sortable:true,resizable:"false",width:100},
	            {key:"Status", sortable:true,resizable:"false",width:80}
	        ];
	        autologout();		
	        var myDataSource = new YAHOO.util.DataSource("../attachment/AttachmentResult.jsp?answer(objectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(objectType)="+objectType);
	        myDataSource.connMethodPost = true; 
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        myDataSource.asyncMode ='allowAll';
	        myDataSource.responseSchema = {
	        	recordDelim: "\n",
	            fieldDelim: "____~____*",
	            fields: ["<input onclick='checkAllAttachment(this)' type='checkbox'>","S.No","Name","Description","File","Uploaded By","Uploaded Date","Status","URL","Type","FileName","Id"]
	        };	       
	        
	        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
	            // the remote response is in oArgs.response,
	            // the raw text is oArgs.response.responseText   
	            var rawResponse = oArgs.response.responseText;
	            forwardToLoginPageIfInvalidSession(rawResponse);
	            
	        });
	        
	        var myDataTable = new YAHOO.widget.DataTable("ATTACHMENT_LIST",
	                myColumnDefs, myDataSource);
	                
	        return {
	            oDS: myDataSource,
	            oDT: myDataTable
	        };
	    }();
}

function refereshNotesList(objectId,ownerId,objectType) {
	  YAHOO.example.Basic = function() {	    	    	     
	    	
	    	var formatCheck = function(elCell, oRecord, oColumn, sData) {	   		
		   		//var subId = oRecord.getData("SubjectivityId");	   		
		   		var html = "<input name='answer(NotesId)' value='"+oRecord.getData('id')+"' type='checkbox'>";
		   		elCell.innerHTML = html;
	  		 }
	    	
	        var myColumnDefs = [
	        	{key:"<input onclick='checkAllNotes(this)' type='checkbox'>",formatter:formatCheck,sortable:false, resizeable:true},
	         	{key:"S.No",sortable:false,resizable:"false",width:10},
	            {key:"Title",sortable:true,resizable:"false",width:150},
	            {key:"Description", sortable:true,resizable:"false",width:300},
	            {key:"Added By", sortable:true,resizable:"false",width:145},
	            {key:"Added Date", sortable:true,resizable:"false",width:90},
	            {key:"Status", sortable:true,resizable:"false",width:70}
	        ];	
	        autologout();	
	        var myDataSource = new YAHOO.util.DataSource("../notes/NotesResult.jsp?answer(objectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(objectType)="+objectType);
	        myDataSource.connMethodPost = true; 
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        myDataSource.asyncMode ='allowAll';
	        myDataSource.responseSchema = {
	        	recordDelim: "___~___*",
	            fieldDelim: "____~____*",
	            fields: ["<input onclick='checkAllNotes(this)' type='checkbox'>","S.No","Title","Description","Added By","Added Date","Status","id"]
	        };       
	        
	        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
	            // the remote response is in oArgs.response,
	            // the raw text is oArgs.response.responseText   
	            var rawResponse = oArgs.response.responseText;
	            forwardToLoginPageIfInvalidSession(rawResponse);
	            
	        });
	        
	        var myDataTable = new YAHOO.widget.DataTable("NOTES_LIST",
	                myColumnDefs, myDataSource);
	                
	        return {
	            oDS: myDataSource,
	            oDT: myDataTable
	        };
	    }();
}


function refereshQuoteAttachmentList(objectId,objectVerId,ownerId,objectType,dataSourceURL) {
	   autologout();
var deleteAttachment=document.getElementById("deleteAttachmentNotes").value;
	  YAHOO.example.Basic = function() {	    	    	     

	    	
	    	var formatCheck = function(elCell, oRecord, oColumn, sData) {	   		
		   		//var subId = oRecord.getData("SubjectivityId");	   		
		   		var html = "<input name='answer(AttachmentId)' value='"+oRecord.getData('Id')+"' type='checkbox'>";
		   		elCell.innerHTML = html;
	  		 }
  		 
	  	    var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {             
	  	  
        	     elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="deleteQuoteAttachment('+objectId+','+objectVerId+','+ownerId+','+oRecord.getData('Id')+');"><img src="../Images/recycle2.gif"></a>'; 
        	};
	  		 
	  		    
//for underwriter, agent, agency (Attachement delete privilege)
if(deleteAttachment=="false"){
	        var myColumnDefs = [	        	
	         	{key:"S.No",sortable:false,resizable:"false",width:70},
	            {key:"Name",sortable:true,resizable:"false",width:140},
	            {key:"Description", sortable:true,resizable:"false",width:200},
	            {key:"File",sortable:true,resizable:"false",width:120},
	            {key:"Uploaded By", sortable:false,resizable:"false",width:135},
	            {key:"Uploaded Date", sortable:true,resizable:"false",width:80}           
	           
	        ];	
	 }        
//for admin , sysadmin users (Attachement delete privilege)	        
if(deleteAttachment=="true"){	
	        
	        var myColumnDefs = [	        	
	         	{key:"S.No",sortable:false,resizable:"false",width:70},
	            {key:"Name",sortable:true,resizable:"false",width:120},
	            {key:"Description", sortable:true,resizable:"false",width:200},
	            {key:"File",sortable:true,resizable:"false",width:120},
	            {key:"Uploaded By", sortable:false,resizable:"false",width:130},
	            {key:"Uploaded Date", sortable:true,resizable:"false",width:100},   
	            {key:"Delete", sortable:true,formatter:formatDeleteUrl,resizable:"false",width:50}
	            
	        ];
}        
	        
       	
	        var myDataSource = new YAHOO.util.DataSource(dataSourceURL);
	        myDataSource.connMethodPost = true; 
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        myDataSource.responseSchema = {
	        	recordDelim: "\n",
	            fieldDelim: "____~____*",
	            fields: ["S.No","Name","Description","File","Uploaded By","Uploaded Date","Delete","URL","Type","FileName","Id"]
	        };  
	        
	        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
	            // the remote response is in oArgs.response,
	            // the raw text is oArgs.response.responseText   
	            var rawResponse = oArgs.response.responseText;
	            forwardToLoginPageIfInvalidSession(rawResponse);
	            
	        });
	             
	        var myConfigs = { 
	    	        initialRequest: "answer(objectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(objectType)="+objectType, // Initial request for first page of data 
	    	        generateRequest: "answer(objectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(objectType)="+objectType,
	    	     	}; 	  
	        var myDataTable = new YAHOO.widget.DataTable("QUOTE_ATTACHMENT_LIST",
	                myColumnDefs, myDataSource, myConfigs);
	                
	                
	                
	        return {
	            oDS: myDataSource,
	            oDT: myDataTable
	        };
	    }();
}
function refereshQuoteNotesList(objectId,ownerId,objectType,dataSourceURL) {
	   autologout();
var deleteNotes=document.getElementById("deleteAttachmentNotes").value
	  YAHOO.example.Basic = function() {	    	    	     
	    	
	    	var formatCheck = function(elCell, oRecord, oColumn, sData) {	   		
		   		//var subId = oRecord.getData("SubjectivityId");	   		
		   		var html = "<input name='answer(NotesId)' type='checkbox'>";
		   		elCell.innerHTML = html;
	  		 }
	  		var formatDeleteUrl = function(elCell1, oRecord, oColumn, sData) {             	  	  
        	     elCell1.innerHTML = ' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="deleteQuoteNotes('+objectId+',0,'+ownerId+','+oRecord.getData('id')+');"><img src="../Images/recycle2.gif"></a>'; 
        	};

//for underwriter, agent, agency (Attachement delete privilege)
if(deleteNotes=="false"){		    	
	        var myColumnDefs = [
	         	{key:"S.No",sortable:true,resizable:"false",width:70},
	            {key:"Title",sortable:true,resizable:"false",width:180},
	            {key:"Description", sortable:true,resizable:"false",width:340},
	            {key:"Added By", sortable:true,resizable:"false",width:155},
	            {key:"Added Date", sortable:true,resizable:"false",width:85}

	        ];	
}
//for admin , sysadmin users (Attachement delete privilege)	  
if(deleteNotes=="true"){		    	
	        var myColumnDefs = [
	         	{key:"S.No",sortable:true,resizable:"false",width:70},
	            {key:"Title",sortable:true,resizable:"false",width:202},
	            {key:"Description", sortable:true,resizable:"false",width:270},
	            {key:"Added By", sortable:true,resizable:"false",width:114},
	            {key:"Added Date", sortable:true,resizable:"false",width:85},
	            {key:"Delete", sortable:true,resizable:"false",width:60,formatter:formatDeleteUrl}
	        ];	
}	        	
	        var myDataSource = new YAHOO.util.DataSource(dataSourceURL);
	        myDataSource.connMethodPost = true; 
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        myDataSource.responseSchema = {
	        	recordDelim: "___~___*",
	            fieldDelim: "____~____*",
	            fields: ["S.No","Title","Description","Added By","Added Date","Delete","id"]
	        };       
	        
	        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
	            // the remote response is in oArgs.response,
	            // the raw text is oArgs.response.responseText   
	            var rawResponse = oArgs.response.responseText;
	            forwardToLoginPageIfInvalidSession(rawResponse);
	            
	        });
	        var myConfigs = { 
	    	        initialRequest: "answer(objectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(objectType)="+objectType, // Initial request for first page of data 
	    	        generateRequest: "answer(objectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(objectType)="+objectType,
	    	     	};
	        var myDataTable = new YAHOO.widget.DataTable("QUOTE_NOTES_LIST",
	                myColumnDefs, myDataSource,myConfigs);
	                
	        return {
	            oDS: myDataSource,
	            oDT: myDataTable
	        };
	    }();
}

function refereshQuoteEmailList(objectId,ownerId,objectType,dataSourceURL) {
	   autologout();
	var EmailViewPrevilegeAvail=document.getElementById("EmailViewPrevilegeAvail").value
	var QuoteStatus="";
	var isEndorsementQuote="";
	if((document.getElementById("paretQuoteStatus") != null) && (document.getElementById("paretQuoteStatus") != undefined)) {
		QuoteStatus = document.getElementById("paretQuoteStatus").value
	}
	if((document.getElementById("isEndorsementQuote") != null) && (document.getElementById("isEndorsementQuote") != undefined)) {
		isEndorsementQuote=document.getElementById("isEndorsementQuote").value
	}
	var EmailType="";
	if(isEndorsementQuote){
		if(QuoteStatus=="Issued"){
					EmailType="POLICY";
				}else if(QuoteStatus=="Offered" || QuoteStatus=="Bind Request"){
					EmailType="QUOTE";
				}else if(QuoteStatus=="Bound"){
					EmailType="BINDER";
				}else{
					EmailType="CORRESP";
				}
		}else{
			EmailType="ENDORS";
		}
	

	  YAHOO.example.Basic = function() {	    	    	     
	    	
	    

		    	
	        var myColumnDefs = [
	         	{key:"S.No",sortable:true,width:70},
	            {key:"Sent To",sortable:true,width:150},
	            {key:"EMail Subject", sortable:true,width:264},
	            {key:"Send Status", sortable:true,width:80},
	            {key:"Sent by", sortable:true,width:155},	            
	            {key:"Sent Date", sortable:true,width:85}

	        ];	

 
	        	
	
	        var myDataSource = new YAHOO.util.DataSource(dataSourceURL);
	        myDataSource.connMethodPost = true; 
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        myDataSource.responseSchema = {
	        	recordDelim: "___~___*",
	            fieldDelim: "____~____*",
	            fields: ["S.No","Sent To","EMail Subject","Send Status","Sent by","Sent Date","FromAddress","ObjectVerId","NotificationId","QuoteStatus","QuoteNum","QuoteSubNum","PolicyNumber"]
	        };       
	        
	        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
	            // the remote response is in oArgs.response,
	            // the raw text is oArgs.response.responseText   
	            var rawResponse = oArgs.response.responseText;
	            forwardToLoginPageIfInvalidSession(rawResponse);
	            
	        });
	        var myConfigs = { 
	    	        initialRequest: "answer(ObjectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(ObjectType)="+objectType+"&answer(isEndorsementQuote)="+isEndorsementQuote+"&answer(QuoteStatus)="+QuoteStatus, // Initial request for first page of data 
	    	        generateRequest: "answer(ObjectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(ObjectType)="+objectType+"&answer(isEndorsementQuote)="+isEndorsementQuote+"&answer(QuoteStatus)="+QuoteStatus,
	    	     	}; 	  
	  
	        var myDataTable = new YAHOO.widget.DataTable("QUOTE_EMAIL_LIST",
	                myColumnDefs, myDataSource,myConfigs);
	                
	        return {
	            oDS: myDataSource,
	            oDT: myDataTable
	        };
	    }();
}
YAHOO.namespace("example.container");
function initAttach() {			
	YAHOO.example.container.AttachFiles = new YAHOO.widget.Dialog("AttachFiles", 
								{														
								  fixedcenter : true,
							  visible : false,
							  zIndex : 1000,
							  close:true,
							  modal:true,
							  iframe : true,
							  constraintoviewport : true,
							  underlay : 'none'	
								  							  
							});		
	YAHOO.example.container.AttachFiles.render();	      		
}
YAHOO.util.Event.onDOMReady(initAttach);

function initNotes() {	
document.getElementById("AddNotespopup").style.display = 'none';
	YAHOO.example.container.AddNotespopup = new YAHOO.widget.Dialog("AddNotespopup", 
								{														
								  fixedcenter : true,							  
								  visible : false,
								  zIndex : 1000,
								  close:false,
								  modal:true,
								  constraintoviewport : true,
								  iframe : true,
								  underlay : 'none'								  
							});
	YAHOO.example.container.AddNotespopup.render();	 		
}
YAHOO.util.Event.onDOMReady(initNotes);
function showAttach(objectId,objectVerId,objectType) {
	//alert(objectId);alert(objectVerId);alert(objectType);
	if(document.getElementById("isRenewal") != null && document.getElementById("isRenewal") != undefined) {
		
		if(document.getElementById("isRenewal").value == "true") {
			var subjectivityAlertObjectType = document.getElementById("subjectivityAlertObjectType").value;
			if(document.getElementById("RenewalQuoteId") != null && document.getElementById("RenewalQuoteId") != undefined) {
				var renewalQuoteId = document.getElementById("RenewalQuoteId").value 
			}
			if(document.getElementById("RenewalQuoteverId") != null && document.getElementById("RenewalQuoteverId") != undefined) {
				var renewalQuoteverId = document.getElementById("RenewalQuoteverId").value 
			}
			var pars = "?answer(isRenewal)="+document.getElementById("isRenewal").value+"&answer(agencyId)="+document.getElementById("agencyId").value+"&answer(subjectivityObjectType)="+document.getElementById("subjectivityObjectType").value+"&answer(subjectivityAlertObjectType)="+subjectivityAlertObjectType+"&answer(renewalQuoteId)="+renewalQuoteId+"&answer(renewalQuoteverId)="+renewalQuoteverId;		
			var url = "/attachment/SubjectivityAttachmentDetail.jsp";
		} else {
			var subjectivityAlertObjectType = "";
			if(document.getElementById("subjectivityAlertObjectType") != null && document.getElementById("subjectivityAlertObjectType") != undefined) {
				subjectivityAlertObjectType = document.getElementById("subjectivityAlertObjectType").value;
			}
			if(document.getElementById("parentQuoteId") != null && document.getElementById("parentQuoteId") != undefined) {
				var parentQuoteId = document.getElementById("parentQuoteId").value; 
			}
			if(document.getElementById("parentQuoteVerId") != null && document.getElementById("parentQuoteVerId") != undefined) {
				var parentQuoteVerId = document.getElementById("parentQuoteVerId").value; 
			}		
			var quoteStatus = "";
			if(document.getElementById("paretQuoteStatus") != null && document.getElementById("paretQuoteStatus") != undefined) {
				quoteStatus = document.getElementById("paretQuoteStatus").value;
			}
			var subjectivityObjectType = "";
			if(document.getElementById("subjectivityObjectType") != null && document.getElementById("subjectivityObjectType") != undefined) {
				subjectivityObjectType = document.getElementById("subjectivityObjectType").value;
			}
			var pars = "?answer(agencyId)="+document.getElementById("agencyId").value+"&answer(subjectivityObjectType)="+subjectivityObjectType+"&answer(subjectivityAlertObjectType)="+subjectivityAlertObjectType+"&answer(parentQuoteId)="+parentQuoteId+"&answer(parentQuoteVerId)="+parentQuoteVerId+"&answer(quoteStatus)="+quoteStatus;
			var url = "/attachment/SubjectivityAttachmentDetail.jsp";
		}
		
	} else {
		var subjectivityAlertObjectType = "";
		if(document.getElementById("subjectivityAlertObjectType") != null && document.getElementById("subjectivityAlertObjectType") != undefined) {
			subjectivityAlertObjectType = document.getElementById("subjectivityAlertObjectType").value;
		}
		if(document.getElementById("parentQuoteId") != null && document.getElementById("parentQuoteId") != undefined) {
			var parentQuoteId = document.getElementById("parentQuoteId").value; 
		}
		if(document.getElementById("parentQuoteVerId") != null && document.getElementById("parentQuoteVerId") != undefined) {
			var parentQuoteVerId = document.getElementById("parentQuoteVerId").value; 
		}		
		var quoteStatus = "";
		if(document.getElementById("paretQuoteStatus") != null && document.getElementById("paretQuoteStatus") != undefined) {
			quoteStatus = document.getElementById("paretQuoteStatus").value;
		}
		var subjectivityObjectType = "";
		if(document.getElementById("subjectivityObjectType") != null && document.getElementById("subjectivityObjectType") != undefined) {
			subjectivityObjectType = document.getElementById("subjectivityObjectType").value;
		}
		var pars = "?answer(agencyId)="+document.getElementById("agencyId").value+"&answer(subjectivityObjectType)="+subjectivityObjectType+"&answer(subjectivityAlertObjectType)="+subjectivityAlertObjectType+"&answer(parentQuoteId)="+parentQuoteId+"&answer(parentQuoteVerId)="+parentQuoteVerId+"&answer(quoteStatus)="+quoteStatus;
		var url = "/attachment/SubjectivityAttachmentDetail.jsp";
	}
	autologout();
	new Ajax.Updater('AttachFiles',url,{method: 'post',synchronous:true, parameters:pars, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("AttachFiles").innerHTML);document.getElementById('AttachFiles').style.display='inline';YAHOO.example.container.AttachFiles.show();setObjDetail(objectId,objectVerId,objectType);document.getElementById('attachmentName').focus();},onException:function(){}});	
}
function setObjDetail(objectId,objectVerId,objectType) {
	document.AttachmentList.objectTypeLink.value=objectType;
	document.AttachmentList.objectId.value=objectId;
	document.AttachmentList.objectId1.value=objectId;
	document.AttachmentList.objectVerId.value=objectVerId;
	document.AttachmentList.objectVerId1.value=objectVerId;
	document.AttachmentList.objectType.value=objectType;
}

function saveAttachment1() {
if( validateAttachment()){
	document.AttachmentList.submit();
}
}

function validateAttachment(){
		if (document.AttachmentList.attachmentName.value ==""){
			alert("Attachment Name is empty");
			return false;
	    }	
	    //if (document.AttachmentList.attachmentDesc.value ==""){
		//	alert("Attachment Description is empty");
		//	return false;
	    //}	
	    if (document.AttachmentList.myFile.value ==""){
			alert("File has not been Attached Yet !!!");
			return false;
	    }
	    return true;	
}

function hideAttachPopup() {
	if(document.AttachmentList!=null){
		
	if(document.AttachmentList.objectType.value=="QUOTE"){
		refereshQuoteAttachmentList(document.AttachmentList.objectId.value,document.AttachmentList.objectVerId.value,document.AttachmentList.ownerId.value,document.AttachmentList.objectType.value,'../attachment/QuoteAttachmentResult.jsp');
		}else {
			if(document.getElementById("ATTACHMENT_LIST")!=null && document.getElementById("ATTACHMENT_LIST_MAIN")!=undefined){
				refereshAttachmentList(document.AttachmentList.objectId.value,document.AttachmentList.ownerId.value,document.AttachmentList.objectType.value);		
			}
			if(document.getElementById("ATTACHMENT_LIST_MAIN")!=null && document.getElementById("ATTACHMENT_LIST_MAIN")!=undefined){
				if(document.getElementById("PrimaryOrRenewalQuoteId")!=null && document.getElementById("PrimaryOrRenewalQuoteId")!=undefined && document.getElementById("PrimaryOrRenewalQuoteId").value !== ""){
					refereshMultiAttachmentList(document.getElementById("PrimaryOrRenewalQuoteId").value,document.AttachmentList.ownerId.value,document.AttachmentList.objectType.value);
				} else {
					refereshMultiAttachmentList(document.getElementById("parentQuoteId").value,document.AttachmentList.ownerId.value,document.AttachmentList.objectType.value);
				}
			}
		}			
		document.getElementById('AttachFiles').style.display='none';
		YAHOO.example.container.AttachFiles.hide();	
	}
}

function showNotes(objectId,objectVerId,objectType) {
	//alert(objectId);alert(objectVerId);alert(objectType);
	var url = "/notes/NotesDetail.jsp";
	document.getElementById("AddNotespopup").innerHTML="";
	autologout();
	new Ajax.Updater('AddNotespopup',url,{synchronous:true, parameters:'', onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("AddNotespopup").innerHTML);showNotesBody(objectId,objectVerId,objectType);},onException:function(){}});			
	
}
var myEditor;
function showNotesBody (objectId,objectVerId,objectType) {
var myConfig = {
        height: '110px',
        width: '580px', 
        dompath: true,
        focusAtStart: true
    };

    YAHOO.log('Create the Editor..', 'info', 'example');
    myEditor = new YAHOO.widget.SimpleEditor('editor_notes', myConfig);
    //myEditor._defaultToolbar.buttonType = 'advanced';    
    myEditor.render(); 
	document.getElementById("AddNotespopup").style.display = 'inline';	
	YAHOO.example.container.AddNotespopup.show();
	document.NotesForm.objectType.value=objectType;
	document.NotesForm.objectId.value=objectId;
	document.NotesForm.objectVerId.value=objectVerId;
}

function saveNotes(){
		var Description = encodeURIComponent(document.NotesForm.notesDesc.value);
		var Private = "N";
  		if(document.NotesForm.mprivate != null && document.NotesForm.mprivate != undefined) {
  			Private = document.NotesForm.mprivate.value;
  		}
  		var Notes = encodeURIComponent(myEditor.getEditorHTML());  		
  		var notesValidateFunction=notesValidate(Description,Notes);
  		
  		if(notesValidateFunction){
  			var ObjectType = document.NotesForm.objectType.value;
	  		var ObjectId = document.NotesForm.objectId.value;
	  		var ObjectVerId = document.NotesForm.objectVerId.value;
	  		var UserName = document.NotesForm.User.value; 
	  		var Active = document.NotesForm.Active.value; 
	  		var UserRole = document.NotesForm.UserRole.value;
	  		var OwnerId = document.NotesForm.ownerId.value;
	  		var pars='&answer(isUpdated)='+"Y"+'&answer(Object::Activity::CreatedBy)='+UserName+'&answer(Object::Activity::ObjectType)='+"QUOTE"+'&answer(Object::Activity::ActivityType)='+"Quote Management"+'&answer(Object::Notes::Description)='+Description+'&answer(Object::Notes::Private)='+Private+'&answer(Object::Notes::Notes)='+Notes+'&answer(Object::Notes::ObjectType)='+ObjectType+'&answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::ObjectVerId)='+ObjectVerId+'&answer(Object::Notes::UserName)='+UserName+'&answer(Object::Notes::Active)='+Active+'&answer(Object::Notes::UserRole)='+UserRole+'&answer(Object::Activity::OwnerId)='+OwnerId+'&answer(Object::Notes::OwnerId)='+OwnerId+'&approvalStatus=';	
	  		autologout();
	  		new Ajax.Updater({success: 'success'},'../AddNotes.do?',{method: 'post', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);hideNotes(ObjectId,OwnerId,ObjectType);}});		
  		}
}

function notesValidate(Description,Notes){
    if (Description==""){
		alert("Notes Description is empty");
		return false;
    }	
    if(Notes==""){
    	alert("Notes is empty");
		return false;
    }	
    return true;   
}
function hideNotes(objectId,ownerId,objectType){
	if(objectType=="Quote"){
		refereshQuoteNotesList(objectId,ownerId,objectType,"../notes/NotesResult.jsp")
	}else {
		refereshNotesList(objectId,ownerId,objectType);
		if(document.getElementById("PrimaryOrRenewalQuoteId")!=null && document.getElementById("PrimaryOrRenewalQuoteId")!=undefined && document.getElementById("PrimaryOrRenewalQuoteId").value !== ""){
			refereshMultiNotesList(document.getElementById("PrimaryOrRenewalQuoteId").value,ownerId,objectType);
		} else {
			refereshMultiNotesList(document.getElementById("parentQuoteId").value,ownerId,objectType);
		}
	}
	document.getElementById('AddNotespopup').style.display = 'none';
	YAHOO.example.container.AddNotespopup.hide();
	if(document.getElementById('text') != null && document.getElementById('text') != undefined) {
		document.getElementById('text').style.display = 'none';
	}
}

function attachmentStatusChange(objectId,ownerId,objectType){
var ans = window.confirm('Are you sure, you want to update the status for all the selected Attachments?');
	if(ans){
	autologout();
	new Ajax.Updater('','../UpdateAttachmentListApprovalStatus.do?answer(AttachmentKey)=AttachmentId',{synchronous:true, parameters:$(document.AttachmentListFrm).serialize(this), onComplete:function(){refereshAttachmentList(objectId,ownerId,objectType);},onException:function(){}});
	}else {
	return false;
	}
}

function checkAllAttachment(obj) {
	var check = false;
	if(obj.checked){check=true}
	var size = document.getElementsByName('answer(AttachmentId)').length;
	for(i=0;i<size;i++){
		document.getElementsByName('answer(AttachmentId)')[i].checked=check;
	}
}

function checkAllNotes(obj) {
	var check = false;
	if(obj.checked){check=true}
	var size = document.getElementsByName('answer(NotesId)').length;
	for(i=0;i<size;i++){
		document.getElementsByName('answer(NotesId)')[i].checked=check;
	}
}

function deleteAttachment(objectId,objectVerId,objectType,ownerId){
var ans = window.confirm('Are you sure, you want to delete all the selected Attachments ?');
if (ans) {
	var parms = "answer(Object::AttachmentObjectLink::ObjectId)="+objectId+"&answer(Object::AttachmentObjectLink::ObjectVerId)="+objectVerId+"&answer(Object::AttachmentObjectLink::ObjectType)="+objectType+"&answer(AttachmentKey)=AttachmentId";
	autologout();
	new Ajax.Updater('','../DeleteAttachmentList.do?'+parms,{synchronous:true, parameters:$(document.AttachmentListFrm).serialize(this), onComplete:function(){refereshAttachmentList(objectId,ownerId,objectType);},onException:function(){}});
}else {
return false;
}
}

function deleteQuoteAttachment(objectId,objectVerId,ownerId,attachmentId){
var ans = window.confirm('Are you sure, you want to delete the Attachments?');
if (ans) {
var parms = "answer(Object::AttachmentObjectLink::ObjectId)="+objectId+"&answer(Object::AttachmentObjectLink::ObjectVerId)="+objectVerId+"&answer(Object::AttachmentObjectLink::ObjectType)=QUOTE&answer(AttachmentKey)="+"AttachmentId"+"&answer(AttachmentId)="+attachmentId;
autologout();

new Ajax.Updater('','../DeleteAttachmentList.do?'+parms,{synchronous:true, parameters:'', onComplete:function(){refereshQuoteAttachmentList(objectId,objectVerId,ownerId,"QUOTE","../attachment/QuoteAttachmentResult.jsp");},onException:function(){}});
}else {
return false;
}
}


function notesStatusChange(objectId,ownerId,objectType){
var ans = window.confirm('Are you sure, you want to update the status for all the selected Notes?');
if(ans) {
autologout();
new Ajax.Updater('','../UpdateNotesListApproval.do?answer(NotesKey)=NotesId',{synchronous:true, parameters:$(document.NotesListFrm).serialize(this), onComplete:function(){refereshNotesList(objectId,ownerId,objectType);},onException:function(){}});
}else {
return false;
}
}

function deleteQuoteNotes(objectId,objectVerId,ownerId,notesId){
var ans = window.confirm('Are you sure, you want to delete the Notes ?');
if(ans){
var parms = "answer(Object::Notes::ObjectId)="+objectId+"&answer(Object::Notes::ObjectVerId)="+objectVerId+"&answer(Object::Notes::ObjectType)=QUOTE&answer(NotesKey)=NotesId&answer(NotesId)="+notesId;
autologout();
if(document.forms[0] !=null && document.forms[0]!='undefined'){
new Ajax.Updater('','../DeleteNotesList.do?'+parms,{synchronous:true, parameters:$(document.forms[0]).serialize(this), onComplete:function(){refereshQuoteNotesList(objectId,ownerId,"QUOTE","../notes/NotesResult.jsp");},onException:function(){}});
}else{
new Ajax.Updater('','../DeleteNotesList.do?'+parms,{synchronous:true, onComplete:function(){refereshQuoteNotesList(objectId,ownerId,"QUOTE","../notes/NotesResult.jsp");},onException:function(){}});
}
}else {
return false;
}
}
function deleteNotes(objectId,objectVerId,objectType,ownerId){
var ans = window.confirm('Are you sure, you want to delete all the selected Notes ?');
if(ans){
var parms = "answer(Object::Notes::ObjectId)="+objectId+"&answer(Object::Notes::ObjectVerId)="+objectVerId+"&answer(Object::Notes::ObjectType)="+objectType+"&answer(NotesKey)=NotesId";
autologout();
new Ajax.Updater('','../DeleteNotesList.do?'+parms,{synchronous:true, parameters:$(document.NotesListFrm).serialize(this), onComplete:function(){refereshNotesList(objectId,ownerId,objectType);},onException:function(){}});
}else {
return false;
}
}

function refreshEmailList(){
var quoteId=document.getElementById("parentQuoteId").value;
var ownerId = document.getElementById("ownerId").value; 
	document.body.style.cursor = "wait"	;
document.getElementById("QUOTE_EMAIL_LIST").innerHTML="<br> <br>             Sending Mail"
setTimeout("refereshQuoteEmailList("+quoteId+","+ownerId+",'QUOTE','../email/SentEMailListUI3.jsp')",10000);
	document.body.style.cursor = "default"	;
//refereshQuoteEmailList(quoteId,ownerId,"QUOTE");
 }

function changevalue() {

	if(document.getElementById("mprivate") != null && document.getElementById("mprivate") != undefined) {
		if(document.getElementById("mprivate").value == "Y") {
			document.getElementById("mprivate").value = "N";
		} else if(document.getElementById("mprivate").value == "N") {
			document.getElementById("mprivate").value = "Y";
		}
	}
}
