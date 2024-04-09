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


<html:form action="/FindUser"  >

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
USER ACCOUNTS
</td></tr>
<tr><td class="TextMatter">
<bean:message key="UserAccounts.ModDesc"/>

</td></tr>
<tr><td><hr size="1" noshade ></td><tr>

<tr><td>&nbsp;</td></tr>

<tr><td> 

<table WIDTH="100%" ALIGN="center" cellspacing=0 cellpadding="2">
<tr><td class="links"><img SRC="../Images/rtg_rate.gif">&nbsp;&nbsp;<a href="../AddUserAccountLink.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&clear=yes"/><bean:message key="UserAccounts.AddUserAccount"/></td></tr>
<tr><td>&nbsp;</td></tr>


<tr><td>

<table WIDTH="90%" ALIGN="center" cellspacing=1 cellpadding="2">

<tr><td class="Error"><logic:notPresent name ='UsersDisplay' scope ='session'>No Matching Records Found.
</logic:notPresent></td></tr>

<logic:present name ='UsersDisplay' scope ='session'>
<tr><td align="center" class="Error" colspan="3"><bean:message key="UserAccounts.ExistingUsers"/>
</td></tr>
</logic:present>
<tr><td class="TextMatter" colspan="6"><b>
<logic:present name ='usersSize' scope ='session'>
<bean:message key="UserAccounts.AllUsersCount"/>
 &nbsp;&nbsp;<%=session.getAttribute("usersSize").toString()%></b>
</logic:present>
</td></tr>
<logic:present name ='UsersDisplay' scope ='session'>
<tr><td><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/></td></tr>

<tr>
		<td  class="links"  colspan="3">
		
		<logic:present name="minimumValueUserLogs"  scope="session" >
		<a href="../NavigateUsersAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=de&index=<bean:write name='minRangeUserLogs' scope='session'/>">
		
		<<&nbsp;Previous&nbsp;</a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="maxRangeUserLogs"  scope="session" >
		<a href="../NavigateUsersAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=incre&index=<bean:write name='maxRangeUserLogs' scope='session'/>">
		
		&nbsp;Next&nbsp;>></a>
		</logic:present>
		</td>
	</tr>
	<tr><td colspan="6" >&nbsp;</td></tr>

	<tr>
      <td class="sectionhead" width="5">
      <bean:message key="GeneralAgencies.SlNo"/>
	  </td>
		<td class="sectionhead" width="25%">
		<bean:message key="UserAccounts.Name" /></td>
		<td class="sectionhead" width="35%">
		E-Mail Id</td>
		<td class="sectionhead" width="30%">
		Role Name</td>
		
  </tr>
	  <% int i=1; %>
	  <logic:present name="minimumValueUserLogs" scope="session">
	  <bean:define id="slno" name='minRangeUserLogs' scope='session' />
	  <%
		try
		{
			i=Integer.parseInt(slno.toString());
			if(i!=1)
			{
				i++;
			}
		}
		catch(NumberFormatException nfe)
		{
			i=1;
		}

	  %>
	</logic:present>

	  <logic:iterate id="UsersDisplay" name="UsersDisplay" scope="session" >
	<tr>
		<td class="SearchResult">
		<%= i %>
		<% i++;%>
		</td>
		<td class="SearchResult">
		<bean:define id="userId" name="UsersDisplay" property="id" />
		<a href="../ChangePasswordForUsers.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&userId=<%=userId.toString()%>"  title="Click to go to the change password page">
		<bean:write name="UsersDisplay" property="id" />
		</a>
		</td>
	<td class="SearchResult">
		 <bean:define id="EmailId" name="UsersDisplay" property="emailId" />
		<%=EmailId.toString()%>&nbsp;
		</td>

		<td class="SearchResult">
		<bean:define id="roles" name="UsersDisplay" property="roles"/>
		<logic:iterate id="aRole" name="roles" >
		<bean:define id="aRoleDetail"  name="aRole" property="value" type="com.dms.ejb.user.Role"/>
		<bean:write name="aRoleDetail" property="desc"/>
        </logic:iterate>
		</td>

		
	</tr>
		</logic:iterate>
		<tr><td colspan="6" >&nbsp;</td></tr>

	<tr>
		<td  class="links" colspan="3">
		
		<logic:present name="minimumValueUserLogs"  scope="session" >

		<a href="../NavigateUsersAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=de&index=<bean:write name='minRangeUserLogs' scope='session'/>">
		
		<<&nbsp;Previous</a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3" >
		<logic:present name="maxRangeUserLogs"  scope="session" >
		<a href="../NavigateUsersAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=incre&index=<bean:write name='maxRangeUserLogs' scope='session'/>">
		
		Next &nbsp;>> </a>
		</logic:present>
		</td>
	</tr>
	

</logic:present>
</table>
</td></tr>

<tr><td>&nbsp;</td></tr>
 	
</table>
</td></tr>
</table>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>