<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<% /* Submission Menu Begins here: adding Submission menu items  */ %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU"}%>' connector='or' negated="true">	
	
	oCMenu.makeMenu('tabSubmissions','','&nbsp;&nbsp;&nbsp;Submissions','','','104','26','','')
		<% /* Submission Management Menu building  */ %>
	<%/*create submission for Agency/Agent*/ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="false">						
		oCMenu.makeMenu('menuNewSubmission','tabSubmissions','&nbsp;&nbsp;New Submission','../CheckClearanceActionUI3.do?TabPanelName=Submission_Panel&clear=yes','', 180,'25')							 									 				
	</dmshtml:dms_static_with_connector>
	<%/*create submission for except Agency/Agent*/ %>	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="true">						
		oCMenu.makeMenu('menuNewSubmission','tabSubmissions','&nbsp;&nbsp;New Submission','../CreateSubmissionAction.do?TabPanelName=Submission_Panel&clear=yes','', 180,'25')							 				
	</dmshtml:dms_static_with_connector>		

		oCMenu.makeMenu('menuFindSubmission','tabSubmissions','&nbsp;&nbsp;Find Submission','../FindSubmissionNBFUI3.do?TabPanelName=Submission_Panel&clear=yes','', 180,'25')
    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_SEARCH_IN_CLEARANCE_DB"}%>' connector='or' negated="true">						
        oCMenu.makeMenu('menuSearchinClearanceDatabase','tabSubmissions','&nbsp;&nbsp;Search in Clearance Database','../FindClearanceUI3.do?TabPanelName=Submission_Panel&clear=yes','', 180,'25')
    </dmshtml:dms_static_with_connector>
   
</dmshtml:dms_static_with_connector>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_MENU_BTA"}%>' connector='or' negated="true">	
	
	oCMenu.makeMenu('tabSubmissions','','&nbsp;&nbsp;&nbsp;Submissions','','','104','26','','')
		<% /* Submission Management Menu building  */ %>
	<%/*create submission for Agency/Agent*/ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="false">						
		oCMenu.makeMenu('menuNewSubmission','tabSubmissions','&nbsp;&nbsp;New Submission','../CheckClearanceActionBTA.do?TabPanelName=Submission_Panel&clear=yes','', 180,'25')							 									 				
	</dmshtml:dms_static_with_connector>
	<%/*create submission for except Agency/Agent*/ %>	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="true">						
		oCMenu.makeMenu('menuNewSubmission','tabSubmissions','&nbsp;&nbsp;New Submission','../CreateSubmissionAction.do?TabPanelName=Submission_Panel&clear=yes','', 180,'25')							 				
	</dmshtml:dms_static_with_connector>		

		oCMenu.makeMenu('menuFindSubmission','tabSubmissions','&nbsp;&nbsp;Find Submission','../FindSubmissionNBF.do?TabPanelName=Submission_Panel&clear=yes','', 180,'25')
    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_SEARCH_IN_CLEARANCE_DB"}%>' connector='or' negated="true">						
        oCMenu.makeMenu('menuSearchinClearanceDatabase','tabSubmissions','&nbsp;&nbsp;Search in Clearance Database','../FindClearance.do?TabPanelName=Submission_Panel&clear=yes','', 180,'25')
    </dmshtml:dms_static_with_connector>
   
</dmshtml:dms_static_with_connector>
<%	/* Submission Menu ENDS here */  %>
