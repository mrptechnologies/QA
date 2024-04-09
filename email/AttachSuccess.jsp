<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<% String AttachmentURLKey=""; %>
<% String AttachmentLocationKey=""; %>
<% String AttachmentTypeKey=""; %>
<% String AttachmentNameKey=""; %>
<% String AttachmentDescKey=""; %> 

<% String AttachmentURLStyleId=""; %>
<% String AttachmentLocationStyleId=""; %>
<% String AttachmentTypeStyleId=""; %>
<% String AttachmentNameStyleId=""; %>
<% String AttachmentDescStyleId=""; %>

<bean:define id="AttachmentCount" property="answer(Object::Notification::Email::AttachmentCount)"  name="EmailAttachment" />
<% String AttachStatus = (String)request.getAttribute("AttachStatus"); %>
<% String ExtensionStatus = (String)request.getAttribute("ExtensionStatus"); %>
<% String AttachmentMaxSize = (String)request.getAttribute("AttachmentMaxSize"); %>
<script type="text/javascript">
	function sizealertmsg()
	{	
		var attachstatus = "<%=AttachStatus%>";
		var extstatus = "<%=ExtensionStatus%>";
		var attachmaxsize = "<%=AttachmentMaxSize%>";
		if(extstatus == "false" && attachstatus == "null")
			alert("The File type is Restricted to attach! Try a valid Document file"); 
		else if(extstatus == "true" && attachstatus == "null")
			alert("Can't Attach the Selected File! The Total Attachment Size has Exceed the Limit ( "+attachmaxsize+"MB )");
	}
</script>

<body onload="javascript:sizealertmsg()">
<table>
	<tr>
		<td class="FormLabels">
	    	Attachment Found: <%=AttachmentCount%> Attachment(s)
	    	<html:hidden property="answer(Object::Notification::Email::AttachmentCount)" value="<%=""+AttachmentCount %>" styleId="AttachmentCount" />
			<html:hidden property="answer(Object::Notification::Email::Attachment::RemoveIndex)" value="<%=""+AttachmentCount%>" styleId="RemoveIndex" />
		 </td>
	</tr>	 
</table>

<logic:present name="AttachmentList" scope="request">
         <table width="100%" BORDER="0">
         	<%int attachmentIndex=0;%>    	
         	<logic:iterate id="AttachmentList" name="AttachmentList" scope="request">

				<% AttachmentURLKey="answer(Object::Notification::Email::Attachement::URL_"+attachmentIndex+")"; %>
				<% AttachmentTypeKey="answer(Object::Notification::Email::Attachement::Type_"+attachmentIndex+")"; %>
				<% AttachmentNameKey="answer(Object::Notification::Email::Attachement::Name_"+attachmentIndex+")"; %>
				<% AttachmentDescKey="answer(Object::Notification::Email::Attachement::Desc_"+attachmentIndex+")"; %>
				<% AttachmentLocationKey="answer(Object::Notification::Email::Attachement::Location_"+attachmentIndex+")"; %>
				
				<% AttachmentURLStyleId="AttachmentURL" + attachmentIndex; %>
				<% AttachmentLocationStyleId="AttachmentLocation" + attachmentIndex; %>
				<% AttachmentTypeStyleId="AttachmentType" + attachmentIndex; %>
				<% AttachmentNameStyleId="AttachmentName" + attachmentIndex; %>
				<% AttachmentDescStyleId="AttachmentDesc" + attachmentIndex; %>

				<bean:define id="AttachmentLocation" name="AttachmentList" property="Object::Notification::Email::Attachement::Location" />
				<bean:define id="AttachmentURL" name="AttachmentList" property="Object::Notification::Email::Attachement::URL" />
				<bean:define id="AttachmentName" name="AttachmentList" property="Object::Notification::Email::Attachement::Name" />
				<bean:define id="AttachmentType" name="AttachmentList" property="Object::Notification::Email::Attachement::Type" />
				<bean:define id="AttachmentDesc" name="AttachmentList" property="Object::Notification::Email::Attachement::Desc" />
				<bean:define id="AttachmentCreatedBy" name="AttachmentList" property="Object::Notification::Email::Attachement::CreatedBy" />
				<bean:define id="AttachmentUpdatedBy" name="AttachmentList" property="Object::Notification::Email::Attachement::UpdatedBy" />
				<tr>
					<td class="SearchResult" align="left" >
						<a href="javascript:void(0);" onclick="removeAttachement('attachementDiv', '../RemoveAttachmentsAction.do',<%=attachmentIndex%>)" >
						<img src="../Images/ConfirmModify.jpg" title="Click here to remove this file from attachment list" alt="" border="0" /></a>
						<a href="javascript:void(0);" onclick="javascript:window.open('<%=AttachmentURL %>')" >
						<img src="../Images/document.gif" alt="" border="0" width="16" height="16" /><%=AttachmentName %></a>
						
					</td>
					
				 </tr>
				<html:hidden property="<%=AttachmentLocationKey%>" value="<%=""+AttachmentLocation%>" styleId="<%=AttachmentLocationStyleId%>" />
				<html:hidden property="<%=AttachmentURLKey%>" value="<%=""+AttachmentURL%>" styleId="<%=AttachmentURLStyleId%>" />
				<html:hidden property="<%=AttachmentNameKey%>" value="<%=""+AttachmentName%>" styleId="<%=AttachmentNameStyleId%>" />
				<html:hidden property="<%=AttachmentDescKey%>" value="<%=""+AttachmentDesc%>" styleId="<%=AttachmentDescStyleId%>" />
				<html:hidden property="<%=AttachmentTypeKey%>" value="<%=""+AttachmentType%>" styleId="<%=AttachmentTypeStyleId%>" />
				<html:hidden property="answer(Object::Notification::Email::Attachement::CreatedBy)" value="<%=""+AttachmentCreatedBy%>" styleId="AttachmentCreatedBy" />
				<html:hidden property="answer(Object::Notification::Email::Attachement::UpdatedBy)" value="<%=""+AttachmentUpdatedBy%>" styleId="AttachmentUpdatedBy" />
				<%attachmentIndex++;%>
			</logic:iterate>
		</table>
</logic:present>	
</body>
