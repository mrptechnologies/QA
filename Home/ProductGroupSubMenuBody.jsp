<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">PRODUCT GROUPS</td></tr>
		<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="TextMatter">
		<bean:message key="SubMenu.desc"/>
		</td>
	</tr>
	<tr><td><hr size="1" noshade ></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td class="links">


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">

			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../product/AddProductGroup.jsp?TabPanelName=Manage_Panel&clear=yes"  title="Click to go to the Add Product Group Page" />Add Product Group</a> 
		</dmshtml:dms_static_with_connector>
		 
		<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../product/FindProductGroup.jsp?TabPanelName=Manage_Panel&clear=yes"  title="Click to go to the Find Product Group Page" />Find Product Group</a> 

		</dmshtml:dms_static_with_connector>

		<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
		  <a href="../product/FindProductGroup.jsp?TabPanelName=Manage_Panel&clear=yes"  title="Click to go to the Find Product Group Page" />Show All Product Groups</a> 

		</dmshtml:dms_static_with_connector>
		
   </td></tr>

</table>


