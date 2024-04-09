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
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">-->
<!--<html:html>-->
<!-- <head>
<html:base/>
<link href="../styles/Styles.css" rel="stylesheet" type="text/css">
<title><%=session.getAttribute("PageTitle")%> - Find General Agency</title>
</head>

<body >-->

<html:form name="FindForm" type="com.dms.web.data.DataForm" action="/ListOfGAgency.do" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		
	    <tr><td>&nbsp;</td></tr>
		<tr><td class="NewSectionHead" colspan="4" align="center">FIND GENERAL AGENCY</td></tr>
		<tr><td><hr size="1" noshade></td></tr>
		<tr><td>
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		    <tr><td>&nbsp;</td></tr>
			<tr>
				<td width="40%" align="right" class="FormLabels">
								General Agency Name
				</td> 
				<td align="left" ><html:text property="answer(Agency::Like::BusinessName)" styleClass="txtbox"/></td>
			</tr>

	
	
			<tr>
					<td class="FormLabels" align="right"><bean:message key="AddCustomer.State"/></td>
					<td class="links" style="class:txtbox"><dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/><html:select property="answer(Address::Equals::State)" >
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
			</tr>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
			connector='or' negated="true">
			<tr>
				<td width="40%" align="right" class="FormLabels">
					Active
				</td> 
				<td align="left" >
						<html:select  property="answer(Agency::Equals::Active)">
							<html:option value="Y">Active</html:option>
							<html:option value="D">Deactive</html:option>
						</html:select>
				</td>

			</tr>
			</dmshtml:dms_static_with_connector>	
	
			 <tr><td>&nbsp;</td></tr>



			<tr>
				<td colspan="2" align="center" >
				<html:submit value="Find" property="Search" styleClass="sbttn"/>
				&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
			</tr>
			</table>	
		</td></tr>
		<tr><td><hr size="1" noshade></td></tr>
</table>
	<html:hidden property="answer(Agency::Equals::ParentAgencyId)" value="-1" />
	<html:hidden property="LimitSearch" value="yes" />
	<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
	<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
	<html:hidden property="answer(Agency::Equals::OwnerId)" value="<%=""+ownerId %>" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

</html:form>
<!-- </body>
</html:html>-->
