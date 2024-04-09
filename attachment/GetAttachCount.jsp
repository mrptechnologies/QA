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

<%String objectId =""+request.getParameter("ObjectId");
String objectVerId =""+request.getParameter("ObjectVerId");
String OwnerId =""+request.getParameter("OwnerId");
String objectType=""+request.getParameter("ObjectType");
%>
  <dmshtml:GetAttachedCount  nameInSession='AttachCount' objectId='<%=Long.parseLong(objectId.toString())%>' objectVerId='<%=Long.parseLong(objectVerId.toString())%>' objectType='<%=""+objectType%>' ownerId='<%=Long.parseLong(OwnerId.toString())%>'  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
 
<% String count=""+request.getAttribute("attachcount");

%>
<font color="blue">(&nbsp;<%=count %>&nbsp;)</font>
</body>
</html>
