<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">AGENCY</td></tr>
		<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="TextMatter">
		<bean:message key="SubMenu.desc"/>
		</td>
	</tr>
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td class="links">



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../AgencyLink.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&clear=yes" title="<bean:message key='ToolTip.Agency.AddAgency'/>"/>Add Agency</a> 
		</dmshtml:dms_static_with_connector>
		 
		<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENCY_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../FindAgencyAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID" title="<bean:message key='ToolTip.Agency.FindAgency'/>"/>Find Agency</a> 

		</dmshtml:dms_static_with_connector>

   </td></tr>

</table>
<table WIDTH="98%" ALIGN="center" height="200px" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td></td></tr>
</table>

