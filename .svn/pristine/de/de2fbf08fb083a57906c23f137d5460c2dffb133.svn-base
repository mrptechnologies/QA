<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+request.getParameter("answer(subQuoteId)")%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<bean:define id="productId" name="GetQuoteDetailByQuoteId" property="productId" />
<bean:define id="productVerId" name="GetQuoteDetailByQuoteId" property="productVerId" />
<bean:define id="productGroupId" name="GetQuoteDetailByQuoteId" property="productGroupId" />
<bean:define id="productGroupVerId" name="GetQuoteDetailByQuoteId" property="productGroupVerId" />
<jsp:include page="../common/QuotePlanInfoHeader3.0.jsp" >
	<jsp:param name="subQuoteId" value="<%=""+request.getParameter("answer(subQuoteId)")%>" />	
	<jsp:param name="customerId" value="<%=""+request.getParameter("answer(Object::Customer::CustomerId)")%>" />	
	<jsp:param name="productId" value="<%=""+productId%>" />	
	<jsp:param name="productVerId" value="<%=""+productVerId%>" />
	<jsp:param name="prdGroupId" value="<%=""+productGroupId%>" />	
	<jsp:param name="prdGroupVerId" value="<%=""+productGroupVerId%>" />
	<jsp:param name="productStatus" value="<%=""+request.getParameter("answer(productStatus)")%>" />
	<jsp:param name="stateCode" value="<%=""+request.getParameter("answer(stateCode)")%>"/>
</jsp:include>