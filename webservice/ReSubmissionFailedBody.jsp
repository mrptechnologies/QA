
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<table WIDTH="960px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr>
	<td height="20"></td></tr>
		
	<tr>
			<td class="sectionhead" >
				<tr>
					<td class="Error">
									<b>Quote ReSubmission Failed. &nbsp;&nbsp;</b>
					</td>
				</tr>
			</td>
	</tr>

<tr><td>&nbsp;</td>
</tr>
<tr><td>&nbsp;</td>
</tr>
<tr>

	<td valign="top">
		
		<tr><td class="links">
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  	<a href="../webservice/FindSubmission.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>"  title="Click to go to the find Submission Page" /> Find Submission</a>
		</dmshtml:dms_static_with_connector>
		
		<br>		  	
		  	
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
		  	<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  	<a href="../webservice/FindBilling.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>"  title="Click to go to the find Billing Page"  clear=yes"> Find Billing</a>
		</dmshtml:dms_static_with_connector>
  </td></tr>
		
	</td>
</tr>
<tr><td height="8px"></td></tr>
</table>

