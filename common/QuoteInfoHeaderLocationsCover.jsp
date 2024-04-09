<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="subQuoteDetail" name="SUB_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
<bean:define id="productId" name="subQuoteDetail" property="productId" />
<bean:define id="productVerId" name="subQuoteDetail" property="productVerId" />
<bean:define id="groupId" name="subQuoteDetail" property="productGroupId" />
<bean:define id="groupVerId" name="subQuoteDetail" property="productGroupVerId" />
<bean:define id="productStatus" name="subQuoteDetail" property="productStatus" />

<jsp:include page="../common/QuotePlanInfoHeader3.0.jsp" >
	<jsp:param name="subQuoteId" value="<%=""+request.getParameter("answer(QuoteId)")%>" />	
	<jsp:param name="customerId" value="<%=""+request.getParameter("answer(Object::Customer::CustomerId)")%>" />	
	<jsp:param name="productId" value="<%=""+productId%>" />	
	<jsp:param name="productVerId" value="<%=""+productVerId%>" />
	<jsp:param name="prdGroupId" value="<%=""+groupId%>" />	
	<jsp:param name="prdGroupVerId" value="<%=""+groupVerId%>" />
	<jsp:param name="productStatus" value="<%=""+productStatus%>" />
	<jsp:param name="stateCode" value="<%=""%>" />
</jsp:include>