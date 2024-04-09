
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html>
<head>

<body>
 <style type="text/css">
	/*margin and padding on body element
	  can introduce errors in determining
	  element position and are not recommended;
	  we turn them off as a foundation for YUI
	  CSS treatments. */
	body {
		margin:0;
		padding:0;
	}
	</style>
	
	
  
 <style>
		#example {height:30em;}
		label { display:block;float:left;width:45%;clear:left; }
		.clear { clear:both; }
		#resp { margin:10px;padding:5px;border:1px solid #ccc;background:#fff;}
		#resp li { font-family:monospace }
	</style>

    <link rel="stylesheet" type="text/css" href="/styles/tree.css" />

	<link rel="stylesheet" type="text/css" href="/styles/treeview.css" />
	<link rel="stylesheet" type="text/css" href="/styles/fonts-min.css" />

	<script type="text/javascript" src="/JavaScripts/yahoo-min.js"></script>
	<script type="text/javascript" src="/JavaScripts/prototype.js"></script>
	<script type="text/javascript" src="/JavaScripts/event-min.js"></script>
	<script type="text/javascript" src="/JavaScripts/treeview-min.js"></script>

	
<!--Additional custom style rules for this example:-->
 <style type="text/css">
    	#treewrapper {background: #fff; position:relative;}
		#treediv {position:relative; width:350px; background: #fff; padding:1em;}
	    .icon-upd { display:block; height: 22px; padding-left: 20px; background: transparent url(/Images/upload.gif) 0 0px no-repeat; }
    	.icon-att { display:block; height: 22px; padding-left: 20px; background: transparent url(/Images/attachment.gif) 0 0px no-repeat; }
	    .icon-alt { display:block; height: 22px; padding-left: 20px; background: transparent url(/Images/alreadyAttached.gif) 0 0px no-repeat; }
	    .htmlnodelabel { margin-left: 20px; }
	</style>

<!--end custom header content for this example-->

  
 <bean:parameter id="objectId" name="answer(Object::Attachment::ObjectId)" />
<form name="Attachment" method="post" action="/AddAttachment.go" enctype="multipart/form-data" target="upload_target_iFrame"><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="255e108dc23f344a098d5240df192e51">	

 

<input type="hidden" name="answer(Object::Attachment::ObjectType)" value="FILE" id="attachmentObjectType">
<input type="hidden" name="answer(Object::Attachment::LocationType)" value="FOLDER" id="attachmentLocationType">
<input type="hidden" name="answer(Object::Attachment::Status)" value="UPLOADED" id="attachmentStatus">
<input type="hidden" name="answer(Object::AttachmentObjectLink::Active)" value="Y" id="attachmentObjectLinkActive">
<input type="hidden" name="answer(Object::Attachment::Active)" value="Y" id="attachmentActive">		



<input type="hidden" name="answer(Object::Owner::OwnerId)" value="5" id="ownerId">
<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectType)" value="RISK" id="objType">

<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectId)" value='<%=""+objectId%>' id="objId">

<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->
 <style>
		#container {height:15em;}
	</style>

	<div id="tree">
		<div id="tree"></div>
	</div>
	
<script>
var flag=0;
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
	(function(){
		var init = function() {
		
		//create the TreeView instance:
		var tree = new YAHOO.widget.TreeView("tree");
	
		//get a reusable reference to the root node:
		var root = tree.getRoot();
		
		//parent node of the Tree
		var  attachedDocs= new YAHOO.widget.HTMLNode("<html><head></head><body><table><tr><td><a  href='javascript:void(0);' onclick='showList()'><img src='/Images/IconAttachment.gif' border='0' > <font color='blue'>Attached Documents</font></a></td><td><div id='attachCount'> </div></td></tr></table>", root, false);
		//Now, apply the "icon-att" style to this node's label:
		//Child node of Attached Documents
		var Addattachment = new YAHOO.widget.HTMLNode("<div id='add' style='display: none; return: false;'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0);' onclick=showAdd() ><img src='/Images/rtg_rate.gif' border='0' >Add</a></div> <div id='attachmentForm' style='display: none; return: false;'><table cellpadding='1' cellspacing='1'><tr><td>Name:</td><td><input type='text' name='answer(Object::Attachment::Name)' maxlength='42' size='40' value='' id='attachmentName'></td></tr><tr><td>Description:</td><td><textarea name='answer(Object::Attachment::Description)' cols='50' rows='4' id='attachmentDesc'></textarea></td></tr><tr><td>Select File</td><td><div id='uploader'><input type='file' name='myFile' maxlength='127' size='43' value='' id='myFile'><input type='submit' value='Submit'></td></tr><tr><td></div></td></tr></table></div>", root , false);
		
		var Viewattachment = new YAHOO.widget.HTMLNode("<div id='Viewsuccess' style='display: none; return: false;'> </div>", root , false);
		tree.draw();
		 var ObjectId = document.getElementById("objId").value;
  		var OwnerId = document.getElementById("ownerId").value;
  		var attachpars='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
		
			var ajax = new Ajax.Updater({success: 'attachCount'},'../attachment/GetAttachCount.jsp',{method: 'post', parameters:attachpars},onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("attachCount").innerHTML);});		
			
		
		}
	//Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);
	})();
	
	
	

   
    
</script>	
</form>
<script type="text/javascript">
 function showList(){
   if(document.getElementById("add").style.display == 'none'){
   
	    var AttachmentObjectType = document.getElementById("objType").value;
  		var   AttachmentObjectId =  document.getElementById("objId").value;
  		
  		var OwnerId = document.getElementById("ownerId").value;
  		var pars = 'answer(Object::AttachmentObjectLink::ObjectType)='+AttachmentObjectType+'&answer(Object::AttachmentObjectLink::ObjectId)='+AttachmentObjectId+'&answer(Object::Owner::OwnerId)='+OwnerId;
  		var ajax = new Ajax.Updater({success: 'Viewsuccess'},'../ViewAttached.do?',{method: 'post', parameters:pars},onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("Viewsuccess").innerHTML);});		
         var ObjectId = document.getElementById("objId").value;
  		var attachpars='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
		
			var ajax = new Ajax.Updater({success: 'attachCount'},'../attachment/GetAttachCount.jsp',{method: 'post', parameters:attachpars},onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("attachCount").innerHTML);});		
			

document.getElementById("add").style.display = 'block'
document.getElementById("Viewsuccess").style.display = 'block'
}	
    else if(document.getElementById("add").style.display == 'block'){
     
     var OwnerId = document.getElementById("ownerId").value;
     var ObjectId = document.getElementById("objId").value;
  	 var attachpars='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
		
	 var ajax = new Ajax.Updater({success: 'attachCount'},'../attachment/GetAttachCount.jsp',{method: 'post', parameters:attachpars},onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("attachCount").innerHTML);});		
			
    
    document.getElementById("add").style.display = 'none';
    document.getElementById("Viewsuccess").style.display = 'none'
    document.getElementById("attachmentForm").style.display = 'none';
    }
    }
    
    function showAdd(){
    if(document.getElementById("attachmentForm").style.display == 'none'){
    document.getElementById("attachmentName").value = "";
    document.getElementById("attachmentDesc").value = "";
     u = document.getElementById('uploader');
     u.innerHTML="<input type='file' name='myFile' maxlength='127' size='43' value='' id='myFile'><input type='submit' value='Submit'></td></tr>&nbsp;<tr><td><iframe id='upload_target_iFrame' name='upload_target_iFrame'   style='width:300px;height:30px;border:1px solid #ccc;' onload = 'refreshTree()' ></iframe>";
    document.getElementById("upload_target_iFrame").value = "";
    document.getElementById("attachmentForm").style.display = 'block'
    }
    else{
    document.getElementById("attachmentForm").style.display = 'none';
    }
    
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
     var ObjectId = document.getElementById("objId").value;

var pars='answer(AttachmentId)='+attachmentId+'&answer(Object::Owner::OwnerId)='+OwnerId+'&answer(Object::AttachmentObjectLink::ObjectId)='+ObjectId;

var ajax = new Ajax.Updater({success: 'success'},'../DeleteAttachment.do?',{method: 'get', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);},onFailure: function(transport){alert("Not Added");}});

}


}

</script>
</head>
<script>

function refreshTree(){

if(flag == 0){

flag=1;
}
else{

}
}
</script>
</body>

</html>
