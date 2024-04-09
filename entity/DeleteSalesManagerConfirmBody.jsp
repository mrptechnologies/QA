
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:html>

<head>
<title><%=session.getAttribute("PageTitle")%></title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
</head>
<body leftmargin="0" rightmargin="0" topmargin="0">
<html:form action="/SalesManagerDeleteAction">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td >&nbsp;</td></tr>
<tr><td class="MH">DELETE CONFIRMATION - SALES MANAGER</td></tr>
<tr><td><hr size="1" noshade ></td><tr>

<tr>
<td valign="top">
	<table WIDTH="550px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td  align="left" class="TextMatter">Do you wish to delete the selected sales manager/s?</td>
	</tr>
	<tr><td >&nbsp;</td></tr>

	<tr>
	  <td align="center">
			<html:submit value="Yes" styleClass="sbttn"/>&nbsp;&nbsp;
			<html:reset value="Cancel" onclick="javascript:history.go(-1);" styleClass="sbttn"/>
	 </td>
	</tr>
</table>

		</td>
	</tr>

</table>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id='test' name="FindSalesManager"  property="answer(Entity::Like::EntityType)" />
<%
System.out.println("test-->"+test);
%>

<html:hidden property="answer(entityType)" value='<%=""+test%>' />
<html:hidden property="answer(objectType)" value="ENTITY" />






<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />



<input type="hidden" name="objectType" value="ENTITY"/>
<input type="hidden" name="entityType" value='<%=""+test%>'/>

<html:hidden property="LimitSearch" value="yes" />
<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />
<html:hidden property="answer(Object::Entity::PageNum)" value="0" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>

</body>
</html:html>
