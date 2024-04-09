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
<%@page  import="com.dms.common.ObjectDescriptor" %>

<bean:define id="dbname" property="answer(dbname)" name="LoginPage" scope="session"/>
<bean:parameter id="agentId" name="answer(Object::Entity::EntityId)" />
<bean:parameter id="agentName" name="answer(Object::Entity::FirstName)" />
<bean:parameter id="ownerId" name="answer(Object::UserDetail::ownerId)" />
<bean:parameter id="AgencyId" name="answer(Agency::AgencyId)" />

<html:form action="/AddLicences">
<logic:present name="AddLicence" scope="session">
<%
if (request.getParameter("status")!= null) {
	if (request.getParameter("status").equals("EDIT")) {
	} 
	else {
	session.removeAttribute("AddLicence");
	session.setAttribute("AddLicence", new com.dms.web.data.DataForm());
	}

 }
 else {
	session.removeAttribute("AddLicence");
	session.setAttribute("AddLicence", new com.dms.web.data.DataForm());
 }

%>
</logic:present>
<html:hidden property="formName" value="form::ADDLICENCE" />
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="NewSectionHead" align="center">ADD LICENSE/APPOINTED STATE</td></tr>
<tr><td>&nbsp;</td></tr>
<TR><TD class="Error">
	<html:errors/></TD></TR>

<tr><td>
<table width="90%" border="0" CELLSPACING="0" CELLPADDING="0">
<tr><td class="TextMatter" align="left">Use This Page to Add License/Appointed State</td><td class="FormLabels" align="right">Agent Name :&nbsp;<a href="../EditAgent.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<%=agentId.toString()%>"><%=agentName.toString()%></a>
</td>
</tr>
</table>
</td></tr>


		<tr><td><hr size="1" noshade ></td></tr>
<tr>
<td valign="top">
<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
<TR><TD>&nbsp;</TD></TR>
<tr>

<td class="FormLabels" align="center" height="25" width="15%" >Appointed State</td>
<td class="FormLabels" align="center" height="25" width="10%" >Appointed<br> Eff Date</td>
<td  class="FormLabels" align="center" height="25" width="10%">Appointed<br> Exp.Date</td>
<td class="FormLabels" align="center" height="25" width="15%" >License Type</td>
<!-- <td class="SearchResult" align="center" ><FONT SIZE="1" COLOR="">License State</FONT></td> -->
<td class="FormLabels" align="center" height="25" width="10%">License<br> Number</td>
<td class="FormLabels" align="center" height="25" width="10%" >License<br> Eff. Date</td>
<td class="FormLabels" align="center" height="25" width="10%" >License<br> Exp. Date</td>
<td class="FormLabels" align="center" height="25" width="20%" >Notes</td>

</tr>

<tr>

	<td><dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%= Long.parseLong(ownerId.toString()) %>" dbname="<%= dbname.toString() %>"/>
		<html:select property="answer(Object::Risk::ResProperty::State)" styleId="comboGender">
		<html:option value ="">Select</html:option>
	       <logic:present name="arStates" scope="request">
	       	<logic:iterate id="details" name="arStates" scope="request" >
		    <bean:define id='test' name="details"  property="typeDesc" />
		    <html:option value ='<%=test.toString()%>'>
		       <bean:write name="details" property="dmsType" />
		    </html:option>
		</logic:iterate>
		</logic:present>
		</html:select>								
	</td>
	

<td class="links" align="center"><dmshtml:dms_text   property ="answer(Object::Licence::LicenceAppointmentEffDate)"  name="AddLicence" size="10" maxlength="10" styleClass="txtbox"/></td>

<td class="links" align="center"><dmshtml:dms_text   property ="answer(Object::Licence::LicenceAppointmentExpDate)"  name="AddLicence" size="10" maxlength="10" styleClass="txtbox"/></td>
<td class="links" styleClass="txtbox" align="center">&nbsp;<html:select property="answer(Object::Licence::LicenceType)" name="AddLicence" styleClass="txtbox" >
		<html:option value ="" styleClass="txtbox">Type</html:option>
		    <html:option value ='HO'>Home Owners</html:option>
			<html:option value ='Auto'>Auto</html:option>
		</html:select>
</td>
<td class="links" align="center"><dmshtml:dms_text   property ="answer(Object::Licence::LicenceNum)" name="AddLicence" size="10" maxlength="10" styleClass="txtbox" /></td>
<td class="links" align="center"><dmshtml:dms_text   property ="answer(Object::Licence::LicenceEffDate)" name="AddLicence" size="10" maxlength="10" styleClass="txtbox" /></td>

<td class="links" align="center"><dmshtml:dms_text   property ="answer(Object::Licence::LicenceExpDate)" name="AddLicence" size="10" maxlength="10" styleClass="txtbox"/></td>

<td class="links" align="center"><dmshtml:dms_textarea   property ="answer(Object::Licence::Notes)" name="AddLicence" rows="3" cols="20" 
styleClass="txtarea"/></td>

</TR>


<TR><TD>&nbsp;</TD></TR>
<TR>
	<TD colspan="7">&nbsp;</TD>
	<TD align="right">
			<html:submit value="Add License" styleClass="sbttn"  property="answer(submit)" />&nbsp;&nbsp;
	</td></tr>

</table>
</td></tr>
</TABLE>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<input type="hidden" name="objectType" value="ENTITY"/>
<input type="hidden" name="objectTypeName" value="AGENT"/>
<html:hidden property="answer(Agent::AgentId)" value="<%=agentId.toString()%>" />
<html:hidden property="answer(Agency::AgencyId)" value="<%=AgencyId.toString()%>" />
<html:hidden property="answer(Object::Entity::EntityId)" value="<%=agentId.toString()%>" />
<html:hidden property="answer(1*Licence::Equals::SearchObjectId)" value="<%=agentId.toString()%>"  />
<html:hidden property="answer(1*Licence::Equals::SearchObjectType)" value="ENTITY" />
<html:hidden property="answer(1*Licence::Equals::SearchObjectTypeName)" value="AGENT" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Licence::OwnerId)" value="<%=ownerId.toString()%>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Licence::CreatedBy)" value="<%=userName.toString()%>" />
<html:hidden property="page" value="1" />

<html:hidden property="answer(Object::Entity::FirstName)" value="<%=agentName.toString()%>" />

<%
String lId="0";
if (request.getParameter("licenceId")!= null)  {
	lId=request.getParameter("licenceId").toString(); 
}
%>
<html:hidden property="answer(Object::Licence::Id)" value="<%=lId.toString()%>" />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>
	
	
	<html:form action="/AddLicences" >
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		
	
		<logic:present name="licenceSize" scope="session">
			<bean:define id="licenceSize1" name="licenceSize" scope="session"/>
			<tr><td class="FormLabels">No of License Found:&nbsp;<%=licenceSize1.toString()%></td></tr>
		</logic:present>


<tr>
			<td>&nbsp;</td>
		</tr>

<logic:present name ='searchResultLicenceDisply' scope ='session'>
<tr><td>
	<table WIDTH="100%" ALIGN="Left" cellspacing=0 cellpadding="2">

	<tr>
		<td align="Left" class="links" colspan="1">
		
		<logic:present name="minimumValueLicence"  scope="session" >
		<a href="../NavigateLicenceSearchResultAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&all=yes&flag=de&index=<bean:write name='minRangeLicence' scope='session'/>&answer(Object::Entity::EntityId)=<%=agentId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Entity::FirstName)=<%=agentName.toString()%>&answer(Agency::AgencyId)=<%=AgencyId.toString()%>">
		&lt;&lt;Previous</a>
		</logic:present>
		</td>

		<td align="right" class="links" colspan="6">
		<logic:present name="maxRangeLicence"  scope="session" >
		<a href="../NavigateLicenceSearchResultAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&all=yes&flag=incre&index=<bean:write name='maxRangeLicence' scope='session'/>&answer(Object::Entity::EntityId)=<%=agentId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Entity::FirstName)=<%=agentName.toString()%>&answer(Agency::AgencyId)=<%=AgencyId.toString()%>">
		Next&gt;&gt;</a>
		</logic:present>
		</td>
	</tr>
		
		<tr >
		<td class="sectionhead" width="4%">
		Si No
		</td>
		<td class="sectionhead" width="10%">
		Appointed State
		</td>
		<td class="sectionhead" width="10%">
		Appointed Eff Date
		</td>
		<td class="sectionhead" width="12%">
		 Appointed Exp Date
		 </td>
		<td class="sectionhead" width="10%">
		License Type
		</td>
		<!-- <td class="sectionhead" width="10%">
		License State
		</td> -->
		<td class="sectionhead" width="10%">
		License Number
		</td>
		<td class="sectionhead" width="10%">
		License Eff. Date
		</td>
		<td class="sectionhead" width="10%">
		License Exp. Date
		</td>
		<td class="sectionhead" width="10%">
		Notes
		</td>
		
	  </tr>

<% int i=1;%>
<logic:present name="minimumValueLicence"  scope="session" >
<bean:define id="slno" name='minRangeLicence' scope='session'/>
<%
try{
    i=Integer.parseInt(slno.toString());
	if(i!=1){
		i++;
	}
  }catch(NumberFormatException nfe)
  {
	  i=1;
  }

%>
</logic:present>	

	<logic:iterate id="searchResultLicence" name="searchResultLicenceDisply" scope="session" >
	<tr>
	   <td class="SearchResult">
	  <a href="../EditLicence.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&licenceId=<bean:write name='searchResultLicence' property='answer(Object::Licence::Id)' />&answer(Object::Entity::EntityId)=<%=agentId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Entity::FirstName)=<%=agentName.toString()%>&answer(Agency::AgencyId)=<%=AgencyId.toString()%>" >
		<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="">&nbsp;<%=i%> </a><% i++; %>
	   </td>
		<td class="SearchResult" >
		<a href="../EditLicence.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&licenceId=<bean:write name='searchResultLicence' property='answer(Object::Licence::Id)' />&answer(Object::Entity::EntityId)=<%=agentId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Entity::FirstName)=<%=agentName.toString()%>&answer(Agency::AgencyId)=<%=AgencyId.toString()%>" >
		 <bean:write name="searchResultLicence" property="answer(Object::Licence::LicenceScope)" />
		 </a>
		 &nbsp;
		</td>
		<td class="SearchResult" >
			 <bean:write name="searchResultLicence" property="answer(Object::Licence::LicenceAppointmentEffDate)" />
		
		 &nbsp;	
		</td>
		

		<td class="SearchResult" >
			 <bean:write name="searchResultLicence" property="answer(Object::Licence::LicenceAppointmentExpDate)" />
		
		 &nbsp;	
		</td>
		<td class="SearchResult" >
			 <bean:write name="searchResultLicence" property="answer(Object::Licence::LicenceType)" />
		
		 &nbsp;	
		</td>
		
		<td class="SearchResult" >
			 <bean:write name="searchResultLicence" property="answer(Object::Licence::LicenceNum)" />
		
		 &nbsp;	
		</td>
		<td class="SearchResult" >
			 <bean:write name="searchResultLicence" property="answer(Object::Licence::LicenceEffDate)" />
		
		 &nbsp;	
		</td>
		<td class="SearchResult" >
			 <bean:write name="searchResultLicence" property="answer(Object::Licence::LicenceExpDate)" />
		
		 &nbsp;	
		</td>

		<td class="SearchResult" >
			 <bean:write name="searchResultLicence" property="answer(Object::Licence::Notes)" />
		 &nbsp;	
		</td>

		<!-- <td class="SearchResult" >
			 <bean:write name="searchResultLicence" property="answer(Object::Licence::LicenceScope)" />
		
		 &nbsp;	
		</td> -->
		

	
		
	</logic:iterate>
	

			<tr><td colspan="2" >&nbsp;</td></tr>
<tr>
		<td align="left" class="links" colspan="1">
		
		<logic:present name="minimumValue"  scope="session" >

		<a href="../NavigateLicenceSearchResultAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=de&index=<bean:write name='minRangeLicence' scope='session'/>&answer(Object::Entity::EntityId)=<%=agentId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Entity::FirstName)=<%=agentName.toString()%>&answer(Agency::AgencyId)=<%=AgencyId.toString()%>">
		
		&lt;&lt; <bean:message key="Common.Previous"/></a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="6">
		<logic:present name="maxRangeLicence"  scope="session" >
		<a href="../NavigateLicenceSearchResultAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=incre&index=<bean:write name='maxRangeLicence' scope='session'/>&answer(Object::Entity::EntityId)=<%=agentId.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Entity::FirstName)=<%=agentName.toString()%>&answer(Agency::AgencyId)=<%=AgencyId.toString()%>">
		
		Next&gt;&gt;</a>
		</logic:present>
		</td>
	</tr>
 	
</table>
</td></tr>
</logic:present>

</table>



<html:hidden property="answer(Object::Entity::EntityId)" value="<%=agentId.toString()%>"  />
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>"  />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>
