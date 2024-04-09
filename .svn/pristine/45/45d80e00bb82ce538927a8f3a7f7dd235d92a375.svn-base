<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<html:form action="/UpdateAgent"  onsubmit="return validateRequest(this)">

<%String agentId="";%>
<%if (request.getParameter("entityId")!= null) {
agentId=request.getParameter("entityId");
}%>
<%String agencyId="";%>
<%String agencyName="";%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="AgentId" name="AddAgent" property="answer(Object::UserDetail::PrimaryObjectId)"/> 
<bean:define id="agencyIdUpdate" name="AddAgent" property="answer(Agency::AgencyId)"/>

<%if(agentId.equals("")) {
agentId=AgentId.toString();
}

if(request.getParameter("agencyType")!=null) {
				
				%>


<dmshtml:Get_ObectIds_ByEntityId nameInSession="arrObjectIds" ownerId="<%=(""+ownerId) %>" entityId="<%=agentId.toString()%>" objectType="GENERAL_AGENCY"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
<%

}
else
{%>
<dmshtml:Get_ObectIds_ByEntityId nameInSession="arrObjectIds" ownerId="<%=(""+ownerId) %>" entityId="<%=agentId.toString()%>" objectType="AGENCY"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>

<% 
}java.util.ArrayList agentIdArr= (java.util.ArrayList)request.getAttribute("arrObjectIds");
		for (int i=0; i<agentIdArr.size(); i++)  {
        agencyId=agentIdArr.get(i).toString();	 
 %>
	
	<%}%>

<%if(!agencyIdUpdate.toString().equals("")&&(agencyIdUpdate!=null)) {
agencyId=agencyIdUpdate.toString();
}%>
<%if(!agencyId.equals("")) {%>

<dmshtml:get_agency_detail nameInSession="agencyDetail2" agencyId="<%=agencyId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<%}%>
<logic:present name="agencyDetail2" scope="request">
					<bean:define id="agdetail2" name="agencyDetail2" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
					<bean:define id="businessname" name="agdetail2" property="businessName"/>
					<bean:define id="id" name="agdetail2" property="id"/>
					<%agencyName=businessname.toString();%>

				</logic:present>


<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>	

<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="1" CELLPADDING="1">
	
	<tr><td class="NewSectionHead" align="center">AGENT INFORMATION</td></tr>
	
	<tr>
		<td align="left" width="100%" valign="top">
			<table WIDTH="100%" ALIGN="center" BORDER="0" bgcolor="#C6DEEA" >
				<tr>
					<td align="center">
						<table WIDTH="80%" ALIGN="left" BORDER="0"  bgcolor="#C6DEEA">
							
							<tr>
								
								<td align="left" class="Formlabels">
									<bean:message key="Appointment.FirstName"/>
								</td>
									<td class="sectionhead1" align="left"><bean:write  property="answer(Object::Entity::FirstName)"  name="AddAgent" />
								</td>
							</tr>	
							<tr>
								<td align="left" class="Formlabels">
									<bean:message key="Appointment.MiddleInitial"/>
								</td>
								<td class="sectionhead1" align="left">
									<bean:write  property="answer(Object::Entity::middleName)"  name="AddAgent"/>
								</td>
							</tr>
							<tr>
							
								<td  align="left" class="Formlabels">
									<bean:message key="Appointment.LastName"/>
								</td>
								<td class="sectionhead1" align="left">
									<bean:write property="answer(Object::Entity::LastName)"  name="AddAgent"/>
								</td>
							</tr>	
							<tr>
								<td  align=""left"" class="Formlabels">
									Title
								</td>
								<td class="sectionhead1" align="left">
									<bean:write  property="answer(Object::Entity::Title)"  name="AddAgent"/>
								</td>
							</tr>	
							 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
								<tr>
									<td class="FormLabels" align="left">
										Agent/Broker Contact Id
									</td>
									<td class="sectionhead1" align="left">
										<%=agentId.toString()%>
									</td>
								</tr>
							</dmshtml:dms_static_with_connector>
							<tr>
								<td align="left" class="Formlabels">
									Agency/Broker Name
								</td>
								<td class="sectionhead1" align="left"><bean:write name="agdetail2" property="businessName"/></td>
							</tr>	
							<tr>
									<td class="FormLabels" align="left">Agency/Broker Code</td>
									<td class="sectionhead1"><%=agencyId%></td>
							</tr>		
							<tr>
								<td align="left" class="Formlabels">
									<bean:message key="Appointment.EMailAddress"/>
								</td>
								<td class="sectionhead1" align="left">
									<bean:write   property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" name="AddAgent"/>
								</td>
							</tr>
						</table>
					</td>
				
					<td align="center">
						<table WIDTH="90%" ALIGN="left" BORDER="0"  bgcolor="#C6DEEA">
							<tr>
								<td align="left" class="Formlabels" >
									<bean:message key="Appointment.Address"/>1
								</td>
								<td class="sectionhead1" align="left">	
									<bean:write   property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)"  name="AddAgent"/>
								</td>
								
							</tr>
							<tr>
								<td align="left" class="Formlabels" >
									<bean:message key="Appointment.Address"/>2
								</td>
								<td class="sectionhead1" align="left">	
									<bean:write   property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address2)"  name="AddAgent"/>
								</td>
							</tr>
							<tr>
								<td  align="left" class="FormLabels">
									<bean:message key="Appointment.City" name="AddAgent"/>
								</td>
								<td class="sectionhead1" align="left">
									<bean:write  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)"  name="AddAgent"/>
								</td>
							</tr>	
							<tr>
								<td  align="left" class="FormLabels">
									State
								</td>
								<td class="sectionhead1" align="left">
									<bean:write property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)"  name="AddAgent"/>
								</td>
							</tr>
							<tr>
								<td align="left" class="Formlabels">
									<bean:message key="Appointment.Zip"/>
								</td>
								<td class="sectionhead1" align="left">
									<bean:write   property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)"  name="AddAgent"/>
								</td>
							</tr>
							<tr>
								<td align="left" class="Formlabels">
									Country
								</td>
								<td class="sectionhead1" align="left">
									<bean:write  property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" name="AddAgent"/>
								</td>
							</tr>				
							<tr>
								<td align="left" class="Formlabels">
									Phone
								</td>
								<td class="sectionhead1" align="left">
									<bean:write   property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)"  name="AddAgent"/>
								</td>
							</tr>				
							<tr>
								<td align="left" class="Formlabels">
									Fax
								</td>
								<td class="sectionhead1" align="left">
									<bean:write   property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::Fax)"  name="AddAgent"/>
								</td>
							</tr>			
					</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">
					<a href="javascript:checkForInvalidSessionCloseAndForward('Y');"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="1" /></a>
				</td>
			</tr>		
		</table>
	</td>
</tr>
</table>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>

