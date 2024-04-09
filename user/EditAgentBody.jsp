<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/EditAgent.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<html:form action="/UpdateAgent" onsubmit="return validateFields(this)">
<div class="SubjectivityPage">									
<div class="content">
<%String agentId="";%>
<%if (request.getParameter("entityId")!= null) {
agentId=request.getParameter("entityId");
}%>
<%String agencyId="";%>
<%String agencyName="";%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="AgentId" name="AddAgent" property="answer(Object::UserDetail::PrimaryObjectId)"/> 
<bean:define id="userId" property="answer(Object::UserDetail::UserName)" name="LoginPage" scope="session"/>
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
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td class="Subjectivityformhead"><h2 class="left">EDIT AGENT</h2></td>
	</tr>
	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr>	
	<tr>
		<td class="TextMatter" colspan="2">
			Use This Page to Add Agents
		</td>
	</tr>
	<tr>
		<td colspan="3">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td class="links">
						<%if(request.getParameter("agencyType")!=null){%>			
						<a href="../AllLicences.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(1*Licence::Equals::SearchObjectId)=<bean:write name='AddAgent' property='answer(Object::Entity::EntityId)'/>&answer(1*Licence::Equals::SearchObjectType)=ENTITY&answer(1*Licence::Equals::SearchObjectTypeName)=AGENT&answer(Object::Entity::EntityId)=<%=agentId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Entity::FirstName)=<bean:write name='AddAgent' property='answer(Object::Entity::FirstName)'/>&answer(Agency::AgencyId)=<%=agencyId.toString()%>&objectType=GENERAL_AGENCY" title="Click to go to Show All Licence/Add Licence" />License and appointment states</a>
						<%}else{%>
					
						<a href="../AllLicences.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(1*Licence::Equals::SearchObjectId)=<bean:write name='AddAgent' property='answer(Object::Entity::EntityId)'/>&answer(1*Licence::Equals::SearchObjectType)=ENTITY&answer(1*Licence::Equals::SearchObjectTypeName)=AGENT&answer(Object::Entity::EntityId)=<%=agentId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Entity::FirstName)=<bean:write name='AddAgent' property='answer(Object::Entity::FirstName)'/>&answer(Agency::AgencyId)=<%=agencyId.toString()%>" title="Click to go to Show All Licence/Add Licence" />License and appointment states</a>
						<%}%>
					</td>	
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="true">					
					<td align="left" colspan="2">Agency Name :&nbsp;
						<%if(request.getParameter("agencyType")!=null){%>
						<a href="../EditAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&ReadOnly=Yes&agencyId=<%=agencyId%>&primaryObjectId=<%=agencyId%> &primaryObjectType=GENERAl_AGENCY"><%=agencyName.replaceAll("<","&lt;").replaceAll(">","&gt;")%></a>&nbsp;&nbsp;
						<%}else{%>
						
						<a href="../EditAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&ReadOnly=Yes&agencyId=<%=agencyId%>&primaryObjectId=<%=agencyId%> &primaryObjectType=AGENCY"><%=agencyName.replaceAll("<","&lt;").replaceAll(">","&gt;")%></a>
						<%}%>
					</td>
					</dmshtml:dms_static_with_connector>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MODIFY_AGENCY_DETAIL"}%>' connector='or' negated="false">					
					<td align="left" colspan="2">Agency Name :&nbsp;<%=agencyName.replaceAll("<","&lt;").replaceAll(">","&gt;")%>
					</td>
					</dmshtml:dms_static_with_connector>
					<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true">
						
 			<td class="links"align="left" colspan="2">
 		
				<a href="../SearchActivityManagerAction3.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Activity::OwnerId)=<%=""+ownerId%>&answer(Object::Activity::CreatedBy)=<%=userId.toString()%>&answer(Object::Activity::PageNum)=0&answer(Object::Activity::ActivityType)=<%= "Agent Management" %>&answer(Object::Activity::ObjectType)=<%="Agent" %>&answer(Object::Activity::ObjectId)=<%=""+agentId%>">Activity Log </a>

			</td>	</dmshtml:dms_static_with_connector>		
				</tr>
			</table>
		</td>
	</tr>
	<%java.util.ArrayList LiceArr = new java.util.ArrayList();%>

	<dmshtml:Get_LicenceDetail_ByObjectType nameInSession="LicenceDetailArr" ownerId="<%=(""+ownerId) %>" objectId="<%=agentId.toString()%>" objectType="ENTITY" objectTypeName="AGENT" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
	
	<logic:present name="LicenceDetailArr" scope="request">
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td>  
			List of Appointed States :&nbsp;
			<% LiceArr= (java.util.ArrayList)request.getAttribute("LicenceDetailArr");
				
				for (int i=0; i<LiceArr.size(); i++)  {
		         com.dms.ejb.licence.DMSLicenceDetail LicDetail=(com.dms.ejb.licence.DMSLicenceDetail) LiceArr.get(i);
			 %>
			
			<%=LicDetail.getLicenceScope()%>
			
			<%}%>
		</td>
	</tr>				
	</logic:present>	
	<tr>
		<td class="Error" COLSPAN="2">
			<%if (request.getParameter("status")!= null) {%>
			<%if (request.getParameter("status").equals("success")) {%>
			Updated
			<%}%>
			<%if (request.getParameter("status").equals("failure")) {%>
			Failed to Update!!  
			<%} }%>
			
			<!-- <ul>
			
			<bean:define id="ansmap" name="AddAgent" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
			<logic:iterate id="element" name="ansmap">
			<bean:define id="errorListkey" name="element" property="key" />
			<logic:equal name="errorListkey" value="Object::error::list">
			<bean:define id="errorListvalue" name="element" property="value" />
			<logic:iterate id="errmsg" name="errorListvalue">
			<li>
			<bean:write name="errmsg" property="errorMessage" />
			
			</li>
			</logic:iterate>
			</logic:equal>
			</logic:iterate> </ul> -->
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td align="left">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2" >
				 <tr>
					<td colspan="3" align="left"><h3>AGENT INFORMATION</h3></td>
				</tr>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
				connector='or' negated="true">	
				<tr>
					<td align="right">
						Agent Id&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2">
						<%=agentId.toString()%>
					</td>
				</tr>
				
				<tr>
					<td align="right">Agency Id&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="2"><%=agencyId%></td>
				</tr><tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.AgentNum"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::EntityNum)" size="10" maxlength="40" styleId="lastName" name="AddAgent" readonly="true"/>
					</td>
				</tr>
				</dmshtml:dms_static_with_connector>
				
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_LOOK_UP_FOR_AGENT"}%>' 
				connector='or' negated="false">	

				<tr>
					<td width="45%" align="right">
						Agency Name*&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td width="25%">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Agency::BusinessName)" value="<%=agencyName.toString()%>" size="40" maxlength="40" disabled="false" name="AddAgent" styleId="AgencyName" readonly="true"/>
					</td>
					<!--Agency lookup start 02-01-2007-->
					<td>
						<a href="../AgencyForAgentSearchPage1.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&LimitSearch=yes&FormName=AddAgent&answer(Object::Agency::PageNum)=0&clear=yes&answer(Agency::NotEquals::ParentAgencyId)=1" title="Search for Agency" onClick="return AgencyPopup(this, 'AgencyFind');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency."></a>
					</td>
					<!-- 05-06-2006 end-->
					<!-- <td align="left" colspan="3" ><html:button value="Find Agency" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return GoTOFindButton()"/></td> -->
				</tr>	
				
				</dmshtml:dms_static_with_connector>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" align="left"><h3>PERSONAL INFORMATION</h3></td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.FirstName"/>*&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="40" maxlength="40" name="AddAgent" styleId="firstName"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.MiddleInitial"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::middleName)" size="10" maxlength="10" name="AddAgent"/>
					</td>
				</tr>				
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.LastName"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::LastName)" size="40" maxlength="40" styleId="lastName" name="AddAgent"/>
					</td>
				</tr>
				
				<tr>
					<td width="45%" align="right">
						Title&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Title)" size="40" maxlength="40" name="AddAgent"/>
					</td>
				</tr>				
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Gender"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2">
						<dmshtml:dms_radio property = "answer(Object::Entity::Sex)" value="Male" />
						<bean:message key="Appointment.Male"/>&nbsp;
						<dmshtml:dms_radio property = "answer(Object::Entity::Sex)" value="Female" name="AddAgent"/>
						<bean:message key="Appointment.Female"/>
					</td>
				</tr>			
				<tr>
					<td width="45%" align="right">
						ID&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2" align="left">
						<dmshtml:dms_radio property = "answer(Object::Entity::GovtIdType)" value="Ssn" />SSN &nbsp;&nbsp;
						<dmshtml:dms_radio property = "answer(Object::Entity::GovtIdType)" value="Tax" />TAX ID&nbsp;&nbsp;&nbsp;
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::GovtIdNum)" size="20" maxlength="20" name="AddAgent"/>
					</td>
				</tr>			
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.AreYouAUSCitizen"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2">
						<dmshtml:dms_radio property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" value="Yes" name="AddAgent"/>
						<bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;
						<dmshtml:dms_radio property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" value="No" name="AddAgent"/>
						<bean:message key="Common.No"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.DateOfBirth"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Dob)" size="11" maxlength="11" name="AddAgent"/>&nbsp;(MM/DD/YYYY)
					</td>
				</tr>			
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<!-- Business Address -->
				<tr>
					<td colspan="3" align="left"><h3><bean:message key="Appointment.BUSINESSADDRESS"/></h3></td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Address"/>1&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">	
						<dmshtml:dms_textarea styleId="busAddress1" styleClass="txtarea"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)" rows="2" cols="30" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						Address 2&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_textarea styleId="busAddress2" styleClass="txtarea"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address2)" rows="2" cols="30" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.City" name="AddAgent"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox" styleId="City" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td  align="right">
						State&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
						<html:select property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)" styleClass="txtbox" styleId="State" name="AddAgent">
							<html:option value ="">Select</html:option>
							<logic:iterate id="details" name="arStates" scope="request" >
								<bean:define id='test' name="details"  property="typeDesc" />
								<html:option value ='<%=test.toString()%>'>
									<bean:write name="details" property="dmsType" />
								</html:option>
							</logic:iterate>
						</html:select>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						Country&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2">
						<dmshtml:dms_radio styleId="busCountryUS" property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" value="USA" />USA&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio styleId="busCountryCA" property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" value="Canada"  name="AddAgent"/>Canada
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Zip"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox" styleId="Zip"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)" size="10" maxlength="10" name="AddAgent"/>
						<!--Zipcode lookup start -->
						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddAgent&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
					</td>
						<!--  end-->	
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.PhoneNo"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  styleId="BusinessPhoneNum"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="40" maxlength="40" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right" >
						Fax&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  styleId="BusinessFaxNum"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::Fax)" size="40" maxlength="40" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.EMailAddress"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  styleId="BusinessEmail"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" size="50" maxlength="50" name="AddAgent"/>
					</td>
				</tr>				
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<!-- Home Address -->
				<tr>
					<td colspan="3" align="left"><h3><bean:message key="Appointment.HOMEADDRESS"/></h3></td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.HomeAddressSame"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">	
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::HomeAddressSame)" value="Yes" onchange="setHomeAddress(this);" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Address"/>1&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_textarea styleId="homeAddress1" styleClass="txtarea"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Address1)" rows="3" cols="30" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Address"/>2&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_textarea styleId="homeAddress2" styleClass="txtarea"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Address2)" rows="3" cols="30" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.City"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomeCity" property="answer(Object::Entity::Addresses::HOME::Object::Address::City)" size="30" maxlength="30" name="AddAgent"/>
					</td>
				<tr>
					<td  align="right">
						State&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
						<html:select property="answer(Object::Entity::Addresses::HOME::Object::Address::State)" styleClass="txtbox" styleId="HomeState" name="AddAgent">
						<html:option value ="">Select</html:option>
							<logic:iterate id="details" name="arStates" scope="request" >
							<bean:define id='test' name="details"  property="typeDesc" />
							<html:option value ='<%=test.toString()%>'>
								<bean:write name="details" property="dmsType" />
							</html:option>
							</logic:iterate>
						</html:select>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						Country&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2">
						<dmshtml:dms_radio property = "answer(Object::Entity::Addresses::HOME::Object::Address::Country)" value="USA" styleId="homeCountryUS"  />USA&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Addresses::HOME::Object::Address::Country)" value="Canada" styleId="homeCountryCA" name="AddAgent" />Canada
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Zip"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomeZip"   property="answer(Object::Entity::Addresses::HOME::Object::Address::Zip)" size="10" maxlength="10" name="AddAgent"/>
						<!--Zipcode lookup start 05-06-2006-->
						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddAgent&HomeFlag=Home&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
					</td>
				<!-- 05-06-2006 end-->
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.PhoneNo" />&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomePhoneNum"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::HomePhone)" size="40" maxlength="40" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						Fax&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomeFaxNum"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::Fax)" size="40" maxlength="40" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.EMailAddress"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomeEmail"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::EMailAddress)" size="50" maxlength="50" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" align="left"><h3><bean:message key="Appointment.PROFESSIONALDESIGNATIONS"/></h3>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.CLU"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CLU)" value="Yes" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.CPCU"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CPCU)" value="Yes" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.MDRT"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::MDRT)" value="Yes" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.NQA"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::NQA)" value="Yes" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.NASD"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::NASD)" value="Yes" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Others"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Others)" size="30" maxlength="30" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" align="left"><h3><bean:message key="Appointment.LICENSE"/></h3></td>
				</tr>
				<tr>
					<td  align="right">
						<bean:message key="Appointment.Lineofinsurance"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Life"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::Life)" value="Yes" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.AccidentOrHealth"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::AccidentOrHealth)" value="Yes" name="AddAgent" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Others"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="3"><dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Others1)" size="30" maxlength="50" name="AddAgent"/></td>
				</tr>
				
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Selectthestates"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2"><!--31--> 
						<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates1)" value="Illinois" name="AddAgent"/>&nbsp;Illinois&nbsp;
						<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates2)" value="Indiana" name="AddAgent"/>&nbsp;Indiana	&nbsp;
						<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates3)" value="Iowa" name="AddAgent"/>&nbsp;Iowa	&nbsp;
						<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates4)" value="Wisconsin" name="AddAgent"/>&nbsp;Wisconsin	
					</td>
				</tr> 		
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Inthestates"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Inthestates)" rows="5" cols="40" name="AddAgent"/>
					</td>
				</tr>
					<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Doyouhavenonresidentlicenses"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2">
						<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" value="Yes" name="AddAgent"/><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" value="No" name="AddAgent"/><bean:message key="Common.No"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Ifsolistthestates"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="2">
						<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Ifsolistthestates)" rows="5" cols="40" name="AddAgent"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" align="left"><h3><bean:message key="Appointment.OTHERDETAILS"/></h3></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
						<bean:message key="Appointment.Ifyouareassigning"/>
					</td>
				</tr>
				<!--tr>
					<td width="45%" align="left" class="Formlabels"><bean:message key="Appointment.AgencyAvailableName"/></td>
					
					<td colspan="3">&nbsp;<html:select property="answer(Object::Agency::ParentAgencyId)" >
					<html:option value ="-1">Select Your Agency</html:option>
					</html:select>
					</td></tr-->
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.AgencyName"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="2"><dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::AgencyName)" size="30" maxlength="30" name="AddAgent"/></td>
				</tr>									
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Status"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="2">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::OwnerOrPartner)" value="Yes" name="AddAgent"/><bean:message key="Appointment.OwnerOrPartner"/>
					</td>
				</tr>
					<tr>
					<td width="45%" align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="2"><dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CorporateOfficier)" value="Yes" name="AddAgent"/><bean:message key="Appointment.CorporateOfficier"/></td>
				</tr>
				<tr>
					<td width="45%" align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="2"><dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::Representative)" value="Yes" name="AddAgent"/><bean:message key="Appointment.Representative"/></td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.DoyoucarryErrors"/><br>
					<bean:message key="Appointment.MicaRequires"/>&nbsp;&nbsp;&nbsp;&nbsp;</td><!--43-->
					<td class="TextMatter" colspan="2"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::DoyoucarryErrors)" value="Yes" name="AddAgent"/><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::DoyoucarryErrors)" value="No" name="AddAgent"/><bean:message key="Common.No"/></td>
				</tr>	
				
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Haveyoueverhadanapplication"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="2"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)" value="Yes" name="AddAgent"/><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)" value="No" name="AddAgent"/><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Haveyoueverhadhaveaninsurancesuspended"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="2"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" value="Yes" name="AddAgent"/><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" value="No"name="AddAgent" /><bean:message key="Common.No"/></td>
				</tr>
				
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Havechargedorconvicted"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="2"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Havechargedorconvicted)" value="Yes" name="AddAgent"/><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Havechargedorconvicted)" value="No" name="AddAgent"/><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Arethereanyoutstandingjudgments"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="2"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)" value="Yes" name="AddAgent"/><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)" value="No" name="AddAgent"/><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td width="45%" align="right">
					<bean:message key="Appointment.Doesaninsurerinsured"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="2"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doesaninsurerinsured)" value="Yes" name="AddAgent"/><bean:message key="Common.Yes"/>&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doesaninsurerinsured)" value="No" name="AddAgent"/><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="Appointment.PleasenotethatYes"/></td>
					
				</tr>
				<tr>
					<td colspan="3" align="center"><dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::PleasenotethatYes)" rows="3" cols="80" name="AddAgent"/></td>
					
				</tr>
				
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">				
					<tr><td colspan="3">&nbsp;</td></tr>
	
					<tr>
						<td colspan="3" align="left"><h3>BRANCH INFORMATION</h3></td>
					</tr>
					<tr>
						<td align="right">Branch Name&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="links" style="Class:txtbox" colspan="2">&nbsp;
						
							<html:select property="answer(Object::Entity::BranchName)"  name="AddAgent" styleClass="txtbox" styleId="DocType">
								<html:option value ="Toronto">Toronto</html:option>
								<html:option value ="Calgary">Calgary</html:option>							
								<html:option value ="Puerto Rico">Puerto Rico</html:option>
								<html:option value ="Boston">Boston</html:option>
								<html:option value ="Miami">Miami</html:option>
								<html:option value ="New York">New York</html:option>
								<html:option value ="San Francisco">San Francisco</html:option>
							    <html:option value ="Denver">Denver</html:option>
                                <html:option value ="Los Angeles">Los Angeles</html:option>	
							    <html:option value ="Houston">Houston</html:option>		
							    <html:option value ="Chicago">Chicago</html:option>							
							</html:select>
						</td>
					</tr> 

			</dmshtml:dms_static_with_connector>
				
				 <tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3" align="left"><h3>USER ACCOUNT</h3></td>
				</tr>
				<tr>
					<td  align="right"><bean:message key="UserAccounts.UserName"/></td>
					<td class="TextMatter" align="left" colspan="2" >:&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name='AddAgent' property="answer(Object::UserDetail::userName)" name="AddAgent"/>&nbsp;&nbsp;
					<A HREF="../ChangePasswordForAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&userId=<bean:write name='AddAgent' property='answer(Object::UserDetail::userName)' />" onClick="return ZipCodePopup(this, 'ChangeAgentPassword');">
					<logic:notEmpty name='AddAgent' property='answer(Object::UserDetail::userName)'>
					<IMG SRC="../Images/GoButton.jpg" WIDTH="30" HEIGHT="16" BORDER="0" ALT="">
					</logic:notEmpty></A>
					</td>
				</tr> 
				<tr>
					<td  align="right"><bean:message key="UserAccounts.Question"/></td>
					<td class="TextMatter" align="left" colspan="2">:&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name='AddAgent' property="answer(Object::UserDetail::hintQuestion)" name="AddAgent"/></td>
				</tr> 
				
				<tr>
					<td align="right"><bean:message key="UserAccounts.Answer"/></td>
					<td class="TextMatter" align="left" colspan="2">:&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name='AddAgent' property="answer(Object::UserDetail::hintAnswer)" /></td>
				</tr> 
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
				connector='or' negated="true">	
				<tr>
					<td  align="right">Active</td>
					<td class="TextMatter" colspan="2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:select property="answer(Object::Entity::Active)" styleClass="txtbox">
					<html:option value ="Y">Yes</html:option>
				    <html:option value ='D'>No</html:option>
					</html:select></td>
				</tr>
				</dmshtml:dms_static_with_connector>
                <tr><td colspan="3">&nbsp;</td></tr>    
                <tr><td colspan="3">&nbsp;</td></tr> 
				<tr>
					<td align="right" class="Links"><html:submit value="Save" styleClass="covbutton"/></td>
					<td align="left" class="Links" colspan="2"><html:reset value="Clear" styleClass="covbutton"/></td>
				</tr>
				<tr><td colspan="3">&nbsp;</td></tr>
			</table>
		</td>
	</tr>
</table>
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(isDuplicateAllowed)" value="NO"/>
<html:hidden property="ownerId" value="<%=ownerId.toString()%>" /> 
<html:hidden property="page" value="2" /> 
<html:hidden property="answer(Object::UserDetail::roleName)" value="AGENT" />
<html:hidden property="answer(Object::Entity::EntityType)" value="AGENT" />
<html:hidden property="answer(Object::Entity::OwnerId)" value="<%=ownerId.toString()%>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />

<html:hidden property="answer(Object::UserDetail::roleName)" value="AGENT" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::User)" value="SysUser" />
<bean:define id="userpassword" property="answer(Object::UserDetail::passWord)" name="AddAgent" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::passWordConfirm)" value="<%=userpassword.toString()%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

<!-- Code to Prevent the back Button Issue-->


<%if(! agentId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::EntityId)" value="<%=agentId.toString()%>"  />
<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="<%=agentId.toString()%>"  />
<%} %>

<bean:define id="AgencyId" name="AddAgent" property="answer(Agency::AgencyId)"/> 
<%if(! AgencyId.toString().equals("")) {%>
<html:hidden property="answer(Agency::AgencyId)" value="<%=AgencyId.toString()%>"  styleId="AgencyIdFromPopup" />
<%} else{%>
<html:hidden property="answer(Agency::AgencyId)" value="<%=agencyId.toString()%>"  styleId="AgencyIdFromPopup" />
<%} %>

<!-- Passing Agent Address ID  -->
<bean:define id="AgentAddressId" name="AddAgent" property="answer(Object::Entity::PrimaryAddressId)"/> 

<%if(AgentAddressId==null) {%>
<html:hidden property="answer(Object::Entity::PrimaryAddressId)" value="-1"  />
<%} else if(! AgentAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::PrimaryAddressId)" value="<%=AgentAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::PrimaryAddressId)" value="-1"  />
<%}%>



<!-- Passing Agent BUSINESS Address ID -->
<bean:define id="AgentBusinessAddressId" name="AddAgent" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::AddressId)"/> 

<%if(AgentBusinessAddressId==null) {%>
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
<%} else if(! AgentBusinessAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::AddressId)" value="<%=AgentBusinessAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
<%}%>

<!-- Passing Agent HOME Address ID -->
<bean:define id="AgentHomeAddressId" name="AddAgent" property="answer(Object::Entity::Addresses::HOME::Object::Address::AddressId)"/> 

<%if(AgentHomeAddressId==null) {%>
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::AddressId)" value="0"  />
<%} else if(! AgentHomeAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::AddressId)" value="<%=AgentHomeAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::AddressId)" value="0"  />
<%}%>



<!-- Passing Primary Agent Contact ID -->
<bean:define id="AgentPrimaryContactId" name="AddAgent" property="answer(Object::Entity::PrimaryContactId)"/> 

<%if(AgentPrimaryContactId==null) {%>
<html:hidden property="answer(Object::Entity::PrimaryContactId)" value="0"  />
<%} else if(! AgentPrimaryContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::PrimaryContactId)" value="<%=AgentPrimaryContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::PrimaryContactId)" value="0"  />
<%}%>

<!-- Passing BUSINESS Agent Contact ID -->
<bean:define id="AgentBusSinessContactId" name="AddAgent" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::ContactId)"/> 

<%if(AgentBusSinessContactId==null) {%>
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
<%} else if(! AgentBusSinessContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::ContactId)" value="<%=AgentBusSinessContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
<%}%>

<!-- Passing HOME Agency Contact ID -->
<bean:define id="AgentHomeContactId" name="AddAgent" property="answer(Object::Entity::Contacts::HOME::Object::Contact::ContactId)"/> 

<%if(AgentHomeContactId==null) {%>
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
<%} else if(! AgentHomeContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::ContactId)" value="<%=AgentHomeContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
<%}%>
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::County)" styleId="County"/>
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::County)" styleId="HomeCounty"/>

<html:hidden property="answer(Object::UserDetail::email)" styleId="userEmail"/>
<bean:define id="AgentUserName" name="AddAgent" property="answer(Object::UserDetail::userName)"/> 
<html:hidden property="answer(Object::UserDetail::userName)" value="<%=""+AgentUserName%>"/>
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=""+ownerId%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=""+ownerId%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Agent"%>"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Agent Management"%>"/>
	<html:hidden property="answer(Object::Activity::ObjectId)" value="<%=""+AgentId%>"/>

<input type="hidden" name="answer(EDIT)" value="YES">
</div>
</div>
</html:form>

