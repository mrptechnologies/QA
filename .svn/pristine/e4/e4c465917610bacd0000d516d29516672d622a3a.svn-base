<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<bean:define id="userId" property="answer(Object::UserDetail::userName)"
	name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)"
	name="LoginPage" scope="session" />
<bean:parameter id="productVerId"
	name="answer(Object::ProductVer::ProductVerId)" />
<bean:parameter id="productId" name="answer(Object::Product::ProductId)" />


<table height="2%">
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="0">
	<tr>
		<td><jsp:include page="../common/ProductHeader.jsp">
			<jsp:param name="ProductId" value="<%=productId.toString()%>" />
			<jsp:param name="ProductVerId" value="<%=productVerId.toString()%>" />
		</jsp:include></td>
	</tr>
</table>

<table height="2%">
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
	CELLPADDING="0">

	<tr>
		<td class="NewSectionHead" align="center" colspan="9">BILLING AND
		PAYMENT DETAILS</td>
	</tr>

	<tr>
		<td>&nbsp;</td>
	</tr>


	<tr>
		<td class="links"><IMG SRC="../Images/bullxred.gif" WIDTH="20"
			HEIGHT="20" BORDER="0" ALT=""> <a
			href='../GetAssociatedBillingTypeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>'
			title="Click to go to the Product Billing Type Details Page" />Billing Type
		Details</a> <br>

		<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0"
			ALT=""> <a
			href='../GetAssociatedBillingCurrencyAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>'
			title="Click to go to the Product Billing Currency Details Page" />Billing
		Currency Details</a> <br>

		<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0"
			ALT=""> <a href='../GetAssociatedInstallmentTypeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>'
			title="Click to go to the Product Installment Type Details Page" />Installment
		Type Details</a> <br>

		<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0"
			ALT=""> <a href='../GetAssociatedPaymentMethodAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>'
			title="Click to go to the Product Payment Method Details Page" />Payment
		Method Details</a> <br>
		</td>
	</tr>

</table>




