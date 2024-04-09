
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
 

	<link rel="stylesheet" type="text/css"  id="container.css"  href="../Scripts/YUI/2.4.1/build/container/assets/container.css" />
	<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
	<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
	<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/treeview/treeview-min.js"></script>
 
 
<form name="Attachment" method="post" action="/AddAttachment.go" enctype="multipart/form-data" target="upload_target_iFrame"><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="255e108dc23f344a098d5240df192e51">	

  <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
  <bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
  	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
		<html:hidden property="answer(isAdded)" value="<%="Y"%>" />
 <bean:parameter id="objectId" name="answer(Object::Attachment::ObjectId)" />
  <bean:parameter id="objectVerId" name="answer(Object::Attachment::ObjectVerId)" />
 <bean:parameter id="objectType" name="answer(Object::AttachmentObjectLink::ObjectType)" />
<% 
 String approvalStatus = "";
 if(request.getParameter("answer(APPROVAL_STATUS_NEEDED)")!=null){
	 approvalStatus = request.getParameter("answer(APPROVAL_STATUS_NEEDED)");
 }
 %> 

<input type="hidden" name="answer(Object::Attachment::LocationType)" value="FOLDER" id="attachmentLocationType">
<input type="hidden" name="answer(Object::Attachment::Status)" value="UPLOADED" id="attachmentStatus">
<input type="hidden" name="answer(Object::AttachmentObjectLink::Active)" value="Y" id="attachmentObjectLinkActive">
<input type="hidden" name="answer(Object::Attachment::Active)" value="Y" id="attachmentActive">		
<input type ="hidden" name="answer(Object::Notes::ApprovalStatus)" value='<%= ""+approvalStatus%>'id="approvalStatus" />


<input type="hidden" id="ownerId" name="answer(Object::Owner::OwnerId)" value="<%=""+ownerId%>" >
<input type="hidden" id="userId" name="answer(Object::Activity::CreatedBy)" value="<%=""+userId%>" >
<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectType)" value="<%=""+objectType%>" id="objectType1">
<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectId)" value="<%=""+objectId%>" id="objectId" >
<input type="hidden" name="answer(Object::Attachment::ObjectId)" value="<%=""+objectId%>" id="objectId">
<input type="hidden" name="answer(Object::Attachment::ObjectVerId)" value="<%=""+objectVerId%>" id="objectVerId">
<input type="hidden" name="answer(Object::Attachment::ObjectType)" value="<%=""+objectType%>" >

<div id="dialog2" style='display: none;'>

<div class="hd">Attach File here</div>
<div class="bd">
<table cellpadding="1" cellspacing="0">
  	 <tr>
  	   <td> 
  	     <h6>Name:</h6>  
  	     
  	   </td>
       <td> 
         <input type='text' name='answer(Object::Attachment::Name)' maxlength='47' size='40' value='' id='attachmentName'>
        
     </tr>
  	 <tr>
  	 <td>
  	   <h6>Description:</h6>
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea name='answer(Object::Attachment::Description)' cols='50' rows='4' id='attachmentDesc'></textarea></div> 
  	</td>
  </tr>
<tr><td>
Select File:
</td>
<td>
<div id='uploader'>
</div>
</td>
</tr>

<tr>
  	<td>&nbsp;</td>
  	</tr>
  	<tr>
  	<td>&nbsp;</td>
  	<td align="center">
  		<html:button property="SaveAttachment" value="Save" styleClass="uibutton" styleId="saveAttachment" />
  		<html:button property="CancelAttachment" value="Cancel" styleClass="uibutton" styleId="cancelAttachment" />
  	</td>
  	</tr>
</table>
</div>
</div>


<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->
 <style>
		#container {height:15em;}
	</style>

	<div id="attachmenttree">
		<div id="attachmentstree"></div>
	</div>
	
<script>
YAHOO.namespace("example.container");
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
var myEditor;
var flag=0;

(function(){

	var init = function() {
	
		var browserName=navigator.appName;
		//create the TreeView instance:
		var tree = new YAHOO.widget.TreeView("attachmentstree");
		//get a reusable reference to the root node:
		var root = tree.getRoot();
		//First, create a parent node
		var  attachedDocs= new YAHOO.widget.HTMLNode("<html><head></head><body><table><tr><td>&nbsp;&nbsp;&nbsp;<a  href='javascript:void(0);' onclick='showList()'><img src='/Images/IconAttachment.gif' border='0' > <font color='blue'>Attached Files</font></a></td><td><div id='attachCount'> </div></td></tr></table>", root, false);
		//Now, apply the "icon-att" style to this node's label:
		//Child node of Attached Documents
		var AddAttachments = new YAHOO.widget.HTMLNode('<div id="add" style="display: none; return: false;"> &nbsp;&nbsp;   <a href="javascript:void(0);"> <img src="/Images/rtg_rate.gif" border="0" ></img><span onclick="showAdd()" id="show1"> Add </span></a></div>', root , false);
		
		var ViewAttachments = new YAHOO.widget.HTMLNode('<div id="Viewsuccess" style="display: block; return: false;"> </div>', root , false);
		
	
			 
	tree.draw();
	  var OwnerId = document.getElementById("ownerId").value;
	  var ObjectId = document.getElementById("objectId").value;
      var ObjectVerId = document.getElementById("objectVerId").value;
      var ObjectType = document.getElementById("objectType1").value;
	  var attachpars='ObjectId='+ObjectId+'&OwnerId='+OwnerId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType;
		
	var ajax = new Ajax.Updater({success: 'attachCount'},'../attachment/GetAttachCount.jsp',{method: 'post', parameters:attachpars, 
		onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("attachCount").innerHTML);}});		
	var Dom = YAHOO.util.Dom;
    var Event = YAHOO.util.Event;
	YAHOO.example.container.dialog2 = new YAHOO.widget.Dialog("dialog2", 
								{ width : "40em",
								  fixedbottom :false,
								  visible : false, 
								  constraintoviewport : true
							});
	
	YAHOO.example.container.dialog2.render();
	YAHOO.util.Event.addListener("show1", "click", YAHOO.example.container.dialog2.show, YAHOO.example.container.dialog2, true);
	   // <--- Add a event listener to our external link HERE 
    Event.on('cancelAttachment', 'click', function(e) { 
    	YAHOO.example.container.dialog2.cancel();
    	document.getElementById("dialog2").style.display = "none";
		})
	 Event.on('saveAttachment', 'click', function(e) { 
	    var attachmentValidate=validate();	
	 	 if(attachmentValidate==false){
	 	 	 refreshTree(); 
	 	 }else{	
    	 document.Attachment.submit();
  		refreshTree();
		YAHOO.example.container.dialog2.cancel();
		document.getElementById("dialog2").style.display = "none";
		 document.getElementById("add").style.display = 'none';
		  document.getElementById("Viewsuccess").style.display = 'none';
		  }
		})	
	 

   }
	//Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);
    
})();

</script>	
</form>
<script type="text/javascript">
 function showList(){
   if(document.getElementById("add").style.display == 'none'){
   
	    var AttachmentObjectType = document.getElementById("objectType1").value;
  		var AttachmentObjectId =  document.getElementById("objectId").value;
  		var AttachmentObjectVerId = document.getElementById("objectVerId").value;
  		var approvalStatus = document.getElementById("approvalStatus").value;
  		var OwnerId = document.getElementById("ownerId").value;
  		var pars = 'answer(Object::AttachmentObjectLink::ObjectType)='+AttachmentObjectType+'&answer(Object::AttachmentObjectLink::ObjectId)='+AttachmentObjectId+'&answer(Object::AttachmentObjectLink::ObjectVerId)='+AttachmentObjectVerId+'&answer(Object::Owner::OwnerId)='+OwnerId+'&approvalStatus='+approvalStatus;
  		var ajax = new Ajax.Updater({success: 'Viewsuccess'},'../ViewAttached.do?',{method: 'post', parameters:pars, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Viewsuccess").innerHTML);}});		
        
document.getElementById("add").style.display = 'block'
document.getElementById("Viewsuccess").style.display = 'block'
}	
    else if(document.getElementById("add").style.display == 'block'){
         
    document.getElementById("add").style.display = 'none';
    document.getElementById("Viewsuccess").style.display = 'none'
    
    }
    }
    
    function showAdd(){
    document.getElementById("dialog2").style.display = "block";	
    document.getElementById("attachmentName").value = "";
    document.getElementById("attachmentDesc").value = "";
     u = document.getElementById('uploader');
     u.innerHTML="<table><tr><td>&nbsp;&nbsp;&nbsp;</td></tr><tr><td><input type='file' name='myFile' maxlength='127' size='43' value='' id='myFile' onchange=validateFileType('myFile')></td></tr><tr><td><div id='frame'style='display: none; return: false;'><iframe id='upload_target_iFrame' src='../common/MessageFromRule.jsp' name='upload_target_iFrame'   style='width:300px;height:30px;border:1px solid #ccc;' onload = 'refreshTree()' ></iframe></div></td></tr><tr><td></td></tr></table>";
    document.getElementById("upload_target_iFrame").value = "";
   
   
    
    }
    
    function showView(id1,img1) {
	if(document.getElementById(id1).style.display == 'none'){
	
		document.getElementById(id1).style.display = 'block';
		document.getElementById(img1).src='/Images/minus2.gif';
	
	}
	else {
	
   		document.getElementById(id1).style.display = 'none';
  		document.getElementById(img1).src='/Images/add_bttn.gif';
	
	}
}
function deleteAttachment(attachmentId){

var answer = confirm ("Are you Sure?");
if(answer){

     var OwnerId = document.getElementById("ownerId").value;
     var ObjectId = document.getElementById("objectId").value;
     var ObjectVerId = document.getElementById("objectVerId").value;
     var ObjectType = document.getElementById("objectType1").value;
     var approvalStatus = document.getElementById("approvalStatus").value;
	 var userId =  document.getElementById("userId").value;
var pars='answer(Object::Activity::CreatedBy)='+userId+'&answer(AttachmentId)='+attachmentId+'&answer(Object::Activity::OwnerId)='+OwnerId+'&answer(Object::Owner::OwnerId)='+OwnerId+'&answer(Object::AttachmentObjectLink::ObjectId)='+ObjectId+'&answer(Object::AttachmentObjectLink::ObjectVerId)='+ObjectVerId+'&answer(Object::AttachmentObjectLink::ObjectType)='+ObjectType+'&approvalStatus='+approvalStatus;

var ajax = new Ajax.Updater({success: 'ViewSuccess'},'../DeleteAttachment.do?',{method: 'get', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("ViewSuccess").innerHTML);updateAttachCountDiv();}});

}
}
/**
 * To update the Approval Status
 * @newly added by Guru
 */
function updateApprovalStatus(attachmentId,obj){
	var data = obj.value;
	var status ='';
	if(data == 'Accepted'){
		status = 'Accept';
	}else if(data == 'Rejected') {
		status = 'Reject';
	}
	var answer = confirm('Are you sure you want to '+status+' the Attachment' );
	
	if(answer){
		var OwnerId = document.getElementById("ownerId").value;
		var ObjectId = document.getElementById("objectId").value;
   		var ObjectVerId = document.getElementById("objectVerId").value;
	    var ObjectType = document.getElementById("objectType1").value;
	    var approvalStatus = document.getElementById("approvalStatus").value;
	    var  userId =  document.getElementById("userId").value;
		var pars='answer(Object::Activity::CreatedBy)='+userId+'&answer(Object::Attachment::ApprovalStatus)='+data+'&answer(AttachmentId)='+attachmentId+'&answer(Object::Activity::OwnerId)='+OwnerId+'&answer(Object::Owner::OwnerId)='+OwnerId+'&answer(Object::AttachmentObjectLink::ObjectId)='+ObjectId+'&answer(Object::AttachmentObjectLink::ObjectVerId)='+ObjectVerId+'&answer(Object::AttachmentObjectLink::ObjectType)='+ObjectType+'&approvalStatus='+approvalStatus;
		var ajax = new Ajax.Updater({success: 'ViewSuccess'},'/UpdateAttachmentApprovalStatus.do?',{method: 'get', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("ViewSuccess").innerHTML);updateAttachCountDiv();}});
	}

}


 function submitForm(){
 
  document.Attachment.submit();
  refreshTree();
  
 }
</script>
</head>
<script>

function refreshTree(){

if(flag == 0){

updateAttachCount();
}
else{

}
}
function updateAttachCount(){
 
    var OwnerId = document.getElementById("ownerId").value;
	  var ObjectId = document.getElementById("objectId").value;
      var ObjectVerId = document.getElementById("objectVerId").value;
      var ObjectType = document.getElementById("objectType1").value;
	  var attachpars='ObjectId='+ObjectId+'&OwnerId='+OwnerId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType;
  var ajax = new Ajax.Updater({success: 'attachCount'},'../attachment/GetAttachCount.jsp',{method: 'post', parameters:attachpars, onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("attachCount").innerHTML);}});		
 
}
function updateAttachCountDiv(){
 
	  var OwnerId = document.getElementById("ownerId").value;
	  var ObjectId = document.getElementById("objectId").value;
      var ObjectVerId = document.getElementById("objectVerId").value;
      var ObjectType = document.getElementById("objectType1").value;
       var approvalStatus = document.getElementById("approvalStatus").value;
	  var attachpars='ObjectId='+ObjectId+'&OwnerId='+OwnerId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType+'&approvalStatus='+approvalStatus;
	  var ajax = new Ajax.Updater({success: 'attachCount'},'../attachment/GetAttachCount.jsp',{method: 'post', parameters:attachpars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("attachCount").innerHTML);}});		
      var AttachmentObjectType = document.getElementById("objectType1").value;
	  var AttachmentObjectId =  document.getElementById("objectId").value;
	  var OwnerId = document.getElementById("ownerId").value;
	  var pars = 'answer(Object::AttachmentObjectLink::ObjectType)='+AttachmentObjectType+'&answer(Object::AttachmentObjectLink::ObjectId)='+AttachmentObjectId+'&answer(Object::AttachmentObjectLink::ObjectVerId)='+ObjectVerId+'&answer(Object::Owner::OwnerId)='+OwnerId+'&approvalStatus='+approvalStatus;
	  var ajax = new Ajax.Updater({success: 'Viewsuccess'},'../ViewAttached.do?',{method: 'post', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Viewsuccess").innerHTML);}});		
	        
}

function validate(){
		if (document.getElementById("attachmentName").value ==""){
			alert("Attachment Name is empty");
			return false;
	    }	
	    if (document.getElementById("attachmentDesc").value ==""){
			alert("Attachment Description is empty");
			return false;
	    }	
	    if (document.getElementById("myFile").value ==""){
			alert("File has not been Attached Yet !!!");
			return false;
	    }	
}


</script>
