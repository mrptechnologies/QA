<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
<%String insType = (String)session.getAttribute("InsType"); %>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
	<%if(insType.equals("PC")|| insType.equals("Professional Liability")) {%>
	oCMenu.makeMenu('tabInsured','','&nbsp;&nbsp;&nbsp;&nbsp;Find','','','60','26','','')
	<%}else if(insType.equals("Health")){%>
	oCMenu.makeMenu('tabInsured','','&nbsp;&nbsp;&nbsp;&nbsp;Employer Group','','','75','26','','')
	<%} %>
	<% /* adding insured menu items  */ %>
		<%if(insType.equals("PC")) {%>
				<% /* Insured Management Menu building */ %>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuNewInsured','tabInsured','&nbsp;New Insured','../AddInsured.do?TabPanelName=Insured_Panel&clear=yes','', 110,'25')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_COM_INSURED_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuNewInsured','tabInsured','&nbsp;New Insured','../AddInsuredCom.do?TabPanelName=Insured_Panel&clear=yes&answer(Object::PageType)=ADD_INSURED','', 110,'25')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_LIU_INSURED_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuNewInsured','tabInsured','&nbsp;New Insured','../AddLIUInsured.do?TabPanelName=Insured_Panel&clear=yes&answer(Object::PageType)=ADD_INSURED','', 110,'25')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_BTA_INSURED_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuNewInsured','tabInsured','&nbsp;Add Insured','../AddBTAInsured.do?TabPanelName=Insured_Panel&clear=yes&answer(Object::PageType)=ADD_INSURED','', 110,'25')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuFindInsured','tabInsured','&nbsp;Find Insured','../FindInsuredUI3.do?clear=yes','', 110,'25')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUICK_QUOTE_DISABLED"}%>' connector='or' negated="true">
					oCMenu.makeMenu('menuFindQuote','tabInsured','&nbsp;Find Quote','../quote/FindQuoteUI3.jsp','', 110,'25')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
					oCMenu.makeMenu('tabFind','tabInsured','&nbsp;Find Policy','../SearchPolicyDisplayActionUI3.do','', 110,'25','','','','')
				</dmshtml:dms_static_with_connector>
		 <%}else if(insType.equals("Health")){%>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuNewInsured','tabInsured','&nbsp;Add Employer Group','../AddCustomers.do?TabPanelName=Insured_Panel&clear=yes','', 110,'25')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_ADD_APPLICATION"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuNewInsured','tabInsured','&nbsp;Add Employer Group','../AddCustomersApplication.do?TabPanelName=Insured_Panel&clear=yes','', 110,'25')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuFindInsured','tabInsured','&nbsp;Find Employer Group','../FindCustomers.do?TabPanelName=Insured_Panel&clear=yes','', 110,'25')
					<li><a href="../FindCustomers.do?clear=yes">Find Employer Group</a>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuGetInsured','tabInsured','&nbsp;Employer Detail','../GetCustomerAction.do?TabPanelName=Insured_Panel','', 110,'25')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CENSUS"}%>' connector='or' negated="true">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER"}%>' connector='or' negated="false">
	oCMenu.makeMenu('menuGetRisk','tabInsured','&nbsp;Employee Detail','../GetEmployerHome.do?TabPanelName=Insured_Panel','', 110,'25')
				</dmshtml:dms_static_with_connector>
			</dmshtml:dms_static_with_connector>
		<%} else if(insType.equals("Professional Liability")) {%>
			<!-- Insured Management Menu building -->
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_CUSTOMER_DETAILS"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuGetInsured','tabInsured','&nbsp;Insured Details','../GetInsuredAction.do?customerId=<%=strPrimObjId%>','', 110,'25')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuNewInsured','tabInsured','&nbsp;New Insured','../AddInsured.do?clear=yes','', 110,'25')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
	oCMenu.makeMenu('menuNewInsured','tabInsured','&nbsp;Find Insured','./FindInsuredUI3.do?clear=yes','', 110,'25')
			</dmshtml:dms_static_with_connector>
		<%} %>
<%	/* Menu ENDS here */  %>
</dmshtml:dms_static_with_connector>
