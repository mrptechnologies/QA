<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@page import="java.text.DecimalFormat"%>
<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/AddCustomer.js"  type="text/javascript"> </SCRIPT>

<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="parentQuoteVerId" name="EndorsementDetail" property="answer(ParentQuoteVerId)" scope="request"/>
<bean:define id="subQuoteId" name="EndorsementDetail" property="answer(subQuoteId)" scope="request"/>
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="CustomerState" name="EndorsementDetail" property="answer(State)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />
<bean:define id="FamilyId" name="EndorsementDetail" property="answer(FamilyId)" scope="request"/>
<%String IsApplicationDisabled = "N"; %>
<table width="100%">
	
	<tr>
		<td colspan="2">
			<table width="100%" align="left" border="0" bgcolor="#C6DEEA">
				<tr>
					<td>
						<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="left" colspan=2>
			<table width="100%" align="left" border="0" >
				<tr>
					<td class="NewSectionHead" align="center">ENDORSEMENT DETAIL</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr height="5">
		<td></td>
	</tr>
	<tr>
		<td colspan="2">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td>
					<jsp:include page="../common/DynamicPolicyHeader.jsp">
						<jsp:param name="policyId" value="<%=""+parentPolicyId%>" />
						<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
						<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
						<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
					</jsp:include>
				</td>
			</tr>		
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<%-- <tr>
				<td>
				<table width="60%" align="Left" border="0">
					<jsp:include page="../common/QuoteHeader.jsp">
						<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
						<jsp:param name="productVerId" value="<%=""+productVerId%>" />
						<jsp:param name="heading" value="<%="ENDORSEMENT DETAIL"%>" />
					</jsp:include>
				</table>
				</td>
			</tr>--%>
			<tr>
			<td align="left">
				<jsp:include page="../common/EndorsementQuoteHeader.jsp">
					<jsp:param name="quoteId" value="<%=""+parentQuoteId%>" />
				</jsp:include>
			</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td class="links">
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Return to Endorsment Quote Summary</a>			
		</td>
		<%-- <td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td> --%>
	</tr>
					<tr><td colspan="10" class="sectionhead" align="center">&nbsp;Schedule of Tank - Changes</td></tr>				
			
					<tr>
				<td>	
				<html:form action="/DeleteEndorsementEILTank.do" scope="request">
				<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="0" CELLPADDING="2">
									
					<% int commonCount = 0; %>
					
					<logic:present name="availableTankList">
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>	
						<tr><td colspan="10" class="sectionhead" align="left">&nbsp;Available Tanks</td></tr>				
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="10">
								<table width="100%">
									<tr>
										<td class="sectionhead" width="2%">
											S.No
										</td>
										<td class="sectionhead" width="5%">
											Tank Name
										</td>
										<td class="sectionhead" width="8%" align="center">
											Location Number
										</td>
										<td class="sectionhead" width="7%" align="center">
											Location Name
										</td>	
										
									
									
										<td class="sectionhead" width="5%">
											Tank Type
										</td>
										
										
										<td class="sectionhead" width="5%">
											Year Built
										</td>
										
										<td class="sectionhead" width="5%">
											Deductible
										</td>
										
										<td class="sectionhead" width="5%">
											Premium
										</td>
									
									</tr>
							
									<% int i=0; %>
					  				<%int count=0;%>   
								
									<logic:iterate id="availableTankList" name="availableTankList" >
										<%++count;%>
										<%++commonCount;%>
																	
										<tr>
											<td class="SearchResult">
												<%=""+count %>
											</td>
											
											<td class="SearchResult">
												<bean:write name="availableTankList" property="Object::Quote::Tank::TankName" />&nbsp;
											</td>
											<td class="SearchResult" align="center">
												<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(IsApplicationDisabled)=<%="" %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="availableTankList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="availableTankList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="availableTankList" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="availableTankList" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="availableTankList" property="Object::Quote::Tank::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="availableTankList" property="Object::Quote::Tank::LocationNumber" /></a>
												<%++i;%>
											</td>
											<td class="SearchResult" align="center">
												<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="availableTankList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="availableTankList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="availableTankList" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="availableTankList" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="availableTankList" property="Object::Quote::Tank::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" /><bean:write name="availableTankList" property="Object::Quote::Tank::LocationName" />	</a>
												&nbsp;
												
											</td>
											
											<td class="SearchResult">
												<bean:write name="availableTankList" property="Object::Quote::Tank::TankType" />&nbsp;
											</td>
											
											
											<td class="SearchResult">
												<bean:write name="availableTankList" property="Object::Quote::Tank::YearBuilt" />&nbsp;
											</td>
											
											<td class="SearchResult">
												<bean:define id="deductible" name="availableTankList" property="Object::Quote::Tank::Deductible" />&nbsp;
												<%
													String deductible1 = deductible.toString();
													double d1 =0;
													d1=Double.parseDouble(deductible1);
													DecimalFormat dcFormat = new DecimalFormat("$#,###.00");
													String deductible2 = dcFormat.format(d1); 
												
												%>
												<%=""+deductible2 %>
											</td>
											
											<td class="SearchResult">
												<bean:define id="tankPremium" name="availableTankList" property="Object::Quote::Tank::TankPremium" />&nbsp;
											<%
												String tankPremium1 = tankPremium.toString();
												double t1 =0;
												t1=Double.parseDouble(tankPremium1);
												String tankpremium2 = dcFormat.format(t1); 	
											%>
											<%=""+tankpremium2 %>
											</td>
											
										</tr>									
						</logic:iterate>
									</table>
								</td>
							</tr>
					</logic:present>	
					<tr>
						
					</tr>				
	</table>		<html:hidden name="EndorsementDetail" property="answer(formName)" value="DeleteRisk" />	
					<html:hidden name="EndorsementDetail" property="answer(quoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>						
					<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
					<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
					<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<html:hidden property="answer(isEndorsement)" value="Y" />
			<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
			<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>"/>
			<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Location/Tank - Add/Remove"%>"/>
			<html:hidden property="answer(Object::Activity::ObjectId)" value="<%=""+parentQuoteId%>"/>
			
					
				
	<%-- Endorsement Detail END --%>
	
			</html:form>
		</td>
	</tr>
		<tr>
				<td>	
				<html:form action="/DeleteEndorsementEILTank.do" scope="request">
				<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
										
					<% int commonCount = 0; %>
					
					<logic:present name="addedTanksList">
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>	
						<tr><td colspan="10" class="sectionhead" align="left">&nbsp;Added Tanks </td></tr>										
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="10">
								<table width="100%">
									<tr>
										<td class="sectionhead" width="2%">
											S.No
										</td>
										<td class="sectionhead" width="5%">
											Tank Name
										</td>
										<td class="sectionhead" width="8%" align="center">
											Location Number
										</td>
										<td class="sectionhead" width="7%" align="center">
											Location Name
										</td>	
										<td class="sectionhead" width="5%">
											Tank Type
										</td>
										
										
										<td class="sectionhead" width="5%">
											Year Built
										</td>
										
										<td class="sectionhead" width="5%">
											Deductible
										</td>
										
										<td class="sectionhead" width="5%">
											Premium
										</td>
									
									</tr>
								
									<% int i=0; %>
					  				<%int count=0;%>   
								
									<logic:iterate id="addedTanksList" name="addedTanksList" >
										<%++count;%>
										<%++commonCount;%>
										
									
										
																	
										<tr>
											<td class="SearchResult">
												<%=""+count %>
											</td>
											<td class="SearchResult">
												<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::RiskName" />&nbsp;
											</td>
											<td class="SearchResult" align="center">
												
												<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="addedTanksList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="addedTanksList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::TankLocationId" />&answer(Object::Location::LocationName)=<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::LocationName" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::TankLocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(OwnerId)=<%=ownerId+"" %>" />
													<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::LocationNumber" />
												</a>
												<%++i;%>
											</td>
											<td class="SearchResult" align="center">
												<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="addedTanksList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="addedTanksList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::TankLocationId" />&answer(Object::Location::LocationName)=<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::LocationName" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::TankLocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(OwnerId)=<%=ownerId+"" %>" />
													<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::LocationName" />
													</a>
												&nbsp;
												
											</td>
											
											<td class="SearchResult">
												<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::RiskType" />&nbsp;
											</td>
											
											
											<td class="SearchResult">
												<bean:write name="addedTanksList" property="Object::Quote::Location::Tank::YearInstalled" />&nbsp;
											</td>
											
											<td class="SearchResult">
												<bean:define id="deductible" name="addedTanksList" property="Object::Quote::Location::Tank::Deductible" />&nbsp;
											
											<%
												String deductible1 = deductible.toString();
												double d1 =0;
												d1=Double.parseDouble(deductible1);
												DecimalFormat dcFormat = new DecimalFormat("$#,###.00");
												String deductible2 = dcFormat.format(d1); 
											%>
												<%=""+deductible2 %>
											</td>
											
											
											
											<td class="SearchResult">
												<bean:define id="tankPremium" name="addedTanksList" property="Object::Quote::Location::Tank::TankPremium" />&nbsp;
												<%
												String tankPremium1 = tankPremium.toString();
												double t1 =0;
												t1=Double.parseDouble(tankPremium1);
												String tankpremium2 = dcFormat.format(t1); 	
												%>
												<%=""+tankpremium2 %>
											</td>
											
										</tr>
						</logic:iterate>
						</table>
						</td>
						</tr>
					</logic:present>	
								
					
	</table>		<html:hidden name="EndorsementDetail" property="answer(formName)" value="AddRisk" />	
					<html:hidden name="EndorsementDetail" property="answer(quoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>						
					<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
					<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
					<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					
				
	<%-- Endorsement Detail END --%>
	
	</html:form>
	</td>
	</tr>
			
		<tr>
				<td>	
				<html:form action="/DeleteEndorsementEILTank.do" scope="request">
				<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
					
					<% int commonCount = 0; %>
					
					<logic:present name="removedTankList">
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>	
						<tr><td colspan="10" class="sectionhead" align="left">&nbsp;Removed Tanks </td></tr>				
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="10">
								<table width="100%">
									<tr>
										<td class="sectionhead" width="2%">
											S.No
										</td>
										<td class="sectionhead" width="5%">
											Tank Name
										</td>
										<td class="sectionhead" width="8%" align="center">
											Location Number
										</td>
										<td class="sectionhead" width="7%" align="center">
											Location Name
										</td>	
										
										<td class="sectionhead" width="5%">
											Tank Type
										</td>							
										
										<td class="sectionhead" width="5%">
											Year Built
										</td>
										
										<td class="sectionhead" width="5%">
											Deductible
										</td>
										
										<td class="sectionhead" width="5%">
											Premium
										</td>
									</tr>
								
									<% int i=0; %>
					  				<%int count=0;%>   
								
									<logic:iterate id="removedTankList" name="removedTankList" >
										<%++count;%>
										<%++commonCount;%>
										
									
										
										<tr>
											<td class="SearchResult">
											<%=""+count %>
											</td>
										
											
											<td class="SearchResult">
												<bean:write name="removedTankList" property="Object::Quote::Tank::TankName" />&nbsp;
											</td>
											<td class="SearchResult" align="center">
												<!-- <a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="removedTankList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="removedTankList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="removedTankList" property="Object::Quote::Tank::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="removedTankList" property="Object::Quote::Tank::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(OwnerId)=<%=ownerId+"" %>" /> -->
													<bean:write name="removedTankList" property="Object::Quote::Tank::LocationNumber" />
												<!-- </a> -->
												<%++i;%>
											</td>
											<td class="SearchResult" align="center">
												<!-- <a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="removedTankList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="removedTankList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="removedTankList" property="Object::Quote::Tank::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="removedTankList" property="Object::Quote::Tank::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(OwnerId)=<%=ownerId+"" %>" /> -->
													<bean:write name="removedTankList" property="Object::Quote::Tank::LocationName" />	
												<!-- 	</a> -->
												&nbsp;
												
											</td>
											
											<td class="SearchResult">
												<bean:write name="removedTankList" property="Object::Quote::Tank::TankType" />&nbsp;
											</td>
											
											
											<td class="SearchResult">
												<bean:write name="removedTankList" property="Object::Quote::Tank::YearBuilt" />&nbsp;
											</td>
											
											<td class="SearchResult">
												<bean:define id="deductible" name="removedTankList" property="Object::Quote::Tank::Deductible" />&nbsp;
												<%
												String deductible1 = deductible.toString();
												double d1 =0;
												d1=Double.parseDouble(deductible1);
												DecimalFormat dcFormat = new DecimalFormat("$#,###.00");
												
												String deductible2 = dcFormat.format(d1); 
												
												%>
												<%=""+deductible2 %>
											</td>
											
											<td class="SearchResult">
												<bean:define id="tankPremium" name="removedTankList" property="Object::Quote::Tank::TankPremium" />&nbsp;
												
												<%
													String tankPremium1 = tankPremium.toString();
													double t1 =0;
													t1=Double.parseDouble(tankPremium1);
													String tankpremium2 = dcFormat.format(t1); 	
												%>
												<%=""+tankpremium2 %>
											</td>
											
										</tr>
						</logic:iterate>
						</table>
						</td>
						</tr>
					</logic:present>	
					<tr>
						
					</tr>				
					
	</table>		<html:hidden name="EndorsementDetail" property="answer(formName)" value="AddRisk" />	
					<html:hidden name="EndorsementDetail" property="answer(quoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>						
					<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
					<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
					<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					
				
	<%-- Endorsement Detail END --%>
	
	</html:form>
	</td>
	</tr>
	
	<tr>
				<td>	
				<html:form action="/DeleteEndorsementEILTank.do" scope="request">
				<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
										
					<% int commonCount = 0; %>
					
					<logic:present name="updatedTankList">
					
						<tr><td colspan="10" class="sectionhead" align="left">&nbsp;Updated Tanks</td></tr>
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="10">
								<table width="100%">
									<tr>
										<td class="sectionhead" width="2%">
											S.No
										</td>
										<td class="sectionhead" width="5%">
											Tank Name
										</td>
										<td class="sectionhead" width="8%" align="center">
											Location Number
										</td>
										<td class="sectionhead" width="7%" align="center">
											Location Name
										</td>	
										<td class="sectionhead" width="5%">
											Tank Type
										</td>
										
										
										<td class="sectionhead" width="5%">
											Year Built
										</td>
										
										<td class="sectionhead" width="5%">
											Deductible
										</td>
										
										<td class="sectionhead" width="5%">
											Premium
										</td>
									
									</tr>
								
									<% int i=0; %>
					  				<%int count=0;%>   
								
									<logic:iterate id="updatedTanksList" name="updatedTankList" >
										<%++count;%>
										<%++commonCount;%>
										
									
										
																	
										<tr>
											<td class="SearchResult">
												<%=""+count %>
											</td>
											<td class="SearchResult">
												<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::RiskName" />&nbsp;
											</td>
											<td class="SearchResult" align="center">
												
												<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="updatedTanksList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="updatedTanksList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::TankLocationId" />&answer(Object::Location::LocationName)=<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::LocationName" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::TankLocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(OwnerId)=<%=ownerId+"" %>" />
													<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::LocationNumber" />
												</a>
												<%++i;%>
											</td>
											<td class="SearchResult" align="center">
												<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="updatedTanksList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="updatedTanksList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::TankLocationId" />&answer(Object::Location::LocationName)=<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::LocationName" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::TankLocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(OwnerId)=<%=ownerId+"" %>" />
													<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::LocationName" />
													</a>
												&nbsp;
												
											</td>
											
											<td class="SearchResult">
												<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::RiskType" />&nbsp;
											</td>
											
											
											<td class="SearchResult">
												<bean:write name="updatedTanksList" property="Object::Quote::Location::Tank::YearInstalled" />&nbsp;
											</td>
											
											<td class="SearchResult">
												<bean:define id="deductible" name="updatedTanksList" property="Object::Quote::Location::Tank::Deductible" />&nbsp;
											
											<%
												String deductible1 = deductible.toString();
												double d1 =0;
												d1=Double.parseDouble(deductible1);
												DecimalFormat dcFormat = new DecimalFormat("$#,###.00");
												String deductible2 = dcFormat.format(d1); 
											%>
												<%=""+deductible2 %>
											</td>
											
											
											
											<td class="SearchResult">
												<bean:define id="tankPremium" name="updatedTanksList" property="Object::Quote::Location::Tank::TankPremium" />&nbsp;
												<%
												String tankPremium1 = tankPremium.toString();
												double t1 =0;
												t1=Double.parseDouble(tankPremium1);
												String tankpremium2 = dcFormat.format(t1); 	
												%>
												<%=""+tankpremium2 %>
											</td>
											
										</tr>
						</logic:iterate>
						</table>
						</td>
						</tr>
					</logic:present>	
								
					
	</table>		<html:hidden name="EndorsementDetail" property="answer(formName)" value="AddRisk" />	
					<html:hidden name="EndorsementDetail" property="answer(quoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>						
					<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
					<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
					<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					
				
	<%-- Endorsement Detail END --%>
	
	</html:form>
	</td>
	</tr>
	
	<tr>
				<td>	
				<html:form action="/DeleteEndorsementEILTank.do" scope="request">
				<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2">
										
					<% int commonCount = 0; %>
					
					<logic:present name="updatedLocationList">
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>	
						<tr><td colspan="10" class="sectionhead" align="left">&nbsp;Updated Locations</td></tr>										
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="10">
								<table width="100%">
									<tr>
										<td class="sectionhead" width="2%">
											S.No
										</td>
										<td class="sectionhead" width="6%" align="center">
											Location Number
										</td>
										<td class="sectionhead" width="8%" align="center">
											Location Name
										</td>	
										<td class="sectionhead" width="6%">
											Address 1
										</td>
										<td class="sectionhead" width="5%">
											Address 2
										</td>
										<td class="sectionhead" width="5%">
											City
										</td>										
										<td class="sectionhead" width="3%">
											State
										</td>
										<td class="sectionhead" width="3%">
											Zip
										</td>
									
									</tr>
								
									<% int i=0; %>
					  				<%int count=0;%>   
								
									<logic:iterate id="updatedLocationsList" name="updatedLocationList" >
										<%++count;%>
										<%++commonCount;%>
										
									
										
																	
										<tr>
											<td class="SearchResult">
												<%=""+count %>
											</td>
											<td class="SearchResult" align="center">
												
												<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="updatedLocationsList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="updatedLocationsList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="updatedLocationsList" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="updatedLocationsList" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="updatedLocationsList" property="Object::Quote::Location::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" />
													<bean:write name="updatedLocationsList" property="Object::Quote::Location::LocationNumber" />
												</a>
												<%++i;%>
											</td>
											<td class="SearchResult" align="center">
												<a href="../EditPolicyEILRisk.do?answer(TabPanelName)=Quote_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(QuoteId)=<%=""+subQuoteId %>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(FamilyId)=<%=FamilyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus %>&answer(Object::Application::OwnerId)=<%=""+ownerId %>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+customerId %>&answer(Object::Agency::AgencyId)=<%=agencyId%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Application::ApplicationType)=<%="QUOTE_APPLICATION" %>&answer(ParentQuoteId)=<%=""+parentQuoteId %>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(PrimaryKey_ParentQuoteId)=<%=""+parentQuoteId %>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Quote::PolicyNumber)=<%=""+policyNumber %>&answer(PrimaryKey_ParentQuoteVerId)=<%=""+parentQuoteVerId %>&answer(IsApplicationDisabled)=<%="" %>&answer(productId)=<%=""+productId%>&answer(productVerId)=<%=""+productVerId%>&answer(recalculateneeded)=<%="recalculate"%>&answer(subQuoteId)=<%=""+subQuoteId %>&answer(SubQuoteId)=<%=""+subQuoteId %>&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(CustomerId)=<%= customerId.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=<bean:write name="updatedLocationsList" property="resPropertyId" />&APP_TAB_TYPE=<%="YUI" %>&answer(SelectedRiskType)=<bean:write name="updatedLocationsList" property="riskType" />&answer(Object::Location::LocationId)=<bean:write name="updatedLocationsList" property="Object::Quote::Location::LocationId" />&answer(PrimaryKey_Object::Location::LocationId)=<bean:write name="updatedLocationsList" property="Object::Quote::Location::LocationId" />&answer(Object::Customer::CustomerId)=<%= customerId.toString()%>&answer(ObjectType)=<%="RISK" %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId %>&answer(Object::Location::LocationName)=<bean:write name="updatedLocationsList" property="Object::Quote::Location::LocationName" />&answer(OwnerId)=<%=ownerId+"" %>" />
													<bean:write name="updatedLocationsList" property="Object::Quote::Location::LocationName" />
													</a>
												&nbsp;												
											</td>											
											<td class="SearchResult">
												<bean:write name="updatedLocationsList" property="Object::Quote::Location::Address1" />&nbsp;
											</td>
											<td class="SearchResult">
												<bean:write name="updatedLocationsList" property="Object::Quote::Location::Address2" />&nbsp;
											</td>
											<td class="SearchResult">
												<bean:write name="updatedLocationsList" property="Object::Quote::Location::City" />&nbsp;
											</td>
											<td class="SearchResult">
												<bean:write name="updatedLocationsList" property="Object::Quote::Location::State" />&nbsp;
											</td>
											<td class="SearchResult">
												<bean:write name="updatedLocationsList" property="Object::Quote::Location::Zip" />&nbsp;
											</td>
										</tr>
						</logic:iterate>
						</table>
						</td>
						</tr>
					</logic:present>	
								
					
	</table>		<html:hidden name="EndorsementDetail" property="answer(formName)" value="AddRisk" />	
					<html:hidden name="EndorsementDetail" property="answer(quoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::PolicyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::CustomerId)" value="<%=customerId.toString()%>"/>						
					<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
					<html:hidden name="EndorsementDetail" property="answer(OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::QuoteInsured::OwnerId)" value="<%=ownerId.toString()%>"/>
					<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
					<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
					<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					
				
	<%-- Endorsement Detail END --%>
	
	</html:form>
	</td>
	</tr>
	
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>



