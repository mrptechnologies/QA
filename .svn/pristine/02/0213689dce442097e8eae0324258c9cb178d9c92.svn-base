<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/AddAllEntities.do" >

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

	
<table WIDTH="98%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td class="MH">ADD USER ACCOUNT</td></tr>

	
	<tr><td class="TextMatter"><bean:message key="UserAccounts.ModDesc"/></td></tr>
		<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<TR><TD class="Error">
	<html:errors/></TD></TR>
	<tr><td align="left">
	<TR><TD class="Error">
	<%if(request.getAttribute("passwordInvalid")!=null){%>
	Password should be more than 6 alphanumeric characters.
	<%}%>
	<%if(request.getAttribute("passwordConfInvalid")!=null){%>
	Password and Confirm Password should be same.
	<%}%></TR>
	<tr><td align="left">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td class="FormLabels" align="right" width="40%"><bean:message key="UserAccounts.UserType"/></td>
	<td>&nbsp;
	<dmshtml:dms_roles nameInSession="arrUserRolesAndDesc" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" ordinalValue="<%=(Long)session.getAttribute("ordinalValue")%>"/>	<html:select property="answer(Object::UserDetail::roleName)" >
		<html:option value ="">Select</html:option>

<logic:present name ='arrUserRolesAndDesc' scope ='session'>

<logic:iterate id="arrUserRolesAndDesc" name="arrUserRolesAndDesc" scope="session" >
<bean:define id='roleName' name="arrUserRolesAndDesc"  property="roleName" />
<html:option value ='<%=roleName.toString()%>'>
		<bean:write name="arrUserRolesAndDesc" property="desc" />
		</html:option>
		</logic:iterate>
		</logic:present>
		</html:select>
</td>
	</tr>
		
	
		<tr>
		<td colspan="2" align="middle" class="sectionhead"><bean:message key="UserAccounts.PersonalInformation"/></td>
	
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.FirstName"/></td>
		<td class="TextMatter">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="30" maxlength="50"/>
		</td>	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="Appointment.LastName"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::LastName)" size="30" maxlength="50"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.MiddleName"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::middleName)" size="5" maxlength="5"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::email)" size="30" maxlength="50" /></td>
	</tr>
		
	 
	<tr>
		<td colspan="2" align="middle" class="sectionhead"><bean:message key="UserAccounts.UserAccount"/></td>
	
	</tr>
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/>*</td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::userName)" size="15" maxlength="15"/></td>
	</tr> 
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Password"/>*</td>
		<td>
			&nbsp;<input type="password" name="answer(Object::UserDetail::passWord)" maxlength="15" size="15" class="txtbox" autocomplete="off">
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmPassword"/>*</td>
		<td>
			&nbsp;<input type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="15" size="15" class="txtbox" autocomplete="off">
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
	
	
	<tr><td colspan="2"><hr size="1" width="90%" noshade></td></tr>
	<tr>
		<td colspan="2" align="middle" class="Links"><html:submit value="Save" styleClass="sbttn"/>
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Clear" styleClass="sbttn"/>
		&nbsp;&nbsp;&nbsp;</td>
		
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
</table>
<html:hidden property="page" value="7" />
<html:hidden property="formName" value="MicaCare::AddUserAccount"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>


