<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="deleteUserName" name="AddUser" property="answer(Object::UserDetail::userName)"></bean:define>
<bean:define id="entityId" name="AddUser" property="answer(Object::Entity::EntityId)"/>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src = "/Scripts/JScripts/Common.js"></script>

<TABLE border="0">
	<TR>
		<TD class="Error">
			<%
			String status = request.getParameter("status");
			String userName="";
			if (status!= null && status.equalsIgnoreCase("failure"))
			{%>Update Failed!
			<ul>
				<%if(request.getAttribute("ERROR")!=null){%>
				<li><bean:write name="ERROR"/>
				</li>
			</ul>
			<%}}
			if(status!= null && status.equalsIgnoreCase("success")){%>
			Updated Successfully
			<%}%>
		</TD>
	</TR>
</TABLE>

<html:form action="/UpdateUWInformation" onsubmit = "return validateEditUWUser(this) ">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

	<tr><td>&nbsp;</td></tr>

	<tr><td class="MH">EDIT UNDERWRITER USER ACCOUNT</td></tr>

	<tr>
		<td class="TextMatter">Use this page to edit user accounts</td>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' connector='or' negated="true">
			<td class="links"align="left" colspan="2">
				<a href="../SearchActivityManagerAction4.do?TabPanelName=Quote_Panel&answer(Object::Activity::OwnerId)=<%=""+ownerId%>&answer(Object::Activity::PageNum)=0&answer(Object::Activity::ActivityType)=<%= "User Management" %>&answer(Object::Activity::ObjectType)=<%="User" %>">Activity Log </a>
			</td>
		</dmshtml:dms_static_with_connector>  </td>
	</tr>

	<tr><td><hr size="1" noshade></td></tr>

	<TR><TD class="Error"><html:errors/></TD></TR>
	
	<tr><td align="left"></td></tr>
	
	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td align="left">
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr>
					<td class="FormLabels" align="right" width="20%"><bean:message key="UserAccounts.UserType"/></td>
					<td class="TextMatter">&nbsp;<bean:write name="AddUser" property="answer(Object::UserDetail::roleName)"/></td>
					<html:hidden property="answer(Object::UserDetail::roleName)" name="AddUser" value='UNDERWRITER'/>
				</tr>

				<tr><td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.PersonalInformation"/></td></tr>

				<tr>
					<td class="FormLabels" align="right"><bean:message key="Appointment.FirstName"/>*</td>
					<td class="TextMatter">&nbsp;<html:text styleClass="txtbox" name="AddUser" property="answer(Object::Entity::FirstName)" styleId="firstName" size="30" maxlength="50"/></td>
				</tr>

				<tr>
					<td class="FormLabels" align="right"><bean:message key="Appointment.LastName"/>*</td>
					<td class="TextMatter">&nbsp;<html:text styleClass="txtbox" name="AddUser" property="answer(Object::Entity::LastName)" styleId="lastName"  size="30" maxlength="50"/></td>
				</tr>

				<tr>
						<td class="FormLabels" align="right">Name Code*</td>
						<td>&nbsp;<html:text styleClass="txtbox" name="AddUser" styleId="NameCode" property="answer(Object::Entity::EntityNum)" size="8" maxlength="8"/></td>
				</tr>
				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/>*</td>
					<td class="TextMatter">&nbsp;<html:text name="AddUser" styleId="email" styleClass="txtbox"  property="answer(Object::UserDetail::email)" size="30" maxlength="50" /></td>
				</tr>
				  <tr>
					<td class="FormLabels" align="right">License #</td>
					<td class="TextMatter">&nbsp;<html:text name="AddUser" styleId="licenseNumber" styleClass="txtbox"  property="answer(Object::EntityAdditional::LicenseNumber)" /></td>
				</tr>
				<tr>
                     <td class="FormLabels" align="right">Title</td>
	                 <td>&nbsp;<html:text styleClass="txtbox" name="AddUser" property="answer(Object::Entity::Title)" size="30" maxlength="50"/></td>      
	            </tr>
					
				<tr><td>&nbsp;</td></tr>	
				
				<tr>
					<td colspan="2" align="center" class="sectionhead">Branch Information</td>
				</tr>
				
				<tr><td>&nbsp;</td></tr>
				
				<tr>
					<td class="FormLabels" align="right">&nbsp;&nbsp;Branch Name</td>
					<td class="links" style="Class:txtbox">&nbsp;
						<html:select name="AddUser" property="answer(Object::Entity::BranchName)" styleClass="txtbox" styleId="DocType">
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
				<tr><td>&nbsp;</td></tr>				
				

				<tr>
					<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.UserAccount"/></td>
				</tr>

				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
					<td class="menulinks">&nbsp;<bean:write  name="AddUser" property="answer(Object::UserDetail::userName)"/>
						<html:hidden property="answer(Object::UserDetail::userName)" name="AddUser"/>
						<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId%>"/>
						
					</td>
				</tr> 

				<tr>
					<td class="FormLabels" align="right">New <bean:message key="UserAccounts.Password"/></td>
					<td class="menulinks">
						&nbsp;<input type="password" name="answer(newPassWord)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">&nbsp;<bean:message key="UserAccounts.pwvalidation"/>
					</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.ConfirmPassword"/></td>
					<td>
						&nbsp;<input type="password" name="answer(newPassWordConfirm)" maxlength="30" size="30" class="txtbox" autocomplete="off" value="">
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.Question"/></td>
					<td>&nbsp;<html:text name="AddUser" styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" size="30" maxlength="50"/></td>
				</tr>
				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.Answer"/></td>
					<td>&nbsp;<html:text name="AddUser" styleClass="txtbox"  property="answer(Object::UserDetail::hintAnswer)" size="30" maxlength="50"/></td>
				</tr>
				
				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserInitial"/></td>
					<td>&nbsp;<html:text name="AddUser" styleClass="txtbox"  property="answer(Object::UserDetail::UserInitial)" size="3" maxlength="3"/></td>
				</tr>
				
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ACTIVATE_DEACTIVATE_PRIVILEGE"}%>' 
					connector='or' negated="true">	
					<tr>
						<td class="FormLabels" align="right">Active&nbsp;</td>
						<td class="TextMatter">&nbsp;<html:select property="answer(Object::UserDetail::active)" >
						<html:option value ="Y">Yes</html:option>
						<html:option value ='D'>No</html:option>
						</html:select></td>
					</tr>
				</dmshtml:dms_static_with_connector>
				<tr>
					<td colspan="2"><hr size="1" width="90%" noshade></td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="Links">
					<html:submit value="Save" styleClass="sbttn" property="answer(submit)" />
					&nbsp;&nbsp;&nbsp;
					<html:reset value="Clear" styleClass="sbttn"/>
					&nbsp;&nbsp;&nbsp;
					<!-- <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_DELETE"}%>' connector='or' negated="true">	
						<html:button value="Delete" property="Delete" styleClass="sbttn" onclick="deleteUser()"/>
						&nbsp;&nbsp;&nbsp;
					</dmshtml:dms_static_with_connector>-->
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		<bean:define id="EU" name="AddUser" type="com.dms.web.data.DataForm"/>
			<% com.dms.ejb.data.QuestionHashMap map = EU.getAnswerMap();%>
			<%-- =map --%>
		</td>
	</tr>
</table>
<html:hidden property="EditType" value="new" />
<html:hidden property="answer(Object::EntityAdditional::Status)" value="Approved" /> 
 <html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="User"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="User Management"%>"/>
 <html:hidden property="answer(Object::Entity::EntityId)" value="<%=""+entityId%>"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTACHMENT"}%>' connector='or' negated="true">  
		<bean:define id="entityVerId" name="AddUser" property="answer(Object::Entity::EntityVerId)"/>

	<jsp:include page="../attachment/SignatureAttachment.jsp">
		<jsp:param name="answer(Object::Attachment::ObjectId)" value='<%=""+entityId%>' />
		<jsp:param name="answer(Object::Attachment::ObjectVerId)" value='<%=""+entityVerId%>' />
		<jsp:param name="answer(Object::AttachmentObjectLink::ObjectType)" value="ENTITY" />
	</jsp:include>
</dmshtml:dms_static_with_connector>

<script type="text/javascript">
<!--
function deleteUser(){
document.forms[0].action='../user/DeleteUser.jsp?&answer(Object::UserDetail::userName)=<%=deleteUserName%>';
document.forms[0].submit();
}
//-->

function validateEditUWUser(frm) {

	if (frm.firstName!=null && frm.firstName.value=="")
	{
		alert("First Name cannot be empty");
		frm.firstName.focus();
		return false;
	}
	if (frm.lastName!=null && frm.lastName.value=="")
	{
		alert("Last Name cannot be empty");
		frm.lastName.focus();
		return false;
	}
	if (frm.NameCode!=null && frm.NameCode.value=="")
	{
		alert("Name Code cannot be empty");
		frm.NameCode.focus();
		return false;
	}
	if (frm.email!=null && frm.email.value=="")
	{
		alert("E Mail cannot be empty");
		frm.email.focus();
		return false;
	}
	// checkMail function to check for the validity of email address is there in Common.js
	if (frm.email!=null && checkMail(frm.email.value))
	{
		alert("Please verify your email address.");
		frm.email.select();
		return false;
	}
}
</script>
