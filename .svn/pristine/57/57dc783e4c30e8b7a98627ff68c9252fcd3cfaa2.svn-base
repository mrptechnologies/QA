<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.*" %>

<%String strPrimObjId=(String)session.getAttribute("PRIMARY_OBJECT_ID");%>
<%String strPrimObjType=(String)session.getAttribute("PRIMARY_OBJECT_TYPE");%>
<%String insType = (String)session.getAttribute("InsType"); %>


<%
String strDomainName="";
strDomainName=""+request.getServerName();
%>

<% /* Manager Menu Begins here: adding Manage menu items  */ %>
<div id="manageMenu" class="anylinkcss">
	<ul>

				<%if(insType.equals("PC")||insType.equals("Professional Liability")) {%>
					<!-- General Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/GeneralAgencySubMenu.jsp"><bean:message key="AdminMenu.GeneralAgencies" /></a>
						<div id="manage_tab_generalAgency" class="yuimenu">
							<div class="bd">
								<ul>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li><a href="../GeneralAgencyLink.do?clear=yes">Add General Agency</a></li>
									</dmshtml:dms_static_with_connector>

									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li><a href="../FindGenaralAgencyAction.do?clear=yes">Find General Agency</a></li>
									</dmshtml:dms_static_with_connector>
								</ul>
							</div>
						</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/AgencySubMenu.jsp">Agencies</a>
							<div id="manage_tab_agency" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
											<li><a href="../AgencyLink.do?clear=yes">Add Agency</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
											<li><a href="../FindAgencyAction.do?clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Agent Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/AgentSubMenu.jsp">Agents</a>
							<div id="manage_tab_agent" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENT_MENU"}%>' connector='or' negated="true">
											<li><a href="../AddAgents.do?clear=yes">Add Agent</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENT_MENU"}%>' connector='or' negated="true">
											<li><a href="../FindAgent.do?clear=yes">Find Agent</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Sales Manager (CSR) Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/SalesManagerSubMenu.jsp">Sales Managers</a>
							<div id="manage_tab_salesmanager" class="yuimenu">
								<div class="bd">
									<ul>
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
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>

					<!-- *******************************************Search Email************************************************ -->


					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/EmailMenu.jsp">E-Mail</a>
							<div id="manage_tab_Email" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_EMAIL_MENU"}%>' connector='or' negated="true">
											<li><a href="../email/FindEmail.jsp?clear=yes">Find E-Mail</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>


					<!-- ************************************************************************************************************** -->

					<!-- Product Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/ProductsSubMenu.jsp">Product Management</a>
							<div id="manage_tab_productManagement" class="yuimenu">
								<div class="bd">
									<ul>
										<!-- Optons Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OPTIONS__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/OptionsSubMenu.jsp">Options</a>
											<div id="options" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddOptions.do">Add Options</a></li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindOptions.do">Find Options</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../SearchOptions.do">Show All Options</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Factors Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FACTORS__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/FactorsSubMenu.jsp">Factors</a>
											<div id="factors" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
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
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Application Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../application/ApplicationSubMenu.jsp">Applications</a>
											<div id="applications" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddAttribute.do?clear=yes">Add Attributes</a></li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindAttribute.do?clear=yes">Find Attributes</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddSubApplication.do?clear=yes">Add Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindSubApplication.do?clear=yes">Find Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddApplication.do?clear=yes">Add Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindApplication.do?clear=yes">Find Applications</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Documents/Forms Management Menu building -->
								   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/DocumentDefinitionSubMenu.jsp">Documents</a>
											<div id="productdocuments" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_DOCUMENT__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddDocumentDefinitionAction.do?clear=yes">Add Document</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindDocumentDefinitionAction.do?clear=yes">Find Document</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Products Management Menu building -->
										 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/ProductSubMenu.jsp">Products</a>
											<div id="products" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddProduct.do?clear=yes">Add Products</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindProduct.do?clear=yes">Find Products</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindProduct.go">Show All Products</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Group Management Menu building -->
								   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/ProductGroupSubMenu.jsp">Product Groups</a>
											<div id="productGroups" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
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
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>


										<!--  fees Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FEE_MENU"}%>' connector='or' negated="true">
							 <li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/FeesSubMenu.jsp">Fees</a>
											<div id="fees" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FEE_MENU"}%>' connector='or' negated="true">
															<li><a href="../feedefinition/AddFees.jsp?clear=yes">Add Fee</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindFeeDefinitionAction.do?clear=yes">Find Fee</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
								</li>
						</dmshtml:dms_static_with_connector>

						<!--  tax Menu building -->
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"TAX_MENU"}%>' connector='or' negated="true">
							 <li class="yuimenuitem"><a class="yuimenuitemlabel" href="../Home/TaxSubMenu.jsp">Taxes</a>
											<div id="tax" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_FEE_MENU"}%>' connector='or' negated="true">
															<li><a href="../taxdefinition/AddTaxDefinition.jsp?clear=yes">Add Tax</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../taxdefinition/FindTaxDefinition.jsp?clear=yes">Find Tax</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
								</li>
						</dmshtml:dms_static_with_connector>




										<!-- Rule Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/ProductGroupSubMenu.jsp">Rule Groups</a>
											<div id="ruleGroups" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../product/AddRuleGroup.jsp?clear=yes">Add Rule Groups</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../product/FindRuleGroup.jsp?clear=yes">Find Rule Groups</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Formula Group Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/ProductGroupSubMenu.jsp">Formula Groups</a>
											<div id="formulaGroups" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../product/AddFormulaGroup.jsp?clear=yes">Add Formula Groups</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../product/FindFormulaGroup.jsp?clear=yes">Find Formula Groups</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Optons Management Menu building -->
											<li><a href="../Home/BillingAndPaymentSubMenu.jsp">Billing and Payment</a>
											<div id="billingAndPayment" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../Home/BillingTypeSubMenu.jsp">Billing Type</a>
																<div id="billingType" class="yuimenu">
																	<div class="bd">
																		<ul class="first-of-type">
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="../billing/AddBillingType.jsp">Add Billing Type</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="../billing/FindBillingType.jsp">Find Billing Type</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="/FindBillingTypeAction.do">Show All Billing Type</a></li>
																			</dmshtml:dms_static_with_connector>
																		</ul>
																	</div>
																</div>
															</li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../Home/PaymentMethodSubMenu.jsp">Payment Method</a>
																<div id="paymentMethod" class="yuimenu">
																	<div class="bd">
																		<ul class="first-of-type">
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="../billing/AddPaymentMethod.jsp">Add Payment Method</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="../billing/FindPaymentMethod.jsp">Find Payment Method</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="/FindPaymentMethodAction.do">Show All Payment Method</a></li>
																			</dmshtml:dms_static_with_connector>
																		</ul>
																	</div>
																</div>
															</li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../Home/InstallmentTypeSubMenu.jsp">Installment Type</a>
																<div id="installmentType" class="yuimenu">
																	<div class="bd">
																		<ul class="first-of-type">
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="../billing/AddInstallmentType.jsp">Add Installment Type</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="../billing/FindInstallmentType.jsp">Find Installment Type</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="/FindInstallmentTypeAction.do">Show All Installment Type</a></li>
																			</dmshtml:dms_static_with_connector>
																		</ul>
																	</div>
																</div>
															</li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../Home/BillingCurrencySubMenu.jsp">Billing Currency</a>
																<div id="billingCurrency" class="yuimenu">
																	<div class="bd">
																		<ul class="first-of-type">
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="../billing/AddBillingCurrency.jsp">Add Billing Currency</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="../billing/FindBillingCurrency.jsp">Find Billing Currency</a></li>
																			</dmshtml:dms_static_with_connector>
																			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
																				<li><a href="/FindBillingCurrencyAction.do">Show All Billing Currency</a></li>
																			</dmshtml:dms_static_with_connector>
																		</ul>
																	</div>
																</div>
															</li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>

									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>

					<!-- User Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/UserAccountSubMenu.jsp">User Accounts</a>
							<div id="manage_tab_user" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_USER_MENU"}%>' connector='or' negated="true">
											<li><a href="../AddUserAccountLink.do?clear=yes">Add User Accounts</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">
											<li><a href="../AddUnderwriterEntities.do?clear=yes">Add Underwriter User Accounts</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
											<li><a href="../FindUsers.do?clear=yes">Find User Accounts</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>

					<!-- Alert Management Menu building -->
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEBSERVICE_VIEW"}%>' connector='or' negated="true">
									<li><a href="../Home/AlertMenu.jsp">Alert Management</a>
										<div id="manage_tab_webService" class="yuimenu">
											<div class="bd">
												<ul>
													<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
														<li><a href="../alert/AddAlertDefinition.jsp">Alert Definition</a>
															<div id="submission" class="yuimenu">
																<div class="bd">
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li><a href="../alert/AddAlertDefinition.jsp">Add Alert Definition</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li><a href="../alert/FindAlertDefinition.jsp">Find Alert Definition</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li><a href="../alert/DeleteAlertDefinition.jsp">Delete Alert Definition</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li><a href="../alert/SaveAlertDefinition.jsp">Update Alert Definition</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																</div>
															</div>
														</li>
														<li><a href="../alert/AddAlertDefinition.jsp">Alert </a>
															<div id="submission1" class="yuimenu">
																<div class="bd">
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li><a href="../alert/AddAlert.jsp">Add Alert</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li><a href="../alert/FindAlert.jsp">Find Alert</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li><a href="../alert/DeleteAlert.jsp">Delete Alert</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																	<ul class="first-of-type">
																		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																			<li><a href="../alert/SaveAlert.jsp">Update Alert</a></li>
																		</dmshtml:dms_static_with_connector>
																	</ul>
																</div>
															</div>
														</li>
													</dmshtml:dms_static_with_connector>
												</ul>
											</div>
										</div>
									</li>
				</dmshtml:dms_static_with_connector>


					<!-- Logged-in Users Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LOGGED_IN_USERS_MENU"}%>' connector='or' negated="true">
						<li><a href="../NonInvalidatedUserLogs.do?ownerId=5">Logged In Users</a>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Data Export Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_EXPORT_MENU"}%>' connector='or' negated="true">
						<li><a href="/Home/DataExportSubMenu.jsp">Data Export</a>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Data Import Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_IMPORT_MENU"}%>' connector='or' negated="true">
						<li><a href="/Home/DataImportSubMenu.jsp">Data Import</a>
							<div id="manage_tab_dataimport" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_UPLOAD_MENU"}%>' connector='or' negated="true">
											<li><a href="../dataimport/AgencyImport.jsp">Agency-Upload</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_UPLOAD_MENU"}%>' connector='or' negated="true">
											<li><a href="../dataimport/AgentImport.jsp">Agent Upload</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Clearance Import Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_IMPORT_MENU"}%>' connector='or' negated="true">
						<li><a href="/Home/ImportClearance.jsp">Clearance - Import</a>
							<div id="manage_tab_clearanceimport" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_IMPORT_MENU"}%>' connector='or' negated="true">
											<li><a href="../clearance/ImportClearance.jsp">Import Clearance File</a></li>
										</dmshtml:dms_static_with_connector>

									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>


			<!-- WebServices Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"WEBSERVICE_VIEW"}%>' connector='or' negated="true">
						<li><a href="../Home/WebServiceSubMenu.jsp">Webservice</a>
							<div id="manage_tab_webService" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
											<li><a href="../webservice/FindSubmission.jsp">Submission</a>
												<div id="submission" class="yuimenu">
													<div class="bd">
														<ul class="first-of-type">
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SUBMISSION_VIEW"}%>' connector='or' negated="true">
																<li><a href="../webservice/FindSubmission.jsp">Find Submission</a></li>
															</dmshtml:dms_static_with_connector>
														</ul>
													</div>
												</div>
											</li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
											<li><a href="../webservice/FindBilling.jsp">Billing</a>
												<div id="billing" class="yuimenu">
													<div class="bd">
														<ul class="first-of-type">
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BILLING_VIEW"}%>' connector='or' negated="true">
																<li><a href="../webservice/FindBilling.jsp">Find Billing</a></li>
															</dmshtml:dms_static_with_connector>
														</ul>
													</div>
												</div>
											</li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
				</dmshtml:dms_static_with_connector>
	 <%}else if(insType.equals("Health")){%>

	 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li><a href="../Home/GeneralAgencySubMenu.jsp"><bean:message key="AdminMenu.GeneralAgencies" /></a>
						<div id="manage_tab_generalAgency" class="yuimenu">
							<div class="bd">
								<ul>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li><a href="../GeneralAgencyLink.do?clear=yes">Add General Agency</a></li>
									</dmshtml:dms_static_with_connector>

									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
										<li><a href="../FindGenaralAgencyAction.do?clear=yes">Find General Agency</a></li>
									</dmshtml:dms_static_with_connector>
								</ul>
							</div>
						</div>
						</li>
		</dmshtml:dms_static_with_connector>

	 <!-- Agency Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/AgencySubMenu.jsp">Agencies</a>
							<div id="manage_tab_agency" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENCY_MENU"}%>' connector='or' negated="true">
											<li><a href="../AgencyLink.do?clear=yes">Add Agency</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_GENERAL_AGENCY_MENU"}%>' connector='or' negated="true">
											<li><a href="../FindAgencyAction.do?clear=yes&LimitSearch=yes&answer(Object::Agency::PageNum)=0&answer(Agency::orderBy)=DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID">Find Agency</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Agent Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENT_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/AgentSubMenu.jsp">Agents</a>
							<div id="manage_tab_agent" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_AGENT_MENU"}%>' connector='or' negated="true">
											<li><a href="../AddAgents.do?clear=yes">Add Agent</a></li>
										</dmshtml:dms_static_with_connector>

										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_AGENT_MENU"}%>' connector='or' negated="true">
											<li><a href="../FindAgent.do?clear=yes">Find Agent</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Sales Manager (CSR) Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SALES_MANAGER_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/SalesManagerSubMenu.jsp">Sales Managers</a>
							<div id="manage_tab_salesmanager" class="yuimenu">
								<div class="bd">
									<ul>
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
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>

					<!-- Product Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/ProductsSubMenu.jsp">Product Management</a>
							<div id="manage_tab_productManagement" class="yuimenu">
								<div class="bd">
									<ul>
										<!-- Optons Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OPTIONS__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/OptionsSubMenu.jsp">Options</a>
											<div id="options" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddOptions.do">Add Options</a></li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindOptions.do">Find Options</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_OPTIONS__MENU"}%>' connector='or' negated="true">
															<li><a href="../SearchOptions.do">Show All Options</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Factors Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FACTORS__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/FactorsSubMenu.jsp">Factors</a>
											<div id="factors" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
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
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Application Management Menu building -->
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"APPLICATION__MENU"}%>' connector='or' negated="true">
											<li><a href="../application/ApplicationSubMenu.jsp">Applications</a>
											<div id="applications" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddAttribute.do?clear=yes">Add Attributes</a></li>
														</dmshtml:dms_static_with_connector>
			                        					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_ATTRIBUTE__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindAttribute.do?clear=yes">Find Attributes</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddSubApplication.do?clear=yes">Add Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindSubApplication.do?clear=yes">Find Sub Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddApplication.do?clear=yes">Add Applications</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_APPLICATION__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindApplication.do?clear=yes">Find Applications</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/ProductSubMenu.jsp">Products</a>
											<div id="products" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddProduct.do?clear=yes">Add Products</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindProduct.do?clear=yes">Find Products</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_PRODUCT__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindProduct.go">Show All Products</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<!-- Product Group Management Menu building -->
								   		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PRODUCT__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/ProductGroupSubMenu.jsp">Product Groups</a>
											<div id="productGroups" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
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
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DOCUMENT__MENU"}%>' connector='or' negated="true">
											<li><a href="../Home/DocumentDefinitionSubMenu.jsp">Documents</a>
											<div id="productdocuments" class="yuimenu">
												<div class="bd">
													<ul class="first-of-type">
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_DOCUMENT__MENU"}%>' connector='or' negated="true">
															<li><a href="../AddDocumentDefinitionAction.do?clear=yes">Add Document</a></li>
														</dmshtml:dms_static_with_connector>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_DOCUMENT__MENU"}%>' connector='or' negated="true">
															<li><a href="../FindDocumentDefinitionAction.do?clear=yes">Find Document</a></li>
														</dmshtml:dms_static_with_connector>
													</ul>
												</div>
											</div>
											</li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- User Management Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"USER_MENU"}%>' connector='or' negated="true">
						<li><a href="../Home/UserAccountSubMenu.jsp">User Accounts</a>
							<div id="manage_tab_user" class="yuimenu">
								<div class="bd">
									<ul>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_USER_MENU"}%>' connector='or' negated="true">
											<li><a href="../AddUserAccountLink.do?clear=yes">Add User Accounts</a></li>
										</dmshtml:dms_static_with_connector>
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"FIND_USER_MENU"}%>' connector='or' negated="true">
											<li><a href="../FindUsers.do?clear=yes">Find User Accounts</a></li>
										</dmshtml:dms_static_with_connector>
									</ul>
								</div>
							</div>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Logged-in Users Menu building -->
					<!-- Logged-in Users Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LOGGED_IN_USERS_MENU"}%>' connector='or' negated="true">
						<li><a href="../NonInvalidatedUserLogs.do?ownerId=5">Logged In Users</a>
						</li>
					</dmshtml:dms_static_with_connector>
					<!-- Data Export Menu building -->
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_EXPORT_MENU"}%>' connector='or' negated="true">
						<li class="yuimenuitem"><a class="yuimenuitemlabel" href="/Home/DataExportSubMenu.jsp">Data Export</a>
						<div id="productdocuments" class="yuimenu">
							<div class="bd">
								<ul class="first-of-type">
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"RENEWAL_RATECARD_MENU"}%>' connector='or' negated="true">
										<li><a href="../export/RateCard.jsp">Renewal Rate Card</a></li>
									</dmshtml:dms_static_with_connector>
								</ul>
							</div>
						</div>
						</li>
					</dmshtml:dms_static_with_connector>
	 <%} %>
	</ul>
</div>

<%	/* Manage Menu ENDS here */  %>
