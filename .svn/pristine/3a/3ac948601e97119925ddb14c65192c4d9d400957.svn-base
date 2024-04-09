<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/ChangePasswordForUser" name="ChangeUser" type ="com.dms.web.data.DataForm" scope="session" onsubmit="return ValidationFields();">
<div class="SubjectivityPage1">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

	
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td class="formhead"><h2 class="left">CHANGE PASSWORD</h2></td></tr>

	
	<tr><td class="details"><bean:message key="UserAccounts.ModDesc1"/></td></tr>
		<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<TR><TD class="Error"><ul>
	<html:errors/></ul></TD></TR>
	<tr>
			<td class="Error" COLSPAN="2">
			 
<bean:define id="ansmap" name="ChangeUser" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
		<logic:iterate id="element" name="ansmap">
			<bean:define id="errorListkey" name="element" property="key" />
			<logic:equal name="errorListkey" value="Object::error::list">
			<bean:define id="errorListvalue" name="element" property="value" />
			<logic:iterate id="errmsg" name="errorListvalue">
			<ul><li>
			<bean:write name="errmsg" property="errorMessage" />
			</li></ul>
		</logic:iterate>
	</logic:equal>
</logic:iterate> 
</td>
			</tr>

<tr><td align="left">
<bean:define id="objectType" name="ChangeUser"  property="answer(Object::UserDetail::PrimaryObjectType)" />
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
	<tr>
		<td colspan="2" align="center" ><h3 class="left">User Information</h3></td>
	
	</tr>
	<tr>
		<td>
			&nbsp;
		</td>
	</tr>
	<%if((""+objectType).equals("CUSTOMER")){ %>
	<tr>
		<td class="FormLabels" align="right" width="20%">Business Name</td>
		<td class="TextMatter">&nbsp;<html:text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" size="30" maxlength="50"/>
		</td>	</tr>
	<tr>
	
	<%}else { %>
	<tr>
	<td class="FormLabels" align="right">Primary Role</td>
	
		<td>&nbsp;<bean:write  property="answer(Object::UserDetail::roleName)" name="ChangeUser" /></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right" width="20%"><bean:message key="Appointment.FirstName"/></td>
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
	<%} %>
	<tr><td>&nbsp;</td></tr>	 
	<tr>
		<td colspan="2" align="center"><h3 class="left">User EmailId</h3></td>
	
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::email)" size="30" maxlength="50" /></td>
	</tr>
		
		<tr><td>&nbsp;</td></tr>	 
	<tr>
		<td colspan="2" align="center"><h3 class="left">User Security Information</h3></td>
	
	</tr>
	<tr><td>&nbsp;</td></tr>
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="ChangeUser"  property="answer(Object::UserDetail::userName)" /></td>
	</tr> 
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.OldPassword"/>*</td>
		<td>
			&nbsp;<input id="oldPassword" type="password" name="answer(Object::UserDetail::passWord)" maxlength="13" size="13" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.NewPassword"/>*</td>
		<td class="menulinks">
			&nbsp;<input id="newPassword" type="password" name="answer(Object::UserDetailAdditional::NewPassword)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">&nbsp;<bean:message key="UserAccounts.pwvalidation"/>
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmNewPassword"/>*</td>
		<td>
			&nbsp;<input id="confirmPassword" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Question"/></td>
		<td>&nbsp;<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" size="30" maxlength="50" styleId="hintQuestion"/></td>
	</tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.Answer"/></td>
		<td>
			&nbsp;;<input id="hintAnswer" type="password" name="answer(Object::UserDetail::hintAnswer)" maxlength="50" size="30" class="txtbox" autocomplete="off" >
		</td>
	</tr>
	
	
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td></td>
		<td  align="left" class="Links"><html:submit value="Save" styleClass="covbutton"/>
		</td>
		
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>

</table>
<html:hidden property="page" value="8" />
		
<html:hidden property="formName" value="MicaCare::ChangePassWord"/>
	<html:hidden name="ChangeUser" property="answer(entityId)" value='<%=request.getParameter("entityId")%>'/>
<html:hidden name="ChangeUser" property="answer(forwardNavigate)" value="failure"/>
<html:hidden name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectId)" value='<%=request.getParameter("entityId")%>'/>
<html:hidden name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectType)" value='<%=request.getParameter("objectType")%>'/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<!--input type="hidden" name="entityId" value='<%=request.getParameter("entityId")%>'-->
</div>
</html:form>

<Script type="text/javascript">
function ValidationFields(){
	var oldPassword = document.getElementById("oldPassword").value;
	var newPassword = document.getElementById("newPassword").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var hintQuestion = document.getElementById("hintQuestion").value;
	var hintAnswer = document.getElementById("hintAnswer").value;
	
	if(oldPassword != "" && newPassword != ""){
		if(newPassword.length > 6){
			if(oldPassword == newPassword){
				alert("New Password must not be the same as previous Password");
				return false;
			}
			if(newPassword != confirmPassword){
				alert("Password and Confirm password should be same.");
				return false;
			}
		}else{
			alert("The Password should be at least 6 alphanumeric characters");
			return false;
		}	
	}else{
		alert("1. Old Password is required. \n2. New Password is required. \n3. Confirm Password is required.");
		return false;
	}	
	
	if(hintQuestion != ""){
		if(hintAnswer == ""){
			alert("Please Enter the Answer for the given Question.");
			document.getElementById("hintAnswer").style.background='#FFCC33';
			document.getElementById("hintAnswer").focus();
			return false;
		}
	}
	if(hintAnswer != ""){
		if(hintQuestion == ""){
			alert("Please Enter the Question for the given Answer.");
			document.getElementById("hintQuestion").style.background='#FFCC33';
			document.getElementById("hintQuestion").focus();
			return false;
		}
	}
}

</Script>