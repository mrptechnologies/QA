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

<style>
        #popupContainer
        {
           float:left;
           width:683px;
        }
       	.popupTop
	{
	   float:left;
	   width:683px;
	   height:128px;
	   background:url(../Images/popup_top_new.jpg) no-repeat;
	}
	.popupBody
	{
	  float:left;
	  width:683px;
	  background:rgb(158,164,177);
	}
	.popupBottom
	{
	  float:left;
	  width:683px;
	  height:38px;
	  margin:0 0 0 1px;
	  background:url(../Images/popup_bottom_new.jpg) no-repeat;
	}
	.popupBodyBg
	{
	  float:left;
	  width:683px;
	  background:url(../Images/popup_left_new.jpg) repeat-x;
	}
	.popupMain
	{
	   float:left;
	   margin:0 0 0 20px;
	   width:650px;
	   background:#ffffff;
	}
	.popupFooter
	{
	  float:left;
	  height:26px;
	  background:url("../Images/Poweredby.gif") no-repeat;
	}
	.popupFooter p
	{
	  float:left; text-align:center; font-family: Arial, MS Sans Serif, Verdana; font-size: 8pt;	color:#757575; margin-top:5px;
	}
	
</style>
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
<div id="popupContainer">
<div class="popupTop"></div>

<div class="popupBody">
  <div class="popupBodyBg">
      <div class="popupMain">
  		<template:get name='GeneralBody'/>
  	  </div>
  </div>
</div>
<div class="popupBottom"></div>

<div class="popupFooter">
			<div style="margin: 0 0 0 200px" id="">Powered by Solartis Inc. All Rights Reserved.</div>
</div>
</div>
</body>
</html:html>

<script type="text/javascript">

/*
 * forwardToLoginPageIfInvalidSession is used to forward to Login Page, during following three places, if session is expired
 * Ajax.Request, Ajax.Updater and while using Datatable(via Ajax calls)
 * Created by rajeshkumar_p@solartis.net on 08-November-2011 for Bug# 16558
 */
function forwardToLoginPageIfInvalidSession(ajaxResponseText) {

	var searchText = "<";
	searchText = searchText + "!-- forwardToLoginPageIfInvalidSession --";
	//starsWith is a function written in Common.js
	if(ajaxResponseText.startsWith(searchText)) {
		document.location = "<%= "https://"+ request.getServerName() %>";
	}
}
</script>