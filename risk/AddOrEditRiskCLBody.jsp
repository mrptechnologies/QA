<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/CommercialLinesRisk.js">
</script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js"> 
</script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js">
</script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/ApplicationTerritoryLookup.js">
</script>
</head>

<bean:parameter id="RiskState" name="answer(state)" />
<bean:parameter id="RiskTerritory" name="answer(teritory)" />

<!--<bean:parameter id="RiskIdParam" name="answer(Object::Risk::ComProperty::ComPropertyId)" />-->
<bean:parameter id="RiskIdParam" name="answer(Object::Risk::ComProperty::ComPropertyId)" />
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="riskId" property="answer(Object::Risk::ComProperty::ComPropertyId)" name="AddRisk" /> 
<html:hidden property="answer(Object::Risk::ComProperty::ComPropertyId)" value='<%=riskId+""%>' styleId="riskID" />
<bean:define id="customerId" name="AddRisk" property="answer(Object::Risk::ComProperty::CustomerId)" />
<bean:define id="isShowOneTab" name="AddRisk" property="answer(showOnetTab)" />
<bean:parameter id="cusId" name="answer(Object::Risk::ComProperty::CustomerId)" />
<bean:parameter id="agencyId" name="answer(Object::Agency::AgencyId)" />

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
<html:hidden property="answer(teritory)" value='<%=RiskTerritory+""%>' styleId="Territory" />

<bean:define id="riskTypeSaved" property="answer(SelectedRiskType)" name="AddRisk"/>
<%
if(!(""+customerId).equals("")) {
	if(Long.parseLong(""+customerId)==0)	 {
		customerId=""+request.getParameter("answer(Object::Risk::ComProperty::CustomerId)");
	}
}
String riskTypeSelected=""+request.getParameter("answer(SelectedRiskType)");

if(riskTypeSelected.equals(""+null) || riskTypeSelected.equals("")){
	riskTypeSelected=""+riskTypeSaved;

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

<table>

<tr>
		<td>
			<table WIDTH="880px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
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
			<table WIDTH="1220px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">	
				
				<tr>
					<td>
				   	 <table width="880px" align="Left" border="0">
				    	 <tr>
				      		<td>
				      			<jsp:include page="../common/CLRiskHeader.jsp">
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
						<table width="80%" align="left" border="0">
							<tr>
								<td class="links" width="20%" align="left">
									<a href="../GetListCL.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=customerId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=insuredState.toString()%>&answer(Object::Risk::ComProperty::CustomerId)=<%=customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO"
  									title="Click to go to View Risk List"> Risks </a>

								</td>
								
								<td class="links" width="20%" align="left"> 
									<a href="/AddResProperty1.do?answer(TabPanelName)=Insured_Panel&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(state)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=GENERAL<%=" "%>LIABILITY"
									title="Click to go to Existing Quotes" />Add Risks</a>
					  			</td>
								
								<td class="links" width="20%" align="centre">  
									<a href="../AllQuotesCL.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=insuredState.toString()%>"
									title="Click to go to Existing Quotes" />Existing Quotes</a>
					  			</td>
								<td align="left" class="links" width="20%" >				
									<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
									<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/>
				
									<dmshtml:Get_Customer_HeaderDetail_ByCustomerId nameInSession="customerMap" customerId='<%=""+customerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
										<bean:define id="customerDetailMap" name="customerMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
										<%String EmpGrpState=customerDetailMap.getString("Object::Customer::State");%>
										<html:hidden property="answer(Object::Risk::RiskId)" value="1"/>
										<a href="../NewCLQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=ObjectId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&formName=form::GETCLQUOTEDETAILS&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=ownerId.toString()%>&answer(Object::Quote::CreatedBy)=<%=usernameId.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=EmpGrpState%>&answer(Object::Risk::RiskId)=1&answer(Object::Quote::NewQuote)=YES" title="Click to go to create a New Quote">New Quote</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>							
						<table width="100%" align="lefy" border="0">
							<tr>
							<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							<td class="FormLabels" align="center" width="30%">Risk Type
							<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>
							<select class="txtbox" name="answer(Object::Risk::RiskTypeName)" id="RiskType1" onchange="reloadPage(<%=cusId%>,<%=ownerId %>,<%=id %>,<%=RiskIdParam %>,this)">	
							
 									
								
										<%
										if(riskTypeList!=null){
											for(int i=0;i<riskTypeList.size();i++) {
												com.dms.ejb.data.QuestionHashMap riskTypeMap=(com.dms.ejb.data.QuestionHashMap)riskTypeList.get(i);	
										%>
														
											<%String riskType=riskTypeMap.getString("Object::Risk::RiskTypeName");%>
											<%String riskTypeDesc=riskTypeMap.getString("Object::Risk::RiskTypeDesc");%>
											<option value ='<%=riskType%>'><%=riskTypeDesc %></option>											
											<%}
										}%>	 																												
								</select>
							</td>
							<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr> 
								
			<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
			<html:hidden property="answer(userName)" value="<%=""+usernameId %>" styleId="usrIdfrmjsp"/>
			<html:hidden property="answer(cust)" value="<%=""+customerId %>" styleId="custId" />			
			<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("TabPanelName") %>" />
			<html:hidden property="answer(SelectedRiskType)" value="<%=""+riskTypeSelected %>" styleId="selectedRiskType"/>
</table>



	<body>
	
	
<!-- <table>
	<tr>
		<td class="links">
			Show All Tab<a href="/AddResProperty.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ComProperty::CustomerId)=<%=customerId.toString()%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=<%=RiskIdParam.toString()%>&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=RiskTerritory.toString()%>&answer(state)=<%=RiskState.toString()%>&tabNo=0&answer(showOnetTab)=N&answer(Object::Agency::AgencyId)=<%=id.toString()%>"><img src="../Images/radio.jpg" border="0"></a>Yes 
			<a href="/AddResProperty.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ComProperty::CustomerId)=<%=customerId.toString()%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=<%=RiskIdParam.toString()%>&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=RiskTerritory.toString()%>&answer(state)=<%=RiskState.toString()%>&tabNo=0&answer(showOnetTab)=Y&answer(Object::Agency::AgencyId)=<%=id.toString()%>"><img src="../Images/radio.jpg" border="0"></a>No
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
<div id="RISK_CONTAINER">
<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="ErrorHandler" disabled="disabled" property="answer(temp)" value="" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName='<%=riskTypeSelected%>' applicationType="RISK" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveCLRiskApplicationAction.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>
<logic:notPresent name="Application" scope="request">
<html:text style="border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" disabled="disabled" property="answer(Object::Risk::ErrorHandler)" value="Wrong Territory was associated with the Risk" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		

</logic:notPresent>

<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
</div>
</body>
<SCRIPT type="text/JavaScript">
var riskid=document.getElementById("riskID").value

document.getElementById("RiskType1").value=document.getElementById("selectedRiskType").value;
document.Detail.RiskType.value=document.getElementById("RiskType1").value;
if(parseInt(riskid)==-1){
document.Detail.RiskName.value=document.getElementById("RiskType1").value;
}

function setDefault(frm){	 
if(frm.name=='UnderlyingPolicies' || frm.name=='AdditionalInterest') {
		if(document.getElementsByName("answer(Object::Risk::ComProperty::ComPropertyId)")[0].value==-1) {
			alert('Please Update the Detail Tab Information');
			dolphintabs.init('dolphinnav', 0);
			return false;
		} 	
	}		 
	 
return true;
}
</script>


<!-- <SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/RiskApplication.js">
</script> -->