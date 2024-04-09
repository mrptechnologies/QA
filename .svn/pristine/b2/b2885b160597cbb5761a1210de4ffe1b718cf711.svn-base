<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

   
<%String objId =""+request.getParameter("ObjectId");
String objVerId =""+request.getParameter("ObjectVerId");
String OwnerId =""+request.getParameter("OwnerId");
String objectType=""+request.getParameter("ObjectType");

%>
<dmshtml:GetNotesCount  nameInSession='NotesCount' objectId='<%=Long.parseLong(objId.toString())%>' objectVerId='<%=Long.parseLong(objVerId.toString())%>' objectType='<%=""+objectType%>' ownerId='<%=Long.parseLong(OwnerId.toString())%>'  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
 
<% String count=""+request.getAttribute("DiaryCount");

%>
<font color="blue">(&nbsp;<%=count %>&nbsp;)</font>
