<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/SearchGeneralAgentsForUser.do" >

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		
	    <tr><td>&nbsp;</td></tr>
		
		<tr><td class="MH">FIND GENERAL AGENT</td></tr>
		<tr><td><hr size="1" noshade></td></tr>
		<tr><td>
<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

<tr><td class="sectionhead" colspan ="2" align="center" >GENERAL AGENT DETAILS 	</td></tr>
		    <tr><td>&nbsp;</td></tr>
	<tr>
		<td width="40%" align="right" class="FormLabels">
		First Name
		</td> 
		<td align="left" ><html:text  property="answer(Entity::Like::FirstName)" styleClass="txtbox"/></td>

	</tr>	
	
	<tr>
		<td width="40%" align="right" class="FormLabels">
		Last Name
		</td> 
		<td align="left" ><html:text  property="answer(Entity::Like::LastName)" styleClass="txtbox"/></td>

	</tr>	
	
	
	 

	
	 <tr><td>&nbsp;</td></tr>


<tr>
		<td colspan="2" align="center" >
		<html:submit value="Find" property="Search" styleClass="sbttn" />
		&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
</tr>
</table>	
<tr><td><hr size="1" noshade></td></tr></table>



<html:hidden property="entityType" value="%AGENT" />
<html:hidden property="answer(Entity::Equals::EntityType)" value="%AGENT" />
<html:hidden property="answer(Entity::Equals::SearchObjectType)" value="GENERAL_AGENCY" />
<html:hidden property="answer(Entity::Equals::SearchObjectId)" value="" />
<html:hidden property="LimitSearch" value="yes" />
<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />
<html:hidden property="answer(Object::Entity::PageNum)" value="0"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>