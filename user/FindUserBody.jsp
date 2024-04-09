<%/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/FindAUser.do" >

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		
	    <tr><td>&nbsp;</td></tr>
		
		<tr><td class="NewSectionHead" colspan="4" align="center">FIND USER</td></tr>
		<tr><td><hr size="1" noshade></td></tr>
		<tr><td>
<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

<tr><td class="sectionhead" colspan ="2" align="center" >USER DETAILS 	</td></tr>
		    <tr><td>&nbsp;</td></tr>
	<tr>
		<td width="40%" align="right" class="FormLabels">
		User Name
		</td> 
		<td align="left"><html:text  property="answer(Object::UserDetail::Like::userName)" styleClass="txtbox"/></td>

	</tr>	

	<tr>
		<td class="FormLabels" align="right" width="20%"><bean:message key="UserAccounts.UserType"/>*</td>
		<td class="links">
		<dmshtml:dms_roles nameInSession="arrUserRolesAndDesc" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" ordinalValue="<%=(Long)session.getAttribute("ordinalValue")%>"/>	
		<html:select property="answer(Object::UserDetail::Equals::primaryRoleId)" styleId="roleId" onchange="return submitSelectUserType()">
		<html:option value ="select">Select</html:option>

<logic:present name ='arrUserRolesAndDesc' scope ='session'>

<logic:iterate id="arrUserRolesAndDesc" name="arrUserRolesAndDesc" scope="session" >
<bean:define id='roleName' name="arrUserRolesAndDesc"  property="roleName" />   
<bean:define id='roleId' name="arrUserRolesAndDesc"  property="id" />
<html:option value ='<%=roleId.toString()%>'  >
		<bean:write name="arrUserRolesAndDesc" property="desc" />
		</html:option>
		</logic:iterate>
		</logic:present>
		</html:select>
	</td>
</tr>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
	connector='or' negated="true">
	<tr>
		<td width="40%" align="right" class="FormLabels">
		Active
		</td> 
		<td align="left" >
			<html:select  property="answer(Object::UserDetail::Equals::active)">
				<html:option value="Y">Active</html:option>
				<html:option value="D">Deactive</html:option>
			</html:select></td>

	</tr>
	</dmshtml:dms_static_with_connector>	 

	
	 <tr><td>&nbsp;</td></tr>


<tr>
		<td colspan="2" align="center" >
		<html:submit value="Find" property="Search" styleClass="sbttn" />
		&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;</td>
</tr>
</table>	
<tr><td><hr size="1" noshade></td></tr></table>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ACCESS_ALL_USERS"}%>' connector='or' negated="true">
<html:hidden property="answer(Object::UserDetail::Like::createdBy)" value="%"/>
</dmshtml:dms_static_with_connector>
<html:hidden property="answer(Object::UserDetail::Equals::ownerId)" value="<%=""+ownerId %>" />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>