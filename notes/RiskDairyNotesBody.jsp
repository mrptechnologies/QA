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
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Using TreeView with Custom Icons</title>



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

<% String objType = "Risk"; %>


<style>
#example {height:30em;}
label { display:block;float:left;width:45%;clear:left; }
.clear { clear:both; }
#resp { margin:10px;padding:5px;border:1px solid #ccc;background:#fff;}
#resp li { font-family:monospace }
</style>
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/container/assets/container.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/menu/assets/skins/sam/menu.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />


<link rel="stylesheet" type="text/css" href="../styles/tree.css" />

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/treeview/assets/treeview.css" />



<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>

<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/menu/menu-min.js"></script>

<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo/yahoo-min.js"></script>

<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/event/event-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/treeview/treeview-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/editor/simpleeditor-beta-min.js"></script>
<!--Additional custom style rules for this example:-->
<style type="text/css">
    #treewrapper {background: #fff; position:relative;}
	#treediv {position:relative; width:350px; background: #fff; padding:1em;}
    .icon-ppt { display:block; height: 22px; padding-left: 20px; background: transparent url(browse_space.gif) 0 0px no-repeat; }
    .icon-dmg { display:block; height: 22px; padding-left: 20px; background: transparent url(notep_16.gif) 0 0px no-repeat; }
    .icon-prv { display:block; height: 22px; padding-left: 20px; background: transparent url(/Images/notep_16.gif) 0 0px no-repeat; }
    .htmlnodelabel { margin-left: 20px; }
</style>

<!--end custom header content for this example-->

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
  		
  		var ObjectType = document.getElementById("objType").value;
  		var ObjectId = document.getElementById("objId").value;
  		var ObjectVerId = document.getElementById("objVerId").value;
  		var UserName = document.getElementById("User").value; 
  		var Active = document.getElementById("Active").value; 
  		var UserRole = document.getElementById("UserRole").value;
  		var OwnerId = document.getElementById("ownerId").value;
  		var pars='ObjectType='+ObjectType+'&ObjectId='+ObjectId+'&OwnerId='+OwnerId+'&RoleId='+UserRole;


var ajax = new Ajax.Updater({success: 'success'},'../notes/AddNotes.jsp',{method:'post',parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);}});	
document.getElementById(div).style.display = 'block';
document.getElementById(id).style.display = 'block';
var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
		
			var ajax = new Ajax.Updater({success: 'count'},'../notes/GetNotesCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("count").innerHTML);}});		
				var ajax = new Ajax.Updater({success: 'success1'},'../notes/NotesAdd.jsp',{method: 'post',onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success1").innerHTML);}});		
			document.getElementById("success1").style.display = 'block';
}

else if(document.getElementById(div).style.display == 'block'){
var ObjectId = document.getElementById("objId").value;
  		var OwnerId = document.getElementById("ownerId").value;
  		var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
		
			var ajax = new Ajax.Updater({success: 'count'},'../notes/GetNotesCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("count").innerHTML);}});		
			
document.getElementById(div).style.display = 'none';
document.getElementById(id).style.display = 'none';
document.getElementById("success1").style.display = 'none';
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
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<bean:parameter id="objId" name="answer(Object::Notes::ObjectId)" />




<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->

<style>
		#container {height:15em;}
	</style>
<div id="treewrapper">
<div id="treediv"> </div>
</div>



<script>
YAHOO.namespace("example.container");
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
var myEditor;

(function(){

	var init = function() {
		var handleSubmit = function() {
        myEditor.saveHTML();
  		var Description = encodeURIComponent(document.getElementById("notesDesc").value);
  		var Private = document.getElementById("mprivate").value;
  		var Notes = encodeURIComponent(myEditor.get('textarea').value);
  		
  		var ObjectType = document.getElementById("objType").value;
  		var ObjectId = document.getElementById("objId").value;
  		var ObjectVerId = document.getElementById("objVerId").value;
  		var UserName = document.getElementById("User").value; 
  		var Active = document.getElementById("Active").value; 
  		var UserRole = document.getElementById("UserRole").value;
  		var OwnerId = document.getElementById("ownerId").value;
  		var pars='answer(Object::Notes::Description)='+Description+'&answer(Object::Notes::Private)='+Private+'&answer(Object::Notes::Notes)='+Notes+'&answer(Object::Notes::ObjectType)='+ObjectType+'&answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::ObjectVerId)='+ObjectVerId+'&answer(Object::Notes::UserName)='+UserName+'&answer(Object::Notes::Active)='+Active+'&answer(Object::Notes::UserRole)='+UserRole+'&answer(Object::Notes::OwnerId)='+OwnerId;
			
			
			var ajax = new Ajax.Updater({success: 'success1'},'../AddNotes.do?',{method: 'post', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success1").innerHTML);}});		
			
			
			
			this.cancel();
			document.getElementById("text").style.display = 'none';
			document.getElementById("notesDesc").value="";
			
			myEditor.setEditorHTML(""); 
			
			};
	        var handleCancel = function() {
	         
				//window.location.reload(true);
				this.cancel();
				document.getElementById("text").style.display = 'none';
				
				document.getElementById("notesDesc").value="";
			   
			     myEditor.setEditorHTML(""); 
			 
	};
		var browserName=navigator.appName;
			
		//create the TreeView instance:
		var tree = new YAHOO.widget.TreeView("treediv");
		//get a reusable reference to the root node:
		var root = tree.getRoot();
		//First, create a parent node
		
			var DairyNotes = new YAHOO.widget.HTMLNode('<html><head></head><body><table><tr><td><a href="javascript:void(0);" onclick=showSubNodes("div","success"); ><img src="/Images/notep_16.gif" border="0"> <font color="blue"> Diary Notes</font></a></td><td><div id="count"> </div></td></tr></table>', root, false);
			//DairyNotes.labelStyle = "icon-prv";
			
			var AddNotes = new YAHOO.widget.HTMLNode('<div id="div" style="display: none; return: false;"> &nbsp;   <a href="javascript:void(0);"> <img src="/Images/rtg_rate.gif" border="0" ></img><span onclick="showsub()" id="show"> Add Notes</span></a></div>', root , false);
		
		    var ViewNotes = new YAHOO.widget.HTMLNode('<div id="success" style="display: block; return: false;"> </div>', root , false);
		
		if (browserName=="Microsoft Internet Explorer")
 {
  document.getElementById("text").style.display = 'none';	
 }	
		
			
		tree.draw();
	YAHOO.example.container.dialog1 = new YAHOO.widget.Dialog("dialog1", 
								{ width : "48em",
								  fixedcenter :false,
								  visible : false, 
								  constraintoviewport : true,
								  buttons : [ { text:"Save", handler:handleSubmit },
									      { text:"Cancel", handler:handleCancel } ]
							});
	
	YAHOO.example.container.dialog1.render();
	
	 
	YAHOO.util.Event.addListener("show", "click", YAHOO.example.container.dialog1.show, YAHOO.example.container.dialog1, true);
	    var ObjectId = document.getElementById("objId").value;
  		var OwnerId = document.getElementById("ownerId").value;
  		var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
		
			var ajax = new Ajax.Updater({success: 'count'},'../notes/GetNotesCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("count").innerHTML);}});		
			
     var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;
    
    var myConfig = {
        height: '180px',
        width: '530px',
        dompath: true,
        focusAtStart: true
    };

    YAHOO.log('Create the Editor..', 'info', 'example');
    var myEditor = new YAHOO.widget.SimpleEditor('editor', myConfig);
    myEditor._defaultToolbar.buttonType = 'advanced';    
    myEditor.render();

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
var ObjectId = document.getElementById("objId").value;
var OwnerId = document.getElementById("ownerId").value;

var pars='answer(NotesId)='+notesId+'&answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::OwnerId)='+OwnerId;

var ajax = new Ajax.Updater({success: 'success2'},'../DeleteNotes.do?',{method: 'get', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success2").innerHTML);}});

}

}
function updateDiv(){
var ObjectId = document.getElementById("objId").value;
var OwnerId = document.getElementById("ownerId").value;
var pars='answer(Object::Notes::ObjectId)='+ObjectId+'&answer(Object::Notes::OwnerId)='+OwnerId;
var ajax = new Ajax.Updater({success: 'success'},'../ViewNotes.do?',{method:'post',parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("success").innerHTML);}});	
}

</script>



<!--END SOURCE CODE FOR EXAMPLE =============================== -->

<div id="dialog1">

<div class="hd">Enter Your Notes Here</div>
<div class="bd">

<bean:define id="roleId" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session"/>

<bean:parameter id="objVerId" name="answer(Object::Notes::ObjectVerId)" />

<bean:parameter id="userName" name="answer(Object::Notes::UserName)" />

<table cellpadding="1" cellspacing="0">
  	 <tr><td> <h6>Notes Description:</h6></td>
       <td> <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="40" maxlength="51" />

  	  	<h8> Private </h8>
            <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
         </tr>
  	 <tr><td><h6>Notes:</h6></td>
  	<td><div id="text"> <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> </div> </td></tr>
   
</table>
<% String y = "Y";%>

<input type =hidden name="answer(Object::Notes::ObjectType)" value='<%= ""+objType%>' id="objType"/> 	
<input type =hidden name="answer(Object::Notes::ObjectId)" value='<%= ""+objId%>'id="objId"/> 	
<input type =hidden name="answer(Object::Notes::ObjectVerId)" value='<%= ""+objVerId%>' id="objVerId"/> 	
<input type = hidden name="answer(Object::Notes::UserName)" value='<%= ""+userName%>'id="User" /> 	
<input type =hidden name="answer(Object::Notes::Active)" value='<%=""+y%>' id="Active" /> 	
<input type = hidden name="answer(Object::Notes::UserRole)" value='<%= ""+roleId%>'id="UserRole" /> 	
<input type = hidden name="answer(Object::Notes::OwnerId)" value='<%= ""+ownerId%>'id="ownerId" /> 	

</div>
</div>



<div id="success2" style="display: none; return: false;"></div>
<div id="success1"></div>

</body>
</html>

