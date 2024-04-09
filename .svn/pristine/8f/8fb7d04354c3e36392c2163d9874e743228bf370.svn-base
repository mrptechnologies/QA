
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/FindInstallmentTypeAction.do">
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
					<td width="20%" class="FormLabels" align="left" height="25">Installment
					Type Name</td>
					<td class="links"><dmshtml:dms_text name="FindInstallmentType"
						property="answer(Object::ProductInstallmentType::InstallmentType)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				</tr>
				<tr>
					<td width="20%" class="FormLabels" align="left" height="25">Installment
					Type Description</td>
					<td class="links"><dmshtml:dms_text name="FindInstallmentType"
						property="answer(Object::ProductInstallmentType::InstallmentTypeDesc)"
						size="60" maxlength="60" styleClass="txtbox" /></td>
				<tr>
				<tr>
					<td width="35%" class="FormLabels" align="left">Active</td>
					<td class="links"><html:select name="FindInstallmentType"
						property="answer(Object::ProductInstallmentType::Active)"
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


		<logic:present name="InstallmentTypeDetail" scope="request">
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
						<td class="sectionhead" width="20%" align="center">Installment
						Type Name</td>
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
						<td class="sectionhead" width="15%" align="center">Active</td>
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
							&answer(Object::ProductInstallmentType::InstallmentType)=<%=""+installmentTypeDetail.getInstallmentType()%>
							"><%=installmentTypeDetail.getInstallmentType() %>&nbsp;</A></td>
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

	<html:hidden property="TabPanelName"
		value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
