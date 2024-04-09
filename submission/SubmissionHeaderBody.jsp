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
	<%if(request.getAttribute("answer(Object::Submission::SubmissionId)")!= null ) {%>
	<%submissionId=""+request.getAttribute("answer(Object::Submission::SubmissionId)");%>
	<%}else if(request.getAttribute("Object::Submission::SubmissionId")!= null ) {%>
	<%submissionId=""+request.getAttribute("Object::Submission::SubmissionId");%>
	<%}else if(request.getParameter("answer(Object::Submission::SubmissionId)")!= null ) {%>
	<bean:parameter id="submissionId1" name="answer(Object::Submission::SubmissionId)" />
	<%submissionId=submissionId1;%>
	<%}%>
	
	<%if(request.getParameter("answer(Object::Submission::SubmissionVerId)")!= null ) {%>
	<bean:parameter id="SubmissionVerId1" name="answer(Object::Submission::SubmissionVerId)" />
		<%submissionVerId=SubmissionVerId1;%>
	<%} else if(request.getAttribute("Object::Submission::SubmissionVerId")!= null ) {%>
		<%submissionVerId=""+request.getAttribute("Object::Submission::SubmissionVerId");%>
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
		customerCreatedBy = customerDetailMap.getEncodedString("customerCreatedBy");
		customerUpdatedBy = customerDetailMap.getEncodedString("UpdatedBy");
		customerCreatedDate = customerDetailMap.getString("customerCreatedDate");
		customerStatus = customerDetailMap.getString("custStatus");
		submissionNumber = customerDetailMap.getString("SubmissionNumber");
		clearanceStatus = customerDetailMap.getString("ClearanceStatus");
		customerUpdatedDate = customerDetailMap.getString("UpdatedDate");
		try{
		lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));
		}catch(Exception nfe) {lngGeneralAgencyId=0;    }
		generalAgencyName=customerDetailMap.getString("generalagencyname");%>
	
	<%
	String agencyIdTemp1 = ""+lngAgencyId;
	String AgentId1 = ""+lngAgentId;
	if(!agencyIdTemp1.toString().equals("")) {		
			String agencyIdTemp = "";
			String agencyAgentId ="";
			long lngAgencyTemp = 0;
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
				<%lngAgencyId=Long.parseLong(agdetail2.getString("agencyid"));			
				agencyName=agdetail2.getString("agencyname");	%>	
			</logic:present>
		<%}
			 long lgAgentId1=0;
				try {				
				if(!agencyAgentId.equals("")){
					AgentId1=agencyAgentId;
				}
				lgAgentId1=Long.parseLong(AgentId1.toString());															
			} catch(Exception ex){} %>	 
			
			<%if(lgAgentId1>0){%>
			<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId='<%=""+lgAgentId1%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
			<logic:present name="agentDetail" scope="request">
				<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
				<%lngAgentId=lgAgentId1;%>
				<%agentFName=agentDetail1.getString("agentfname");%>
				<%agentLName=agentDetail1.getString("agentlname");%>
			</logic:present>
		<%}
			
	}%>
		
		<div class="frame2ForSubmissionHeader">
			<div class="frlabelLenForSubmission3 left frVerLineForSubmission">
				Submission Name:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerId%>&answer(Object::Submission::SubmissionId)=<%=""+submissionId%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" title="<bean:message key='ToolTip.SubmissionSummary.SubmissionName'/>"><%=customerDetailMap.getEncodedString("custname")%></a></span><br/>
				Submission #:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><a id="submissionSummaryPageLink" href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+submissionVerId%>&answer(Object::Submission::SubmissionId)=<%=""+submissionId%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" title="<bean:message key='ToolTip.SubmissionSummary.SubmissionNumber'/>"><%=submissionNumber+"" %></a></span><br />
				Created by:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+customerCreatedBy%></span>
			</div>			
			<div class="frlabelLenForSubmission1 left frVerLineForSubmission">
					Submission Status:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+customerStatus %></span><br />
					Clearance Status:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+clearanceStatus %></span><br />
					Last Updated by:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+customerUpdatedBy%></span>
			</div>			
			<div class="frlabelLenForSubmission2 left">
					Agency Name:&nbsp;&nbsp;&nbsp;<span class="frinfoLen" title="<bean:message key='ToolTip.SubmissionSummary.AgencyName'/>">
					<%
					if(lngAgencyId>0){ %>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="true">	
						<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency" ><%=agencyName.replaceAll("<","&lt;")%></a>
						</dmshtml:dms_static_with_connector >
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="false">
						<a><%=agencyName.replaceAll("<","&lt;")%></a>
						</dmshtml:dms_static_with_connector >	
					<%}%>
					</span><br />
					Agent Name:&nbsp;&nbsp;&nbsp;<span class="frinfoLen" title="<bean:message key='ToolTip.SubmissionSummary.AgentName'/>">
					<%
					if(!agentFName.equals("") || !agentLName.equals("")){%>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="true">
						<a href="../GetAgentSummaryDetail.do?ReadOnly=Yes&entityId=<%=""+lngAgentId%>" onclick="return AgentPopup(this,'Agent');" target="Agent"><%=agentFName.replaceAll("<","&lt;")%> <%=" "%><%=agentLName.replaceAll("<","&lt;")%></a>
						</dmshtml:dms_static_with_connector >
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="false">
						<a><%=agentFName.replaceAll("<","&lt;")%> <%=" "%><%=agentLName.replaceAll("<","&lt;")%></a>
						</dmshtml:dms_static_with_connector >	
					
					<%}%>
					</span><br />
					Last Updated Date:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">
					<%
									String lastSavedDate ="";
									String lastUpdatedDate = "";
									lastSavedDate = ""+customerUpdatedDate; 
									
									if(!lastSavedDate.equals("")){
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
				 			</span>
			</div>			
		</div>
		</logic:present>	
			<%}%>
		