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

<html>
<head>
<title></title>
</head>

<body>

<%String objId =""+request.getParameter("ObjectId");
String OwnerId =""+request.getParameter("OwnerId");
String objType =""+request.getParameter("ObjectType");
String RoleId =""+request.getParameter("RoleId");
String ObjectVerId =""+request.getParameter("ObjectVerId");

String QuoteStatus =""+request.getParameter("QuoteStatus");
String QuoteNumber =""+request.getParameter("QuoteNumber");
String QuoteSubNumber =""+request.getParameter("QuoteSubNumber");
String PolicyNumber =""+request.getParameter("PolicyNumber");
String EmailType = ""+request.getParameter("EmailType");
%>


<dmshtml:GetSentEmailList nameInSession="EmailList" objectId='<%=Long.parseLong(objId.toString())%>' ownerId='<%=Long.parseLong(OwnerId.toString())%>' objectType='<%=""+objType %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<%boolean isEnabled=true; %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_SENT_EMAILS_QUOTE"}%>' connector='or' negated="true">
		<%isEnabled=false;%>
	</dmshtml:dms_static_with_connector>

 <logic:present name='EmailList' scope='request'>
 <%int node=0;
 %>
 <logic:iterate id='EmailList' name='EmailList'>
	<table width="900px" >
	<%++node;%>
		<tr>
			<td>
				&nbsp;
			</td>
	 	    <td width="30%">
			 	<a  onclick=showSentEmail('SentEmaildiv<%=node%>','SentEmailimg<%=node%>')><img src="../Images/add_bttn.gif" id='SentEmailimg<%=node%>' border="0" ><font color="blue">&nbsp;<bean:write name='EmailList' property='Object::Notification::Email::ToAddress'/></font></a>
			</td>
		
			<td width="30%">
			<a href="../EmailReSend.do?							
				answer(Object::Notification::Email::FromAddress)=<bean:write name='EmailList' property='Object::Notification::Email::FromAddress'/>
				&answer(Object::Notification::Email::ToAddress)=<bean:write name='EmailList' property='Object::Notification::Email::ToAddress'/>
				&answer(Object::Notification::Email::ObjectId)=<bean:write name='EmailList' property='Object::Notification::Email::ObjectId'/>
				&answer(Object::Notification::Email::ObjectVerId)=<bean:write name='EmailList' property='Object::Notification::Email::ObjectVerId'/>
				&answer(Object::Notification::Email::ObjectType)=<bean:write name='EmailList' property='Object::Notification::Email::ObjectType'/>
				&answer(Object::Notification::Email::NotificationType)=<%="EMAIL"%>
				&answer(Object::Notification::Email::NotificationId)=<bean:write name='EmailList' property='Object::Notification::Email::NotificationId'/>
				&answer(Object::Notification::Email::QuoteStatus)=<%=QuoteStatus%>
				&answer(Object::Notification::Email::QuoteNumber)=<%=QuoteNumber%>
				&answer(Object::Notification::Email::QuoteSubNumber)=<%=QuoteSubNumber%>
				&answer(Object::Notification::Email::PolicyNumber)=<%=PolicyNumber%>
				&answer(Object::Notification::Email::EmailType)=<%=""+EmailType%>				
				&answer(Object::UserDetail::ownerId)=<%=""+OwnerId %>" title="Email" onClick="return EmailPopup(this, 'Email');" />
				<bean:write name='EmailList' property='Object::Notification::Email::EmailSubject'/> </a>   
			</td>
			<td width="10%">
				 <bean:write name='EmailList' property='Object::Notification::Email::SendStatus'/>
			</td>

			<td width="25%">
				 <bean:write name='EmailList' property='Object::Notification::Email::SentDateBegin'/>
			</td>
			
		</tr>
	</table>	
	
	<div id='SentEmaildiv<%=node%>' style='display: none; '>
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name='EmailList' property='Object::Notification::Email::EmailMessage'filter="false"/> 
 	</div>
 
 </logic:iterate>
 </logic:present>
</body>
</html>
