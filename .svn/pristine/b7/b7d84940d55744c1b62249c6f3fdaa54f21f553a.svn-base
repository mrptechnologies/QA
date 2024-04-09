<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request" />
<bean:define id="ProductVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />


	<jsp:include page="../common/QuoteHeader3.0.jsp">
		<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
		<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
		<jsp:param name="heading" value="<%="QUOTE SUMMARY"%>" />
		<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus %>" />
	</jsp:include>