<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>


<%
String strDomainName="";
strDomainName=""+request.getServerName();
%>

<table width="100%" border="0" class="menulinkshome" cellspacing="0">
	<tr>
		<td class="menulinkshome" width="50%" height="45" align="center" valign="MIDDLE">

			<dmshtml:dms_static ruleName="role" property="SYS-ADMIN" negated="true">
				<a href="../Home/AdminHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			<dmshtml:dms_static ruleName="role" property="ADMIN" negated="true">
				<a href="../Home/AdminHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>
			
			<dmshtml:dms_static ruleName="role" property="UNDERWRITER" negated="true">
				<a href="../Home/UnderwriterHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			<dmshtml:dms_static ruleName="role" property="EMPLOYEE" negated="true">
				<a href="../Home/UnderwriterHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			<dmshtml:dms_static ruleName="role" property="AGENT" negated="true">
				<a href="../Home/AgentHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			<dmshtml:dms_static ruleName="role" property="AGENCY_ADMIN" negated="true">
				<a href="../Home/AgentHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			<dmshtml:dms_static ruleName="role" property="AGENCY_EMPLOYEE" negated="true">
				<a href="../Home/AgentHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			<dmshtml:dms_static ruleName="role" property="GENERAL_ADMIN" negated="true">
				<a href="../Home/GeneralAgencyHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>
						
			<dmshtml:dms_static ruleName="role" property="GENERAL_EMPLOYEE" negated="true">
				<a href="../Home/GeneralAgencyHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			<dmshtml:dms_static ruleName="role" property="GENERAL_AGENT" negated="true">
				<a href="../Home/GeneralAgencyHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			<dmshtml:dms_static ruleName="role" property="SALESMANAGER" negated="true">
				<a href="../Home/SalesManagerHome.jsp" title="Go to the home page"><img border="0" src="../Images/home4.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.Home" /></a>
			</dmshtml:dms_static>

			
		</td>

		<td class="menulinkshome" height="25" align="center" valign="middle" >
			<a href="../LoginOutAction.do"  title="Log Off From The Application"><img border="0" src="../Images/logoff.jpg" width="18" height="18" ALT="">&nbsp;<bean:message key="AdminMenu.LogOff"/></a>
		</td>

	</tr>

</table>
<%String insType = (String)session.getAttribute("InsType"); %>
<%if(insType.equals("PC")) {%>
<!--|**START IMENUS**|imenus0,inline-->

<table width="100%" border="0"><tr><td>


<div class="imrcmain0 imgl" style="width: 198px; z-index: 999999; position: relative; "> <div class="imcm imde" id="imouter0">
	<ul id="imenus0">


		<!-- ************************************************************************************************************** --><!--
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UN-ASSIGNED_QUOTE_REQUESTS"}%>' connector='or' negated="true">

		  ****** Infinite Menus Structure & Links ***** 

			<li  style="width:100%;"><a href="../GaPoolDispAction.do?view=ga&formTemplVerId=-1&managerName=insurancebenicorp1pk/insurancequote1wfp"><span class="imea imeam"></span>Un-Assigned Quote Requests</a>
			</li>

		</dmshtml:dms_static_with_connector>
		 ************************************************************************************************************** 



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"MY_QUOTE_REQUESTS"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../GaSelfDispAction.do?view=self&formTemplVerId=-1&managerName=insurancebenicorp1pk/insurancequote1wfp"><span class="imea imeam"></span>My Quote Requests</a>
			</li>
		</dmshtml:dms_static_with_connector>


		--><!-- ************************************************************************************************************** -->


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/GeneralAgencySubMenu.jsp"><span class="imea imeam"><span></span></span><bean:message key="AdminMenu.GeneralAgencies" /></a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
							<li><a href="../GeneralAgencyLink.do?clear=yes">Add General Agency</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindGenaralAgencyAction.do?clear=yes">Find General Agency</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/AgencySubMenu.jsp"><span class="imea imeam"><span></span></span>Agencies</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
							<li><a href="../AgencyLink.do?clear=yes">Add Agency</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindAgencyAction.do?clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/AgentSubMenu.jsp"><span class="imea imeam"><span></span></span>Agents</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENT_MENU"}%>' connector='or' negated="true">
							<li><a href="../AddAgents.do?clear=yes">Add Agent</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENT_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindAgent.do?clear=yes">Find Agent</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/SalesManagerSubMenu.jsp"><span class="imea imeam"><span></span></span>Sales Managers</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
							<li><a href="../AddSalesManager.do?clear=yes">Add Sales Manager</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindSalesManager.do?clear=yes">Find Sales Manager</a></li>
						</dmshtml:dms_static_with_connector>


						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_ALL_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
								<li><a href="../SearchSalesManager.do?answer(Entity::Equals::EntityType)=<%=URLEncoder.encode("%SALESMANAGER")%>&objectType=ENTITY&all=yes&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Show All Sales Managers</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
			<li  style="width:100%;"><a href="../Home/InsuredSubMenu.jsp"><span class="imea imeam"><span></span></span>Insured</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
							<li><a href="../AddInsured.do?clear=yes">Add Insured</a></li>
						</dmshtml:dms_static_with_connector>
							
		
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindInsured.do?clear=yes">Find Insured</a></li>
						</dmshtml:dms_static_with_connector>
		
				<!-- <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTACHMENT_MENU"}%>' connector='or' negated="true">
					<li><a href=../FindAttachments.do?clear=yes">Find Attachments</a></li>
				</dmshtml:dms_static_with_connector> -->
		</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/QuoteSubMenu.jsp"><span class="imea imeam"><span></span></span>Quote</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
							<li><a href="../quote/FindQuote.jsp">Find Quote</a></li>
						</dmshtml:dms_static_with_connector>
						
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
							<li><a href="/QuickquoteRiskAddAction.do"clear=yes">Quick Quote</a></li>
						</dmshtml:dms_static_with_connector>
									

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>





		<!-- ************************************************************************************************************** -->

		<!-- ************************************************************************************************************** -->


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_MENU"}%>' connector='or' negated="true">
	
			<li  style="width:100%;"><a href="../Home/PolicySubMenu.jsp"><span class="imea imeam"><span></span></span>Policy</a>
	
				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">
	
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"POLICY_FIND"}%>' connector='or' negated="true">
							<li><a href="/SearchPolicyDisplayAction.do">Find Policy</a></li>
						</dmshtml:dms_static_with_connector>
									
	
					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>
		
		<!-- ************************************************************************************************************** -->
		

		<!-- ************************************** Product Management ********************************************** -->


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/ProductsSubMenu.jsp"><span class="imea imeam"><span></span></span>Product Management</a>

				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OPTIONS__MENU"}%>' connector='or' negated="true">
					<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
						<ul style="">
							<li><a href="../Home/OptionsSubMenu.jsp"><span class="imea imeas"><span></span></span>Options</a>
	
								<div class="imsc"><div class="imsubc" style="width:137px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
		                       							 <li><a href="../AddOptions.do">Add Options</a></li>
										</dmshtml:dms_static_with_connector>
		                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindOptions.do">Find Options</a></li>
										</dmshtml:dms_static_with_connector>
		
		
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
											<li><a href="/SearchOptions.do">Show All Options</a></li>
										</dmshtml:dms_static_with_connector>
               					 			</ul>
               							</div></div>
               						</li>
               					

						</dmshtml:dms_static_with_connector>


						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FACTORS__MENU"}%>' connector='or' negated="true">
                					<li><a href="../Home/FactorsSubMenu.jsp"><span class="imea imeas"><span></span></span>Factors</a>

               							 <div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
	               							 <ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
	                      							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FACTORS__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddFactor.do?clear=yes">Add Factors</a></li>
										</dmshtml:dms_static_with_connector>
						
	
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindFactor.do?clear=yes">Find Factors</a></li>
										</dmshtml:dms_static_with_connector>
	
	
	
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindFactor.do">Show All Factors</a></li>
										</dmshtml:dms_static_with_connector>
               								 </ul>
               							</div></div>
               						</li>
						</dmshtml:dms_static_with_connector>

<!-- **********************************Application Menu***************************************** -->

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">           
							 
							<li><a href="../application/ApplicationSubMenu.jsp"><span class="imea imeas"><span></span></span>Applications</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
									
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddAttribute.do?clear=yes">Add Attributes</a></li>
										</dmshtml:dms_static_with_connector>
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindAttribute.do?clear=yes">Find Attributes</a></li>
										</dmshtml:dms_static_with_connector>
										
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddSubApplication.do?clear=yes">Add SubApplications</a></li>
										</dmshtml:dms_static_with_connector>									
				
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindSubApplication.do?clear=yes">Find SubApplications</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddApplication.do?clear=yes">Add Applications</a></li>
										</dmshtml:dms_static_with_connector>									
				
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindApplication.do?clear=yes">Find Applications</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
						
												
				   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT__MENU"}%>' connector='or' negated="true">             
							 
							<li><a href="../Home/DocumentDefinitionSubMenu.jsp"><span class="imea imeas"><span></span></span>Documents</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_DOCUMENT__MENU"}%>' connector='or' negated="true">
												<li><a href="../AddDocumentDefinitionAction.do?clear=yes">Add Document</a></li>
										</dmshtml:dms_static_with_connector>
										
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindDocumentDefinitionAction.do?clear=yes">Find Document</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>						

						 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
							<li  style="width:100%;"><a href="../Home/ProductsSubMenu.jsp"><span class="imea imeas"><span></span></span>Products</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">


										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddProduct.do?clear=yes">Add Products</a></li>
										</dmshtml:dms_static_with_connector>
											
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindProduct.do?clear=yes">Find Products</a></li>
										</dmshtml:dms_static_with_connector>
	
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindProduct.go">Show All Products</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li><a href="../ProductStateLevel.go?">Product State Level</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
						
						
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FEE_MENU"}%>' connector='or' negated="true">           
							 
							<li><a href="../Home/FeesSubMenu.jsp"><span class="imea imeas"><span></span></span>Fees</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
									
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FEE_MENU"}%>' connector='or' negated="true">
												<li><a href="../feedefinition/AddFees.jsp?clear=yes">Add Fee</a></li>
									</dmshtml:dms_static_with_connector>
										
	
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FEE_MENU"}%>' connector='or' negated="true">
											<li><a href="../FindFeeDefinitionAction.do?clear=yes">Find Fee</a></li>
									</dmshtml:dms_static_with_connector>
									
									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
						
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"TAX_MENU"}%>' connector='or' negated="true">           
							 
							<li><a href="../Home/TaxSubMenu.jsp"><span class="imea imeas"><span></span></span>Taxes</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
									
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_TAX_MENU"}%>' connector='or' negated="true">
												<li><a href="../taxdefinition/AddTaxDefinition.jsp?clear=yes">Add Tax</a></li>
									</dmshtml:dms_static_with_connector>
										
	
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_TAX_MENU"}%>' connector='or' negated="true">
											<li><a href="../taxdefinition/FindTaxDefinition.jsp?clear=yes">Find Tax</a></li>
									</dmshtml:dms_static_with_connector>
									
									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
						
						
					  
				   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">             
							 
							<li><a href="../Home/ProductGroupSubMenu.jsp"><span class="imea imeas"><span></span></span>Product Groups</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../product/AddProductGroup.jsp?clear=yes">Add Product Groups</a></li>
										</dmshtml:dms_static_with_connector>
										
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../product/FindProductGroup.jsp?clear=yes">Find Product Groups</a></li>
										</dmshtml:dms_static_with_connector>
		
		
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindProductGroup.go">Show All Product Groups</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>


						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">             
							 
							<li><a href="../Home/ProductGroupSubMenu.jsp"><span class="imea imeas"><span></span></span>Rule Groups</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../product/AddRuleGroup.jsp?clear=yes">Add Rule Groups</a></li>
										</dmshtml:dms_static_with_connector>
										
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../product/FindRuleGroup.jsp?clear=yes">Find Rule Groups</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
	
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">             
							 
							<li><a href="../Home/ProductGroupSubMenu.jsp"><span class="imea imeas"><span></span></span>Formula Groups</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../product/AddFormulaGroup.jsp?clear=yes">Add Formula Groups</a></li>
										</dmshtml:dms_static_with_connector>
										
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../product/FindFormulaGroup.jsp?clear=yes">Find Formula Groups</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>
		
		
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../documents/Documents.jsp"><span class="imea imeam"><span></span></span>Documents</a>


				<%if((strDomainName.indexOf("benicorp")>=0) || (strDomainName.indexOf("mica")>=0))
				{%>
	
					<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
						<ul style="">
	
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
	
								<li><a href="../documents/AdminForms.jsp">Administrative Forms</a></li>
								<li><a href="../documents/BenefitAndContact.jsp">Benefit Summary & Contact Info</a></li>
	
	
	
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaCommissionDocuments.jsp">Commission Documents</a></li>
								<%}%>
	
	
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaDental.jsp">Dental</a></li>
								<%}%>
	
	
								<li><a href="../documents/EmployeeEnrollForms.jsp">Employee Enrollment Forms</a></li>
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaEmployerEgieements.jsp">Employer Agreements</a></li>
								<%}%>
	
	
								<li><a href="../documents/ExperienceRatingKit.jsp">Experience Rating Kit</a></li>
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaHealthDialog.jsp">Health Dialog</a></li>
								<%}%>
	
	
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaImportantUpdates.jsp">Important Updates</a></li>
								<%}%>
	
	
								<li><a href="../documents/Newsletters.jsp">Newsletters</a></li>
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaPolarExpressAgents.jsp">Polar Express Agents</a></li>
								<%}%>
	
	
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
						
									<li><a href="../documents/MicaPrescriptionMedicationInformation.jsp"><span class="imea imeas"><span></span></span>Prescription Medication Information</a>
			
										<div class="imsc"><div class="imsubc" style="width:137px;top:-23px;left:217px;">
											<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
												<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
													<li>
													
														<a href="../documents/MicaMailOrderPrescriptions.jsp">Mail Order Prescriptions</a>
													</li>
												</dmshtml:dms_static_with_connector>
										
											</ul>
										</div></div>
									</li>
									
								<%}%>
	
	
								<li><a href="../documents/ProductBrochures.jsp">Product Brochures</a></li>
	
								<!-- items are commonly available for all users. -->
								<li><a href="../documents/AgentInfo.jsp">Agent Information</a></li>
						
								<li><a href="../documents/DrugPriorAuthList.jsp">Drug Prior Authorization List</a></li>
								
			
								<!-- item is available only for benicorp users. -->
								<%if(strDomainName.indexOf("benicorp")>=0)
								{%>
									<li><a href="../documents/EmployerAgreements.jsp">Financial Brochures</a></li>
								<%}%>
			
			
			
								<!-- item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/IL_Enroll_Forms.jsp">Illinois Enrollment Forms</a></li>
								<%}%>
			
	
	
								<!-- item is available only for benicorp users. -->
								<%if(strDomainName.indexOf("benicorp")>=0)
								{%>
									<li><a href="../documents/ClaimDirections.jsp">Online Claim Directions</a></li>
								<%}%>
			
			
							
								<!-- item is available only for benicorp users. -->
								<%if(strDomainName.indexOf("benicorp")>=0)
								{%>
								<li><a href="../documents/SpanishEnrollForms.jsp">Spanish Enrollment Forms</a></li>
								<li><a href="../documents/UWHealthQuestion.jsp">Underwriting Health Questionnaires</a></li>
								<%}%>
						
	
							</dmshtml:dms_static_with_connector>			
	
	
						</ul>
					</div></div>
				<%}%>
			</li>
		</dmshtml:dms_static_with_connector>



		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/UserAccountSubMenu.jsp"><span class="imea imeam"><span></span></span>User Accounts</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_USER_MENU"}%>' connector='or' negated="true">
							<li><a href="../AddUserAccountLink.do?clear=yes">Add User Accounts</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindUsers.do?clear=yes">Find User Accounts</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>



		<!-- ************************************************************************************************************** -->
		
		<!-- *******************************************Search Email************************************************ --><!--


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/EmailMenu.jsp"><span class="imea imeam"><span></span></span>E-Mail</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
							<li><a href="../email/FindEmail.jsp">Find Email</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		--><!-- ************************************************************************************************************** -->

		



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LOGGED_IN_USERS_MENU"}%>' connector='or' negated="true">
		
			<li  style="width:100%;"><a href="../NonInvalidatedUserLogs.do?ownerId=2"><span class="imea imeam"></span>Logged In Users</a>
				
			</li>
		</dmshtml:dms_static_with_connector>



		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_EXPORT_MENU"}%>' connector='or' negated="true">
		
			<li  style="width:100%;"><a><span class="imea imeam"><span></span></span>Data Export</a>
		
				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">

				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>
		
		
		<!-- ************************************************************************************************************** -->
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_IMPORT_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="/Home/DataImportSubMenu.jsp" ><span class="imea imeam"><span></span></span>Data Import</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_UPLOAD_MENU"}%>' connector='or' negated="true">
							<li><a href="../dataimport/AgencyImport.jsp">Agency-Upload</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_UPLOAD_MENU"}%>' connector='or' negated="true">
							<li><a href="../dataimport/AgentImport.jsp">Agent Upload</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>
		<!--  -->
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEBSERVICE_VIEW"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/WebServiceSubMenu.jsp"><span class="imea imeam"><span></span></span>Webservice</a>

				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
					<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
						<ul style="">
							<li><a href="../webservice/FindSubmission.jsp"><span class="imea imeas"><span></span></span>Submission</a>
	
								<div class="imsc"><div class="imsubc" style="width:137px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
		                      					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
											<li><a href="../webservice/FindSubmission.jsp">Find Submission</a></li>
										</dmshtml:dms_static_with_connector>
										
               					 			</ul>
               							</div></div>
               						</li>
               					

						</dmshtml:dms_static_with_connector>
						
						 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
							<li  style="width:100%;"><a href="../webservice/FindBilling.jsp"><span class="imea imeas"><span></span></span>Billing</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">

										
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
											<li><a href="../webservice/FindBilling.jsp">Find Billing</a></li>
										</dmshtml:dms_static_with_connector>
										
									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
			</li>
		</dmshtml:dms_static_with_connector>
		
		<!--  -->
		
		

		<!-- ************************************************************************************************************** -->
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_PASSWORD"}%>' connector='or' negated="true">
		
			<li  style="width:100%;"><a href="../ChangePassword.do?entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>"><span class="imea imeam"></span>Change Password</a>
				
			</li>
		</dmshtml:dms_static_with_connector>

		<!-- ************************************************************************************************************** -->



	</ul>
	<div class="imclear">&nbsp;
	</div>
</div></div>
<!--|**END IMENUS**|-->
</td></tr>
<!-- ************************** Included Script Tag ************************* -->
<tr><td><script src="../Scripts/JScripts/menuscript.js" type="text/javascript"></script></td></tr>
</table>

<%} else if(insType.equals("Health")){%>



<table width="100%" border="0"><tr><td>

<bean:define id="roleId" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session"/>
<div class="imrcmain0 imgl" style="width: 198px; z-index: 999999; position: relative; "> <div class="imcm imde" id="imouter0">
	<ul id="imenus0">
	
		<!-- ************************************************************************************************************** -->


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/GeneralAgencySubMenu.jsp"><span class="imea imeam"><span></span></span><bean:message key="AdminMenu.GeneralAgencies" /></a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
							<li><a href="../GeneralAgencyLink.do?clear=yes">Add General Agency</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindGenaralAgencyAction.do?clear=yes">Find General Agency</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/AgencySubMenu.jsp"><span class="imea imeam"><span></span></span>Agencies</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
							<li><a href="../AgencyLink.do?clear=yes">Add Agency</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindAgencyAction.do?clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/AgentSubMenu.jsp"><span class="imea imeam"><span></span></span>Agents</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENT_MENU"}%>' connector='or' negated="true">
							<li><a href="../AddAgents.do?clear=yes">Add Agent</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENT_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindAgent.do?clear=yes">Find Agent</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/SalesManagerSubMenu.jsp"><span class="imea imeam"><span></span></span>Sales Managers</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
							<li><a href="../AddSalesManager.do?clear=yes">Add Sales Manager</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindSalesManager.do?clear=yes">Find Sales Manager</a></li>
						</dmshtml:dms_static_with_connector>


						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_ALL_SALES_MANAGER_MENU"}%>' connector='or' negated="true">
								<li><a href="../SearchSalesManager.do?answer(Entity::Equals::EntityType)=<%=URLEncoder.encode("%SALESMANAGER")%>&objectType=ENTITY&all=yes&LimitSearch=yes&answer(Object::Entity::PageNum)=0&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID">Show All Sales Managers</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
			<li  style="width:100%;"><a href="../Home/EmployergroupsSubMenu.jsp"><span class="imea imeam"><span></span></span>Employer Groups</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
							<li><a href="../AddCustomers.do?clear=yes">Add Employer Group</a></li>
						</dmshtml:dms_static_with_connector>
						
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_ADD_APPLICATION"}%>' connector='or' negated="true">
							<li><a href="../AddCustomersApplication.do?clear=yes">Add Employer Group</a></li>
						</dmshtml:dms_static_with_connector>					
							
		
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindCustomers.do?clear=yes">Find Employer Group</a></li>
						</dmshtml:dms_static_with_connector>
		
			

			
		


				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTACHMENT_MENU"}%>' connector='or' negated="true">
					<li><a href=../FindAttachments.do?clear=yes">Find Attachments</a></li>
				</dmshtml:dms_static_with_connector>
		</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>

		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SEARCH_QUOTE"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/QuoteSubMenuHealth.jsp"><span class="imea imeam"><span></span></span>Quote</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_MENU"}%>' connector='or' negated="true">
							<li><a href="../quote/FindQuote.jsp">Find Quote</a></li>
						</dmshtml:dms_static_with_connector>
									

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>





		<!-- ************************************************************************************************************** -->

		<!-- ************************************** Product Management ********************************************** -->


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/ProductsSubMenu.jsp"><span class="imea imeam"><span></span></span>Product Management</a>

				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OPTIONS__MENU"}%>' connector='or' negated="true">
					<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
						<ul style="">
							<li><a href="../Home/OptionsSubMenu.jsp"><span class="imea imeas"><span></span></span>Option</a>
	
								<div class="imsc"><div class="imsubc" style="width:137px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
		                       							 <li><a href="../AddOptions.do">Add Option</a></li>
										</dmshtml:dms_static_with_connector>
		                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindOptions.do">Find Option</a></li>
										</dmshtml:dms_static_with_connector>
		
		
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
											<li><a href="/SearchOptions.do">Show All Options</a></li>
										</dmshtml:dms_static_with_connector>
               					 			</ul>
               							</div></div>
               						</li>
               					

						</dmshtml:dms_static_with_connector>


						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FACTORS__MENU"}%>' connector='or' negated="true">
                					<li><a href="../Home/FactorsSubMenu.jsp"><span class="imea imeas"><span></span></span>Factor</a>

               							 <div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
	               							 <ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
	                      							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FACTORS__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddFactor.do?clear=yes">Add Factor</a></li>
										</dmshtml:dms_static_with_connector>
						
	
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindFactor.do?clear=yes">Find Factor</a></li>
										</dmshtml:dms_static_with_connector>
	
	
	
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_FACTORS__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindFactor.do">Show All Factors</a></li>
										</dmshtml:dms_static_with_connector>
               								 </ul>
               							</div></div>
               						</li>
						</dmshtml:dms_static_with_connector>
						<!-- **********************************Application Menu***************************************** -->

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">           
							 
							<li><a href="../application/ApplicationSubMenu.jsp"><span class="imea imeas"><span></span></span>Applications</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
									
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddAttribute.do?clear=yes">Add Attributes</a></li>
										</dmshtml:dms_static_with_connector>
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindAttribute.do?clear=yes">Find Attributes</a></li>
										</dmshtml:dms_static_with_connector>
										
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddSubApplication.do?clear=yes">Add SubApplications</a></li>
										</dmshtml:dms_static_with_connector>									
				
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindSubApplication.do?clear=yes">Find SubApplications</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddApplication.do?clear=yes">Add Applications</a></li>
										</dmshtml:dms_static_with_connector>									
				
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindApplication.do?clear=yes">Find Applications</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
						

						 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
							<li  style="width:100%;"><a href="../Home/ProductSubMenu.jsp"><span class="imea imeas"><span></span></span>Products</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../AddProduct.do?clear=yes">Add Product</a></li>
										</dmshtml:dms_static_with_connector>
											
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindProduct.do?clear=yes">Find Product</a></li>
										</dmshtml:dms_static_with_connector>
	
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindProduct.go">Show All Products</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
   
				   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">             
							 
							<li><a href="../Home/ProductGroupSubMenu.jsp"><span class="imea imeas"><span></span></span>Product Group</a>

								<div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
									<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../product/AddProductGroup.jsp?clear=yes">Add Product Group</a></li>
										</dmshtml:dms_static_with_connector>
										
	
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../product/FindProductGroup.jsp?clear=yes">Find Product Group</a></li>
										</dmshtml:dms_static_with_connector>
		
		
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../FindProductGroup.go">Show All Product Groups</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div></div>
							</li>
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT__MENU"}%>' connector='or' negated="true">             
        
       <li><a href="../Home/DocumentDefinitionSubMenu.jsp"><span class="imea imeas"><span></span></span>Documents</a>

        <div class="imsc"><div class="imsubc" style="width:220px;top:-23px;left:217px;">
         <ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
          <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_DOCUMENT__MENU"}%>' connector='or' negated="true">
           <li><a href="../AddDocumentDefinitionAction.do?clear=yes">Add Document</a></li>
          </dmshtml:dms_static_with_connector>
          
 
          <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
           <li><a href="../FindDocumentDefinitionAction.do?clear=yes">Find Document</a></li>
          </dmshtml:dms_static_with_connector>

         </ul>
        </div></div>
       </li>
      </dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>
		

		<!-- ************************************************************************************************************** -->



		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
		
				<%if((strDomainName.indexOf("benicorp")>=0) || ((strDomainName.indexOf("mica")>=0) && roleId.equals("ADMIN")))
				{%>
					<li  style="width:100%;"><a href="../documents/Documents.jsp"><span class="imea imeam"><span></span></span>Documents</a>
				<%}else{ %>
					<li  style="width:100%;"><a><span class="imea imeam"><span></span></span>Documents</a>
				<%} %>
				<%if((strDomainName.indexOf("benicorp")>=0) || ((strDomainName.indexOf("mica")>=0) && roleId.equals("ADMIN")))
				{%>
										
					<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
						<ul style="">
	
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
	
								<li><a href="../documents/AdminForms.jsp">Administrative Forms</a></li>
								<li><a href="../documents/BenefitAndContact.jsp">Benefit Summary & Contact Info</a></li>
	
	
	
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaCommissionDocuments.jsp">Commission Documents</a></li>
								<%}%>
	
	
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaDental.jsp">Dental</a></li>
								<%}%>
	
	
								<li><a href="../documents/EmployeeEnrollForms.jsp">Employee Enrollment Forms</a></li>
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaEmployerEgieements.jsp">Employer Agreements</a></li>
								<%}%>
	
	
								<li><a href="../documents/ExperienceRatingKit.jsp">Experience Rating Kit</a></li>
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaHealthDialog.jsp">Health Dialog</a></li>
								<%}%>
	
	
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaImportantUpdates.jsp">Important Updates</a></li>
								<%}%>
	
	
								<li><a href="../documents/Newsletters.jsp">Newsletters</a></li>
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/MicaPolarExpressAgents.jsp">Polar Express Agents</a></li>
								<%}%>
	
	
	
	
								<!-- DENTAL Menu item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
						
									<li><a href="../documents/MicaPrescriptionMedicationInformation.jsp"><span class="imea imeas"><span></span></span>Prescription Medication Information</a>
			
										<div class="imsc"><div class="imsubc" style="width:137px;top:-23px;left:217px;">
											<ul style="BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BORDER-LEFT-WIDTH: 1px; BORDER-LEFT-COLOR: #c0d8f5; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0d8f5; PADDING-BOTTOM: 0px; BORDER-TOP-COLOR: #c0d8f5; PADDING-TOP: 0px; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0d8f5;">
												<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT_MENU"}%>' connector='or' negated="true">
													<li>
													
														<a href="../documents/MicaMailOrderPrescriptions.jsp">Mail Order Prescriptions</a>
													</li>
												</dmshtml:dms_static_with_connector>
										
											</ul>
										</div></div>
									</li>
									
								<%}%>
	
	
								<li><a href="../documents/ProductBrochures.jsp">Product Brochures</a></li>
	
								<!-- items are commonly available for all users. -->
								<li><a href="../documents/AgentInfo.jsp">Agent Information</a></li>
						
								<li><a href="../documents/DrugPriorAuthList.jsp">Drug Prior Authorization List</a></li>
								
			
								<!-- item is available only for benicorp users. -->
								<%if(strDomainName.indexOf("benicorp")>=0)
								{%>
									<li><a href="../documents/EmployerAgreements.jsp">Financial Brochures</a></li>
								<%}%>
			
			
			
								<!-- item is available only for mica users. -->
								<%if(strDomainName.indexOf("mica")>=0)
								{%>
									<li><a href="../documents/IL_Enroll_Forms.jsp">Illinois Enrollment Forms</a></li>
								<%}%>
			
	
	
								<!-- item is available only for benicorp users. -->
								<%if(strDomainName.indexOf("benicorp")>=0)
								{%>
									<li><a href="../documents/ClaimDirections.jsp">Online Claim Directions</a></li>
								<%}%>
			
			
							
								<!-- item is available only for benicorp users. -->
								<%if(strDomainName.indexOf("benicorp")>=0)
								{%>
								<li><a href="../documents/SpanishEnrollForms.jsp">Spanish Enrollment Forms</a></li>
								<li><a href="../documents/UWHealthQuestion.jsp">Underwriting Health Questionnaires</a></li>
								<%}%>
						
	
							</dmshtml:dms_static_with_connector>			
	
	
						</ul>
					</div></div>
				<%}%>
			</li>
		</dmshtml:dms_static_with_connector>



		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../Home/UserAccountSubMenu.jsp"><span class="imea imeam"><span></span></span>User Accounts</a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_USER_MENU"}%>' connector='or' negated="true">
							<li><a href="../AddUserAccountLink.do?clear=yes">Add User Accounts</a></li>
						</dmshtml:dms_static_with_connector>
					

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
							<li><a href="../FindUsers.do?clear=yes">Find User Accounts</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>



		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LOGGED_IN_USERS_MENU"}%>' connector='or' negated="true">
		
			<li  style="width:100%;"><a href="../NonInvalidatedUserLogs.do?ownerId=2"><span class="imea imeam"></span>Logged In Users</a>
				
			</li>
		</dmshtml:dms_static_with_connector>



		<!-- ************************************************************************************************************** -->



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_EXPORT_MENU"}%>' connector='or' negated="true">
		
			<li  style="width:100%;"><a href="../Home/DataExportSubMenu.jsp"><span class="imea imeam"><span></span></span>Data Export</a>
		
				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">
		
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_RATECARD_MENU"}%>' connector='or' negated="true">
							<li><a href="../export/RateCard.jsp">Renewal Rate Card</a></li>
						</dmshtml:dms_static_with_connector>
											
		
					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->
		
		
		<!-- *******************************************Search Email************************************************ -->


		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_MENU"}%>' connector='or' negated="true">

			<li  style="width:100%;"><a href="../email/FindEmail.jsp">Test<span class="imea imeam"><span></span></span></a>

				<div class="imsc"><div class="imsubc" style="width:220px;top:-28px;left:198px;">
					<ul style="">

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
							<li><a href="">Find Email</a></li>
						</dmshtml:dms_static_with_connector>

					</ul>
				</div></div>
			</li>
		</dmshtml:dms_static_with_connector>


		<!-- ************************************************************************************************************** -->

		



		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_PASSWORD"}%>' connector='or' negated="true">
		
			<li  style="width:100%;"><a href="../ChangePassword.do?entityId=<%=strPrimObjId%>&objectType=<%=strPrimObjType%>"><span class="imea imeam"></span>Change Password</a>
				
			</li>
		</dmshtml:dms_static_with_connector>

		<!-- ************************************************************************************************************** -->



	</ul>
	<div class="imclear">&nbsp;
	</div>
</div></div>
<!--|**END IMENUS**|-->
</td></tr>
<!-- ************************** Included Script Tag ************************* -->
<tr><td><script src="../Scripts/JScripts/menuscript.js" type="text/javascript"></script></td></tr>
</table>
<%}%>