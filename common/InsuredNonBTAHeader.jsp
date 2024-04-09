<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>

<%long lngAgencyId=0;%>
<%long lngAgentId=0;%>
<%String agentFName="";%>
<%String agentLName="";%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

	<%if(request.getParameter("answer(Agency::AgencyId)")!= null && request.getParameter("answer(Agency::AgencyId)")!="") {%>
	<bean:parameter id="agencyIdPara" name="answer(Agency::AgencyId)" />
	<%lngAgencyId = Long.parseLong(agencyIdPara);%>
	<%}%>
	
	<%if(request.getParameter("answer(AgentFirstName)")!= null && request.getParameter("answer(AgentFirstName)")!="") {%>
	<bean:parameter id="agentFirstName" name="answer(AgentFirstName)" />
	<%agentFName = agentFirstName;%>
	<%}%>
	
	<%if(request.getParameter("answer(AgentLastName)")!= null && request.getParameter("answer(AgentLastName)")!="") {%>
	<bean:parameter id="agentLastName" name="answer(AgentLastName)" />
	<%agentLName = agentLastName;%>
	<%}%>
	
	

<dmshtml:get_agency_detail nameInSession="agencyDetail" agencyId="<%=lngAgencyId+""%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			<logic:present name="agencyDetail" scope="request">
			<bean:define id="agdetail" name="agencyDetail" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
			<bean:define id="agencyName" name="agdetail" property="businessName"/>
			<html:hidden  property="answer(Object::Agency::BusinessName1)" value="<%=agencyName+"" %>" styleId="agencyName"/>

				<bean:define id="addressMap" name="agdetail" property="addresses" type="java.util.HashMap" />
				<bean:define id="addressDetail" name="addressMap" property="BUSINESS" type="com.dms.ejb.address.AddressDetail" />			
	
			<div class="frame11ForInsuredHeader">   		
			
				<div class="frlabelLenForInsuredHeader left frVerLineForInsuredHeader">
					Agent Name:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">
					<%if(!agentFName.equals("") || !agentLName.equals("")){%>
						<%=agentFName%> <%=" "%><%=agentLName%>
					<%}%>
					</span><br />
				</div>
				
				<div class="frlabelLenForInsuredHeader1 left">
					Agency Name:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">
					<%if(lngAgencyId>0){ %>
						<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency" title="<bean:message key='ToolTip.InsuredSummary.AgencyName'/>"><%=agencyName%></a>
					<%}%>
					</span><br />					
				</div>	
			</div>
		</logic:present>