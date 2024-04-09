<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/ChangePasswordForGAgencyAdmin" name="ChangeUser" type ="com.dms.web.data.DataForm" scope="session" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

	
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td class="MH">CHANGE PASSWORD</td></tr>

	
	<tr><td class="TextMatter"><bean:message key="UserAccounts.ModDesc1"/></td></tr>
		<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<TR><TD class="Error">
	<html:errors/></TD></TR>
	<tr>
	<td class="Error" COLSPAN="2">
	<ul>
		<bean:define id="ansmap" name="ChangeUser" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
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
		</logic:iterate> </ul>
	</td>
	</tr>

	<tr><td align="left">
	<tr><td align="left">

<table WIDTH="550px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
	
	 
	<tr>
		<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.UserAccount"/></td>
	
	</tr>
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="ChangeUser"  property="answer(Object::UserDetail::userName)" /></td>
	</tr> 
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.OldPassword"/>*</td>
		<td>
			&nbsp;<input type="password" name="answer(Object::UserDetail::passWord)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.NewPassword"/>*</td>
		<td>
			&nbsp;<input type="password" name="answer(Object::UserDetailAdditional::NewPassword)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmNewPassword"/>*</td>
		<td>
			&nbsp;<input type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
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
		<td colspan="2" align="center" class="Links"><html:submit value="Save" styleClass="sbttn"/>
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Clear" styleClass="sbttn"/>
		&nbsp;&nbsp;&nbsp;</td>
		
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

</table>
<html:hidden property="page" value="8" />
		
<html:hidden property="formName" value="MicaCare::ChangePassWord"/>
	
<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="<%=request.getParameter("primaryObjectId")%>"/>
<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="<%=request.getParameter("primaryObjectType")%>"/>

	<html:hidden name="ChangeUser" property="answer(entityId)" value='<%=request.getParameter("primaryObjectId")%>'/>
<html:hidden name="ChangeUser" property="answer(forwardNavigate)" value="failure"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
