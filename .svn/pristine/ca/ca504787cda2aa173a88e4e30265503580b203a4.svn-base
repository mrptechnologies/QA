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

<%
String objId =""+request.getParameter("ObjectId");
String OwnerId =""+request.getParameter("OwnerId");
%>

<dmshtml:GetSentEmailListCount  nameInSession='EmailListCount' objectId='<%=Long.parseLong(objId.toString())%>' ownerId='<%=Long.parseLong(OwnerId.toString())%>'  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
 
<% String count=""+request.getAttribute("count");
%>
<font color="blue">(<%=count%>)</font>
</body>
</html>
