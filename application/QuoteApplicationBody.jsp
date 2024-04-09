<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js">


</script>
<script type="text/javascript" src="../Scripts/JScripts/common.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js">
</script>

</head>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="parentQuoteId" name="Application" property="answer(ParentQuoteId)" scope="request" />
<bean:define id="ProductId" name="Application" property="answer(ProductId)" scope="request" />
<bean:define id="productVerId" name="Application" property="answer(ProductVerId)" scope="request" />

<bean:define id="SubQuoteId" name="Application" property="answer(SubQuoteId)" scope="request" />
<bean:define id="customerId" name="Application" property="answer(customerId)" scope="request" />

<bean:define id="prdGroupId" name="Application" property="answer(prdGroupId)" scope="request" />
<bean:define id="prdGroupVerId" name="Application" property="answer(prdGroupVerId)" scope="request" />
<bean:define id="productStatus" name="Application" property="answer(productStatus)" scope="request" />

<bean:define id="CustomerState" name="Application" property="answer(State)" scope="request" />
<bean:define id="agencyId" name="Application" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<html:hidden name="Application" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
<html:hidden name="Application" property="answer(ProductId)" value="<%=ProductId.toString()%>" />
<html:hidden name="Application" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
<html:hidden name="Application" property="answer(SubQuoteId)" value="<%=SubQuoteId.toString()%>" />
<html:hidden name="Application" property="answer(customerId)" value="<%=customerId.toString()%>" />
<html:hidden name="Application" property="answer(prdGroupId)" value="<%=prdGroupId.toString()%>" />
<html:hidden name="Application" property="answer(prdGroupVerId)" value="<%=prdGroupVerId.toString()%>" />
<html:hidden name="Application" property="answer(productStatus)" value="<%=productStatus.toString()%>" />
<html:hidden name="Application" property="answer(CustomerState)" value="<%=CustomerState.toString()%>" />

<table>
<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td >
			<table width="100%" align="Left" border="0">
				<jsp:include page="../common/QuoteHeader.jsp">
					<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="heading" value="<%=""%>" />
				</jsp:include>
			</table>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">		
				<jsp:include page="../common/QuotePlanInfoHeader.jsp" >
					<jsp:param name="subQuoteId" value="<%=""+SubQuoteId%>" />	
					<jsp:param name="customerId" value="<%=""+customerId%>" />	
					<jsp:param name="productId" value="<%=""+ProductId%>" />	
					<jsp:param name="productVerId" value="<%=""+productVerId%>" />
					<jsp:param name="prdGroupId" value="<%=""+prdGroupId%>" />	
					<jsp:param name="prdGroupVerId" value="<%=""+prdGroupVerId%>" />
					<jsp:param name="productStatus" value="<%=""+productStatus%>" />
				</jsp:include>
			</table>
		</td>
	</tr>
	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DISPLAY_RULES_MSG"}%>' connector='or' negated="true">
		<tr>
			<td class="Error">			
				<logic:present name="MESSAGE_LIST" scope="request">
					<ol>
					<logic:iterate id="message" name="MESSAGE_LIST">
						<li><bean:write name="message"/></li>
					</logic:iterate>
					</ol>			
				</logic:present>					
			</td>
		</tr>
	</dmshtml:dms_static_with_connector>


	<tr>
		<td class="links">
		
		</td>
	</tr>


	</table>
	<body>

	<logic:present name="applicationUI" scope="request">
		<bean:define id="htmlPage" name="applicationUI"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
	</logic:present>

<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>


</body>