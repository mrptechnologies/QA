<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript"language="JavaScript" src = "/Scripts/JScripts/AddUser.js">
</script>
<script type="text/javascript" src = "/Scripts/JScripts/Common.js">
</script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddAgent.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></<td class="Error" COLSPAN="2"></SCRIPT>
<script type="text/javascript">

function submitSelectUserType()
	{
		var formElement=document.forms[0];		
		formElement.action="../SelectUserType.do?formName=form::SelectAddUserPage";
		formElement.submit();
		return true;
	}

</script>

<html:form action="/AddAllEntities" onsubmit="return validateAddUser(this)" styleId="frmAddUser">
<%String status="";%>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
	<tr><td class="NewSectionHead" colspan="4" align="center">ADD USER ACCOUNT</td></tr>
<tr><td>&nbsp;</td></tr>
	
	<tr><td class="TextMatter"><bean:message key="UserAccounts.AddNewUserModDesc"/></td></tr>
		<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<TR><TD class="Error">
	<html:errors/></TD></TR>
	<tr><td align="left">
	<tr>
<td class="Error" COLSPAN="2">
<%if (request.getParameter("status")!= null) {%>
<%if (request.getParameter("status").equals("success")) {%>
Updated
<%status="success";%>
<%}%>
<%if (request.getParameter("status").equals("failure")) {%>
Failed to Update!!  
<%} }%>
<!-- <ul>
<bean:define id="ansmap" name="AddUser" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
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
</logic:iterate> 
</ul>  -->
</td>
</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>

	<tr><td align="left">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td class="FormLabels" align="right" width="20%"><bean:message key="UserAccounts.UserType"/>*</td>
	<td>&nbsp;
	<dmshtml:dms_roles nameInSession="arrUserRolesAndDesc" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" ordinalValue="<%=(Long)session.getAttribute("ordinalValue")%>"/>	<html:select property="answer(Object::UserDetail::roleName)" styleId="roleName" onchange="return submitSelectUserType()">
		<html:option value ="">Select</html:option>

<logic:present name ='arrUserRolesAndDesc' scope ='session'>

<logic:iterate id="arrUserRolesAndDesc" name="arrUserRolesAndDesc" scope="session" >
<bean:define id='roleName' name="arrUserRolesAndDesc"  property="roleName" />
<html:option value ='<%=roleName.toString()%>'  >
		<bean:write name="arrUserRolesAndDesc" property="desc" />
		</html:option>
		</logic:iterate>
		</logic:present>
		</html:select>
</td>
	</tr>
		<tr>
		<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.PersonalInformation"/></td>
	
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.FirstName"/></td>
		<td class="TextMatter">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="30" maxlength="50"/>
		</td>	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.LastName"/>*</td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::LastName)" styleId="LastName" size="30" maxlength="50"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.MiddleName"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::middleName)" size="5" maxlength="5"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right">Name Code</td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::EntityNum)" size="8" maxlength="8"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/>*</td>
		<td>&nbsp;<html:text property="answer(Object::UserDetail::email)" size="30" styleId="email" maxlength="50" /></td>
	</tr>
	
	<!-- Business Address -->
				<tr>
					<td colspan="2" align="center" class="sectionhead">Address Information</td>						
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.Address"/>1
					</td>
					<td>	
						<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address1)" rows="2" cols="30"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Address 2
					</td>
					<td>
						<dmshtml:dms_textarea styleClass="txtarea"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Address2)" rows="2" cols="30"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.City"/>
					</td>
					<td>
						<dmshtml:dms_text styleClass="txtbox" styleId="City" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::City)" size="30" maxlength="30"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;State
					</td>
					<td>
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
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Country
					</td>
					<td class="TextMatter"><dmshtml:dms_radio property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" value="USA"  />USA&nbsp;&nbsp;&nbsp;<dmshtml:dms_radio property = "answer(Object::Entity::Addresses::BUSINESS::Object::Address::Country)" value="Canada" />
						Canada
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.Zip"/>
					</td>
					<td>
						<dmshtml:dms_text styleClass="txtbox" styleId="Zip"  property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::Zip)" size="10" maxlength="10"/>
						<!--Zipcode lookup start -->
						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddUser&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
<!-- 						<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddUser&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a> -->
					</td>
						<!--  end-->		
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;<bean:message key="Appointment.PhoneNo"/>
					</td>
					<td>
						<dmshtml:dms_text styleClass="txtbox" styleId="BusinessPhoneNum"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="40" maxlength="40"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">
						&nbsp;&nbsp;Fax
					</td>
					<td>
						<dmshtml:dms_text styleClass="txtbox" styleId="BusinessFaxNum"  property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::Fax)" size="40" maxlength="40"/>
					</td>
				</tr>
	
	
				<tr>
					<td colspan="2" align="center" class="sectionhead">BRANCH INFORMATION 						
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right">&nbsp;&nbsp;Branch Name</td>
					<td class="links" style="Class:txtbox">&nbsp;
					
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
				<tr>
					<td>&nbsp;</td>
				</tr>		
				 <tr>
					<td>&nbsp;</td>
				</tr>
	
	 
	<tr>
		<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.UserAccount"/></td>
	
	</tr>
	<%if (!status.equals("success")) {%>
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/>*</td>
		<td class="menulinks">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::userName)" styleId="userName" size="20" maxlength="40"/>&nbsp;<bean:message key="UserAccounts.namevalidation"/></td>
	</tr> 
	<%} else {%>

	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
		<td class="menulinks">&nbsp;<bean:write  name="AddUser" property="answer(Object::UserDetail::userName)"/></td>
	</tr> 

		<%}%>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Password"/>*</td>
		<td class="menulinks">
			&nbsp;<input id="passWord" type="password" name="answer(Object::UserDetail::passWord)" maxlength="30" size="30" class="txtbox" autocomplete="off">&nbsp;<bean:message key="UserAccounts.pwvalidation"/>
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmPassword"/>*</td>
		<td>
			&nbsp;<input id="passWordConfirm" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="30" size="30" class="txtbox" autocomplete="off">
		</td>
	</tr>
	
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Question"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" size="30" maxlength="50"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Answer"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintAnswer)" size="30" maxlength="50"/></td>
	</tr>
	
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserInitial"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::UserInitial)" size="3" maxlength="3"/></td>
	</tr>
	
	
	<tr><td colspan="2"><hr size="1" width="90%" noshade></td></tr>
	<tr>
		<td colspan="2" align="center" class="Links"><html:submit value="Save" styleClass="sbttn" />
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Clear" styleClass="sbttn"/>
		&nbsp;&nbsp;&nbsp;</td>
		
	</tr>
	<tr><td>&nbsp;</td></tr>

</table>

</table>
<html:hidden property="page" value="7" />
<html:hidden property="answer(Object::EntityAdditional::Status)" value="Approved" /> 
<html:hidden property="answer(Object::Agency::Active)" value="" styleId="County"/>
<html:hidden property="answer(Object::Agency::Active)" value="" styleId="HomeCounty"/>
<html:hidden property="formName" value="MicaCare::AddUserAccount"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

<html:hidden property="formName" value="MicaCare::AddUserAccount"/>
<html:hidden property="answer(isDuplicateAllowed)" value="NO"/>
<html:hidden property="answer(Object::EntityAdditional::Status)" value="Approved" /> 
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
<html:hidden property="page" value="<%=""+ownerId %>" /> 

<html:hidden property="answer(Object::Entity::OwnerId)" value="<%=""+ownerId %>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />
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
  <html:hidden property="answer(userAccount)" value="Y" />
  <html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=""+userId%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=""+userId%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="User"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="User Management"%>"/>
<html:hidden property="answer(status)" value="Y" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

</html:form>
