
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript">
<!--
function validateDelete(frm)
{


	for(var i=0; frm.elements[i]!=null; i++)
	{
		var flag = false;
		if(frm.elements[i].type=="checkbox" && frm.elements[i].checked==true) {
			flag = true;
			break;
		}
	}
	
	if(!flag) {
		alert("Please select dependent(s) to delete");
		return false;
	}
	return true;
}
// -->
</script>




<html:form action="/DeleteDependentConfirmAction" onsubmit="return validateDelete(this);">

<table WIDTH="95%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<bean:parameter id="custid" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
<bean:parameter id="ownerId" name="answer(Object::UserDetail::ownerId)" />
<bean:parameter id="EmployeeIdofDependent" name="answer(Object::Dependent::EmployeeId)" />


<tr><td><jsp:include page="../common/CustomerAgencyEmployeeLinkspage.jsp" /></td></tr>



<tr><td height="5"></td></tr>
				<tr>
					<td class="NewSectionHead" align="center">DEPENDENT CENSUS</td>
				</tr>
				<tr><td height="5"></td></tr>



<tr><td>&nbsp;</td></tr>
<tr><td colspan="4"class="TextMatter" >To edit a dependent record click on the edit button</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td class="links">

<logic:present name ='AddCustomer' scope ='session'>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../GetCustomerAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&customerId=<%=custid.toString()%>" title="Click to go to Customer Summary Page" />Summary</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</logic:present>
</td></tr>

<tr><td colspan="4">&nbsp;</td></tr>
<tr>
<td valign="top">
<table WIDTH="95%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="0">

<tr>
<td colspan="6">
	<logic:notPresent name ='countSearchResult' scope ='session'>
		<span class="Error">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Currently no dependent are listed</span>

	</logic:notPresent>
</td></tr>


<logic:present name ='searchresultnewDisplay' scope ='request'>
<tr><td height="6px" colspan="6" >&nbsp;</td></tr>



<tr >
		<td class="sectionhead"  width="5%">Edit</td>
		<td class="sectionhead"  width="2%">No.</td>
		<td class="sectionhead" width="23%">First Name</td>
		<td class="sectionhead" width="8%">Middle Name</td>
		<td class="sectionhead" width="22%">Last Name</td>
		<td class="sectionhead" width="10%" >Gender</td>
		<td class="sectionhead" width="15%" >DOB</td>
		<td class="sectionhead" width="12%">Relationship</td>
		<td class="sectionhead" width="3%">Select</td>
</tr>
<% int i=0;%>



<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >
<tr>
	<td class="SearchResult">
	<a href="../EditDependent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&newDependent=no&dependentId=<bean:write name='searchresultnewDisplay' property='answer(Object::Dependent::DependentId)' />&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::employeeId)=<%=EmployeeIdofDependent.toString()%>&answer(Object::Employee::Name)=<bean:write name="AddDependent" property="answer(Object::Employee::Name)"/>"/><IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" border="0"ALT=""></a>

	</td>

	<td class="SearchResult">
	<a href="../EditDependent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&newDependent=no&dependentId=<bean:write name='searchresultnewDisplay' property='answer(Object::Dependent::DependentId)' />&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::employeeId)=<%=EmployeeIdofDependent.toString()%>&answer(Object::Employee::Name)=<bean:write name="AddDependent" property="answer(Object::Employee::Name)"/>"><%=++i%></a>
	
	</td>
		
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Dependent::fname)" />
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Dependent::mname)" />
	&nbsp;
	</td>
		
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Dependent::lname)" />
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Dependent::gender)" />
	&nbsp;
	</td>

	<td class="SearchResult" >
	 <bean:write name="searchresultnewDisplay" property="answer(Object::Dependent::dob)" />
	 &nbsp;
	</td>


	<td class="SearchResult">	
	<bean:define id="relationShip" name="searchresultnewDisplay" property="answer(Object::Dependent::relationShip)"/>
	 <dmshtml:dms_compare_string_tag first="<%=relationShip.toString()%>" second="Sp"     ruleName="areStringsSame" negated="true"> <%="Spouse"%>
	</dmshtml:dms_compare_string_tag>

	 <dmshtml:dms_compare_string_tag first="<%=relationShip.toString()%>" second="Ch"     ruleName="areStringsSame" negated="true"> <%="Child"%>
	</dmshtml:dms_compare_string_tag>

	</td>
	<td class="SearchResult">
		<bean:define id='test' name="searchresultnewDisplay"  property="answer(Object::Dependent::DependentId)" />
		<dmshtml:dms_multibox property="answer(Object::Dependent::DependentId)" 
		value = "<%=test.toString() %>" >
		</dmshtml:dms_multibox> 
	</td>

	</tr>		
		</logic:iterate>
		<% i=0;%>

<tr><td colspan="6" >&nbsp;</td></tr>
</logic:present>
<tr><td colspan="6" >&nbsp;</td></tr>
<!--/logic:present-->	

<logic:present name ='searchresultnewDisplay' scope ='request'>
	<tr><td colspan="6" align="right">
		<html:submit value="Delete" styleClass="sbttn"/>
	</td></tr>
</logic:present>		

</table>
</td>
</tr>

<tr><td>
<TABLE>

<TR>
	<TD class="links">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../AddEmployeeDependent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&clear=yes&newDependent=yes&answer(System::flag::requiredMultiSubmissionCheck)=no&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::employeeId)=<%=EmployeeIdofDependent.toString()%>&answer(Object::Employee::Name)=<bean:write name="AddDependent" property="answer(Object::Employee::Name)"/>" title="Click to go to Add Dependents page" />Add Dependents</a></TD>
</TR>
</TABLE>
</td>
</tr>

<tr><td align="center"></td></tr>
<tr><td>	
		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
		<html:hidden property="answer(entityType)" value="DEPENDENT" />
		<html:hidden property="answer(objectType)" value="ENTITY" />
		<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=custid.toString()%>" />
		<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" />
		<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
		<html:hidden property="answer(Object::Dependent::EmployeeId)" value="<%=EmployeeIdofDependent.toString()%>" />
		
		<html:hidden property="entityType" value="DEPENDENT" />
		<html:hidden property="objectType" value="ENTITY" />
		<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID" />
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</td></tr>



</table>

</html:form>
