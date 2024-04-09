<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->
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
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage"  scope="session"/>
<html:form action="/AgencySearchInsuredAction.do">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<%String Customerid = "" + request.getParameter("answer(Object::Customer::CustomerId)"); %>
<%String parentQId = ""; %>
<% if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				parentQId=request.getParameter("answer(parentQuoteId)");
			}%>
 <table WIDTH="760PX" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		
	<tr><td>&nbsp;</td></tr>

				<% String parentQuoteIdForDisplay = "";
				if((""+parentQId).length()>0 && ""+parentQId != null ){
					parentQuoteIdForDisplay= ""+parentQId; 
					}%>
	<%if(parentQuoteIdForDisplay != ""){%>
		<td>
				<div id="QuoteInsuerdAgencyAgentHeader">
												<jsp:include page="../common/QuoteInsuredAgencyLink.jsp">
												<jsp:param name="parentQuoteId" value="<%=""+parentQId%>" />
												<jsp:param name="paretQuoteStatus" value="<%="Issued"%>" />
												</jsp:include>
											</div>
			</td>
			<%}else{ %>								
					<tr><td><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>
				<%}%>

	<tr><td height="5"></td></tr>
	<tr>
		<td class="NewSectionHead" colspan="4" align="center">AGENCY OF RECORD</td>
	</tr>

<%
	String isAgencyChangeEnabled = "Yes";
	String agencyNameFromQuote = "";
	long agencyCode =0;
	if(request.getParameter("answer(isAgencyChangeEnabled)")!=null){
		isAgencyChangeEnabled = ""+request.getParameter("answer(isAgencyChangeEnabled)");
	}	
	if(request.getParameter("answer(agencyName)")!=null){
		agencyNameFromQuote = ""+request.getParameter("answer(agencyName)");
	}	
	if(request.getParameter("answer(agencyCode)")!=null){
		agencyCode = Long.parseLong(""+request.getParameter("answer(agencyCode)"));
	}
%>

	<tr><td>
		<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		    <tr><td>&nbsp;</td></tr>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ID_VIEW"}%>' connector='or' negated="true"> 	
			<tr>
				<td width="40%" align="right" class="FormLabels">
					Agency/Broker Code
				</td> 
				<%if(isAgencyChangeEnabled.equals("Yes")) {%>
					<td align="left"><html:text  property="answer(Agency::Equals::AgencyId)" styleClass="txtbox"/></td>
				<%}else if(isAgencyChangeEnabled.equals("No")){ %>	
					<td align="left" >
						<html:text property="answer(Agency::Like::AgencyId)" disabled="true" name="AddCustomer" value='<%=""+agencyCode%>' size="20" maxlength="20" styleClass="txtbox" />
					</td>
					<html:hidden property="answer(Agency::Like::AgencyId)" value='<%=""+agencyCode%>' name="AddCustomer"/>
				<%} %>
			</tr>	
</dmshtml:dms_static_with_connector>
			<tr>
				<td width="40%" align="right" class="FormLabels">
					Agency Name
				</td> 
				<%if(isAgencyChangeEnabled.equals("Yes")) {%>
					<td align="left" ><html:text property="answer(Agency::Like::BusinessName)" styleClass="txtbox"/></td>
				<%}else if(isAgencyChangeEnabled.equals("No")){ %>	
					<td align="left" >
						<html:text property="answer(Agency::Like::BusinessName)" disabled="true" name="AddCustomer" value='<%=""+agencyNameFromQuote%>' size="20" maxlength="20" styleClass="txtbox" />
					</td>
					<html:hidden property="answer(Agency::Like::BusinessName)" value='<%=""+agencyNameFromQuote%>' name="AddCustomer"/>
				<%} %>	
			</tr>

			<tr>
				<td width="40%" align="right" class="FormLabels">
					Agent First Name
				</td> 
				<td align="left" ><html:text property="answer(Object::Entity::FirstName)" styleClass="txtbox"/></td>		
			</tr>
			<tr>
				<td width="40%" align="right" class="FormLabels">
					Agent Last Name
				</td> 
				<td align="left" ><html:text property="answer(Object::Entity::LastName)" styleClass="txtbox"/></td>		
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
		&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Close" onclick="window.close();" styleClass="sbttn"/></td>
</tr>
</table>	
<tr><td><hr size="1" noshade></td></tr></table>

<html:hidden property="formNameAgencyFind" value='<%="" + request.getParameter("formNameAgencyFind") %>' name="AddCustomer" /> 
<html:hidden property="answer(IsPopupEnabledAgencyFind)" value='<%="" + request.getParameter("answer(IsPopupEnabledAgencyFind)") %>' name="AddCustomer" /> 
<html:hidden property="answer(AgentId)" value='<%="" + request.getParameter("answer(AgentId)") %>' name="AddCustomer" /> 


<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN"}%>' connector='or'>
   <logic:present name="LoginPage" scope="session">
	<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
	 <%String objType="";%>
	    <bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
		<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
		<%if(objDescType.toString().equals("ENTITY")){ %>
			<dmshtml:get_entityid_by_userid nameInSession="entityIdentity" ownerId="<%=Long.parseLong(""+ownerId)%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
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
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN"}%>' connector='or' negated="true">
<html:hidden property="answer(Agency::NotEquals::ParentAgencyId)" value="-1" />
</dmshtml:dms_static_with_connector>

<html:hidden property="LimitSearch" value="yes" />
<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
<html:hidden property="answer(Agency::Equals::OwnerId)" value="<%=""+ownerId %>"/>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+Customerid %>"/>
<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQId%>"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

</html:form>
<!-- /body -->
<!-- /html:html -->