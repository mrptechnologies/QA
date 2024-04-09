<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<html:form action="/EditAgency" >

<% String AgencyId = "" + request.getParameter("agencyId"); %>

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="agentId"  name='AddAgency' property="answer(AgentId)"/>
<bean:define id="agencyCode"  name='AddAgency' property="answer(Object::Agency::AgencyCode)"/>

<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="1" CELLPADDING="1">
	<tr><td class="NewSectionHead" align="center">AGENCY INFORMATION </td></tr>
	<tr>
		<td valign="top" align="left" width="100%">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="#C6DEEA">
				<tr>
					<td align="left">
						<table WIDTH="90%" ALIGN="left" BORDER="0"  bgcolor="#C6DEEA">
							<tr>
								<td class="FormLabels" align="left">Agency/Broker Code</td>
								<td class="sectionhead1" align="left"><bean:write name='AddAgency' property="answer(Object::Agency::AgencyCode)"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">Agency/Broker Name</td>
								<td class="sectionhead1" align="left" ><bean:write name="AddAgency" property="answer(Object::Agency::BusinessName)"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">State License</td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::StateLicenseNumber)" name="AddAgency"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">License</td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::LicenseNumber)" name="AddAgency"/></td>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">Licensee Name</td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::LicenseeName)" name="AddAgency"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">Web Site</td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Url)" name="AddAgency"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">Status</td>
								<td class="sectionhead1" align="left"><bean:write name="AddAgency" property="answer(Object::Agency::Status)" /></td>
							</tr>
							
						</table>
					</td>
					
					<td align="left">
						<table WIDTH="100%" ALIGN="left" BORDER="0"  bgcolor="#C6DEEA">
							<tr>
								<td class="FormLabels" align="left">Address 1</td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)"  name="AddAgency"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left">Address 2</td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address2)"  name="AddAgency"/></td>
							</tr>
 							<tr>
								<td class="FormLabels" align="left"><bean:message key="GeneralAgency.city" /></td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" name="AddAgency"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left"><bean:message key="GeneralAgency.state" /></td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)" name="AddAgency"/></td>													
							</tr>
							<tr>
								<td class="FormLabels" align="left"><bean:message key="GeneralAgency.zip" /></td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" name="AddAgency"/>
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left"><bean:message key="GeneralAgency.country" /></td>
								<td class="sectionhead1" align="left"><bean:write property ="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)"  name="AddAgency" /></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left"><bean:message key="GeneralAgency.phone" /></td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::WorkPhone)" name="AddAgency"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left"><bean:message key="GeneralAgency.fax" /></td>
								<td class="sectionhead1" align="left"><bean:write property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Fax)" name="AddAgency"/></td>
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
 </html:form>
