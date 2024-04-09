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



<html:form action="/FindTaxDefinitionAction.do">

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr><td height="10"></td></tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">FIND TAX</td>
		</tr>
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="sectionhead" colspan ="2" align="center" >TAX SEARCH CRITERIA</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="FormLabels">
							Tax Name
						</td> 
						<td align="left" >
							<html:text  property="answer(Object::Product::Tax::Definition::TaxName)" styleClass="txtbox" styleId="TaxName"/>
						</td>
					</tr>
					<tr>
						<td width="35%" class="FormLabels" align="right">Tax Category</td>
						<td align="left" >
							<html:text  property="answer(Object::Product::Tax::Definition::TaxCategory)" styleClass="txtbox" styleId="TaxCategory"/>
						</td>
					</tr>
					<tr>
						<td width="35%" class="FormLabels" align="right">Tax Type</td>
						<td align="left" >
							<html:text  property="answer(Object::Product::Tax::Definition::TaxType)" styleClass="txtbox" styleId="TaxType"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="FormLabels">Active</td> 
						<td align="left" >
							<html:select  property="answer(Object::Product::Tax::Definition::Active)"  styleId="Active" styleClass="txtbox">
								<html:option value="Y">Active</html:option>
								<html:option value="N">Inactive</html:option>
							</html:select></td>
					</tr>
									
					<tr><td>&nbsp;</td></tr>
					<tr>
							<td colspan="2" align="center" >
							<html:submit value="Find" property="Search" styleClass="sbttn"/>
							&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;<html:reset value="Back" onclick="javascript:history.go(-1);" styleClass="sbttn"/></td>
					</tr>
					
					<tr>
						<td>							
							<html:hidden property="answer(Object::Product::Tax::Definition::OwnerId)" value="<%= ""+ownerId %>" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						</td>
					</tr>					
				</table>			
			</td>
		</tr>
	</table>
</html:form>
