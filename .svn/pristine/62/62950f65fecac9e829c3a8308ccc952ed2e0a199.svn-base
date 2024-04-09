<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<html:form action="/AddInsured">
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr>
			<td><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' /></td>
		</tr>
		<tr>
			<td><html:hidden property="versionNum" value="1.0" /></td>
		</tr>
			<!-- html:hidden property="formTemplateID" value="CUSTOMERDETAILSMICACARE" /> -->
		<tr>
			<td><input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE"></td>
		</tr>
		<tr>
			<td><html:hidden property="formName" value="form::CUSTOMERDETAILSMICACARE" /></td>
		</tr>
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
							<td><jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td class="NewSectionHead" align="center">INSURED SUMMARY</td>
						</tr>					
						<tr>
							<td>&nbsp;</td>
						</tr>
						
						<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/>
						<tr>
							<td class="links">
								<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage"	scope="session" /> 
								<bean:define id="id" property="answer(Object::Agency::AgencyId)" name="AddCustomer"	scope="session" /> 
								<bean:define id="custid"	property="answer(Object::Customer::CustomerId)"	name="AddCustomer" scope="session" />
	
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="../GetListCL.do?answer(TabPanelName)=Insured_Panel&customerId=<%=custid.toString()%>&answer(RiskType)=COMMERCIAL&SearchObjectId=<%=custid.toString()%>&answer(OwnerId)=<%=ownerId+"" %>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Risk::ComProperty::CustomerId)=<%=""+custid%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(objectId)=0&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=<%=""%>&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&answer(state)=<%=""%>&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=<%=custState.toString()%>&answer(Object::Risk::ComProperty::CustomerId)=<%=custid.toString()%>&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(SelectedRiskType)=COMMERCIAL<%=" "%>AUTO"
									title="Click to go to Show All Risks" />Risks</a>
									
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="../AllQuotesCL.do?TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=id.toString()%>&answer(Object::Customer::State)=<%=custState.toString()%>"
									title="Click to go to Quotes" />Quotes</a>
							</td>
						</tr>
						<tr>
							<td>
							<hr size="1" noshade>
							</td>
						</tr>
						<tr>
							<td align="center">
								<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">									
									<tr>
										<td>&nbsp;</td>
									</tr>	
									<tr>
										<td class="sectionhead1" align="left" WIDTH="40%">Named Insured</td>
										<td class="TextMatter" align="left" WIDTH="60%">:<bean:write name='AddCustomer'	property='answer(Object::Customer::CustomerName)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">DBA/TA</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::DBA)' />
										</td>	
									</tr>						
									<tr>
										<td class="sectionhead1" align="left">Form of Business</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::Business)' />
										</td>	
									</tr>	
									<tr>
										<td class="sectionhead1" align="left" WIDTH="40%">Description of Business</td>
										<td class="TextMatter" align="left" WIDTH="60%">:<bean:write name='AddCustomer'	property='answer(Object::Customer::BusinessDesc)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">Mailing Address Line1</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::Address1)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">Mailing Address Line2</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::Address2)' />
										</td>	
									</tr>							
									<tr>
	 									<td class="sectionhead1" align="left"><bean:message key="AddCustomer.City" />
	 									</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::City)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">County</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::County)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left"><bean:message key="AddCustomer.State" /></td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::State)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">Zip Code</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer'	property='answer(Object::Customer::Zip)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">Is billing information same as above</td>
										<td class="TextMatter" align="left">:<%= ""+request.getParameter("answer(Object::Customer::BillingAddressSame)") %>

										</td>	
									</tr>								
									<tr>
										<td class="sectionhead1" align="left">Billing Address Line1</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::BillingAddress1)' /></td>
		
									</tr>
									<tr>
										<td class="sectionhead1" align="left">Billing Address Line2</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::BillingAddress2)' />
										</td>	
									</tr>								
									<tr>
										<td class="sectionhead1" align="left"><bean:message	key="AddCustomer.City" /></td>
	 									<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::BillingCity)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">County Name</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::County)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left"><bean:message key="AddCustomer.State" /></td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::BillingState)' />
									</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">Zip Code</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::BillingZip)' />
										</td>	
									</tr>
									<tr>
										<td class="sectionhead1" align="left">Bill to Loan #</td>
										<td class="TextMatter" align="left">:<bean:write name='AddCustomer' property='answer(Object::Customer::BilltoLoan)' />
										</td>	
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
		<tr><td><html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Entity::EntityType)" value="CUSTOMER" /></td></tr>
		<bean:define id="ownerId"	property="answer(Object::UserDetail::ownerId)" name="LoginPage"	scope="session" />
		<tr><td><html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)"	value="<%=ownerId.toString()%>" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" /></td></tr>
		<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage"	scope="session" />
		<tr><td><html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)"	value="<%=userName.toString()%>" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)"	value="<%=ownerId.toString()%>" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)"	value="<%=ownerId.toString()%>" /></td></tr>
		<tr><td><html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)"	value="<%=userName.toString()%>" /></td></tr>
		<tr><td><html:hidden name="DataForm" property="answer(versionid)" value="3" />	</td></tr>
		<tr><td><html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success" /></td></tr>
		<tr><td><html:hidden name="DataForm" property="answer(RootTemplate)" value="yes" /></td></tr>
		<tr><td><html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)"	value="yes" /></td></tr>
		<tr><td><html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" /></td></tr>	
	</table>
</html:form>


