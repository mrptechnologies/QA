<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title><%=session.getAttribute("PageTitle")%></title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">


</head>

<body leftmargin="0" rightmargin="0" topmargin="0">


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	
	
	<tr>

		<td valign="top">
		<table WIDTH="95%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		
		<tr>
		<td valign="top">
				<logic:present name="arrObjectDetail" scope="session">
			<bean:define id="actionid" value=""  toScope="session"/> 

			<dmshtml:dms_static ruleName="role" property="GUEST" negated="true">
            <%
			actionid="/AddAppointment";
			%>			
		    </dmshtml:dms_static>
			
			<dmshtml:dms_static ruleName="role" property="ADMIN" negated="true">
            <%
			actionid="/AddAppointmentRequest";
			%>			
			</dmshtml:dms_static>

			<html:form action="<%=actionid.toString()%>">

		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
		<html:hidden property="answer(entityType)" value="AGENT" />

		<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="4">
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
	<tr>
		<td colspan="2" class="MH">ONLINE APPOINTMENT REQUEST</td>
	</tr>
	<tr><td class="TextMatter" colspan="2"><bean:message key="Appointment.ModDescription"/></td></tr>
	<tr>
		<td colspan="2" align="center"><hr size="1" noshade></td>
		
	</tr>
	<TR><TD COLSPAN="2" class="Error">
	<html:errors/></TD></TR>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.PersonalInfo"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.FirstName"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::FirstName)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.MiddleInitial"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::middleName)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.LastName"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::LastName)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.DateOfBirth"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Dob)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Gender"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities"  property = "answer(Object::Entity::Sex)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AreYouAUSCitizen"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" /></td>
	</tr>
	
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.BUSINESSADDRESS"/></td></tr>
	
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)" /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" /></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.State"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)"/>
		</td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" /></td>
	</tr>
	
	
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.HOMEADDRESS"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.HomeAddressSame"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::HomeAddressSame)"  /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::HOME::Object::Address::Address1)" /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::HOME::Object::Address::City)" /></td>
	</tr>
		<tr>
		<td class="FormLabels" align="right">State*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::HOME::Object::Address::State)" /></td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::HOME::Object::Address::Zip)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo" /></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Contacts::HOME::Object::Contact::HomePhone)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Contacts::HOME::Object::Contact::EMailAddress)" /></td>
	</tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.PROFESSIONALDESIGNATIONS"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.CLU"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::CLU)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.CPCU"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::CPCU)"  /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.MDRT"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::MDRT)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.NQA"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::NQA)"/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.NASD"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::NASD)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Others"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Others)" /></td>
	</tr>
	
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.LICENSE"/></td></tr>
	<tr>
		<td class="Formlabels" align="right"><bean:message key="Appointment.Lineofinsurance"/></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Life"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Life)"  /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AccidentOrHealth" /></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::AccidentOrHealth)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Others"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Others1)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Selectthestates"/></td>
		<td class="TextMatter">&nbsp; 
		<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Selectthestates1)" /><br>&nbsp;
		<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Selectthestates2)" /><br>&nbsp;
		<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Selectthestates3)" /><br>&nbsp;
		<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Selectthestates4)" />
		</td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Inthestates"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Inthestates)" /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Doyouhavenonresidentlicenses"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Ifsolistthestates"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Ifsolistthestates)" /></td>
	</tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.OTHERDETAILS"/></td></tr>
	<tr>
		<td colspan="2" class="TextMatter"><bean:message key="Appointment.Ifyouareassigning"/></td>	</tr>


	<td>

	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AgencyName"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::AgencyName)" /></td>
	</tr>
	



		
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Status"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::OwnerOrPartner)" /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels">&nbsp;</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::CorporateOfficier)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">&nbsp;</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Representative)" /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.DoyoucarryErrors"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::DoyoucarryErrors)" /></td>
	</tr>	
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Haveyoueverhadanapplication"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication) "/></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Haveyoueverhadhaveaninsurancesuspended"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Havechargedorconvicted"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Havechargedorconvicted)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Arethereanyoutstandingjudgments"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">
		<bean:message key="Appointment.Doesaninsurerinsured"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Doesaninsurerinsured)"  /></td>
	</tr>
	<tr>
		<td colspan="2" class="Formlabels"><bean:message key="Appointment.PleasenotethatYes"/></td>
		
	</tr>
	<tr>
		<td colspan="2" align="center" class="TextMatter"><bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::PleasenotethatYes)" /></td>
		
	</tr>
	<tr>
		<td colspan="2"><hr size="1" noshade width="95%"></td>
		
	</tr>
	
	<tr>
		<td colspan="2"><hr size="1" noshade width="95%"></td>
		
	</tr>
     	<dmshtml:dms_static ruleName="role" property="ADMIN" negated="true">
	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="Appointments.status"/>
		&nbsp;</td>
		<td>&nbsp;<html:select property="answer(Object::EntityAdditional::Status)" >
		<html:option value="Pending">Select A Status</html:option>
		<html:option value="Approved"/>Approved</html:option>
		<html:option value="Rejected"/>Rejected</html:option>
		</html:select></td>
	</tr>
	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="Appointment.Comments"/>
		&nbsp;</td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Comments)" cols="30" rows="3" /></td>
	</tr>
	</dmshtml:dms_static>
	<tr>
		<td colspan="2" align="center">
		<html:submit value="Submit" styleClass="sbttn" />
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
</table>
<logic:notPresent name="arrObjectDetail" scope="session">
<html:hidden property="answer(Object::UserDetail::userName)" value="SysUser" />
</logic:notPresent>
<dmshtml:dms_static ruleName="role" property="ADMIN">
<html:hidden property="answer(Object::UserDetail::roleName)" value="GUEST" /> 
</dmshtml:dms_static>
<html:hidden property="answer(Object::Entity::Active)" value="Y" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
<html:hidden property="page" value="<%=""+ownerId %>" /> 
<bean:define id="agentStatus" name='AddAllEntities' property='answer(Object::EntityAdditional::Status)'/>
<%if(!(agentStatus.toString().equals("Approved"))&&!(agentStatus.toString().equals("Rejected"))){%>
<html:hidden property="formName" value="MicacareEntity::AddAppointment" />
<%}%>
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::User)" value="SysUser" />
   <html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::User)" value="SysUser" />
   <html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::User)" value="SysUser" />
   <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
   </html:form>



				</logic:present>
		<logic:notPresent name="arrObjectDetail" scope="session">
			<html:form action="/AddAppointment">
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

		<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="4">
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
	<tr>
		<td colspan="2"><img src="../Images/OAA.gif"></td>
	</tr>
	<tr><td colspan="2"><hr size=1 noshade width="95%"/> </td></tr>
	<tr><td class="TextMatter" colspan="2">The Municipal Insurance Company of America (MICA) requires producers to be appointed before
	they can submit business for quotation. Please complete and submit the application information below in order to start the 
	approval process. When you have submitted the information, please print the application by clicking on the 'Print' icon on the Confirmation page. The 
	application will be created in print format with the appropriate legal language added.<br><br>
	Sign and date the application, enclose a copy of your a current license and mail to:<br><br>
	Municipal Insurance Company Of America<br>
	85 West Algonquin Road, Suite 300<br>
	Arlington Heights IL60005<br><br>
	Please note:
	<li>if you are assigning your commission to an agency, you must enclose a copy of your corporate license.</li>
	<li>if you carry Errors & Omissions Insurance, you must enclose a copy of the declarations page of your current policy (MICA requires that all appointed producers carry E&O insurance from a company rated B+ or higher by A.M.Best).</li><br>
	
	Once your appointment has been approved, we will formally notify you and e-mail you a Producer Agreement that you should 
	execute and return to us.<br><br>
	We look forward to welcoming you as a MICA agent.<br>
	If you have any questions, please e-mail appointment@micacare.com.<br>
	
	</td></tr>	
	<tr>
		<td colspan="2" align="right" class="links"><img SRC="../Images/Print.gif" WIDTH="16" HEIGHT="16">&nbsp;&nbsp;Print a blank Appointment  Application</td>
		
	</tr>
	<tr><td class="TextMatter" colspan="2">You will need to answer the questions marked with an asterisk for the application to submit.</td><tr>
	<tr>
		<td colspan="2" align="center"><hr size="1" noshade></td>
		
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<TR><TD COLSPAN="2" class="Error">
	<html:errors/></TD></TR>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.PersonalInfo"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.FirstName"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::FirstName)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.MiddleInitial"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::middleName)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.LastName"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::LastName)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.DateOfBirth"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Dob)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Gender"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::Entity::Sex)"  /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AreYouAUSCitizen"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::AreYouAUSCitizen)"  /></td>
	</tr>
	
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.BUSINESSADDRESS"/></td></tr>
	
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)" /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" /></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.State"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)" />
		</td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" /></td>
	</tr>
	
	
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.HOMEADDRESS"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.HomeAddressSame"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::HomeAddressSame)" /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Address"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::HOME::Object::Address::Address1)" /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.City"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::HOME::Object::Address::City)" /></td>
	</tr>
		<tr>
		<td class="FormLabels" align="right">State*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::HOME::Object::Address::State)" />
		</td>

	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Zip"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Addresses::HOME::Object::Address::Zip)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.PhoneNo" /></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Contacts::HOME::Object::Contact::HomePhone)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.EMailAddress"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::Entity::Contacts::HOME::Object::Contact::EMailAddress)" /></td>
	</tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.PROFESSIONALDESIGNATIONS"/></td></tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.CLU"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::CLU)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.CPCU"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::CPCU)" /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.MDRT"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::MDRT)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.NQA"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::NQA)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.NASD"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::NASD)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Others"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Others)" /></td>
	</tr>
		<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.LICENSE"/></td></tr>
	<tr>
		<td class="Formlabels" align="right"><bean:message key="Appointment.Lineofinsurance"/></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Life"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Life)"  /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AccidentOrHealth" /></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::AccidentOrHealth)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Others"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Others1)" /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Selectthestates"/></td>
		<td class="TextMatter">&nbsp; 
		<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Selectthestates)"/>
		</td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Inthestates"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Inthestates)" /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Doyouhavenonresidentlicenses"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)"  /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Ifsolistthestates"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::Ifsolistthestates)" /></td>
	</tr>
	<tr><td colspan="2" align="center" class="display"><bean:message key="Appointment.OTHERDETAILS"/></td></tr>
	<tr>
		<td colspan="2" class="TextMatter"><bean:message key="Appointment.Ifyouareassigning"/></td>	</tr>


	<td>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.AgencyName"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::AgencyName)" /></td>
	</tr>
	



	
		
		<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Status"/>*</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::OwnerOrPartner)"  /></td>
	</tr>
		<tr>
		<td width="50%" align="right" class="Formlabels">&nbsp;</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::CorporateOfficier)" /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">&nbsp;</td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Representative)" /></td>
	</tr>
<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.DoyoucarryErrors"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::DoyoucarryErrors)"  /></td>
	</tr>	
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Haveyoueverhadanapplication"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Haveyoueverhadhaveaninsurancesuspended"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)"  /></td>
	</tr>
	
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Havechargedorconvicted"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Havechargedorconvicted)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels"><bean:message key="Appointment.Arethereanyoutstandingjudgments"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)"  /></td>
	</tr>
	<tr>
		<td width="50%" align="right" class="Formlabels">
		<bean:message key="Appointment.Doesaninsurerinsured"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="AddAllEntities" property = "answer(Object::EntityAdditional::Doesaninsurerinsured)"  /></td>
	</tr>
	<tr>
		<td colspan="2" class="Formlabels"><bean:message key="Appointment.PleasenotethatYes"/></td>
		
	</tr>
	<tr>
		<td colspan="2" align="center" class="TextMatter"><bean:write name="AddAllEntities" property="answer(Object::EntityAdditional::PleasenotethatYes)" /></td>
		
	</tr>
	<tr>
		<td colspan="2"><hr size="1" noshade width="95%"></td>
		
	</tr>
	
     	<dmshtml:dms_static ruleName="role" property="ADMIN" negated="true">
	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="Appointments.status"/>
		&nbsp;</td>
		<td>&nbsp;<html:select property="answer(Object::EntityAdditional::Status)" >
		<html:option value="">Select A Status</html:option>
		<html:option value="Approved"/>Approved</html:option>
		<html:option value="Rejected"/>Rejected</html:option>
		</html:select></td> 
	</tr>
	<tr>
		<td align="right" class="FormLabels">
		<bean:message key="Appointment.Comments"/>
		&nbsp;</td>
		<td class="TextMatter">&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Comments)" rows="5" cols="50"/></td>
	</tr>
	</dmshtml:dms_static>
	<tr>
		<td colspan="2"><hr size="1" noshade width="95%"></td>
		
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<html:submit value="Submit" styleClass="sbttn" />
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
		
	</tr>
</table>
<logic:notPresent name="arrObjectDetail" scope="session">
<html:hidden property="answer(Object::UserDetail::userName)" value="SysUser" />
<dmshtml:dms_static ruleName="role" property="ADMIN">
<html:hidden property="answer(Object::EntityAdditional::Status)" value="Pending" />
</dmshtml:dms_static>
<html:hidden property="page" value="2" /> 
</logic:notPresent>
<dmshtml:dms_static ruleName="role" property="ADMIN">
<html:hidden property="answer(Object::UserDetail::roleName)" value="GUEST" /> 
</dmshtml:dms_static>
<html:hidden property="answer(Object::Entity::Active)" value="Y" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
<bean:define id="agentStatus" name='AddAllEntities' property='answer(Object::EntityAdditional::Status)'/>
<%if(!(agentStatus.toString().equals("Approved"))&&!(agentStatus.toString().equals("Rejected"))){%>
<html:hidden property="formName" value="MicacareEntity::AddAppointment" />
<%}%>
<html:hidden property="answer(Object::Entity::EntityType)" value="AGENT" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::User)" value="SysUser" />
   <html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::User)" value="SysUser" />
   <html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::User)" value="SysUser" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
   </html:form>
		</logic:notPresent>
	
		</td>
	</tr>
</table>

		</td>
	</tr>
	

	
</table>


</body>
</html:html>
