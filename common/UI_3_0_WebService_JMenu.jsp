<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<% /* Web Service Menu Begins here: adding Web Service menu items  */ %>

	
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">	
	oCMenu.makeMenu('tabWebService','','&nbsp;&nbsp;&nbsp;WebService','','','104','26','','')
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
		 oCMenu.makeMenu('menuTestGetDataFeed','tabWebService','Invoke GetDataFeed','../webservice/TestWebService.jsp','', 340,'26')
    </dmshtml:dms_static_with_connector>
    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
		 oCMenu.makeMenu('menuTestInWebServiceUpdateTrans','tabWebService','Invoke UpdateProcessTrans','../webservice/TestUpdateTrans.jsp','', 340,'26')
    </dmshtml:dms_static_with_connector>
    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
 	     oCMenu.makeMenu('menuOutBoundTransactions','tabWebService','Find OutBound Transactions','../webservice/FindOutBoundTransactions.jsp','', 340,'26')
    </dmshtml:dms_static_with_connector>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
 		 oCMenu.makeMenu('menuGetDataFeedXML','tabWebService','Find GetDataFeed Batch sent to Genius','../webservice/FindOutBoundGetDataFeedXML.jsp','', 340,'26')
    </dmshtml:dms_static_with_connector>	
    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">      
 		 oCMenu.makeMenu('menuGetDataFeedTransactions','tabWebService','Find GetDataFeed Batch Records sent to Genius','../webservice/FindOutBoundGetDataFeedTransactions.jsp','', 340,'26')
    </dmshtml:dms_static_with_connector>  
    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
 		 oCMenu.makeMenu('menuUpdateProcessTrans','tabWebService','Find UpdateProcessedTrans Received from Genius','../webservice/FindOutBoundUpdateProcessTransTransaction.jsp','', 340,'26')
    </dmshtml:dms_static_with_connector>	  
    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
 		 oCMenu.makeMenu('menuErrorProcessTrans','tabWebService','Find Outbound Transaction Error Received from Genius','../webservice/FindOutBoundProcessedErrorTransactions.jsp','', 340,'26')
    </dmshtml:dms_static_with_connector>  	
    
</dmshtml:dms_static_with_connector>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_WEB_SERVICE_MENU"}%>' connector='or' negated="true">	
oCMenu.makeMenu('tabWebService','','&nbsp;&nbsp;&nbsp;WebService','','','104','26','','')
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
		 oCMenu.makeMenu('menuTestGetDataFeed','tabWebService','Find DownStream','../webservice/WebServiceDownStream.jsp','', 150,'26')
    </dmshtml:dms_static_with_connector>
   	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
		 oCMenu.makeMenu('menuGetDownStream','tabWebService','Get DownStream','../webservice/WebServiceGetDownStream.jsp','', 150,'26')
    </dmshtml:dms_static_with_connector>
</dmshtml:dms_static_with_connector>
<%	/* WebService Menu ENDS here */  %>


