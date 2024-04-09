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


<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td>&nbsp;</td></tr>
		<tr><td class="NewSectionHead" colspan="4" align="center">Document Definitions</td></tr>
		<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="TextMatter">
		<bean:message key="SubMenu.desc"/>
		</td>
	</tr>
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td class="links">


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_DOCUMENT__MENU"}%>' connector='or' negated="true">

			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../AddDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes"  title="Click to go to the Add Document Definition Page" />Add Document</a> 
		</dmshtml:dms_static_with_connector>
		 
		<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../FindDocumentDefinitionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes"  title="Click to go to the Find Document Definition Page" />Find Document</a> 

		</dmshtml:dms_static_with_connector>

		<br>
		
   </td></tr>

</table>
