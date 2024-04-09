<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="SubQuoteId1" name="AddParentQuote" property="answer(subQuoteId)" scope="request" />
<bean:define id="customerId1" name="AddParentQuote" property="answer(customerId)" scope="request" />
<bean:define id="ProductId1" name="AddParentQuote" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="productVerId1" name="AddParentQuote" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="prdGroupId1" name="AddParentQuote" property="answer(Object::Quote::ProductGroupId)" scope="request" />
<bean:define id="prdGroupVerId1" name="AddParentQuote" property="answer(Object::Quote::ProductGroupVerId)" scope="request" />
<bean:define id="productStatus1" name="AddParentQuote" property="answer(productStatus)" scope="request" />
<bean:define id="stateCode" name="AddParentQuote" property="answer(Object::Plan::StateCode)" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />


<jsp:include page="../common/QuotePlanInfoHeader3.0.jsp" >
	<jsp:param name="subQuoteId" value="<%=""+SubQuoteId1%>" />	
	<jsp:param name="customerId" value="<%=""+customerId1%>" />	
	<jsp:param name="productId" value="<%=""+ProductId1%>" />	
	<jsp:param name="productVerId" value="<%=""+productVerId1%>" />
	<jsp:param name="prdGroupId" value="<%=""+prdGroupId1%>" />	
	<jsp:param name="prdGroupVerId" value="<%=""+prdGroupVerId1%>" />
	<jsp:param name="productStatus" value="<%=""+productStatus1%>" />
	<jsp:param name="stateCode" value="<%=""+stateCode%>"/>
</jsp:include>