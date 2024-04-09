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

<bean:parameter id="RiskState" name="answer(state)" />
<bean:parameter id="RiskTerritory" name="answer(teritory)" />

<bean:parameter id="RiskIdParam" name="answer(Object::Risk::ResProperty::ResPropertyId)" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="riskId" property="answer(Object::Risk::ResProperty::ResPropertyId)" name="AddRisk" /> 
<bean:define id="customerId" name="AddRisk" property="answer(Object::Risk::ResProperty::CustomerId)" />
<bean:define id="isShowOneTab" name="AddRisk" property="answer(showOnetTab)" />
<bean:parameter id="cusId" name="answer(Object::Risk::ResProperty::CustomerId)" />

<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>
<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=cusId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	
	detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	
	%>
</logic:present>

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
<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddRisk"/>
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

<table WIDTH="100%">

<tr>
		<td>
			<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
				<tr>
					<td valign="top">
						<table width="100%" align="Left" border="0"bgcolor="#C6DEEA" >
							<tr>
								<td>
									<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">	
				
				<tr>
					<td>
				   	 <table width="100%" align="Left" border="0">
				    	 <tr>
				      		<td>
				      			<jsp:include page="../common/RiskHeader.jsp">
				      			 	<jsp:param name="parentRiskId" value="<%=RiskIdParam.toString()%>" />
				      			 	<jsp:param name="agencyId" value="<%=id.toString()%>" />
				      			 </jsp:include>
				       		 </td>
				    	</tr>
				    </table>
				  </td>
				</tr>
		
			</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" align="center" border="0">
							<tr>
								<td class="links" >
									<a href= "/GetList.do?answer(TabPanelName)=Insured_Panel&answer(Object::Customer::State)=<%=""+insuredState%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&&answer(Object::Risk::ResProperty::CustomerId)=<%=""+customerId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(objectId)=0&answer(Object::Risk::ResProperty::ResPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(state)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0"  title="Click to go to View Risk List"> Risks </a>
								</td>
								<td class="links"  align="center">  
									<a href="../AllQuotesPC.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=insuredState.toString()%>"
							title="Click to go to Existing Quotes" />Existing Quotes</a>
					  			</td>
								<td align="left" class="links"  >				
									<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
									<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/>
																		<!--  to get RiskTypeId based on ownerid  and riskType Start -->
									<dmshtml:getRiskHeaderInfoByInsuredId nameInSession="arrRiskTypes" insuredId="<%=customerId.toString()%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
									<%String RiskType = ""; %>
									<logic:present name="arrRiskTypes" scope="request">
									<bean:define id="arrRiskTypes" name="arrRiskTypes" type="java.util.ArrayList"/>
									<%for(int i=0;i<arrRiskTypes.size();i++) {
										com.dms.ejb.data.QuestionHashMap riskMap=(com.dms.ejb.data.QuestionHashMap)arrRiskTypes.get(i);	
										RiskType=riskMap.getString("Object::Risk::ResProperty::RiskType"); %>
									<%}%>
									</logic:present>
									<% String riskTypeId = ""; %>
									<dmshtml:GetRiskTypeId nameInSession="riskTypeIds" riskType="<%=""+RiskType%>" ownerId='<%=""+ownerId%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
									<logic:present name="riskTypeIds" scope="request">
									<bean:define id="riskTypeId1" name="riskTypeIds"/>
									<%riskTypeId = ""+riskTypeId1;%>
									</logic:present>
									<!--  to get RiskType id end -->
									
				
									<dmshtml:Get_Customer_HeaderDetail_ByCustomerId nameInSession="customerMap" customerId='<%=""+customerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
										<bean:define id="customerDetailMap" name="customerMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
										<%String EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>
										<html:hidden property="answer(Object::Risk::RiskId)" value='<%=""+riskTypeId%>'/>
										<a href="../NewPCQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&formName=form::ADDQUOTEDETAILSALLRISK_<%=ownerId.toString()%>&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=usernameId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>&answer(Object::Risk::RiskId)=<%=""+riskTypeId%>&answer(Object::Quote::NewQuote)=YES" title="Click to go to create a New Quote">New Quote</a>
								</td>					  			
							 	 
							</tr>
						</table>
					</td>
				</tr>  
			<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
			<html:hidden property="answer(userName)" value="<%=""+usernameId %>" styleId="usrIdfrmjsp"/>
			<html:hidden property="answer(cust)" value="<%=""+customerId %>"  />
			
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			
</table>



	<body>
	
<!-- <table>
	<tr>
		<td class="links">
			Show All Tab<a href="/AddResProperty.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::CustomerId)=<%=customerId.toString()%>&answer(objectId)=0&answer(Object::Risk::ResProperty::ResPropertyId)=<%=RiskIdParam.toString()%>&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=RiskTerritory.toString()%>&answer(state)=<%=RiskState.toString()%>&tabNo=0&answer(showOnetTab)=N&answer(Object::Agency::AgencyId)=<%=id.toString()%>"><img src="../Images/radio.jpg" border="0"></a>Yes 
			<a href="/AddResProperty.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ResProperty::CustomerId)=<%=customerId.toString()%>&answer(objectId)=0&answer(Object::Risk::ResProperty::ResPropertyId)=<%=RiskIdParam.toString()%>&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=RiskTerritory.toString()%>&answer(state)=<%=RiskState.toString()%>&tabNo=0&answer(showOnetTab)=Y&answer(Object::Agency::AgencyId)=<%=id.toString()%>"><img src="../Images/radio.jpg" border="0"></a>No
		</td>
	</tr>
</table> -->

<!-- <table>
	<tr>
		<td class="error">
			<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="MultipleZipError" disabled="disabled" property="answer(temp)" value="Test Error Message Fro Zip Code" styleClass="txtbox" readonly="true" size="60" maxlength="60" />
		</td>
	</tr>
</table> -->

<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="ErrorHandler" disabled="disabled" property="answer(temp)" value="" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName="HOME_RISK" applicationType="RISK" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveRiskApplicationAction.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
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