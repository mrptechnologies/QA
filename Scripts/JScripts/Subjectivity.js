/**
 * To get the Location list for Manu scritp Subjectivity
 * @author Guru
 */
function showManuscriptLocationList(frm,obj){

	if(obj.value=='Location' || obj.value=='Risk'){
		document.getElementById("Location_Container_tr").style.display = "inline";	
		document.getElementById("Location_Container_tr_space").style.display = "inline";			
		var url = "/GetSubjectivityLocationList.do";
		var parameter='answer(Object::Quote::ParentQuoteId)='+frm.parentQuoteId.value+'&answer(Object::Quote::ParentQuoteVerId)='+frm.parentQuoteVerId.value;		
		autologout();
		new Ajax.Updater('Location_Container',url,{synchronous:true, parameters:parameter, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Location_Container").innerHTML);if(obj.value=='Risk'){showManuscriptRiskList(frm,frm.riskInfo)}else{document.getElementById("Risk_Container_tr").style.display = "none";}}});
	}else{
		document.getElementById("Location_Container_tr").style.display = "none";
		document.getElementById("Risk_Container_tr").style.display = "none";
		document.getElementById("Location_Container_tr_space").style.display = "none";
		document.getElementById("Risk_Container_tr_space").style.display = "none";
	}
}

function showPolicyLocationList(frm,obj) {
	if(obj.value=='Location' || obj.value=='Risk'){
		document.getElementById("Location_Container_tr").style.display = "inline";	
		document.getElementById("Location_Container_tr_space").style.display = "inline";			
		var url = "/policy/AJAXLocationList.jsp";
		var parameter='answer(PolicyId)='+frm.policyId.value+'&answer(PolicyVerId)='+frm.policyVerId.value+'&answer(OwnerId)='+frm.ownerId.value+'&answer(PolicyNumber)='+frm.policyNumber.value;		
		new Ajax.Updater('Location_Container',url,{synchronous:true, parameters:parameter, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Location_Container").innerHTML);if(obj.value=='Risk'){showPolicyRiskList(frm,frm.riskInfo)}else{document.getElementById("Risk_Container_tr").style.display = "none";}}});
	}else{
		document.getElementById("Location_Container_tr").style.display = "none";
		document.getElementById("Risk_Container_tr").style.display = "none";
		document.getElementById("Location_Container_tr_space").style.display = "none";
		document.getElementById("Risk_Container_tr_space").style.display = "none";
	}	
}

function showPolicyRiskList(frm,Obj){
	if(frm.Subj_Level.value =='Risk') {
		var url = "/getSubjectivityPolicyLocationTankList.do";
		document.getElementById("Risk_Container_tr").style.display = "inline";
		document.getElementById("Risk_Container_tr_space").style.display = "inline";
		var locationInfo = (frm.locattionInfo.value).split("____");
		//alert(locationInfo[0]);	
		var parameter='answer(policyId)='+frm.policyId.value+'&answer(policyVerId)='+frm.policyVerId.value+'&answer(OwnerId)='+frm.ownerId.value+'&answer(policyNumber)='+frm.policyNumber.value+'&answer(locationId)='+locationInfo[0];		
		new Ajax.Updater('Risk_Container',url,{synchronous:true, parameters:parameter, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Risk_Container").innerHTML);}});
	}
}

function showManuscriptRiskList(frm,Obj){
	if(document.getElementById('MANUFORM').Subj_Level.value =='Risk') {
		var url = "/GetSubjectivityRiskList.do";
		document.getElementById("Risk_Container_tr").style.display = "inline";
		document.getElementById("Risk_Container_tr_space").style.display = "inline";
		var locationInfo = (frm.locattionInfo.value).split("____");
		//alert(locationInfo[0]);	
		var parameter='answer(Object::Quote::ParentQuoteId)='+frm.parentQuoteId.value+'&answer(Object::Quote::ParentQuoteVerId)='+frm.parentQuoteVerId.value+'&answer(Object::Quote::SubQuoteId)='+frm.subQuoteId.value+'&answer(Object::Quote::LocationId)='+locationInfo[0];
		autologout();
		new Ajax.Updater('Risk_Container',url,{synchronous:true, parameters:parameter, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Risk_Container").innerHTML);}});
	}
}

function refereshMultiAttachmentList(objectId,ownerId,objectType) { 	
 	var parentQuoteVerId=0;
 	if(document.getElementById('parentQuoteVerId')!=null && document.getElementById('parentQuoteVerId')!=undefined) {
 		parentQuoteVerId = document.getElementById('parentQuoteVerId').value
 	}
 	var subQuoteVerId=0;
 	if(document.getElementById('subQuoteVerId')!=null && document.getElementById('subQuoteVerId')!=undefined) {
 		subQuoteVerId = document.getElementById('subQuoteVerId').value
 	} 
 	var policyId=0;
 	if(document.getElementById('policyId')!=null && document.getElementById('policyId')!=undefined) {
 		policyId = document.getElementById('policyId').value
 	}
 	var policyVerId=0;
 	if(document.getElementById('policyVerId')!=null && document.getElementById('policyVerId')!=undefined) {
 		policyVerId = document.getElementById('policyVerId').value
 	}
 	subjectivityParentObjectType="QUOTE";
 	if(document.getElementById('SubjectivityParentObjectType')!=null && document.getElementById('SubjectivityParentObjectType')!=undefined) {
 		subjectivityParentObjectType = document.getElementById('SubjectivityParentObjectType').value
 	}
  YAHOO.example.Basic = function() {	    	    	         	
    	var formatCheck = function(elCell, oRecord, oColumn, sData) {	   		
	   		//var subId = oRecord.getData("SubjectivityId");	   		
	   		var html = "<input name='answer(MainPageAttachmentId)' value='"+oRecord.getData('Id')+"' type='checkbox'>";
	   		elCell.innerHTML = html;
  		 }
  		 
  		 var formatLink = function(elCell, oRecord, oColumn, sData) {		  		 	
  		 	elCell.innerHTML = "<a href='../DisplayAttachment.do?attachmentUrl="+escape(oRecord.getData('URL'))+"&attachmentType="+oRecord.getData('Type')+"&fileName="+escape(oRecord.getData('FileName'))+"&disposition=inline' target='new' class='plainlink' >"+oRecord.getData('File')+"</a>";	  		 	 
  		 }
    	
        var myColumnDefs = [
        	{key:"<input onclick='checkAllMainAttachment(this)' type='checkbox'>",formatter:formatCheck,sortable:false},
         	{key:"S.No",sortable:false,width:15},
            {key:"Name",sortable:true,width:100},
            {key:"Description", sortable:true,width:150},
            {key:"File",sortable:true,formatter:formatLink,width:100},
            {key:"Uploaded By", sortable:false,width:94},
            {key:"Uploaded Date", sortable:true,width:65},
            {key:"Status", sortable:true,width:60},
            {key:"Attached Level", sortable:true,width:70}	            
        ];	
        
        		
        autologout();
        var myDataSource = new YAHOO.util.DataSource("../attachment/AttachemtnListResult.jsp?answer(objectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(objectType)="+objectType+"&answer(ParentQuoteVerId)="+parentQuoteVerId+"&answer(SubQuoteVerId)="+subQuoteVerId+"&answer(SubjectivityParentObjectType)="+subjectivityParentObjectType+"&answer(PolicyId)="+policyId+"&answer(PolicyVerId)="+policyVerId);
        myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        myDataSource.asyncMode ='allowAll';
        myDataSource.responseSchema = {
        	recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["<input onclick='checkAllMainAttachment(this)' type='checkbox'>","S.No","Name","Description","File","Uploaded By","Uploaded Date","Status","URL","Type","FileName","Id","Attached Level"]
        }; 
        
        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });
        
        var myConfigs = {   
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
         
        var myDataTable = new YAHOO.widget.DataTable("ATTACHMENT_LIST_MAIN",
                myColumnDefs, myDataSource,myConfigs);
                
        return {
            oDS: myDataSource,
            oDT: myDataTable
        };
    }();
}

function refereshMultiNotesList(objectId,ownerId,objectType) {	 
	 var parentQuoteVerId=0;
 	if(document.getElementById('parentQuoteVerId')!=null && document.getElementById('parentQuoteVerId')!=undefined) {
 		parentQuoteVerId = document.getElementById('parentQuoteVerId').value
 	}
 	var subQuoteVerId=0;
 	if(document.getElementById('subQuoteVerId')!=null && document.getElementById('subQuoteVerId')!=undefined) {
 		subQuoteVerId = document.getElementById('subQuoteVerId').value
 	}
 	var policyId=0;
 	if(document.getElementById('policyId')!=null && document.getElementById('policyId')!=undefined) {
 		policyId = document.getElementById('policyId').value
 	}
 	var policyVerId=0;
 	if(document.getElementById('policyVerId')!=null && document.getElementById('policyVerId')!=undefined) {
 		policyVerId = document.getElementById('policyVerId').value
 	}
 	subjectivityParentObjectType="QUOTE";
 	if(document.getElementById('SubjectivityParentObjectType')!=null && document.getElementById('SubjectivityParentObjectType')!=undefined) {
 		subjectivityParentObjectType = document.getElementById('SubjectivityParentObjectType').value
 	}
	  YAHOO.example.Basic = function() {	    	    	     
	    	
	    	var formatCheck = function(elCell, oRecord, oColumn, sData) {	   		
		   		//var subId = oRecord.getData("SubjectivityId");	   		
		   		var html = "<input name='answer(MainPageNotesId)' value='"+oRecord.getData('id')+"' type='checkbox'>";
		   		elCell.innerHTML = html;
	  		 }
	    	
	        var myColumnDefs = [
	        	{key:"<input onclick='checkAllMainNotes(this)' type='checkbox'>",formatter:formatCheck,sortable:false, resizeable:true},
	         	{key:"S.No",sortable:false,width:10},
	            {key:"Title",sortable:true,width:150},
	            {key:"Description", sortable:true,width:220},
	            {key:"Added By", sortable:true,width:100},
	            {key:"Added Date", sortable:true,width:70},
	            {key:"Status", sortable:true,width:60},
	             {key:"Added Level", sortable:true,width:60}
	        ];
	        autologout();		
	        var myDataSource = new YAHOO.util.DataSource("../notes/SubjectivityNotesList.jsp?answer(objectId)="+objectId+"&answer(OwnerId)="+ownerId+"&answer(objectType)="+objectType+"&answer(ParentQuoteVerId)="+parentQuoteVerId+"&answer(SubQuoteVerId)="+subQuoteVerId+"&answer(SubjectivityParentObjectType)="+subjectivityParentObjectType+"&answer(PolicyId)="+policyId+"&answer(PolicyVerId)="+policyVerId);
	        myDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
	        myDataSource.asyncMode ='allowAll';
	        myDataSource.responseSchema = {
	        	recordDelim: "___~___*",
	            fieldDelim: "____~____*",
	            fields: ["<input onclick='checkAllMainNotes(this)' type='checkbox'>","S.No","Title","Description","Added By","Added Date","Status","id","Added Level"]
	        };    
	        
	        myDataSource.subscribe( 'responseEvent',  function(oArgs) {         
	            // the remote response is in oArgs.response,
	            // the raw text is oArgs.response.responseText   
	            var rawResponse = oArgs.response.responseText;
	            forwardToLoginPageIfInvalidSession(rawResponse);
	            
	        });
	         var myConfigs = {   
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
	        var myDataTable = new YAHOO.widget.DataTable("NOTES_LIST_MAIN",
	                myColumnDefs, myDataSource,myConfigs);
	                
	        return {
	            oDS: myDataSource,
	            oDT: myDataTable
	        };
	    }();
}

function checkAllMainAttachment(obj) {
	var check = false;
	if(obj.checked){check=true}
	var size = document.getElementsByName('answer(MainPageAttachmentId)').length;
	for(i=0;i<size;i++){
		document.getElementsByName('answer(MainPageAttachmentId)')[i].checked=check;
	}
}

function checkAllMainNotes(obj) {
	var check = false;
	if(obj.checked){check=true}
	var size = document.getElementsByName('answer(MainPageNotesId)').length;
	for(i=0;i<size;i++){
		document.getElementsByName('answer(MainPageNotesId)')[i].checked=check;
	}
}

function countAllCheckedAttachments(obj){
   	var size = document.getElementsByName('answer(MainPageAttachmentId)').length;
	for(i=0;i<size;i++){
	  if(document.getElementsByName('answer(MainPageAttachmentId)')[i].checked == true ) {
	     return true;
	  }
	}
	return false;
}

function countAllCheckedNotes(obj){
   	var size = document.getElementsByName('answer(MainPageNotesId)').length;
	for(i=0;i<size;i++){
	  if(document.getElementsByName('answer(MainPageNotesId)')[i].checked == true ) {
	     return true;
	  }
	}
	return false;
}
function attachmentStatusChangeMain(objectId,ownerId,objectType,obj){
	var check = false;
	check= countAllCheckedAttachments(obj);
	if(check) {
		var ans = window.confirm('Are you sure, you want to update the status for all the selected Attachments?');
	}
	if(!check) {
	     alert("No Attachments are selected");
	     obj.value='';
	}
	if(ans){
	new Ajax.Updater('','../UpdateAttachmentListApprovalStatus.do?answer(AttachmentKey)=MainPageAttachmentId',{synchronous:true, parameters:$(document.getElementById("AttachmentListMainFrmId")).serialize(this), onComplete:function(){refereshMultiAttachmentList(objectId,ownerId,objectType);obj.value=''},onException:function(){}});
	}else {
	return false;
	}
}

function notesStatusChangeMain(objectId,ownerId,objectType,obj){
var check = false;
check= countAllCheckedNotes(obj);
if(check) {
	var ans = window.confirm('Are you sure, you want to update the status for all the selected Notes?');
}
if(!check) {
	     alert("No Notes are selected");
	     obj.value='';
}
if(ans) {
new Ajax.Updater('','../UpdateNotesListApproval.do?answer(NotesKey)=MainPageNotesId',{synchronous:true, parameters:$(document.getElementById("NotesListMainFrm")).serialize(this), onComplete:function(){refereshMultiNotesList(objectId,ownerId,objectType);obj.value='';},onException:function(){}});
}else {
return false;
}
}

function showSubjectivityNotes(objectId,objectVerId,objectType) {
	//alert(objectId);alert(objectVerId);alert(objectType);
	var url = "/notes/SubjectivityNotesDetail.jsp";
	document.getElementById("AddNotespopup").innerHTML="";
	new Ajax.Updater('AddNotespopup',url,{synchronous:true, parameters:'', onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("AddNotespopup").innerHTML);showSubjectivityNotesBody(objectId,objectVerId,objectType);},onException:function(){}});			
	
}

function showSubjectivityNotesBody (objectId,objectVerId,objectType) {
var myConfig = {
        height: '110px',
        width: '580px', 
        dompath: true,
        focusAtStart: true
    };

    YAHOO.log('Create the Editor..', 'info', 'example');
    myEditor = new YAHOO.widget.SimpleEditor('editor_notes', myConfig);
    myEditor._defaultToolbar.buttonType = 'advanced';    
    myEditor.render(); 
	document.getElementById("AddNotespopup").style.display = 'inline';	
	YAHOO.example.container.AddNotespopup.show();
	document.SubjectivityNotesForm.objectType.value=objectType;
	document.SubjectivityNotesForm.objectId.value=objectId;
	document.SubjectivityNotesForm.objectVerId.value=objectVerId;
}

function saveSubjectivityNotes(){
		var Description = encodeURIComponent(document.SubjectivityNotesForm.notesDesc.value);
		var Private = "N";
		if(document.SubjectivityNotesForm.mprivate != null && document.SubjectivityNotesForm.mprivate != undefined) {
			Private = document.SubjectivityNotesForm.mprivate.value;
		}
  		var Notes = encodeURIComponent(myEditor.getEditorHTML());  		
  		var notesValidateFunction=notesValidate(Description,Notes);
  		
  		if(notesValidateFunction){
  			var ObjectType = document.SubjectivityNotesForm.objectType.value;
	  		var ObjectId = document.SubjectivityNotesForm.objectId.value;
	  		var ObjectVerId = document.SubjectivityNotesForm.objectVerId.value;
	  		var UserName = document.SubjectivityNotesForm.User.value; 
	  		var Active = document.SubjectivityNotesForm.Active.value; 
	  		var UserRole = document.SubjectivityNotesForm.UserRole.value;
	  		var OwnerId = document.SubjectivityNotesForm.ownerId.value;
	  		var pars='&answer(isUpdated)='+"Y"+'&answer(Object::Activity::CreatedBy)='+UserName+'&answer(Object::Activity::ObjectType)='+"Quote"+'&answer(Object::Activity::ActivityType)='+"Quote Management"+'&answer(Object::Notes::Description)='+Description+'&answer(Object::Notes::Private)='+Private+'&answer(Object::Notes::Notes)='+Notes+'&answer(Object::Notes::ObjectType)='+ObjectType+'&answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::ObjectVerId)='+ObjectVerId+'&answer(Object::Notes::UserName)='+UserName+'&answer(Object::Notes::Active)='+Active+'&answer(Object::Notes::UserRole)='+UserRole+'&answer(Object::Activity::OwnerId)='+OwnerId+'&answer(Object::Notes::OwnerId)='+OwnerId+'&approvalStatus=';	
	  		new Ajax.Updater({success: 'success'},'../AddNotes.do?',{method: 'post', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);hideSubjectivityNotes(ObjectId,OwnerId,ObjectType);}});		
  		}
}

function hideSubjectivityNotes(objectId,ownerId,objectType){	
	refereshMultiNotesList(objectId,ownerId,objectType);
	
	document.getElementById('AddNotespopup').style.display = 'none';
	YAHOO.example.container.AddNotespopup.hide();
	if(document.getElementById('text') != null && document.getElementById('text') != undefined) {
		document.getElementById('text').style.display = 'none';
	}
}

function deleteMainAttachment(objectId,objectVerId,objectType,ownerId){
var check = false;
check= countAllCheckedAttachments(obj);
if(check) {
	var ans = window.confirm('Are you sure, you want to delete all the selected Attachments ?');
}
if(!check) {
	     alert("No Attachments are selected");
	     obj.value='';
}

if (ans) {
	var parms = "answer(Object::AttachmentObjectLink::ObjectId)="+objectId+"&answer(Object::AttachmentObjectLink::ObjectVerId)="+objectVerId+"&answer(Object::AttachmentObjectLink::ObjectType)="+objectType+"&answer(AttachmentKey)=MainPageAttachmentId";
	new Ajax.Updater('','../DeleteAttachmentList.do?'+parms,{synchronous:true, parameters:$(document.getElementById("AttachmentListMainFrmId")).serialize(this), onComplete:function(){refereshMultiAttachmentList(objectId,ownerId,objectType);},onException:function(){}});
}else {
return false;
}
}

function deleteMainNotes(objectId,objectVerId,objectType,ownerId){
var check = false;
check= countAllCheckedNotes(obj);
if(check) {
	var ans = window.confirm('Are you sure, you want to delete all the selected Notes ?');
}
if(!check) {
	     alert("No Notes are selected");
	    
}

if(ans){
var parms = "answer(Object::Notes::ObjectId)="+objectId+"&answer(Object::Notes::ObjectVerId)="+objectVerId+"&answer(Object::Notes::ObjectType)="+objectType+"&answer(NotesKey)=MainPageNotesId";
new Ajax.Updater('','../DeleteNotesList.do?'+parms,{synchronous:true, parameters:$(document.getElementById("NotesListMainFrm")).serialize(this), onComplete:function(){refereshMultiNotesList(objectId,ownerId,objectType);},onException:function(){}});
}else {
return false;
}
}