<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>

<bean:define id="parentQuoteId" name="EndorsementDetail" property="answer(parentQuoteId)" scope="request"/>
<bean:define id="productId" name="EndorsementDetail" property="answer(productId)" scope="request"/>
<bean:define id="productVerId" name="EndorsementDetail" property="answer(productVerId)" scope="request"/>
<bean:define id="customerId" name="EndorsementDetail" property="answer(customerId)" scope="request"/>
<bean:define id="CustomerState" name="EndorsementDetail" property="answer(State)" scope="request"/>
<bean:define id="agencyId" name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" scope="request"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="paretQuoteStatus" name="EndorsementDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="parentPolicyId" name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" scope="request"/>
<bean:define id="policyNumber" name="EndorsementDetail" property="answer(policyNumber)" />

<bean:parameter name="answer(Object::Policy::ParentPolicyVerId)" id="policyVerId" />
<table width="98%">
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
			<a href="../EndorsementQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteId)=<%=""+parentQuoteId%>&answer(parentQuoteId)=<%=""+parentQuoteId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Policy::ParentPolicyId)=<%=""+parentPolicyId %>&answer(Object::Policy::ParentPolicyVerId)=<%=""+policyVerId%>">Quote Summary</a>			
		</td>
		<%--<td class="links">
			<a href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=customerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=""+agencyId%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=CustomerState.toString()%>" title="Click to go to Show All Risks" />Risks</a>
		</td>--%>
	</tr>

	<tr>
	<td colspan="2">
	
	<%-- Endorsement Detail START --%>
	<div id="dolphincontainer">
		<div id="dolphinnav">
			<ul>
				<li>
					<a class="" rel="Property Address Summary">
					<span>Property Address Summary</span></a></li>
			</ul>
		</div>

		<div style="display:block;" id="Property Address Summary" class="innercontent">

			<html:form action="/SaveEndorsementDetailAction.go" styleId="Application1">
				<table class="FormLabelsApplication" border="0" cellpadding="2" cellspacing="2" >
					<tr>
						<td class="FormLabels" width="40%">Risk Name</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::RiskName)" styleClass="txtbox" readonly="true"/></td></tr>

					<tr>
						<td class="FormLabels" width="40%">Risk Number</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::RiskNumber)" styleClass="txtbox" readonly="true"/></td></tr>

<tr>
						<td class="FormLabels" width="40%">Street Number</td><td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::StreetNumber)" styleClass="txtbox" styleId="address1"/></td></tr>

					<tr>
						<td class="FormLabels" width="40%">Street Name</td><td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::StreetName)" styleClass="txtbox" styleId="address1"/></td></tr>



					<tr>
						<td class="FormLabels" width="40%">Address 2</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::Address2)"  styleClass="txtbox" /></td></tr>

					<tr>
						<td class="FormLabels" width="40%">City</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::City)" styleClass="txtbox" readonly="true"/></td></tr>

					<tr>
						<td class="FormLabels" width="40%">County</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::CountyName)" styleClass="txtbox" readonly="true" /></td></tr>

					<tr>
						<td class="FormLabels" width="40%">State</td>
						<td class="FormLabels" width="40%">
							<dmshtml:get_all_risk_states nameInSession="arStates" ownerId='<%=Long.parseLong(""+ownerId)%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
							<html:select property="answer(Object::Risk::ResProperty::State)" name="EndorsementDetail" disabled="true" styleId="State" styleClass="txtbox">
								<logic:present name="arStates" scope="request">
						           <logic:iterate id="details" name="arStates">
								    <bean:define id='test' name="details"  property="stateCode" />
								    <html:option value ='<%=test.toString()%>'>
								       <bean:write name="details" property="state" />
								    </html:option>
									</logic:iterate>
								</logic:present>
								
								<!--<html:option value="DC">District of Columbia</html:option>
								<html:option value="DE">Delaware</html:option>
								<html:option value="GA">Georgia</html:option>
								<html:option value="MD">MaryLand</html:option>
								<html:option value="NC">North Carolina</html:option>
								<html:option value="NJ">New Jersey</html:option>
								<html:option value="PA">Pennsylvania</html:option>
								<html:option value="SC">South Carolina</html:option>
								<html:option value ="TX">Texas</html:option>
								<html:option value="VA">Virginia</html:option>
								<html:option value="FL">Florida</html:option>
								
							--></html:select></td></tr>

					<tr>
						<td class="FormLabels" width="40%">Zip</td>
						<td class="FormLabels" width="40%">
							<html:text property="answer(Object::Risk::ResProperty::Zip)" styleClass="txtbox" readonly="true"/></td></tr>
							<html:hidden property="answer(Object::Risk::ResProperty::State)" name="EndorsementDetail" />
							<html:hidden property="answer(Object::Risk::ResProperty::CountyCode)" />
							<html:hidden property="answer(Object::Risk::ResProperty::ResPropertyId)" />
							<html:hidden property="answer(Object::Risk::ResProperty::CustomerId)" />
							<html:hidden property="answer(Object::Risk::ResProperty::RiskType)" />
							<html:hidden property="answer(Object::Risk::ResProperty::SameInsuredAddress)" />
							<html:hidden property="answer(Object::Risk::ResProperty::Country)" />
							<html:hidden property="answer(Object::Risk::ResProperty::DateBuilt)" />
							<html:hidden property="answer(Object::Risk::ResProperty::ConstructionType)" />
							<html:hidden property="answer(Object::Risk::ResProperty::ConstructionTypeOthers)" />
							<html:hidden property="answer(Object::Risk::ResProperty::ProtectionClass)" />
							<html:hidden property="answer(Object::Risk::ResProperty::SquareFeet)" />
							<html:hidden property="answer(Object::Risk::ResProperty::MarketValue)" />
							<html:hidden property="answer(Object::Risk::ResProperty::FireHydrantDistance)" />
							<html:hidden property="answer(Object::Risk::ResProperty::FireStationDistance)" />
							<html:hidden property="answer(Object::Risk::ResProperty::NumberOfFamilies)" />
							<html:hidden property="answer(Object::Risk::ResProperty::HeatSource)" />
							<html:hidden property="answer(Object::Risk::ResProperty::HeatSourceOthers)" />
							<html:hidden property="answer(Object::Risk::ResProperty::Occupancy)" />
							<html:hidden property="answer(Object::Risk::ResProperty::ResType)" />
							<html:hidden property="answer(Object::Risk::ResProperty::FireAlarmCentral)" />
							<html:hidden property="answer(Object::Risk::ResProperty::FireAlarmLocal)" />
							<html:hidden property="answer(Object::Risk::ResProperty::BurglaryAlarmCentral)" />
							<html:hidden property="answer(Object::Risk::ResProperty::BurglaryAlarmLocal)" />
							<html:hidden property="answer(Object::Risk::ResProperty::HurricaneShutter)" />
							<html:hidden property="answer(Object::Risk::ResProperty::CostalWaterDistance)" />
							<html:hidden property="answer(Object::Risk::ResProperty::WiringUpdated)" />
							<html:hidden property="answer(Object::Risk::ResProperty::HeatingUpdated)" />
							<html:hidden property="answer(Object::Risk::ResProperty::PlumbingUpdated)" />
							<html:hidden property="answer(Object::Risk::ResProperty::RoofUpdated)" />

							<html:hidden property="answer(Object::Owner::OwnerId)" />
							<html:hidden property="answer(Object::Risk::ResProperty::Active)" value="Y"/>
							<html:hidden property="answer(Object::Risk::ResProperty::CreatedBy)" />
							<html:hidden property="answer(Object::Risk::ResProperty::UpdatedBy)"  value="<%=userId.toString()%>" />

							<html:hidden property="answer(Object::Risk::ResProperty::ElectricSerciveType)" />
							<html:hidden property="answer(Object::Risk::ResProperty::RatingTerritory)" />
							<html:hidden property="answer(Object::Risk::ResProperty::ChildCareBusiness)" />
							<html:hidden property="answer(Object::Risk::ResProperty::OtherBusiness)" />
							<html:hidden property="answer(Object::Risk::ResProperty::BusinessType)" />
							<html:hidden property="answer(Object::Risk::ResProperty::MobileHome)" />
							<html:hidden property="answer(Object::Risk::ResProperty::SwimmingPoolAnfFenceType)" />
							<html:hidden property="answer(Object::Risk::ResProperty::Trampoline)" />
							<html:hidden property="answer(Object::Risk::ResProperty::Animals)" />
							<html:hidden property="answer(Object::Risk::ResProperty::DogBreeds)" />
							<html:hidden property="answer(Object::Risk::ResProperty::AnimalsTypeAndBreedsHistory)" />
							<html:hidden property="answer(Object::Risk::ResProperty::NumberOfClaims)" />
							<html:hidden property="answer(Object::Risk::ResProperty::ClaimGTAmount)" />
							<html:hidden property="answer(Object::Risk::ResProperty::AdditionalInterest)" />
							<html:hidden property="answer(Object::Risk::ResProperty::OccupancyOther)" />
							<html:hidden property="answer(Object::Risk::ResProperty::IsWiringUpdated)" />
							<html:hidden property="answer(Object::Risk::ResProperty::IsRoofUpdated)" />
							<html:hidden property="answer(Object::Risk::ResProperty::RuleNameGA)" />
							<html:hidden property="answer(Object::Risk::ResProperty::RuleNameDE)" />
							<html:hidden property="answer(Object::Risk::ResProperty::WindPoolEligibility)" />
							<html:hidden property="answer(Object::Risk::ResProperty::bankruptcy)" />
							<html:hidden property="answer(Object::Risk::ResProperty::foreclosure)" />
							<html:hidden property="answer(Object::Risk::ResProperty::reposession)" />		
						<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true" >							
							<tr>
								<td colspan="2" align="center">
									<input name="answer(SubmitType)" value="Save" class="sbttn" type="submit"></td></tr>
						</dmshtml:dms_isPresent>
						<html:hidden name="EndorsementDetail" property="answer(Object::Risk::ResProperty::AdditionalInterest::ResPropertyId)" />
						<html:hidden name="EndorsementDetail" property="answer(userName)" value="<%=userId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(parentQuoteId)" value="<%=parentQuoteId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productId)" value="<%=productId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(productVerId)" value="<%=productVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(customerId)" value="<%=customerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Risk::ResProperty::CustomerId)" value="<%=customerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(State)" value="<%=CustomerState.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Agency::AgencyId)" />
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden name="EndorsementDetail" property="answer(Object::Policy::ParentPolicyId)" value="<%=parentPolicyId.toString()%>" />						
						<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=policyVerId.toString()%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Quote::EndorsementModified)" value="Y" />
						<html:hidden name="EndorsementDetail" property="answer(QuoteId)" value="<%=""+parentQuoteId%>" />
						<html:hidden name="EndorsementDetail" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>" />	
						<html:hidden name="EndorsementDetail" property="answer(policyNumber)" value="<%=policyNumber.toString()%>"/>
						<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
				</table>
			</html:form>
		</div>
	</div>
	<%-- Endorsement Detail END --%>
	</td></tr>
	<tr>
		<td colspan="2" height="15px"></td></tr>
</table>

<script type="text/javascript">dolphintabs.init('dolphinnav', 0)</script>
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
