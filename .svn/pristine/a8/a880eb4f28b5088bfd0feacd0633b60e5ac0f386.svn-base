<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">WebService</td></tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td class="TextMatter">
			<bean:message key="SubMenu.desc"/>
		</td>
	</tr>
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td class="sectionhead">&nbsp;SUBMISSION WEBSERVICE='<%=com.dms.util.Constants.getProperties("Insurance").getProperty("SUBMISSION_WEB_SERVICE")%>'</td></tr>
	<tr><td class="sectionhead">&nbsp;BILING WEBSERVICE='<%=com.dms.util.Constants.getProperties("Insurance").getProperty("BILLING_WEB_SERVICE")%>'</td></tr>
	<tr><td class="links">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  	<a href="../webservice/FindSubmission.jsp?TabPanelName=Manage_Panel"  title="Click to go to the find Submission Page" />Submission</a>
		</dmshtml:dms_static_with_connector>
		
		<br>		  	
		  	
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
		  	<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  	<a href="../webservice/FindBilling.jsp?TabPanelName=Manage_Panel"  title="Click to go to the find Billing Page"  clear=yes">Billing</a>
		</dmshtml:dms_static_with_connector>
  </td></tr>
</table>
<table WIDTH="98%" ALIGN="center" height="200px" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td></td></tr>
</table>

