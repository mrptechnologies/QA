
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
 
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/DisplayEmailList.js"></SCRIPT>



<body class=" yui-skin-sam">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:parameter id="ObjectVerId" name="answer(Object::Notification::Email::ObjectVerId)" />
<bean:parameter id="objId" name="answer(Object::Notification::Email::ObjectId)" />
<bean:parameter id="SubQuoteVerId" name="answer(Object::Notification::Email::SubQuoteVerId)" />
<bean:parameter id="QuoteStatus" name="answer(Object::Notification::Email::QuoteStatus)" />
<bean:parameter id="email" name="answer(Object::Notification::UserDetail::Email)" />
<bean:parameter id="roleName" name="answer(Object::Notification::UserDetail::RoleName)" />

<bean:parameter id="QuoteNumber" name="answer(Object::Notification::Email::QuoteNumber)" />
<bean:parameter id="QuoteSubNumber" name="answer(Object::Notification::Email::QuoteSubNumber)" />
<bean:parameter id="PolicyNumber" name="answer(Object::Notification::Email::PolicyNumber)" />
<bean:parameter id="EndorsementStatus" name="answer(Object::Notification::Email::EndorsementStatusFlag)"/>
<bean:parameter id="objType" name="answer(Object::Notification::Email::ObjectType)" />
<bean:parameter id="InsuredName" name="answer(Object::Notification::Email::InsuredName)" />

<% String EmailType="";  
	if(EndorsementStatus.equalsIgnoreCase("NO")){
		if(QuoteStatus.equals("Issued")){
			EmailType="POLICY";
		}else if(QuoteStatus.equals("Offered") || QuoteStatus.equals("Bind Request")){
			EmailType="QUOTE";
		}else if(QuoteStatus.equals("Bound")){
			EmailType="BINDER";
		}else{
			EmailType="CORRESP";
		}
	}else{
		EmailType="ENDORS";
	}
%>
<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->

<style>
  #container {height:15em;}
 </style>
<div id="Emailtree">
<div id="Emailtreediv"> </div>
</div>

<script>
YAHOO.namespace("example.container");
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
var myEditor;
var flag=0;

(function(){
var init = function() {
  //create the TreeView instance:
  var tree = new YAHOO.widget.TreeView("Emailtreediv");
  //get a reusable reference to the root node:
  var root = tree.getRoot();
  //First, create a parent node
  var SentEmails = new YAHOO.widget.HTMLNode('<html><head></head><body><table><tr><td>&nbsp;&nbsp;</td><td><a href="javascript:void(0);" onclick=showSentEmailSubNodes("sentEmailSuccess"); ><img src="/Images/emailIcon.jpg" border="0" height="18" width="18"> <font color="blue"> Emails Sent</font></a></td><td><div id="sentEmailCount"> </div></td></tr></table>', root, false);
  //EmailList.labelStyle = "icon-prv";
  var composeEmail = new YAHOO.widget.HTMLNode('<div id="composeEmail" style="display: none; return: false;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:void(0);" onclick="sendEmailDetails();" title="Email" > Compose Email</a></div>', root , false);
  var ViewSentEmail = new YAHOO.widget.HTMLNode('<div id="sentEmailSuccess" style="display: none; return: false;"> </div>', root , false);
  tree.draw();
  var ObjectId = document.getElementById("objId").value;
	 var OwnerId = document.getElementById("ownerId").value;
	 var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
	 var ajax = new Ajax.Updater({success: 'sentEmailCount'},'../email/GetSentEmailCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("sentEmailCount").innerHTML);}}); 
	   
  } 
 //Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);

})();

</script>

<!--END SOURCE CODE FOR EXAMPLE =============================== -->


<bean:parameter id="userName" name="answer(Object::Notification::Email::UserName)" />


<input type =hidden name="answer(Object::Notification::Email::ObjectType)" value='<%= ""+objType%>' id="objType"/>  
<input type =hidden name="answer(Object::Notification::Email::ObjectId)" value='<%= ""+objId%>'id="objId"/>  
<input type =hidden name="answer(Object::Notification::Email::ObjectVerId)" value='<%= ""+ObjectVerId%>' id="ObjectVerId"/>  
<input type = hidden name="answer(Object::Notification::Email::UserName)" value='<%= ""+userName%>'id="User" />  
<input type = hidden name="answer(Object::Notification::Email::OwnerId)" value='<%= ""+ownerId%>'id="ownerId" />  
<input type = hidden name="answer(Object::Notification::Email::QuoteStatus)" value='<%= ""+QuoteStatus%>'id="QuoteStatus" />
<input type = hidden name="answer(Object::Notification::Email::SubQuoteVerId)" value='<%= ""+SubQuoteVerId%>'id="SubQuoteVerId" />
<input type = hidden name="answer(Object::Notification::Email::QuoteNumber)" value='<%= ""+QuoteNumber%>'id="QuoteNumber" />  
<input type = hidden name="answer(Object::Notification::Email::QuoteSubNumber)" value='<%= ""+QuoteSubNumber%>'id="QuoteSubNumber" />
<input type = hidden name="answer(Object::Notification::Email::PolicyNumber)" value='<%= ""+PolicyNumber%>'id="PolicyNumber" />
<input type="hidden" name="answer(Object::Notification::Email::EndorsementStatus)" value='<%= ""+EndorsementStatus%>'id="EndorsementStatus" />
<input type="hidden" name="answer(Object::Notification::Email::EmailType)" value='<%= ""+EmailType%>'id="EmailType" />
<input type="hidden" name="answer(Object::Notification::Email::InsuredName)" value='<%= ""+InsuredName%>'id="InsuredName" />
<input type="hidden" name="answer(Object::Notification::UserDetail::Email)" value='<%= ""+email%>'id="email" />
<input type="hidden" name="answer(Object::Notification::UserDetail::RoleName)" value='<%= ""+roleName%>'id="roleName" />
</body>
</html>


