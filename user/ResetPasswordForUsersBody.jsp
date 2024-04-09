<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<script type="text/javascript">
<!--
function validateFields(){
	var formElement=document.forms[0];
	if(formElement.elements[2].value=="")
	{
		alert("Please enter the new Password.");
		return false;
	}

	if(formElement.elements[3].value=="")
	{
		alert("Please Confirm Password.");
		return false;
	}
	if(formElement.elements[2].value!=formElement.elements[3].value)
	{
		alert("Password and Confirm Password should be same");
		return false;
	}


	else
	{
		return true;
	} 

}
//-->
</script>


<html:form action="/UpdateUserAction" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>


	
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td class="NewSectionHead" align="center">RESET PASSWORD</td></tr>
	<tr>
		<td>&nbsp;</td>
	</tr>

	
	<tr><td class="TextMatter"><bean:message key="ResetPassword.ModDesc1"/></td></tr>
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
	<%if(request.getAttribute("message1")!=null){%>
	<bean:message key="UserAccounts.pwconfirmation"/>
	<%}%>
	<tr><td align="left">

<table WIDTH="550px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	
	<tr>
		<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.UserAccount"/></td>
	
	</tr>
	 <tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
		<td class="TextMatter">&nbsp;<bean:write name="ResetPassword"  property="answer(Object::UserDetail::userName)" /></td>
	</tr> 
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.NewPassword"/>*</td>
		<td>
			&nbsp;<input type="password" name="answer(Object::UserDetail::passWord)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>  
	<tr>
		<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmNewPassword"/>*</td>
		<td>
			&nbsp;<input type="password" name="answer(Object::UserDetailAdditional::passWordConfirm)" maxlength="15" size="15" class="txtbox" autocomplete="off" value="">
		</td>
	</tr>
	
	
	<tr><td colspan="2"><hr size="1" width="90%" noshade></td></tr>
	<tr>
		<td colspan="2" align="center" class="Links">
		<html:submit value="Submit" styleClass="sbttn" onclick="return validateFields()"/>
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Clear" styleClass="sbttn"/>
		&nbsp;&nbsp;&nbsp;</td>
		
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>





</table>
<html:hidden property="page" value="8" />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
		



</html:form>
