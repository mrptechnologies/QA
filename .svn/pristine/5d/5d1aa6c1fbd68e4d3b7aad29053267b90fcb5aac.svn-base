
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/SearchOptions.do">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr>
	<td height="20"></td></tr>
<tr>
	<td class="NewSectionHead" align="center" colspan ="10" >Find Options</td></tr>

<tr>
	<td height="8px"></td></tr>

<tr>
	<td valign="top">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td class="FormLabels" colspan="6"></td>
		</tr>
		</table>
	</td>
</tr>
<tr><td height="20px"></td></tr>


<tr>
	<td align="center">
	<table border="0" width="10%" cellspacing="2" cellpadding="2" style="{border-width:1px; border-style:solid; border-color: #999999;}">
	<tr><td class="sectionhead" colspan ="2" align="center" >OPTION DETAILS</td></tr>
	<tr><td colspan="2" height="5px"></td></tr>

	<tr>
		<td class="sectionhead" width="15%" nowrap> Option Name</td>
		<td class="SearchResult">
			<html:text property="answer(ProductOptions::Like::OptionName)" size="40" maxlength="30" styleClass="txtbox"/></td>
	</tr>

	<tr>
		<td class="sectionhead" width="15%" nowrap> Option Description</td>
		<td class="SearchResult">
			<html:text property="answer(ProductOptions::Like::OptionDesc)" size="40" maxlength="10" styleClass="txtbox"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<html:submit value="Find" property="button" styleClass="sbttn"/>
			&nbsp;&nbsp;
			<input type="reset" class="sbttn"/>
		</td>
	</tr>
	</table>
</td></tr>

<tr><td height="8px"></td></tr>
</table>
</html:form>

