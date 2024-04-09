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
		<td class="NewSectionHead" colspan="4" align="center">INSTALLMENT TYPE
		LIST</td>
	</tr>
	<tr>
		<td>
		<hr size="1" noshade>
		</td>
	</tr>


	<logic:present name="InstallmentTypeDetail" scope="request">


		<bean:define id="arrInstallmentTypeDetail"
			name="InstallmentTypeDetail" type="java.util.ArrayList" />
		<tr>
			<td class="FormLabels">&nbsp;&nbsp;&nbsp;&nbsp;Number of Records
			Found : <%=arrInstallmentTypeDetail.size()%></td>
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
		<bean:define id="arrInstallmentTypeDetail"
			name="InstallmentTypeDetail" type="java.util.ArrayList" />
		<tr>
			<td valign="top">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
				CELLPADDING="0">
				<tr>
					<td class="sectionhead" width="3%">No.</td>
					<td class="sectionhead" width="15%" align="center">Installment Type
					Name</td>
					<td class="sectionhead" width="10%" align="center">Description</td>
					<td class="sectionhead" width="15%" align="center">Number of
					Installments</td>
					<td class="sectionhead" width="15%" align="center">Initial Payment
					Percentage</td>
					<td class="sectionhead" width="15%" align="center">Installment Fee</td>
					<td class="sectionhead" width="15%" align="center">Installment Fee
					Method</td>
					<td class="sectionhead" width="15%" align="center">Installment Fee
					Type</td>
					<td class="sectionhead" width="10%" align="center">Active</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<%for(int i=0;i<arrInstallmentTypeDetail.size();i++) { 
				    			com.dms.ejb.product.billing.InstallmentTypeDetail installmentTypeDetail = 
				        		(com.dms.ejb.product.billing.InstallmentTypeDetail)arrInstallmentTypeDetail.get(i);
				    			String installmentType = installmentTypeDetail.getInstallmentType();
								%>
				<tr>
					<td class="SearchResult"><%=(i+1)%>&nbsp;</td>
					<td class="SearchResult" align="center"><A
						HREF="../GoToInstallmentTypeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>
										&answer(Object::ProductInstallmentType::InstallmentType)=<%=""+installmentType%>"><%=installmentTypeDetail.getInstallmentType() %>&nbsp;</A></td>
					<td class="SearchResult" align="center"><%=installmentTypeDetail.getInstallmentTypeDesc() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=installmentTypeDetail.getNumberOfInstallments() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=installmentTypeDetail.getInitialPaymentPercentage() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=installmentTypeDetail.getInstallmentFee() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=installmentTypeDetail.getInstallmentFeeMethod() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=installmentTypeDetail.getInstallmentFeeType() %>&nbsp;</td>
					<td class="SearchResult" align="center"><%=installmentTypeDetail.getActive() %>&nbsp;</td>
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

