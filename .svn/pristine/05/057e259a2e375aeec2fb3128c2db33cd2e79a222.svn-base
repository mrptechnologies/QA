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
		<td class="NewSectionHead" colspan="4" align="center">BILLING TYPE
		LIST</td>
	</tr>
	<tr>
		<td>
		<hr size="1" noshade>
		</td>
	</tr>

	<logic:present name="BillingTypeDetail" scope="request">


		<bean:define id="arrBillingTypeDetail" name="BillingTypeDetail"
			type="java.util.ArrayList" />
		<tr>
			<td class="FormLabels">&nbsp;&nbsp;&nbsp;&nbsp;Number of Records
			Found : <%=arrBillingTypeDetail.size()%></td>
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
					<td class="sectionhead" width="15%" align="center">Invoice Template</td>
					<td class="sectionhead" width="20%" align="center">Invoice Template
					Type</td>
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
							&answer(Object::ProductBillingType::BillingType)=<%=""+billingType%>"><%=billingTypeDetail.getBillingType() %>&nbsp;</A></td>
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

