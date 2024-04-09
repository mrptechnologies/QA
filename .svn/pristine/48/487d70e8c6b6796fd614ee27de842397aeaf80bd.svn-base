<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabPolicies','','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Policies','','','85','26','','')
<% /* Policy Menu Begins here: adding Policy menu items  */ %>
	<% /* Policy Menu building */ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_POLICY_MENU_NON_BTA"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabAdd','tabPolicies','&nbsp;Add Policy','../AddPolicyDisplayActionUI3.do?clear=Y','', 110,'25','','','','')
	</dmshtml:dms_static_with_connector>
	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabFind','tabPolicies','&nbsp;Find Policy','../SearchPolicyDisplayActionUI3.do','', 110,'25','','','','')
	</dmshtml:dms_static_with_connector>

	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_CERTIFICATE_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabFind','tabPolicies','&nbsp;Find Certificate','../SearchPolicyDisplayAction.do','', 110,'25','','','','')
	</dmshtml:dms_static_with_connector>
<%	/* Policy Menu ENDS here */  %>
</dmshtml:dms_static_with_connector>
