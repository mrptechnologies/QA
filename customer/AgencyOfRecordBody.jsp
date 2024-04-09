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

<!-- DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" -->
<!-- html:html -->
<!-- head -->
<!-- html:base/ --> 
<!-- link href="../styles/Styles.css" rel="stylesheet" type="text/css" -->
<!-- /head -->
<!-- title --> <!-- %=session.getAttribute("PageTitle")% --> <!-- Find Agency --> <!-- /title -->
<!-- body -->
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form action="/AgencySearchAction.do">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
 <table WIDTH="760PX" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		
	<tr><td>&nbsp;</td></tr>

	<tr><td><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>

	<tr><td height="5"></td></tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">AGENCY OF RECORD</td>
	</tr>



		<tr><td>
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">


		    <tr><td>&nbsp;</td></tr>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
	<tr>
		<td width="40%" align="right" class="FormLabels">
		Agency Id
		</td> 
		<td align="left" ><html:text  property="answer(Agency::Equals::AgencyId)" styleClass="txtbox"/></td>

	</tr>	
	</dmshtml:dms_static_with_connector>
<tr>
		<td width="40%" align="right" class="FormLabels">
		Agency Name
		</td> 
		<td align="left" ><html:text property="answer(Agency::Like::BusinessName)" styleClass="txtbox"/></td>

		
	</tr>

	<tr>
		<td class="FormLabels" align="right"><bean:message key="AddCustomer.State"/></td>
	
	
	<td class="links">
		<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<html:select property="answer(Address::Equals::State)"  styleId="State" styleClass="txtbox">
		<html:option value ="">Select</html:option>
		<logic:iterate id="details" name="arStates" scope="request" >
		<bean:define id='test' name="details"  property="typeDesc" />
		<html:option value ='<%=test.toString()%>'>
		<bean:write name="details" property="dmsType" />
		</html:option>
		</logic:iterate>
		</html:select>
	</td>




	</tr>
	
	 <tr><td>&nbsp;</td></tr>



<tr>
		<td colspan="2" align="center" >
		<html:submit value="Find" property="Search" styleClass="sbttn"/>
		&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
</tr>
</table>	
<tr><td><hr size="1" noshade></td></tr></table>






<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN"}%>' connector='or'>
   <logic:present name="LoginPage" scope="session">
	<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
	<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
	<%String objType="";%>
	<logic:present name="objectDescriptor" scope="request">
		<bean:define id="objDescType" name="objectDescriptor" property="objectType"/>
		<bean:define id="objDescId" name="objectDescriptor" property="objectId"/>
		<%if(objDescType.toString().equals("ENTITY")){%>
			<dmshtml:get_entityid_by_userid nameInSession="entityIdentity" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
				<logic:present name="agencyIdent" scope="session">
					<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
                   
				   <html:hidden property="answer(Agency::Equals::AgencyId)" value="<%=agencyIdid.toString()%>" />

				</logic:present>
			</dmshtml:dms_static_with_connector>

			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN"}%>' connector='or' negated="true">
				<dmshtml:Get_GeneralAgency_By_AgentUserId userId="<%=usernameId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="gaagencyIdentity"/>  
				<logic:present name="gaagencyIdentity" scope="session">
					<bean:define id="gaIdent" name="gaagencyIdentity" type="java.lang.Long" scope="session"/>

					<html:hidden property="answer(Agency::Equals::ParentAgencyId)" value="<%=gaIdent.toString()%>" />

				</logic:present>
			</dmshtml:dms_static_with_connector>
		<%} else if(objDescType.toString().equals("GENERAL_AGENCY")){%>
			<html:hidden property="answer(Agency::Equals::ParentAgencyId)" value="<%=""+objDescId%>" />
		<%} else if(objDescType.toString().equals("AGENCY")){%>
			<html:hidden property="answer(Agency::Equals::AgencyId)" value="<%=""+objDescId%>" />
		<%}%>
	</logic:present>
</logic:present>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN"}%>' connector='or' negated="true">
<html:hidden property="answer(Agency::NotEquals::ParentAgencyId)" value="-1" />
</dmshtml:dms_static_with_connector>

<html:hidden property="LimitSearch" value="yes" />
<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
<html:hidden property="answer(Agency::Equals::OwnerId)" value="<%=""+ownerId %>"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>
<!-- /body -->
<!-- /html:html -->
