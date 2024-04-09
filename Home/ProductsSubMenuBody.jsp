<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr><td>&nbsp;</td></tr>
		<tr><td class="MH">PRODUCTS</td></tr>
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
			<a href="../AddProduct.do?TabPanelName=Manage_Panel&clear=yes" title="Click to go to the Add Products Page" >Add Product</a>
		</dmshtml:dms_static_with_connector>
			<br>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
			<a href="../FindProduct.do?TabPanelName=Manage_Panel&clear=yes" title="Click to go to the Find Products Page" >Find Product</a>
			<br>
		</dmshtml:dms_static_with_connector>
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
			<IMG SRC="../Images/bullxred.gif" WIDTH="20" HEIGHT="20" BORDER="0" ALT="">
			<a href="../FindProduct.do?TabPanelName=Manage_Panel&all=yes"  title="Click to go to the Show All Products Page">
			Show All Products </a>
		</dmshtml:dms_static_with_connector>
	</td></tr>
 
  </td></tr>
</table>
<table WIDTH="98%" ALIGN="center" height="200px" BORDER="0" CELLSPACING="0" CELLPADDING="2">
<tr><td></td></tr>
</table>


