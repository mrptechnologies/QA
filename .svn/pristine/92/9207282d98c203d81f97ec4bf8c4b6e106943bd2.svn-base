<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="parentQuoteId" name="Application" property="answer(ParentQuoteId)" scope="request" />
<bean:define id="productVerId" name="Application" property="answer(productVerId)" scope="request" />
	<jsp:include page="../common/QuoteHeader3.0.jsp">
		<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
		<jsp:param name="productVerId" value="<%=""+productVerId%>" />					
		<jsp:param name="heading" value="<%="QUOTE APPLICATION"%>" />		
	</jsp:include>