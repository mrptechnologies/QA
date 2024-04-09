<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<SCRIPT SRC="../Scripts/JScripts/CustomerToRisk.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<SCRIPT type="text/javascript"> 
function showCoveregeQuestions(val){

 
 if(val == "Yes"){
 	document.getElementById("questions").style.display = 'block';
  }
  else{
    document.getElementById("questions").style.display = 'none';
  }
}

<!--
		function checkFields()
		
		{
			var formElement=document.forms[0];
			if(formElement.AddCustomerYes.checked==false && formElement.AddCustomerNo.checked==false)
				{
			formElement.AddCustomerNo.checked=true;
				}
				else{
						formElement.AddCustomerNo.checked=f;
				}
		}


-->

</SCRIPT>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<bean:define id="custProgramName" name="AddCustomer" property="answer(Object::CustomerAdditional::ProgramName)" scope="session" />
<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<%String customerLastName=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<html:form action="/SavePLInsured"  focus="InsuredName" onsubmit="return validateFields()">
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

<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" align="left">

			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
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
						<table WIDTH="760px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
							<tr>
								<td valign="top">
									<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												<bean:message key="Top.EmployerGroupName"/>
											</td>
											<td class="FormLabels" align="left"  colspan="1" width="220px">
												<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)' />" >
												<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerName)'/></a>
											</td>
										</tr>	
										<logic:notEmpty name="AddCustomer" property="answer(Object::Customer::CreatedBy)">
											<tr>	
												<td  class="FormLabels" align="left"  colspan="1" width="160px">
													<bean:message key="Top.CreatedBy"/>
												</td>
												<td class="FormLabels" align="left"  colspan="1" width="220px">
													<bean:write name='AddCustomer' property='answer(Object::Customer::CreatedBy)'/>
												</td>
											</tr>			
										</logic:notEmpty>
									<!-- /td -->
									</table>
								</td>
								<td valign="top">
									<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
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
													<a href="../EditGAgencies.do?ReadOnly=Yes&agencyId=<%=""+generalagencyid2%>&primaryObjectId=<%=""+generalagencyid2%>&primaryObjectType=GENERAL_AGENCY"><%=generalagencyname2%></a>
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
						<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">

							<tr>
								<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">INSURED DETAILS</td>
							</tr>
							<tr>
								<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
							</tr>

					</logic:notPresent>
						</table>
					</td>
				</tr>
				<logic:present name="xmlValidationErrorList"  scope="request" >
				<tr>
					<td colspan="3">
						<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
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
				
				<tr>
					<td class="links">
						Please verify that your contact information is correct and add any needed information that you have not previously entered.
					</td>
				</tr>
				<tr>
					<td class="links">
						When you are done please save the information and click on ENROLLMENT.
					</td>
				</tr>
				<tr>
					<td class="links">
						If you get interrupted at any point in the enrollment process you can come back later to complete it by logging back in and clicking on an existing enrollment record.
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>								
					<td class="links">  
					<table>
					<tr>
					<td>
					<logic:present name ='arrObjectDetail' scope ='session'>
					<logic:iterate id="arrObjectDetail" name="arrObjectDetail" scope="session" >
					<bean:define id="custid" name="arrObjectDetail" property="id"/> 
					<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/> 
					<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
					<td class="links" width="20%">
				        
				     
				     	<a href="../NewLifeAgentQuote.do?TabPanelName=Quote_Panel&answer(createQuoteEffectiveDate)=yes&answer(Object::Quote::primaryEntityId)=<%=""+ObjectId%>&answer(Object::Customer::CustomerId)=<%=""+custid%>&formName=form::ADDQUOTEDETAILSLIFEAGENT&answer(Object::CustomerAdditional::ProgramName)=Producer Protection Group&answer(Object::Quote::QuoteStatus)=In Progress&answer(Object::Quote::OwnerId)=<%=""+ownerId%>&answer(Object::Quote::CreatedBy)=<%=""+usernameId%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Quote::ProductStatus)=RELEASED&answer(State)=<%=custState%>&answer(Object::Risk::RiskId)=1&answer(Object::Quote::NewQuote)=YES&answer(programName)='Producer Protection Group'" title="Click to go to create a New Quote">New Quote</a>
				     </td>
					     <td class="links" width="20%">  <a href="../AllQuotesPC.do?TabPanelName=Quote_Panel&formName=form::ADDQUOTEDETAILSLIFEAGENT&answer(Object::CustomerAdditional::ProgramName)=<%=custProgramName.toString() %>&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId2%>&answer(Object::Customer::State)=<%=custState.toString()%>" title="Click to go to Quotes" />Quotes</a>  </td>
					<%String polType="POLICY"; %>
					<td class="links" width="30%">
						<a href="../GetPolicyListAction.do?TabPanelName=Policy_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Policy::PolicyType)=<%=polType %>" title="Click to go to Policies">Policies</a>
					</td>
					</logic:iterate>
					</logic:present>
					</td>
					</tr>
					</table
					</td>
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
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(AgencyName)" value='<%=agencyName2%>' size="30" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" />
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
							
								 <%if(dataBaseIdViewPrivillage==1) {%>
									<tr>
									   
										<td class="FormLabels" align="left">&nbsp;&nbsp;Insured Id&nbsp;</td>
										<td class="TextMatter">&nbsp;<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerId)'/></td>
									</tr> 
							
							     <%}%>
							     
							<!--  to pass to the script -->
							<html:hidden name="AddCustomer" property ="answer(Object::Customer::CustomerId)" styleId="CustomerID" />
							
							<tr>
								<td width="40%" class="FormLabels" align="left">First Name*</td>
								<td class="links">&nbsp;<html:text name="AddCustomer" property ="answer(Object::Customer::Contact::FName)"  size="30" maxlength="60" styleClass="txtbox" styleId="InsuredFName" /></td>
							</tr>
							<tr>
								<td width="40%" class="FormLabels" align="left">Last Name*</td>
								<td class="links">&nbsp;<html:text name="AddCustomer" property ="answer(Object::Customer::Contact::LName)"  size="30" maxlength="60" styleClass="txtbox" styleId="InsuredLName" readonly="true"/></td>
							</tr>															
							<tr>
								<td class="FormLabels" align="left">Address Line 1*</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::StreetName)" size="24" maxlength="25" styleClass="txtbox" styleId="Address1"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">Address Line 2</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="30" maxlength="60" styleClass="txtbox" styleId="Address2"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left"><bean:message key="AddCustomer.City" />*</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::City)" size="20" maxlength="40" styleClass="txtbox" styleId="City"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left"><bean:message key="AddCustomer.State"/>*</td>
							
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
								<td class="FormLabels" align="left">Zip Code*</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::Zip)" size="10" maxlength="10" styleClass="txtbox" styleId="Zip" onkeyup="if(this.value.length==5) {this.value=this.value+'-'}"/>
								<!--Zipcode lookup start 05-06-2006-->
								<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a></td>
								<!-- 05-06-2006 end-->			
								<td class="links">&nbsp;<html:hidden  name="AddCustomer" property="answer(Object::Customer::County)" styleId="County" />														
							</tr>
							 <tr>
								<td class="FormLabels" align="left"><bean:message key="EmployeeDetails.Phone1" /></td>
								<td class="links">&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber1"  onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber2" onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhone)"  size="4" maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" /></td>
							</tr>	
							<tr>
								<td class="FormLabels" align="left"><bean:message key="EmployeeDetails.Fax" /></td>
								<td class="links">&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::FaxAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber1" onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::FaxExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber2" onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::Fax)"  size="4" maxlength="4" styleClass="txtbox" styleId="FaxNumber3"/></td>
							</tr>	
							
							<tr>
								<td align="left" class="FormLabels">Email Address</td>
								<td class="links">&nbsp;<html:text property="answer(Object::Customer::EMailAddress)" size="30" styleClass="txtbox" styleId="EmailAddress" readonly="true"></html:text>
							</tr>
							<tr>
								<td align="left" class="FormLabels">Approximately when were you, or when will you be, contracted with the sponsor of this insurance program? </td>
								<td class="links">
									&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Customer::SponsorDate)" size="11" maxlength="11" styleId="SponsorDate"/>&nbsp;*(MM/DD/YYYY)
								</td>
							</td>
							</tr>
							<tr>
								<td align="left" class="FormLabels">Do you have current coverege? &nbsp;</td>
								<td class="links">&nbsp;
									Yes&nbsp;<html:radio property="answer(Object::CustomerAdditional::CurrentCoverege)" value = "yes"  styleId="currentCoverege" onclick="showCoveregeQuestions('Yes');"/>
							        No&nbsp; <html:radio property="answer(Object::CustomerAdditional::CurrentCoverege)" value = "No"  styleId="currentCoverege1" onclick="showCoveregeQuestions('No');"/>
									
								</td>
							
							</tr>
							</table>
							</td>
							</tr>
							<bean:define id="Currentcoverages" property="answer(Object::CustomerAdditional::CurrentCoverege)" name="AddCustomer"/>
							<%String Currentcoverages1 = ""+Currentcoverages;
							%>
							<% if(Currentcoverages1.equals("yes")){%>
							<tr>
								<td>
									<div id=questions>
										<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
														<tr>
															<td align="left" class="FormLabels" width="40%">What is the expiration date of your current E&O coverage? (MM/DD/YYYY)  &nbsp;</td>
															<td class="links">&nbsp;
															   <html:text name="AddCustomer" property ="answer(Object::CustomerAdditional::CoverageExpirationDate)"  size="11" maxlength="11" styleClass="txtbox" styleId="ExpDate" />
															<!--  	<input type=text class="txtbox"  name="answer(Object::CustomerAdditional::CoverageExpirationDate)" size="11" maxlength="11" id="contractDate"/> -->
															</td>
										
														</tr>
										
										<tr >							
										    <td align="left" class="FormLabels" width="40%">Who is the carrier for your current coverage? &nbsp;</td>		
										    <td class="links" style="Class:txtbox">&nbsp;
										    <html:text name="AddCustomer" property ="answer(Object::CustomerAdditional::CoverageCarrier)"  size="30" maxlength="30" styleClass="txtbox" styleId="CurrentCoverege" />
										<!-- 	<input type="text" class="txtbox" name="answer(Object::CustomerAdditional::CoverageCarrier)" size=30 maxlength=40 id=sponsor />  -->
											</td>
										</tr>
	
								</table>
	
							</div>
						</td>
					</tr>
					<%}else{ %>
					<tr>
								<td>
									<div id=questions style="display: none;">
										<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
														<tr>
															<td align="left" class="FormLabels" width="40%">What is the expiration date of your current E&O coverage? (MM/DD/YYYY)  &nbsp;</td>
															<td class="links">&nbsp;
															   <html:text name="AddCustomer" property ="answer(Object::CustomerAdditional::CoverageExpirationDate)"  size="11" maxlength="11" styleClass="txtbox" styleId="ExpDate" />
															<!--  	<input type=text class="txtbox"  name="answer(Object::CustomerAdditional::CoverageExpirationDate)" size="11" maxlength="11" id="contractDate"/> -->
															</td>
										
														</tr>
										
										<tr >							
										    <td align="left" class="FormLabels" width="40%">Who is the carrier for your current coverage? &nbsp;</td>		
										    <td class="links" style="Class:txtbox">&nbsp;
										    <html:text name="AddCustomer" property ="answer(Object::CustomerAdditional::CoverageCarrier)"  size="30" maxlength="30" styleClass="txtbox" styleId="CurrentCoverege" />
										<!-- 	<input type="text" class="txtbox" name="answer(Object::CustomerAdditional::CoverageCarrier)" size=30 maxlength=40 id=sponsor />  -->
											</td>
										</tr>
	
								</table>
	
							</div>
						</td>
					</tr>
					<%} %>
					<tr>
					<td>
					<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
								connector='or' negated="true">	
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Active</td>
								<td class="TextMatter">&nbsp;
									<html:select property="answer(Object::Customer::active)" styleClass="txtbox">
										<html:option value ="Y">Yes</html:option>
										<html:option value ='D'>No</html:option>
									</html:select>
								</td>
							</tr>
							</dmshtml:dms_static_with_connector>
							<!-- 
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"To_Be_Given"}%>' connector='or' negated="true">					
							<tr>
								<td>
									<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
										<tr>
											<td class="sectionhead" align="center">Risk Information</td>							
										</tr>
									</table>
								</td>
							</tr>
							<tr>		
								<td> &nbsp;</td>
							</tr>
							
							<tr>
							    <td align="left" class="FormLabels">&nbsp;&nbsp;Risk Type </td>
								<td class="TextMatter">&nbsp;								
								    <html:select property="answer(Object::Risk::ResProperty::RiskType)" styleClass="txtbox">
								    <html:option value="Financial Professional">Financial Professional</html:option>
								    </html:select>
								</td>
							</tr>
							<tr>
								<td align="left" class="FormLabels">&nbsp;&nbsp;Risk Number</td>
								<td class="links">&nbsp;<html:text property="answer(Object::Risk::ResProperty::RiskNumber)" size="12" styleClass="txtbox" styleId="RiskNumber"></html:text>
							</tr>
							<tr>
								<td align="left" class="FormLabels">&nbsp;&nbsp;Risk Name</td>
								<td class="links">&nbsp;<html:text property="answer(Object::Risk::ResProperty::RiskName)" size="25" styleClass="txtbox" styleId="RiskName"></html:text>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::ResPropertyId)" styleId="RiskId" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::CustomerId)" styleId="RiskCustomerId" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::RiskName)" styleId="RiskName" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::RiskNumber)" styleId="RiskNumber" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::StreetNumber)" styleId="RiskStNum" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::StreetName)" styleId="RiskStName" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::Address2)" styleId="RiskAddress2" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::City)" styleId="RiskCity" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::State)" styleId="RiskState" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::Zip)" styleId="RiskZip" /></td>
								<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::County)" styleId="RiskCounty" /></td>
							</tr>
							</dmshtml:dms_static_with_connector> -->
							<tr>								
								<td class="links"><html:hidden property="answer(Object::Customer::Sponsor)"/></td>
								<td class="links"><html:hidden property="answer(Object::Customer::SponsorCode)" styleId="SponsorNumber"/></td>
							</tr>
							<tr>
								<td>
								<html:hidden property="TabPanelName" value="Insured_Panel" />
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::RiskType)" value="Financial Professional" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::ResPropertyId)" styleId="RiskId" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::CustomerId)" styleId="RiskCustomerId" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::RiskName)" styleId="RiskName" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::RiskNumber)" styleId="RiskNumber" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::StreetNumber)" styleId="RiskStNum" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::StreetName)" styleId="RiskStName" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::Address2)" styleId="RiskAddress2" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::City)" styleId="RiskCity" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::State)" styleId="RiskState" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::Zip)" styleId="RiskZip" /></td>
									<td class="links"><html:hidden property="answer(Object::Risk::ResProperty::County)" styleId="RiskCounty" /></td>
									<td class="links"><html:hidden property="answer(Object::Customer::SponsorDate)" styleId="SponsorDate" /></td>
									<html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
								</td>
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


</table>
</html:form>
<!--  <SCRIPT LANGUAGE="JavaScript" type="text/javascript">


checkFields();


</SCRIPT>

-->
 
 