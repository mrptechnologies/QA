<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="parentQuoteId" name="SearchActivityManagerAction5" property="answer(parentQuoteId)" scope="request" />
<bean:define id="productVerId" name="SearchActivityManagerAction5" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="paretQuoteStatus" name="SearchActivityManagerAction5" property="answer(Object::Quote::QuoteStatus)" />
	<jsp:include page="../common/QuoteHeader3.0.jsp">
		<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
		<jsp:param name="productVerId" value="<%=""+productVerId%>" />
		<jsp:param name="heading" value="<%=""%>" />
		<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus %>" />	
	</jsp:include>