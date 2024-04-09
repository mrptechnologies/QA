<% 
/**
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
 */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>

<%
/**
 * Here the template is set to Popup or General based on the valued IsPopupEnabledAgencyFind
 * If IsPopupEnabledAgencyFind is true, Popup Template is set otherwise General Template.
 * IsPopupEnabledAgencyFind can come through attribute or parameter. 
*/
%>
<%
String templateName = "/template/GeneralTemplate.jsp";
String attIsPopupEnabledAgencyFind=""+request.getAttribute("answer(IsPopupEnabledAgencyFind)");
String paraIsPopupEnabledAgencyFind=""+request.getParameter("answer(IsPopupEnabledAgencyFind)");
if(attIsPopupEnabledAgencyFind!=null?attIsPopupEnabledAgencyFind.equals("true"):false){
	templateName = "/template/PopupTemplate.jsp";
}else if(paraIsPopupEnabledAgencyFind!=null?paraIsPopupEnabledAgencyFind.equals("true"):false){
	templateName = "/template/PopupTemplate.jsp"; 
}
%> 
<template:insert template='<%=templateName%>'> 
<template:put name='image1' content='/common/image1.jsp' />
<template:put name='image2' content='/common/image2.jsp' />
<template:put name='LeftMenuAdmin' content='/common/Admin_Menu.jsp' /> 
<template:put name='GeneralBody' content='/customer/AgentSearchResultInsuredBody.jsp' /> 
<template:put name='rightImage' content='/common/rightImage.jsp' /> 
</template:insert>
