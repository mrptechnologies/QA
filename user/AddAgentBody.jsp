<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddAgent.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></<td class="Error" COLSPAN="2"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<html:form action="/AddAgent" onsubmit="return validateForm(this);">
<div class="SubjectivityPage1">									
<div class="content">		
<%String agencyId="";%>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<%if (request.getParameter("agencyIdtoLink")!= null) {
agencyId=request.getParameter("agencyIdtoLink");
}%>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	
	<tr>
		<td class="Subjectivityformhead" colspan="5"><h2 class="left">
			ADD AGENT </h2>
		</td>
	</tr>
	<tr>				
		<td colspan="5">&nbsp;</td>
	</tr>
	<tr>
			<td class="TextMatter" colspan="5">
				Use This Page to Add Agents
			</td>
	</tr>
	
	<TR>
		<TD class="Error" colspan="5">
			<ul>
			<html:errors/>
		</ul>
		</TD></TR>
		<tr>
		<td class="Error" colspan="5">
			<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
			<bean:define id="ansmap" name="AddAgent" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
			<logic:iterate id="element" name="ansmap">
				<bean:define id="errorListkey" name="element" property="key" />
				<logic:equal name="errorListkey" value="Object::error::list">
					<bean:define id="errorListvalue" name="element" property="value" />
					<logic:iterate id="errmsg" name="errorListvalue">
						<ul>
							<li>
								<bean:write name="errmsg" property="errorMessage" />
							</li>
						</ul>
					</logic:iterate>
				</logic:equal>
			</logic:iterate> 
		</td>
	</tr>
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
	 
	<tr>
	<td align="left">
	<table WIDTH="80%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	
	<tr>
					<td colspan="5" align="left"><h3>
						AGENT INFORMATION</h3>
					</td>
				</tr>
				
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.AgencyName"/>*&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					
					<bean:define id="agencyIdTemp" name="AddAgent" property="answer(Agency::AgencyId)"/>
					<%if(agencyIdTemp!=null &&!agencyIdTemp.toString().equals("")) {
					agencyId=agencyIdTemp.toString();
					}%>
					<%if(agencyId!=null &&!agencyId.toString().equals("")) {%>
					<dmshtml:get_agency_detail nameInSession="agencyDetail2" agencyId="<%=agencyId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" 
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					<%}%>
					<td width="27%" align="left">
						<logic:present name="agencyDetail2" scope="request">
							<bean:define id="agdetail2" name="agencyDetail2" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
							<bean:define id="businessname" name="agdetail2" property="businessName"/>
							<bean:define id="id" name="agdetail2" property="id"/>
							<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Agency::BusinessName)" value="<%=businessname.toString()%>" size="40" maxlength="40" styleId="AgencyName"/>
						</logic:present>
						<logic:notPresent name="agencyDetail2" scope="request">
							<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Agency::BusinessName)" size="40" maxlength="40"  disabled="true" styleId="AgencyNameDisplay" />
							<html:hidden property="answer(Object::Agency::BusinessName)" styleId="AgencyName"/>
						</logic:notPresent>
                    </td>
                    
					<td colspan="3">
						<a href="../AgencyForAgentSearchPage1.do?LimitSearch=yes&FormName=AddAgent&answer(Object::Agency::PageNum)=0&clear=yes&answer(Agency::NotEquals::ParentAgencyId)=1" title="Search for Agency" onClick="return AgencyPopup(this, 'AgencyFind');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency."></a>
					</td>
				 </tr>
				 
				 <tr>
					<td width="35%" colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" align="left"><h3>
						PERSONAL INFORMATION </h3>
					</td>
				</tr>
				
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.AgentNumber"/>*&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox"   styleId="AgentNum" property="answer(Object::Entity::EntityNum)" size="10" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.FirstName"/>*&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="40" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.MiddleInitial"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::middleName)" size="10" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.LastName"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::LastName)" size="40" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						Title&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<html:text styleClass="txtbox"  property="answer(Object::Entity::Title)" size="40" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Gender"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="4">
						<dmshtml:dms_radio property = "answer(Object::Entity::Sex)" value="Male" />
						<bean:message key="Appointment.Male"/>&nbsp;
						<dmshtml:dms_radio property = "answer(Object::Entity::Sex)" value="Female" />
						<bean:message key="Appointment.Female"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						ID&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td width="35%" class="TextMatter" align="left" colspan="4">
						<dmshtml:dms_radio property = "answer(Object::Entity::GovtIdType)" value="Ssn" />SSN &nbsp;&nbsp;&nbsp;&nbsp;
						<dmshtml:dms_radio property = "answer(Object::Entity::GovtIdType)" value="Tax" />TAX ID&nbsp;
						&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::GovtIdNum)" size="17" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.AreYouAUSCitizen"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="4">
						<dmshtml:dms_radio property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" value="Yes" />
						<bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<dmshtml:dms_radio property = "answer(Object::EntityAdditional::AreYouAUSCitizen)" value="No" />
						<bean:message key="Common.No"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.DateOfBirth"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="links" colspan="4">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::Entity::Dob)" size="11" maxlength="11"/>&nbsp;(MM/DD/YYYY)
					</td>
				</tr>
				<tr>
					<td colspan="5">
						&nbsp;
					</td>
				</tr>
				<!-- Business Address -->
				<tr>
					<td colspan="5" align="left"><h3>
						BUSINESS ADDRESS</h3>
					</td>
				</tr>
				
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Address"/>1&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">	
						<dmshtml:dms_textarea styleClass="txtarea" styleId="Address1_1"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)" rows="2" cols="30"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						Address 2&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_textarea styleClass="txtarea" styleId="Address2_1"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address2)" rows="2" cols="30"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.City"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="City" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30"/>
					</td>
				</tr>
				<tr>
					<td  align="right" class="field" width="35%">
						State&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
						<html:select property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::State)" styleClass="txtbox" styleId="State">
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
					<td class="TextMatter" colspan="4"><dmshtml:dms_radio property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" value="USA" styleId="BusinessCountryUS"  />USA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" styleId="BusinessCountryCA" value="Canada" />
						Canada
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Zip"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="Zip"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)" size="10" maxlength="10"/>
						<!--Zipcode lookup start -->
						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddAgent&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
					</td>
						<!--  end-->		
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.PhoneNo"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="BusinessPhoneNum"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="40" maxlength="40" onkeypress="FormatPhone (event,BusinessPhoneNum);"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						Fax&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="BusinessFaxNum"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::Fax)" size="40" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.EMailAddress"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="BusinessEmail"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" size="40" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
			
				<!-- Home Address -->
			
				<tr>
					<td colspan="5" align="left"><h3>
						HOME ADDRESS</h3>
					</td>
				</tr>
				
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.HomeAddressSame"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::HomeAddressSame)" styleId="HomeAddressSame" value="Yes" onclick="setHomeAddress();"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Address"/>1&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">	
						<dmshtml:dms_textarea styleClass="txtarea" styleId="Address1_2"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Address1)" rows="2" cols="30"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Address"/>2&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="4">
					    <dmshtml:dms_textarea styleClass="txtarea" styleId="Address2_2" property="answer(Object::Entity::Addresses::HOME::Object::Address::Address2)" rows="2" cols="30"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.City"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomeCity" property="answer(Object::Entity::Addresses::HOME::Object::Address::City)" size="30" maxlength="30"/>
					</td>
				<tr>
					<td align="right" class="field" width="35%">
						State&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
						<html:select property="answer(Object::Entity::Addresses::HOME::Object::Address::State)" styleClass="txtbox" styleId="HomeState">
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
					<td class="TextMatter" colspan="4">
						<dmshtml:dms_radio property = "answer(Object::Entity::Addresses::HOME::Object::Address::Country)" value="USA" styleId="homeCountryUS"  />USA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Addresses::HOME::Object::Address::Country)" value="Canada" styleId="homeCountryCA"/>Canada
					</td> 
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Zip"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomeZip"  property="answer(Object::Entity::Addresses::HOME::Object::Address::Zip)" size="10" maxlength="10"/>
						<!--Zipcode lookup start 05-06-2006-->
						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddAgent&HomeFlag=Home&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
					</td>
					<!-- 05-06-2006 end-->	
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.PhoneNo" />&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomePhoneNum"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::HomePhone)" size="40" maxlength="40" onkeypress="FormatPhone (event,HomePhoneNum);" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						Fax&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomeFaxNum"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::Fax)" size="40" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.EMailAddress"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox" styleId="HomeEmail"  property="answer(Object::Entity::Contacts::HOME::Object::Contact::EMailAddress)" size="40" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" align="left"><h3>
						PROFESSIONAL DESIGNATIONS OR MEMBERSHIPS </h3>
					</td>
				</tr>
				
				<tr>
					<td width="45%" align="right">
					<bean:message key="Appointment.CLU"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4"> 
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CLU)" value="Yes" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.CPCU"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CPCU)" value="Yes" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.MDRT"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::MDRT)" value="Yes" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.NQA"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::NQA)" value="Yes" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.NASD"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::NASD)" value="Yes" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Others"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Others)" size="30" maxlength="30"/>
					</td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" align="left"><h3>
						LICENSE</h3>
					</td>
				</tr>
				
				<tr>
					<td class="Formlabels" align="right" width="35%">
						<bean:message key="Appointment.Lineofinsurance"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Life"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::Life)" value="Yes" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.AccidentOrHealth" />&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::AccidentOrHealth)" value="Yes" />
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Others"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Others1)" size="30" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Selectthestates"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="4"><!--31--> 
						<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates1)" value="Illinois"/>&nbsp;Illinois&nbsp;
						<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates2)" value="Indiana"/>&nbsp;Indiana	&nbsp;
						<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates3)" value="Iowa"/>&nbsp;Iowa	&nbsp;
						<dmshtml:dms_checkbox property="answer(Object::EntityAdditional::Selectthestates4)" value="Wisconsin"/>&nbsp;Wisconsin	
					</td>
				</tr> 
				<tr>
					<td width="44%" align="right">
						<bean:message key="Appointment.Inthestates"/>
					</td>
					<td colspan="4">
					    <dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Inthestates)" rows="5" cols="40"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Doyouhavenonresidentlicenses"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="4">
						<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" value="Yes" /><bean:message key="Common.Yes"/>
						&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doyouhavenonresidentlicenses)" value="No" /><bean:message key="Common.No"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Ifsolistthestates"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Ifsolistthestates)" rows="5" cols="40"/>
					</td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" align="left"><h3>
						OTHER DETAILS</h3>
					</td>
				</tr>
				
				<tr>
					<td colspan="5">
						&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="Appointment.Ifyouareassigning"/>
					</td>	
				</tr>
			<!--tr>
					<td width="45%" align="right"><bean:message key="Appointment.AgencyAvailableName"/></td>
					
					<td>&nbsp;<html:select property="answer(Object::Agency::ParentAgencyId)" >
					<html:option value ="-1">Select Your Agency</html:option>
					</html:select>
				</td></tr-->
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.AgencyName"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td colspan="4">
						<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::AgencyName)" size="30" maxlength="30"/>
					</td>
				</tr>				
				<!--tr>
					<td width="45%" align="right"><bean:message key="Appointment.FederalTaxID"/></td>
					<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::FederalTaxID1)" size="30" maxlength="30"/></td>
				</tr>		
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Address"/></td>
					<td>&nbsp;<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::Address)" rows="3" cols="30"/>
			
				</textarea></td>
				</tr>
					<tr>
					<td width="45%" align="right"><bean:message key="Appointment.City"/></td>
					<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::City)" size="30" maxlength="30"/></td>
				</tr>
					<tr>
					<td class="FormLabels" align="left"><bean:message key="Appointment.State"/></td>
					<td class="Links">&nbsp; 
					<html:select property="answer(Object::EntityAdditional::State)" >
					<html:option value ="">Select</html:option>
			        <logic:present name="arStates" scope="session">
			           <logic:iterate id="details" name="arStates" scope="session" >
					    <bean:define id='test' name="details"  property="typeDesc" />
					    <html:option value ='<%=test.toString()%>'>
					    <bean:write name="details" property="dmsType" />
					    </html:option>
					</logic:iterate>
					</logic:present>
					</html:select></td>
			
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Zip"/></td>
					<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::Zip)" size="15" maxlength="15"/></td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.PhoneNo"/></td>
					<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::PhoneNo)" size="15" maxlength="15"/></td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.EMailAddress"/></td>
					<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(Object::EntityAdditional::EMailAddress)" size="30" maxlength="30"/></td>
				</tr-->
		
				<tr>
					<td width="45%" align="right">
						<bean:message key="Appointment.Status"/>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td class="TextMatter" colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::OwnerOrPartner)" value="Yes" /><bean:message key="Appointment.OwnerOrPartner"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="4">
						<dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::CorporateOfficier)" value="Yes" /><bean:message key="Appointment.CorporateOfficier"/>
					</td>
				</tr>
				<tr>
					<td width="45%" align="right">&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="4"><dmshtml:dms_checkbox property = "answer(Object::EntityAdditional::Representative)" value="Yes" /><bean:message key="Appointment.Representative"/></td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.DoyoucarryErrors"/><br>
					<bean:message key="Appointment.MicaRequires"/>&nbsp;&nbsp;&nbsp;&nbsp;</td><!--43-->
					<td class="TextMatter" colspan="4"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::DoyoucarryErrors)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::DoyoucarryErrors)" value="No" /><bean:message key="Common.No"/></td>
				</tr>	
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Haveyoueverhadanapplication"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="4"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadanapplication)" value="No" /><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Haveyoueverhadhaveaninsurancesuspended"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="4"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Haveyoueverhadhaveaninsurancesuspended)" value="No" /><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="45%" align="right"><bean:message key="Appointment.Havechargedorconvicted"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="4"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Havechargedorconvicted)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Havechargedorconvicted)" value="No" /><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td width="45%" align="right">&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="Appointment.Arethereanyoutstandingjudgments"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="4"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Arethereanyoutstandingjudgments)" value="No" /><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td width="45%" align="right">
					<bean:message key="Appointment.Doesaninsurerinsured"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="TextMatter" colspan="4"><dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doesaninsurerinsured)" value="Yes" /><bean:message key="Common.Yes"/>&nbsp;&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::EntityAdditional::Doesaninsurerinsured)" value="No" /><bean:message key="Common.No"/></td>
				</tr>
				<tr>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" class="Formlabels">&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="Appointment.PleasenotethatYes"/></td>
					
				</tr>
				<tr>
					<td colspan="5" align="center"><dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::EntityAdditional::PleasenotethatYes)" rows="3" cols="80"/></td>
					
				</tr>
				
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">				
					<tr><td colspan="5">&nbsp;</td></tr>
	
	
	
	
					<tr>
						<td colspan="5" align="left"><h3>BRANCH INFORMATION</h3></td>
					</tr>
					
					<tr>
						<td  align="right" width="45%">Branch Name&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td class="links" style="Class:txtbox" colspan="4">&nbsp;
						
							<html:select property="answer(Object::Entity::BranchName)" styleClass="txtbox" styleId="DocType">
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
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5" align="left"><h3>USER ACCOUNT</h3></td>
				</tr>
				
				 <tr>
					<td align="right" width="45%"><bean:message key="UserAccounts.UserName"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="menulinks" colspan="4"><html:text styleClass="txtbox"  property="answer(Object::UserDetail::userName)" size="20" maxlength="40"/>&nbsp;At least 6 characters</td>
				</tr> 
				<tr>
					<td align="right" width="45%"><bean:message key="UserAccounts.Password"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="menulinks" colspan="4">
						<input type="password" name="answer(Object::UserDetail::passWord)" maxlength="15" size="15" class="txtbox" autocomplete="off">&nbsp;At least 6 alphanumeric characters
					</td>
				</tr>  
				<tr>
					<td align="right" width="45%"><bean:message key="UserAccounts.ConfirmPassword"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="4">
						<input type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="15" size="15" class="txtbox" autocomplete="off">
					</td>
				</tr>
				<tr><td colspan="5">&nbsp;</td></tr>
				<tr>
					<td align="right" width="45%"><bean:message key="UserAccounts.Question"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="4"><html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" size="30" maxlength="50"/></td>
				</tr>
				<tr>
					<td  align="right" width="45%"><bean:message key="UserAccounts.Answer"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td colspan="4"><html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintAnswer)" size="30" maxlength="50"/></td>
				</tr>			
				<tr><td colspan="5">&nbsp;</td></tr>
				<tr>
					<td width="45%" align="right" class="Links"><html:submit value="Save" styleClass="covbutton" onclick="return validateFields()" />
					</td>
					<td colspan="4" align="left" class="Links">
					<html:reset value="Clear" styleClass="covbutton"/>
					</td>
				</tr>
				 
				 
				 
				 
				 
				 
				 
				 <tr>
					<td colspan="5">
						&nbsp;
					</td>
        		</tr>
               </table>
               </td>
               </tr>
               </table>
<html:hidden property="formName" value="MicaCare::AddUserAccount"/>
<html:hidden property="answer(isDuplicateAllowed)" value="NO"/>
<html:hidden property="answer(Object::EntityAdditional::Status)" value="Approved" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
<html:hidden property="page" value="<%=""+ownerId %>" /> 
<html:hidden property="answer(Object::UserDetail::roleName)" value="AGENT" />
<html:hidden property="answer(Object::Entity::EntityType)" value="AGENT" />

<html:hidden property="answer(Object::Entity::OwnerId)" value="<%=""+ownerId %>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />

<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Entity::User)" value="<%=userName.toString()%>" />

<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::User)" value="SysUser" />


<!-- Code to Prevent the back Button Issue-->

<bean:define id="AgentId" name="AddAgent" property="answer(Object::Entity::EntityId)"/> 
<!-- Passing Agent Id -->
<%if(AgentId==null) {%>
<html:hidden property="answer(Object::Entity::EntityId)" value="-1"  />
<%} else if(! AgentId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::EntityId)" value="<%=AgentId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::EntityId)" value="-1"  />
<%}%>


<!-- Passing Agency Id -->
<bean:define id="AgencyId" name="AddAgent" property="answer(Agency::AgencyId)"/> 
<%if((AgencyId==null)&& agencyId.equals("")) {%>
<html:hidden property="answer(Agency::AgencyId)" value="-1" styleId="AgencyIdFromPopup"/>

<%} else if(! AgencyId.toString().equals("")) {%>
<html:hidden property="answer(Agency::AgencyId)" value="<%=AgencyId.toString()%>" styleId="AgencyIdFromPopup"/>
<%} %>

<%if(! agencyId.equals("")) {%>
<html:hidden property="answer(Agency::AgencyId)" value="<%=agencyId%>" styleId="AgencyIdFromPopup" />
<%} else if(AgencyId.toString().equals("")){%>
<html:hidden property="answer(Agency::AgencyId)" value="-1" styleId="AgencyIdFromPopup" />
<%}%>



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
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Agent"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Agent Management"%>"/>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</div>
</div>
</html:form>
