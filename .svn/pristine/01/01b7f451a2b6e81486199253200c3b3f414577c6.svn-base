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

<SCRIPT type="text/javascript"
	SRC="../Scripts/JScripts/LinkProductToObject.js"></SCRIPT>

<html:form action="/LinkProductFeatureToRole">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
	<html:hidden property="answer(dbname)"
		value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<%if(request.getParameter("answer(Object::Product::ProductId)")!= null) {%>
	<html:hidden property="answer(Object::Product::ProductId)"
		value="<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>" />
		<html:hidden property="answer(ProductId)"
		value="<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>" />
		

	<%
}
%>
<%if(request.getParameter("answer(featureId)")!= null) {%>
	<html:hidden property="answer(featureId)"
		value="<%=request.getParameter("answer(featureId)").toString()%>" />
	<%
}
%>

<%if(request.getParameter("answer(featureName)")!= null) {%>
	<html:hidden property="answer(featureName)"
		value="<%=request.getParameter("answer(featureName)").toString()%>" />
	<%
}
%>
	
	<table WIDTH="700px" ALIGN="center" BORDER="0" CELLSPACING="2"
		CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="MH">LINK PRODUCT FEATURES AND ROLES</td>
		</tr>
		<tr>
			<td class="TextMatter">Use this page to link product features to
			role <br>
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
			<bean:define id="ownerId"
					property="answer(Object::UserDetail::ownerId)" name="LoginPage"
					scope="session" />

		

		<tr>

			<td class="FormLabels" align="left">Select roles(s) to be
			linked to the product feature</td>
		</tr>
		<tr>
			<td>

			<table WIDTH="700px" ALIGN="left" cellspacing=0 cellpadding="2"
				border="0">

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td class="FormLabels" align="left">Roles</td>
					<td class="FormLabels" align="left">&nbsp;</td>		
					<td class="FormLabels" align="left">Selected Roles</td>
				</tr>

			
				<tr>
					<td width="325px"><dmshtml:get_available_prod_feature_roles
						nameInSession="arrayRoles"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						featureId="<%=Long.parseLong(request.getParameter("answer(featureId)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select
						property="answer(Object::ProductFeature::ProductFeatureId)"
						styleId="possible" multiple="true" size="7">
						<logic:present name="arrayRoles" scope="request">
						<bean:define id="arrRoles" name="arrayRoles" type="java.util.ArrayList" />
						<%
						for(int i=0;i<arrRoles.size();i++) {
								com.dms.ejb.data.QuestionHashMap arrRolesQMap=(com.dms.ejb.data.QuestionHashMap)arrRoles.get(i);	%>
						<dmshtml:dms_option value='<%=arrRolesQMap.getString("roleId")%>'>
									<%=arrRolesQMap.getString("roleName")%>
								</dmshtml:dms_option>
					<%}	%>
						</logic:present>
					</dmshtml:dms_select>
						</td>



					<TD width="10%"><A
						HREF="javascript:copyToList('possible','chosen')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A> <br>
					<br>
					<A HREF="javascript:copyToList('chosen','possible')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>
					
					<td width="350px"><dmshtml:get_prod_feature_roles
						nameInSession="arrayRoles"
						productId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductId)").toString())%>"
						featureId="<%=Long.parseLong(request.getParameter("answer(featureId)").toString())%>"
						dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
					<dmshtml:dms_select
						property="answer(Object::ProductFeature::RoleId)"
						styleId="chosen" multiple="true" size="7">
				<logic:present name="arrayRoles" scope="request">
						<bean:define id="arrRoles" name="arrayRoles" type="java.util.ArrayList" />
						<%
						for(int i=0;i<arrRoles.size();i++) {
								com.dms.ejb.data.QuestionHashMap arrRolesQMap=(com.dms.ejb.data.QuestionHashMap)arrRoles.get(i);	%>
						<dmshtml:dms_option value='<%=arrRolesQMap.getString("roleId")%>'>
									<%=arrRolesQMap.getString("roleName")%>
								</dmshtml:dms_option>
					<%}	%>
						</logic:present>
					</dmshtml:dms_select></td>

				</TR>

			</table>
			</td>
		</tr>
		<tr>
			<td>
			<hr size="1" noshade>
			</td>
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
	<html:hidden property="answer(objectType)" value="prodFeatureRole" />
</html:form>
