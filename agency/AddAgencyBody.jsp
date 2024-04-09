<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddAgency.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>

<Script type="text/javascript">

function displayMailingAddressBlock() {
 document.getElementById("MailingAddressBlock").style.display="block";
}
function hiddenMailingAddressBlock() {
 document.getElementById("MailingAddressBlock").style.display="none";
}
</Script>

<html:form action="/AddAgency" >
<div class="SubjectivityPage1">									
<div class="content">							
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td valign="top" align="left" width="100%" colspan="2">
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td class="Subjectivityformhead" colspan="4" ><h2 class="left">ADD AGENCIES </h2> </td>
				</tr>
				<tr>				
					<td>&nbsp;</td>
				</tr>
	
				<tr>
					<td class="TextMatter"><bean:message key="Agency.Description"/>	</td>
				</tr>
				
			</table>
		</td>	
		
	</tr>
	<logic:present name="message" scope="request">
		<tr colspan="2">
			<td class="Error">
				<%=request.getAttribute("message")%>
			</td>
		</tr>
	</logic:present>
	<logic:present name="msgInfo" scope="request">
		<tr colspan="2">
			<td class="Error">
				<%=request.getAttribute("msgInfo")%>
			</td>
		</tr>
	</logic:present>
	<TR>
		<TD COLSPAN="2" class="Error">
		<html:errors/>
		</TD>
	</TR>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr>
					<td>
						<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2"> 
							<tr>
								<td  align="left" colspan="3"><h3>AGENCY INFORMATION</h3>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="Agencies.Agencyname" />*</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<html:text property="answer(Object::Agency::BusinessName)" size="50" maxlength="50" styleClass="txtbox"/>
								</td>
							</tr>
							<tr>
								<td class="field" width="35%" align="right">Agency Name code</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<html:text property="answer(Object::Agency::AgencyCode)" size="26" maxlength="50" styleClass="txtbox"/>
								</td>
							</tr>
							
							<tr>
								<td class="field" width="35%" align="right">List Name</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<html:text property="answer(Object::Agency::ExternalSystemCode)" size="26" maxlength="50" styleClass="txtbox"/>
								</td>
							</tr>
							
							<tr>
								<td class="field" align="right" width="35%">
										<bean:message key="GeneralAgency.GeneralAgency" />
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<dmshtml:get_general_agencies nameInSession="arListgeneralagencies"  parentAgencyId="-1" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
									<html:select property="answer(Object::Agency::ParentAgencyId)" styleClass="txtbox" styleId="parentAgencyId">
										<html:option value ="">Select</html:option>
										<html:option value ="0">None</html:option>
										<logic:present name="arListgeneralagencies" scope="session">
										<logic:iterate id="details" name="arListgeneralagencies" scope="session" >
								   		<bean:define id='test' name="details"  property="answer(Object::Agency::AgencyId)" />
								   		<html:option value ='<%=test.toString()%>'>
								    	<bean:write name="details" property="answer(Object::Agency::BusinessName)" />
								    	</html:option>
										</logic:iterate>
										</logic:present>
									</html:select>
								</td>
							</tr>
							<TR>
								<td class="field" align="right">
									Assigned Underwriter
								</td>
								<td width="2%">&nbsp;</td>
								<!-- -->
									<%
											com.dms.ejb.data.QuestionHashMap qMapALLENTITIES =   new com.dms.ejb.data.QuestionHashMap(10);				
											qMapALLENTITIES.put("ownerId", ownerId);
											qMapALLENTITIES.put("dbname", ""+com.dms.web.util.DbUtils.getWriteDS(pageContext));
											qMapALLENTITIES.put("Object::Entity::EntityType", "UNDERWRITER");			
									%>
									<html:hidden property="answer(Object::Agency::LinkedEntityType)" value="UNDERWRITER" />
									<dmshtml:execute_rules nameInSession="GETALLENTITIESBYTYPE"  dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"  formName="form::GETALLUW"  answerMap="<%=qMapALLENTITIES%>"  processInstance="preprocess" />
									<logic:present name ='GETALLENTITIESBYTYPE' scope ='request'>
										<%
											if(qMapALLENTITIES.containsKey("ALLENTITIES_BYTYPE"))
											{
								                  java.util.ArrayList arrList=null;
								                  Object objList=qMapALLENTITIES.get("ALLENTITIES_BYTYPE");
								                   if((objList!=null) &&(objList instanceof java.util.ArrayList))
													{
										%>
											<td align="left" >
												<html:select property="answer(Object::Agency::LinkedEntityId)" styleClass="txtbox">
													<html:option value ="">Select</html:option>
										<%
								                      arrList=(java.util.ArrayList)objList;
													   for (int i=0; i<arrList.size(); i++)  
														{ 
														   com.dms.ejb.data.QuestionHashMap arrEntitiesQMap=(com.dms.ejb.data.QuestionHashMap)arrList.get(i);
										%>
															<html:option value ='<%=arrEntitiesQMap.getString("ENTITY_ID")%>'>
																<%=arrEntitiesQMap.getString("ENTITY_FNAME") + " " + arrEntitiesQMap.getString("ENTITY_LNAME")%>
															</html:option>
										<%
														}
										%>
												</html:select>
											</td>
										<%
													}
												}
										%>
									</logic:present>
								<!-- -->
							</TR>
							 <tr>
								<td class="field" align="right" width="35%">Agency Commission</td>
								<td width="2%">&nbsp;</td>
								<td class="FormLabels" width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::AgencyCommission)" size="6" maxlength="6" value="7.5" styleClass="txtbox" styleId="AgencyCommission"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">Tax Id</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::TaxId)" size="20" maxlength="20" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">State License #</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::Agency::StateLicenseNumber)" size="20" maxlength="20" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">License #</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::Agency::LicenseNumber)" size="20" maxlength="20" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">Licensee Name</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::Agency::LicenseeName)" size="20" maxlength="30" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">Status</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<html:select property="answer(Object::Agency::Status)" styleClass="txtbox">
										<html:option value ="">Select</html:option>
										<html:option value="A">Account Current</html:option>
										<html:option value="N1">NO BUSINESS - BAD PAY</html:option>
										<html:option value="N2">NO BUSINESS - INACTIVE</html:option>
										<html:option value="N3">NO BUSINESS - OUT OF BUSINESS</html:option>
										<html:option value="N4">NO BUSINESS - CROSS-REFERENCED</html:option>
										<html:option value="N5">NO BUSINESS - INSUFFICIENT VOLUME</html:option>
										<html:option value="C1">CASH WITH APP</html:option>
										<html:option value="C2">FAXED AGREEMENT- ACQUIRED</html:option>
										<html:option value="H">HOLD - SEE ACCOUNTING</html:option>
										<html:option value="P">PENDING - NEED BRKR AGREE. TO BIND</html:option>
										<html:option value="R">RENEWALS ONLY - NO NEW BUSINESS</html:option>
										<html:option value="R1">RENEWALS ONLY - CASH WITH APP</html:option>
										<html:option value="X2">AcelaRate</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">Contract Start Date</td>
								<td width="2%">&nbsp;</td>
								<td class="links" width="63%" align="left">
									<html:text  property ="answer(StartMonth)" size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].StartDate.focus()}" />&nbsp;
									<html:text  property ="answer(StartDate)"  size="2" maxlength="2" styleClass="txtbox" styleId="StartDate" onkeyup="if(this.value.length==2) {document.forms[0].StartYear.focus()}" />&nbsp;
									<html:text  property ="answer(StartYear)"  size="4" maxlength="4" styleClass="txtbox" styleId="StartYear" />&nbsp;(MM/DD/YYYY)
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">Contract End Date</td>
								<td width="2%">&nbsp;</td>
								<td class="links" width="63%" align="left">
									<html:text  property ="answer(EndMonth)"  size="2" maxlength="2" styleClass="txtbox" onkeyup="if(this.value.length==2) {document.forms[0].EndDate.focus()}" />&nbsp;
									<html:text  property ="answer(EndDate)"  size="2" maxlength="2" styleClass="txtbox" styleId="EndDate" onkeyup="if(this.value.length==2) {document.forms[0].EndYear.focus()}" />&nbsp;
									<html:text  property ="answer(EndYear)"  size="4" maxlength="4" styleClass="txtbox" styleId="EndYear" />&nbsp;(MM/DD/YYYY)
								</td>
							</tr>
							
						<!-- 	
							<tr>
								<td class="FormLabels" align="left" width="49%">Dcco1&nbsp;&nbsp;&nbsp;</td>
								<td><html:text property="answer(Object::AgencyAdditional::Dcco1)" size="23" maxlength="23" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="49%">Dcco2&nbsp;&nbsp;&nbsp;</td>
								<td><html:text property="answer(Object::AgencyAdditional::Dcco2)" size="23" maxlength="23" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="49%">Dcco3&nbsp;&nbsp;&nbsp;</td>
								<td><html:text property="answer(Object::AgencyAdditional::Dcco3)" size="23" maxlength="23" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="49%">Prioity Code1&nbsp;&nbsp;&nbsp;</td>
								<td><html:text property="answer(Object::AgencyAdditional::BRPrioity1)" size="10" maxlength="10" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="49%">Prioity Code2&nbsp;&nbsp;&nbsp;</td>
								<td><html:text property="answer(Object::AgencyAdditional::BRPrioity2)" size="10" maxlength="10" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="49%">Prioity Code3&nbsp;&nbsp;&nbsp;</td>
								<td><html:text property="answer(Object::AgencyAdditional::BRPrioity3)" size="10" maxlength="10" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="49%">Prioity Code4&nbsp;&nbsp;&nbsp;</td>
								<td><html:text property="answer(Object::AgencyAdditional::BRPrioity4)" size="10" maxlength="10" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="49%">Prioity Code5&nbsp;&nbsp;&nbsp;</td>
								<td><html:text property="answer(Object::AgencyAdditional::BRPrioity5)" size="10" maxlength="10" styleClass="txtbox"/></td>
							</tr> --> 
							
							<tr>
								<td height="8px"></td>
							</tr>
							<tr>
								<td  align="left" colspan="3"><h3>PRINCIPAL BUSINESS ADDRESS</h3></td>
							</tr>
							<tr>
								<td height="8px"></td>
							</tr>
							<tr>
									<td class="field" align="right" width="35%">Address 1</td>
									<td width="2%">&nbsp;</td>
									<td width="63%" align="left"><html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address1)"  styleId="Address1" size="30" maxlength="50"/></td>
							</tr>
							
							<tr>
								<td class="field" align="right" width="35%">Address 2</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Address2)" styleId="Address2" size="30" maxlength="50"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.city" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::City)" size="20" maxlength="20" styleClass="txtbox" styleId="City"/></td>
							</tr>
							<tr>
									<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.state" />*</td>
									<td width="2%">&nbsp;</td>
									<td width="63%" align="left"><dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
									<html:select property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::State)" styleId="State" styleClass="txtbox">
									<html:option value ="none">Select</html:option>
									
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
								<td class="field" align="right" width="35%">
									<bean:message key="GeneralAgency.zip"/>*
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<html:text name="AddAgency" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Zip)" size="20" maxlength="20" styleClass="txtbox" styleId="Zip"/>
										<!--Zipcode lookup start -->
									<a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=AddAgency&HomeFlag=Business&clear=yes" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County." ></a>
									
								</td>
								<!--  end-->
				                <!-- </td>-->
							</tr>
			
							<tr>
								<td class="field" align="right" width="35%">
									<bean:message key="GeneralAgency.country" />
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									<dmshtml:dms_radio property = "answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="US" />
									<bean:message key="GeneralAgency.us"/>&nbsp;&nbsp;&nbsp;
									<dmshtml:dms_radio property ="answer(Object::Agency::Addresses::BUSINESS::Object::Address::Country)" value="Canada" />
									<bean:message key="GeneralAgency.canada"/>
								</td>
							</tr>
							
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.phone" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									
									<html:text property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::WorkPhone)" size="30" maxlength="30" styleId="BusinessPhoneNum" styleClass="txtbox"/>
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">
									<bean:message key="GeneralAgency.fax" />
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									
									<html:text property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Fax)" size="30" maxlength="30" styleId="BusinessFaxNum" styleClass="txtbox"/>
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">
									Web Site
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									
									<html:text property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::Url)" size="30" maxlength="30" styleId="BusinessContactUrl" styleClass="txtbox"/>
								</td>
							</tr>
							<tr>
								<td height="8px"></td>
							</tr>	
							<tr>
							   <td  align="left" colspan="3"><h3>MAILING ADDRESS </h3> </td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td class="field" align="right">
									Is Mailing Address same as Business?
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
								
								  <input type="radio" name="answer(Object::Agency::MailingAddressSameAsBusiness)" value="Y" id="MailingAddressSameAsBusiness_Y" checked="checked" onclick="hiddenMailingAddressBlock()"/>Yes
								  <input type="radio" name="answer(Object::Agency::MailingAddressSameAsBusiness)" value="N" id="MailingAddressSameAsBusiness_N" onclick="displayMailingAddressBlock()" />No&nbsp;&nbsp;
								</td>
							</tr>
							
							<tr>
							<td colspan="3">
							<div id="MailingAddressBlock" style="display:none;">
                             <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
                             <tr>
                             <td class="field" align="right" width="35%">
								Mailing Address 1
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
								   <html:text property="answer(Object::Agency::MailingAddress1)" styleId="MailingAddress1" styleClass="txtbox" maxlength="50" size="30" />
								</td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">
									Mailing Address 2
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									
									<html:text  property="answer(Object::Agency::MailingAddress2)" styleId="MailingAddress2" styleClass="txtbox" maxlength="50" size="30" />
								</td>
							</tr><tr>
								<td class="field" align="right" width="35%">
									Mailing Address 3
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									
									<html:text  property="answer(Object::Agency::MailingAddress3)" styleId="MailingAddress3" styleClass="txtbox" maxlength="50" size="30" />
								</td>
							</tr><tr>
								<td class="field" align="right" width="35%">
									Mailing Address 4
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									
									<html:text  property="answer(Object::Agency::MailingAddress4)" styleId="MailingAddress4" styleClass="txtbox" maxlength="50" size="30" />
								</td>
							</tr><tr>
								<td class="field" align="right" width="35%">
									Mailing Address 5
								</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left">
									
									<html:text  property="answer(Object::Agency::MailingAddress5)" styleId="MailingAddress5" styleClass="txtbox" maxlength="50" size="30" />
								</td>
							</tr>
						    </table>
								</div>
							</td>
							</tr>
						    <tr><td>&nbsp;</td></tr>
							<tr>
								<td align="left" colspan="3"><h3>PERSONAL INFORMATION FOR AGENCY ADMINISTRATIVE USER</h3></td>
							</tr>
							<tr>
								<td height="8px"></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.firstname" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::firstname)" styleId="FirstName" size="30" maxlength="30" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.lastname" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::lastname)" styleId="LastName" size="30" maxlength="30" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.middlename" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::middlename)" size="5" maxlength="5" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.jobtitle" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::jobtitle)" size="50" maxlength="50" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.jobfunction" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::AgencyAdditional::jobfunction)" size="50" maxlength="50" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.phone" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::HomePhone)" size="30" maxlength="30" styleId="HomePhoneNum" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.fax" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::Fax)" size="30" maxlength="30" styleId="HomeFaxNum" styleClass="txtbox"/></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.email" /></td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><html:text property="answer(Object::Agency::Contacts::HOME::Object::Contact::EMailAddress)" size="40" maxlength="90" styleClass="txtbox" styleId="contactEmail"/>
								<html:hidden property="answer(Object::UserDetail::email)" styleClass="txtbox" styleId="userEmail"/></td>
							</tr>
							
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">
								<tr><td>&nbsp;</td></tr>
								
								<tr><td colspan="3" align="left" ><h3>BRANCH INFORMATION</h3></td></tr>
								
								<tr><td>&nbsp;</td></tr>
								
								<tr>
									<td class="field" align="right" width="35%">Branch Name*</td>
									<td width="2%">&nbsp;</td>
									<td class="links" style="Class:txtbox" width="63%" align="left">&nbsp;
										<html:select property="answer(Object::Agency::BranchName)" styleClass="txtbox" styleId="BranchName">
											<html:option value ="">Select</html:option>
											<html:option value ="Toronto">Toronto</html:option>
											<html:option value ="Calgary">Calgary</html:option>							
											<html:option value ="Puerto Rico">Puerto Rico</html:option>
											<html:option value ="Boston">Boston</html:option>
											<html:option value ="Miami">Miami</html:option>
											<html:option value ="New York">New York</html:option>
											<html:option value ="San Francisco">San Francisco</html:option>
											<html:option value ="Denver">Denver</html:option>
                                            <html:option value ="Los Angeles">Los Angeles</html:option>	
											<html:option value ="Houston">Houston</html:option>		
											<html:option value ="Chicago">Chicago</html:option>											
										</html:select>
									</td>
								</tr> 
							</dmshtml:dms_static_with_connector>
							<tr>
								<td>&nbsp;</td>
							</tr>			
							<tr>
								<td align="left" colspan="3"><h3>REMARKS/COMMENTS</h3></td>
							</tr>
							<tr>
								<td height="8px"></td>
							</tr>
							<tr>
								<td class="field" align="right" width="35%">Remarks/Comments</td>
								<td width="2%">&nbsp;</td>
								<td width="63%" align="left"><dmshtml:dms_textarea property="answer(Object::AgencyAdditional::comments)" rows="3" cols="30"/></td>
							</tr>
							<tr>
								<td height="8px"></td>
							</tr>
							<tr>
								<td align="left" colspan="3"><h3>USER ACCOUNT</h3></td>
							</tr>
							<tr>
								<td height="8px"></td>
							</tr>
			
							<tr>
								<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.username" /></td>
								<td width="2%">&nbsp;</td>
								<td class="FormLabels" width="63%" align="left">
									<html:text property="answer(Object::UserDetail::userName)" size="15" maxlength="15" styleClass="txtbox"/>
								</td>
							</tr>
							<tr>
									<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.password" /></td>
									<td width="2%">&nbsp;</td>
									<td class="FormLabels" width="63%" align="left">
										<input id="password" type="password" name="answer(Object::UserDetail::passWord)" maxlength="15" size="15" class="txtbox" autocomplete="off">
									</td>
							</tr>
							<tr>
									<td class="field" align="right" width="35%"><bean:message key="GeneralAgency.confirmpassword" /></td>
									<td width="2%">&nbsp;</td>
								<td class="FormLabels" width="63%" align="left">
									<input id="confirmPassword" type="password" name="answer(Object::UserDetail::passWordConfirm)" maxlength="15" size="15" class="txtbox" autocomplete="off">
								</td>
							</tr>
					</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>	
	
	<tr>
		<td colspan="2">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td align="right" width="40%">
			<html:button value="Save" property="answer(submit)" styleClass="covbutton" onclick="return validateFields()"/>
	    </td>
	    <td align="left" width="60%">
	    <html:reset value="Reset" styleClass="covbutton"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			&nbsp;
		</td>
	</tr>
</table>
		
<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>
<html:hidden property="answer(Object::UserDetail::roleName)" value=""/>
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 
<html:hidden property="answer(Object::AgencyAdditional::AgencyCommissionType)" value="%" /> 

<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="" />
	<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="" />
	 <html:hidden property="page" value="6" />

<html:hidden property="answer(Object::Agency::SiteId)" value="1"  />
<html:hidden property="answer(Object::Agency::ObjectType)" value="AGENCY"   />
		
 <html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=""+ownerId %>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::OwnerId)" value="<%=""+ownerId %>" />
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Entity::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Entity::User)" value="<%=userName.toString()%>" />

<html:hidden property="answer(Object::Agency::OwnerId)" value="<%=""+ownerId %>" />

<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::UserDetail::User)" value="<%=userName.toString()%>" />
 <html:hidden  property="answer(rule_execution_staus)" value=""/>
    <html:hidden property="formName" value="Agency::AddAgency" />

    <html:hidden property="answer(form::ForwordControl)" value="success"/>

<!-- Code to Prevent the back Button Issue-->
	

<bean:define id="AgencyId" name="AddAgency" property="answer(Object::Agency::AgencyId)"/> 
<%if(! AgencyId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=AgencyId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::AgencyId)" value="-1"  />
<%}%>

<bean:define id="ParAgencyId" name="AddAgency" property="answer(Object::Agency::ParentAgencyId)"/> 
<%if(! ParAgencyId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::ParentAgencyId)" value="<%=ParAgencyId.toString()%>"  />
<%} %>

<!-- Passing Agency Address ID -->
<bean:define id="AgencyPrimaryAddressId" name="AddAgency" property="answer(Object::Agency::PrimaryAddressId)"/> 

<%if(AgencyPrimaryAddressId==null) {%>
<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="0"  />
<%} else if(! AgencyPrimaryAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="<%=AgencyPrimaryAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::PrimaryAddressId)" value="0"  />
<%}%>
<!-- Passing Agency BUSINESS Address ID -->
<bean:define id="AgencyBusinessAddressId" name="AddAgency" property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)"/> 

<%if(AgencyBusinessAddressId==null) {%>
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
<%} else if(! AgencyBusinessAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="<%=AgencyBusinessAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
<%}%>

<!-- Passing Agency HOME Address ID -->
<bean:define id="AgencyHomeAddressId" name="AddAgency" property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)"/> 

<%if(AgencyHomeAddressId==null) {%>
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="0"  />
<%} else if(! AgencyHomeAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="<%=AgencyHomeAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::Addresses::HOME::Object::Address::AddressId)" value="0"  />
<%}%>



<!-- Passing Primary Agency Contact ID -->
<bean:define id="AgencyPrimaryContactId" name="AddAgency" property="answer(Object::Agency::PrimaryContactId)"/> 

<%if(AgencyPrimaryContactId==null) {%>
<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="0"  />
<%} else if(! AgencyPrimaryContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="<%=AgencyPrimaryContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::PrimaryContactId)" value="0"  />
<%}%>

<!-- Passing BUSINESS Agency Contact ID -->
<bean:define id="AgencyBusSinessContactId" name="AddAgency" property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)"/> 

<%if(AgencyBusSinessContactId==null) {%>
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
<%} else if(! AgencyBusSinessContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="<%=AgencyBusSinessContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
<%}%>
<!-- Passing HOME Agency Contact ID -->
<bean:define id="AgencyHomeContactId" name="AddAgency" property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)"/> 

<%if(AgencyHomeContactId==null) {%>
<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
<%} else if(! AgencyHomeContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="<%=AgencyHomeContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Agency::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
<%}%>
<html:hidden property="answer(Object::Agency::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Agency::Active)" value="Y" />
<html:hidden property="answer(Object::Agency::Addresses::BUSINESS::Object::Address::County)"  styleId="County"/>
<html:hidden property="answer(Object::AgencyAdditional::Dcco1)" value=""/>
<html:hidden property="answer(Object::AgencyAdditional::Dcco2)" value=""/>
<html:hidden property="answer(Object::AgencyAdditional::Dcco3)" value=""/>
<html:hidden property="answer(Object::AgencyAdditional::BRPrioity1)" value=""/>
<html:hidden property="answer(Object::AgencyAdditional::BRPrioity2)" value=""/>
<html:hidden property="answer(Object::AgencyAdditional::BRPrioity3)" value=""/>
<html:hidden property="answer(Object::AgencyAdditional::BRPrioity4)" value=""/>
<html:hidden property="answer(Object::AgencyAdditional::BRPrioity5)" value=""/>
<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userName.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userName.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Agency"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Agency Management"%>"/>
	<html:hidden property="answer(status)" value="Y" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</div></div>
</html:form>

