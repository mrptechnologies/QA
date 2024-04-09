<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
	connector='or' negated="true">	
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>

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

	<div class="frame2ForSubmissionHeader">
			<div class="frlabelLenForSubmission3 left frVerLineForSubmission">
				Submission Name:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><bean:write name='AddCustomer' property='answer(Object::Customer::CustomerName)'/></span><br />
				Submission #:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"></span><br />
				Created by:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><bean:write name='AddCustomer' property='answer(Object::Submission::CreatedBy)'/></span>
			</div>						
			<div class="frlabelLenForSubmission1 left frVerLineForSubmission">
				Submission Status:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><bean:write name='AddCustomer' property='answer(Object::Submission::Status)'/></span><br />
				Clearance Status:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><bean:write name='AddCustomer' property='answer(Object::Submission::ClearanceStatus)'/></span><br />
				Last Updated By:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><bean:define id="updatedBy" name='AddCustomer' property='answer(Object::Customer::UpdatedBy)'/><bean:write name='AddCustomer' property='answer(Object::Customer::UpdatedBy)'/></span>
			</div>			
			<div class="frlabelLenForSubmission2 left">
				<bean:message key="Top.AgencyName"/>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">
				<bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
				<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
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


				<%}else{
				%>
<%// ********************agency, agent, general ageny details by customer id ********************* %>
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
<% //************Agency agent, general agenct detail by user id ******************************  %>										
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
					<%}%>
				<%}%>
						
			<!-- GENERAL BLOCK -->
					<%
					if(agencyId2>0){ %>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="true">	
						<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+agencyId2%>&primaryObjectId=<%=""+agencyId2%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" title="Agency" ><%=agencyName2.replaceAll("<","&lt;").replaceAll(">", "&gt;")%></a>
						</dmshtml:dms_static_with_connector >
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="false">
						<a><%=agencyName2.replaceAll("<","&lt;").replaceAll(">","&gt;")%></a>
						</dmshtml:dms_static_with_connector >	
				<%}%>
				<%if(dataBaseIdViewPrivillage==1) {%>
						<%="- "%><%=""+agencyId2%>
						<%}%>
						</span><br />
				<bean:message key="Top.AgentName"/>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">					
				<%
				if(!strAgentLName.equals("") || !strAgentFName.equals("")){%>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="true">
					<a href="../GetAgentSummaryDetail.do?ReadOnly=Yes&entityId=<%=""+lngAgentId1%>" onclick="return AgentPopup(this,'Agent');" title="Agent"><%=strAgentFName.replaceAll("<","&lt;").replaceAll(">","&gt;")%> <%=" "%><%=strAgentLName.replaceAll("<","&lt;").replaceAll(">","&gt;")%></a>
					</dmshtml:dms_static_with_connector >
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="false">
					<a><%=strAgentFName.replaceAll("<","&lt;").replaceAll(">","&gt;")%> <%=" "%><%=strAgentLName.replaceAll("<","&lt;").replaceAll(">","&gt;")%></a>
					</dmshtml:dms_static_with_connector >	
				
				<%}%>
				</span><br/>
				Last Updated Date:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">
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
					<% } %>	</span><br/>			
			</div>
		</div>				