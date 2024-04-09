<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%
	if(session.getAttribute("Tab_UI_View").equals("UI_3.1")) {
%>
		 <jsp:include page="/template/PopupTemplate_3_1.jsp" />
<%
	} else {
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%
response.setHeader("Pragma", "public");
 response.setHeader("Cache-Control", "max-age=0");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
<bean:define id="pageTitle" property="answer(Page::Title)" name="LoginPage" scope="session" type="java.lang.String"/>
<%String popUpWindowName = "";
  if(request.getParameter("PopupWindowName") != null){
	  popUpWindowName = ""+request.getParameter("PopupWindowName");
  }

%>
<head>
<title><%=""+pageTitle%> - <%=""+popUpWindowName %></title>

<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<link rel="stylesheet" type="text/css" href="../styles/ui3.0/style.css" />
<html:base />
</head>
<logic:notPresent name="userObjDesc" scope="session">
	<jsp:forward page="./Default.jsp" />
</logic:notPresent>
<logic:present name="userLog" scope="session">
	<%
((com.dms.web.userlog.UserLog)session.getAttribute("userLog")).setLastAccessedTime(session.getLastAccessedTime());

%>
</logic:present>

<body style="margin: 0">
<!-- body table begins-->
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table  width="100%" align="left" border="0" cellspacing="0" cellpadding="0" style="height: 100%">
<!-- header row begins -->

<%
	String PageLogo="";
	PageLogo=(String)session.getAttribute("PageLogo");
%><!--

	<tr>
		<td width="50px" align="left" height="1%"><IMG SRC="<%=PageLogo%>" WIDTH="120" HEIGHT="60" BORDER="0" ALT="">
</td>
	</tr>
	
	-->
			<tr>
				<td width="200px" align="center" height="1%"  valign="middle"><IMG SRC="../Images/liu.jpg" BORDER="0" ALT=""></td>
			</tr>
	


<!-- header row ends, welcome row begins -->
<tr>
	<td  class="username" bgcolor="#336699" height="15px" align="right" colspan="3">
	<bean:message key="GeneralTemplate.welcome" />&nbsp;
	<logic:present name="LoginPage" scope="session">
						<bean:define id="ObjectId"
							property="answer(Object::UserDetail::PrimaryObjectId)"
							name="LoginPage" scope="session" />
						<bean:define id="ObjectType"
							property="answer(Object::UserDetail::PrimaryObjectType)"
							name="LoginPage" scope="session" />
		
						<bean:define id="userId"
							property="answer(Object::UserDetail::userName)" name="LoginPage"
							scope="session" />
		
						<bean:define id="fname"
							property="answer(Object::UserDetail::UserFirstName)"
							name="LoginPage" scope="session" />
						<bean:define id="lname"
							property="answer(Object::UserDetail::UserLastName)" name="LoginPage"
							scope="session" />
		
						<%
						if (fname == null && lname == null || fname.equals("") && lname.equals("")) {
						%>
		
						<bean:write property="answer(Object::UserDetail::userName)"
							name="LoginPage" />
						<%
						} else {
						%>
		

						<bean:write  property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" />
						<%=" "%>

						<bean:write property="answer(Object::UserDetail::UserLastName)" name="LoginPage" />
		
						<%
						}
						%>
		
		
		
						&nbsp;&nbsp;&nbsp;&nbsp;
					</logic:present>
	</td>
</tr>
<!-- welcome row ends, body starts -->
<tr>
	<td valign="top"><template:get name='GeneralBody'/></td>
</tr>
<!-- body ends, footer line begins -->
<tr>
	<td colspan="3" bgcolor="#999999" height="2px"></td>
</tr>
<!-- footer line ends, footer begins -->
<tr>
	<td align="center" height="20px">
		<table border="0" cellpadding="1" cellspacing="1" style="height: 100%" width="100%">
		<tr>
			<td><img src="../Images/Poweredby.gif" alt="Powered By Solartis"></td>
			<td align="center" class="PageFooter"><bean:message key="logon.copyright" /></td>
			<td><div class="footerLegal right"><FONT SIZE="1" ><bean:message key="Release.Number" /></FONT></div></td>
		</tr>
		</table></td>
</tr>
<!-- footer ends -->
</table>
</body>
</html:html>
<% } %>

<script type="text/javascript">

/*
 * forwardToLoginPageIfInvalidSession is used to forward to Login Page, during following four places, if session is expired
 * Ajax.Request, Ajax.Updater, XMLHttpRequest(createXMLHttpRequest methods) and while using Datatable(via Ajax calls)
 * Created by Rajeshkumar P on 08-November-2011 for Bug# 16558
 */
function forwardToLoginPageIfInvalidSession(ajaxResponseText) {

	var returnValue = 0;
	var searchText = "<";
	searchText = searchText + "!-- forwardToLoginPageIfInvalidSession --";
	//starsWith is a function written in Common.js
	if(ajaxResponseText.startsWith(searchText)) {
		document.location = "<%= "https://"+ request.getServerName() %>";
		returnValue = 1;
	} else if(ajaxResponseText.indexOf(searchText) > 0) {
		document.location = "<%= "https://"+ request.getServerName() %>";
		returnValue = 1;
	}
	return returnValue;
}

/*
 * checkForInvalidSessionCloseAndForward is used to check for invalid session in pop ups's and if yes, close them and redirect the parent to Login page
 * closePopUp is used to close the pop up, if it is in Valid session and its value is "Y".
 * @author Rajeshkumar P
 * Created on 05-January-2012 for Bug# 16558
 */
function checkForInvalidSessionCloseAndForward(closePopUp) {

	var isInvalidSession = 0;
	var url = "../common/CheckForSessionExpired.jsp";
	new Ajax.Request(url, {method: 'post',asynchronous:true,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
			isInvalidSession = forwardToLoginPageIfInvalidSession(transport.responseText);
			if(isInvalidSession == 1) {
				window.close();
				window.opener.document.location.href = "<%= "https://"+ request.getServerName() %>";
		 	} else if(closePopUp == 'Y') {
		 		window.close();
		 	}
		},
		onSuccess: function(transport){}});
}
</script>