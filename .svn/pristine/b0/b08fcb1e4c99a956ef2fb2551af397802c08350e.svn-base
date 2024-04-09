<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>



<%String parentQuoteId="";
String ProductVerId="";
String paretQuoteStatus="";
String  policyNumber="";
String customerId=""; %>
<logic:present name="QuoteDetail" scope="request">
	<bean:define id="parentQuoteId1" name="QuoteDetail" property="answer(parentQuoteId)" scope="request" />
	  <%parentQuoteId=""+parentQuoteId1;
	  if(parentQuoteId.equals("")){%>
	  <bean:define id="parentQuoteId1" name="QuoteDetail" property="answer(Object::Quote::ParentQuoteId)" scope="request" />
	   <%parentQuoteId=""+parentQuoteId1;
	   if(parentQuoteId.equals("")){%>
		   <bean:parameter name="ParentQuoteId" id="parentQuoteId1"/>
		   <%parentQuoteId=""+parentQuoteId1;
	   }
	  }%>
	<bean:define id="ProductVerId1" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />
	  <%ProductVerId=""+ProductVerId1;%>
	<bean:define id="paretQuoteStatus1" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
	  <%paretQuoteStatus = ""+paretQuoteStatus1;%>
	<bean:define id="policyNumber1" name="QuoteDetail" property="answer(Object::Quote::PolicyNumber)" />
	  <%policyNumber = ""+policyNumber1;%>
	<bean:define id="customerId1" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
	 <%customerId = ""+customerId1;%>
</logic:present>

<logic:notPresent name="QuoteDetail" scope="request">
	<bean:parameter name="ParentQuoteId" id="parentQuoteId1"/>
	 <%parentQuoteId=""+parentQuoteId1;%>
	<bean:parameter name="productVerId" id="ProductVerId1"/>
	 <%ProductVerId=""+ProductVerId1;%>
	<bean:parameter name="paretQuoteStatus" id="paretQuoteStatus1"/>
	 <%paretQuoteStatus = ""+paretQuoteStatus1;%>
	<bean:parameter name="policyNumber" id="policyNumber1"/>
	 <%policyNumber = ""+policyNumber1;%>
	<bean:parameter name="customerId" id="customerId1"/>
	 <%customerId = ""+customerId1;%>
</logic:notPresent>

<jsp:include page="../common/PolicyQuoteHeaderMin.jsp">
	<jsp:param name="ParentQuoteId" value="<%=""+parentQuoteId%>" />
	<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
	<jsp:param name="heading" value="<%="QUOTE SUMMARY"%>" />
	<jsp:param name="paretQuoteStatus" value="<%=""+paretQuoteStatus%>" />
	<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
	<jsp:param name="customerId" value="<%=""+customerId%>" />
</jsp:include>