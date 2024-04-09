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
<script type="text/JavaScript" SRC="../Scripts/JScripts/ApplicationTerritoryLookup.js">
</script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/QuoteEnroll.js">
</script>

<script type="text/javascript">
function setDefault(frm){

	/**
     * To set the Address1
     */
    
	 if(frm.StreetName!=null && frm.StreetName!= undefined && frm.StreetNumber!=null && frm.StreetNumber!= undefined ) {
	        frm.Address1.value=frm.StreetNumber.value+" "+frm.StreetName.value;
	        
	        
	 }

	return true;
	
}
</script>

</head>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="parentQuoteId" name="Application" property="answer(ParentQuoteId)" scope="request" />
<bean:define id="ProductId" name="Application" property="answer(objectId)" scope="request" />
<bean:define id="productVerId" name="Application" property="answer(objectVerId)" scope="request" />

<bean:define id="SubQuoteId" name="Application" property="answer(SubQuoteId)" scope="request" />
<bean:define id="customerId" name="Application" property="answer(customerId)" scope="request" />
<bean:define id="prdGroupId" name="Application" property="answer(prdGroupId)" scope="request" />
<bean:define id="prdGroupVerId" name="Application" property="answer(prdGroupVerId)" scope="request" />
<bean:define id="productStatus" name="Application" property="answer(productStatus)" scope="request" />
<bean:define id="CustomerState" name="Application" property="answer(State)" scope="request" />
<bean:define id="agencyId" name="Application" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<bean:define id="policyVerId" name="Application" property="answer(policyVerId)"  />
<bean:define id="policyId" name="Application" property="answer(policyId)" />
<bean:define id="policyNumber" name="Application" property="answer(policyNumber)" />


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
<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="RISK_AVAILABLE" />
<tr>
		<td colspan="2">
			<table width="100%" align="center" border="0">
				<!-- tr>
				<td>
					<table width="60%" align="Left" border="0" -->
					<logic:present name="paramValue">
					<logic:equal value="FALSE" name="paramValue">
						<jsp:include page="../common/DynamicPolicyHeader.jsp">
							<jsp:param name="policyId" value="<%=policyId.toString()%>" />
							<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
							<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
							<jsp:param name="title" value="<%="Policy Information"%>" />
						</jsp:include>
					</logic:equal>
					</logic:present>
					<!-- /table>
				</td>
			</tr -->
			</table>
		</td>
	</tr>

<tr>
								 	<td class="Error">
										<logic:present name="MESSAGE_LIST" scope="request">
											<ul>
												<logic:iterate id="message" name="MESSAGE_LIST">
													<li><bean:write name="message"/></li>
												</logic:iterate>
											</ul>			
										</logic:present>
									</td>
								</tr>
								
	<tr>
		<td class="links">
		&nbsp;
		</td>
	</tr>
	<tr>
		<td class="links" align="left" width="100px">
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>"> Policy</a>			
		</td>
	</tr>
	<tr>
		<td class="links">
		&nbsp;
		</td>
	</tr>
	<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>

	</table>
	<body>
<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="ErrorHandler" disabled="disabled" property="answer(temp)" value="" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
	<logic:present name="applicationUI" scope="request">
		<bean:define id="htmlPage" name="applicationUI"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
	</logic:present>

<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>


</body>
<script type="text/javascript">
if (document.forms[0].Zip != null && document.forms[0].Zip != undefined){
var zipFromUI = document.forms[0].Zip.value;
}
</script>