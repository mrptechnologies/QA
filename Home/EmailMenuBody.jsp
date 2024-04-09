<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">E-Mail</td></tr>
		<tr><td>&nbsp;</td></tr>
		
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td class="links">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
			<li class="yuimenuitem"><a class="yuimenuitemlabel" href="../email/FindEmail.jsp?TabPanelName=Manage_Panel&clear=yes" title="Click here to go to Find E-Mail Page">Find E-Mail</a></li>
		</dmshtml:dms_static_with_connector>
  </td></tr>
</table>



