<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<style>
	.field{float:left;width:700px;margin:6px 0 3px 10px;font-size:12px;text-align:left;font-weight:normal;}

	.field p,b
	{
	   margin:0;
	   padding:0;
	   text-align:left;
	   float:left;
	   font-family: Verdana, Arial, sans-serif; 
	   color: #000000;
	   font-size: 10pt; 
	   font-size:12px;
	}
	.field b{
	  padding:0 0 10px 21px;
	}
	
</style>
<link href="../styles/style.css" rel="stylesheet" type="text/css"/>
<html:form action="/ChangePasswordForUser3" name="ChangeUser" type ="com.dms.web.data.DataForm" scope="session" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ansmap" name="ChangeUser" property="answerMap" type="com.dms.ejb.data.QuestionHashMap"/>
<bean:define id="objectType" name="ChangeUser"  property="answer(Object::UserDetail::PrimaryObjectType)" />
	<p class="pagehead" style="margin:0;">Change My User Information</p>
	<p> Change your user information as needed by modifying the form below. When you have completed
	 your desired changes, click "Save" to save your changes.</p>
	
	<p class="field"><logic:iterate id="element" name="ansmap">
		<bean:define id="errorListkey" name="element" property="key" />
		<logic:equal name="errorListkey" value="Object::error::list">
			<bean:define id="errorListvalue" name="element" property="value" />
			<logic:iterate id="errmsg" name="errorListvalue">
				<ul>
					<li><bean:write name="errmsg" property="errorMessage" /></li>
				</ul>
			</logic:iterate>
		</logic:equal>
	</logic:iterate></p>

	<div class="field"><b><bean:message key="UserAccounts.UserName"/></b>
		<b style="float:right;width:272px;"><bean:write name="ChangeUser"  property="answer(Object::UserDetail::userName)" /></b>
	</div>
	<%if((""+objectType).equals("CUSTOMER")){ %>
	<div class="field"><b>Business Name</b>
		<html:text styleClass="txtbox"  property="answer(Object::Entity::FirstName)"  style="float:right;width:250px;" size="30" maxlength="50"/>
	</div>
	<%}else { %>
	<div class="field"><b><bean:message key="Appointment.FirstName"/></b>
		<html:text styleClass="txtbox"  property="answer(Object::Entity::FirstName)" style="float:right;width:250px;" size="30" maxlength="50"/>
	</div>	
	<div class="field"><b><bean:message key="Appointment.LastName"/></b>
		<html:text styleClass="txtbox"  property="answer(Object::Entity::LastName)"  style="float:right;width:250px;" size="30" maxlength="50"/>
	</div>

	<div class="field"><b><bean:message key="UserAccounts.MiddleName"/></b>
		<html:text styleClass="txtbox"  property="answer(Object::Entity::middleName)"  style="float:right;width:250px;" size="5" maxlength="5"/>
	</div>
	<%} %>
	
	<div class="field"><b><bean:message key="UserAccounts.EMail"/></b>
		<html:text styleClass="txtbox"  property="answer(Object::UserDetail::email)"  style="float:right;width:250px;" size="30" maxlength="50" />
	</div>		
	
	<p class="field"> To change your password, enter your old password, followed by your new password:
	<div class="field"><b><bean:message key="UserAccounts.OldPassword"/></b>
		<input type="password" name="answer(Object::UserDetail::passWord)" maxlength="13" size="13" class="txtbox" autocomplete="off" style="float:right;width:250px;" value="">
	</div>
	<div class="field"><b><bean:message key="UserAccounts.NewPassword"/></b>
	
		<input type="password" name="answer(Object::UserDetailAdditional::NewPassword)" maxlength="13" size="13" class="txtbox" autocomplete="off" style="float:right;width:250px;" value="">
	</div>  
	
	<div class="field"><b>Confirm New Password</b>
		<input type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="13" size="13" class="txtbox" autocomplete="off" style="float:right;width:250px;" value="">
	</div>
		
	<p class="field">To change your secret question, enter a question here that only you can answer. For example, "What was the name of your Sixth Grade teacher". Then enter the answer to that question. Should you ever forget your username and password, you will be asked to answer this secret question as proof of your identity: </p>
	<div class="field"><b>Security Question</b>
		<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" style="float:right;width:350px;" size="30" maxlength="50"/>
	</div>
	<div class="field"><b><bean:message key="UserAccounts.Answer"/></b>
		<html:text styleClass="txtbox"  property="answer(Object::UserDetail::hintAnswer)" style="float:right;width:350px;" size="30" maxlength="50"/>
	</div>
	<br><br>
	
	<p align="center"><html:reset style="margin-top:50px;"	value=" " onmouseover="style.cursor='hand'" styleClass="resetbutton" />
	<html:submit value=" " styleClass="submitbutton"
		onmouseover="style.cursor='hand'" property="amswer(button)" />
		
	</p>

<html:hidden property="page" value="8" />
		
<html:hidden property="formName" value="MicaCare::ChangePassWord"/>
	<html:hidden name="ChangeUser" property="answer(entityId)" value='<%=request.getParameter("entityId")%>'/>
<html:hidden name="ChangeUser" property="answer(forwardNavigate)" value="failure"/>
<html:hidden name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectId)" value='<%=request.getParameter("entityId")%>'/>
<html:hidden name="ChangeUser" property="answer(Object::UserDetail::PrimaryObjectType)" value='<%=request.getParameter("objectType")%>'/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<!--input type="hidden" name="entityId" value='<%=request.getParameter("entityId")%>'-->
</html:form>
