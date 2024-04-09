<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<form name="AttachmentList" method="post" action="/AddAttachment.go" enctype="multipart/form-data" target="upload_target_iFrame"><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="255e108dc23f344a098d5240df192e51">	
  <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
  <bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
  <html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
  <html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
  <html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
  <html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
  <html:hidden property="answer(isAdded)" value="<%="Y"%>" />
<% 
 String approvalStatus = "";
 if(request.getParameter("answer(APPROVAL_STATUS_NEEDED)")!=null){
	 approvalStatus = request.getParameter("answer(APPROVAL_STATUS_NEEDED)");
 }
 String isRenewal = "";
 if(request.getParameter("answer(isRenewal)")!=null){	 
	 isRenewal = request.getParameter("answer(isRenewal)");
 }
 String agencyId = "";
 if(request.getParameter("answer(agencyId)")!=null){	 
	 agencyId = request.getParameter("answer(agencyId)");
 }
 String subjectivityObjectType = "";
 if(request.getParameter("answer(subjectivityObjectType)")!=null){	 
	 subjectivityObjectType = request.getParameter("answer(subjectivityObjectType)");
 }
 String subjectivityAlertObjectType = ""; 
 if(request.getParameter("answer(subjectivityAlertObjectType)")!=null){	 
	 subjectivityAlertObjectType = request.getParameter("answer(subjectivityAlertObjectType)");	 
 }
 String renewalQuoteId = ""; 
 if(request.getParameter("answer(renewalQuoteId)")!=null){	 
	 renewalQuoteId = request.getParameter("answer(renewalQuoteId)");	 
 }
 String renewalQuoteverId = ""; 
 if(request.getParameter("answer(renewalQuoteverId)")!=null){	 
	 renewalQuoteverId = request.getParameter("answer(renewalQuoteverId)");	 
 }
 String parentQuoteId = ""; 
 if(request.getParameter("answer(parentQuoteId)")!=null){	 
	 parentQuoteId = request.getParameter("answer(parentQuoteId)");	 
 }
 String parentQuoteVerId = ""; 
 if(request.getParameter("answer(parentQuoteVerId)")!=null){	 
	 parentQuoteVerId = request.getParameter("answer(parentQuoteVerId)");	 
 }
 String quoteStatus = "";
 if(request.getParameter("answer(quoteStatus)")!=null){	 
	 quoteStatus = request.getParameter("answer(quoteStatus)");	 
 }
 %> 

<input type="hidden" name="answer(Object::Attachment::LocationType)" value="FOLDER" id="attachmentLocationType">
<input type="hidden" name="answer(Object::Attachment::Status)" value="UPLOADED" id="attachmentStatus">
<input type="hidden" name="answer(Object::AttachmentObjectLink::Active)" value="Y" id="attachmentObjectLinkActive">
<input type="hidden" name="answer(Object::Attachment::Active)" value="Y" id="attachmentActive">		
<input type ="hidden" name="answer(Object::Notes::ApprovalStatus)" value='<%= ""+approvalStatus%>'id="approvalStatus" />

<input type="hidden" id="ownerId" name="answer(Object::Owner::OwnerId)" value="<%=""+ownerId%>" >
<input type="hidden" id="userId" name="answer(Object::Activity::CreatedBy)" value="<%=""+userId%>" >
<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectType)" id="objectTypeLink">
<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectId)" id="objectId" >
<input type="hidden" name="answer(Object::Attachment::ObjectId)" id="objectId1">
<input type="hidden" name="answer(Object::Attachment::ObjectVerId)" id="objectVerId">
<input type="hidden" name="answer(Object::AttachmentObjectLink::ObjectVerId)" id="objectVerId1">
<input type="hidden" name="answer(Object::Attachment::ObjectType)" id="objectType">
<input type="hidden" name="answer(isRenewal)" value="<%=""+isRenewal %>">
<input type="hidden" name="answer(agencyId)" value="<%=""+agencyId %>">
<input type="hidden" name="answer(subjectivityObjectType)" value="<%=""+subjectivityObjectType %>">
<input type="hidden" name="answer(subjectivityAlertObjectType)" value="<%=""+subjectivityAlertObjectType %>">
<input type="hidden" name="answer(renewalQuoteId)" value="<%=""+renewalQuoteId %>">
<input type="hidden" name="answer(renewalQuoteverId)" value="<%=""+renewalQuoteverId %>">
<input type="hidden" name="answer(parentQuoteVerId)" value="<%=""+parentQuoteVerId %>">
<input type="hidden" name="answer(parentQuoteId)" value="<%=""+parentQuoteId %>">
<input type="hidden" name="answer(quoteStatus)" value="<%=""+quoteStatus %>">


<table cellpadding="1" width="60%" cellspacing="0" border="1" bordercolor='#000000'>
<tr bordercolor='#ffffff'> <td>
<div class="AttachmentPage">									
					<div class="content">							
					<div class="AttachmentHead"><h2 class="left">Attach File</h2></div>								
<table width="100%" cellpadding="1" cellspacing="0" style="background:url(i/bodybg.gif) repeat-x #fff;">

					<tr><td>&nbsp;</td></tr>	
  	 <tr>
  	   <td class="field" align="right"> 
  	     Name :  	     
  	   </td>
       <td> 
         <input type='text' name='answer(Object::Attachment::Name)' maxlength='47' size='40' value='' id='attachmentName'>
        
     </tr>
  	 <tr>
  	<td class="field" align="right"> 
  	   Description :
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea name='answer(Object::Attachment::Description)' cols='50' rows='4' id='attachmentDesc'></textarea></div> 
  	</td>
  </tr>
<tr><td class="field" align="right"> 
Select File :
</td>
<td>
<table><tr><td><input type='file' onbeforeeditfocus="return false;" onkeydown="return false;" name='myFile' maxlength='127' size='43' value='' id='myFile' onchange="validateFileType('myFile')"></td></tr><tr><td></td></tr><tr><td></td></tr></table>
</td>
</tr>
<tr>
  	<td>&nbsp;</td>
  	</tr>
  	<tr>
  	<td align="right"></td>
  	<td align="left"> 
  	<table><tr><td>
  		<html:button property="SaveAttachment" value="Save" styleClass="subbutton" onclick="saveAttachment1()" styleId="saveAttachment" /></td><td><html:button property="CancelAttachment" value="Cancel" styleClass="subbutton" onclick="document.getElementById('AttachFiles').style.display='none';YAHOO.example.container.AttachFiles.hide();" styleId="cancelAttachment" /></td></table>
  	</td>
  	</tr>
  </tr>
</table>
</div></div></td></tr></table>
</form>