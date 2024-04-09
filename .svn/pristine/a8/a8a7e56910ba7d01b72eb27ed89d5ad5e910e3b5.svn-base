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


<html:form action="/FindProduct.do" >
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
 <table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		

<tr><td height="5"></td></tr>
<tr>
	<td class="NewSectionHead" colspan="4" align="center">FIND PRODUCT</td>
</tr>


	    <tr><td>&nbsp;</td></tr>
		
	
		<tr><td>
<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">

<tr><td class="sectionhead" colspan ="2" align="center" >PRODUCT DETAILS</td></tr>
		    <tr><td>&nbsp;</td></tr>

	
	<tr>
		<td class="FormLabels" align="left" width="30%">
		Product Type
		</td> 
		<td align="left" ><html:text  property="answer(Product::Like::ProductType)" style="class:txtbox"/></td>
	</tr>

	
	<tr>
		<td class="FormLabels" align="left">Product Version  Number</td>
		<td class="links"><html:text  property ="answer(Product::Like::VerNumber)"  size="8" maxlength="8" style="class:txtbox"/></td>
	</tr>

	<tr>
		<td class="FormLabels" align="left">Product Name</td>
		<td class="links"><html:text  property ="answer(Product::Like::ProductName)"  size="8" maxlength="8" style="class:txtbox"/></td>
	</tr>
	
	<tr>

		<td class="FormLabels" align="left">Status</td>
	<td class="links"><html:select name="FindProduct" property="answer(Product::Like::ProductStatus)" style="class:txtbox">
	<option value =''>All</option>
	    <option value ='RELEASED'>Released</option>
		    <option value ='DEVELOPMENT'>Development</option>
			<option value ='QA'>QA</option>
			<option value ="RESTRICTED">Restricted</option>
				</html:select>
			</td>
	</tr>

	<tr>
		<td class="FormLabels" align="left">Active</td>
		<td class="links" ><html:select name='FindProduct' property="answer(Object::Product::Active)" style="class:txtbox" styleId="State">
    <html:option value ='Y'>Active</html:option>
    <html:option value ='D'>Inactive</html:option>
		</html:select>
			</td></tr>

	
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






	
</html:form>
