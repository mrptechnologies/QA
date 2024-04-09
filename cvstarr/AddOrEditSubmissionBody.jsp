<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>
<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/AddRisk.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>
<SCRIPT type="text/javascript">
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
		function actionInvoke()
		{	 
	 		document.forms[0].action="../SavedSubmissionInsured.do";
			document.forms[0].submit();
		}	
</SCRIPT>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/> 
<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
<bean:define id="SubmissionForExistingInsured" name="AddCustomer" property="answer(Object::ExistingInsured)"/>

<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

<html:form action="/SaveInsuredSubmission"  focus="InsuredName" onsubmit="return validateFields()">
<bean:define id="ProposedEffDate" name="AddCustomer" property="answer(Object::Clearance::ProposedEffectiveDate)"/>
<bean:define id="ProposedEffDate1" name="AddCustomer" property="answer(Object::Clearance::ProposedEffectiveDate1)"/>
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
<table WIDTH="90%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" align="left">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
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
						<%String display ="display:none";  %>
						<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
							<% display=""; %>
						</logic:notEqual>
						<logic:notPresent name="staleDataSubmissionMsg"  scope="request">
						<table style="<%=""+display %>" WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
							<tr>
								<td valign="top">
									<table width="360px" align="Left" border="0"bgcolor="#C6DEEA" >
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												Submission Name
											</td>
											<td class="sectionhead1" align="left"  colspan="1" width="220px">
												<bean:write name='AddCustomer' property='answer(Object::Customer::CustomerName)'/></a>
											</td>
										</tr>
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												Submission #
											</td>
											<td class="sectionhead1" align="left"  colspan="2" width="220px">

											</td>
										</tr>
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												<bean:message key="Top.CreatedBy"/>
											</td>
											<td class="sectionhead1" align="left"  colspan="1" width="220px">
												<bean:write name='AddCustomer' property='answer(Object::Submission::CreatedBy)'/>
											</td>
										</tr>											
									<!-- /td -->
									</table>
								</td>
								<td valign="top">
									<table width="360px" align="Left" border="0"bgcolor="#C6DEEA" >											
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												Submission Status
											</td>
											<td class="sectionhead1" align="left"  colspan="1" width="220px">
												<bean:write name='AddCustomer' property='answer(Object::Submission::Status)'/>
											</td>
										</tr>	
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												Clearance Status 
											</td>
											<td class="sectionhead1" align="left"  colspan="2" width="220px">
												<bean:write name='AddCustomer' property='answer(Object::Submission::ClearanceStatus)'/>
												
											</td>
										</tr>
										<tr>	
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												Last Updated By
											</td>
											<td class="sectionhead1" align="left"  colspan="1" width="220px">												
												<!-- <bean:write name='AddCustomer' property='answer(Object::Customer::UpdatedBy)'/> -->
												<bean:define id="updatedBy" name='AddCustomer' property='answer(Object::Customer::UpdatedBy)'/>
												<%=updatedBy  %>
											</td>
										</tr>													
									<!-- /td -->
									</table>
								</td>
								<td valign="top">
									<table width="360px" align="Left" border="0"bgcolor="#C6DEEA" >
										<tr>
											<td  class="FormLabels" align="left" colspan="1">
												<bean:message key="Top.AgencyName"/>
											</td> 
											<td class="links" align="left" colspan="2" >
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
												<%}else{
												%>
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
													<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
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
										
													<%} else {
													%>
	<!-- ************Agency agent, general agenct detail by user id ******************************-->												
													 <bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
													 <%
													 	try{
													 		lngAgencyTemp=Long.parseLong(""+AgencyID);
													 	}catch(Exception ex){}
													 	if(lngAgencyTemp < 0){
													 %>	
													 <dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
												    <logic:present name="agencyIdent" scope="session">
													<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
													<%
													agencyIdTemp=agencyIdid.toString();
													try {
														lngAgencyTemp=Long.parseLong(agencyIdTemp);
													} catch(Exception ex){} %>
													</logic:present>
													<%}if(lngAgencyTemp>0){
													%>
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
													<%if(lgAgentId2>0){
													%>
														<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+lgAgentId2%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
														<logic:present name="agentDetail" scope="request">
															<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
															<%lngAgentId1=lgAgentId2;%>
															<%strAgentFName=agentDetail1.getString("agentfname");%>
															<%strAgentLName=agentDetail1.getString("agentlname");%>
														</logic:present>
													<%}else {
													%>
													   <bean:define id="AgentID" name="userDetailObject" property="agentId" scope="session" />
													   <% long lgObjAgentId = 0;
													      try{
													        lgObjAgentId = Long.parseLong(AgentID.toString());
													      }catch(Exception ex){} 
													      if(lgObjAgentId < 0){
													   %>
													  	<%String objType="";%>
													  	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
														<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
														<%if(!(objDescType.toString().equals("AGENCY"))){ %>
														<%lgObjAgentId=0;
														try {
															lgObjAgentId=Long.parseLong(objDescId.toString());
														} catch(Exception ex){} 
														%>
														<%} %>
														<% }if(lgObjAgentId>0){
														%>
															<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+lgObjAgentId%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
															<logic:present name="agentDetail" scope="request">
																<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
																<%lngAgentId1=lgObjAgentId;%>
																<%strAgentFName=agentDetail1.getString("agentfname");%>
																<%strAgentLName=agentDetail1.getString("agentlname");%>
															</logic:present>
														<%} %>	
														<!--  /logic:present -->										
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
											<td class="links" align="left" colspan="2">
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
									  <tr>
											<td  class="FormLabels" align="left"  colspan="1" width="160px">
												Last Updated Date
											</td>
											<td class="Textmatter" align="left"  colspan="1" width="220px">
												<bean:define id="updatedDate" name='AddCustomer' property='answer(Object::Submission::UpdatedDate)'/>
												
												<%String lastSavedDate ="";
												if(updatedDate!=null) {
													lastSavedDate = ""+updatedDate; 				 					
													if(!lastSavedDate.equals("")){
				                                        String arrUpdatedDate[] = lastSavedDate.split("-");
				                                        
				                                        String YYYY = arrUpdatedDate[0];
														String MM = arrUpdatedDate[1];
														String DD = arrUpdatedDate[2];
														
														lastSavedDate = MM+"-"+DD+"-"+YYYY;
													}																								
												%>												
							 					<%=lastSavedDate %>	
							 					<% } %>
											</td>											
										</tr>
									
									</table>
								</td>
							</tr>
							
							
<!-- GENERAL BLOCK STOP -->
						</table>
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">

							<tr>
								<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td class="NewSectionHead" colspan="5" align="center">SUBMISSION SUMMARY INFORMATION</td>
							</tr>
							<tr>
								<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
							</tr>

					</logic:notPresent>
<%
	long submissionIdNBF =0;
	long submissionVerIdNBF =0;
	long subId =0;
	long subVerId =0;
	
%>	
 						    <logic:present name ='arrObjectDetail1' scope ='session'>
							<logic:iterate id="arrObjectDetail1" name="arrObjectDetail1" scope="session" >
							<bean:define id="custid" name="arrObjectDetail1" property="id"/> 
							<bean:define id="custState" property="answer(Object::UserDetail::State)" name="AddCustomer"/> 							
							<bean:define id="submissionId" property="answer(Object::Submission::SubmissionId)" name="AddCustomer"/> 															
							<bean:define id="submissionVerId" property="answer(Object::Submission::SubmissionVerId)" name="AddCustomer"/> 								
							<% if(!submissionId.toString().equals("") && !submissionVerId.toString().equals("")) {
								subId=Long.parseLong(submissionId.toString()); 
								subVerId=Long.parseLong(submissionVerId.toString());
								} %>															
							</logic:iterate>
							</logic:present>													
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
						<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
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
								<td class="FormLabels" align="left" width="43%"> 
									&nbsp;&nbsp;Agency *
								</td>	
								<td class="links" width="29%">&nbsp;<html:text  name="AddCustomer" property ="answer(AgencyName)" value='<%=agencyName2%>' size="60" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" />
								</td>
								<td>	
									&nbsp;
								</td>
								<!-- <td>	
									<IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButtonSubmissionInsured()">
									
								</td> -->
								
								</tr>
						 		<tr><td>&nbsp;&nbsp;&nbsp;</td></tr>						 	
						</table>
					</td>
				</tr>
				</dmshtml:dms_static_with_connector>				
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
							<tr>
								<td class="sectionhead" align="center">Submission Insured Information</td>							
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
								<td class="FormLabels" align="left">&nbsp;&nbsp;Insured Name Type</td>
								<td class="links" style="Class:txtbox">&nbsp;<html:select name="AddCustomer" property="answer(Object::Customer::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation(this.form)">
										 <html:option value ="Person" styleClass="txtbox">Person</html:option>
									     <html:option value ="Company" styleClass="txtbox" >Company</html:option>
								</html:select>
								</td>
							</tr> 
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
							<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
							<%
							  String nameFieldLength =(String) request.getAttribute("paramValue");
							if (nameFieldLength.length() <= 0 && nameFieldLength == null){
								 nameFieldLength = "60";								   
							  }
							
							%>												
							<tr>
								<td width="40%" class="FormLabels" align="left" id="insuredNameBlock" >&nbsp;&nbsp;Insured Name 1(First Name, Last Name)*</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName" /></td>
							</tr>
							
							<tr>
								<td width="40%" class="FormLabels" align="left" id="insuredNameBlock" >&nbsp;&nbsp;Insured Name 2</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName2)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName2" /></td>
							</tr>
																	
								 <tr>
									<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Insured Number</td>
									<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerNumber)"  size="8" maxlength="8" styleClass="txtbox" styleId="InsuredNumber" /></td>
								</tr> 
														
							<tr id="DBABlock">
								<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;DBA/TA</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::DBA)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="DBA" /></td>
							</tr>

							 						
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Street Number</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::StreetNumber)" size="10" maxlength="10" styleClass="txtbox" styleId="StreetNumber" /> 
							</td>
							</tr>	
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Street Name 1</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::StreetName)" size="60" maxlength="50" styleClass="txtbox" styleId="StreetName"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Street Name 2</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Address2"/></td>
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
								<td class="FormLabels" align="left">&nbsp;&nbsp;State/Province*</td>
							
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
								<td class="links">&nbsp;<html:text  name="AddCustomer" property="answer(Object::Customer::Zip)" size="10" maxlength="10" styleClass="txtbox" styleId="Zip" />
								<!--Zipcode lookup start 05-06-2006-->
								<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a></td>
								<!-- 05-06-2006 end-->																	
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Country</td>
							
								<td class="links" style="Class:txtbox">&nbsp;<html:select name="AddCustomer" property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
									<html:option value ="USA" styleClass="txtbox">United States</html:option>									   		   
									</html:select>
								</td>
							</tr>		    
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Email Address</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::EMailAddress)" onblur="" size="30"  styleClass="txtbox" styleId="emailID" />
								</td>
							</tr>
							
							 <tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="EmployeeDetails.Phone1" /></td>
								<td class="links">&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber1"  onkeyup="if(this.value.length==3) {event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && document.forms[0].PhoneNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhoneExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="PhoneNumber2" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].PhoneNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::WorkPhone)"  size="4" maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" /></td>
							</tr>	
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;<bean:message key="EmployeeDetails.Fax" /></td>
								<td class="links">&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::FaxAreaCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber1" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].FaxNumber2.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::FaxExchangeCode)"  size="3" maxlength="3" styleClass="txtbox" styleId="FaxNumber2" onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].FaxNumber3.focus()}"/>&nbsp;<dmshtml:dms_text  name="AddCustomer" property ="answer(Object::Customer::Fax)"  size="4" maxlength="4" styleClass="txtbox" styleId="FaxNumber3"/></td>
							</tr>	
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Contact First Name</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::ContactFName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" />
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Last Name</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::ContactLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" />
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Contact Title</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::ContactTitle)"  size="4" styleClass="txtbox" styleId="ContactTitle" />
								</td>
							</tr>
							
							<tr id="CompanywebsiteBlock">
								<td class="FormLabels" align="left">&nbsp;&nbsp;Company website</td>
								<td class="links">&nbsp;<html:text  name="AddCustomer" property ="answer(Object::Customer::ContactURL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" />
								</td>
							</tr>
							<tr id="FOBBlock">
								<td class="FormLabels" align="left">&nbsp;&nbsp;Form of Business</td>
								<td class="links" style="Class:txtbox">&nbsp;<html:select name="AddCustomer" property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.form)">
										<html:option value="">Select</html:option>	 
									    <html:option value="Corporation">Corporation</html:option>		    
									    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
									    <html:option value="Partnership">Partnership</html:option>		    
									    <html:option value="Joint Venture">Joint Venture</html:option>
									    <html:option value="Other">Other</html:option>
								</html:select>
								</td>
							</tr> 
							<tr id="otherFOBBlock">
								<td class="FormLabels" align="left">&nbsp;&nbsp;If Other,please Specify</td>
								<td class="links">&nbsp;<html:textarea name="AddCustomer" property ="answer(Object::Customer::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
								</td>
							</tr>
														
					<!-- 		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_STATUS_CHANGE"}%>' connector='or' negated="true">
								<tr>
									<td class="FormLabels" align="left" height="25">&nbsp;&nbsp;Status</td>
									<td class="links">&nbsp;<html:select property="answer(Object::Submission::Status)" styleClass="txtbox">		
										<html:option value ="In Progress">In Progress</html:option>
										<html:option value ="Blocked">Blocked</html:option>
										<html:option value ="Declined">Declined</html:option>
										<html:option value ="Lapsed">Lapsed</html:option>
										<html:option value ="Registered">Registered</html:option>
										</html:select>
									</td>
								</tr>
							</dmshtml:dms_static_with_connector>
					 -->		
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
								connector='or' negated="true">	
							<tr>
								<td class="FormLabels" align="left">&nbsp;&nbsp;Active</td>
								<td class="links">&nbsp;
									<html:select property="answer(Object::Customer::active)" styleClass="txtbox">
										<html:option value ="Y">Yes</html:option>
										<html:option value ='D'>No</html:option>
									</html:select>
								</td>
							</tr>
							</dmshtml:dms_static_with_connector>
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
		<td align="center" >			
			<html:submit value="Next" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
			&nbsp;&nbsp;&nbsp;
			<html:reset value="Reset" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>
		</td>
	</tr> 
	
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}%>


<html:hidden property="answer(Object::Submission::SubmissionId)" value='<%=""+submissionIdNBF %>' />
<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=""+submissionVerIdNBF %>' />
<html:hidden property="answer(Object::Submission::SubmissionInsuredId)" value='<%=""+Customerid%>' />
<html:hidden property="answer(Object::Submission::InsuredId)" value='<%=""+Customerid%>' />
<html:hidden property="answer(Object::Clearance::SubmissionId)" value='<%=""+subId %>' />
<html:hidden property="answer(Object::Clearance::SubmissionVerId)" value='<%=""+subVerId %>' />
<html:hidden property="answer(duplicateAllowed)" value="no"  />
<html:hidden property="answer(Object::Entity::SiteId)" value="1"  />
<!-- <html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
<html:hidden property="answer(Object::Entity::EntityType)" value="CUSTOMER" /> -->
<!-- <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> -->
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" styleId="ownerId" />

<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
  <html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />

   <html:hidden property="answer(Object::Customer::User)" value="<%=userName.toString()%>" />   
   <html:hidden property="answer(Object::Submission::CreatedBy)" value="<%=userName.toString()%>" />   
   <html:hidden property="answer(Object::Submission::UpdatedBy)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
   <html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" /> 
   <html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />
   <html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
 

<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>
		
<html:hidden property="answer(PrimaryKey_Object::Customer::CustomerId)" value="-1" />
<html:hidden property="answer(Object::Location::LocationId)" value="-1" />
<html:hidden property="answer(Object::Risk::ComProperty::CustomerId)" value="<%=Customerid.toString()%>" />
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<html:hidden property="answer(APP_TAB_TYPE)" value="YUI" />
<html:hidden property="answer(objectId)" value="0" />
<html:hidden property="answer(objectVerId)" value="0" />
<html:hidden property="answer(objectName)" value="GENERAL QUESTION SUBMISSION" />
<html:hidden property="answer(applicationType)" value="LOCATION" />
<html:hidden property="answer(applicationSubType)" value="" />
<html:hidden property="answer(showOneTabAtTime)" value="y" />
<html:hidden property="answer(IsSubApplicationCoveredByForm)" value="Yes" />
<html:hidden property="answer(IsApplicationDisabled)" value="N" />
<html:hidden property="answer(teritory)" value="" />
<html:hidden property="answer(teritoryName)" value="" />

<html:hidden property="answer(zone)" value="" />
<html:hidden property="answer(requestForm)" value="Submission" />

<html:hidden property="answer(OwnerId)" value="<%=""+ownerId%>" />
<html:hidden property="answer(Object::Location::LocationNumber)" value="-1"/>
<html:hidden property="answer(Object::Risk::RiskId)" value="-1" />

<html:hidden property="answer(TabPanelName)" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(showOneTabAtTime)" value="N" />
<html:hidden property="answer(IsSubApplicationCoveredByForm)" value="Yes" />
<html:hidden property="answer(IsApplicationDisabled)" value="N" />
<html:hidden property="answer(objectId)" value="0" />
<html:hidden property="answer(objectVerId)" value="0" />
<html:hidden property="answer(objectName)" value="GENERAL QUESTION SUBMISSION" />
<html:hidden property="answer(applicationType)" value="SUBMISSION" />
<html:hidden property="answer(applicationSubType)" value="" />
<html:hidden property="answer(APP_TAB_TYPE)" value="YUI" />
<html:hidden property="answer(riskTerritory)" value="" />
<html:hidden property="answer(Object::Application::ApplicationType)" value="SUBMISSION_APPLICATION" />
<html:hidden property="answer(zone)" value="" />
<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate)" value='<%=""+ProposedEffDate %>' /> 
<html:hidden property="answer(Object::Clearance::ProposedEffectiveDate1)" value='<%=""+ProposedEffDate1 %>' />
<bean:define id="clStatus" name="AddCustomer" property="answer(Object::Submission::ClearanceStatus)"scope="session"/>
<!-- modified by mariraj to get sub and clearance status -->
<html:hidden property="answer(Object::Submission::ClearanceStatus)" value='<%=clStatus.toString() %>' /> 
<bean:define id="subStatus" name="AddCustomer" property="answer(Object::Submission::Status)"scope="session"/>
<html:hidden property="answer(Object::Customer::Status)" value='<%=subStatus.toString() %>' /> 

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
<html:hidden property="answer(isInserted)" value="Y" />
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="SUBMISSION"%>"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Submission Management"%>"/>
	<html:hidden property="answer(Object::ExistingInsured)" value="<%=SubmissionForExistingInsured.toString()%>"/>
	<html:hidden property="answer(pagename)" value="Quote summary" />
	
</table>
</html:form>


<!--  <SCRIPT LANGUAGE="JavaScript" type="text/javascript">


checkFields();


</SCRIPT>

-->
 <SCRIPT type="text/javascript">
    //alert("enter");
	var formElement=document.forms[0];	
	showCompanyInformation(formElement);
</SCRIPT>
 