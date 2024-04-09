
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/DependentDeleteAction">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:parameter id="custid" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
<bean:parameter id="ownerId" name="answer(Object::UserDetail::ownerId)" />
<bean:parameter id="EmployeeIdofDependent" name="answer(Object::Dependent::EmployeeId)" />
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td >&nbsp;</td></tr>
<tr><td class="MH">DELETE CONFIRMATION - DEPENDENT</td></tr>
<tr><td><hr size="1" noshade ></td></tr>

<tr>
<td valign="top">
	<table WIDTH="550px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td  align="left" class="TextMatter">Do you wish to delete the selected Dependent?</td>
	</tr>
	<tr><td >&nbsp;</td></tr>

	<tr>
	  <td align="center">
			<html:submit value="Yes" styleClass="sbttn"/>&nbsp;&nbsp;
			<html:reset value="Cancel" onclick="javascript:history.go(-1);" styleClass="sbttn"/>
	 </td>
	</tr>
</table>

		</td>
	</tr>

</table>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="answer(entityType)" value="DEPENDENT" />
<html:hidden property="answer(objectType)" value="ENTITY" />
<html:hidden property="answer(1*Entity::Equals::SearchObjectType)" value="EMPLOYEE" />
<bean:define id="EmployeeId" property="answer(Object::Entity::EntityId)" name="AddEntity" scope="session"/>

<html:hidden property="answer(1*Entity::Equals::SearchObjectId)" value="<%=EmployeeId.toString()%>" />
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=custid.toString()%>" />
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Dependent::EmployeeId)" value="<%=EmployeeIdofDependent.toString()%>" />
<%if(request.getParameter("answer(Object::Employee::Name)")!=null) { %>
	<bean:parameter id="empName" name="answer(Object::Employee::Name)"/>
	<html:hidden property="answer(Object::Employee::Name)" value="<%=empName %>"/>
<%} else { %>
	<html:hidden property="answer(Object::Employee::Name)"/>
<%} %>
<html:hidden property="entityType" value="DEPENDENT" />
<html:hidden property="objectType" value="ENTITY" />
<html:hidden property="SearchObjectType" value="EMPLOYEE" />
<html:hidden property="SearchObjectId" value="<%=EmployeeIdofDependent.toString()%>" />
<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID" />
<html:hidden property="LimitSearch" value="yes" />
<html:hidden property="answer(Object::Entity::PageNum)" value="0" />
<input type="hidden" name="QuickDelete" value="yes"/>
</html:form>


