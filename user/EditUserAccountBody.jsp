<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="objectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/>

<bean:define id="deleteUserName" name="EditUser" property="answer(Object::UserDetail::userName)"></bean:define>
<TABLE border="0">
	<TR>
		<TD class="Error">
			<%
			String status = request.getParameter("status");
			String userName="";
			String agencyRole = "";
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
<html:form action="/UpdateUserAccount">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="MH">EDIT USER ACCOUNT</td>
	</tr>
	<tr>
		<td class="TextMatter">
			Use this page to edit user accounts<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true">
		
						<td class="links"align="left" colspan="2">
 		
	<a href="../SearchActivityManagerAction4.do?TabPanelName=Quote_Panel&answer(Object::Activity::OwnerId)=<%=""+ownerId%>&answer(Object::Activity::PageNum)=0&answer(Object::Activity::ActivityType)=<%= "User Management" %>&answer(Object::Activity::ObjectType)=<%="User" %>">Activity Log </a>

			</td>			
	</dmshtml:dms_static_with_connector>  </td>
	</tr>
	<tr>
		<td><hr size="1" noshade></td>
	</tr>
	<TR>
		<TD class="Error"><html:errors/></TD>
	</TR>
	<tr>
		<td align="left"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
<bean:define id="userDetail" name="USER_DETAIL" scope="session" type="com.dms.ejb.user.UserDetail"/>
<!-- bean:define id="entityDetail" name="ENTITY_DETAIL" scope="request" type="com.dms.ejb.entity.DMSEntityDetail"/ -->
<!-- % long entityId = userDetail.getPrimaryObjectId(); %> -->
<!-- bean:define id="entityDets" name="entityDetail" type="com.dms.ejb.entity.DMSEntityDetail"/  -->
<!--  bean:define id="roleID" name="userDetail" property="primaryRoleId"/ -->
<!-- bean:define id="roleName" name="userDetail" property="roleName"/-->
	<tr>
		<td align="left">
			<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr>
					<td class="FormLabels" align="right" width="20%"><bean:message key="UserAccounts.UserType"/></td>
					<td class="TextMatter">
						<bean:define id="roleMap" name="userDetail" property ="roles"/>
						<logic:iterate id="roleElement" name="roleMap">
							<bean:define id="role" name="roleElement" property="value" type="com.dms.ejb.user.Role"/>
							<bean:write name="role" property="desc"/><br/>			
							<bean:define id="rolenames" name="role" property="name"></bean:define>
							<%agencyRole =""+rolenames;%>
							<%--getRoleName = <bean:write name="role" property="roleName"/><br/>
							Name = <bean:write name="role" property="name"/><br/>
							Id = <bean:write name="role" property="id"/><br/>
							getType = <bean:write name="role" property="type"/><br/>
							getActive = <bean:write name="role" property="active"/><br/>
							getPrivileges = <bean:write name="role" property="privileges"/><br/>
							getOrdinalValue = <bean:write name="role" property="ordinalValue"/><br/>--%>
						</logic:iterate>
					</td>
				</tr>

				<logic:present name="AGENCY" scope="session">
				<bean:define id="agencyType" name="AGENCY" scope="session" type="java.lang.String"/>
					<tr>
						<td class="FormLabels" align="right" width="20%">
						<%
						if (agencyType.equalsIgnoreCase("General"))
						{%>
							<bean:message key="GeneralAgencies.Name"/>
						<%
						}
						else
						{%>
							<bean:message key="Agencies.Agencyname"/>
						<%}%>
						</td>
						<td  class="TextMatter">
							<bean:write name="EditUser" property="answer(Object::Agency::BusinessName)"/>
						</td>
					</tr>
				</logic:present>

				<tr>
					<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.PersonalInformation"/></td>
				</tr>
				
				
				<%if((""+agencyRole).equals("AGENCY_ADMIN")){%>
				
				<tr>
					<td class="FormLabels" align="right"><bean:message key="Appointment.FirstName"/></td>
					<td class="TextMatter">
						<%=deleteUserName%></td>
				</tr>

				<tr>
					<td class="FormLabels" align="right"><bean:message key="Appointment.LastName"/></td>
					<td class="TextMatter"></td>
				</tr>

				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.MiddleName"/></td>
					<td class="TextMatter">&nbsp;<bean:write name="EditUser" property="answer(Object::Entity::middleName)"/></td>
				</tr>
				<%}else{%>
				<tr>
					<td class="FormLabels" align="right"><bean:message key="Appointment.FirstName"/></td>
					<td class="TextMatter">&nbsp;<bean:write name="EditUser" property="answer(Object::Entity::FirstName)"/>
					</td>
				</tr>

				<tr>
					<td class="FormLabels" align="right"><bean:message key="Appointment.LastName"/></td>
					<td class="TextMatter">&nbsp;<bean:write name="EditUser" property="answer(Object::Entity::LastName)"/></td>
				</tr>

				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.MiddleName"/></td>
					<td class="TextMatter">&nbsp;<bean:write name="EditUser" property="answer(Object::Entity::middleName)"/></td>
				</tr>
				<%}%>
				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.EMail"/></td>
					<td class="TextMatter">&nbsp;<html:text name="EditUser" styleClass="txtbox"  property="answer(Object::UserDetail::email)" size="30" maxlength="50" />
                                  </td></tr>
                                 <tr>

                    <td class="FormLabels" align="right">Title</td>
	                <td>&nbsp;<bean:write name="EditUser" property="answer(Object::Entity::Title)"/>
	                         </td>
	                         </tr>
				  <tr>
					<td colspan="2" align="center" class="sectionhead"><bean:message key="UserAccounts.UserAccount"/></td>
				</tr>

				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserName"/></td>
					<td class="menulinks">&nbsp;<bean:write  name="EditUser" property="answer(Object::UserDetail::userName)"/></td>
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
					<td>&nbsp;<html:text name="EditUser" styleClass="txtbox"  property="answer(Object::UserDetail::hintQuestion)" size="30" maxlength="50"/></td>
				</tr>
				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.Answer"/></td>
					<td>&nbsp;<html:text name="EditUser" styleClass="txtbox"  property="answer(Object::UserDetail::hintAnswer)" size="30" maxlength="50"/></td>
				</tr>
				
				<tr>
					<td class="FormLabels" align="right"><bean:message key="UserAccounts.UserInitial"/></td>
					<td>&nbsp;<html:text name="EditUser" styleClass="txtbox"  property="answer(Object::UserDetail::UserInitial)" size="3" maxlength="3"/></td>
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
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_DELETE"}%>' connector='or' negated="true">	
						<html:button value="Delete" property="Delete" styleClass="sbttn" onclick="deleteUser()"/>
						&nbsp;&nbsp;&nbsp;
					</dmshtml:dms_static_with_connector>
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
		<bean:define id="EU" name="EditUser" type="com.dms.web.data.DataForm"/>
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
 
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
<script type="text/javascript">
<!--
function deleteUser(){
document.forms[0].action='../user/DeleteUser.jsp?&answer(Object::UserDetail::userName)=<%=deleteUserName%>';
document.forms[0].submit();
}
//-->
</script>

