<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>



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
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:parameter id="parentQuoteId"  name="answer(ParentQuoteId)"  />
<bean:parameter id="ProductId"  name="answer(objectId)"  />
<bean:parameter id="productVerId"  name="answer(objectVerId)"  />

<bean:parameter id="SubQuoteId"  name="answer(SubQuoteId)"  />
<bean:parameter id="customerId"  name="answer(Object::Customer::CustomerId)"  />
<bean:parameter id="prdGroupId"  name="answer(prdGroupId)"  />
<bean:parameter id="prdGroupVerId"  name="answer(prdGroupVerId)" />
<bean:parameter id="productStatus"  name="answer(productStatus)"  />
<bean:parameter id="CustomerState"  name="answer(state)" />
<bean:parameter id="agencyId"  name="answer(Object::Agency::AgencyId)"  />


<bean:parameter id="policyVerId"  name="answer(policyVerId)"  />
<bean:parameter id="policyId"  name="answer(policyId)" />
<bean:parameter id="policyNumber"  name="answer(policyNumber)" />


<html:hidden name="Application" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
<html:hidden name="Application" property="answer(ProductId)" value="<%=ProductId.toString()%>" />
<html:hidden name="Application" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
<html:hidden name="Application" property="answer(SubQuoteId)" value="<%=SubQuoteId.toString()%>" />
<html:hidden name="Application" property="answer(customerId)" value="<%=customerId.toString()%>" />
<html:hidden name="Application" property="answer(prdGroupId)" value="<%=prdGroupId.toString()%>" />
<html:hidden name="Application" property="answer(prdGroupVerId)" value="<%=prdGroupVerId.toString()%>" />
<html:hidden name="Application" property="answer(productStatus)" value="<%=productStatus.toString()%>" />
<html:hidden name="Application" property="answer(CustomerState)" value="<%=CustomerState.toString()%>" />
<table width="100%">
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
			<tr>
					<td>
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
				</td>
				</tr>
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
		<td>
		&nbsp;
		</td>
	</tr>																
	<tr>
		<td class="links"  width="110px" align="left">
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>&answer(Object::Quote::PaymentPlan)"> Policy</a>			
		</td>
	</tr>
	<tr>
		<td>
		&nbsp;
		</td>
	</tr>
	<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>

	</table>
	
<body>
	
	<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
	objectVerId="0" objectName='<%="LOCATION"%>' applicationType="LOCATION" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveQuoteEILRiskApplicationAction.go?" isApplicationEnabled='<%="N" %>'  showOneTabAtTime="N"/>
	
	<logic:present name="Application" scope="request">

			<bean:define id="htmlPage" name="Application"
					type="java.lang.StringBuffer" />
						<%out.println(htmlPage.toString());%>
	</logic:present>
	<logic:notPresent name="Application" scope="request">
		<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

	</logic:notPresent>

<table>
<tr>
<td>

&nbsp;
</td>

</tr>

</table>
	<dmshtml:DisplayApplicationObjectList nameInSession="Application1"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
	objectVerId="0" objectName='<%=""%>' applicationType="RISK" applicationSubType="" objectType='<%="POLICY_RISK" %>' isSubApplicationCoveredByForm="Yes"  actionName="/saveQuoteEILRiskApplicationAction.go?TabPanelName=Quote_Panel" isApplicationEnabled='<%="N"%>'  showOneTabAtTime="N"/>
	<logic:present name="Application1" scope="request">

		<bean:define id="htmlPage1" name="Application1"
				type="java.lang.StringBuffer" />
					<%out.println(htmlPage1.toString());%>
	</logic:present>
	<logic:notPresent name="Application1" scope="request">
 		<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

	</logic:notPresent>
</body>
<script type="text/javascript">
if (document.forms[0].Zip != null && document.forms[0].Zip != undefined){
var zipFromUI = document.forms[0].Zip.value;
}
</script>