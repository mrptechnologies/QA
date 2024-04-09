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



<html:form action="/FindFeeDefinitionAction.do">


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr><td height="10"></td></tr>
		
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">FIND FEE</td>
		</tr>
		<tr>
			<td>
				<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="sectionhead" colspan ="2" align="center" >FEE SEARCH CRITERIA</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="FormLabels">
							Fee Name
						</td> 
						<td align="left" >
							<html:text  property="answer(Object::Product::Fee::Definition::FeeName)" styleClass="txtbox" styleId="FeeName"/>
						</td>
					</tr>
					<tr>
						<td width="35%" class="FormLabels" align="right">Fee Category</td>
						<td align="left" >
							<html:text  property="answer(Object::Product::Fee::Definition::FeeCategory)" styleClass="txtbox" styleId="FeeCategory"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" class="FormLabels">Active</td> 
						<td align="left" >
							<html:select  property="answer(Object::Product::Fee::Definition::Active)"  styleId="Active" styleClass="txtbox">
								<html:option value="Y">Active</html:option>
								<html:option value="D">Inactive</html:option>
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
							<html:hidden property="answer(Object::Product::Fee::Definition::OwnerId)" value="<%= ""+ownerId %>" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						</td>
					</tr>					
				</table>			
			</td>
		</tr>
	</table>
</html:form>
