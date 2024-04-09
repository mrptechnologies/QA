<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:parameter id="submissionIdNBF" name="submissionIdNBF" />
<bean:parameter id="ownerId" name="ownerId" />
<bean:parameter id="submissionVerIdNBF" name="submissionVerIdNBF" />
<bean:parameter id="isAppEnabled" name="isAppEnabled" />
<bean:parameter id="cId" name="cId" />

<%int dataBaseIdViewPrivillage=0;%>
<%String customerCreatedDate=""; %>
<dmshtml:dms_static_with_connector ruleName='privilage'
	property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or'
	negated="true">
	<%dataBaseIdViewPrivillage=1;%>
</dmshtml:dms_static_with_connector>
<%String agencyIdTemp="";%>
<%String agencyIdtoLink="";%>
<%String strAgentFName="";%>
<%String strAgentLName="";%>
<%long lngAgentId1=0;%>
<%long lngAgentId=0;%>
<%long lngAgencyTemp=0;%>
<%long agencyId2=0;%>
<%String agencyName2="";%>
<%long lngagentId=0;
String agencyName="";
String generalAgencyId = "";
long agencyId=0;
long lobId=0;
String clearanceStatus ="";
String insuredStatus ="";
String submissionProposedDate="";
%>
<%String agentFName="";%>
<%String agentLName="";%>
<%long lngAgencyId=0;%>
<dmshtml:Get_Submission_Insured_Agency_Agent_Details
	nameInSession="customerDetail1" customerId="<%=cId.toString()%>"
	submissionId='<%=""+submissionIdNBF%>'
	dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
<logic:present name="customerDetail1" scope="request">
	<bean:define id="customerDetailMap" name="customerDetail1"
		scope="request" type="com.dms.ejb.data.QuestionHashMap" />
	<%try{%>
	<%agencyId=Long.parseLong(customerDetailMap.getString("agencyid"));%>
	<%}catch(Exception nfe) {agencyId=0;    }%>
	<%try{
				generalAgencyId = customerDetailMap.getString("generalagencyid");
			lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
			}catch(Exception nfe) {lngAgentId=0;    }																						
			agencyIdTemp=""+agencyId;
			lngAgencyTemp=Long.parseLong(agencyIdTemp);
			agencyId2=Long.parseLong(agencyIdTemp);
			agencyName2=customerDetailMap.getString("agencyname");
			clearanceStatus = customerDetailMap.getString("ClearanceStatus");
			insuredStatus = customerDetailMap.getString("custStatus");
			if(insuredStatus.equalsIgnoreCase("Lapsed") || insuredStatus.equalsIgnoreCase("Declined") || insuredStatus.equalsIgnoreCase("Registered")) {
				isAppEnabled="N";
			}
			submissionProposedDate = customerDetailMap.getString("SubmissionProposedEffectiveDate");
			//lobId =Long.parseLong(""+customerDetailMap.getString("LobId"));
			%>
				 <bean:define id="agencyIdTemp1" name="AddCustomer" property="answer(Agency::AgencyId)"/>
	 <bean:define id="AgentId1" name="AddCustomer" property="answer(AgentId)"/>	 
	<%	if(!agencyIdTemp1.toString().equals("")) {		
			
			String agencyAgentId ="";
			
			if((agencyIdTemp1.toString().indexOf("::"))>0){														
				String ids[]=(""+agencyIdTemp1).split("::");
		     			agencyIdTemp1=ids[0];
		     			agencyAgentId=ids[1];
				}
			agencyIdTemp=agencyIdTemp1.toString();	
			lngAgencyTemp=Long.parseLong(agencyIdTemp);
			 if(lngAgencyTemp>0){%>
			<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
			
			<logic:present name="agencyDetail2" scope="request">
				<bean:define id="agdetail2" name="agencyDetail2" scope="request"
										type="com.dms.ejb.data.QuestionHashMap" />
				<%agencyId2=Long.parseLong(agdetail2.getString("agencyid"));			
				agencyName2=agdetail2.getString("agencyname");	%>	
			</logic:present>
		<%}
			 long lgAgentId1=0;
				try {				
				if(!agencyAgentId.equals("")){
					AgentId1=agencyAgentId;
				}
				lgAgentId1=Long.parseLong(AgentId1.toString());															
			} catch(Exception ex){} %>	 
			
			<%if(lgAgentId1>0){%>
			<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId='<%=""+lgAgentId1%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
			<logic:present name="agentDetail" scope="request">
				<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
				<%lngAgentId=lgAgentId1;%>
				<%agentFName=agentDetail1.getString("agentfname");%>
				<%agentLName=agentDetail1.getString("agentlname");%>
			</logic:present>
		<%}
			
	}%>
		
</logic:present>

<html:form
					action="/SavedSubmissionInsured" styleId="insuredTab"
					onsubmit="return validateFields()">
					<table border="0" width="100%" cellspacing="0" cellpadding="0"
						class="todotab_yellowbox">
						<dmshtml:dms_static_with_connector ruleName='privilage'
							property='<%=new String[]{"CHANGE_INSURED_AGENCY"}%>'
							connector='or' negated="true">
							<tr>
								<td align="left" colspan="3">
								<h3>Agency Information</h3>
								</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="3">
								<table width="100%" border="0">
									<tr>
										<td class="field" align="right" width="38%">Agency *</td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td class="links" width="30%"><html:text name="AddCustomer"
											property="answer(AgencyName)" value='<%=agencyName2%>'
											size="60" maxlength="60" styleClass="txtbox" readonly="true"
											styleId="Agenname" /></td>										
										<td width="30%">
										<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+insuredStatus %>" negated="true"><IMG SRC="../Images/zipcodefind.jpg"
											BORDER="0" align="left" ALT="Search for Agency."
											onmouseover="this.style.cursor='hand';"
											onclick="return GoTOSubmissionAgencyFind()">
										</dmshtml:dms_isPresent>
										</td>
									</tr>
									<tr>
										<td colspan="4">&nbsp;</td>
									</tr>
								</table>
								</td>
							</tr>
						</dmshtml:dms_static_with_connector>

						<tr>
							<td colspan="3" align="left">
							<h3>Submission Insured Information</h3>
							</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td class="field" align="right" width="34%">Insured Name Type:</td>
							<td width="2%">&nbsp;</td>
							<td class="links" style="Class:txtbox" align="left" width="64%">
							<html:select name="AddCustomer"
								property="answer(Object::Customer::NameType)"
								styleClass="txtbox" styleId="NameType"
								onchange="showCompanyInformation(this.form)">
								<html:option value="Person" styleClass="txtbox">Person</html:option>
								<html:option value="Company" styleClass="txtbox">Company</html:option>
							</html:select></td>
						</tr>
						<%if(dataBaseIdViewPrivillage==1) {%>
						<tr>
							<td class="field" align="right" width="34%">Insured Id</td>
							<td width="2%">&nbsp;</td>
							<td class="TextMatter" align="left" width="64%"><bean:write
								name='AddCustomer'
								property='answer(Object::Customer::CustomerId)' /></td>
						</tr>
						<%}%>
						<!--  to pass to the script -->
						<html:hidden name="AddCustomer"
							property="answer(Object::Customer::CustomerId)"
							styleId="CustomerID" />
						<dmshtml:GetParameterByOwnerId nameInSession="paramValue"
							ownerId="<%=ownerId.toString()%>"
							dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'
							parameterName="CUSTOMER_NAME_LENGTH" />
						<%
					  String nameFieldLength =(String) request.getAttribute("paramValue");
					if (nameFieldLength.length() <= 0 && nameFieldLength == null){
						 nameFieldLength = "60";								   
					  }
					
					%>
						<tr>
							<td width="34%" align="right" class="field" id="insuredNameBlock"><span id="InsName1"><font
								color="red">* Legal Name 1:</font></span></td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::CustomerName)" size="50"
								maxlength="50" styleClass="txtbox" styleId="InsuredName" /></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field" id="insuredNameBlock"><span id="InsName2">Legal
							Name 2:</span></td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::CustomerName2)" size="50"
								maxlength="50" styleClass="txtbox" styleId="InsuredName2" /></td>
						</tr>
						<tr>
							<td width="34%" class="field" align="right">Name Code:</td>
							<td width="2%">&nbsp;</td>
							<td align="left" width="64%"><dmshtml:dms_static_with_connector
								ruleName='privilage'
								property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>'
								connector='or' negated="true">
								<html:text name="AddCustomer"
									property="answer(Object::Customer::CustomerNumber)" size="8"
									maxlength="8" styleClass="txtbox" styleId="InsuredNumber" />
							</dmshtml:dms_static_with_connector> <dmshtml:dms_static_with_connector
								ruleName='privilage'
								property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>'
								connector='or' negated="false">
								<bean:write name="AddCustomer"
									property="answer(Object::Customer::CustomerNumber)" />
							</dmshtml:dms_static_with_connector></td>

						</tr>
						<tr id="DBABlock">
							<td width="34%" align="right" class="field">Insured DBA:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::DBA)" size="65"
								maxlength="<%=nameFieldLength%>" styleClass="txtbox"
								styleId="DBA" /></td>
						</tr>
						
						<!---------------------- Select Industry Name --------------------------------------->


<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="true">
						<tr>
							<td width="34%" class="field" align="right"><font color="red">*Industry:</font> <dmshtml:get_industry_name
								nameInSession="arListIndustry"
								ownerId="<%=Long.parseLong(ownerId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /></td>
							<td width="2%">&nbsp;</td>	
							<td width="64%" align="left">
							<html:select name="AddCustomer"
								property="answer(Object::Submission::IndustryName)"
								styleClass="txtbox" styleId="IndustryName">
								<html:option value="">Select</html:option>
								<logic:present name="arListIndustry" scope="request">
									<logic:iterate id="arListIndustry" name="arListIndustry">
										<bean:define id="industryName1" name="arListIndustry"
											property="Object::Product::IndustryName"></bean:define>
										<html:option value='<%=industryName1.toString()%>'>
											<bean:write name="arListIndustry"
												property="Object::Product::IndustryName" />
										</html:option>
									</logic:iterate>
								</logic:present>
							</html:select></td>
						</tr>
</dmshtml:dms_static_with_connector>						
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" align="left">
							<h3>Primary Business Address</h3>
							</td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">Address Line 1:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::StreetName)" size="60"
								maxlength="50" styleClass="txtbox" styleId="Address1" /></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">Address Line 2:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::Address2)" size="60"
								maxlength="50" styleClass="txtbox" styleId="Address2" /></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field"><font color="red">*
							City:</font></td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::City)" maxlength="40"
								styleClass="txtbox" styleId="City" /></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">County:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text property="answer(Object::Customer::County)" maxlength="40" styleId="County" /></td>							
					   </tr>
						<tr>
							<td width="34%" align="right" class="field"><font color="red">*
							State/Province:</font></td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left">
							<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/><html:select name="AddCustomer"  property="answer(Object::Customer::State)"  styleId="State">
		<html:option value ="">Select</html:option>
        <logic:present name="arStates" scope="request">
           <logic:iterate id="details" name="arStates" scope="request" >
		    <bean:define id='test' name="details"  property="typeDesc" />
		    <html:option value ='<%=test.toString()%>'>
		       <bean:write name="details" property="dmsType" />
		    </html:option>
		</logic:iterate>
		</logic:present>
		</html:select>
		</td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field"><font color="red">*
							Zip Code:</font></td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::Zip)" maxlength="10"
								style="width:150px;" styleClass="txtbox" styleId="Zip" /> <a
								href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search"
								title="Search for zip code, state, county"
								onClick="return ZipCodePopup(this, 'ZipCode');" />
								<dmshtml:dms_isPresent property="<%=new String[]{"In Progress","Referred"}%>" value="<%=""+insuredStatus %>" negated="true">
								<IMG SRC="../Images/FindZipCode.jpg" BORDER="0" align="top"
								ALT="Search for Zip code, City, State and County."></dmshtml:dms_isPresent></a></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">Country:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:select name="AddCustomer"
								property="answer(Object::Customer::Address::Country)"
								styleClass="txtbox" styleId="Country">
								<html:option value="USA" styleClass="txtbox">United States</html:option>
							</html:select></td>
						</tr>
						<dmshtml:dms_static_with_connector ruleName='privilage'
							property='<%=new String[]{"LIU_SUBMISSION_SHOW"}%>'
							connector='or' negated="true">
							<tr>
								<td align="left" colspan="3">
								<h3>Genius Address</h3>
								</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td class="field" align="right" width="34%">Is Genius Address
								same as Business Address?</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left"><input type="radio"
									name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)"
									value="Y" id="MailingAddressSameAsBusinessAddress_Y"
									onClick="displayMailingAddressBlock()" />Yes <input
									type="radio"
									name="answer(Object::Submission::MailingAddressSameAsBusinessAddress)"
									value="N" id="MailingAddressSameAsBusinessAddress_N" />No&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="3">
								<div id="MailingAddressBlock">
								<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
									CELLPADDING="2">
									<tr>
										<td class="field" align="right" width="34%">Genius Address 1</td>
										<td width="2%">&nbsp;</td>
										<td width="64%" align="left"><html:text
											property="answer(Object::Submission::MailingAddress1)"
											styleId="MailingAddress1" size="60" maxlength="50"
											styleClass="txtbox" /></td>
									</tr>
									<tr>
										<td class="field" align="right" width="34%">Genius Address 2</td>
										<td width="2%">&nbsp;</td>
										<td width="63%" align="left"><html:text
											property="answer(Object::Submission::MailingAddress2)"
											styleId="MailingAddress2" size="60" maxlength="50"
											styleClass="txtbox" /></td>
									</tr>
									<tr>
										<td class="field" align="right" width="34%">Genius Address 3</td>
										<td width="2%">&nbsp;</td>
										<td width="64%" align="left"><html:text
											property="answer(Object::Submission::MailingAddress3)"
											styleId="MailingAddress3" size="60" maxlength="50"
											styleClass="txtbox" /></td>
									</tr>
									<tr>
										<td class="field" align="right" width="34%">Genius Address 4</td>
										<td width="2%">&nbsp;</td>
										<td width="64%" align="left"><html:text
											property="answer(Object::Submission::MailingAddress4)"
											styleId="MailingAddress4" size="60" maxlength="50"
											styleClass="txtbox" /></td>
									</tr>
									<tr>
										<td class="field" align="right" width="34%">Genius Address 5</td>
										<td width="2%">&nbsp;</td>
										<td width="64%" align="left"><html:text
											property="answer(Object::Submission::MailingAddress5)"
											styleId="MailingAddress5" size="60" maxlength="50"
											styleClass="txtbox" /></td>
									</tr>
								</table>
								</div>

								</td>
							</tr>
						</dmshtml:dms_static_with_connector>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" align="left">
							<h3>Contact Information</h3>
							</td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">Email Address:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::EMailAddress)"
								onblur="checkEmailAddress(this.form)" size="30"
								styleClass="txtbox" styleId="emailID" /></td>
						</tr>

						<tr>
							<td width="34%" align="right" class="field">Phone Number:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><dmshtml:dms_text name="AddCustomer"
								property="answer(Object::Customer::WorkPhoneAreaCode)" size="3"
								maxlength="3" styleClass="txtbox" styleId="PhoneNumber1"
								onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].PhoneNumber2.focus()}" />&nbsp;<dmshtml:dms_text
								name="AddCustomer"
								property="answer(Object::Customer::WorkPhoneExchangeCode)"
								size="3" maxlength="3" styleClass="txtbox"
								styleId="PhoneNumber2"
								onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].PhoneNumber3.focus()}" />&nbsp;<dmshtml:dms_text
								name="AddCustomer"
								property="answer(Object::Customer::WorkPhone)" size="4"
								maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" /></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">Fax Number:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><dmshtml:dms_text name="AddCustomer"
								property="answer(Object::Customer::FaxAreaCode)" size="3"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber1"
								onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].FaxNumber2.focus()}" />&nbsp;<dmshtml:dms_text
								name="AddCustomer"
								property="answer(Object::Customer::FaxExchangeCode)" size="3"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber2"
								onkeyup="if(event.keyCode != 9 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 13 && this.value.length==3) {document.forms[0].FaxNumber3.focus()}" />&nbsp;<dmshtml:dms_text
								name="AddCustomer" property="answer(Object::Customer::Fax)"
								size="4" maxlength="4" styleClass="txtbox" styleId="FaxNumber3" /></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">Contact First Name:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::ContactFName)" size="65"
								maxlength="<%=nameFieldLength%>" styleClass="txtbox"
								styleId="ContactFirstName" /></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">Contact Last Name:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::ContactLName)" size="65"
								maxlength="<%=nameFieldLength%>" styleClass="txtbox"
								styleId="ContactLastName" /></td>
						</tr>
						<tr>
							<td width="34%" align="right" class="field">Contact Title:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::ContactTitle)" size="4"
								styleClass="txtbox" styleId="ContactTitle" /></td>
						</tr>
						<tr id="CompanyInfmnBlock">
							<td colspan="3" align="left">
							<h3>Company Information</h3>
							</td>
						</tr>
						<tr id="CompanywebsiteBlock">
							<td width="34%" align="right" class="field">Website:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:text name="AddCustomer"
								property="answer(Object::Customer::ContactURL)" size="30"
								styleClass="txtbox" styleId="CompanyWebSite" /></td>
						</tr>
						<tr id="FOBBlock">
							<td width="34%" align="right" class="field">Form of Business:</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:select name="AddCustomer"
								property="answer(Object::Customer::Business)"
								styleClass="txtbox" styleId="FormOfBusiness"
								onchange="showOtherFOBInformation(this.form)">
								<html:option value="">Select</html:option>
								<html:option value="Corporation">Corporation</html:option>
								<html:option value="Sole Proprietor">Sole Proprietor</html:option>
								<html:option value="Partnership">Partnership</html:option>
								<html:option value="Joint Venture">Joint Venture</html:option>
								<html:option value="Other">Other</html:option>
							</html:select></td>
						</tr>
						<tr id="otherFOBBlock">
							<td width="34%" align="right" class="field">If Other,please
							Specify</td>
							<td width="2%">&nbsp;</td>
							<td width="64%" align="left"><html:textarea name="AddCustomer"
								property="answer(Object::Customer::OtherBusiness)" rows="4"
								cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
							</td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<dmshtml:dms_static_with_connector ruleName='privilage'
							property='<%=new String[]{"OBJECT-DELETE"}%>' connector='or'
							negated="true">
							<tr>
								<td width="34%" align="right" class="field">Active:</td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left"><html:select name="AddCustomer"
									property="answer(Object::Customer::active)" styleClass="txtbox">
									<html:option value="Y">Yes</html:option>
									<html:option value='D'>No</html:option>
								</html:select></td>
							</tr>
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_isPresent
							property="<%=new String[]{"In Progress","Referred"}%>"
							value="<%=""+insuredStatus %>" negated="true">
							<tr>
								<td width="34%" align="right" title="<bean:message key='ToolTip.SubmissionSummary.Save'/>"><html:submit value="Save"
									property="answer(button)" styleClass="covbutton" /></td>
								<td width="2%">&nbsp;</td>
								<td width="64%" align="left" title="<bean:message key='ToolTip.SubmissionSummary.Reset'/>"><html:reset value="Reset"
									styleClass="covbutton" /></td>

							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
						</dmshtml:dms_isPresent>
					</table>

					<bean:define id="Customerid" name="AddCustomer"
						property="answer(Object::Customer::CustomerId)" />
					<%if(!Customerid.toString().equals("")) {%>
					<html:hidden property="answer(Object::Customer::CustomerId)"
						value="<%=Customerid.toString()%>" />
					<%}%>
					<html:hidden property="answer(Object::Submission::SubmissionId)"
						value='<%=""+submissionIdNBF %>' />
					<html:hidden property="answer(Object::Submission::SubmissionVerId)"
						value='<%=""+submissionVerIdNBF %>' />
					<html:hidden property="answer(Object::Submission::Status)"
						value='<%=""+insuredStatus %>' />
					<html:hidden property="answer(Object::Submission::ClearanceStatus)"
						value='<%=""+clearanceStatus %>' />
					<html:hidden property="answer(duplicateAllowed)" value="no" />
					<html:hidden property="answer(Object::UserDetail::ownerId)"
						value="<%=ownerId.toString()%>" styleId="ownerId" />
					<html:hidden property="answer(Object::Submission::OwnerId)"
						value="<%=ownerId.toString()%>" styleId="ownerId" />
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
					<html:hidden property="answer(requestForm)" value="Submission" />
					<html:hidden
						property="answer(Object::Application::ApplicationType)"
						value="SUBMISSION_APPLICATION" />
					<html:hidden property="answer(Object::Customer::User)"
						value="<%=userName.toString()%>" />
					<html:hidden property="answer(Object::Submission::CreatedBy)"
						value="<%=userName.toString()%>" />
					<html:hidden property="answer(Object::Submission::UpdatedBy)"
						value="<%=userName.toString()%>" />
					<html:hidden
						property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)"
						value="<%=ownerId.toString()%>" />
					<html:hidden
						property="answer(Object::Customer::Addresses::HOME::Object::Address::User)"
						value="<%=userName.toString()%>" />
						<html:hidden
						property="answer(Object::Submission::ProposedEffectiveDate)"
						value="<%=submissionProposedDate.toString()%>" />
						
					<html:hidden
						property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)"
						value="<%=ownerId.toString()%>" />
					<html:hidden
						property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)"
						value="<%=userName.toString()%>" />
					<html:hidden name="DataForm" property="answer(versionid)" value="3" />
					<html:hidden name="DataForm" property="answer(RootTemplate)"
						value="yes" />

					<html:hidden property="answer(Object::Submission::InsuredId)"
						value="<%=Customerid.toString()%>" />
					<html:hidden property="answer(AgentId)" value="<%=""+lngAgentId%>" />
					<%if(agencyId2>0){%>
					<html:hidden property="answer(Agency::AgencyId)"
						value="<%=""+agencyId2%>" />
					<%}%>

					<html:hidden name="DataForm"
						property="answer(form::ForwordControl)" value="success" />
					<html:hidden name="DataForm"
						property="answer(form::ForwordControl)" value="success" />
					<%if(agencyId2>0){%>
					<html:hidden property="answer(Agency::AgencyId)"
						value="<%=""+agencyId2%>" />
					<%}%>
					<%if(agencyId2>0){%>
					<html:hidden property="answer(Object::Agency::AgencyId)"
						value="<%=""+agencyId2%>" />
					<%}%>

					<bean:define id="Customerid" name="AddCustomer"
						property="answer(Object::Customer::CustomerId)" />
					<%	if(!Customerid.equals("")){%>
					<html:hidden property="answer(Object::Customer::CustomerId)"
						value="<%=Customerid.toString()%>" />
					<%}	
	%>
					<html:hidden property="TabPanelName"
						value="<%="Submission_Panel"%>" />
					<%
		if(""+submissionIdNBF!=null && ""+submissionVerIdNBF!=null){
			if((""+submissionIdNBF).length()>0 && (""+submissionVerIdNBF).length()>0){
				com.dms.ejb.data.QuestionHashMap applicationMap= new com.dms.ejb.data.QuestionHashMap();		
				applicationMap.put("Object::Submission::SubmissionId",""+submissionIdNBF);
				applicationMap.put("Object::Submission::SubmissionVerId",""+submissionVerIdNBF);
				applicationMap.put("Object::Application::ApplicationType","SUBMISSION_APPLICATION");
				applicationMap.put("Object::Customer::CustomerId",""+Customerid);
				applicationMap.put("TabPanelName","Submission_Panel");
				request.setAttribute("ApplicationMap",applicationMap);
			}
		}
		%>
				</html:form>