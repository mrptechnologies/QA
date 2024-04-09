<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">TAXES</td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td class="TextMatter">
			<bean:message key="SubMenu.desc"/>
		</td>
	</tr>
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td class="links">
		 
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_TAX_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
			<a href="../taxdefinition/AddTaxDefinition.jsp?TabPanelName=Manage_Panel&clear=yes" title="Click to go to the Add Fees Page" >Add Tax</a>
		</dmshtml:dms_static_with_connector>
			<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_TAX_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
			<a href="../taxdefinition/FindTaxDefinition.jsp?TabPanelName=Manage_Panel&clear=yes" title="Click to go to the Find Fee Page" >Find Tax</a>
			<br>
		</dmshtml:dms_static_with_connector>
	</td></tr>
  </td></tr>
</table>
