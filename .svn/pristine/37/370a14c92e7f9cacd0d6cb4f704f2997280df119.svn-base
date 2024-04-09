<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript" src = "/Scripts/JScripts/AddUser.js">
</script>
<script type="text/javascript" src = "/Scripts/JScripts/Common.js">
</script>
<script type="text/javascript">
<!--

function submitSelectUserType()
	{
		var formElement=document.forms[0];		
		formElement.action="../SelectUserType.do?formName=form::SelectAddUserPage";
		formElement.submit();
		return true;
	}
function GoTOFindButton(){
    var formElement=document.forms[0];
	formElement.action="../RetailAgencyEmployeeForUser.do?formName=''";
    formElement.submit();
	return true;
  }
	//-->
	</script>
<%String LinkedAgencyId="";%>
<%String agencyName=""; %>
<%String status="";%>
<html:form action="/AddRetailAgencyEmployeeUser"  onsubmit="return validateAddUser(this)" styleId="frmAddUser">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>	
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">ADD USER ACCOUNT</td></tr>

	
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
</logic:iterate> </ul> -->
</td>
</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>

	<tr><td align="left">

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td class="FormLabels" align="right" width="20%"><bean:message key="UserAccounts.UserType"/>*</td>
	<td>Agency Employee</td>
	</tr>
	<bean:define id="AgencyId" name="AddUser" property="answer(Object::AGENCY::AGENCYID)" scope="session"/>
	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_LINKED_AGENCY_NAME"}%>' connector='or' negated="true">
		<%String ObjectID=(String)session.getAttribute("PRIMARY_OBJECT_ID");
		 if(ObjectID!=null && !ObjectID.toString().equals("") &&(!ObjectID.toString().equals("-1"))) { 
		 LinkedAgencyId=ObjectID.toString();%>
		 <dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+ObjectID%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
		<logic:present name="agencyDetail2" scope="request">
			<bean:define id="agdetail2" name="agencyDetail2" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		 <% agencyName=agdetail2.getString("agencyname");%>
	<tr>
		<td class="FormLabels" align="right">Agency Name*</td>
		<td><%=agencyName%></td>
		</logic:present>
	</tr>
	<%}%>
	</dmshtml:dms_static_with_connector>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_FIND_AGENCY_OPTION"}%>' connector='or' negated="true">
	<%if(AgencyId!=null && !AgencyId.toString().equals("") &&(!AgencyId.toString().equals("-1"))) { %>
	<%LinkedAgencyId=AgencyId.toString();%>
	<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+LinkedAgencyId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
		<logic:present name="agencyDetail2" scope="request">
			<bean:define id="agdetail2" name="agencyDetail2" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
				<% agencyName=agdetail2.getString("agencyname");%>
	<tr>
		<td class="FormLabels" align="right">Agency Name*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(AgencyName)" value="<%=""+agencyName%>" size="40" maxlength="40"/></td>
		<td align="right" colspan="3" ><html:button value="Find Agency" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return GoTOFindButton()"/></td>
	</logic:present>
	</tr>
	<%}else {%>
	<tr>
		<td class="FormLabels" align="right">Agecy Name*</td>
		<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(AgencyName)" size="40" maxlength="40" disabled="true" styleId="agentName"/></td>
				
		<td align="right" colspan="3" ><html:button value="Find Agency" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return GoTOFindButton()"/></td>
	</tr>
	<%}%>
	</dmshtml:dms_static_with_connector>
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
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/>*</td>
		<td>&nbsp;<html:text property="answer(Object::UserDetail::email)" size="30" styleId="email" maxlength="50" /></td>
	</tr>

	 
	<tr>
		<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.UserAccount"/></td>
	
	</tr>
	 <%if (!status.equals("success")) {%>
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/>*</td>
		<td class="menulinks">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::userName)" size="20" maxlength="40" styleId="userName"/>&nbsp;<bean:message key="UserAccounts.namevalidation"/></td>
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
			&nbsp;<input id="passWord" type="password" name="answer(Object::UserDetail::passWord)" maxlength="40" size="12" class="txtbox" autocomplete="off">&nbsp;<bean:message key="UserAccounts.pwvalidation"/>
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmPassword"/>*</td>
		<td>
			&nbsp;<input id="passWordConfirm" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="40" size="12" class="txtbox" autocomplete="off">
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
<html:hidden property="formName" value="MicaCare::AddUserAccount"/>


<%if(! LinkedAgencyId.toString().equals("")) {%>
<html:hidden property="answer(Object::User::Entity::ObjectId)" value="<%=LinkedAgencyId.toString()%>"  />
<%} %>

<html:hidden property="answer(AgencyName)" value="<%=""+agencyName%>" />
<html:hidden property="answer(Object::User::Entity::ObjectType)" value="AGENCY"  />
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>"  />
<html:hidden property="answer(Object::UserDetail::roleName)" value="AGENCY_EMPLOYEE"  />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>



