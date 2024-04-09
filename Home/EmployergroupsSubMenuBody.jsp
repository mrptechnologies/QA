<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">EMPLOYER GROUP</td></tr>
		<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="TextMatter">
		<bean:message key="SubMenu.desc"/>
		</td>
	</tr>
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td class="links">


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">

			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../AddCustomers.do?TabPanelName=Insured_Panel&clear=yes"  title="Click to go to the Add Employer Group Page" />Add Employer Group</a> 
		</dmshtml:dms_static_with_connector>
		 
		<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../FindCustomers.do?TabPanelName=Insured_Panel&clear=yes"  title="Click to go to the Find Employer Group Page" />Find Employer group</a> 

		</dmshtml:dms_static_with_connector>

		<br>

	<!-- <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTACHMENT_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="/attachment/FindAttachments.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>"  title="Click to go to the Add General Agency Page" />Find Attachments</a> 

		</dmshtml:dms_static_with_connector> -->


   </td></tr>

</table>


