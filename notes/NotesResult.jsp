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
<dmshtml:GetListNotes nameInSession='Notes' objectId='<%=objectId%>' ownerId='<%=ownerId%>' objectType='<%=""+objectType %>' DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<logic:present name='Notes' scope='request'>
<logic:iterate id='Notes' name='Notes'>
<bean:define name='Notes' property='Object::Notes::CreatedDate' id="createdDate"/>
<%String createdDate1 = (""+createdDate).substring(0,(""+createdDate).indexOf(" ")); %>
<%if(!objectType.equalsIgnoreCase("QUOTE")){%>____~____*<%}%><%=""+count %>____~____*<bean:write name='Notes' property='Object::Notes::Description'/>____~____*<bean:write name='Notes' property='Object::Notes::Notes'filter="false"/>____~____*<bean:write name='Notes' property='Object::Notes::UserName'/>____~____*<%=""+createdDate1 %>____~____*<bean:write name='Notes' property='Object::Notes::ApprovalStatus'/>____~____*<bean:write name='Notes' property="Object::Notes::NotesId" />___~___*   
<% count++; %>
</logic:iterate>
</logic:present>