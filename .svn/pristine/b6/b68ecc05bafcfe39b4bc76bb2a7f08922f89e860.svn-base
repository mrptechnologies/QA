<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="subQuoteId" name="UWWorkSheet" property="answer(Object::Quote::Id)" />
<bean:define id="customerId" name="UWWorkSheet" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="ProductId" name="UWWorkSheet" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="productVerId" name="UWWorkSheet" property="answer(Object::Quote::ProductVerId)" scope="request" />
<bean:define id="groupId" name="UWWorkSheet" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="groupVerId" name="UWWorkSheet" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="productStatus" name="UWWorkSheet" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="stateCode" name="UWWorkSheet" property="answer(stateCode)" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="parentQuoteId" name="UWWorkSheet" property="answer(parentQuoteId)" scope="request" />
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />
<bean:define id="paretQuoteStatus" name="parentQuoteDetail" property="quoteStatus" scope="request"/>

<jsp:include page="../common/QuotePlanInfoHeader3.0.jsp" >
	<jsp:param name="subQuoteId" value="<%=""+subQuoteId%>" />	
	<jsp:param name="customerId" value="<%=""+customerId%>" />	
	<jsp:param name="productId" value="<%=""+ProductId%>" />	
	<jsp:param name="productVerId" value="<%=""+productVerId%>" />
	<jsp:param name="prdGroupId" value="<%=""+groupId%>" />	
	<jsp:param name="prdGroupVerId" value="<%=""+groupVerId%>" />
	<jsp:param name="productStatus" value="<%=""+productStatus%>" />
	<jsp:param name="stateCode" value="<%=""+stateCode%>"/>
	<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus %>" />
</jsp:include>