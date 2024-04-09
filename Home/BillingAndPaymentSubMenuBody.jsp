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
		<td class="NewSectionHead" colspan="4" align="center">Billing And
		Payment</td>
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
			href="../Home/BillingTypeSubMenu.jsp?TabPanelName=Manage_Panel"
			title="Click to go to the Billing Type Page" />Billing Type</a> <br>

		<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0"
			ALT=""> <a
			href="../Home/PaymentMethodSubMenu.jsp?TabPanelName=Manage_Panel"
			title="Click to go to the Payment Method Page" />Payment Method</a> <br>

		<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0"
			ALT=""> <a
			href="../Home/InstallmentTypeSubMenu.jsp?TabPanelName=Manage_Panel"
			title="Click to go to the Installment Type Page" />Installment Type</a>

		<br>

		<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0"
			ALT=""> <a
			href="../Home/BillingCurrencySubMenu.jsp?TabPanelName=Manage_Panel"
			title="Click to go to the Billing Currency Page" />Billing Currency</a>

		<br>
		</td>
	</tr>

</table>
