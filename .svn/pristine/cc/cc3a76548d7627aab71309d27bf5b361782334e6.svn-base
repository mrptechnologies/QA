<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/AddInsured">



		<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
		<html:hidden property="versionNum" value="1.0" />
		<!-- html:hidden property="formTemplateID" value="CUSTOMERDETAILSMICACARE" /> -->
		<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
		<html:hidden property="formName" value="form::CUSTOMERDETAILSMICACARE" />
		<bean:define id="InsuredType" name='AddCustomer' property='answer(Object::Customer::NameType)' />
		<%
		String isCompany = "N";		
		 if(InsuredType.toString().equalsIgnoreCase("Company")){
			 isCompany = "Y"; 
		 }
		
		 %>
		

		<logic:present name='arrObjectDetail' scope='session'>
			
				<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
					<tr>
						<td>&nbsp;</td>
					</tr>
					<logic:present name="staleDataSubmissionMsg" scope="request">
						<tr>
							<td class="Error"><bean:message
								key="error.staleDataSubmissionMsg" /></td>
						</tr>
					</logic:present>


					<tr>
						<td><jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
						</td>
					</tr>

					<tr><td>&nbsp;</td></tr>

					<tr>
						<td class="NewSectionHead" align="center">INSURED SUMMARY</td>
					</tr>
					
					
					<tr>
						<td>&nbsp;</td>
					</tr>
					
					<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/>
					<tr>
						<bean:define id="ownerId"
							property="answer(Object::UserDetail::ownerId)" name="LoginPage"
							scope="session" /> <bean:define id="id"
							property="answer(Object::Agency::AgencyId)" name="AddCustomer"
							scope="session" /> <bean:define id="custid"
							property="answer(Object::Customer::CustomerId)"
							name="AddCustomer" scope="session" />
							
							
									
						
						<td class="links">
						<a href="../GetLocationList.do?answer(TabPanelName)=Insured_Panel&answer(APP_TAB_TYPE)=<%="YUI" %>&customerId=<%=""+custid%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(OwnerId)=<%=""+ownerId %>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=""+custid%>&answer(Object::Customer::CustomerId)=<%=""+custid%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custid%>&answer(Object::Agency::AgencyId)=<%=""+id%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=LOCATION&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=""+custState%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custid%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO"
										 title="Click to go to Show All Risks" />Locations</a>
	
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- 	<a	href="../GetList.do?answer(TabPanelName)=Insured_Panel&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Risk::ResProperty::CustomerId)=<%=""+custid%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(Object::Risk::ResProperty::ResPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=custState.toString()%>"
							title="Click to go to Show All Risks" />Risks</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
							
						<a
							href="../GetAllQuotes.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=custState.toString()%>"
							title="Click to go to Quotes" />Quotes</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
							
						<a href="../GetAdditionalInsuredAction.do?TabPanelName=Insured_Panel&answer(Object::AdditionalInsured::OwnerId)=<%=ownerId.toString()%>&answer(Object::AdditionalInsured::CustomerID)=<%=custid.toString()%>&answer(Object::AdditionalInsured::AdditionalyNamedInsured)=N" title="Click to Add Additional Insured" />Additional Insured</a> 
						
					</tr>
					<tr>
						<td>
						<hr size="1" noshade>
						</td>
					</tr>
					<tr>
						<td align="center">

						<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0"
							CELLPADDING="2">
							
							<tr>
								<td>&nbsp;</td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left" WIDTH="40%">Insured Name Type</td>
								<td class="TextMatter" align="left" WIDTH="60%">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::NameType)' /></td>

							</tr>

							<tr>
								<td class="sectionhead1" align="left" WIDTH="40%">Insured Name</td>
								<td class="TextMatter" align="left" WIDTH="60%">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::CustomerName)' /></td>

							</tr>

							<tr>
								<td class="sectionhead1" align="left">Insured Number</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::CustomerNumber)' /></td>

							</tr>
							<%if(isCompany.toString().equalsIgnoreCase("Y")){ %>
							 <tr>
								<td class="sectionhead1" align="left">DBA/TA</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::DBA)' /></td>

							</tr>
							<%} %>						
							<tr>
								<td class="sectionhead1" align="left">Address 1</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::Address1)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">Address 2</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::Address2)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="AddCustomer.City" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::City)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">County Name</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::County)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="AddCustomer.State" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::State)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">Zip Code</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::Zip)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">Country</td>
								<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::Address::Country)' /></td>

							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">Email Address</td>
								<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::EMailAddress)' /></td>

							</tr>
							
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.Phone1" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::WorkPhoneAreaCode)' />-<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::WorkPhoneExchangeCode)' />-<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::WorkPhone)' /></td>

							</tr>


							 <tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.Fax" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::FaxAreaCode)' />-<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::FaxExchangeCode)' />-<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::Fax)' /></td>

							</tr>	
							<tr>
								<td class="sectionhead1" align="left">Contact First Name</td>
								<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::ContactFName)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">Contact Last Name</td>
								<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::ContactLName)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">Contact Title</td>
								<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::ContactTitle)' /></td>

							</tr>	
							
							<%if(isCompany.toString().equalsIgnoreCase("Y")){ %>
							<tr>
								<td class="sectionhead1" align="left">Form of Business</td>
								<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::Business)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">Company Website</td>
								<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::ContactURL)' /></td>

							</tr>
							<bean:define id="formOfBussiness" name='AddCustomer'	property='answer(Object::Customer::Business)'/>
							<% if(formOfBussiness.toString().equalsIgnoreCase("Other")) {%>
							<tr>
								<td class="sectionhead1" align="left">If Other,please Specify</td>
								<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::OtherBusiness)' /></td>

							</tr>						
							
							<%} }%>					
						</table>
						</td>
					</tr>
				</table>
				
			
		</logic:present>
		<html:hidden property="answer(duplicateAllowed)" value="no" />
		<html:hidden property="answer(Object::Entity::SiteId)" value="1" />
		<html:hidden property="answer(Object::Entity::ObjectType)"
			value="ENTITY" />
		<html:hidden property="answer(Object::Entity::EntityType)"
			value="CUSTOMER" />
		<bean:define id="ownerId"
			property="answer(Object::UserDetail::ownerId)" name="LoginPage"
			scope="session" />
			<html:hidden
			property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)"
			value="<%=ownerId.toString()%>" />
		<html:hidden
			property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)"
			value="<%=ownerId.toString()%>" />

		<bean:define id="userName"
			property="answer(Object::UserDetail::userName)" name="LoginPage"
			scope="session" />
	<html:hidden
			property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)"
			value="<%=userName.toString()%>" />
		<html:hidden
			property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)"
			value="<%=userName.toString()%>" />
			<html:hidden
			property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)"
			value="<%=ownerId.toString()%>" />


		<html:hidden
			property="answer(Object::Customer::Addresses::HOME::Object::Address::User)"
			value="<%=userName.toString()%>" />


		<html:hidden
			property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)"
			value="<%=ownerId.toString()%>" />


		<html:hidden
			property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)"
			value="<%=userName.toString()%>" />


		<html:hidden name="DataForm" property="answer(versionid)" value="3" />

		<html:hidden name="DataForm" property="answer(form::ForwordControl)"
			value="success" />
		<html:hidden name="DataForm" property="answer(RootTemplate)"
			value="yes" />
		<html:hidden
			property="answer(System::flag::requiredMultiSubmissionCheck)"
			value="yes" />
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

	
</html:form>


