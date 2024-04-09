
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/FindBillingCurrencyAction.do">
	<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td height="5"></td>
		</tr>

		<tr>
			<td class="NewSectionHead" align="center" colspan="10">FIND BILLING
			CURRENCY</td>
		</tr>

		<tr>
			<td height="8px";</td>
		</tr>


		<tr>
			<td valign="top">
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">

				<tr>
					<td class="FormLabels" colspan="6">
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Currency
					Code</td>
					<td class="links"><dmshtml:dms_text name="FindBillingCurrency"
						property="answer(Object::ProductBillingCurrency::BillingCurrencyCode)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				</tr>
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Currency
					Name</td>
					<td class="links"><dmshtml:dms_text name="FindBillingCurrency"
						property="answer(Object::ProductBillingCurrency::CurrencyName)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				<tr>
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Country
					Name</td>
					<td class="links"><dmshtml:dms_text name="FindBillingCurrency"
						property="answer(Object::ProductBillingCurrency::CountryName)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				<tr>
				<tr>
					<td width="35%" class="FormLabels" align="left">Active</td>
					<td class="links"><html:select name="FindBillingCurrency"
						property="answer(Object::ProductBillingCurrency::Active)"
						styleId="Active" styleClass="txtbox">
						<html:option value="Y">Active</html:option>
						<html:option value="N">InActive</html:option>
					</html:select></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<td>&nbsp;<html:submit value="Search" styleClass="sbttn"
					property="answer(buttonName)" value="submit" /></td>
				</tr>

			</table>
			</td>
		</tr>


		<logic:present name="BillingCurrencyDetail" scope="request">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
							&answer(Object::ProductBillingCurrency::BillingCurrencyCode)=<%=""+billingCurrencyDetail.getBillingCurrencyCode()%>
							"><%=billingCurrencyDetail.getBillingCurrencyCode()%>&nbsp;</A></td>
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
	<html:hidden property="TabPanelName"
		value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
