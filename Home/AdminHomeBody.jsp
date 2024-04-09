
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	 if(session.getAttribute("Tab_UI_View").equals("UI_3.1")) {
%>
		  <logic:present name="msgInfo" scope="request">
<div class="Error">
		<%=request.getAttribute("msgInfo")%>
</div>	
</logic:present>

<p class="pagehead" style="margin:0; margin-left:15px">Administrator</p>
<div class="left_side">
<p class="menu_heading">Employer Groups</p>
<p style="margin-left:30px;"><a href="../AddCustomersApplication.do?clear=yes">Add Employer Group</a></p>

<p class="menu_heading">Search</p>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../FindGenaralAgencyAction.do?clear=yes">Find General Agency</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../FindAgencyAction.do?clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENT_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../FindAgent.do?TabPanelName=Search_Panel&clear=yes">Find Agent</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../FindSalesManager.do?clear=yes">Find Sales Manager</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<p style="margin-left:30px;"><a href="../FindCustomers.do?clear=yes">Find Employer Group</a></p>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../FindUsers.do?clear=yes">Find User Account</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">
<p class="menu_heading">User Accounts</p>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_USER_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"> <a href="../AddUserAccountLink.do?clear=yes">Add User Account</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_MENU"}%>' connector='or' negated="true">						
<p class="menu_heading">E-mail</p>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../email/FindEmail1.jsp?TabPanelName=Manage_Panel&clear=yes">Find E-Mail</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>
</div>

<div class="right_side">

<p class="menu_heading">Manage</p>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../GeneralAgencyLink.do?clear=yes">Add General Agency</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../AgencyLink.do?clear=yes">Add Agency</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENT_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a href="../AddAgents.do?clear=yes">Add Agent</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
<p style="margin-left:30px;"><a  href="../AddSalesManager.do?clear=yes">Add Sales Manager</a></p>
</dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>

<p class="menu_heading">Applications</p>
<p style="margin-left:30px;"><a href="../NonInvalidatedUserLogs.do?ownerId=5">Logged in Users</a></p>
<%-- <p style="margin-left:30px;"><a href="/Home/DataExportSubMenu.jsp">Data Export</a></p>
<p style="margin-left:30px;"><a href="../export/RateCard.jsp">Renewal Rate Card</a></p> --%>


</div> 
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
		  
<%
	}
	else {
%>
	  <table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td >&nbsp;</td></tr>

	<tr>
	
		<td valign="top" align="center">
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td colspan="2" >&nbsp;</td></tr>
	<logic:present name="msgInfo" scope="request">
	<tr>
		<td class="Error">
		<%=request.getAttribute("msgInfo")%>
		</td>
	</tr>
</logic:present>
 	<tr><td width="100%" class="TextMatter" valign="top">
	
	<!-- bean:message key="Home.welcome"/ --><br><br><!--  bean:message key="Home.welcome1"/ -->
	<jsp:include page="../HomePanel/Home_Panel_Container.jsp" />
	</td>
	<!-- <td align="right"><img SRC="../Images/ARImage.jpg" ></td> -->
	</tr>
</table>

		</td>
	</tr>
	

</table>
<%
	}
%>
	

