<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>
<SCRIPT type="text/javascript">

		
		function setBillingAddress(){	

			var formElement=document.forms[0];
			if(formElement.BillingAddressSame.checked==true)
			{
			formElement.BillingStreetName.value=formElement.StreetName.value;
			formElement.BillingAddress2.value=formElement.Address2.value;
			formElement.BillingCity.value=formElement.City.value;
			formElement.BillingCounty.value=formElement.County.value;
			formElement.BillingState.value=formElement.State.value;
			formElement.BillingZip.value=formElement.Zip.value;		
			} 
		}
		
	
		
//Notes value truncated issue
function maxLengthTextArea() {
	var field = document.forms[0].BusinessDesc;
	if ( field.value.length > 1024 )
  	{
  	
    	field.value = field.value.substring( 0, 1024 );
    	alert( "Quote Notes value can only be 1024 characters in length." );
    	return false;
  	}   		
}


</SCRIPT>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<html:form action="/SaveLIUInsured"  focus="InsuredName" onsubmit="return validateAddInsuredCLFields()">

<%String agencyIdTemp="";%> 
<%String agencyIdtoLink="";%>
<%String strAgentFName="";%>
<%String strAgentLName="";%>
<%long lngAgentId1=0;%>
<%long lngAgencyTemp=0;%>
<%long agencyId2=0;%>
<%String agencyName2="";%>
<%long generalagencyid2=0;%>
<%String generalagencyname2="";
String agencyAgentId="";%>

<%if (request.getParameter("agencyIdtoLink")!= null) {
agencyIdtoLink=request.getParameter("agencyIdtoLink");
agencyId2=Long.parseLong(agencyIdtoLink.toString());
}%>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />
<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
<html:hidden property="formName" value="form::LINKCUSTOMER" />

<!-- Logic to set Billing Address Yes/no option button -->
<bean:define id="isBillingAddressSame" name="AddCustomer" property="answer(Object::Customer::BillingAddressSame)" /> 
<html:hidden name="AddCustomer" property ="answer(Object::Customer::BillingAddressSamehidden)" styleId="hidIsBillingSame" value="<%=isBillingAddressSame+"" %>"/>			


<table WIDTH="500px" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" align="left">
			<table WIDTH="1200px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<logic:present name="staleDataSubmissionMsg"  scope="request">
					<tr>
						<td class="Error" >
							<bean:message key="error.staleDataSubmissionMsg"/>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</logic:present>
				<tr>
					<td colspan="3">
						<logic:notPresent name="staleDataSubmissionMsg"  scope="request">
						<table WIDTH="1200px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
							<tr>
								<td valign="top">
									<table width="580px" align="Left" border="0"bgcolor="#C6DEEA" >
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												<bean:message key="Top.EmployerGroupName"/>
											</td>
											<td class="FormLabels" align="left"  colspan="1" width="220px">
												<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)' />" >
												<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerName)'/></a>
											</td>
										</tr>	
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												<bean:message key="Top.CreatedBy"/>
											</td>
											<td class="FormLabels" align="left"  colspan="1" width="220px">
												<bean:write name='AddCustomer' property='answer(Object::Customer::CreatedBy)'/></a>
											</td>
										</tr>			
									<!-- /td -->
									</table>
								</td>
								<td valign="top">
									<table width="420px" align="Left" border="0"bgcolor="#C6DEEA" >
										<tr>
											<td  class="FormLabels" align="left" colspan="1">
												<bean:message key="Top.AgencyName"/>
											</td> 
											<td class="sectionhead1" align="left" colspan="2" >
												<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
												<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
												
	
	<!-- ********************agency, agent, general ageny details by link *********************-->
	
												<bean:define id="agencyIdTemp1" name="AddCustomer" property="answer(Agency::AgencyId)"/>
												<%if(!agencyIdTemp1.toString().equals("")) {
													if((agencyIdTemp1.toString().indexOf("::"))>0){														
													String ids[]=(""+agencyIdTemp1).split("::");
									       			agencyIdTemp1=ids[0];
									       			agencyAgentId=ids[1];
													}
													
												agencyIdTemp=agencyIdTemp1.toString();	
												lngAgencyTemp=Long.parseLong(agencyIdTemp);
												if(lngAgencyTemp>0){%>
													<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
													
													<logic:present name="agencyDetail2" scope="request">
														<bean:define id="agdetail2" name="agencyDetail2" scope="request"
																				type="com.dms.ejb.data.QuestionHashMap" />
														<%agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
														<%agencyName2=agdetail2.getString("agencyname");%>
														<%generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
														<%generalagencyname2=agdetail2.getString("generalagencyname");%>
													</logic:present>
												<%}%>
									
												<bean:define id="AgentId1" name="AddCustomer" property="answer(AgentId)"/>
												<%long lgAgentId1=0;
														try {
														System.out.println("AgntAgncy ID was:="+agencyAgentId);
														if(!agencyAgentId.equals("")){
															AgentId1=agencyAgentId;
														}
														lgAgentId1=Long.parseLong(AgentId1.toString());															
													} catch(Exception ex){} %>
													
												<%if(lgAgentId1>0){%>
													<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId='<%=""+lgAgentId1%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
													<logic:present name="agentDetail" scope="request">
														<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
														<%lngAgentId1=lgAgentId1;%>
														<%strAgentFName=agentDetail1.getString("agentfname");%>
														<%strAgentLName=agentDetail1.getString("agentlname");%>
													</logic:present>
												<%}%>

<!-- *********************************************************************************************-->
												<%}else{%>
<!-- ********************agency, agent, general ageny details by customer id *********************-->
												<%
												if(!cId.toString().equals("")){
												%>
													<%long agencyId=0;%>
													<%long lngGeneralAgencyId=0;%>
													<%long lngAgentId=0;%>
													<%String agencyName="";%>
													<%String generalAgencyName="";%>
													<%String agentFName="";%>
													<%String agentLName="";%>
													<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
													<logic:present name="customerDetail1" scope="request">
														<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																							type="com.dms.ejb.data.QuestionHashMap" />
														<%try{%>
														<%agencyId=Long.parseLong(customerDetailMap.getString("agencyid"));%>
														<%}catch(Exception nfe) {agencyId=0;    }%>
														<%try{%>
														<%lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));%>
														<%}catch(Exception nfe) {lngAgentId=0;    }%>
														<%agencyName=customerDetailMap.getString("agencyname");%>
														<%agentFName=customerDetailMap.getString("agentfirstname");%>
														<%agentLName=customerDetailMap.getString("agentlastname");%>
														<%try{%>
														<%lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));%>
														<%}catch(Exception nfe) {lngGeneralAgencyId=0;    }%>
														<%generalAgencyName=customerDetailMap.getString("generalagencyname");%>
														<%agencyIdTemp=""+agencyId;
														lngAgencyTemp=Long.parseLong(agencyIdTemp);
														agencyId2=Long.parseLong(agencyIdTemp);
														agencyName2=agencyName;
														generalagencyid2=lngGeneralAgencyId;
														generalagencyname2=generalAgencyName;
														lngAgentId1=lngAgentId;
														strAgentFName=""+agentFName;
														strAgentLName=""+agentLName;
														%>
													</logic:present>
										
													<%} else {%>

<!-- ************Agency agent, general agenct detail by user id ******************************-->
												<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
												<logic:present name="agencyIdent" scope="session">
													<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
													<%
													agencyIdTemp=agencyIdid.toString();
													try {
														lngAgencyTemp=Long.parseLong(agencyIdTemp);
													} catch(Exception ex){} %>
													</logic:present>
													<%if(lngAgencyTemp>0){%>
														<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
														<logic:present name="agencyDetail2" scope="request">
															<bean:define id="agdetail2" name="agencyDetail2" scope="request"
																					type="com.dms.ejb.data.QuestionHashMap" />
															<% agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
															<% agencyName2=agdetail2.getString("agencyname");%>
															<% generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
															<% generalagencyname2=agdetail2.getString("generalagencyname");%>
														</logic:present>
													<%}%>
													<bean:define id="AgentId2" name="AddCustomer" property="answer(AgentId)"/>
													
													<%long lgAgentId2=0;
														try {
														lgAgentId2=Long.parseLong(AgentId2.toString());
														
													} catch(Exception ex){} %>
													<%if(lgAgentId2>0){%>
														<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+lgAgentId2%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
														<logic:present name="agentDetail" scope="request">
															<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
															<%lngAgentId1=lgAgentId2;%>
															<%strAgentFName=agentDetail1.getString("agentfname");%>
															<%strAgentLName=agentDetail1.getString("agentlname");%>
														</logic:present>
													<%}else {%>
														<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
														<%String objType="";%>
														<logic:present name="objectDescriptor" scope="request">
														<bean:define id="objDescType" name="objectDescriptor" property="objectType"/>
														<bean:define id="objDescId" name="objectDescriptor" property="objectId" />														
														<%long lgObjAgentId=0;
														try {
															lgObjAgentId=Long.parseLong(objDescId.toString());
														} catch(Exception ex){} %>
														<%if(lgObjAgentId>0){%>
															<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+objDescId%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
															<logic:present name="agentDetail" scope="request">
																<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
																<%lngAgentId1=lgObjAgentId;%>
																<%strAgentFName=agentDetail1.getString("agentfname");%>
																<%strAgentLName=agentDetail1.getString("agentlname");%>
															</logic:present>
														<%} %>	
														</logic:present>										
												<%	}%>
												<!--/logic:present-->
<!-- ****************************************************************************************** -->
													<%}%>
												<%}%>
														
											<!-- GENERAL BLOCK -->
													<%
													if(agencyId2>0){ %>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="true">	
														<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+agencyId2%>&primaryObjectId=<%=""+agencyId2%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" title="Agency" ><%=agencyName2%></a>
														</dmshtml:dms_static_with_connector >
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="false">
														<a><%=agencyName2%></a>
														</dmshtml:dms_static_with_connector >	
												<%}%>
												<%if(dataBaseIdViewPrivillage==1) {%>
														<%="- "%><%=""+agencyId2%>
														<%}%>
											</td>

	<!-- <tr>
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												<bean:message key="Top.AgencyName"/>
											</td> 
											<td  class="FormLabels" align="left"  colspan="1" width="220px">
									
												<%if(generalagencyid2>0){%>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="true">	
													<a href="../EditGAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&ReadOnly=Yes&agencyId=<%=""+generalagencyid2%>&primaryObjectId=<%=""+generalagencyid2%>&primaryObjectType=GENERAL_AGENCY"><%=generalagencyname2%></a>
													</dmshtml:dms_static_with_connector >
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="false">
													<%=generalagencyname2%>
													</dmshtml:dms_static_with_connector >
													
												<%}%>
											
												<%if(dataBaseIdViewPrivillage==1) {%>
												<%="- "%><%=""+generalagencyid2%>
												<%}%>
											</td>
	</tr> -->
											<logic:present name="customerDetail1" scope="request">
												<bean:define id="customerDetailMap" name="customerDetail1"  type="com.dms.ejb.data.QuestionHashMap" />
												<%customerCreatedDate = customerDetailMap.getString("customerCreatedDate"); %>
											</logic:present>
										</tr>
										
										
										<tr>
											<td class="FormLabels" align="left" colspan="1">
												<bean:message key="Top.AgentName"/>
											</td> 
											<td class="sectionhead1" align="left" colspan="2">
												<%
												if(!strAgentLName.equals("") || !strAgentFName.equals("")){%>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="true">
													<a href="../GetAgentSummaryDetail.do?ReadOnly=Yes&entityId=<%=""+lngAgentId1%>" onclick="return AgentPopup(this,'Agent');" title="Agent"><%=strAgentFName%> <%=" "%><%=strAgentLName%></a>
													</dmshtml:dms_static_with_connector >
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="false">
													<a><%=strAgentFName%> <%=" "%><%=strAgentLName%></a>
													</dmshtml:dms_static_with_connector >	
												
												<%}%>
											</td>
							
										</tr>										
										
										
									<!--  <tr>
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												<bean:message key="Top.CreatedDate"/>
											</td>
											<td class="FormLabels" align="left"  colspan="1" width="220px">
												<%= customerCreatedDate%>
											</td>
										</tr>
									 -->
									</table>
								</td>
							</tr>
							
							
<!-- GENERAL BLOCK STOP -->
						</table>
						<table WIDTH="1200px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">

							<tr>
								<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT INSURED INFORMATION</td>
							</tr>
							<tr>
								<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
							</tr>

					</logic:notPresent>

							<tr>
								<td class="links" width="30%">
									<logic:present name ='arrObjectDetail' scope ='session'>
									<logic:iterate id="arrObjectDetail" name="arrObjectDetail" scope="session" >
									<bean:define id="custid" name="arrObjectDetail" property="id"/> 

<!--/logic:present-->

									<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/> 
									<a href="../GetLocationList.do?answer(TabPanelName)=Insured_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&customerId=<%=""+custid%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+custid%>&answer(Object::Customer::CustomerId)=<%=""+custid%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custid%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""+custState%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custid%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO"
										 title="Click to go to Show All Risks" />Locations</a>
										
								</td>
								
									<td class="links" width="30%">  <a href="../AllQuotesCL.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Customer::State)=<%=custState.toString()%>" title="Click to go to Quotes" />Quotes</a>  </td>
									<%String polType="POLICY"; %>
									<td class="links" width="30%">
										<a href="../GetPolicyListAction.do?TabPanelName=Policy_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Policy::PolicyType)=<%=polType %>" title="Click to go to Policies">Policies</a>
									</td>
									
								<!-- LIU Webservice test link starts -->	
							   <!--  <td class="links" width="30%">
										<a href="../webservice/liu/UpdateProcessedTran.jsp?TabPanelName=Insured_Panel&answer(OWNERID)=<%=ownerId.toString()%>" title="Click to go to UpdateProcessedTran">UpdateProcessedTran</a>
									</td> 
								 -->
								<!-- LIU Webservice test link ends -->	
								
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DandB_INFORMATIONACCESS"}%>' connector='or' negated="true">
									
									</dmshtml:dms_static_with_connector>
<!--/logic:present-->	
								</logic:iterate>
								</logic:present>
							</tr>
							
						</table>
					</td>
				</tr>
				<logic:present name="xmlValidationErrorList"  scope="request" >
				<tr>
					<td colspan="3">
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="sectionheadblackbig" align="center"><u><b><%="XML Has been generated with following validation Errors"%></b></u>
								</td>
							</tr>

							<tr>
								<td class="Error" WIDTH="100%">
									<ol>
										<bean:define id="arrList" name="xmlValidationErrorList" type="java.util.ArrayList"/>
										<logic:iterate id="errMsg" name="arrList" type="java.lang.String">
											<li>
											<%=errMsg%>
										</li>
										</logic:iterate>
									</ol>
								</td>
							</tr>
						</table>	
					</td>
				</tr>
				</logic:present >
	
    
				<%
				boolean errorOccured=false;
				%>
				<bean:define id="ansmap" name="AddCustomer" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
				<logic:iterate id="element" name="ansmap">
					<bean:define id="errorListkey" name="element" property="key" />
					<logic:equal name="errorListkey" value="Object::error::list">
						<bean:define id="errorListvalue" name="element" property="value" />
						<logic:iterate id="errmsg" name="errorListvalue">
							<tr>
							<td class="Error">
							<bean:write name="errmsg" property="errorMessage" />
				
							 <%
				        		errorOccured	=true;
								
							%>
							</td>
							</tr>
						</logic:iterate>
					</logic:equal>
				</logic:iterate> 

				<%
				if(errorOccured)
				{
					((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
				}
				%>
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_INSURED_AGENCY"}%>' connector='or' negated="true">	
				<tr>
					<td align="left" colspan="2">
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td class="sectionhead" align="center">Agency Information</td>
							
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td> &nbsp;</td>
							</tr>

						</table>
					</td>
				</tr>
				
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							
							<tr>
								<td class="FormLabels" align="left" width="40%"> 
									&nbsp;&nbsp;Agency *
								</td>	
								<td class="links" width="29%">&nbsp;<html:text  name="AddCustomer" property ="answer(AgencyName)" value='<%=agencyName2%>' size="30" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" />
								</td>
								<td>	
									<IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButtonLIU()">
									
								</td>
							</tr>
						 	
						</table>

					</td>
				</tr>
				</dmshtml:dms_static_with_connector>
				
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td class="sectionhead" align="center">Insured Information</td>							
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					
							
								<td> &nbsp;</td>
							
						
				</tr>
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td colspan="2" align="right" class="links" >
							
								 	<html:hidden name="AddCustomer" property ="answer(Object::Customer::CustomerId)" styleId="CustomerID" />				
						
							<tr>
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Named Insured*</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="60" maxlength="120" styleClass="txtbox" styleId="InsuredName" /></td>
							</tr>																																						
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Address Line1</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::StreetName)" size="24" maxlength="25" styleClass="txtbox" styleId="StreetName"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Address Line2</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="24" maxlength="60" styleClass="txtbox" styleId="Address2"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.City" /></td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::City)" size="20" maxlength="40" styleClass="txtbox" styleId="City"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;County Name</td>
								<td class="links">&nbsp;<html:text   property="answer(Object::Customer::County)" size="20" maxlength="20" styleClass="txtbox" styleId="County"/></td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="AddCustomer.State"/>*</td>
							
								<td class="links" style="Class:txtbox">&nbsp;<html:select name="AddCustomer" property="answer(Object::Customer::State)" styleClass="txtbox" styleId="State">
									<html:option value ="" styleClass="txtbox">Select A State</html:option>
									   		
										<html:option value="AL">Alabama</html:option>		    
									    <html:option value="AK">Alaska</html:option>		    
									    <html:option value="AS">American Samoa</html:option>
									    <html:option value="AZ">Arizona</html:option>	    
									    <html:option value="AR">Arkansas</html:option>		    
									    <html:option value="CA">California</html:option>		    
									    <html:option value="CO">Colorado</html:option>		    
									    <html:option value="CT">Connecticut</html:option>		    
									    <html:option value="DE">Delaware</html:option>		    
									    <html:option value="DC">District of Columbia</html:option>		    
									    <html:option value="FM">Federated States of Micronesia</html:option>		    
									    <html:option value="FL">Florida</html:option>		    
									    <html:option value="GA">Georgia</html:option>		    
									    <html:option value="GU">Guam</html:option>		    
									    <html:option value="HI">Hawaii</html:option>		    
									    <html:option value="ID">Idaho</html:option>		    
									    <html:option value="IL">Illinois</html:option>		    
									    <html:option value="IN">Indiana</html:option>		    
									    <html:option value="IA">Iowa</html:option>		    
									    <html:option value="KS">Kansas</html:option>	    
									    <html:option value="KY">Kentucky</html:option>		    
									    <html:option value="LA">Louisiana</html:option>		    
									    <html:option value="ME">Maine</html:option>		    
									    <html:option value="MH">Marshall Islands</html:option>		    
									    <html:option value="MD">Maryland</html:option>		    
									    <html:option value="MA">Massachusetts</html:option>		    
									    <html:option value="MI">Michigan</html:option>
									    <html:option value="MN">Minnesota</html:option>
									    <html:option value="MS">Mississippi</html:option>
									    <html:option value="MO">Missouri</html:option>
									    <html:option value="MT">Montana</html:option>
									    <html:option value="NE">Nebraska</html:option>
									    <html:option value="NV">Nevada</html:option>
									    <html:option value="NH">New Hampshire</html:option>
									    <html:option value="NJ">New Jersey</html:option>
									    <html:option value="NM">New Mexico</html:option>
									    <html:option value="NY">New York</html:option>
										<html:option value="NC">North Carolina</html:option>
									    <html:option value="ND">North Dakota</html:option>
									    <html:option value="MP">Northern Mariana Islands</html:option>
									    <html:option value="OH">Ohio</html:option>
									    <html:option value="OK">Oklahoma</html:option>
									    <html:option value="OR">Oregon</html:option>
									    <html:option value="PW">Palau</html:option>
									    <html:option value="PA">Pennsylvania</html:option>
									    <html:option value="PR">Puerto Rico</html:option>
									    <html:option value="RI">Rhode Island</html:option>
									    <html:option value="SC">South Carolina</html:option>
									    <html:option value="SD">South Dakota</html:option>
									    <html:option value="TN">Tennessee</html:option>
									    <html:option value="TX">Texas</html:option>
									    <html:option value="UT">Utah</html:option>
									    <html:option value="VT">Vermont</html:option>
									    <html:option value="VI">Virgin Islands</html:option>
									    <html:option value="VA">Virginia</html:option>
									    <html:option value="WA">Washington</html:option>
									    <html:option value="WV">West Virginia</html:option>
									    <html:option value="WI">Wisconsin</html:option>
									    <html:option value="WY">Wyoming</html:option>
										
										
									
									</html:select>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Zip Code*</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::Zip)" size="10" maxlength="10" styleClass="txtbox" styleId="Zip" onkeyup="if(this.value.length==5) {this.value=this.value+'-'}"/>
								<!--Zipcode lookup start 05-06-2006-->
								<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a></td>
								<!-- 05-06-2006 end-->																	
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Name</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::CustomerAdditional::ContactName)" size="24" maxlength="60" styleClass="txtbox" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Title of Contact</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::CustomerAdditional::ContactTitle)" size="24" maxlength="60" styleClass="txtbox" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Phone Number</td>
								<td class="links">&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneAreaCode)"  size="3" maxlength="3" styleId="PhoneNumber1" styleClass="txtbox"  onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber2" onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhone)" styleId="PhoneNumber3" size="4" maxlength="4" styleClass="txtbox" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Company Website</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::CustomerAdditional::CompanyUrl)" size="24" maxlength="60" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Form of Business</td>
								<td class="links" style="Class:txtbox">&nbsp;
									<html:select name="AddCustomer" property="answer(Object::CustomerAdditional::FormOfBusiness)" styleClass="txtbox">
										<html:option styleClass="txtbox" value="">Select</html:option>
										<html:option value="Corporation">Corporation</html:option>
										<html:option value="Partnership">Partnership</html:option>
										<html:option value="Sole Proprietor">Sole Proprietor</html:option>
										<html:option value="Joint Venture">Joint Venture</html:option>
										<html:option value="Other">Other</html:option>
									</html:select>
								</td>
							</tr>																				
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;If Other, please specify</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::CustomerAdditional::BusinessFormOther)" size="24" maxlength="60" styleClass="txtbox"/></td>
							</tr>
							
						</table>
					</td>
				</tr>	
			</table>
		</td>
	</tr>
	
	<!-- <tr>
		<td><hr size="1" noshade width="95%"></td>
	</tr> -->
	<tr>
		<td>&nbsp;</td>
	</tr>
	
	<tr>
		<td align="left" >
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<html:submit value="Save" property="amswer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
			&nbsp;&nbsp;&nbsp;
			<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
		</td>
	</tr>
	
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}%>


<html:hidden property="answer(duplicateAllowed)" value="no"  />
<html:hidden property="answer(Object::Entity::SiteId)" value="1"  />
<!-- <html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
<html:hidden property="answer(Object::Entity::EntityType)" value="CUSTOMER" /> -->
<!-- <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> -->
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />

<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
  <html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />

   <html:hidden property="answer(Object::Customer::User)" value="<%=userName.toString()%>" />

   
   <html:hidden property="answer(Object::Customer::CreatedBy)" value="<%=userName.toString()%>" />
   
   <html:hidden property="answer(Object::Customer::UpdatedBy)" value="<%=userName.toString()%>" />



<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />


<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />


<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />


   <html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
 

<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>

<SCRIPT LANGUAGE="JavaScript" SRC="../Scripts/JScripts/IndustryFactors.js" type="text/javascript">

</SCRIPT>

		
<html:hidden property="answer(AgentId)" value="<%=""+lngAgentId1%>" />
<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />

<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>


<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

	<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />
 
 <!--  html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" value="no" / -->				

<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%	if(!Customerid.equals("")){%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}	
%>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>

</table>