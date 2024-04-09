<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<bean:define id="productVerId" name="AddParentQuote" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />



	<jsp:include page="../common/QuoteHeader3.0.jsp">
		<jsp:param name="parentQuoteId" value="<%=""+request.getParameter("answer(parentQuoteId)")%>" />
		<jsp:param name="productVerId" value="<%=""+productVerId%>" />
		<jsp:param name="heading" value="<%="UNDERWRITER WORKSHEET"%>" />		
	</jsp:include>