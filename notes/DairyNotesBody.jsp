
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<link rel="stylesheet" type="text/css"  id="container.css"  href="../Scripts/YUI/2.4.1/build/container/assets/container.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/button/assets/skins/sam/button.css" />


<link rel="stylesheet" type="text/css" href="../styles/tree.css" />
<link rel="stylesheet" type="text/css" href="../styles/style.css" />

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/treeview/assets/treeview.css" />



 
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>

<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>

<script type="text/javascript" id="prototype" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/menu/menu-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/event/event-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/treeview/treeview-min.js"></script>



<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>


<script>

	function changevalue() {
		if(document.getElementById("mprivate").value == 'N'){
		document.getElementById("mprivate").value = 'Y';

		}
		else{
			document.getElementById("mprivate").value = 'N';

		}
	}
	function showSubNodes(div,id){
 
		if(document.getElementById(div).style.display == 'none'){

			var Description = encodeURIComponent(document.getElementById("notesDesc").value);
	  		var Private = document.getElementById("mprivate").value;
	  		var ObjectType = document.getElementById("objectType").value;
	  		var ObjectId = document.getElementById("objectId").value;
	  		var ObjectVerId = document.getElementById("objectVerId").value;
	  		var UserName = document.getElementById("User").value; 
	  		var Active = document.getElementById("Active").value; 
	  		var UserRole = document.getElementById("UserRole").value;
	  		var OwnerId = document.getElementById("ownerId").value;
	  		var approvalStatus = document.getElementById("approvalStatus").value;
	  		var pars='ObjectType='+ObjectType+'&ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&OwnerId='+OwnerId+'&RoleId='+UserRole+'&approvalStatus='+approvalStatus;
	
			var ajax = new Ajax.Updater({success: 'success'},'../notes/AddNotes.jsp',{method:'post',parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);}});	
			document.getElementById(div).style.display = 'block';
			document.getElementById(id).style.display = 'block';
			var pars1='ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType+'&OwnerId='+OwnerId;
			var ajax = new Ajax.Updater({success: 'count'},'../notes/GetNotesCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("count").innerHTML);}});		
			
			
		}

		else if(document.getElementById(div).style.display == 'block'){
			var ObjectId = document.getElementById("objectId").value;
			var ObjectVerId = document.getElementById("objectVerId").value;
			var ObjectType = document.getElementById("objectType").value;
	  		var OwnerId = document.getElementById("ownerId").value;
	  		var pars1='ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType+'&OwnerId='+OwnerId;
			var ajax = new Ajax.Updater({success: 'count'},'../notes/GetNotesCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("count").innerHTML);}});		
			document.getElementById(div).style.display = 'none';
			document.getElementById(id).style.display = 'none';
			
		}
	}

	function showsub(){

		var a=document.getElementById("text").style.display = "block";
       
	}

	function reportError(){
		alert("error");
	}
</script>

</head>

<body class=" yui-skin-sam">

<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->

<style>
		#container {height:15em;}
	</style>
<div id="notesTree">
<div id="notesTreeDiv"> </div>




<script>
YAHOO.namespace("example.container");
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
var myEditor;

(function(){

	var init = function() {
		
		var browserName=navigator.appName;
		//create the TreeView instance:
		var tree = new YAHOO.widget.TreeView("notesTreeDiv");
		//get a reusable reference to the root node:
		var root = tree.getRoot();
		//First, create a parent node
			var DairyNotes = new YAHOO.widget.HTMLNode('<html><head></head><body><table><tr><td>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick=showSubNodes("div","success"); ><img src="/Images/notep_16.gif" border="0"> <font color="blue"> Diary Notes</font></a></td><td><div id="count"> </div></td></tr></table>', root, false);
			//DairyNotes.labelStyle = "icon-prv";
			
			var AddNotes = new YAHOO.widget.HTMLNode('<div id="div" style="display: none; return: false;"> &nbsp;&nbsp;   <a href="javascript:void(0);"> <img src="/Images/rtg_rate.gif" border="0" ></img><span onclick="showsub()" id="show"> Add Notes</span></a></div>', root , false);
		
		    var ViewNotes = new YAHOO.widget.HTMLNode('<div id="success" style="display: block; return: false;"> </div>', root , false);
		
	if (browserName=="Microsoft Internet Explorer"){
  		document.getElementById("text").style.display = 'none';	
 	}	
		
		 document.getElementById("dialog1").style.display = "block";	
	tree.draw();
	YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("dialog1", 
								{ width : "51em",
									height : "27em",
								  fixedbottom :false,
								  visible : false, 
								  constraintoviewport : true
							});
	
	YAHOO.example.container.dialog1.render();
	
	 
	YAHOO.util.Event.addListener("show", "click", YAHOO.example.container.dialog1.show, YAHOO.example.container.dialog1, true);
	    var ObjectId = document.getElementById("objectId").value;
	    var ObjectVerId = document.getElementById("objectVerId").value;
	    var ObjectType = document.getElementById("objectType").value;
  		var OwnerId = document.getElementById("ownerId").value;
  		var pars1='ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType+'&OwnerId='+OwnerId;
		
			var ajax = new Ajax.Updater({success: 'count'},'../notes/GetNotesCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("count").innerHTML);}});		
			
     var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;
    
    var myConfig = {
        height: '110px',
        width: '580px', 
        dompath: true,
        focusAtStart: true
    };

    YAHOO.log('Create the Editor..', 'info', 'example');
    var myEditor = new YAHOO.widget.SimpleEditor('editor', myConfig);
    myEditor._defaultToolbar.buttonType = 'advanced';    
    myEditor.render();

	  // <--- Add a event listener to our external link HERE 
    Event.on('cancel', 'click', function(e) { 
    	YAHOO.example.container.dialog1.cancel();
        document.getElementById("text").style.display = 'none';
		document.getElementById("notesDesc").value="";
		myEditor.setEditorHTML(""); 
		})
	 Event.on('save', 'click', function(e) {
    	 myEditor.saveHTML();
  		var Description = encodeURIComponent(document.getElementById("notesDesc").value);
  		var Private = document.getElementById("mprivate").value;
  		var Notes = encodeURIComponent(myEditor.get('textarea').value);
  		var notesValidateFunction=notesValidate(Description,Notes);
  		if(notesValidateFunction==false){
  			refreshTree();
  		}else{
  		var ObjectType = document.getElementById("objectType").value;
  		var ObjectId = document.getElementById("objectId").value;
  		var ObjectVerId = document.getElementById("objectVerId").value;
  		var UserName = document.getElementById("User").value; 
  		var Active = document.getElementById("Active").value; 
  		var UserRole = document.getElementById("UserRole").value;
  		var OwnerId = document.getElementById("ownerId").value;
  		var approvalStatus = document.getElementById("approvalStatus").value;
  		var pars='&answer(isUpdated)='+"Y"+'&answer(Object::Activity::CreatedBy)='+UserName+'&answer(Object::Activity::ObjectType)='+"Quote"+'&answer(Object::Activity::ActivityType)='+"Quote Management"+'&answer(Object::Notes::Description)='+Description+'&answer(Object::Notes::Private)='+Private+'&answer(Object::Notes::Notes)='+Notes+'&answer(Object::Notes::ObjectType)='+ObjectType+'&answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::ObjectVerId)='+ObjectVerId+'&answer(Object::Notes::UserName)='+UserName+'&answer(Object::Notes::Active)='+Active+'&answer(Object::Notes::UserRole)='+UserRole+'&answer(Object::Activity::OwnerId)='+OwnerId+'&answer(Object::Notes::OwnerId)='+OwnerId+'&approvalStatus='+approvalStatus;	
		var ajax = new Ajax.Updater({success: 'success'},'../AddNotes.do?',{method: 'post', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);updateNotesCount();}});		
		
		YAHOO.example.container.dialog1.cancel();

		document.getElementById("text").style.display = 'none';
		document.getElementById("notesDesc").value="";
		myEditor.setEditorHTML(""); 
	    document.getElementById("div").style.display = 'none';
	    document.getElementById("success").style.display = 'none'; // clear the content back to the textarea 
		}})	
   }
	//Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);
    
})();



	
function showNotes(id1,img1) {
	if(document.getElementById(id1).style.display == 'none'){
	
		document.getElementById(id1).style.display = 'block';
		document.getElementById(img1).src='/Images/minus2.gif';
	
	}
	else {
	
   		document.getElementById(id1).style.display = 'none';
  		document.getElementById(img1).src='/Images/add_bttn.gif';
	
	}
}


function deleteNotes(notesId){

var answer = confirm ("Are you Sure?");
if(answer){
var ObjectId = document.getElementById("objectId").value;
var ObjectVerId = document.getElementById("objectVerId").value;
var ObjectType = document.getElementById("objectType").value;
var OwnerId = document.getElementById("ownerId").value;
var approvalStatus = document.getElementById("approvalStatus").value;
var UserName = document.getElementById("User").value; 
  	
var pars='answer(Object::Activity::CreatedBy)='+UserName+'&answer(Object::Activity::ObjectType)='+"Quote"+'&answer(Object::Activity::OwnerId)='+OwnerId+'&answer(isUpdated)='+"N"+'&answer(Object::Activity::ActivityType)='+"Quote Management"+'&answer(NotesId)='+notesId+'&answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::ObjectVerId)='+ObjectVerId+'&answer(Object::Notes::ObjectType)='+ObjectType+'&answer(Object::Notes::OwnerId)='+OwnerId+'&approvalStatus='+approvalStatus;

var ajax = new Ajax.Updater({success: 'success2'},'../DeleteNotes.do?',{method: 'get', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success2").innerHTML);updateNotesList();}});

}

}


/**
 * To update the Approval Status
 * @newly added by gnanaguru_g@solartis.net
 */
function updateNotesApprovalStatus(notesId,obj){
	var data = obj.value;
	var status ='';
	if(data == 'Accepted'){
		status = 'Accept';
	}else if(data == 'Rejected') {
		status = 'Reject';
	}
	var answer = confirm('Are you sure you want to '+status+' the Notes' );
	
	if(answer){
		var ObjectId = document.getElementById("objectId").value;
		var ObjectVerId = document.getElementById("objectVerId").value;
		var ObjectType = document.getElementById("objectType").value;
		var OwnerId = document.getElementById("ownerId").value;
		var approvalStatus = document.getElementById("approvalStatus").value;
		var  UserName = document.getElementById("User").value; 
		var pars='answer(Object::Activity::CreatedBy)='+UserName+'&answer(Object::Notes::ApprovalStatus)='+data+'&answer(NotesId)='+notesId+'&answer(Object::Activity::OwnerId)='+OwnerId+'&answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::ObjectVerId)='+ObjectVerId+'&answer(Object::Notes::ObjectType)='+ObjectType+'&answer(Object::Notes::OwnerId)='+OwnerId+'&approvalStatus='+approvalStatus;
		var ajax = new Ajax.Updater({success: 'ViewSuccess'},'/UpdateNotesApproval.do?',{method: 'get', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("ViewSuccess").innerHTML);updateAttachCountDiv();}});
	}

}

function updateDiv(){
var ObjectId = document.getElementById("objectId").value;
var ObjectVerId = document.getElementById("objectVerId").value;
var ObjectType = document.getElementById("objectType").value;
var OwnerId = document.getElementById("ownerId").value;
var pars='answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::ObjectVerId)='+ObjectVerId+'&answer(Object::Notes::ObjectType)='+ObjectType+'&answer(Object::Notes::OwnerId)='+OwnerId;
var ajax = new Ajax.Updater({success: 'success'},'../ViewNotes.do?',{method:'post',parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);}});	
}
 function updateNotesCount(){

 var ObjectId = document.getElementById("objectId").value;
 var ObjectVerId = document.getElementById("objectVerId").value;
 var ObjectType = document.getElementById("objectType").value;
 var OwnerId = document.getElementById("ownerId").value;
 var pars1='ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType+'&OwnerId='+OwnerId;
 var ajax = new Ajax.Updater({success: 'count'},'../notes/GetNotesCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("count").innerHTML);}});		
			
 }
 function updateNotesList(){

			 var ObjectId = document.getElementById("objectId").value;
			 var ObjectVerId = document.getElementById("objectVerId").value;
             var ObjectType = document.getElementById("objectType").value;
			 var OwnerId = document.getElementById("ownerId").value;
			 var pars1='ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType+'&OwnerId='+OwnerId;
			 var ajax = new Ajax.Updater({success: 'count'},'../notes/GetNotesCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("count").innerHTML);}});		
			 var Description = encodeURIComponent(document.getElementById("notesDesc").value);
            var Private = document.getElementById("mprivate").value;
	  		var ObjectType = document.getElementById("objectType").value;
	  		var ObjectId = document.getElementById("objectId").value;
	  		var ObjectVerId = document.getElementById("objectVerId").value;
	  		var UserName = document.getElementById("User").value; 
	  		var Active = document.getElementById("Active").value; 
	  		var UserRole = document.getElementById("UserRole").value;
	  		var OwnerId = document.getElementById("ownerId").value;
	  		var approvalStatus = document.getElementById("approvalStatus").value;
	  		var pars='ObjectType='+ObjectType+'&ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&OwnerId='+OwnerId+'&RoleId='+UserRole+'&approvalStatus='+approvalStatus;
	
			var ajax = new Ajax.Updater({success: 'success'},'../notes/AddNotes.jsp',{method:'post',parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);}});		
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
	   
}
 
 
 function refreshNotesTree(){
 var flag=0;
 if(flag == 0){

updateNotesCount();
}
 }
</script>



<!--END SOURCE CODE FOR EXAMPLE =============================== -->

<bean:define id="roleId" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:parameter id="userName" name="answer(Object::Notes::UserName)" />
<bean:parameter id="objectId" name="answer(Object::Notes::ObjectId)" />
<bean:parameter id="objectVerId" name="answer(Object::Notes::ObjectVerId)" />
<bean:parameter id="objectType" name="answer(Object::Notes::ObjectType)" />

<% 
 String y = "Y";
 String approvalStatus = "";
 if(request.getParameter("answer(APPROVAL_STATUS_NEEDED)")!=null){
	 approvalStatus = request.getParameter("answer(APPROVAL_STATUS_NEEDED)");
 }
 %>

<input type =hidden name="answer(Object::Notes::ObjectType)" value='<%= ""+objectType%>' id="objectType"/> 	
<input type =hidden name="answer(Object::Notes::ObjectId)" value='<%= ""+objectId%>'id="objectId"/> 	
<input type =hidden name="answer(Object::Notes::ObjectVerId)" value='<%= ""+objectVerId%>' id="objectVerId"/> 	
<input type = hidden name="answer(Object::Notes::UserName)" value='<%= ""+userName%>'id="User" /> 	
<input type =hidden name="answer(Object::Notes::Active)" value='<%=""+y%>' id="Active" /> 	
<input type = hidden name="answer(Object::Notes::UserRole)" value='<%= ""+roleId%>'id="UserRole" /> 	
<input type = hidden name="answer(Object::Notes::OwnerId)" value='<%= ""+ownerId%>'id="ownerId" /> 	
<input type = hidden name="answer(Object::Notes::ApprovalStatus)" value='<%= ""+approvalStatus%>'id="approvalStatus" />
<div id="success2" style="display: none; return: false;"></div>


</body>
</html>

