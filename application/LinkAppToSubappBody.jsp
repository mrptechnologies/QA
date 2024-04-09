<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/LinkProductToObject.js"></SCRIPT>

<html:form action="/LinkAppToSubApp">
	

<html:hidden property="answer(dbname)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

	<%if(request.getParameter("answer(Object::Application::ApplicationId)")!= null) {%>
	<html:hidden property="answer(Object::Application::ApplicationId)"
		value="<%=request.getParameter("answer(Object::Application::ApplicationId)").toString()%>" />

	<%
}
%>
	

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2"
		CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="MH">LINK APPLICATIONS AND SUB APPLICATIONS</td>
		</tr>
		<tr>
			<td class="TextMatter">Use this page to link applications to sub applications
			<br>
			</td>
		</tr>
		<tr>
			<td>
			<hr size="1" noshade>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>

		<tr>

			<td class="FormLabels" align="left">Select sub application(s) to be
			linked to the application</td>
		</tr>
		<tr>
			<td>
			<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2"
				border="0">

				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td class="FormLabels" align="left">Sub Applications</td>
					<td class="FormLabels" align="left">&nbsp;</td>
					<td class="FormLabels" align="left">Selected Sub Applications</td>

				</tr>
				<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />
				<tr>
					<td width="15%"><dmshtml:get_available_subapps
						nameInSession="arrSubApps"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
applicationId="<%=Long.parseLong(request.getParameter("answer(Object::Application::ApplicationId)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select property="answer(Object::Application::SubApplication)"
						styleId="possible" multiple="true" size="7">
						<logic:present name="arrSubApps" scope="request">
							<logic:iterate id="subApps" name="arrSubApps" scope="request">
								<bean:define id='subAppName' name="subApps"
									property="subApplicationName" />
								<bean:define id='subAppId' name="subApps" property="subApplicationId" />
								<dmshtml:dms_option value='<%=subAppId.toString()%>'>
									<%=subAppName.toString()%>
								</dmshtml:dms_option>
							</logic:iterate>
						</logic:present>
					</dmshtml:dms_select></td>





					<TD width="10%"><A
						HREF="javascript:copyToList('possible','chosen')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A>
					<br><br>
					<A HREF="javascript:copyToList('chosen','possible')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>
					<td width="30%"><dmshtml:get_app_subapps
						nameInSession="arrAppSubApps"
						ownerId="<%=Long.parseLong(""+ownerId)%>"
applicationId="<%=Long.parseLong(request.getParameter("answer(Object::Application::ApplicationId)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select
						property="answer(Object::AppSubApp::SubApplicationId)"
						styleId="chosen" multiple="true" size="7">
						<logic:present name="arrAppSubApps" scope="request">
							<logic:iterate id="appAubApps" name="arrAppSubApps"
								scope="request">
								<bean:define id='appName' name="appAubApps"
									property="subApplicationName" />
								<bean:define id='appId' name="appAubApps"
									property="subApplicationId" />
								<dmshtml:dms_option value='<%=appId.toString()%>'>
									<%=appName.toString()%>

								</dmshtml:dms_option>
							</logic:iterate>
						</logic:present>
					</dmshtml:dms_select></td>

				</TR>
			</table>
			</td>
		</tr>
		<tr>
			<td>
			<hr size="1" noshade width="95%">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="center"><html:submit value="Save" styleClass="sbttn"
				onclick="return allSelect()" /></td>
		</tr>
	</table>
	<bean:define id="userName"
		property="answer(Object::UserDetail::userName)" name="LoginPage"
		scope="session" />
	<html:hidden property="answer(Object::Entity::User)"
		value="<%=userName.toString()%>" />
	<html:hidden property="answer(objectType)" value="appSubApp" />
	<html:hidden property="answer(ApplicationId)"
		value="<%=request.getParameter("answer(Object::Application::ApplicationId)")%>" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
</html:form>


