<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page contentType="text/html" import="java.util.*" %>
<%@page contentType="text/html" import="com.dms.ejb.user.UserDetail" %>


<html:html>

<SCRIPT type="text/javascript">
	function CloseWindow(){
		top.opener.location.reload(true);
		window.close();
	}
	function loadParent(){
		//window.opener.location.href=url;
		setTimeout( "window.close();", 100 );
	}
</SCRIPT>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/menu/menu-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/editor/simpleeditor-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>


<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->
<body class="yui-skin-sam">
<html:form action="/SendEmail.do" styleId="sendEmailForm">

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ObjectType" name="PrefilledEmailAction" property="answer(Object::Notification::Email::ObjectType)"/>
<bean:define id="NotificationType" name="PrefilledEmailAction" property="answer(Object::Notification::Email::NotificationType)"/>	
<bean:define id="EmailPurpose" name="PrefilledEmailAction" property="answer(Object::Notification::Email::EmailPurpose)"/>

<!-- 
<bean:define id="QuoteNumber" name="PrefilledEmailAction" property="answer(Object::Notification::Email::QuoteNumber)"/>
<bean:define id="QuoteSubNumber" name="PrefilledEmailAction" property="answer(Object::Notification::Email::QuoteSubNumber)"/>	
<bean:define id="PolicyNumber" name="PrefilledEmailAction" property="answer(Object::Notification::Email::PolicyNumber)"/>
<bean:define id="QuoteStatus" name="PrefilledEmailAction" property="answer(Object::Notification::Email::QuoteStatus)"/>
 -->

<Table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="3">
	<tr>				
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="sectionhead"  align="center">Send E-mail <BR></td>
	</tr>
</Table>

<Table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="3">
	<%boolean isEnabled=true; %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_FROMADDRESS_EDIT"}%>' connector='or' negated="true">
		<%isEnabled=false;%>
	</dmshtml:dms_static_with_connector>
	<tr>
		<td>&nbsp;</td>
		
		<td>&nbsp;</td>
	</tr>
	<TR>
		<td align="left">
			<html:button value="Send" styleClass="sbttn" styleId="SendEmail" property="button" onclick="viewMailDetails()"/>
		</td>	
	</TR>
    <TR>
    	<td class="FormLabels" align="left" height="25">From:</td>
 		<td>
			<html:text property="answer(Object::Notification::Email::FromAddress)" value="<%=request.getAttribute("FromAddress")+"" %>" styleId="ThisFrom" size="80" maxlength="100" styleClass="txtbox" disabled="<%=isEnabled%>" />
 		</td>
 		
	</TR> 
	    
	<TR>
	 	<td class="FormLabels" align="left" height="25">To:</td>
		<td><html:text property="answer(Object::Notification::Email::ToAddress)" value="<%=request.getAttribute("ToAddress")+"" %>" styleId="ThisTo" size="80" maxlength="500" styleClass="txtbox"  /></td>
	</TR>    
	
	<TR>
		 <td class="FormLabels" align="left" height="25">Cc:</td>
		 <td>
		   <html:text property="answer(Object::Notification::Email::CcAddress)" value="<%=request.getAttribute("CcAddress")+"" %>" styleId="ThisCc" size="80" maxlength="500" styleClass="txtbox" />          
		 </td>
	</TR>
	
	<TR>
		 <td class="FormLabels" align="left" height="25">Bcc:</td>
		 <td><html:text property="answer(Object::Notification::Email::BccAddress)" value="<%=request.getAttribute("BccAddress")+"" %>" styleId="ThisBcc" size="80" maxlength="500" styleClass="txtbox" /></td>
	</TR> 
	   
	<logic:present name="TemplateList" scope="request">  
		<logic:iterate id="TemplateList" name="TemplateList" scope="request">
	    	<bean:define id="Subject" name="TemplateList" property="Object::Notification::Email::MessageHeader"/>
	        <bean:define id="Message" name="TemplateList" property="Object::Notification::Email::MessageDetail"/>
	        
	        <TR>
		 		<td class="FormLabels" align="left" height="25">Subject:</td>
			    <td><html:text property="answer(Object::Notification::Email::EmailSubject)" value="<%=""+Subject%>" styleId="ThisSubject" size="80" maxlength="100" styleClass="txtbox" /></td>
   			</TR>
			
		    <Table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<!--<TR>
   				<td align="left">
					<div id="attachementDiv">
						<jsp:include page="attachmentList.jsp" />
					</div>
				</td>
			</TR>	 -->
		    
		    <tr>
				<td class="sectionhead" align="center">Email Message</td>
			</tr>
			<tr>
				<td>
					<html:textarea property="answer(Object::Notification::Email::EmailMessage)" value="<%=""+Message%>" styleId="editor" rows="15" cols="100" />								
				</td>
			</tr>
			<tr>
				<td >
					&nbsp;
				</td>
			</tr>	
		    <tr>
				<td>
					<hr size="3" noshade width="95%">
				</td>
			</tr>
		     <tr>
				<td >
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center">	
					<html:button value="Send" styleClass="sbttn" styleId="SendEmail" property="button" onclick="viewMailDetails()"/>
							&nbsp;&nbsp;&nbsp;
					<html:reset value="Clear" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" /> 
							&nbsp;&nbsp;&nbsp;
					<a href="javascript:window.close();"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="0" /></a>
				</td>
			</tr>
			<tr>
				<td >
					&nbsp;
				</td>
			</tr>
		  </logic:iterate>	
		</logic:present>	     
	</TABLE>
  
  
<html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>' styleId="dbName" />
<html:hidden property="answer(Object::Notification::Email::CreatedBy)" value="<%=""+userId%>" styleId="CreatedBy" />
<html:hidden property="answer(Object::Notification::Email::UpdatedBy)" value="<%=""+userId%>" styleId="UpdatedBy" />
<html:hidden property="answer(Object::Notification::Email::OwnerId)" value="<%=""+ownerId%>" styleId="OwnerId" />
<html:hidden property="answer(Object::Notification::Email::ObjectId)" value="<%=request.getAttribute("ObjectId")+""%>" styleId="ObjectId" />
<html:hidden property="answer(Object::Notification::Email::ObjectVerId)" value="<%=request.getAttribute("ObjectVerId")+""%>" styleId="ObjectVerId" />
<html:hidden property="answer(Object::Notification::Email::NotificationType)" value="<%=""+NotificationType%>" styleId="NotificationType" />
<html:hidden property="answer(Object::Notification::Email::ObjectType)" value="<%=""+ObjectType%>" styleId="ObjectType" />
<html:hidden property="answer(Object::Notification::Email::EmailPurposeType)" value="<%=""+ObjectType%>" styleId="EmailPurposeType" />
<html:hidden property="answer(Object::Notification::Email::EmailPurpose)" value="<%=""+EmailPurpose%>" styleId="EmailPurpose" />
<html:hidden property="&answer(Object::Notification::Email::AttachmentCount)" value="0" styleId="AttachmentCount" />

<!-- 
<html:hidden property="answer(Object::Notification::Email::QuoteStatus)" value="<%=""+QuoteStatus%>" styleId="QuoteStatus" />
<html:hidden property="answer(Object::Notification::Email::PolicyNumber)" value="<%=""+PolicyNumber%>" styleId="PolicyNumber" />
<html:hidden property="answer(Object::Notification::Email::QuoteNumber)" value="<%=""+QuoteNumber%>" styleId="QuoteNumber" />
<html:hidden property="answer(Object::Notification::Email::QuoteSubNumber)" value="<%=""+QuoteSubNumber%>" styleId="QuoteSubNumber" />
 -->

<div id="sendEmailBody" style="display:none;"></div>
<div id="errorMsg"></div>
</html:form>
</body>
</html:html>

<!--END SOURCE CODE FOR EMAIL BODY =============================== -->

<script>

var myEditor;
(function() {
    var Dom = YAHOO.util.Dom,
        Event = YAHOO.util.Event;
    
    var myConfig = {
        height: '150px',
        width: '650px',
        dompath: true,
        focusAtStart: true
    };

    YAHOO.log('Create the Editor..', 'info', 'example');
    myEditor = new YAHOO.widget.SimpleEditor('editor', myConfig); 
    myEditor._defaultToolbar.buttonType = 'advanced'; 
    myEditor.render();

})();   

function viewMailDetails() {
	 	 myEditor.saveHTML();
	 	 var emailValidate=validate();	
	 	 if(emailValidate==false){
	 	 	 window.opener.refreshEmailList(); 
	 	 }else{		 	 	
		 	 var Message=encodeURIComponent(myEditor.get('textarea').value);
		 	 var From = document.getElementById("ThisFrom").value;
		 	 var To = document.getElementById("ThisTo").value;
		 	 var Cc = document.getElementById("ThisCc").value;
		 	 var Bcc = document.getElementById("ThisBcc").value;
		  	 var Subject = document.getElementById("ThisSubject").value;
		   	 var CreatedBy = document.getElementById("CreatedBy").value; 
		  	 var UpdatedBy = document.getElementById("UpdatedBy").value;
		  	 var OwnerId = document.getElementById("OwnerId").value;
		  	 var ObjectId = document.getElementById("ObjectId").value;
		  	 var ObjectVerId = document.getElementById("ObjectVerId").value;
		  	 var ObjectType = document.getElementById("ObjectType").value;
		     var NotificationType = document.getElementById("NotificationType").value;
		     var dbName = document.getElementById("dbName").value;
		     var AttachmentCount=document.getElementById("AttachmentCount").value;
             var EmailPurposeType = document.getElementById("EmailPurposeType").value;
		     var EmailPurpose = document.getElementById("EmailPurpose").value;		     
		     
	     
	  	     var pars= 'answer(Object::Notification::Email::FromAddress)='+ From+
		  			'&answer(Object::Notification::Email::ToAddress)='+To+
		  			'&answer(Object::Notification::Email::CcAddress)='+Cc+
		  			'&answer(Object::Notification::Email::BccAddress)='+Bcc+
		  			'&answer(Object::Notification::Email::EmailSubject)='+Subject+
		  			'&answer(Object::Notification::Email::EmailMessage)='+Message+
		  			'&answer(Object::Notification::Email::CreatedBy)='+CreatedBy+
		  			'&answer(Object::Notification::Email::UpdatedBy)='+UpdatedBy+
		  			'&answer(Object::Notification::Email::NotificationType)='+NotificationType+
		  			'&answer(Object::Notification::Email::OwnerId)='+OwnerId+
		  			'&answer(Object::Notification::Email::ObjectId)='+ObjectId+
		  			'&answer(Object::Notification::Email::ObjectVerId)='+ObjectVerId+
		  			'&answer(Object::Notification::Email::ObjectType)='+ObjectType+
		  			'&answer(Object::Notification::Email::EmailPurposeType)='+EmailPurposeType+
		  			'&answer(Object::Notification::Email::EmailPurpose)='+EmailPurpose+		  			
		  			'&answer(Object::Notification::Email::AttachmentCount)='+AttachmentCount;
		  			
	  	
		  	if(AttachmentCount == 0){
		  			pars;
		  	}else{	
			  	for(var index = 0; index < AttachmentCount; index++){
			  		     var AttachmentURL=document.getElementById("AttachmentURL"+index).value;
					     var AttachmentLocation=document.getElementById("AttachmentLocation"+index).value;
					     var AttachmentName=document.getElementById("AttachmentName"+index).value;
					     var AttachmentType=document.getElementById("AttachmentType"+index).value;
					     var AttachmentDesc=document.getElementById("AttachmentDesc"+index).value;
					     var AttachmentCreatedBy=document.getElementById("AttachmentCreatedBy").value;
			    		 var AttachmentUpdatedBy=document.getElementById("AttachmentUpdatedBy").value;
			    		
			  			 pars = pars + '&answer(Object::Notification::Email::Attachement::URL_'+index+')='+AttachmentURL+
					  			'&answer(Object::Notification::Email::Attachement::Location_'+index+')='+AttachmentLocation+
			  					'&answer(Object::Notification::Email::Attachement::Name_'+index+')='+AttachmentName+
			  					'&answer(Object::Notification::Email::Attachement::Type_'+index+')='+AttachmentType+
					  			'&answer(Object::Notification::Email::Attachement::Desc_'+index+')='+AttachmentDesc+
					  			'&answer(Object::Notification::Email::Attachement::CreatedBy)='+AttachmentCreatedBy+
					  			'&answer(Object::Notification::Email::Attachement::UpdatedBy)='+AttachmentUpdatedBy;				  			
			  	}
			 }
	
			 
			 var myAjax = new Ajax.Updater( 
			 			{success: 'sendEmailBody'},
						'../SendMail.do?', 
						{
							method: 'post', 
							parameters:pars,
							 onComplete:function(){
							if(document.getElementById("sendEmailBody") != null && document.getElementById("sendEmailBody") != undefined) {
								forwardToLoginPageIfInvalidSession(document.getElementById("sendEmailBody").innerHTML);
							}
							window.close();} 
						});
	       
	}	
}		

 function refreshSentList(){

window.opener.refreshEmailList();
window.close();
} 
</script>
