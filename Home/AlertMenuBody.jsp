<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">Alert</td></tr>
		<tr><td>&nbsp;</td></tr>
		
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td class="links">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/AddAlert.jsp?TabPanelName=Manage_Panel&clear=yes" title="">Alert</a></li>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../alert/AddAlertDefinition.jsp?TabPanelName=Manage_Panel&clear=yes" title="">Alert Definition</a></li>
		</dmshtml:dms_static_with_connector>
		
		
  </td></tr>
</table>
<table WIDTH="98%" ALIGN="center" height="200px" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td></td></tr>
</table>



