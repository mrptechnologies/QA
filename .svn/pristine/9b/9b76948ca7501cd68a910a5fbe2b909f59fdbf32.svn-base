function showSentEmail(id1,img1) {
 if(document.getElementById(id1).style.display == 'none'){
 
  document.getElementById(id1).style.display = 'block';
  document.getElementById(img1).src='/Images/minus2.gif';
 
 }
 else {
 
     document.getElementById(id1).style.display = 'none';
    document.getElementById(img1).src='/Images/add_bttn.gif';
 
 }
 
}

//<%String insName = InsuredName.replaceAll("\"","___");%>;

function sendEmailDetails(){
	var insName=document.getElementById("InsuredName").value;
	insName=insName.replace("\"","___");
	//var insName1 = "<%=""+insName.replaceAll("<","&lt;").replaceAll(">","&gt;")%>";
	var insName1=insName;
	insName1 = insName1.replace(/___/g,'"');
	var insNamedecripted = encodeURIComponent(insName1);
	var ObjectVerId = document.getElementById("ObjectVerId").value;
    var ObjectType = document.getElementById("objType").value;
    var ObjectId = document.getElementById("objId").value;
    var OwnerId = document.getElementById("ownerId").value;
    var QuoteStatus = document.getElementById("QuoteStatus").value;
    var QuoteNumber = document.getElementById("QuoteNumber").value;
    var QuoteSubNumber = document.getElementById("QuoteSubNumber").value;
    var PolicyNumber = document.getElementById("PolicyNumber").value;
    var EmailType = document.getElementById("EmailType").value;
    var email =document.getElementById("email").value;
    var roleName =document.getElementById("roleName").value;
    var SubQuoteVerId =document.getElementById("SubQuoteVerId").value;
	//EmailPopup("../PrefilledEmailAction.do?answer(pagename)=<%="email"%>&answer(Object::Activity::OwnerId)=<%=""+ownerId %>&answer(Object::Notification::Email::ObjectId)=<%=""+objId%>&answer(Object::Notification::Email::InsuredName)="+insNamedecripted+"&answer(Object::Notification::UserDetail::Email)=<%=""+email%>&answer(Object::Notification::UserDetail::RoleName)=<%=""+roleName%>&answer(Object::Notification::Email::ObjectVerId)=<%=""+ObjectVerId%>&answer(Object::Notification::Email::ObjectType)=<%=""+objType%>&answer(Object::Notification::Email::NotificationType)=<%="EMAIL"%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(Object::Notification::Email::SubQuoteVerId)=<%=""+SubQuoteVerId %>&answer(Object::Notification::Email::ObjectStatus)=<%=""+QuoteStatus%>&answer(Object::Notification::Email::EmailType)=<%=""+EmailType%>&answer(Object::Notification::Email::QuoteStatus)=<%=""+QuoteStatus%>&answer(Object::Notification::Email::QuoteNumber)=<%=""+QuoteNumber%>&answer(Object::Notification::Email::QuoteSubNumber)=<%=""+QuoteSubNumber%>&answer(Object::Notification::Email::PolicyNumber)=<%=""+PolicyNumber%>","Email");
	EmailPopup("../PrefilledEmailAction.do?answer(pagename)=email&answer(Object::Activity::OwnerId)="+OwnerId+"&answer(Object::Notification::Email::ObjectId)="+ObjectId+"&answer(Object::Notification::Email::InsuredName)="+insNamedecripted+"&answer(Object::Notification::UserDetail::Email)="+email+"&answer(Object::Notification::UserDetail::RoleName)="+roleName+"&answer(Object::Notification::Email::ObjectVerId)="+ObjectVerId
			+"&answer(Object::Notification::Email::ObjectType)="+ObjectType+"&answer(Object::Notification::Email::NotificationType)=EMAIL&answer(Object::UserDetail::ownerId)="+OwnerId
			+"&answer(Object::Notification::Email::SubQuoteVerId)="+SubQuoteVerId+"&answer(Object::Notification::Email::ObjectStatus)="+QuoteStatus+"&answer(Object::Notification::Email::EmailType)="+EmailType+
			"&answer(Object::Notification::Email::QuoteStatus)="+QuoteStatus+"&answer(Object::Notification::Email::QuoteNumber)="+QuoteNumber+"&answer(Object::Notification::Email::QuoteSubNumber)="+QuoteSubNumber+"&answer(Object::Notification::Email::PolicyNumber)="+PolicyNumber,"Email");
}

function refreshEmailList(){
	window.setTimeout(function(){
		document.getElementById("sentEmailSuccess").style.display = 'none';
		document.getElementById("composeEmail").style.display = 'none';
		var ObjectId = document.getElementById("objId").value;
		var OwnerId = document.getElementById("ownerId").value;
		var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
		var ajax = new Ajax.Updater({success: 'sentEmailCount'},'../email/GetSentEmailCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("sentEmailCount").innerHTML);}});
		},3000);
} 


function showSentEmailSubNodes(id){
	 
	 if(document.getElementById(id).style.display == 'none'){
	     var ObjectVerId = document.getElementById("ObjectVerId").value;
	     var ObjectType = document.getElementById("objType").value;
	     var ObjectId = document.getElementById("objId").value;
	     var OwnerId = document.getElementById("ownerId").value;
	     var QuoteStatus = document.getElementById("QuoteStatus").value;
	     var QuoteNumber = document.getElementById("QuoteNumber").value;
	     var QuoteSubNumber = document.getElementById("QuoteSubNumber").value;
	     var PolicyNumber = document.getElementById("PolicyNumber").value;
	     var EmailType = document.getElementById("EmailType").value;
	     
	     var pars='ObjectType='+ObjectType+'&ObjectId='+ObjectId+'&OwnerId='+OwnerId+'&ObjectVerId='+ObjectVerId+'&QuoteStatus='+QuoteStatus+'&QuoteNumber='+QuoteNumber+'&QuoteSubNumber='+QuoteSubNumber+'&PolicyNumber='+PolicyNumber+'&EmailType='+EmailType;
	   document.getElementById(id).style.display = 'block';
	   
	   document.getElementById("composeEmail").style.display = 'block';
	   var ajax = new Ajax.Updater({success: 'sentEmailSuccess'},'../email/SentEMailList.jsp',{method:'post',parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("sentEmailSuccess").innerHTML);}}); 
	   var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
	   var ajax = new Ajax.Updater({success: 'sentEmailCount'},'../email/GetSentEmailCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("sentEmailCount").innerHTML);}});  
	 }else if(document.getElementById(id).style.display == 'block'){
	   document.getElementById(id).style.display = 'none';
	   document.getElementById("composeEmail").style.display = 'none';
	   var ObjectId = document.getElementById("objId").value;
	     var OwnerId = document.getElementById("ownerId").value;
	     var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
	   var ajax = new Ajax.Updater({success: 'sentEmailCount'},'../email/GetSentEmailCount.jsp',{method: 'post', parameters:pars1,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("sentEmailCount").innerHTML);}});  
	 }
	 
	 
	 }
