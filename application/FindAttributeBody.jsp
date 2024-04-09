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


<html:form action="/FindAttribute.do" >

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		

<tr><td height="5"></td></tr>
<tr>
	<td class="NewSectionHead" colspan="4" align="center">FIND ATTRIBUTE</td>
</tr>


	    <tr><td>&nbsp;</td></tr>
		
	
		<tr><td>
<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">

<tr><td class="sectionhead" colspan ="2" align="center" >ATTRIBUTE DETAILS</td></tr>
		    <tr><td>&nbsp;</td></tr>

	
	<tr>
		<td class="FormLabels" align="left" width="30%">
		Attribute Name
		</td> 
		<td align="left" ><html:text  property="answer(ApplicationAttr::Like::AttributeName)" size="40" style="class:txtbox"/></td>
	</tr>

	
	<tr>
		<td class="FormLabels" align="left">Column Name</td>
		<td class="links"><html:text  property ="answer(ApplicationAttr::Equals::AttrColName)"  size="8" maxlength="8" style="class:txtbox"/></td>
	</tr>

	<tr>
		<td class="FormLabels" align="left">Active</td>
		<td class="links" >
			<html:select property="answer(ApplicationAttr::Equals::Active)" style="class:txtbox" styleId="State">
	    		<html:option value ='Y'>Active</html:option>
	    		<html:option value ='D'>Inactive</html:option>
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



<html:hidden styleId="inpPageNum" property="answer(Object::Attribute::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Attribute::orderBy)" value="attr.ATTRIBUTE_NAME "/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	
</html:form>
