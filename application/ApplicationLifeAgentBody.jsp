<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js">


</script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js">
</script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/ApplicationTerritoryLookup.js">
</script>
</head>

<bean:define id="RiskState" name="Application" property="answer(State)" scope="request" />
<bean:define id="RiskTerritory" property="answer(riskTerritory)" name="Application" scope="request" />


<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>


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



<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>
<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	
	detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	
	%>
</logic:present>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<html:hidden property="answer(custState)" value='<%=detail.getCustomerState()%>' styleId="custState" />
<html:hidden property="answer(custCity)" value='<%=detail.getMCity()%>' styleId="custCity" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMCounty()%>' styleId="custCounty" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMZip()%>' styleId="custZip" />
<html:hidden property="answer(custStName)" value='<%=detail.getStreetName()%>' styleId="custStName" />
<html:hidden property="answer(custStNo)" value='<%=detail.getStreetNumber()%>' styleId="custStNo" />
<html:hidden property="answer(custAdd2)" value='<%=detail.getMAddress2()%>' styleId="custAdd2" />

<%
if(!(""+customerId).equals("")) {
	if(Long.parseLong(""+customerId)==0)	 {
		customerId=""+request.getParameter("answer(Object::Risk::ResProperty::CustomerId)");
	}
}
%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<%
String insuredState = "";
if (request.getParameter("answer(Object::Customer::State1)")!= null){%>
<bean:parameter id="defState1" name="answer(Object::Customer::State1)" />
<% 
insuredState = (String)defState1;
}else if(request.getParameter("answer(Object::Customer::State)")== null) { %>
	<bean:define id="defState" property="answer(Object::Customer::State)" name="AddCustomer" scope="session" />
<%
insuredState = (String)defState;
}else{ %>
	<bean:parameter id="paramState" name="answer(Object::Customer::State)" />
<% 
insuredState = paramState;
} %>

<table>

<tr>
		<td>
			<table WIDTH="780px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
							<tr>
								<td>
									<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table WIDTH="780px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">	
				
				<tr>
					<td>
				   	 <table width="100%" align="center" border="0">
						<!-- tr>
						<td>
							<table width="60%" align="Left" border="0" -->
								<jsp:include page="../common/QuoteHeader.jsp" >
									<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
									<jsp:param name="productVerId" value="<%=""+productVerId%>" />
									<jsp:param name="heading" value="<%="APPLICATION"%>" />	
								</jsp:include>
							<!-- /table>
						</td>
					</tr -->
					</table>

				  </td>
				</tr>
		
			</table>
					</td>
				</tr>
				<tr>
					<td>
						<table>
						 	<tr>
								<td class="links" width="150px">
									<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>&answer(Object::Policy::ParentPolicyId)=<%=""+policyId%>&answer(policyNumber)=<%=""+policyNumber%>">Quote Summary</a>			
								</td>
							</tr>
						</table>
							</td>
				</tr>  
			<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
			<html:hidden property="answer(userName)" value="<%=""+usernameId %>" styleId="usrIdfrmjsp"/>
			<html:hidden property="answer(cust)" value="<%=""+customerId %>"  />
			
			
</table>



	<body>
	

<!-- <table>
	<tr>
		<td class="error">
			<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="MultipleZipError" disabled="disabled" property="answer(temp)" value="Test Error Message Fro Zip Code" styleClass="txtbox" readonly="true" size="60" maxlength="60" />
		</td>
	</tr>
</table> -->

<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="ErrorHandler" disabled="disabled" property="answer(temp)" value="" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="<%=ProductId.toString() %>" objectVerId="<%=productVerId.toString() %>" objectName="PRODUCT" applicationType="RISK" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveLifeAgentApplicationAction.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>
<logic:notPresent name="Application" scope="request">
<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

</logic:notPresent>

<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>

</body>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/RiskApplication.js">
</script>