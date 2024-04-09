<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%
response.setHeader("Cache-Control", "no-store");
long objectId=0;
if(request.getParameter("answer(objectId)")!=null){
	objectId = Long.parseLong(""+request.getParameter("answer(objectId)"));
}
long subjectivityId=0;
if(request.getParameter("answer(subjectivityId)")!=null){
	subjectivityId = Long.parseLong(""+request.getParameter("answer(subjectivityId)"));
}
long parentQuoteVerId=0;
if(request.getParameter("answer(ParentQuoteVerId)")!=null){
	parentQuoteVerId = Long.parseLong(""+request.getParameter("answer(ParentQuoteVerId)"));
}
long subQuoteVerId=0;
if(request.getParameter("answer(SubQuoteVerId)")!=null){
	subQuoteVerId = Long.parseLong(""+request.getParameter("answer(SubQuoteVerId)"));
}
long ownerId = 0;
if(request.getParameter("answer(OwnerId)")!=null){
	ownerId = Long.parseLong(""+request.getParameter("answer(OwnerId)"));
}
String objectType ="";
if(request.getParameter("answer(objectType)")!=null){
	objectType = ""+request.getParameter("answer(objectType)");
}
String subjectivityParentObjectType ="";
if(request.getParameter("answer(SubjectivityParentObjectType)")!=null){
	subjectivityParentObjectType = ""+request.getParameter("answer(SubjectivityParentObjectType)");
}
long policyId=0;
if(request.getParameter("answer(PolicyId)")!=null){
	policyId = Long.parseLong(""+request.getParameter("answer(PolicyId)"));
}
long policyVerId=0;
if(request.getParameter("answer(PolicyVerId)")!=null){
	policyVerId = Long.parseLong(""+request.getParameter("answer(PolicyVerId)"));
}
long count=1;
%>
<dmshtml:GetSubjectivityAttachmentList nameInSession='Attached' policyId='<%=policyId%>' policyVerId='<%=policyVerId%>'  parentObjectType='<%=subjectivityParentObjectType%>' parentQuoteVerId='<%=parentQuoteVerId%>' subQuoteVerId='<%=subQuoteVerId%>' objectId='<%=objectId%>' ownerId='<%=ownerId%>' attachedFor='<%=new String[]{"All","Subjectivity"}%>' DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<logic:present name='Attached' scope='request'>
<logic:iterate id='Attached' name='Attached'>
<bean:define name='Attached' property='Object::Attachment::FileName' id="fileName" />
<bean:define name='Attached' property='Object::Attachment::CreatedDate' id="createdDate" />
<bean:define id="attachmentUrl" name="Attached" property="Object::Attachment::AttachmentUrl"  />
<bean:define id="attachmentType" name="Attached" property="Object::Attachment::AttachmentType" />
<bean:define id="fileName" name="Attached" property="Object::Attachment::FileName" />
<%
String fileName1 = (""+fileName).substring(20, (""+fileName).length());
String createdDate1 = (""+createdDate).substring(0,(""+createdDate).indexOf(" "));
%>
____~____*<%=""+count %>____~____*<bean:write name='Attached' property='Object::Attachment::AttachmentName'/>____~____*<bean:write name='Attached' property='Object::Attachment::AttachmentDesc'/>____~____*<%=""+fileName1 %>____~____*<bean:write name='Attached' property='Object::Attachment::CreatedBy'/>____~____*<%=""+createdDate1 %>____~____*<bean:write name='Attached' property='Object::Attachment::ApprovalStatus'/>____~____*<%=""+attachmentUrl%>____~____*<%=""+attachmentType%>____~____*<%=""+fileName%>____~____*<bean:write name="Attached" property="Object::Attachment::AttachmentId" />____~____*<bean:write name="Attached" property="Object::Attachment::AttachedFor" /><%="\n"%>
<%count++; %>
</logic:iterate>
</logic:present>