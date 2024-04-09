<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">SALES MANAGER</td></tr>
		<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="TextMatter">
		<bean:message key="SubMenu.desc"/>
		</td>
	</tr>
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td class="links">

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../AddSalesManager.do?TabPanelName=Manage_Panel&clear=yes"  title="Click to go to the Add Sales Managers Page" />Add Sales Manager</a> 
		</dmshtml:dms_static_with_connector>
		 
		<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../FindSalesManager.do?TabPanelName=Manage_Panel&clear=yes"  title="Click to go to the Find Sales Managers Page" />Find Sales Manager</a> 

		</dmshtml:dms_static_with_connector>

		<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_ALL_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../SearchSalesManager.do?TabPanelName=Manage_Panel&answer(Entity::Equals::EntityType)=<%=URLEncoder.encode("%SALESMANAGER")%>&objectType=ENTITY&all=yes&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID"  title="Click to go to the Show all Sales Managers Page" />Show All Sales Managers</a> 

		</dmshtml:dms_static_with_connector>

   </td></tr>

</table>
<table WIDTH="98%" ALIGN="center" height="200px" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td></td></tr>
</table>
