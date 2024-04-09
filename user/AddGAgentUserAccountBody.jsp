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
	formElement.action="../GenralAgentForUser.do?formName=''";
    formElement.submit();
	return true;
  }
  //-->
	</script>

<%String LinkedGAgentId="";%>
<%String status="";%>
<html:form action="/AddGeneralAgentUser"  onsubmit="return validateAddUser(this)" styleId="frmAddUser">
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
	<td>&nbsp;
	<html:select property="answer(Object::UserDetail::roleName)" disabled="true" styleClass="txtbox" styleId="roleName">
	<html:option value ='GENERAL_AGENT'  >General Agency Agent</html:option>
	</html:select>
</td>
	</tr>
	<bean:define id="GAgentId" name="AddUser" property="answer(Agent::GAgentId)" scope="session"/>

<%if(GAgentId!=null && !GAgentId.toString().equals("") &&(!GAgentId.toString().equals("-1"))) { %>
<%LinkedGAgentId=GAgentId.toString();%>
<dmshtml:get_entity nameInSession="agentDetail" entityId="<%=Long.parseLong(GAgentId.toString())%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
<logic:present name="agentDetail" scope="session">
<bean:define id="anEntityDetail" name="agentDetail"  type="com.dms.ejb.entity.DMSEntityDetail"/>
<bean:define id="fname" name="anEntityDetail" property="firstName"/>
<bean:define id="lname" name="anEntityDetail" property="lastName"/>
<tr>
<td class="FormLabels" align="right">General Agent Name*</td>
<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(AgentName)" value="<%=lname.toString()+" "+ fname.toString()%>" size="40" maxlength="40" styleId="gAgentName"/></td>
<td align="right" colspan="3" ><html:submit value="Find General Agent" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return GoTOFindButton()"/></td>
</logic:present>
						</tr>
							<%} else {%>
				<tr>
				<td class="FormLabels" align="right">Agent Name*</td>
				<td>&nbsp;<dmshtml:dms_text styleClass="txtbox"  property="answer(AgentName)" size="40" maxlength="40" disabled="true" styleId="agentName" /></td>
				
					<td align="right" colspan="3" ><html:button value="Find General Agent" property="answer(Find)" styleClass="buttonblue2" onmouseover="this.style.color='#fbe249';" onmouseout="this.style.color='#FFF';" onclick="return GoTOFindButton()"/></td>
				</tr>
				<%}%>
		<tr>
		<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.PersonalInformation"/></td>
	
	</tr>
	
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/>*</td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::email)" size="30" maxlength="50" styleId="email"/></td>
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
		<td class="menulinks">&nbsp;<bean:write  name="AddUser" property="answer(Object::UserDetail::userName)" /></td>
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
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />

<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="page" value="8" />
<html:hidden property="answer(Object::EntityAdditional::Status)" value="Approved" /> 
<html:hidden property="formName" value="MicaCare::AddUserAccount"/>
<%if(! LinkedGAgentId.toString().equals("")) {%>
<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="<%=LinkedGAgentId.toString()%>"  />
<%} %>
<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="ENTITY"  />
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>"  />
<html:hidden property="answer(Object::UserDetail::roleName)" value="GENERAL_AGENT"  />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
