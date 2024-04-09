
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/FindPaymentMethodAction.do">

	<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td height="5"></td>
		</tr>

		<tr>
			<td class="NewSectionHead" align="center" colspan="10">FIND PAYMENT
			METHOD</td>
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
					<td width="20%" class="FormLabels" align="left" height="25">Payment
					Method Name</td>
					<td class="links"><dmshtml:dms_text name="FindPaymentMethod"
						property="answer(Object::ProductPaymentMethod::PaymentMethod)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				</tr>
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Payment
					Method Description</td>
					<td class="links"><dmshtml:dms_text name="FindPaymentMethod"
						property="answer(Object::ProductPaymentMethod::PaymentDescription)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				</tr>

				<tr>
					<td width="35%" class="FormLabels" align="left">Active</td>
					<td class="links"><html:select name="FindPaymentMethod"
						property="answer(Object::ProductPaymentMethod::Active)"
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


		<logic:present name="PaymentMethodDetail" scope="request">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td class="NewSectionHead" align="center">Search Result</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<bean:define id="arrPaymentMethodDetail" name="PaymentMethodDetail"
				type="java.util.ArrayList" />
			<tr>
				<td valign="top">
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
					CELLPADDING="0">
					<tr>
						<td class="sectionhead" width="5%">No.</td>
						<td class="sectionhead" width="15%" align="center">Payment Method
						Name</td>
						<td class="sectionhead" width="10%" align="center">Description</td>
						<td class="sectionhead" width="20%" align="center">PaymentGateWay
						Name</td>
						<td class="sectionhead" width="20%" align="center">PaymentGateWay
						Type</td>
						<td class="sectionhead" width="20%" align="center">PaymentGateWay
						Bean</td>
						<td class="sectionhead" width="15%" align="center">Active</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<%for(int i=0;i<arrPaymentMethodDetail.size();i++) { 
				    com.dms.ejb.product.billing.PaymentMethodDetail paymentMethodDetail = 
				        (com.dms.ejb.product.billing.PaymentMethodDetail)arrPaymentMethodDetail.get(i);
					String paymentMethod = paymentMethodDetail.getPaymentMethod();
					%>
					<tr>
						<td class="SearchResult"><%=(i+1)%>&nbsp;</td>
						<td class="SearchResult" align="center"><A
							HREF="../GoToPaymentMethodAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>
														&answer(Object::ProductPaymentMethod::PaymentMethod)=<%=""+paymentMethodDetail.getPaymentMethod()%>
							"><%=paymentMethodDetail.getPaymentMethod() %>&nbsp;</A></td>
						<td class="SearchResult" align="center"><%=paymentMethodDetail.getPaymentDescription() %>&nbsp;</td>
						<td class="SearchResult" align="center"><%=paymentMethodDetail.getPaymentGatewayName() %>&nbsp;</td>
						<td class="SearchResult" align="center"><%=paymentMethodDetail.getPaymentGatewayType() %>&nbsp;</td>
						<td class="SearchResult" align="center"><%=paymentMethodDetail.getPaymentGatewayBean() %>&nbsp;</td>
						<td class="SearchResult" align="center"><%=paymentMethodDetail.getActive() %>&nbsp;</td>
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
