
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/FindBillingTypeAction.do">
	<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td height="5"></td>
		</tr>

		<tr>
			<td class="NewSectionHead" align="center" colspan="10">FIND BILLING
			TYPE</td>
		</tr>

		<tr>
			<td height="8px"></td>
		</tr>


		<tr>
			<td valign="top">
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">

				<tr>
					<td class="FormLabels" colspan="6">
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Billing
					Type Name</td>
					<td class="links"><dmshtml:dms_text name="FindBillingType"
						property="answer(Object::ProductBillingType::BillingType)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				</tr>
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Billing
					Type Description</td>
					<td class="links"><dmshtml:dms_text name="FindBillingType"
						property="answer(Object::ProductBillingType::BillingDescription)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				</tr>

				<tr>
					<td width="35%" class="FormLabels" align="left">Active</td>
					<td class="links"><html:select name="FindBillingType"
						property="answer(Object::ProductBillingType::Active)"
						styleId="Active" styleClass="txtbox">
						<html:option value="Y">Active</html:option>
						<html:option value="N">InActive</html:option>
					</html:select></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>&nbsp;<html:submit value="Search" styleClass="sbttn"
						property="answer(buttonName)" value="submit" /></td>
				</tr>

			</table>
			</td>
		</tr>


		<logic:present name="BillingTypeDetail" scope="request">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td class="NewSectionHead" align="center">Search Result</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<bean:define id="arrBillingTypeDetail" name="BillingTypeDetail"
				type="java.util.ArrayList" />
			<tr>
				<td valign="top">
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
					CELLPADDING="0">
					<tr>
						<td class="sectionhead" width="3%">No.</td>
						<td class="sectionhead" width="15%" align="center">Billing Type</td>
						<td class="sectionhead" width="15%" align="center">Description</td>
						<td class="sectionhead" width="15%" align="center">Invoice
						Template</td>
						<td class="sectionhead" width="20%" align="center">Invoice
						Template Type</td>
						<td class="sectionhead" width="15%" align="center">Active</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%for(int i=0;i<arrBillingTypeDetail.size();i++) { 
				    com.dms.ejb.product.billing.BillingTypeDetail billingTypeDetail = 
				        (com.dms.ejb.product.billing.BillingTypeDetail)arrBillingTypeDetail.get(i);
				    String billingType = billingTypeDetail.getBillingType();
					%>
					<tr>
						<td class="SearchResult"><%=(i+1)%>&nbsp;</td>
						<td class="SearchResult" align="center"><A
							HREF="../GoToBillingTypeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>
							&answer(Object::ProductBillingType::BillingType)=<%=""+billingTypeDetail.getBillingType()%>
							"><%=billingTypeDetail.getBillingType() %>&nbsp;</A></td>
						<td class="SearchResult" align="center"><%=billingTypeDetail.getBillingDescription() %>&nbsp;</td>
						<td class="SearchResult" align="center"><%=billingTypeDetail.getInvoiceTemplate() %>&nbsp;</td>
						<td class="SearchResult" align="center"><%=billingTypeDetail.getInvoiceTemplateType() %>&nbsp;</td>
						<td class="SearchResult" align="center"><%=billingTypeDetail.getActive() %>&nbsp;</td>
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
