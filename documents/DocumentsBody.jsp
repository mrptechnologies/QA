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

<%
String strDomainName="";
strDomainName=""+request.getServerName();
%>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="10" CELLPADDING="3">		
	<tr>				
		<td class="MH">DOCUMENTS</td>
	</tr>

	<tr>
		<td class="TextMatter">
		<bean:message key="SubMenu.desc"/>
		</td>
	</tr>
	<tr><td><hr size="1" noshade ></td></tr>
	
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">




<%if((strDomainName.indexOf("benicorp")>=0) || (strDomainName.indexOf("mica")>=0))
{%>


<tr>
	<td>
	 <table cellSpacing="0" cellPadding="0" border="0" width="100%">
	  <tbody>
		
	  <tr>
		<td class="links" height="25" colspan="2">&nbsp;
		<!-- Administrative Forms Menu item is available only for benicorp users. -->
		<%if(strDomainName.indexOf("benicorp")>=0)
		{%>
			<a href="../documents/AdminForms.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Administration Forms</a>
		<%}%>
		</td></tr>

	   <tr>
		<td class="links" height="25" colspan="2">&nbsp;
			<a href="../documents/AgentInfo.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Agent Information</a></td></tr>
		   
	   <tr>
		<td class="links" height="25" colspan="2">&nbsp;
			<a href="../documents/BenefitAndContact.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Benefit Summary & Contact Info</a></td></tr>

	   <tr>
		<td class="links" height="25" colspan="2">&nbsp;
			<a href="../documents/DrugPriorAuthList.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Drug Prior Authorization List</a></td></tr>

	   <tr>
		<td class="links" height="25" colspan="2">&nbsp;
			<a href="../documents/EmployeeEnrollForms.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Employee Enrollment Forms</a></td></tr>
		
		<!-- item is available only for benicorp users. -->
		<%if(strDomainName.indexOf("benicorp")>=0)
		{%>
			<tr>
			<td class="links" height="25" colspan="2">&nbsp;
				<a href="../documents/EmployerAgreements.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Financial Brouchers</a>
		
			</td></tr>

			<tr>
				<td class="links" height="25" colspan="2">&nbsp;
				<a href="../documents/ExperienceRatingKit.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Experience Rating Kit</a></td></tr>
		<%}%>

		<!-- item is available only for mica users. -->
		<%if(strDomainName.indexOf("mica")>=0)
		{%>
			<tr>
			<td class="links" height="25" colspan="2">&nbsp;
				<a href="../documents/IL_Enroll_Forms.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Illinois Enrollment Forms</a></td></tr>
		<%}%>

		<!-- item is available only for benicorp users. -->
		<%if(strDomainName.indexOf("benicorp")>=0)
		{%>
			<tr>
			<td class="links" height="25" colspan="2">&nbsp;
				<a href="../documents/Newsletters.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Newsletters</a></td></tr>

	   <tr>
		<td class="links" height="25" colspan="2">&nbsp;
			<a href="../documents/ClaimDirections.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Online Claim Directions</a></td></tr>
		<%}%>

	   <tr>
		<td class="links" height="25" colspan="2">&nbsp;
			<a href="../documents/ProductBrochures.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Product Brochures</a></td></tr>

		<!-- item is available only for benicorp users. -->
		<%if(strDomainName.indexOf("benicorp")>=0)
		{%>
	   <tr>
		<td class="links" height="25" colspan="2">&nbsp;
			<a href="../documents/SpanishEnrollForms.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Spanish Enrollment Forms</a></td></tr>

	   <tr>
		<td class="links" height="25" colspan="2">&nbsp;
			<a href="../documents/UWHealthQuestion.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Underwriting Health Questionnaires</a></td></tr>
		<%}%>

		<!-- Enrollment Menu item is available only for mica users. -->
		<%if(strDomainName.indexOf("mica")>=0)
		{%>
			 <tr>
				<td class="links" height="25" colspan="2">&nbsp;
					<a href="../documents/Enrollment.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&"/><IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">Enrollment</a></td></tr>
		<%}%>

	   </tbody></table>
	</td></tr>
	<%}%>
</dmshtml:dms_static_with_connector >
		
		

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="false">
	<tr><td class="sectionhead1">
		No Documents Available
	</td></tr>
</dmshtml:dms_static_with_connector >

</table>  	
