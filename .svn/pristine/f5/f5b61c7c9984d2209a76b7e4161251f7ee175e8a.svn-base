<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<!--<html:html>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">
<head>

<title><%=session.getAttribute("PageTitle")%> - Agents List</title>-->
<SCRIPT type="text/JavaScript">
function validate()
{
	if(document.forms[0].elements[2].value==""){
	alert("Please Select the General Agency");
	return false;
	}
	else{
	return true;
	}
}

</SCRIPT>
<!--  </head>
<body leftmargin="0" topmargin="0" rightmargin="0">-->
<html:form action="/LinkGAgent" onsubmit="return validate()">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
LINK AGENT AND GENERAL AGENCIES
</td></tr>
<tr><td class="TextMatter">
<bean:message key="AgentsList.GModDesc"/>
<br>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>

<tr><td>&nbsp;</td></tr>

<tr><td>
<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2">
<tr>
		<td class="Error" colspan="2"><bean:message key="LinkAgentToAgencies.AgentSelected" /><%=request.getParameter("agentId")%></td>
	</tr>

	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td class="FormLabels" align="right"><bean:message key="LinkAgentToAgencies.Agency" /></td>
		<td align="left">&nbsp;<dmshtml:get_general_agencies nameInSession="arListGAagencies"  parentAgencyId="-1" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/><html:select property="answer(Object::EntityObjectLink::AgencyId)" >
		<html:option value ="">Select A General Agency</html:option>
		<logic:present name="arListGAagencies" scope="session">
		<logic:iterate id="details" name="arListGAagencies" scope="session" >
		    <bean:define id='test' name="details"  property="answer(Object::Agency::AgencyId)" />
		    <html:option value ='<%=test.toString()%>'>
		       <bean:write name="details" property="answer(Object::Agency::BusinessName)" />
		    </html:option>
		</logic:iterate>
		</logic:present>
		</html:select>
		</td>
</tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
</table>
</td></tr>
	<tr>
	<td><hr size="1" noshade width="95%"></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr><td align="center">
		<html:submit value="Save" styleClass="sbttn" />
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Reset" styleClass="sbttn"/>
	</td></tr>
</table>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Entity::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Entity::EntityId)" value="<%=request.getParameter("entityId")%>" />
<html:hidden property="formName" value="MicaCare::LinkAgentToGeneralAgencies"/>
<html:hidden property="answer(form::ForwordControl)" value="success"/>
<html:hidden property="agentId" value="<%=request.getParameter("agentId")%>"/>
<html:hidden property="answer(emailId)" value="<%=request.getParameter("agentId")%>"/>
<dmshtml:get_entity nameInSession="entityDetail" entityId="<%=Long.parseLong((String)request.getParameter("entityId"))%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
<bean:define id="anEntityDetail" name="entityDetail"  type="com.dms.ejb.entity.DMSEntityDetail"/>
<bean:define id="fname" name="anEntityDetail" property="firstName"/>
<bean:define id="lname" name="anEntityDetail" property="lastName"/>
<html:hidden property="answer(fullName)" value='<%=fname.toString()+" "+lname.toString()%>'/>
<html:hidden property="answer(Object::UserDetail::userName)" value="<%=request.getParameter("agentId")%>" />
<html:hidden property="answer(Object::UserDetail::roleName)" value="GENERAL_AGENT"/>
<html:hidden  property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>
<!--</body>
</html:html>
-->
