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
			<td class="NewSectionHead" colspan="4" align="center">PAYMENT METHOD
			LIST</td>
		</tr>
		<tr>
			<td>
			<hr size="1" noshade>
			</td>
		</tr>


		<logic:present name="PaymentMethodDetail" scope="request">

			
				<bean:define id="arrPaymentMethodDetail" name="PaymentMethodDetail"
					type="java.util.ArrayList" />
				<tr>
					<td class="FormLabels">&nbsp;&nbsp;&nbsp;&nbsp;Number of Records
					Found : <%=arrPaymentMethodDetail.size()%></td>
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
							&answer(Object::ProductPaymentMethod::PaymentMethod)=<%=""+paymentMethod%>"><%=paymentMethodDetail.getPaymentMethod() %>&nbsp;</A></td>
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
	
