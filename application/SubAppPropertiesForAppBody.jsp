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

<html:form action="/UpdateAppVerSubAppVer">

	<html:hidden property="answer(dbname)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<%if(request.getParameter("answer(Object::Application::ApplicationId)")!= null) {%>
	<html:hidden property="answer(Object::Application::ApplicationId)"
		value="<%=request.getParameter("answer(Object::Application::ApplicationId)").toString()%>" />
	<%
		}
	%>
	<%if(request.getParameter("answer(Object::Application::ApplicationVerId)")!= null) {%>
	<html:hidden property="answer(Object::Application::ApplicationVerId)"
		value="<%=request.getParameter("answer(Object::Application::ApplicationVerId)").toString()%>" />

	<%
		}
	%>
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0"
		CELLPADDING="0">
		<tr>
			<td colspan="2" height="55px"></td>
		</tr>
		<tr>
			<td  class="NewSectionHead" colspan="2" align="center">UPDATE SUB-APPLICATION VERSION</td>
		</tr>
		<tr>
			<td colspan="2" height="25px"></td>
		</tr>
		<tr>
			<td align="center">
			<table border="0" width="550px" cellspacing="2" cellpadding="2"
				style="{border-width:1px; border-style:solid; border-color: #999999;}">
				<tr>
					<td colspan="2" height="2px"></td>
				</tr>
				<tr>
					<td class="sectionhead">Application Name</td>
					<td class="TextMatter"><bean:write name="AddApplication" property="answer(ApplicationName)"/></td></tr>
				<tr>
					<td class="sectionhead">Sub-Application Name</td>
					<td class="TextMatter">
					<a href="../GetSubApplicationVersionAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(SubApplicationId)=<bean:write name="AddApplication" property="answer(SubApplicationId)"/>&answer(SubApplicationVerId)=<bean:write name="AddApplication" property="answer(Object::Application::SubApplicationVerId)"/>">
					<bean:write name="AddApplication" property="answer(SubApplicationName)"/></a>
					</td></tr>
				<tr>
					<td class="sectionhead">Enable Sub-Application</td>
					<td class="TextMatter"><dmshtml:dms_radio
						name="AddApplication"
						property="answer(Object::Application::ApplicationState)" value="Y">
				Yes
				</dmshtml:dms_radio> &nbsp;&nbsp;&nbsp; <dmshtml:dms_radio name="AddApplication"
						property="answer(Object::Application::ApplicationState)" value="N">
				No
			</dmshtml:dms_radio></td>
				</tr>
				<tr>
					<td class="sectionhead">Sub-Application Display Order</td>
					<td class="TextMatter">&nbsp; <html:text
						property="answer(Object::Application::DisplayOrder)"
						styleClass="txtbox" /></td>

				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><html:submit property="submit"
						value="Submit"  styleClass="sbttn"/></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	<html:hidden property="answer(action)" value="UPDATE" />
	<html:hidden property="answer(objectType)" value="appVerSubAppVer" />
	<html:hidden property="answer(Object::Application::ApplicationVerId)"/>
	<html:hidden property="answer(Object::Application::SubApplicationVerId)"/>
	<html:hidden property="answer(ApplicationId)"/>
	<html:hidden property="answer(ApplicationVerId)"/>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>
