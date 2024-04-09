<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="2">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">Payment Method</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="TextMatter"><bean:message key="SubMenu.desc" /></td>
	</tr>
	<tr>
		<td>
		<hr size="1" noshade>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="links"><IMG SRC="../Images/bullxred.gif" WIDTH="20"
			HEIGHT="20" BORDER="0" ALT=""> <a
			href="../billing/AddPaymentMethod.jsp?TabPanelName=Manage_Panel"
			title="Click to go to the Add Payment Method Page" />Add Payment
		Method</a> <br>

		<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0"
			ALT=""> <a
			href="../billing/FindPaymentMethod.jsp?TabPanelName=Manage_Panel"
			title="Click to go to the Find Payment Method Page" />Find Payment
		Method</a> <br>

		<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0"
			ALT=""> <a
			href="../FindPaymentMethodAction.do?TabPanelName=Manage_Panel"
			title="Click to go to the Show All Payment Method Page" />Show All
		Payment Method</a> <br>

		</td>
	</tr>

</table>
