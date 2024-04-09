<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabRenewal','','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Renewal','','','85','26','','')
<% /* Renewal Menu Begins here: adding Renewal menu items  */ %>
	<% /* Renewal Menu building */ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabFindUpcomingRenewals','tabRenewal','&nbsp;Find Upcoming Renewals','../SearchUpcomingRenewalActionUI3.do','', 285,'26')
	</dmshtml:dms_static_with_connector>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabFindExpringPoliciesWithNoRenewalQuote','tabRenewal','&nbsp;Find Upcoming Renewals with No Renewal Quote','../SearchExpiringPoliciesWithNoRenewalQuoteActionUI3.do','', 285,'26')
	</dmshtml:dms_static_with_connector>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabFindCurrentlyProcessingRenewals','tabRenewal','&nbsp;Find Currently Processing Renewals','../SearchProcessingRenewalActionUI3.do','', 285,'26')
	</dmshtml:dms_static_with_connector>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabFindAlreadyProcessedRenewals','tabRenewal','&nbsp;Find Already Processed Renewals','../SearchProcessedRenewalActionUI3.do','', 285,'26')
	</dmshtml:dms_static_with_connector>
	
<%	/* Renewal Menu ENDS here */  %>
</dmshtml:dms_static_with_connector>