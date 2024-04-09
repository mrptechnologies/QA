
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%String objectId =""+request.getParameter("ObjectId");
String OwnerId =""+request.getParameter("OwnerId");
String objectType =""+request.getParameter("ObjectType");
String RoleId =""+request.getParameter("RoleId");
String approvalStatus1 = "";
if(request.getParameter("approvalStatus")!=null){
	approvalStatus1 = ""+request.getParameter("approvalStatus");
}
%>

<dmshtml:GetListNotes nameInSession='Notes' objectId='<%=Long.parseLong(objectId.toString())%>' ownerId='<%=Long.parseLong(OwnerId.toString())%>' objectType='<%=""+objectType %>' DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />

 <logic:present name='Notes' scope='request'>
 <%int node=0;
 %>
 <logic:iterate id='Notes' name='Notes'>

 <%++node;%>
 <table width=780>
    <tr>
      <td width=48%>
             &nbsp;
                <a href='javascript:void(0);'onclick=showNotes('div<%=node%>','img<%=node%>')>
                                         <img src=/Images/add_bttn.gif id='img<%=node%>' border='0'>
                                           <bean:write name='Notes' property='Object::Notes::Description'/>
      
                                     </a>
	</td>
	
       <td width=1%>

           <bean:define id="mPrivate" name="Notes" property="Object::Notes::Private" />
	      <%String isPrivate = (String)mPrivate;
	     if(isPrivate.equals("Y"))
	     {
	        out.println("<img src=/Images/red_flag_icon.jpg>");
	      }%>
	 </td>
 
    <td width=7%>
          <bean:write name='Notes' property='Object::Notes::UserName'/>
     </td>
    <td width=20%>
           &nbsp;&nbsp;<bean:write name='Notes' property='Object::Notes::CreatedDate'/>
     </td>
   <td width=6%>
         <bean:write name='Notes' property='Object::Notes::ClientAddress'/>
    </td>
   <td width=6%>
         <bean:write name='Notes' property='Object::ServerIP'/>
    </td>
   
   <bean:define id="notesId" name="Notes" property="Object::Notes::NotesId" />   
   <% if(approvalStatus1.equalsIgnoreCase("YES")){ %>
   <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_ATTACHMENT_STATUS"}%>' connector='or' negated="true">
   <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_ATTACHMENT_STATUS"}%>' connector='or' negated="true">
	<bean:define id="approvalStatus" name='Notes' property='Object::Notes::ApprovalStatus'/>
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
	<input type="radio" value="Accepted" <%=""+statusAccepted %> onclick="updateNotesApprovalStatus('<%=notesId%>',this)" name='<%="answer(Object::Notes::ApprovalStatus"+node+")"%>'>Accepted
	</td>
	<td>
	<input type="radio" value="Rejected" <%=""+statusRejected %> onclick="updateNotesApprovalStatus('<%=notesId%>',this)" name="<%="answer(Object::Notes::ApprovalStatus"+node+")"%>">Rejected&nbsp;&nbsp;
	</td>
	</dmshtml:dms_static_with_connector>
	 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_ATTACHMENT_STATUS"}%>' connector='or' negated="flase">
	 <td class="FormLabels">
	<bean:write name='Notes' property='Object::Notes::ApprovalStatus'/>&nbsp;&nbsp;
	 </td>
	 </dmshtml:dms_static_with_connector>
	 </dmshtml:dms_static_with_connector>
	 <%} %>
  <td width=8%>
  
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"NOTES_DELETE"}%>' connector='or' negated="true">
	 <a href='javascript:void(0);' onclick="deleteNotes('<%=notesId%>')"><img src=/Images/recycle.jpg border="0" width="10" height="10"></img>Delete</a> 
</dmshtml:dms_static_with_connector>
 
 </td>

 </tr> 
 </table>
 
 
 <div id='div<%=node%>' style='display: none; '>

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name='Notes' property='Object::Notes::Notes'filter="false"/> 
 </div>
 

 </logic:iterate>
 </logic:present>
