<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="objectId" name="ViewAttachment" property="answer(Object::AttachmentObjectLink::ObjectId)" scope="request" />
<bean:define id="ownerId" property="answer(Object::Owner::OwnerId)" name="ViewAttachment" scope="request" />
<bean:define id="objectType" property="answer(Object::AttachmentObjectLink::ObjectType)" name="ViewAttachment" scope="request" />
<bean:define id="objectVerId" property="answer(Object::AttachmentObjectLink::ObjectVerId)" name="ViewAttachment" scope="request" />
<bean:define id="roleId" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session"/>
 
<%
String approvalStatus1 = "";
if(request.getParameter("approvalStatus")!=null){
	approvalStatus1 = ""+request.getParameter("approvalStatus");
}
%>
<dmshtml:GetAttachedList nameInSession='Attached'  objectId='<%=Long.parseLong(objectId.toString())%>' ownerId='<%=Long.parseLong(ownerId.toString())%>' objectType='<%=""+objectType%>' DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />

 <logic:present name='Attached' scope='request'>
 <%int node=0;
 %>
 <logic:iterate id='Attached' name='Attached'>

 <%++node;%>
 <table width=840>
    <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
     <td width=320>
         <a href='javascript:void(0);' onclick=showView('divattach<%=node%>','imgAttach<%=node%>')>
          <img src=/Images/add_bttn.gif id='imgAttach<%=node%>' border='0'>
          <bean:write name='Attached' property='Object::Attachment::AttachmentName'/>
       </a> </td>
     
     
     
     
                         
<bean:define id="fileExt" name="Attached" property="Object::Attachment::AttachmentType"  />
<bean:define id="attachmentUrl" name="Attached" property="Object::Attachment::AttachmentUrl"  />
<bean:define id="attachmentType" name="Attached" property="Object::Attachment::AttachmentType" />
<bean:define id="fileName" name="Attached" property="Object::Attachment::FileName" />
 
 <td width=240>
   
   <a href="../DisplayAttachment.do?attachmentUrl=<%=attachmentUrl%>&attachmentType=<%=attachmentType%>&fileName=<%=fileName%>&disposition=inline"  target="_new" />

   <%
 
 
 %><bean:write name='Attached' property='Object::Attachment::FileName'filter="false"/> </a>
 </td>
 <td>&nbsp;</td>
<bean:define id="attachmentId" name="Attached" property="Object::Attachment::AttachmentId"  />
 <td width=4%>
 <bean:write name='Attached' property='Object::Attachment::CreatedBy'/>
</td>
<td width=18%>
 &nbsp;&nbsp;&nbsp;&nbsp;<bean:write name='Attached' property='Object::Attachment::CreatedDate'/>
 </td>
 <% if(approvalStatus1.equalsIgnoreCase("YES")){ %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_ATTACHMENT_STATUS"}%>' connector='or' negated="true">
 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_ATTACHMENT_STATUS"}%>' connector='or' negated="true">
<bean:define id="approvalStatus" name='Attached' property='Object::Attachment::ApprovalStatus'/>
<%
String statusAccepted="";
String statusRejected="";
if((""+approvalStatus).equalsIgnoreCase("Accepted")){
	statusAccepted = "CHECKED";
}else if((""+approvalStatus).equalsIgnoreCase("Rejected")) {
	statusRejected = "CHECKED";
}
%>
 <td>
<input type="radio" value="Accepted" <%=""+statusAccepted %> onclick="updateApprovalStatus('<%=attachmentId%>',this)" name='<%="answer(Object::Attachment::ApprovalStatus"+node+")"%>'>Accepted
</td>
<td>
<input type="radio" value="Rejected" <%=""+statusRejected %> onclick="updateApprovalStatus('<%=attachmentId%>',this)" name='<%="answer(Object::Attachment::ApprovalStatus"+node+")"%>'>Rejected&nbsp;&nbsp;
</td>
</dmshtml:dms_static_with_connector>
 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_ATTACHMENT_STATUS"}%>' connector='or' negated="flase">
 <td class="FormLabels">
<bean:write name='Attached' property='Object::Attachment::ApprovalStatus'/>&nbsp;&nbsp;
 </td>
 </dmshtml:dms_static_with_connector>
 </dmshtml:dms_static_with_connector>
 <%} %>
 <td width=11%>
 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ATTACHMENT_DELETE"}%>' connector='or' negated="true">
 <a  href='javascript:void(0);' onclick="deleteAttachment('<%=attachmentId%>')"><img src=/Images/recycle.jpg border='0'width="10" height="10"></img> Delete</a>
 </dmshtml:dms_static_with_connector>
 </td>
 </tr> 
 </table>
 
 
 <div id='divattach<%=node%>' style='display: none; '>

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <bean:write name='Attached' property='Object::Attachment::AttachmentDesc'filter="false"/> <br>
 
  
 </div>
 

 </logic:iterate>
 </logic:present>
