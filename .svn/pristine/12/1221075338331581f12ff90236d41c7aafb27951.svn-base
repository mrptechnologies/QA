<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<%response.setHeader("Cache-Control", "no-store");%>



<%String objId =""+request.getParameter("answer(ObjectId)");

String OwnerId =""+request.getParameter("answer(OwnerId)");

String objType =""+request.getParameter("answer(ObjectType)");

System.out.println("objId "+objId+" OwnerId"+OwnerId+" objType"+objType);

long count=1;
%>
<%boolean EmailViewPrevilegeAvail=false; %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="true">
		<% EmailViewPrevilegeAvail=true; %>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="false">
			<% EmailViewPrevilegeAvail=false; %>
</dmshtml:dms_static_with_connector>
 
	
<dmshtml:GetSentEmailList nameInSession="EmailList" objectId='<%=Long.parseLong(objId.toString())%>' ownerId='<%=Long.parseLong(OwnerId.toString())%>' objectType='<%=""+objType %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />

<%String EmailType="";
boolean isEndorsementQuote=false;

String QuoteStatus="";

if( request.getParameter("answer(isEndorsementQuote)")!=null && request.getParameter("answer(isEndorsementQuote)").equalsIgnoreCase("true")){
	isEndorsementQuote=true;
}
if( request.getParameter("answer(QuoteStatus)")!=null){
	QuoteStatus=request.getParameter("answer(QuoteStatus)");
}

if(isEndorsementQuote){
	if(QuoteStatus=="Issued"){
				EmailType="POLICY";
			}else if(QuoteStatus=="Offered" || QuoteStatus=="Bind Request"){
				EmailType="QUOTE";
			}else if(QuoteStatus=="Bound"){
				EmailType="BINDER";
			}else{
				EmailType="CORRESP";
			}
	}else{
		EmailType="ENDORS";
	} %>

<logic:present name='EmailList' scope='request'>
<logic:iterate id='EmailList' name='EmailList'>
<bean:define name='EmailList' property='Object::Notification::Email::SentDateBegin' id="sentDate"/>

<%String createdDate1 = (""+sentDate).substring(0,10); %>
<%if (EmailViewPrevilegeAvail) {%>
<%=""+count %>____~____*<bean:write name='EmailList' property='Object::Notification::Email::ToAddress'/>____~____*<a href="../EmailReSend.do?answer(Object::Notification::Email::FromAddress)=<bean:write name='EmailList' property='Object::Notification::Email::FromAddress'/>&answer(Object::Notification::Email::ToAddress)=<bean:write name='EmailList' property='Object::Notification::Email::ToAddress'/>&answer(Object::Notification::Email::ObjectId)=<%=objId%>&answer(Object::Notification::Email::ObjectVerId)=<bean:write name='EmailList' property='Object::Notification::Email::ObjectVerId'/>&answer(Object::Notification::Email::ObjectType)=<%=objType%>&answer(Object::Notification::Email::NotificationType)=EMAIL&answer(Object::Notification::Email::NotificationId)=<bean:write name='EmailList' property='Object::Notification::Email::NotificationId'/>&answer(Object::Notification::Email::QuoteNumber)=<bean:write name='EmailList' property='Object::Notification::Email::QuoteNum'/>&answer(Object::Notification::Email::QuoteSubNumber)=<bean:write name='EmailList' property='Object::Notification::Email::QuoteSubNum'/>&answer(Object::Notification::Email::PolicyNumber)=<bean:write name='EmailList' property='Object::Notification::Email::PolicyNumber'/>&answer(Object::Notification::Email::EmailType)=<%=EmailType%>&answer(Object::UserDetail::ownerId)=<%=OwnerId%>" onClick="return EmailPopup(this, 'Email');" class="plainlink" title="Email"><bean:write name='EmailList' property='Object::Notification::Email::EmailSubject' filter="false"/></a>____~____*<bean:write name='EmailList' property='Object::Notification::Email::SendStatus'/>____~____*<bean:write name='EmailList' property="Object::Notification::Email::FromAddress" /> ____~____*<%=""+createdDate1 %>____~____*<bean:write name='EmailList' property='Object::Notification::Email::FromAddress'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::ObjectVerId'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::NotificationId'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::QuoteStatus'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::QuoteNum'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::QuoteSubNum'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::PolicyNumber'/> ___~___*   
<%}else{%>
<%=""+count %>____~____*<bean:write name='EmailList' property='Object::Notification::Email::ToAddress'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::EmailSubject' filter="false"/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::SendStatus'/>____~____*<bean:write name='EmailList' property="Object::Notification::Email::FromAddress" /> ____~____*<%=""+createdDate1 %>____~____*<bean:write name='EmailList' property='Object::Notification::Email::FromAddress'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::ObjectVerId'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::NotificationId'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::QuoteStatus'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::QuoteNum'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::QuoteSubNum'/>____~____*<bean:write name='EmailList' property='Object::Notification::Email::PolicyNumber'/> ___~___*
<%} %>
<%count++; %>


</logic:iterate>


</logic:present>


