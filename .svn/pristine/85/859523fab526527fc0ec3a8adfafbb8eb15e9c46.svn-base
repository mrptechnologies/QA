<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="parentQuoteId" name="DeclineQuote" property="answer(parentQuoteId)" scope="request" />
<bean:define id="productVerId" name="DeclineQuote" property="answer(productVerId)" scope="request" />
	<jsp:include page="../common/QuoteHeader3.0.jsp">
		<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
		<jsp:param name="productVerId" value="<%=""+productVerId%>" />
		<jsp:param name="heading" value="<%="Rating Detail"%>" />
	</jsp:include>