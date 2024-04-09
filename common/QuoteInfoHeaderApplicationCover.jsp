<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="SubQuoteId" name="Application" property="answer(SubQuoteId)" scope="request" />
<bean:define id="customerId" name="Application" property="answer(customerId)" scope="request" />
<bean:define id="ProductId" name="Application" property="answer(productId)" scope="request" />
<bean:define id="productVerId" name="Application" property="answer(productVerId)" scope="request" />
<bean:define id="prdGroupId" name="Application" property="answer(prdGroupId)" scope="request" />
<bean:define id="prdGroupVerId" name="Application" property="answer(prdGroupVerId)" scope="request" />
<bean:define id="productStatus" name="Application" property="answer(productStatus)" scope="request" />
<jsp:include page="../common/QuotePlanInfoHeader3.0.jsp" >
	<jsp:param name="subQuoteId" value="<%=""+SubQuoteId%>" />	
	<jsp:param name="customerId" value="<%=""+customerId%>" />	
	<jsp:param name="productId" value="<%=""+ProductId%>" />	
	<jsp:param name="productVerId" value="<%=""+productVerId%>" />
	<jsp:param name="prdGroupId" value="<%=""+prdGroupId%>" />	
	<jsp:param name="prdGroupVerId" value="<%=""+prdGroupVerId%>" />
	<jsp:param name="productStatus" value="<%=""+productStatus%>" />
	<jsp:param name="stateCode" value="<%=""%>" />
</jsp:include>