<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

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


<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>

<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/menu/menu-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>


<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>

<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>


<!--BEGIN SOURCE CODE FOR EXAMPLE =============================== -->
<body class="yui-skin-sam">
<html:form action="/SendEmail.do" styleId="sendEmailForm" enctype="multipart/form-data" target="upload_target_iFrame">
<input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="255e108dc23f344a098d5240df192e51">

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ObjectType" name="PrefilledEmailAction" property="answer(Object::Notification::Email::ObjectType)"/>
<bean:define id="NotificationType" name="PrefilledEmailAction" property="answer(Object::Notification::Email::NotificationType)"/>	
<bean:define id="EmailPurpose" name="PrefilledEmailAction" property="answer(Object::Notification::Email::EmailPurpose)"/>
<bean:define id="QuoteNumber" name="PrefilledEmailAction" property="answer(Object::Notification::Email::QuoteNumber)"/>
<bean:define id="QuoteSubNumber" name="PrefilledEmailAction" property="answer(Object::Notification::Email::QuoteSubNumber)"/>	
<bean:define id="PolicyNumber" name="PrefilledEmailAction" property="answer(Object::Notification::Email::PolicyNumber)"/>
<bean:define id="QuoteStatus" name="PrefilledEmailAction" property="answer(Object::Notification::Email::QuoteStatus)"/>


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
	        <bean:define id="Message" value="Enter a Message" />
	        
	        <TR>
		 		<td class="FormLabels" align="left" height="25">Subject:</td>
			    <td><html:text property="answer(Object::Notification::Email::EmailSubject)" value="<%=""+Subject%>" styleId="ThisSubject" size="80" maxlength="100" styleClass="txtbox" /></td>
   			</TR>
   			
   			  <tr>
					<td width="40%" align="left" class="FormLabels">
						Email Type:
					</td> 
					<td class="links" align="left" >
						<html:select  property="answer(Object::Notification::Email::EmailType)" styleId="EmailType" styleClass="txtbox">
							<html:option value="BINDER" styleId="BINDER" >Policy Binder</html:option>
							<html:option value="ENDORS" styleId="ENDORS" >Policy Endorsement</html:option>
							<html:option value="POLICY" styleId="POLICY" >Policy Policy</html:option>
							<html:option value="QUOTE">Quote Proposal</html:option>
							<html:option value="CORRESP">Correspondence Misc Agency</html:option>
						</html:select></td>
				</tr>
			
		    <Table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		    <TR>
   				<td align="left">
					<div id="attachementDiv">
						<jsp:include page="attachmentList.jsp" />
					</div>
				</td>
			</TR>	
		    <tr>
				<td align="left">
					<div id="uploadDivFail"></div>
				</td>
			</tr>
			<tr>	
		    	<td align="left">
						<table>
							<tr><td>&nbsp;&nbsp;&nbsp;</td></tr>
							<tr>
								<td>
							 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_ATTACHMENT"}%>' connector='or' negated="true">
									<div id = "myFile_div">
									To attach external files from local computer to this email,<br>
         click on Browse button below then select the file you want to attach then Click on Attach button<br>
									<input type='file' style="background-color:white; display: compact;border-style:ridge; " name='myFile' onbeforeeditfocus="return false;" onkeydown="return false;" maxlength='127' size='50' value='' id='myFile' onchange="validateFileType('myFile')" />
									<input type="submit"  style="background-color:#336699;color:white; border-style:ridge;" value='Attach' id='saveattach' onclick ='if(saveFileTag()) {checkForInvalidSessionCloseAndForward("N");} else { return false};'/>
									</div>
							 	</dmshtml:dms_static_with_connector> 
								</td>
							</tr>
							<tr>
								<td>
																		
									<iframe id='upload_target_iFrame' onload='refreshDiv(this)' name='upload_target_iFrame' scrolling="auto"  frameborder="null" style='display:none;width:300px;height:60px;border:1px solid #ccc;' ></iframe>
									
								</td>
							</tr>
						</table>
		    	</td>
		    </tr>
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
					<html:reset value="Clear" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onclick="checkForInvalidSessionCloseAndForward('N');" onmouseout="this.style.color='#0042B0';" /> 
							&nbsp;&nbsp;&nbsp;
					<a href="javascript:checkForInvalidSessionCloseAndForward('Y');"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="0" /></a>
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
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=""+ownerId%>" styleId="OwnerId" />

<html:hidden property="answer(Object::Notification::Email::ObjectId)" value="<%=request.getAttribute("ObjectId")+""%>" styleId="ObjectId" />
<html:hidden property="answer(Object::Notification::Email::ObjectVerId)" value="<%=request.getAttribute("ObjectVerId")+""%>" styleId="ObjectVerId" />
<html:hidden property="answer(Object::Notification::Email::NotificationType)" value="<%=""+NotificationType%>" styleId="NotificationType" />
<html:hidden property="answer(Object::Notification::Email::ObjectType)" value="<%=""+ObjectType%>" styleId="ObjectType" />
<html:hidden property="answer(Object::Notification::Email::EmailPurposeType)" value="<%=""+ObjectType%>" styleId="EmailPurposeType" />
<html:hidden property="answer(Object::Notification::Email::EmailPurpose)" value="<%=""+EmailPurpose%>" styleId="EmailPurpose" />
<html:hidden property="answer(Object::Notification::Email::QuoteStatus)" value="<%=""+QuoteStatus%>" styleId="QuoteStatus" />
<html:hidden property="answer(Object::Notification::Email::PolicyNumber)" value="<%=""+PolicyNumber%>" styleId="PolicyNumber" />
<html:hidden property="answer(Object::Notification::Email::QuoteNumber)" value="<%=""+QuoteNumber%>" styleId="QuoteNumber" />
<html:hidden property="answer(Object::Notification::Email::QuoteSubNumber)" value="<%=""+QuoteSubNumber%>" styleId="QuoteSubNumber" />
<html:hidden property="answer(isUpdated)" value="Y" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>"/>
	<html:hidden property="answer(pagename)" value="<%=""+" send email"%>" />
	

<div id="sendEmailBody" style="display:none;"></div>
<div id="errorMsg"></div>
</html:form>
</body>

<script>
var i = 0;

function trim(str)	//Function to trim
	{
    	if(!str || typeof str != 'string')
        	return null;
	    return str.replace(/^[\s]+/,'').replace(/[\s]+$/,'').replace(/[\s]{2,}/,' ');
	}	

function refreshDiv(obj){		// Function to refresh the attachmentDiv
	if(i!=0)
	{
		var attachmentDivContent = document.getElementById("attachementDiv").innerHTML;
		var content = obj.contentWindow.document.getElementsByTagName("body")[0].innerHTML;
		if(trim(content) == "Upload Failed")
		{
			alert("Upload Failed... File Can't be UPLOADED");
			document.getElementById("uploadDivFail").innerHTML=content;
			document.getElementById('myFile_div').innerHTML= document.getElementById('myFile_div').innerHTML; 
		}else{
			
			document.getElementById("uploadDivFail").innerHTML="";
			document.getElementById("attachementDiv").innerHTML="";
			document.getElementById("attachementDiv").innerHTML= content;
			document.getElementById('myFile_div').innerHTML= document.getElementById('myFile_div').innerHTML; 
		}
	}
	i=1;
}

function saveFileTag(){       // Function to check and set the action to upload
	if(document.getElementById("myFile").value == ""){
		alert("Please Choose a File to Attach");
		return false;
	}
		document.getElementById("sendEmailForm").action = "/AddEmailAttachment.do";
		return true;
}
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
	 	 	document.getElementById("sendEmailForm").action = "/SendEmail.do";	//to sent SendEmail action in form after attachment
	 	 	document.getElementById("sendEmailForm").target="";					//set target for the form to null
		 	 var Message=encodeURIComponent(myEditor.get('textarea').value);
		 	 var From = document.getElementById("ThisFrom").value;
		 	 var To = document.getElementById("ThisTo").value;
		 	 var Cc = document.getElementById("ThisCc").value;
		 	 var Bcc = document.getElementById("ThisBcc").value;
		  	 var Subject = encodeURIComponent(document.getElementById("ThisSubject").value);
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
		     var QuoteStatus = document.getElementById("QuoteStatus").value;
		     var QuoteNumber=document.getElementById("QuoteNumber").value;
             var QuoteSubNumber = document.getElementById("QuoteSubNumber").value;
		     var PolicyNumber = document.getElementById("PolicyNumber").value;
		     var EmailType = document.getElementById("EmailType").value;
		     
	     
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
		  			'&answer(Object::Notification::Email::QuoteStatus)='+QuoteStatus+
		  			'&answer(Object::Notification::Email::QuoteNumber)='+QuoteNumber+
		  			'&answer(Object::Notification::Email::QuoteSubNumber)='+QuoteSubNumber+
		  			'&answer(Object::Notification::Email::PolicyNumber)='+PolicyNumber+
		  			'&answer(Object::Notification::Email::AttachmentCount)='+AttachmentCount+
		  			'&answer(Object::Notification::Email::EmailType)='+EmailType+
		  			'&answer(Object::Activity::OwnerId)='+OwnerId+
		  			'&answer(Object::Activity::ActivityType)='+ "Quote Management"+
		  			'&answer(Object::Activity::ObjectType)='+ "Quote"+
		  			'&answer(Object::Activity::CreatedBy)='+ CreatedBy+
		  			'&answer(pagename)=' + "email";	
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

		  	checkForInvalidSessionCloseAndForward('N');

			var myAjax = new Ajax.Updater( 
		 			{success: 'sendEmailBody'},
					'../SendEmail.do?', 
					{
						method: 'post', 
						parameters:pars,
						 onComplete:function(){
							if(document.getElementById("sendEmailBody") != null && document.getElementById("sendEmailBody") != undefined) {
								forwardToLoginPageIfInvalidSession(document.getElementById("sendEmailBody").innerHTML);
							}
							refreshSentList();
						} 
					});
			 	       
	}	
}		

function refreshSentList(){
	window.close();
	window.opener.refreshEmailList();
} 
</script>
