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

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
AGENT AND AGENCIES
</td></tr>
<tr><td class="TextMatter">
<bean:message key="AgentsList.ModDesc"/>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td class="links"><img SRC="../Images/rtg_rate.gif" alt="">&nbsp;&nbsp;<a href="../agency/AgentsAndLinkedAgency.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>">Linked Agents And Agencies</a></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>
<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2">
<dmshtml:Get_users_byRoleId nameInSession="arrAgents" roleId="10" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>"
" />

 <% int j=0; %>

<logic:present name ='arrAgents' scope ='session'>

<logic:iterate id="arrAgents" name="arrAgents" scope="session" >

	   <bean:define id='test' name="arrAgents"  property="primaryObjectId" />
	   <logic:notEqual name="test" value="-1">
	  <dmshtml:Get_entity_link_object nameInSession="arrEntityLink" entityId="<%=test.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>"
" objectType="AGENCY"/>
	  <logic:notPresent name="arrEntityLink" scope="Session">
	   <dmshtml:Get_entity_link_object nameInSession="arrEntityLinkAgency" entityId="<%=test.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>"
" objectType="GENERAL_AGENCY"/>
	  <logic:notPresent name="arrEntityLinkAgency" scope="session">
	  <% j++;%>
	  </logic:notPresent>
	  </logic:notPresent>
	  </logic:notEqual>
	  </logic:iterate>
	   <% if(j==0){%>
	   <tr><td class="Error">Currently no agents are available to link with agencies.
		</td></tr>
	  <%}%>
	 <%if(j!=0){%>
<tr><td align="center" class="Error"><bean:message key="AgentsList.ExistingAgents"/>
</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>
<table  WIDTH="400px" ALIGN="center" cellspacing=0 cellpadding="2"> 
	<tr >
      <td class="display" width="50px">
      <bean:message key="GeneralAgencies.SlNo"/>
	  </td>
		<td class="display" width="350px">
		<bean:message key="AgentsList.AgentName" /></td>
			
	  </tr>
	  <% int i=0; %>
	 
	  <logic:iterate id="arrAgents" name="arrAgents" scope="session" >

	   <bean:define id='test' name="arrAgents"  property="primaryObjectId" />
	   <logic:notEqual name="test" value="-1">
	  <dmshtml:Get_entity_link_object nameInSession="arrEntityLink" entityId="<%=test.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>"
" objectType="AGENCY"/>
	  <logic:notPresent name="arrEntityLink" scope="Session">
	   <dmshtml:Get_entity_link_object nameInSession="arrEntityLinkAgency" entityId="<%=test.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId) %>"
" objectType="GENERAL_AGENCY"/>
	  <logic:notPresent name="arrEntityLinkAgency" scope="session">
	<tr>
		<td class="SearchResult">
		<% i++;%>
		<%= i %>
		</td>
		<td class="SearchResult">
			<a href="../agency/LinkAgentToAgencies.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&agentId=<bean:write name='arrAgents' property='id' />&entityId=<bean:write name='arrAgents' property='primaryObjectId'/>"><!--bean:write name="arrAgents" property="id" /-->
			
			
<bean:define id="entityId" name="arrAgents" property="primaryObjectId"/>
<!---Test Code for displaying firstname and lastname -->

<dmshtml:get_entity nameInSession="entityDetail" entityId="<%=Long.parseLong(entityId.toString())%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
<logic:present name="entityDetail" scope="session">
		<bean:define id="anEntityDetail" name="entityDetail"  type="com.dms.ejb.entity.DMSEntityDetail"/>
		<bean:write name="anEntityDetail" property="firstName"/>
		&nbsp;	<bean:write name="anEntityDetail" property="lastName"/>

		</logic:present>
<!---End Test Code for displaying firstname and lastname -->
</a>


			
			

		</td>
	</tr>
	</logic:notPresent>

	</logic:notPresent>
	</logic:notEqual>
		</logic:iterate>
</table>	</td></tr>
<%}%>
 	</logic:present>
</table>
</td></tr>
<tr><td >&nbsp;</td></tr>
</table>

