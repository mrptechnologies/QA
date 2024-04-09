<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.URLEncoder" %>
<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
<%String insType = (String)session.getAttribute("InsType"); %>
<%String strSalesManager = URLEncoder.encode("%SALESMANAGER"); %>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MANAGE_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('tabManage','','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manage','','','82','26','','')
	<% /* Manager Menu Begins here: adding Manage menu items  */ %>
		<% /* WebServices Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">	
			oCMenu.makeMenu('menuWebService','tabManage','&nbsp;WebService','','', 150,'25','','','','')
				
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"TREATY_HOLD_MENU"}%>' connector='or' negated="true">						
					 oCMenu.makeMenu('menuTreatyHold','menuWebService','Treaty Hold','../GetTreatyHold.do','', 215,'26')
			    </dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
					 oCMenu.makeMenu('menuTestGetDataFeed','menuWebService','Invoke GetDataFeed','../webservice/TestWebService.jsp','', 215,'26')
			    </dmshtml:dms_static_with_connector>
			    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
					 oCMenu.makeMenu('menuTestInWebServiceUpdateTrans','menuWebService','Invoke UpdateProcessTrans','../webservice/TestUpdateTrans.jsp','', 215,'26')
			    </dmshtml:dms_static_with_connector>
			    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
			 	     oCMenu.makeMenu('menuOutBoundTransactions','menuWebService','Find OutBound Transactions','../webservice/FindOutBoundTransactions.jsp','', 215,'26') 
			    </dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
			 		 oCMenu.makeMenu('menuGetDataFeedXML','menuWebService','GetDataFeed Batch sent to Genius','../webservice/FindOutBoundGetDataFeedXML.jsp','', 215,'26')
			    </dmshtml:dms_static_with_connector>	
			    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">      
			 		 oCMenu.makeMenu('menuGetDataFeedTransactions','menuWebService','GetDataFeed Batch Records sent','../webservice/FindOutBoundGetDataFeedTransactions.jsp','', 215,'26')
			    </dmshtml:dms_static_with_connector>  
			    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
			 		 oCMenu.makeMenu('menuUpdateProcessTrans','menuWebService','UpdateProcessedTrans Received','../webservice/FindOutBoundUpdateProcessTransTransaction.jsp','', 215,'26')
			    </dmshtml:dms_static_with_connector>	  
			    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEB_SERVICE_MENU"}%>' connector='or' negated="true">						
			 		 oCMenu.makeMenu('menuErrorProcessTrans','menuWebService','Outbound Transaction Error Received','../webservice/FindOutBoundProcessedErrorTransactions.jsp','', 215,'26')
			    </dmshtml:dms_static_with_connector>  	
	</dmshtml:dms_static_with_connector>
	<% /*  General Agency Management Menu building */ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuGenAgencies','tabManage','&nbsp;General Agencies','../Home/GeneralAgencySubMenu.jsp','', 150,'25','','','','')
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddGenAgencies','menuGenAgencies','&nbsp;Add General Agency','../GeneralAgencyLink.do?clear=yes','', 160,'25','','','','')
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindGenAgencies','menuGenAgencies','&nbsp;Find General Agency','../FindGenaralAgencyAction.do?clear=yes','', 160,'25','','','','')
		</dmshtml:dms_static_with_connector>
	</dmshtml:dms_static_with_connector>
	<% /*  Agency Management Menu building */ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAgencies','tabManage','&nbsp;Agencies','../Home/AgencySubMenu.jsp','', 150,'25','','','','')
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddAgencies','menuAgencies','&nbsp;Add Agency','../AgencyLink.do?clear=yes','', 160,'25','','','','')
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindAgencies','menuAgencies','&nbsp;Find Agency','../FindAgencyAction.do?clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID','', 160,'25','','','','')
		</dmshtml:dms_static_with_connector>
	</dmshtml:dms_static_with_connector>
	<% /*   Agent Management Menu building  */ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAgents','tabManage','&nbsp;Agents','../Home/AgentSubMenu.jsp','', 150,'25','','','','')
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENT_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddAgent','menuAgents','&nbsp;Add Agent','../AddAgents.do?clear=yes','', 160,'25','','','','')
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENT_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindAgent','menuAgents','&nbsp;Find Agent','../FindAgent.do?clear=yes','', 160,'25','','','','')
		</dmshtml:dms_static_with_connector>
	</dmshtml:dms_static_with_connector>
	<% /*   Sales Manager (CSR) Management Menu building */ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuSalesManager','tabManage','&nbsp;Sales Managers','../Home/SalesManagerSubMenu.jsp','', 150,'25','','','','')
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddSalesManager','menuSalesManager','&nbsp;Add Sales Manager','../AddSalesManager.do?clear=yes','', 150,'25','','','','')
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindSalesManager','menuSalesManager','&nbsp;Find Sales Manager','../FindSalesManager.do?clear=yes','', 150,'25','','','','')
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_ALL_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuShowAllSalesManagers','menuSalesManager','&nbsp;Show All Sales Managers','../SearchSalesManager.do?answer(Entity::Equals::EntityType)=<%=strSalesManager %>&objectType=ENTITY&all=yes&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID','', 150,'25','','','','')
		</dmshtml:dms_static_with_connector>
	</dmshtml:dms_static_with_connector>
	<% /*   Search Email  */ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuEmail','tabManage','&nbsp;E-Mail','../Home/EmailMenu.jsp','', 150,'25','','','','')
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindEmail','menuEmail','&nbsp;Find E-Mail','../email/FindEmail.jsp?clear=yes','', 150,'25','','','','')
		</dmshtml:dms_static_with_connector>
	</dmshtml:dms_static_with_connector>

	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_AUTO_PROCESS_EIL"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAutoProcesses','tabManage','&nbsp;Auto Processes','../Home/AutoProcessEIL.jsp','', 150,'25','','','','')	
		<dmshtml:dms_static_with_connector ruleName='privilage'	property='<%=new String[]{"VIEW_AUTO_PROCESS_EIL"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuRenewalOrOfferProcess','menuAutoProcesses','&nbsp;Renewal Process','../AutoRenewalDisplayAction.do','', 150,'25','','','','')
		</dmshtml:dms_static_with_connector>
	</dmshtml:dms_static_with_connector>

	<% /* Product Management Menu building */ %>
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProduct','tabManage','&nbsp;Product Management','../Home/ProductsSubMenu.jsp','', 150,'25','','','','')
		<% /* Optons Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OPTIONS__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductOptions','menuProduct','&nbsp;Options','../Home/OptionsSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddProductOptions','menuProductOptions','&nbsp;Add Options','../AddOptions.do','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindProductOptions','menuProductOptions','&nbsp;Find Options','../FindOptions.do','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuShowAllProductOptions','menuProductOptions','&nbsp;Show All Options','../SearchOptions.do','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /* Factors Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FACTORS__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductFactors','menuProduct','&nbsp;Factors','../Home/FactorsSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FACTORS__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddProductFactors','menuProductFactors','&nbsp;Add Factors','../AddFactor.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindProductFactors','menuProductFactors','&nbsp;Find Factors','../FindFactor.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuShowAllProductFactors','menuProductFactors','&nbsp;Show All Factors','../FindFactor.do','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /*  Application Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductApp','menuProduct','&nbsp;Applications','../application/ApplicationSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddProductAttr','menuProductApp','&nbsp;Add Attributes','../AddAttribute.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindProductAttr','menuProductApp','&nbsp;Find Attributes','../FindAttribute.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddSubApplication','menuProductApp','&nbsp;Add Sub Applications','../AddSubApplication.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindSubApplication','menuProductApp','&nbsp;Find Sub Applications','../FindSubApplication.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddApplication','menuProductApp','&nbsp;Add Applications','../AddApplication.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindApplication','menuProductApp','&nbsp;Find Applications','../FindApplication.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /* Product Documents/Forms Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductDocs','menuProduct','&nbsp;Documents','../Home/DocumentDefinitionSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_DOCUMENT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddDocs','menuProductDocs','&nbsp;Add Document','../AddDocumentDefinitionAction.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindDocs','menuProductDocs','&nbsp;Find Document','../FindDocumentDefinitionAction.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /* Products Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductDef','menuProduct','&nbsp;Products','../Home/ProductSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddProductDef','menuProductDef','&nbsp;Add Products','../AddProduct.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindProductDef','menuProductDef','&nbsp;Find Products','../FindProduct.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuShowAllProductDef','menuProductDef','&nbsp;Show All Products','../FindProduct.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /*  Product Group Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductGroupDef','menuProduct','&nbsp;Product Groups','../Home/ProductGroupSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddProductGroupDef','menuProductGroupDef','&nbsp;Add Product Groups','../product/AddProductGroup.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindProductGroupDef','menuProductGroupDef','&nbsp;Find Product Groups','../product/FindProductGroup.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuShowAllProductGroupDef','menuProductGroupDef','&nbsp;Show All Product Groups','../FindProductGroup.go','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /*  fees Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FEE_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductFee','menuProduct','&nbsp;Fees','../Home/FeesSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FEE_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductAddFee','menuProductFee','&nbsp;Add Fee','../feedefinition/AddFees.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductFindFee','menuProductFee','&nbsp;Find Fee','../FindFeeDefinitionAction.do?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /*   tax Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"TAX_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductTaxes','menuProduct','&nbsp;Taxes','../Home/TaxSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FEE_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductAddTaxes','menuProductTaxes','&nbsp;Add Tax','../taxdefinition/AddTaxDefinition.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductFindTaxes','menuProductTaxes','&nbsp;Find Tax','../taxdefinition/FindTaxDefinition.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /*   Rule Group Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductRule','menuProduct','&nbsp;Rule Groups','../Home/ProductGroupSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductAddRule','menuProductRule','&nbsp;Add Rule Groups','../product/AddRuleGroup.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductFindRule','menuProductRule','&nbsp;Find Rule Groups','../product/FindRuleGroup.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /* Formula Group Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductFormula','menuProduct','&nbsp;Formula Groups','../Home/ProductGroupSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductAddFormula','menuProductFormula','&nbsp;Add Formula Groups','../product/AddFormulaGroup.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuProductFindFormula','menuProductFormula','&nbsp;Find Formula Groups','../product/FindFormulaGroup.jsp?clear=yes','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /* Billing and Payment Menu building */ %>
oCMenu.makeMenu('menuProductBilling','menuProduct','&nbsp;Billing and Payment','../Home/BillingAndPaymentSubMenu.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductBillingType','menuProductBilling','&nbsp;Billing Type','../Home/BillingTypeSubMenu.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductAddBillingType','menuProductBillingType','&nbsp;Add Billing Type','../billing/AddBillingType.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductFindBillingType','menuProductBillingType','&nbsp;Find Billing Type','../billing/FindBillingType.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductShowBillingType','menuProductBillingType','&nbsp;Show All Billing Type','/FindBillingTypeAction.do','', 150,'25','','','','')
oCMenu.makeMenu('menuProductPaymentMethod','menuProductBilling','&nbsp;Payment Method','../Home/PaymentMethodSubMenu.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductAddPaymentMethod','menuProductPaymentMethod','&nbsp;Add Payment Method','../billing/AddPaymentMethod.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductFindPaymentMethod','menuProductPaymentMethod','&nbsp;Find Payment Method','../billing/FindPaymentMethod.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductShowAllPaymentMethod','menuProductPaymentMethod','&nbsp;Show All Payment Method','/FindPaymentMethodAction.do','', 150,'25','','','','')
oCMenu.makeMenu('menuProductInstall','menuProductBilling','&nbsp;Installment Type','../Home/InstallmentTypeSubMenu.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductAddInstall','menuProductInstall','&nbsp;Add Installment Type','../billing/AddInstallmentType.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductFindInstall','menuProductInstall','&nbsp;Find Installment Type','../billing/FindInstallmentType.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductShowAllInstall','menuProductInstall','&nbsp;Show All Installment Type','/FindInstallmentTypeAction.do','', 150,'25','','','','')
oCMenu.makeMenu('menuProductCurrency','menuProductBilling','&nbsp;Billing Currency','../Home/BillingCurrencySubMenu.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductAddCurrency','menuProductCurrency','&nbsp;Add Billing Currency','../billing/AddBillingCurrency.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductFindCurrency','menuProductCurrency','&nbsp;Find Billing Currency','../billing/FindBillingCurrency.jsp','', 150,'25','','','','')
oCMenu.makeMenu('menuProductShowAllCurrency','menuProductCurrency','&nbsp;Show All Billing Currency','/FindBillingCurrencyAction.do','', 150,'25','','','','')
		</dmshtml:dms_static_with_connector>
		<% /* User Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuUser','tabManage','&nbsp;User Accounts','../Home/UserAccountSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_USER_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddUser','menuUser','&nbsp;Add User Accounts','../AddUserAccountLink.do?clear=yes','', 185,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_EMPLOYEE_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddUser','menuUser','&nbsp;Add User Accounts','../user/AddRetailAgencyEmployee.jsp?clear=yes','', 185,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddUwUser','menuUser','&nbsp;Add Underwriter User Accounts','../AddUnderwriterEntities.do?clear=yes','', 185,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindUser','menuUser','&nbsp;Find User Accounts','../FindUsers.do?clear=yes','', 185,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_FIND_UNDERWRITER_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindUwUser','menuUser','&nbsp;Find Underwriter User Accounts','../FindUnderwriterUsers.do?clear=yes','', 185,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /* Alert Management Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEBSERVICE_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAlert','tabManage','&nbsp;Alert Management','../Home/AlertMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAlertDef','menuAlert','&nbsp;Alert Definition','../alert/AddAlertDefinition.jsp','', 115,'25','','','','')
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddAlertDef','menuAlertDef','&nbsp;Add Alert Definition','../alert/AddAlertDefinition.jsp','', 135,'25','','','','')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindAlertDef','menuAlertDef','&nbsp;Find Alert Definition','../alert/FindAlertDefinition.jsp','', 135,'25','','','','')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuDeleteAlertDef','menuAlertDef','&nbsp;Delete Alert Definition','../alert/DeleteAlertDefinition.jsp','', 135,'25','','','','')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuUpdateAlertDef','menuAlertDef','&nbsp;Update Alert Definition','../alert/SaveAlertDefinition.jsp','', 135,'25','','','','')
				</dmshtml:dms_static_with_connector>
oCMenu.makeMenu('menuAlertManage','menuAlert','&nbsp;Alert','../alert/AddAlertDefinition.jsp','', 115,'25','','','','')
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAddAlertManage','menuAlertManage','&nbsp;Add Alert','../alert/AddAlert.jsp','', 135,'25','','','','')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuFindAlertManage','menuAlertManage','&nbsp;Find Alert','../alert/FindAlert.jsp','', 135,'25','','','','')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuDeleteAlertManage','menuAlertManage','&nbsp;Delete Alert','../alert/DeleteAlert.jsp','', 135,'25','','','','')
				</dmshtml:dms_static_with_connector>
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuUpdateAlertManage','menuAlertManage','&nbsp;Update Alert','../alert/SaveAlert.jsp','', 135,'25','','','','')
				</dmshtml:dms_static_with_connector>
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /* Logged-in Users Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LOGGED_IN_USERS_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuLoggedUsers','tabManage','&nbsp;Logged In Users','../NonInvalidatedUserLogs.do','', 150,'25','','','','')
		</dmshtml:dms_static_with_connector>
		<% /* Data Export Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_EXPORT_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuExport','tabManage','&nbsp;Data Export','','', 150,'25','','','','')
		</dmshtml:dms_static_with_connector>
		<% /* Data Import Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_IMPORT_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuImport','tabManage','&nbsp;Data Import','/Home/DataImportSubMenu.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_UPLOAD_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAgencyImport','menuImport','&nbsp;Agency Upload','../dataimport/AgencyImport.jsp','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_UPLOAD_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuAgentImport','menuImport','&nbsp;Agent Upload','/../dataimport/AgentImport.jsp','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<% /* Clearance Import Menu building */ %>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_IMPORT_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuClearanceImport','tabManage','&nbsp;Clearance Import','/Home/ImportClearance.jsp','', 150,'25','','','','')
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_IMPORT_MENU"}%>' connector='or' negated="true">
oCMenu.makeMenu('menuClearanceImportFile','menuClearanceImport','&nbsp;Import Clearance File','../clearance/ImportClearance.jsp','', 150,'25','','','','')
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEBSERVICE_VIEW"}%>' connector='or' negated="true">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
					oCMenu.makeMenu('menuSubmissionWebService','tabManage','&nbsp;Find Submission XML','../webservice/FindSubmission.jsp','', 150,'25','','','','')

			</dmshtml:dms_static_with_connector>
			</dmshtml:dms_static_with_connector>
<%	/* Manage Menu ENDS here */  %>
</dmshtml:dms_static_with_connector>
<%	/* Manage Tab ENDS here */  %>
