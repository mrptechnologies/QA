<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>

<%Object cId=null;%>
<%String customerCreatedBy=""; %>
<%String customerCreatedDate="";
String customerUpdatedDate=""; 
%>

<%long lngAgencyId=0;%>
<%long lngAgentId=0;%>
<%String agencyName="";%>
<%String agentFName="";%>
<%String agentLName="";%>
<%String generalAgencyId="";%>
<%long lngGeneralAgencyId=0;%>
<%String generalAgencyName=""; %>
<%String getInsuredAction="../GetInsuredAction.do"; %>
	
	<%Object custId = request.getAttribute("Object::Customer::CustomerId");	
    if((""+custId).length()>0 && custId !=null && !((""+custId).equals("0"))) {
		cId=custId; 
	}else if(request.getParameter("answer(Object::Customer::CustomerId)")!= null) {%>
	<bean:parameter id="cIdpara" name="answer(Object::Customer::CustomerId)" />
	<%cId=cIdpara;%>
	<%}else if(request.getParameter("answer(customerId)")!= null) {%>
	<bean:parameter id="cIdparam2" name="answer(customerId)" />
	<%cId=cIdparam2;
	} else {%>	
	<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
	<%	cId=cIdSession;%>
	<%}%>
	
	<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >	
		<%getInsuredAction="../GetCustomerAction.do"; %>
	</logic:notEqual>
<%
	
	if(cId!=null && (!cId.toString().equals(""))){%>


			<table width="100%" align="Left" border="0" bgcolor="#C6DEEA">
			<tr>
				<td valign="top">
					<table width="100%" align="Left" border="0" bgcolor="#C6DEEA" >

						<tr>
<%String insType = (String)session.getAttribute("InsType"); %>							
<%if(insType.equals("PC") || insType.equals("Professional Liability")) {%>							
						
							<td class="FormLabels" align="left" width="25%"><bean:message key="Top.EmployerGroupName"/></td>
<%} else if(insType.equals("Health")){%>
							<td class="FormLabels" align="left" width="25%"><bean:message key="CustomerSearchResult.EmployerGroupNameHealthIns"/></td>
<%} %>							
							<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
							<logic:present name="customerDetail1" scope="request">

							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
								
								<%try{
								lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
								}catch(Exception nfe) {lngAgencyId=0;    }
								try{
								lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
								}catch(Exception nfe) {lngAgentId=0;    }
								agencyName=customerDetailMap.getEncodedString("agencyname");
								agentFName=customerDetailMap.getEncodedString("agentfirstname");
								agentLName=customerDetailMap.getEncodedString("agentlastname");
								customerCreatedBy = customerDetailMap.getEncodedString("customerCreatedBy");
								customerCreatedDate = customerDetailMap.getString("customerCreatedDate");
								try{
								lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));
								}catch(Exception nfe) {lngGeneralAgencyId=0;    }
								generalAgencyName=customerDetailMap.getString("generalagencyname");%>

									<td class="sectionhead1" align="left" width="75%">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CUSTOMER"}%>' connector='or' negated="true">
											<a href="<%=getInsuredAction%>?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>"  title="<bean:message key='ToolTip.AgencyHeader.InsuredSummary'/>"><%=customerDetailMap.getEncodedString("custname")%></a>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CUSTOMER"}%>' connector='or' negated="false">
											<%=customerDetailMap.getEncodedString("custname")%>
										</dmshtml:dms_static_with_connector>
								</td>
							</logic:present>
						 </tr>						 
						<%if(!customerCreatedBy.equals("")){ %>
						<tr>	
							<td  class="FormLabels" align="left"  colspan="1" width="25%">
								<bean:message key="Top.CreatedBy"/>
							</td>
							<td class="FormLabels" align="left"  colspan="1" width="75%">
								<%=""+customerCreatedBy%>
							</td>
						</tr>		
						<%} %>
					</table>
				</td>				
				<td valign="top">
					<table width="100%" align="Left" border="0" bgcolor="#C6DEEA" >
				
						
						
						<tr>
							<td class="FormLabels" align="left" width="25%">
								<bean:message key="Top.AgencyName"/>
							</td> 
							
							<td class="sectionhead1" align="left" width="75%">
							<html:hidden property="answer(agencyId)" value="<%=""+lngAgencyId %>" styleId="agencyId"/>
								<%
								if(lngAgencyId>0){ %>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="true">	
										 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="true">	
											<a href="../EditAgencies.do?TabPanelName=Manage_Panel&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY"  title="<bean:message key='ToolTip.AgencyHeader.AgencyName'/>"><%=agencyName%></a>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="false">	
										 	<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency"  title="<bean:message key='ToolTip.AgencyHeader.AgencyName'/>"><%=agencyName%></a> 
										</dmshtml:dms_static_with_connector>
									</dmshtml:dms_static_with_connector >
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="false">
									<a><%=agencyName%></a>
									</dmshtml:dms_static_with_connector >	
								<%}%>
							</td>
						</tr>
						
						<tr>
							<td class="FormLabels" align="left" colspan="1">
								<bean:message key="Top.AgentName"/>
							</td> 
							<td class="sectionhead1" align="left" colspan="2">
								<%
								if(!agentFName.equals("") || !agentLName.equals("")){%>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="true">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENT_DETAIL"}%>' connector='or' negated="true">
											<a href="../EditAgent.go?TabPanelName=Manage_Panel&entityId=<%=""+lngAgentId%>"> <%=agentFName%> <%=" "%><%=agentLName%></a>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENT_DETAIL"}%>' connector='or' negated="false">
										 	<a href="../GetAgentSummaryDetail.do?ReadOnly=Yes&entityId=<%=""+lngAgentId%>" onclick="return AgentPopup(this,'Agent');" target="Agent"><%=agentFName%> <%=" "%><%=agentLName%></a>  
										</dmshtml:dms_static_with_connector>
									</dmshtml:dms_static_with_connector >
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="false">
									<a><%=agentFName%> <%=" "%><%=agentLName%></a>
									</dmshtml:dms_static_with_connector >	
								
								<%}%>
							</td>
						</tr>						
						
						<!-- <tr>	
							<td  class="FormLabels" align="left"  colspan="1" width="16%">
								<bean:message key="Top.CreatedDate"/>
							</td>
							<td class="FormLabels" align="left"  colspan="1" width="22%">
								<%=""+customerCreatedDate%>
							</td>
						</tr>  -->		

					</table>
				</td>

			</tr>
			</table>
			<%}%>
		
	