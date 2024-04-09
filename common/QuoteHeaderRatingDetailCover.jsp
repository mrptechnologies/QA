<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="parentQuoteDetail" name="PARENT_QUOTE_DETAIL" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
<bean:define id="productVerId" name="parentQuoteDetail" property="productVerId" />

	<jsp:include page="../common/QuoteHeader3.0.jsp">
		<jsp:param name="parentQuoteId" value="<%=""+request.getParameter("answer(parentQuoteId)")%>" />
		<jsp:param name="productVerId" value="<%=""+productVerId%>" />
		<jsp:param name="heading" value="<%="Rating Detail"%>" />		
	</jsp:include>