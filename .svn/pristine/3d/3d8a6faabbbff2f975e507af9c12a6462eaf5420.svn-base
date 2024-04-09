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
<tr><td >&nbsp;</td></tr>
<tr><td class="MH">
GENERAL AGENCIES 
</td></tr>
<tr><td class="TextMatter">
<bean:message key="GeneralAgencies.ModDesc"/>
<br>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>
	<logic:present name="msgInfo" scope="request">
	<tr>
		<td class="Error">
		<%=request.getAttribute("msgInfo")%>
		</td>
	</tr>
	</logic:present>
<tr><td>&nbsp;</td></tr>

<tr><td>
<table WIDTH="85%" ALIGN="center" cellspacing=0 cellpadding="2">
<tr><td class="links" colspan="3"><img SRC="../Images/rtg_rate.gif" >&nbsp;&nbsp;<a href="../GeneralAgencyLink.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes"/><bean:message key="GeneralAgencies.AddGeneralAgency"/></td></tr>
<dmshtml:get_general_agencies nameInSession="arrGeneralAgencies"  parentAgencyId="-1" ownerId="<%=Long.parseLong(""+ownerId) %>" />
<logic:notPresent name="arrGeneralAgencies" scope="session">
  <tr><td class="Error" >Currently no general agencies available. 
  </td></tr>
  </logic:notPresent>
<tr><td colspan="3" >&nbsp;</td></tr>
	 
	  <logic:present name="arrGeneralAgencies" scope="session">
	  <tr><td colspan="3" class="Error" align="center"><bean:message key="GeneralAgencies.ExistingGAgencies"/>
</td></tr>
<logic:present name="generalAgencySize" scope="session">
<bean:define id="generalAgencySize1" name="generalAgencySize" scope="session"/>
<tr><td class="FormLabels" colspan="3">No of General Agencies Found:&nbsp;<%=generalAgencySize1.toString()%></td></tr>
<tr><td>&nbsp;</td></tr>
</logic:present>

	<tr >
      <td class="sectionhead" width="10%">
      <bean:message key="GeneralAgencies.SlNo"/>
	  </td>
		<td class="sectionhead" width="70%">
		<bean:message key="GeneralAgencies.Name"/></td>
		<td class="sectionhead" width="15%">
		State</td>
	  </tr>

	 <% int i=0;%>

	  <logic:iterate id="ga" name="arrGeneralAgencies">
	  <tr>
	  <td class="SearchResult"><%=++i%>
	  </td>
  	  <td class="SearchResult"><a href="../EditGAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&agencyId=<bean:write name='ga' property='answer(Object::Agency::AgencyId)' />&primaryObjectId=<bean:write name='ga' property='answer(Object::Agency::AgencyId)' />&primaryObjectType=GENERAL_AGENCY&ReadOnly=No"><bean:write name="ga" property="answer(Object::Agency::BusinessName)"/></a></td>
		<td class="SearchResult"><bean:write name="ga" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)"/></td>
	  </tr>
</logic:iterate>
	</logic:present>

		<tr><td colspan="3" >&nbsp;</td></tr>

 	
</table>
</td></tr>
		<tr><td>&nbsp;</td></tr>

</table>




