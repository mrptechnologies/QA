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
<!--<html:html>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<head>
<title><%=session.getAttribute("PageTitle")%> - Agents List</title>

</head>
<body leftmargin="0" topmargin="0" rightmargin="0">-->
<html:form action="/DeleteEntitiesLinkToObjectAction">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
		AGENT AND AGENCIES
</td></tr>
<tr><td class="TextMatter">
<bean:message key="AgentsList.AModDesc"/>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>

<tr><td>&nbsp;</td></tr>

<tr><td>
<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2">
<dmshtml:Get_users_byRoleId nameInSession="arrAgents" roleId="10" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>" />

<tr><td class="Error"><logic:notPresent name ='arrAgents' scope ='session'>Currently no agents linked with agencies.
</logic:notPresent></td></tr>
<% int j=0; %>

<logic:present name ='arrAgents' scope ='session'>

 <logic:iterate id="arrAgents" name="arrAgents" scope="session" >

	   <bean:define id='test' name="arrAgents"  property="primaryObjectId" />
	  <dmshtml:Get_entity_link_object nameInSession="arrEntityLink" entityId="<%=test.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>" objectType="AGENCY"/>
	  <logic:present name="arrEntityLink" scope="Session">
 <logic:iterate id="arrEntityLink" name="arrEntityLink" scope="session">
	  <% j++; %>
	   </logic:iterate>
	  </logic:present>
 </logic:iterate>
 <%if(j==0){%>
  <tr><td class="Error">Currently no agents linked with agencies.
		</td></tr>
 <%}else{%>

<tr><td align="center" class="Error"><bean:message key="AgentsList.ExistingAgentsAndAgencies"/>
</td></tr>
<tr><td>
<table  WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2"> 
	<tr >
      <td class="display" width="40px">
      <bean:message key="GeneralAgencies.SlNo"/>
	  </td>
		<td class="display" width="200px">
		<bean:message key="AgentsList.AgentName" /></td>
		<td class="display" width="250px">
		Agency Name</td>
		<td class="display" width="50px">
		Select</td>
			
	  </tr>
	  <% int i=0; %>
	 
	  <logic:iterate id="arrAgents" name="arrAgents" scope="session" >

	   <bean:define id='test' name="arrAgents"  property="primaryObjectId" />
	  <dmshtml:Get_entity_link_object nameInSession="arrEntityLink" entityId="<%=test.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>" objectType="AGENCY"/>
	  <logic:present name="arrEntityLink" scope="Session">
	<tr>
		  <logic:iterate id="arrEntityLink" name="arrEntityLink" scope="session">
<bean:define id="objectDesc" name="arrEntityLink" type="com.dms.common.ObjectDescriptor"/>
<bean:define id="objectId" name="objectDesc" property="objectId"/>

		<td class="SearchResult">
		<% i++;%>
		<%= i %>
		</td>
		<td class="SearchResult">
			<!--a href="../agency/LinkAgentToAgencies.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&agentId=<bean:write name='arrAgents' property='id' />&entityId=<bean:write name='arrAgents' property='primaryObjectId'/>"--><!--bean:write name="arrAgents" property="id" /--><!--/a-->

			<bean:define id="eId" name="arrAgents" property="primaryObjectId"/>
<!---Test Code for displaying firstname and lastname -->

<dmshtml:get_entity nameInSession="entityDetail" entityId="<%=Long.parseLong(eId.toString())%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
<logic:present name="entityDetail" scope="session">
		<bean:define id="anEntityDetail" name="entityDetail"  type="com.dms.ejb.entity.DMSEntityDetail"/>
		<bean:write name="anEntityDetail" property="firstName"/>
		&nbsp;	<bean:write name="anEntityDetail" property="lastName"/>

		</logic:present>

		</td>
		<td class="SearchResult">
		
<dmshtml:get_agency_detail nameInSession="agencyDetail" agencyId="<%=objectId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<logic:present name="agencyDetail" scope="request">
<bean:define id="agdetail" name="agencyDetail" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
<bean:write name="agdetail" property="businessName"/>
</logic:present>
		</td>
		<td class="SearchResult" align="center">
<bean:define id='entityID' name="arrAgents"  property="primaryObjectId" />
		<dmshtml:dms_multibox property="answer(Object::Entity::Id)" 
value = "<%=entityID.toString() %>" >
</dmshtml:dms_multibox> 
	   </td>
		</logic:iterate>
	</tr>
	</logic:present>
	
		</logic:iterate>
		<tr><td colspan="6" align="right">
<html:submit value="Delete" styleClass="sbttn"/></td></tr>

</table>	</td></tr>
<%}%>
 	</logic:present>
</table>
</td></tr>
<tr><td >&nbsp;</td></tr>
</table>
<html:hidden property="answer(objectType)" value="AGENCY" />
<html:hidden property="answer(primaryRoleId)" value="10" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>
<!-- </body>
</html:html>-->
