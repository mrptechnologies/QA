<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:html>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="../Scripts/JScripts/LinkProductToObject.js"></SCRIPT>
<head>
<title><%=session.getAttribute("PageTitle")%> - Link State To Product</title>

</head>
<html:form action="/LinkStateToProduct">
<body leftmargin="0" topmargin="0" rightmargin="0">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<%if(request.getParameter("answer(Object::Product::ProductId)")!= null) {%>
	<html:hidden property="answer(Object::Product::ProductId)" value="<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>" />
<%
}
%>
<%if(request.getParameter("answer(Object::Product::State)")!= null) {%>
	<html:hidden property="answer(Object::Product::State)" value="<%=request.getParameter("answer(Object::Product::State)").toString()%>" />

<%
}
%>
<%if(request.getParameter("answer(Object::Product::ProductVerId)")!= null) {%>
	<html:hidden property="answer(Object::Product::CurrentVerId)" value="<%=request.getParameter("answer(Object::Product::ProductVerId)").toString()%>" />

<%
}
%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" /> 

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
LINK TO STATES 
</td></tr>
<tr><td class="TextMatter">
Use this page to link states to product
<br>
</td></tr>
<tr><td><hr size="1" noshade ></td><tr>

<tr><td>&nbsp;</td></tr>

<tr>

<td class="FormLabels" align="left"></td></tr>
<tr><td>
<table WIDTH="550px" ALIGN="left" cellspacing=0 cellpadding="2" border="0">

	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
	<td class="links"><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">&nbsp;&nbsp;
			<a href ="../product/LinkStateToProductOptions.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>&answer(Object::Product::ProductVerId)=<%=request.getParameter("answer(Object::Product::ProductVerId)").toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>
			&answer(Object::Product::State)=<%=request.getParameter("answer(Object::Product::State)").toString()%>" >
			Link State To Option</a></td>
</TR>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr>
			<td class="links"><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">&nbsp;&nbsp;
			<a href ="../product/LinkStateToProductFeatures.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Product::ProductId)=<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>&answer(Object::Product::ProductVerId)=<%=request.getParameter("answer(Object::Product::ProductVerId)").toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>
			&answer(Object::Product::State)=<%=request.getParameter("answer(Object::Product::State)").toString()%>" >
			Link State To Features</a></td>
</TR>
<tr><td></td></tr>
<tr><td></td></tr>
</table>
</td></tr>
	<tr>
	<td><hr size="1" noshade width="95%"></td>
	</tr>
	<tr><td >&nbsp;</td></tr>

</table>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />

<html:hidden property="answer(Object::Entity::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(objectType)" value="State" />
</html:form>
</body>
</html:html>
