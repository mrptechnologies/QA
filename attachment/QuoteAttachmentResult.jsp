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
long ownerId = 0;
if(request.getParameter("answer(OwnerId)")!=null){
	ownerId = Long.parseLong(""+request.getParameter("answer(OwnerId)"));
}
String objectType ="";
if(request.getParameter("answer(objectType)")!=null){
	objectType = ""+request.getParameter("answer(objectType)");
}
long count=1;
%>
<dmshtml:GetAttachedList nameInSession='Attached'  objectId='<%=objectId%>' ownerId='<%=ownerId%>' objectType='<%=""+objectType%>' DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
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



<%=""+count %>____~____*<bean:write name='Attached' property='Object::Attachment::AttachmentName'/>____~____*<bean:write name='Attached' property='Object::Attachment::AttachmentDesc'/>____~____*<a href='../DisplayAttachment.do?attachmentUrl=<%=attachmentUrl%>&attachmentType=<%=attachmentType%>&fileName=<%=fileName1%>&disposition=inline' target='new' class='plainlink''><%=""+fileName1 %></a>____~____*<bean:write name='Attached' property='Object::Attachment::CreatedBy'/>____~____*<%=""+createdDate1 %>____~____*delete____~____*<%=""+attachmentUrl%>____~____*<%=""+attachmentType%>____~____*<%=""+fileName%>____~____*<bean:write name="Attached" property="Object::Attachment::AttachmentId" /><%="\n"%>
<%count++; %>
</logic:iterate>
</logic:present>
