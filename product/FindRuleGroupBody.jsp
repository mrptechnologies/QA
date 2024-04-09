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


<html:form action="/FindRuleGroup.do" >
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		

<tr><td height="5"></td></tr>
<tr>
	<td class="NewSectionHead" colspan="4" align="center">FIND RULE GROUP</td>
</tr>


	    <tr><td>&nbsp;</td></tr>
		
	
		<tr><td>
<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">

<tr><td class="sectionhead" colspan ="2" align="center" >RULE GROUP DETAILS</td></tr>
		    <tr><td>&nbsp;</td></tr>

	
	<tr>
		<td class="FormLabels" align="left" width="30%">
		Rule Group Name
		</td> 
		<td align="left" ><html:text  property="answer(Rule::Like::RuleGroupName)" size="40" style="class:txtbox"/></td>
	</tr>

	
	<tr>
		<td class="FormLabels" align="left">Object Name</td>
			<td class="links" style="Class: TextMatter">
								<html:select  property="answer(Object::Rule::ObjectType)" name="AddRule" styleClass="TextMatter" >
									<html:option value ="ATTRIBUTE">Application</html:option>
									<html:option value ="OPTION">Option</html:option>
								
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

<%
session.removeAttribute("showAllProducts");

%>



<html:hidden styleId="inpPageNum" property="answer(Object::Rule::PageNum)" value="0"/>
	<bean:define id="objectType" property="answer(Object::Rule::ObjectType)" name="AddRule" />

		<html:hidden property="answer(Object::Rule::ObjectType)"
					value="<%=""+objectType%>" />

	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
