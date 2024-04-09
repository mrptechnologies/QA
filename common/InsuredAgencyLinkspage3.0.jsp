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
<%String generalAgencyName="";%>

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
	
<%
	
if(cId!=null && (!cId.toString().equals(""))){%>
	<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="customerDetail1" scope="request">

		<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		
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
		
		<div class="frame5ForInsuredHeader">
			<div class="frlabelLenForInsuredHeader left frVerLineForInsuredHeader">
				<bean:message key="Top.EmployerGroupName"/>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><a id="InsuredSummaryPageLink" href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId.toString()%>&answer(Object::Customer::CustomerId)=<%=cId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>" ><%=customerDetailMap.getEncodedString("custname")%></a></span><br />
				<bean:message key="Top.CreatedBy"/>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+customerCreatedBy%></span><br />
			</div>
			<div class="frlabelLen left frVerLineForInsuredHeader">
				<bean:message key="Top.AgencyName"/>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">			
				<%
				if(lngAgencyId>0){ %>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="true">	
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="true">	
							<a href="../EditAgencies.do?TabPanelName=Manage_Panel&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY"><%=agencyName%></a>
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="false">	
						 	<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency" ><%=agencyName%></a> 
						</dmshtml:dms_static_with_connector>
					</dmshtml:dms_static_with_connector >
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="false">
					<a><%=agencyName%></a>
					</dmshtml:dms_static_with_connector >	
				<%}%></span><br/>												
			</div>
			<div class="frlabelLen left">				
				<bean:message key="Top.AgentName"/>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">			
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
				
				<%}%></span><br />
			</div>
		</div>
	</logic:present>
<%}%>