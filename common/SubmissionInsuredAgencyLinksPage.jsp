<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>



<%
	Object cId=null;
	String customerCreatedBy=""; 
	String customerCreatedDate=""; 
	String customerUpdatedDate=""; 
	String customerUpdatedBy = "";
%>

<%long lngAgencyId=0;%>
<%long lngAgentId=0;%>
<%String agencyName="";%>
<%String agentFName="";%>
<%String agentLName="";%>
<%String generalAgencyId="";%>
<%long lngGeneralAgencyId=0;%>
<%String generalAgencyName="";%>
<%String customerStatus ="";%>
<%String submissionNumber="";%>
<%String submissionId = ""; 
String clearanceStatus ="";
String submissionVerId = "";
%>
<%
	Object custId = request.getAttribute("Object::Customer::CustomerId");	
    if((""+custId).length()>0 && custId !=null && !((""+custId).equals("0"))) {
		cId=custId; 
	}else if(request.getParameter("answer(Object::Customer::CustomerId)")!= null && request.getParameter("answer(Object::Customer::CustomerId)")!="") {%>
	<bean:parameter id="cIdpara" name="answer(Object::Customer::CustomerId)" />
	<%cId=cIdpara;%>
	<%}else if(request.getParameter("answer(customerId)")!= null) {%>
	<bean:parameter id="cIdparam2" name="answer(customerId)" />
	<%cId=cIdparam2;
	} else {%>	
	<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
	<%	cId=cIdSession;%>
	<%}%>
	<%if(request.getAttribute("Object::Submission::SubmissionId")!= null ) {%>
	<%submissionId=""+request.getAttribute("Object::Submission::SubmissionId");%>
	<%}else if(request.getParameter("answer(Object::Submission::SubmissionId)")!= null ) {%>
	<bean:parameter id="submissionId1" name="answer(Object::Submission::SubmissionId)" />
	<%submissionId=submissionId1;%>
	<%}%>
	
	<%if(request.getParameter("answer(Object::Submission::SubmissionVerId)")!= null ) {%>
	<bean:parameter id="SubmissionVerId1" name="answer(Object::Submission::SubmissionVerId)" />
	<%submissionVerId=SubmissionVerId1;%>
	<%}%>
	<%if((""+submissionId).length()==0){%>
		<bean:define id="SubmissionIdRef1" property="answer(Object::Submission::SubmissionId)" name="AddCustomer"/>	
		<%submissionId =""+SubmissionIdRef1;
	}%>
	<%if((""+submissionVerId).length()==0){%>	
	<bean:define id="SubmissionVerIdRef1" property="answer(Object::Submission::SubmissionVerId)" name="AddCustomer"/>
	<%submissionVerId =""+SubmissionVerIdRef1;
	}	
	%>
<%
	
	if(cId!=null && (!cId.toString().equals(""))){%>


			<table width="100%" align="Left" border="0" bgcolor="#C6DEEA">
			<tr>
				<td valign="top">
					<table width="100%" align="Left" border="0" bgcolor="#C6DEEA" >

						<tr>
							<td class="FormLabels" align="left" width="30%">Submission Name</td>
							<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" submissionId='<%=""+submissionId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
							<logic:present name="customerDetail1" scope="request">

							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
								
								<%try{
								lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
								}catch(Exception nfe) {lngAgencyId=0;    }
								try{
								lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
								}catch(Exception nfe) {lngAgentId=0;    }
								agencyName=customerDetailMap.getString("agencyname");
								agentFName=customerDetailMap.getString("agentfirstname");
								agentLName=customerDetailMap.getString("agentlastname");
								customerCreatedBy = customerDetailMap.getString("customerCreatedBy");
								customerUpdatedBy = customerDetailMap.getString("UpdatedBy");
								customerCreatedDate = customerDetailMap.getString("customerCreatedDate");
								customerStatus = customerDetailMap.getString("custStatus");
								submissionNumber = customerDetailMap.getString("SubmissionNumber");
								clearanceStatus = customerDetailMap.getString("ClearanceStatus");
								customerUpdatedDate = customerDetailMap.getString("UpdatedDate");
								try{
								lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));
								}catch(Exception nfe) {lngGeneralAgencyId=0;    }
								generalAgencyName=customerDetailMap.getString("generalagencyname");%>

									<td class="sectionhead1" align="left" width="22%"><a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerId%>&answer(Object::Submission::SubmissionId)=<%=""+submissionId%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" ><%=customerDetailMap.getString("custname")%></a>
								</td>
							</logic:present>
						 </tr>
						 <tr>	
							<td  class="FormLabels" align="left"  colspan="1" width="16%">
								Submission #
							</td>
							<td class="Textmatter" align="left"  colspan="2" width="22%">
								<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerId%>&answer(Object::Submission::SubmissionId)=<%=""+submissionId%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" >
									<%=submissionNumber+"" %>
								</a>
							</td>
						</tr>	
						 
						<%if(!customerCreatedBy.equals("")){ %>
						<tr>
							<td class="FormLabels" align="left" colspan="1" width="16%"><bean:message
								key="Top.CreatedBy" /></td>
							<td class="Textmatter" align="left" colspan="1" width="22%">
								<%=""+customerCreatedBy%>
							</td>
						</tr>
						<%} %>
						
					</table>
				</td>
				<td valign="top">
					<table width="150%" align="Left" border="0"bgcolor="#C6DEEA" >
						<tr>	
							<td  class="FormLabels" align="left"  colspan="1" width="20%">
								Submission Status
							</td>
							<td class="Textmatter" align="left"  colspan="1" width="22%">
								<%=""+customerStatus %>
							</td>
						</tr>
						<tr>	
							<td  class="FormLabels" align="left"  colspan="1" width="20%">
								Clearance Status 
							</td>
							<td class="Textmatter" align="left"  colspan="2" width="22%">
								<%=""+clearanceStatus %>
							</td>
						</tr>
						<%if(!customerUpdatedBy.equals("")){ %>
						<tr>	
							<td  class="FormLabels" align="left"  colspan="1" width="20%">
								Last Updated By
							</td>
							<td class="Textmatter" align="left"  colspan="1" width="22%">												
								<%=""+customerUpdatedBy%>
							</td>
						</tr>	
						<%} %>
					</table>
				</td>				
				<td valign="top">
					<table width="100%" align="Left" border="0"bgcolor="#C6DEEA" >
						<tr>
							<td class="FormLabels" align="left" width="16%">
								<bean:message key="Top.AgencyName"/>
							</td> 
							
							<td class="sectionhead1" align="left" width="24%">
							
								<%
								if(lngAgencyId>0){ %>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="true">	
									<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency" ><%=agencyName%></a>
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
									<a href="../GetAgentSummaryDetail.do?ReadOnly=Yes&entityId=<%=""+lngAgentId%>" onclick="return AgentPopup(this,'Agent');" target="Agent"><%=agentFName%> <%=" "%><%=agentLName%></a>
									</dmshtml:dms_static_with_connector >
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="false">
									<a><%=agentFName%> <%=" "%><%=agentLName%></a>
									</dmshtml:dms_static_with_connector >	
								
								<%}%>
							</td>
						</tr>
					  <tr>
							<td  class="FormLabels" align="left"  colspan="1" width="16%">
								Last Updated Date
							</td>
							<td class="Textmatter" align="left"  colspan="1" width="22%">
								<bean:define id="updatedDate" name='AddCustomer' property='answer(Object::Customer::UpdatedDate)'/>
								
								<%
									String lastSavedDate ="";
									String lastUpdatedDate = "";
									lastSavedDate = ""+updatedDate; 
									
									if(!customerUpdatedDate.equals("")){
										lastSavedDate = customerUpdatedDate;
										if(!customerUpdatedDate.equals("")){
										String arrUpdatedDate[] = lastSavedDate.split(" ");
										lastUpdatedDate = arrUpdatedDate[0];
										String arrUpdatedDate1[] = lastUpdatedDate.split("-");      
										String YYYY = arrUpdatedDate1[0];
										String MM = arrUpdatedDate1[1];
										String DD = arrUpdatedDate1[2];
										
										lastSavedDate = MM+"-"+DD+"-"+YYYY;
										}
									}else if(!lastSavedDate.equals("")){
                                        String arrUpdatedDate[] = lastSavedDate.split("-");                                        
                                        String YYYY = arrUpdatedDate[0];
										String MM = arrUpdatedDate[1];
										String DD = arrUpdatedDate[2];
										
										lastSavedDate = MM+"-"+DD+"-"+YYYY;
									}
									%>												
				 			<%=lastSavedDate %>	
							</td>											
						</tr>
					
					</table>
				</td>
				
			</tr>
			</table>
			<%}%>