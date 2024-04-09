
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr>
	<td height="20"></td></tr>
<tr>
	<td class="NewSectionHead" align="center" colspan ="10" >Search Results - Options</td></tr>

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
<logic:notPresent name="OPTIONS_SEARCH_RESULT" scope="request">
	<td class="error">
		No results found.
	</td>
</logic:notPresent>
<logic:present name="OPTIONS_SEARCH_RESULT" scope="request">
<tr>
	<td align="center">
	<table border="0" width="100%" cellspacing="2" cellpadding="2" style="{border-width:1px; border-style:solid; border-color: #999999;}">
	<tr>
		<td class="sectionhead" width="5%">S.No</td>
		<td class="sectionhead" width="15%">Option Name</td>
		<td class="sectionhead" width="15%">Option Description</td>
		<td class="sectionhead" width="10%">Version No.</td>
		<td class="sectionhead" width="15%">Display Name</td>
		<td class="sectionhead" width="15%">Version Desc</td>
		<td class="sectionhead" width="10%">Rated</td>
		<td class="sectionhead" width="15%">Default Option Value</td>
	</tr>
	<%
		int sl = 0;
	%>
	<logic:iterate id="arrSearchResult" name="OPTIONS_SEARCH_RESULT" type="com.dms.ejb.product.ProductOptions.PRDProductOptionsDetail">
	<tr>
		<td class="SearchResult" width="5%"><a href="/GetOptionDetails.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductOptions::Equals::OptionId)=<bean:write name="arrSearchResult" property="optionId"/>&answer(ProductOptions::Equals::OptionVerId)=<bean:write name="arrSearchResult" property="optionVerId"/>"><%=(++sl)%></a></td>
		<td class="SearchResult" width="15%">
			<a href="/GetOptionDetails.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ProductOptions::Equals::OptionId)=<bean:write name="arrSearchResult" property="optionId"/>&answer(ProductOptions::Equals::OptionVerId)=<bean:write name="arrSearchResult" property="optionVerId"/>"><bean:write name="arrSearchResult" property="optionName"/></a>
		</td>
		<td class="SearchResult" width="15%">
			<bean:write name="arrSearchResult" property="optionDesc"/>
		</td>
		<td class="SearchResult" width="10%">
			<bean:write name="arrSearchResult" property="optionVerNum"/>
		</td>
		<td class="SearchResult" width="15%">
			<bean:write name="arrSearchResult" property="optionVerName"/>
		</td>
		<td class="SearchResult" width="15%">
			<bean:write name="arrSearchResult" property="optionVerDesc"/>
		</td>
		<td class="SearchResult" width="10%">
			<bean:write name="arrSearchResult" property="rated"/>
		</td>
		<td class="SearchResult" width="15%">
			<bean:write name="arrSearchResult" property="defaultOptionValue"/>
		</td>
	</tr>
	</logic:iterate>
	</table>
</td></tr>
</logic:present>
<tr><td height="8px"></td></tr>
</table>

