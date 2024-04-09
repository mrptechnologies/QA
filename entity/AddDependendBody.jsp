<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddDependent.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>


<html:form action="/AddEmployeeDependent.do" onsubmit="return validateFields();">

	<html:hidden property="answer(dbname)"	value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		
		<tr><td>&nbsp;</td>
		</tr>
		
		<logic:present name="staleDataSubmissionMsg" scope="request">
			<tr>
				<td class="Error"><bean:message key="error.staleDataSubmissionMsg" /></td>
			</tr>
		</logic:present>
		<bean:parameter id="EmployyeId" name="answer(Object::Employee::employeeId)" />
		<tr>
			<td>
				<jsp:include page="../common/CustomerAgencyEmployeeLinkspage.jsp">
					<jsp:param name="answer(Object::Dependent::EmployeeId)" value="<%=EmployyeId %>" />
				</jsp:include>
			</td>
		</tr>

		<tr>
			<td valign="top" align="left">
				<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr><td height="5"></td>
					</tr>
					<tr>
						<td class="NewSectionHead" align="center">ADD/EDIT DEPENDENT</td>
					</tr>
					<tr><td height="5"></td>
					</tr>
					<tr><td>&nbsp;</td>
					</tr>
					<tr><td class="links"></td>
					</tr>
					<%
						boolean errorOccured=false;
					%>
					<bean:define id="ansmap" name="AddDependent" property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
					<logic:iterate id="element" name="ansmap">
						<bean:define id="errorListkey" name="element" property="key" />
						<logic:equal name="errorListkey" value="Object::error::list">
							<bean:define id="errorListvalue" name="element" property="value" />
							<logic:iterate id="errmsg" name="errorListvalue">
								<tr>
									<td class="Error">
										<bean:write name="errmsg" property="errorMessage" />
										<%
								    		errorOccured	=true;
										%>
									</td>
								</tr>
							</logic:iterate>
						</logic:equal>
					</logic:iterate>
					<%
					if(errorOccured)
					{
						((com.dms.ejb.data.QuestionHashMap)ansmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
					}
					%>
					
					<tr><td>&nbsp;</td>
					</tr>
					
					<tr>
						<td>
							<table width="90%" align="center" border="0" CELLSPACING="0" CELLPADDING="0" class="boxed">
								<tr>
									<td align="left" class="FormLabels" height="25">
										Relationship*
									</td>
									<td class="TextMatter">
										<bean:define id="relation" name="AddDependent"	property="answer(Object::Dependent::relationShip)" />
										<%
									        boolean relationshipReadOnly = false;
									        if(relation!=null && !relation.toString().equals("") && !errorOccured) {
										relationshipReadOnly = true;
						       				}
						        			%>
									        <html:radio styleId="relationSpouse" name="AddDependent" property="answer(Object::Dependent::relationShip)" value="Sp" disabled="<%=relationshipReadOnly %>">
											Spouse
										</html:radio> &nbsp;&nbsp;&nbsp; 
										<html:radio styleId="relationChild"	name="AddDependent"	property="answer(Object::Dependent::relationShip)" value="Ch" disabled="<%=relationshipReadOnly %>">
											Child
										</html:radio>
										<logic:notEmpty name="AddDependent" property="answer(Object::Dependent::relationShip)">
										<html:hidden name="AddDependent" property="answer(Object::Dependent::relationShip)" />
										</logic:notEmpty>
									</td>
								</tr>
								
								<tr>
									<td colspan="2">
										<table border="0" width="100%" cellpadding="0">
											<tr>
												<td class="FormLabels" align="left" height="25" width="25%">
													<bean:message key="EmployeeDetails.FirstName" /></td>
												
												
												<td class="links" width="20%">
													<dmshtml:dms_text name="AddDependent" property="answer(Object::Dependent::fname)" size="15"	maxlength="15" styleClass="txtbox" styleId="fname" /></td>
												
												
												<td class="FormLabels" align="left" height="25" width="20%">Prefix	</td>
											
												
												<td class="links" width="35%">
													<dmshtml:dms_text name="AddDependent" property="answer(Object::Dependent::prefix)" size="4"	maxlength="3" styleClass="txtbox" styleId="prefix" /></td>
											</tr>
											<tr>
												<td class="FormLabels" align="left" height="25">
													Middle Initial</td>
												<td class="links" align="left" colspan="3">
													<dmshtml:dms_text name="AddDependent" property="answer(Object::Dependent::mname)" size="1" maxlength="1" styleClass="txtbox" styleId="mname" /></td>
											</tr>
											<tr>
												<td class="FormLabels" align="left" height="25" width="25%">
													<bean:message key="EmployeeDetails.LastName" /></td>
													
												<td class="links" width="20%">
													<dmshtml:dms_text
														name="AddDependent"
														property="answer(Object::Dependent::lname)" size="15"	
														maxlength="15" styleClass="txtbox" styleId="lname" /></td>
														
												<td class="FormLabels" align="left" height="25" width="20%">Suffix</td>
												
												<td class="links" width="35%"><dmshtml:dms_text
													name="AddDependent"
													property="answer(Object::Dependent::suffix)" size="4"
													maxlength="2" styleClass="txtbox" styleId="suffix" /></td>
											</tr>
										</table>
									</td>
								</tr>
								<bean:define id="Dob" name="AddDependent" property="answer(Object::Dependent::dob)" />

								<%
									String strDate=Dob.toString();
									String yyyy="";
									String dd="";
									String mm="";
									if((!strDate.equals(""))&& strDate.length()==10)
									{
								  		mm= strDate.substring(0,2);
										dd= strDate.substring(3,5);
										yyyy= strDate.substring(6,10);
									}
								%>
								
								<tr>
									<td width="25%" class="FormLabels" align="left" height="25"><bean:message key="EmployeeDetails.DateOfBirth" /></td>

									<td class="links">
							
										<dmshtml:dms_text name="AddDependent"
											property="answer(Month)" size="2" maxlength="2"
											styleClass="txtbox" styleId="depMM" value="<%=mm%>"
											onkeyup="if(this.value.length==2) {document.forms[0].depDD.focus()}" />/mm&nbsp;
			
										<dmshtml:dms_text name="AddDependent" property="answer(Date)"
											size="2" maxlength="2" styleClass="txtbox" styleId="depDD"
											value="<%=dd%>"
											onkeyup="if(this.value.length==2) {document.forms[0].depYY.focus()}" />/dd&nbsp;
			
										<dmshtml:dms_text name="AddDependent" property="answer(Year)"
											size="4" maxlength="4" styleClass="txtbox" styleId="depYY"
											value="<%=yyyy%>" />/yyyy
									</td>
								</tr>
		
								<tr>
									<td width="25%" class="FormLabels" align="left" height="25">Age*</td>
									<td class="links">									
										<dmshtml:dms_text name="AddDependent"
											property="answer(Object::Dependent::Age)" size="3" maxlength="2"
											styleClass="txtbox" styleId="Age"/></td>
								</tr>
								<tr>
									<td align="left" class="FormLabels" height="25"><bean:message key="EmployeeDetails.Gender" />*</td>
									<td class="TextMatter">
										<dmshtml:dms_radio
											name="AddDependent" property="answer(Object::Dependent::gender)"
											styleId="genderMale" value="M">
											<bean:message key="EmployeeDetails.Male" />
										</dmshtml:dms_radio> &nbsp;&nbsp;&nbsp; 
										<dmshtml:dms_radio name="AddDependent"
											property="answer(Object::Dependent::gender)"
											styleId="genderFemale" value="F">
											<bean:message key="EmployeeDetails.Female" />
										</dmshtml:dms_radio>
									</td>
								</tr>
						<!-- Added-->
								<tr>
									<td align="left" class="FormLabels" height="25">Student</td>
									<td class="TextMatter">
										<dmshtml:dms_radio
											name="AddDependent"
											property="answer(Object::Dependent::isStudent)"
											styleId="isStudentY" value="Y">
											Yes
											</dmshtml:dms_radio> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<dmshtml:dms_radio
											name="AddDependent"
											property="answer(Object::Dependent::isStudent)"
											styleId="isStudentN" value="N">
											No
											</dmshtml:dms_radio></td>
								</tr>
								<tr>
									<td align="left" class="FormLabels" height="25">Smoker</td>
									<td class="TextMatter">
										<dmshtml:dms_radio name="AddDependent"
											property="answer(Object::Dependent::isSmoker)" value="Y"
											styleId="isSmokerY" > Yes </dmshtml:dms_radio> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<dmshtml:dms_radio
											name="AddDependent"
											property="answer(Object::Dependent::isSmoker)" value="N"
											styleId="isSmokerN" > No </dmshtml:dms_radio></td>
								</tr>
								<bean:define id="Empcobra" name="AddEntity"
									property="answer(Object::Employee::cobra)" />
								<% 
									boolean readOnly = true;
									if(Empcobra.toString().equals("Y")) {
									    readOnly=false;
									} else {
									    readOnly=true;
									
								}%>
								
								<tr>
									<td align="left" class="FormLabels" height="25">COBRA</td>
									<td class="TextMatter">
										<dmshtml:dms_radio name="AddDependent"
											property="answer(Object::Dependent::electedCobra)" value="Y"
											disabled="<%=readOnly %>" styleId="COBRAOpted1" > Yes </dmshtml:dms_radio>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
										<dmshtml:dms_radio name="AddDependent"
											property="answer(Object::Dependent::electedCobra)" value="N"
											disabled="<%=readOnly %>" styleId="COBRAOpted2" > No </dmshtml:dms_radio></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="25"></td>
					</tr>
					
					<tr>
						<td>
							<table width="90%" align="center" border="0" CELLSPACING="0" CELLPADDING="0" class="boxed">
								<tr>
									<td class="sectionhead" align="center" colspan="2">Enrollment Information</td>
								</tr>
								<tr>
									<td align="left" class="FormLabels" height="25">Student	Verify Date</td>
									
									<td class="TextMatter">
										<html:text
											styleId="studentVerifyDateMM" name="AddDependent"
											property="answer(studentVerifyDateMM)" size="2" maxlength="2"
											styleClass="txtbox"
											onkeyup="if(this.value.length==2) {document.forms[0].studentVerifyDateDD.focus()}" />
										/mm&nbsp; 
										<html:text styleId="studentVerifyDateDD"
											name="AddDependent" property="answer(studentVerifyDateDD)"
											size="2" maxlength="2" styleClass="txtbox"
											onkeyup="if(this.value.length==2) {document.forms[0].studentVerifyDateYY.focus()}" />/dd&nbsp;
										<html:text styleId="studentVerifyDateYY" name="AddDependent"
											property="answer(studentVerifyDateYY)" size="4" maxlength="4"
											styleClass="txtbox" />/yyyy<!-- /td -->
										<html:hidden styleId="studentVerifyDate" name="AddDependent"
											property="answer(Object::Dependent::studentVerifyDate)" />
									</td>
								</tr>
								
								<tr>
									<td align="left" class="FormLabels" height="25">Termination	Date</td>
									<td class="TextMatter">
										<html:text
											styleId="terminationDateMM" name="AddDependent"
											property="answer(terminationDateMM)" size="2" maxlength="2"
											styleClass="txtbox"
											onkeyup="if(this.value.length==2) {document.forms[0].terminationDateDD.focus()}" />
										/mm&nbsp; 
										<html:text styleId="terminationDateDD"
											name="AddDependent" property="answer(terminationDateDD)"
											size="2" maxlength="2" styleClass="txtbox"
											onkeyup="if(this.value.length==2) {document.forms[0].terminationDateYY.focus()}" />/dd&nbsp;
										<html:text styleId="terminationDateYY" name="AddDependent"
											property="answer(terminationYY)" size="4" maxlength="4"
											styleClass="txtbox" />/yyyy<!-- /td -->
										<html:hidden styleId="terminationDate" name="AddDependent"
											property="answer(Object::Dependent::terminationDate)" />
									</td>
								</tr>
								
								<tr>
									<td align="left" class="FormLabels" height="25">Plan Effective Date</td>
									<td class="TextMatter">
										<html:text
											styleId="planEffectiveDateMM" name="AddDependent"
											property="answer(planEffectiveDateMM)" size="2" maxlength="2"
											styleClass="txtbox"
											onkeyup="if(this.value.length==2) {document.forms[0].planEffectiveDateDD.focus()}" />
										/mm&nbsp; 
										<html:text styleId="planEffectiveDateDD"
											name="AddDependent" property="answer(planEffectiveDateDD)"
											size="2" maxlength="2" styleClass="txtbox"
											onkeyup="if(this.value.length==2) {document.forms[0].planEffectiveDateYY.focus()}" />/dd&nbsp;
										<html:text styleId="planEffectiveDateYY" name="AddDependent"
											property="answer(planEffectiveDateYY)" size="4" maxlength="4"
											styleClass="txtbox" />/yyyy<!-- /td -->
										<html:hidden styleId="planEffectiveDate" name="AddDependent"
											property="answer(Object::Dependent::planEffectiveDate)" />
									</td>
								</tr>
								
								<tr>
									<td align="left" class="FormLabels" height="25">Effective Date</td>
									<td class="TextMatter">
									<html:text styleId="effectiveDateMM"
										name="AddDependent" property="answer(effectiveDateMM)" size="2"
										maxlength="2" styleClass="txtbox"
										onkeyup="if(this.value.length==2) {document.forms[0].effectiveDateDD.focus()}" />
									/mm&nbsp; 
									<html:text styleId="effectiveDateDD"
										name="AddDependent" property="answer(effectiveDateDD)" size="2"
										maxlength="2" styleClass="txtbox"
										onkeyup="if(this.value.length==2) {document.forms[0].effectiveDateYY.focus()}" />/dd&nbsp;
									<html:text styleId="effectiveDateYY" name="AddDependent"
										property="answer(effectiveDateYY)" size="4" maxlength="4"
										styleClass="txtbox" />/yyyy<!-- /td -->
									<html:hidden styleId="effectiveDate" name="AddDependent"
										property="answer(Object::Dependent::effectiveDate)" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
					
					<tr><td>&nbsp;</td>
					</tr>
					
					<tr>
						<td>
							<table width="90%" align="center" border="0" CELLSPACING="0" CELLPADDING="0" class="boxed">
								<tr>
									<td class="sectionhead" align="center" colspan="2">Pre-existing Conditions</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left" height="25">Status</td>
									<td class="links">
										<html:select name="AddDependent"
											property="answer(Object::Dependent::priorConditionStatus)"
											styleId="priorConditionStatus" styleClass="txtbox">
											<html:option value='N'>N</html:option>
											<html:option value='2'>2</html:option>
											<html:option value='3'>3</html:option>
											<html:option value='7'>7</html:option>
										</html:select></td>
								</tr>
	
								<bean:define id="ExpirationDate" name="AddDependent" property="answer(Object::Dependent::expirationDate)" />
								<%
									String StrExpirationDate=ExpirationDate.toString();
									String ExpirationDateyyyy="";
									String ExpirationDatedd="";
									String ExpirationDatemm="";
									if((!StrExpirationDate.equals(""))&&StrExpirationDate.length()==10)
									{
									ExpirationDatemm= StrExpirationDate.substring(0,2);
									ExpirationDatedd= StrExpirationDate.substring(3,5);
									ExpirationDateyyyy= StrExpirationDate.substring(6,10);
								}%>
								<tr>
									<td width="25%" class="FormLabels" align="left" height="25">Expiration	Date</td>
									<td class="TextMatter">
									<html:text styleId="ExpirationDatemm"
										name="AddDependent" property="answer(ExpirationDatemm)" size="2"
										maxlength="2" styleClass="txtbox" value="<%=ExpirationDatemm%>"
										onkeyup="if(this.value.length==2) {document.forms[0].ExpirationDatedd.focus()}" />
									/mm&nbsp; 
									<html:text styleId="ExpirationDatedd"
										name="AddDependent" property="answer(ExpirationDatedd)" size="2"
										maxlength="2" styleClass="txtbox" value="<%=ExpirationDatedd%>"
										onkeyup="if(this.value.length==2) {document.forms[0].ExpirationDateyy.focus()}" />/dd&nbsp;
									<html:text styleId="ExpirationDateyy" name="AddDependent"
										property="answer(ExpirationDateyy)" size="4" maxlength="4"
										styleClass="txtbox" value="<%=ExpirationDateyyyy%>" />/yyyy</td>
								</tr>
							</table>
						</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="center">
							<html:submit value="Save"
								property="amswer(button)" styleClass="sbttn"/>&nbsp;&nbsp; 
							<html:reset
								value="Reset" styleClass="sbttn" /> &nbsp;&nbsp;
							<dmshtml:dms_button
								value="Back" property="answer(back)" styleClass="sbttn"
								onclick="javascript:history.go(-1);" />
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				
					<tr>
						<td>
							<html:hidden property="answer(Object::Dependent::expirationDate)" styleId="ExpirationDate" value="" />
							<input type="hidden" name="orderBy"	value="DMS_DEPENDENT.LNAME, DMS_DEPENDENT.DMS_DEPENDENT_ID" />
							<html:hidden property="answer(Object::Dependent::EmployeeId)" value="<%=EmployyeId.toString()%>" />
							<bean:define id="userName"	property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
							<html:hidden property="answer(Object::Dependent::createdBy)" value="<%=userName.toString()%>" />
							<html:hidden property="answer(Object::Dependent::updatedBy)" value="<%=userName.toString()%>" />
							<html:hidden property="formName" value="form::ADDDEPENDENT" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
							<bean:define id="DependentId" name="AddDependent" property="answer(Object::Dependent::DependentId)" scope="session" />
						
							<%if(! DependentId.toString().equals("")) {%>
								<html:hidden property="answer(Object::Dependent::DependentId)" value="<%=DependentId.toString()%>" />
							<%} %>
							<logic:present name="agencyDetail2" scope="request">
								<bean:define id="agdetail2" name="agencyDetail2" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request" />
								<bean:define id="id" name="agdetail2" property="id" />
								<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=id.toString()%>" />
							</logic:present>

							<logic:present name="AddCustomer" scope="session">
								<bean:define id="custId" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session" />
								<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=custId.toString()%>" />
								<%if(request.getParameter("answer(Object::Employee::Name)")!=null) { %>
									<bean:parameter id="empName" name="answer(Object::Employee::Name)" />
									<html:hidden property="answer(Object::Employee::Name)"
										value="<%=empName %>" />
								<%} else { %>
									<html:hidden property="answer(Object::Employee::Name)" />
								<%} %>
								<html:hidden property="answer(Object::Employee::employeeId)" value="<%=EmployyeId.toString()%>" />
							</logic:present>
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
							<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
							<%
								String newDependent = request.getParameter("newDependent");
								if(newDependent!=null)
								{
									if(newDependent.equalsIgnoreCase("yes"))
									{
							%>
							<html:hidden property="answer(newDependent)" value="yes" />
							<html:hidden property="newDependent" value="yes" />
							<%
								} else 
								{
							%>
							<html:hidden property="answer(newDependent)" value="no" />
							<html:hidden property="newDependent" value="no" />
							<%
								}
							}
								
							%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</html:form>
