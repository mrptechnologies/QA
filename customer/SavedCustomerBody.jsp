<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/AddCustomers">


	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' /></td></tr>
		<tr><td><html:hidden property="versionNum" value="1.0" /></td></tr>
		<!--html:hidden property="formTemplateID" value="CUSTOMERDETAILSMICACARE" />-->
		<tr><td><input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE"></td></tr>
		<tr><td><html:hidden property="formName" value="form::CUSTOMERDETAILSMICACARE" /></td></tr>

		<logic:present name='arrObjectDetail' scope='session'>
			<tr>
				<td>
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
						<td><jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
						</td>
					</tr>

					<tr><td height="5"></td></tr>

					<tr>
						<td class="NewSectionHead" align="center">EMPLOYER GROUP SUMMARY</td>
					</tr>
					
					
					<tr>
						<td>&nbsp;</td>
					</tr>
					
					<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/>
					<tr>
						<td class="links"><bean:define id="ownerId"
							property="answer(Object::UserDetail::ownerId)" name="LoginPage"
							scope="session" /> <bean:define id="id"
							property="answer(Object::Agency::AgencyId)" name="AddCustomer"
							scope="session" /> <bean:define id="custid"
							property="answer(Object::Customer::CustomerId)"
							name="AddCustomer" scope="session" />


						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="../QuickAllEmployees.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&customerId=<%=custid.toString()%>&SearchObjectId=<%=custid.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=custState.toString()%>"
							title="Click to go to Show All Employees/Add Employee" />Census</a>


						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a
							href="../AllQuotes.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=custState.toString()%>"
							title="Click to go to Quotes" />Quotes</a></td>
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
								<td align="center" class="sectionhead" colspan="2">&nbsp;EMPLOYER
								GROUP DETAILS</td>

							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left" WIDTH="40%">Member of Association</td>
								<td class="TextMatter" align="left" WIDTH="60%">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::MemberAssociation)' /></td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left" WIDTH="40%">Member Association Number</td>
								<td class="TextMatter" align="left" WIDTH="60%">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::AssociationNumber)' /></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left" WIDTH="40%">Business Name:</td>
								<td class="TextMatter" align="left" WIDTH="60%">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::CustomerName)' /></td>

							</tr>

							<tr>
								<td class="sectionhead1" align="left">Employeer Group Number</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::CustomerNumber)' /></td>

							</tr>

							<tr>
								<td class="sectionhead1" align="left">Branch</td>
								<td class="TextMatter" align="left">:<bean:write
									name="AddCustomer"
									property="answer(Object::CustomerAdditional::Branch)" /></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Department</td>
								<td class="TextMatter" align="left">:<bean:write
									name="AddCustomer"
									property="answer(Object::CustomerAdditional::Dept)" /></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">SIC Code</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::SicCode)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">SIC Division</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::SicDivision)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">SIC Group</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::SicGroup)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">SIC Industry</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::SicIndustry)' /></td>

							</tr>

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
								<td class="sectionhead1" align="left">County Code</td>
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
									key="EmployeeDetails.Phone1" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::FaxAreaCode)' />-<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::FaxExchangeCode)' />-<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::Fax)' /></td>

							</tr>
							<tr>
								<td class="FormLabels" align="left"><u>President</u></td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left">First Name</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::PresidentFName)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left">Last Name</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::PresidentLName)' /></td>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<!-- /tr -->
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.ContactPerson" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::ContactPerson)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.Title" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::ContactPersonTitle)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.EmailAddress" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::Customer::EMailAddress)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.NatureOfBusiness" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::NatureOfBusiness)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.NumberOfEmployees" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::NumberOfEmployees)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.NumberOfEligibleEmployees" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::NumberOfEligibleEmployees)' /></td>

							</tr>

							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.OtherLocations" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::OtherLocations)' /></td>

							</tr>

							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.ERISA" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::ERISA)' /></td>

							</tr>
							<tr>
								<td class="sectionhead1" align="left"><bean:message
									key="EmployeeDetails.WaitingPeriod" /></td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property='answer(Object::CustomerAdditional::WaitingPeriod)' /></td>

							</tr>

							<tr>
								<td class="sectionhead1" align="left">Employer's contribution
								towards employees' premium</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property="answer(Object::CustomerAdditional::EmployersContribution)" /></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Billing Frequency</td>
								<td class="TextMatter" align="left">:
								<bean:write	name='AddCustomer' property='answer(Object::CustomerAdditional::BillingFrequency)' /></td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">Billing Level</td>
								<td class="TextMatter" align="left">:
								<bean:write	name='AddCustomer' property='answer(Object::CustomerAdditional::BillingLevel)' /></td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">Uses PEO</td>
								<td class="TextMatter" align="left">:
								<bean:write	name='AddCustomer' property='answer(Object::CustomerAdditional::UsesPEO)' /></td>
							</tr>
							
							<tr>
								<td class="sectionhead1" align="left">New Employees Waiting</td>
								<td class="TextMatter" align="left">:
								<bean:write	name='AddCustomer' property='answer(Object::CustomerAdditional::NewEmpWaiting)' /></td>
							</tr>

							<tr>
								<td class="sectionhead1" align="left">Data Entry Status</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property="answer(Object::CustomerAdditional::DataEntry)" /></td>
							</tr>
							<tr>
								<td class="sectionhead1" align="left">Created Date</td>
								<td class="TextMatter" align="left">:<bean:write
									name='AddCustomer'
									property="answer(Object::Customer::CreatedDate)" /></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</logic:present>
		<tr><td><html:hidden property="answer(duplicateAllowed)" value="no" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Entity::SiteId)" value="1" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Entity::ObjectType)"
			value="ENTITY" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Entity::EntityType)"
			value="CUSTOMER" /></td></tr>
		<bean:define id="ownerId"
			property="answer(Object::UserDetail::ownerId)" name="LoginPage"
			scope="session" />
		<tr><td><html:hidden
			property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)"
			value="<%=ownerId.toString()%>" /></td></tr>
		<tr><td><html:hidden
			property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)"
			value="<%=ownerId.toString()%>" /></td></tr>

		<bean:define id="userName"
			property="answer(Object::UserDetail::userName)" name="LoginPage"
			scope="session" />
		<tr><td><html:hidden
			property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)"
			value="<%=userName.toString()%>" /></td></tr>
		<tr><td><html:hidden
			property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)"
			value="<%=userName.toString()%>" /></td></tr>

		<tr><td><html:hidden
			property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)"
			value="<%=ownerId.toString()%>" /></td></tr>


		<tr><td><html:hidden
			property="answer(Object::Customer::Addresses::HOME::Object::Address::User)"
			value="<%=userName.toString()%>" /></td></tr>


		<tr><td><html:hidden
			property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)"
			value="<%=ownerId.toString()%>" /></td></tr>


		<tr><td><html:hidden
			property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)"
			value="<%=userName.toString()%>" /></td></tr>


		<tr><td><html:hidden name="DataForm" property="answer(versionid)" value="3" />

		<tr><td><html:hidden name="DataForm" property="answer(form::ForwordControl)"
			value="success" /></td></tr>
		<tr><td><html:hidden name="DataForm" property="answer(RootTemplate)"
			value="yes" /></td></tr>
		<tr><td><html:hidden
			property="answer(System::flag::requiredMultiSubmissionCheck)"
			value="yes" /></td></tr>
<tr><td><html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" /></td></tr>
	</table>
</html:form>


