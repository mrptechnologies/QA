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

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />



<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2"
	CELLPADDING="0">
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">BILLING CURRENCY
		LIST</td>
	</tr>
	<tr>
		<td>
		<hr size="1" noshade>
		</td>
	</tr>


	<logic:present name="BillingCurrencyDetail" scope="request">


		<bean:define id="arrBillingCurrencydetail"
			name="BillingCurrencyDetail" type="java.util.ArrayList" />
		<tr>
			<td class="FormLabels">&nbsp;&nbsp;&nbsp;&nbsp;Number of Records
			Found : <%=arrBillingCurrencydetail.size()%></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="NewSectionHead" align="center">Search Result</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<bean:define id="arrBillingCurrencydetail"
			name="BillingCurrencyDetail" type="java.util.ArrayList" />
		<tr>
			<td valign="top">
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">

				<tr>
					<td class="sectionhead" width="3%">No.</td>
					<td class="sectionhead" width="15%" align="center">Currency Code</td>
					<td class="sectionhead" width="15%" align="center">Currency Name</td>
					<td class="sectionhead" width="15%" align="center">Currency Rate</td>
					<td class="sectionhead" width="15%" align="center">Country Name</td>
					<td class="sectionhead" width="15%" align="center">Active</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<%for(int i=0;i<arrBillingCurrencydetail.size();i++) { 
						    com.dms.ejb.product.billing.BillingCurrencyDetail billingCurrencyDetail = 
					        (com.dms.ejb.product.billing.BillingCurrencyDetail)arrBillingCurrencydetail.get(i);
						    String currencyCode = billingCurrencyDetail.getBillingCurrencyCode();
						%>
				<tr>
					<td class="SearchResult"><%=(i+1)%>&nbsp;</td>
					<td class="SearchResult" align="center"><A
						HREF="../GoToBillingCurrencyAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>
							&answer(Object::ProductBillingCurrency::BillingCurrencyCode)=<%=""+currencyCode%>"><%=billingCurrencyDetail.getBillingCurrencyCode() %>&nbsp;</A></td>
					<td class="SearchResult" align="center"><%=billingCurrencyDetail.getCurrencyName() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=billingCurrencyDetail.getCurrencyRate() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=billingCurrencyDetail.getCountryName() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=billingCurrencyDetail.getActive() %>&nbsp;</td>
				</tr>
				<%} %>

				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>

			</table>
			</td>
		</tr>
	</logic:present>

</table>

