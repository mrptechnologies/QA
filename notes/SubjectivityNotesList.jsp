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
long parentQuoteVerId=0;
if(request.getParameter("answer(ParentQuoteVerId)")!=null){
	parentQuoteVerId = Long.parseLong(""+request.getParameter("answer(ParentQuoteVerId)"));
}
long subQuoteVerId=0;
if(request.getParameter("answer(SubQuoteVerId)")!=null){
	subQuoteVerId = Long.parseLong(""+request.getParameter("answer(SubQuoteVerId)"));
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
<dmshtml:GetSubjectivityNotesList nameInSession='Notes' policyId='<%=policyId%>' policyVerId='<%=policyVerId%>' parentObjectType='<%=subjectivityParentObjectType%>' parentQuoteVerId='<%=parentQuoteVerId%>' subQuoteVerId='<%=subQuoteVerId%>' addedFor='<%=new String[]{"All","Subjectivity"}%>' objectId='<%=objectId%>' ownerId='<%=ownerId%>' objectType='<%=""+objectType %>' DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<logic:present name='Notes' scope='request'>
<logic:iterate id='Notes' name='Notes'>
<bean:define name='Notes' property='Object::Notes::CreatedDate' id="createdDate"/>
<%String createdDate1 = (""+createdDate).substring(0,(""+createdDate).indexOf(" ")); %>
____~____*<%=""+count %>____~____*<bean:write name='Notes' property='Object::Notes::Description'/>____~____*<bean:write name='Notes' property='Object::Notes::Notes'filter="false"/>____~____*<bean:write name='Notes' property='Object::Notes::UserName'/>____~____*<%=""+createdDate1 %>____~____*<bean:write name='Notes' property='Object::Notes::ApprovalStatus'/>____~____*<bean:write name='Notes' property="Object::Notes::NotesId" />____~____*<bean:write name='Notes' property="Object::Notes::AddedFor" />___~___*
<% count++; %>
</logic:iterate>
</logic:present>