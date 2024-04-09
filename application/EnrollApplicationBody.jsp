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
<!--<script type="text/javascript">
	document.form[1].onsubmit = function() {
		if(document.getElementsByName("answer(RULE_OBJECT_TYPE)") != undefined && document.getElementsByName("answer(RULE_OBJECT_TYPE)") != null){
		 	var objName = document.getElementsByName("answer(RULE_OBJECT_TYPE)");
		 	alert(objName[1].value);
		 	for (var index = 0; index < objName.length; index++) {
		 		objName[index].value='MANDATORY';
		 	}
		}
	}
</script>

--></head>
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

<bean:define id="policyVerId" name="Application" property="answer(Object::Policy::ParentPolicyVerId)"  />
<bean:define id="policyId" name="Application" property="answer(Object::Policy::ParentPolicyId)" />
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
					<logic:equal value="TRUE" name="paramValue">
						<jsp:include page="../common/QuoteHeader.jsp" >
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="productVerId" value="<%=""+productVerId%>" />
							<jsp:param name="heading" value="<%="APPLICATION"%>" />	
						</jsp:include>
					</logic:equal>
					</logic:present>
					<logic:present name="paramValue">
					<logic:equal value="FALSE" name="paramValue">
						<jsp:include page="../common/QuoteHeader.jsp" >
							<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
							<jsp:param name="productVerId" value="<%=""+productVerId%>" />
							<jsp:param name="heading" value="<%="ELIGIBILITY"%>" />	
							<jsp:param name="titleHeading" value="<%="ELIGIBILITY"%>" />	
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
		<td class="links" width="150px">
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(policyNumber)=<%=""+policyNumber%>">Quote Summary</a>			
		</td>
		
			<logic:present name="paramValue">
			<logic:equal value="TRUE" name="paramValue">
					<td class="links"  width="150px">
						<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Risk::ResProperty::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(objectId)=0&answer(Object::Risk::ResProperty::ResPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(state)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>			
					</td>	   				
			</logic:equal>
			</logic:present>
	</tr>
	<tr>
		<td class="links">
		
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