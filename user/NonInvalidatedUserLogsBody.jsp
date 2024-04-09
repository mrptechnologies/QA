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
<html:form action="/InvalidatedUsersAction"  >

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>

<tr><td class="MH">
CURRENTLY LOGGED IN USERS
</td></tr>
<tr><td class="TextMatter">
<bean:message key="NonInvalidatedUsers.ModDesc"/>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>
<tr><td>&nbsp;</td></tr>

<tr><td class="TextMatter"><b>
<logic:present name ='countUserLogs' scope ='session'>
<bean:message key="UserLogs.AllUserLogsCount"/>
 &nbsp;&nbsp;<%=session.getAttribute("countUserLogs").toString()%></b>
</logic:present>
</td></tr>
<logic:present name ='UserLogsDisplay' scope ='session'>

<tr><td><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>
<table WIDTH="950px" ALIGN="center" cellspacing=0 cellpadding="2">
<tr>
		<td  class="links"  colspan="3">
		
		<logic:present name="minimumValueUserLogs"  scope="session" >
		<a href="../NavigateUserLogsAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&flag=de&index=<bean:write name='minRangeUserLogs' scope='session'/>">
		
		<<&nbsp;Previous&nbsp;</a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="maxRangeUserLogs"  scope="session" >
		<a href="../NavigateUserLogsAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&flag=incre&index=<bean:write name='maxRangeUserLogs' scope='session'/>">
		
		&nbsp;Next&nbsp;>></a>
		</logic:present>
		</td>
	</tr>
<tr><td colspan="5" >&nbsp;</td></tr>
	<tr >
      <td class="sectionhead" width="5%">
      <bean:message key="UserLogs.SlNo"/>
	  </td>
		<td width="25%" class="sectionhead">
		<bean:message key="UserLogs.UserName"/></td>
		<td width="20%" class="sectionhead">
		<bean:message key="UserLogs.ClientIP"/></td>
		<td width="20%" class="sectionhead">
		<bean:message key="UserLogs.ServerName"/></td>
		<td width="25%" class="sectionhead">
	<bean:message key="UserLogs.SessionStart"/>&nbsp;</td>
		
	
		</tr>
<% int i=1;%>
<logic:present name="minimumValueUserLogs"  scope="session" >
<bean:define id="slno" name='minRangeUserLogs' scope='session'/>
<%
try{
    i=Integer.parseInt(slno.toString());
	if(i!=1){
		i++;
	}
  }catch(NumberFormatException nfe)
  {
	  i=1;
  }

%>
</logic:present>
	

	<logic:iterate id="UserLogsDisplay" name="UserLogsDisplay" scope="session" >
	<tr>
	   <td class="SearchResult">
	   <%=i%>
		 <% i++; %>
	   </td>
		<td class="SearchResult" >
		 <bean:write name="UserLogsDisplay" property="userId" />
		</td>
		<td class="SearchResult" >
		 <bean:write name="UserLogsDisplay" property="clientIPAddress" />
		</td>
		<td class="SearchResult" >
		 <bean:write name="UserLogsDisplay" property="serverIPAddress" />
		</td>
		<td class="SearchResult" >
		 <bean:write name="UserLogsDisplay" property="startTime" />
		</td>
        
		
		</tr>		
		</logic:iterate>
		<tr><td colspan="6" >&nbsp;</td></tr>
<tr>
		<td  class="links" colspan="3">
		
		<logic:present name="minimumValueUserLogs"  scope="session" >

		<a href="../NavigateUserLogsAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&flag=de&index=<bean:write name='minRangeUserLogs' scope='session'/>">
		
		<<&nbsp;Previous</a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3" >
		<logic:present name="maxRangeUserLogs"  scope="session" >
		<a href="../NavigateUserLogsAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&flag=incre&index=<bean:write name='maxRangeUserLogs' scope='session'/>">
		
		Next &nbsp;>> </a>
		</logic:present>
		</td>
	</tr>
	
</table>
</td></tr>


</logic:present>


</table>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>


